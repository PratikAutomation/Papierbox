import { useState, useEffect } from 'react'
import { User } from '@supabase/supabase-js'
import { supabase } from '../lib/supabase'
import { differenceInDays, parseISO, isValid, format, addDays, isBefore, isAfter } from 'date-fns'

export interface Notification {
  id: string
  user_id: string
  document_id: string
  message: string
  type: 'due_date' | 'expiry' | 'payment' | 'renewal' | 'urgent' | 'overdue'
  read: boolean
  created_at: string
  document?: {
    title: string
    category: string
    due_date?: string
  }
}

export function useNotifications(user: User | null) {
  const [notifications, setNotifications] = useState<Notification[]>([])
  const [unreadCount, setUnreadCount] = useState(0)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (user) {
      fetchNotifications()
      generateSmartNotifications()
      
      // Set up real-time subscription for new notifications
      const subscription = supabase
        .channel('notifications')
        .on('postgres_changes', 
          { 
            event: 'INSERT', 
            schema: 'public', 
            table: 'notifications',
            filter: `user_id=eq.${user.id}`
          }, 
          () => {
            fetchNotifications()
          }
        )
        .subscribe()

      return () => {
        subscription.unsubscribe()
      }
    } else {
      setNotifications([])
      setUnreadCount(0)
      setLoading(false)
    }
  }, [user])

  const fetchNotifications = async () => {
    if (!user) return

    try {
      const { data, error } = await supabase
        .from('notifications')
        .select(`
          *,
          documents!inner(title, category, due_date)
        `)
        .eq('user_id', user.id)
        .order('created_at', { ascending: false })
        .limit(100)

      if (error) throw error

      const formattedNotifications = (data || []).map(notification => ({
        ...notification,
        document: notification.documents
      }))

      setNotifications(formattedNotifications)
      setUnreadCount(formattedNotifications.filter(n => !n.read).length)
    } catch (error) {
      console.error('Error fetching notifications:', error)
    } finally {
      setLoading(false)
    }
  }

  const generateSmartNotifications = async () => {
    if (!user) return

    try {
      // Get all documents with extracted dates
      const { data: documents, error } = await supabase
        .from('documents')
        .select('*')
        .eq('user_id', user.id)

      if (error) throw error

      const today = new Date()
      const notificationsToCreate = []

      for (const doc of documents || []) {
        // Process all types of dates from extracted_data
        const allDates = [
          ...(doc.extracted_data?.due_dates || []),
          ...(doc.extracted_data?.expiry_dates || []),
          ...(doc.extracted_data?.payment_dates || []),
          ...(doc.extracted_data?.renewal_dates || []),
          ...(doc.extracted_data?.dates || [])
        ]

        // Also include the main due_date if it exists
        if (doc.due_date) {
          allDates.push(doc.due_date)
        }

        for (const dateStr of allDates) {
          if (!dateStr) continue

          const dueDate = parseISO(dateStr)
          if (!isValid(dueDate)) continue

          const daysUntilDue = differenceInDays(dueDate, today)

          // Check if notification already exists for this document and date
          const { data: existingNotification } = await supabase
            .from('notifications')
            .select('id')
            .eq('user_id', user.id)
            .eq('document_id', doc.id)
            .ilike('message', `%${format(dueDate, 'MMM d, yyyy')}%`)
            .gte('created_at', new Date(Date.now() - 12 * 60 * 60 * 1000).toISOString()) // Last 12 hours
            .maybeSingle()

          if (existingNotification) continue // Skip if notification already sent recently

          let notificationType: 'due_date' | 'expiry' | 'payment' | 'renewal' | 'urgent' | 'overdue' = 'due_date'
          let message = ''
          let priority = 1

          // Determine notification type and message based on urgency and context
          if (daysUntilDue < 0) {
            notificationType = 'overdue'
            priority = 10
            message = `🚨 OVERDUE: "${doc.title}" was due ${Math.abs(daysUntilDue)} day${Math.abs(daysUntilDue) !== 1 ? 's' : ''} ago (${format(dueDate, 'MMM d, yyyy')})`
          } else if (daysUntilDue === 0) {
            notificationType = 'urgent'
            priority = 10
            message = `⚠️ DUE TODAY: "${doc.title}" is due today (${format(dueDate, 'MMM d, yyyy')})`
          } else if (daysUntilDue === 1) {
            notificationType = 'urgent'
            priority = 9
            message = `🔔 DUE TOMORROW: "${doc.title}" is due tomorrow (${format(dueDate, 'MMM d, yyyy')})`
          } else if (daysUntilDue <= 3) {
            notificationType = 'urgent'
            priority = 8
            message = `⏰ URGENT: "${doc.title}" is due in ${daysUntilDue} days (${format(dueDate, 'MMM d, yyyy')})`
          } else if (daysUntilDue <= 7) {
            notificationType = 'due_date'
            priority = 7
            message = `📅 This Week: "${doc.title}" is due in ${daysUntilDue} days (${format(dueDate, 'MMM d, yyyy')})`
          } else if (daysUntilDue <= 14) {
            notificationType = 'due_date'
            priority = 6
            message = `📋 Next 2 Weeks: "${doc.title}" is due in ${daysUntilDue} days (${format(dueDate, 'MMM d, yyyy')})`
          } else if (daysUntilDue <= 30) {
            notificationType = 'due_date'
            priority = 5
            message = `📌 This Month: "${doc.title}" is due in ${daysUntilDue} days (${format(dueDate, 'MMM d, yyyy')})`
          } else if (daysUntilDue <= 60) {
            notificationType = 'due_date'
            priority = 4
            message = `📝 Next 2 Months: "${doc.title}" is due in ${daysUntilDue} days (${format(dueDate, 'MMM d, yyyy')})`
          }

          // Only create notifications for items due within 60 days
          if (daysUntilDue <= 60 && message) {
            notificationsToCreate.push({
              user_id: user.id,
              document_id: doc.id,
              message,
              type: notificationType,
              read: false
            })
          }
        }
      }

      // Bulk insert notifications
      if (notificationsToCreate.length > 0) {
        const { error: insertError } = await supabase
          .from('notifications')
          .insert(notificationsToCreate)

        if (insertError) {
          console.error('Error creating notifications:', insertError)
        } else {
          // Refresh notifications after creating new ones
          fetchNotifications()
        }
      }
    } catch (error) {
      console.error('Error generating smart notifications:', error)
    }
  }

  const markAsRead = async (notificationId: string) => {
    try {
      const { error } = await supabase
        .from('notifications')
        .update({ read: true })
        .eq('id', notificationId)
        .eq('user_id', user?.id)

      if (error) throw error

      setNotifications(prev => 
        prev.map(n => n.id === notificationId ? { ...n, read: true } : n)
      )
      setUnreadCount(prev => Math.max(0, prev - 1))
    } catch (error) {
      console.error('Error marking notification as read:', error)
    }
  }

  const markAllAsRead = async () => {
    try {
      const { error } = await supabase
        .from('notifications')
        .update({ read: true })
        .eq('user_id', user?.id)
        .eq('read', false)

      if (error) throw error

      setNotifications(prev => prev.map(n => ({ ...n, read: true })))
      setUnreadCount(0)
    } catch (error) {
      console.error('Error marking all notifications as read:', error)
    }
  }

  const deleteNotification = async (notificationId: string) => {
    try {
      const { error } = await supabase
        .from('notifications')
        .delete()
        .eq('id', notificationId)
        .eq('user_id', user?.id)

      if (error) throw error

      setNotifications(prev => prev.filter(n => n.id !== notificationId))
      setUnreadCount(prev => {
        const notification = notifications.find(n => n.id === notificationId)
        return notification && !notification.read ? Math.max(0, prev - 1) : prev
      })
    } catch (error) {
      console.error('Error deleting notification:', error)
    }
  }

  return {
    notifications,
    unreadCount,
    loading,
    markAsRead,
    markAllAsRead,
    deleteNotification,
    refresh: fetchNotifications,
    generateNotifications: generateSmartNotifications
  }
}