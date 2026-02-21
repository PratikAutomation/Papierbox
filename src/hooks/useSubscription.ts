import { useState, useEffect } from 'react'
import { User } from '@supabase/supabase-js'
import { supabase } from '../lib/supabase'
import { PRICING_PLANS } from '../lib/stripe'

export interface UserSubscription {
  id: string
  user_id: string
  plan_id: string
  stripe_customer_id?: string
  stripe_subscription_id?: string
  status: 'active' | 'canceled' | 'past_due' | 'incomplete'
  current_period_start: string
  current_period_end: string
  created_at: string
  updated_at: string
}

interface StripeSubscription {
  customer_id: string
  subscription_id: string | null
  subscription_status: string
  price_id: string | null
  current_period_start: number | null
  current_period_end: number | null
  cancel_at_period_end: boolean
  payment_method_brand: string | null
  payment_method_last4: string | null
}

export function useSubscription(user: User | null) {
  const [subscription, setSubscription] = useState<StripeSubscription | null>(null)
  const [loading, setLoading] = useState(true)
  const [documentsCount, setDocumentsCount] = useState(0)

  useEffect(() => {
    if (user) {
      fetchSubscription()
      fetchDocumentsCount()
    } else {
      setSubscription(null)
      setDocumentsCount(0)
      setLoading(false)
    }
  }, [user])

  const fetchSubscription = async () => {
    if (!user) return

    try {
      // First, get the customer_id for this user
      const { data: customerData, error: customerError } = await supabase
        .from('stripe_customers')
        .select('customer_id')
        .eq('user_id', user.id)
        .maybeSingle()
      if (customerError) {
        throw customerError
      }

      if (!customerData) {
        setSubscription(null)
        return
      }

      // Then get the subscription data using the customer_id
      const { data: subscriptionData, error: subscriptionError } = await supabase
        .from('stripe_subscriptions')
        .select('*')
        .eq('customer_id', customerData.customer_id)
        .maybeSingle()

      if (subscriptionError && subscriptionError.code !== 'PGRST116') {
        throw subscriptionError
      }

      if (subscriptionData) {
        setSubscription({
          customer_id: subscriptionData.customer_id,
          subscription_id: subscriptionData.subscription_id,
          subscription_status: subscriptionData.status,
          price_id: subscriptionData.price_id,
          current_period_start: subscriptionData.current_period_start,
          current_period_end: subscriptionData.current_period_end,
          cancel_at_period_end: subscriptionData.cancel_at_period_end,
          payment_method_brand: subscriptionData.payment_method_brand,
          payment_method_last4: subscriptionData.payment_method_last4
        })
      }
    } catch (error) {
      console.error('Error fetching subscription:', error)
    } finally {
      setLoading(false)
    }
  }

  const fetchDocumentsCount = async () => {
    if (!user) return

    try {
      const { count, error } = await supabase
        .from('documents')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', user.id)

      if (error) throw error
      setDocumentsCount(count || 0)
    } catch (error) {
      console.error('Error fetching documents count:', error)
    }
  }

  const getCurrentPlan = () => {
    if (!subscription || !subscription.price_id) return PRICING_PLANS.FREE
    
    switch (subscription.price_id) {
      case 'price_1RxqWkKGoVx0hUihNX1E84QX':
        return PRICING_PLANS.PRO_MONTHLY
      case 'price_1RxqXVKGoVx0hUihKdOktHHa':
        return PRICING_PLANS.PRO_YEARLY
      default:
        return PRICING_PLANS.FREE
    }
  }

  const canUploadDocument = () => {
    const currentPlan = getCurrentPlan()
    if (currentPlan.limits.documents === -1) return true // unlimited
    return documentsCount < currentPlan.limits.documents
  }

  const updateSubscription = async (planId: string, stripeData?: any) => {
    if (!user) return

    try {
      // This would be handled by the webhook, but we can refresh the data
      await fetchSubscription()
    } catch (error) {
      console.error('Error updating subscription:', error)
      throw error
    }
  }

  return {
    subscription,
    loading,
    documentsCount,
    currentPlan: getCurrentPlan(),
    canUploadDocument: canUploadDocument(),
    updateSubscription,
    refetch: () => {
      fetchSubscription()
      fetchDocumentsCount()
    }
  }
}