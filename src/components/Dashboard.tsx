import React, { useState, useEffect } from 'react'
import { useTranslation } from 'react-i18next'
import { motion, AnimatePresence } from 'framer-motion'
import { 
  FileText, Search, Upload, LogOut, Filter, Calendar, DollarSign, Hash, X, Menu, 
  Crown, Settings, Globe, CheckCircle, AlertCircle, Bell, BellRing, Zap, TrendingUp,
  Clock, AlertTriangle, ChevronRight, Star, Shield, Sparkles
} from 'lucide-react'
import { useAuth } from '../hooks/useAuth'
import { useSubscription } from '../hooks/useSubscription'
import { useStripe } from '../hooks/useStripe'
import { useNotifications } from '../hooks/useNotifications'
import { FileUpload } from './FileUpload'
import { UpgradeModal } from './UpgradeModal'
import { PricingSection } from './PricingSection'
import { DocumentList } from './DocumentList'
import { supabase, Document } from '../lib/supabase'
import { format } from 'date-fns'

export function Dashboard() {
  const { t, i18n } = useTranslation()
  const { user, signOut } = useAuth()
  const { subscription, loading: subLoading, documentsCount, currentPlan, canUploadDocument, refetch } = useSubscription(user)
  const { createCheckoutSession, createPortalSession, loading: stripeLoading } = useStripe()
  const { notifications, unreadCount, markAsRead, markAllAsRead } = useNotifications(user)
  const [documents, setDocuments] = useState<Document[]>([])
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('all')
  const [showUpload, setShowUpload] = useState(false)
  const [loading, setLoading] = useState(true)
  const [sidebarOpen, setSidebarOpen] = useState(false)
  const [showUpgradeModal, setShowUpgradeModal] = useState(false)
  const [showSuccessMessage, setShowSuccessMessage] = useState(false)
  const [showCancelMessage, setShowCancelMessage] = useState(false)
  const [showNotifications, setShowNotifications] = useState(false)
  const [showPricingSection, setShowPricingSection] = useState(false)

  const toggleLanguage = () => {
    const newLang = i18n.language === 'en' ? 'de' : 'en'
    i18n.changeLanguage(newLang)
  }

  // Check for success/cancel parameters in URL
  useEffect(() => {
    const urlParams = new URLSearchParams(window.location.search)
    if (urlParams.get('success') === 'true') {
      setShowSuccessMessage(true)
      window.history.replaceState({}, document.title, window.location.pathname)
      setTimeout(() => {
        refetch()
      }, 2000)
    }
    if (urlParams.get('canceled') === 'true') {
      setShowCancelMessage(true)
      window.history.replaceState({}, document.title, window.location.pathname)
    }
  }, [refetch])

  const categories = [
    { id: 'all', name: t('dashboard.categories.all'), count: documents.length },
    { id: 'Real Estate', name: t('dashboard.categories.realEstate'), count: documents.filter(d => d.category === 'Real Estate').length },
    { id: 'Banking', name: t('dashboard.categories.banking'), count: documents.filter(d => d.category === 'Banking').length },
    { id: 'Tax', name: t('dashboard.categories.tax'), count: documents.filter(d => d.category === 'Tax').length },
    { id: 'Healthcare', name: t('dashboard.categories.healthcare'), count: documents.filter(d => d.category === 'Healthcare').length },
    { id: 'Legal', name: t('dashboard.categories.legal'), count: documents.filter(d => d.category === 'Legal').length },
    { id: 'Employment', name: t('dashboard.categories.employment'), count: documents.filter(d => d.category === 'Employment').length },
    { id: 'Insurance', name: t('dashboard.categories.insurance'), count: documents.filter(d => d.category === 'Insurance').length },
    { id: 'Education', name: t('dashboard.categories.education'), count: documents.filter(d => d.category === 'Education').length },
    { id: 'Utilities', name: t('dashboard.categories.utilities'), count: documents.filter(d => d.category === 'Utilities').length },
    { id: 'Travel', name: t('dashboard.categories.travel'), count: documents.filter(d => d.category === 'Travel').length },
    { id: 'Other', name: t('dashboard.categories.other'), count: documents.filter(d => d.category === 'Other').length },
  ]

  useEffect(() => {
    if (user) {
      fetchDocuments()
    }
  }, [user])

  const fetchDocuments = async () => {
    if (!user) return

    try {
      const { data, error } = await supabase
        .from('documents')
        .select('*')
        .eq('user_id', user.id)
        .order('created_at', { ascending: false })

      if (error) throw error
      setDocuments(data || [])
    } catch (error) {
      console.error('Error fetching documents:', error)
    } finally {
      setLoading(false)
    }
  }

  const filteredDocuments = documents.filter(doc => {
    const matchesSearch = (doc.title || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
                         (doc.content_preview || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
                         doc.extracted_data.keywords?.some(k => typeof k === 'string' && k.toLowerCase().includes(searchTerm.toLowerCase()))
    
    const matchesCategory = selectedCategory === 'all' || doc.category === selectedCategory
    
    return matchesSearch && matchesCategory
  })

  const upcomingDates = documents
    .flatMap(doc => {
      const allDates = [
        ...(doc.extracted_data.due_dates || []),
        ...(doc.extracted_data.expiry_dates || []),
        ...(doc.extracted_data.payment_dates || []),
        ...(doc.extracted_data.renewal_dates || [])
      ]
      if (doc.due_date) allDates.push(doc.due_date)
      
      return allDates.map(date => ({ date, document: doc }))
    })
    .filter(item => {
      const date = parseISO(item.date)
      return isValid(date) && isAfter(date, new Date())
    })
    .sort((a, b) => new Date(a.date).getTime() - new Date(b.date).getTime())
    .slice(0, 5)

  const getUserDisplayName = () => {
    if (user?.user_metadata?.full_name) {
      return user.user_metadata.full_name
    }
    if (user?.user_metadata?.first_name && user?.user_metadata?.last_name) {
      return `${user.user_metadata.first_name} ${user.user_metadata.last_name}`
    }
    if (user?.user_metadata?.first_name) {
      return user.user_metadata.first_name
    }
    return user?.email?.split('@')[0] || 'User'
  }

  const handleUploadClick = () => {
    if (!canUploadDocument) {
      setShowUpgradeModal(true)
      return
    }
    setShowUpload(true)
  }

  const handlePlanSelect = async (planId: string) => {
    if (planId === 'free') {
      setShowUpgradeModal(false)
      return
    }

    // Check if Stripe is configured
    if (!import.meta.env.VITE_STRIPE_PUBLISHABLE_KEY || 
        import.meta.env.VITE_STRIPE_PUBLISHABLE_KEY === 'your_stripe_publishable_key_here') {
      alert('Payments are not configured yet. Please contact support or try again later.')
      return
    }
    try {
      const priceId = planId === 'pro_monthly' ? 'price_1Ry8ujK2T2pMmvg5hVjD2rgz' : 'price_1Ry8wKK2T2pMmvg5yy0TNryz'
      await createCheckoutSession(priceId, planId)
    } catch (error) {
      console.error('Error creating checkout session:', error)
      if (error.message?.includes('not configured')) {
        alert('Payments are not configured yet. Please contact support.')
      } else {
        alert('Error starting checkout. Please try again.')
      }
    }
  }

  const handleManageSubscription = async () => {
    try {
      await createPortalSession()
    } catch (error) {
      console.error('Error opening customer portal:', error)
      alert('Error opening subscription management. Please try again.')
    }
  }

  const getSubscriptionStatusDisplay = () => {
    if (!subscription) return t('dashboard.plans.free')
    
    switch (subscription.price_id) {
      case 'price_1Ry8ujK2T2pMmvg5hVjD2rgz':
        return t('dashboard.plans.proMonthly')
      case 'price_1Ry8wKK2T2pMmvg5yy0TNryz':
        return t('dashboard.plans.proYearly')
      default:
        return t('dashboard.plans.free')
    }
  }

  const handleSignOut = async () => {
    try {
      await signOut()
      // Navigation will be handled by the App component when user becomes null
    } catch (error) {
      console.error('Error signing out:', error)
    }
  }

  const getDocumentLimitDisplay = () => {
    if (currentPlan.id === 'free') {
      const remaining = Math.max(0, 10 - documentsCount)
      if (remaining <= 2) {
        return (
          <div className="text-center">
            <div className="text-2xl font-bold text-orange-600">{remaining}</div>
            <div className="text-sm text-orange-600">{t('dashboard.documentsRemaining')}</div>
            <button
              onClick={() => setShowUpgradeModal(true)}
              className="mt-2 text-xs text-orange-700 hover:text-orange-900 font-medium underline"
            >
              {t('dashboard.upgradeToPro')} →
            </button>
          </div>
        )
      }
      return (
        <div className="text-center">
          <div className="text-2xl font-bold text-gray-700">{remaining}</div>
          <div className="text-sm text-gray-600">{t('dashboard.documentsLeft')}</div>
        </div>
      )
    }
    
    return (
      <div className="text-center">
        <div className="text-2xl font-bold text-[#29AB87]">∞</div>
        <div className="text-sm text-[#29AB87]">{t('dashboard.unlimited')}</div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-50 via-white to-gray-100">
      {/* Success/Cancel Messages */}
      <AnimatePresence>
        {showSuccessMessage && (
          <motion.div
            initial={{ opacity: 0, y: -50 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -50 }}
            className="fixed top-4 right-4 bg-gradient-to-r from-green-500 to-green-600 text-white px-6 py-4 rounded-2xl shadow-2xl z-50 flex items-center space-x-3"
          >
            <CheckCircle className="w-6 h-6" />
            <span className="font-medium">{t('dashboard.paymentSuccess')}</span>
            <button
              onClick={() => setShowSuccessMessage(false)}
              className="ml-2 text-white hover:text-gray-200 transition-colors"
            >
              <X className="w-5 h-5" />
            </button>
          </motion.div>
        )}

        {showCancelMessage && (
          <motion.div
            initial={{ opacity: 0, y: -50 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -50 }}
            className="fixed top-4 right-4 bg-gradient-to-r from-yellow-500 to-orange-500 text-white px-6 py-4 rounded-2xl shadow-2xl z-50 flex items-center space-x-3"
          >
            <AlertCircle className="w-6 h-6" />
            <span className="font-medium">{t('dashboard.paymentCanceled')}</span>
            <button
              onClick={() => setShowCancelMessage(false)}
              className="ml-2 text-white hover:text-gray-200 transition-colors"
            >
              <X className="w-5 h-5" />
            </button>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Header */}
      <header className="bg-white/80 backdrop-blur-lg border-b border-gray-200/50 px-4 sm:px-6 py-4 sticky top-0 z-40">
        <div className="flex items-center justify-between">
          <div className="flex items-center space-x-4">
            <div className="flex items-center space-x-3">
              <div className="w-10 h-10 bg-gradient-to-r from-[#29AB87] to-[#238f73] rounded-2xl flex items-center justify-center shadow-lg">
                <FileText className="w-6 h-6 text-white" />
              </div>
              <span className="text-2xl font-bold bg-gradient-to-r from-[#29AB87] to-[#238f73] bg-clip-text text-transparent">
                Papierbox
              </span>
            </div>
            
            {/* Mobile menu button */}
            <button
              onClick={() => setSidebarOpen(!sidebarOpen)}
              className="lg:hidden p-2 rounded-xl hover:bg-gray-100 transition-colors"
            >
              <Menu className="w-6 h-6" />
            </button>
            
            {/* Desktop search */}
            <div className="hidden sm:block relative">
              <Search className="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
              <input
                type="text"
                placeholder={t('dashboard.searchPlaceholder')}
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="pl-12 pr-4 py-3 w-64 lg:w-80 border border-gray-200 rounded-2xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] bg-gray-50 focus:bg-white transition-all duration-200"
              />
            </div>
          </div>

          <div className="flex items-center space-x-3">
            {/* Notifications */}
            <div className="relative">
              <button
                onClick={() => setShowNotifications(!showNotifications)}
                className="relative p-3 text-gray-600 hover:text-gray-900 hover:bg-gray-100 rounded-2xl transition-all duration-200"
              >
                {unreadCount > 0 ? (
                  <BellRing className="w-6 h-6 text-[#29AB87]" />
                ) : (
                  <Bell className="w-6 h-6" />
                )}
                {unreadCount > 0 && (
                  <span className="absolute -top-1 -right-1 bg-red-500 text-white text-xs rounded-full w-6 h-6 flex items-center justify-center font-bold">
                    {unreadCount > 9 ? '9+' : unreadCount}
                  </span>
                )}
              </button>

              {/* Notifications Dropdown */}
              <AnimatePresence>
                {showNotifications && (
                  <motion.div
                    initial={{ opacity: 0, y: 10, scale: 0.95 }}
                    animate={{ opacity: 1, y: 0, scale: 1 }}
                    exit={{ opacity: 0, y: 10, scale: 0.95 }}
                    className="absolute right-0 top-full mt-2 w-80 bg-white rounded-2xl shadow-2xl border border-gray-200 z-50"
                  >
                    <div className="p-4 border-b border-gray-100">
                      <div className="flex items-center justify-between">
                        <h3 className="font-semibold text-gray-900">{t('dashboard.notifications.title')}</h3>
                        {unreadCount > 0 && (
                          <button
                            onClick={markAllAsRead}
                            className="text-sm text-[#29AB87] hover:text-[#238f73] font-medium"
                          >
                            {t('dashboard.notifications.markAllRead')}
                          </button>
                        )}
                      </div>
                    </div>
                    
                    <div className="max-h-80 overflow-y-auto">
                      {notifications.length === 0 ? (
                        <div className="p-6 text-center text-gray-500">
                          <Bell className="w-12 h-12 mx-auto mb-3 text-gray-300" />
                          <p>{t('dashboard.notifications.empty')}</p>
                        </div>
                      ) : (
                        notifications.slice(0, 10).map((notification) => (
                          <div
                            key={notification.id}
                            className={`p-4 border-b border-gray-50 hover:bg-gray-50 cursor-pointer transition-colors ${
                              !notification.read ? 'bg-blue-50' : ''
                            }`}
                            onClick={() => markAsRead(notification.id)}
                          >
                            <div className="flex items-start space-x-3">
                              <div className={`w-2 h-2 rounded-full mt-2 ${
                                notification.type === 'urgent' || notification.type === 'overdue' 
                                  ? 'bg-red-500' 
                                  : 'bg-[#29AB87]'
                              }`} />
                              <div className="flex-1 min-w-0">
                                <p className="text-sm text-gray-900 font-medium">
                                  {notification.message}
                                </p>
                                <p className="text-xs text-gray-500 mt-1">
                                  {format(new Date(notification.created_at), 'MMM d, HH:mm')}
                                </p>
                              </div>
                            </div>
                          </div>
                        ))
                      )}
                    </div>
                  </motion.div>
                )}
              </AnimatePresence>
            </div>

            {/* Language Toggle */}
            <button
              onClick={toggleLanguage}
              className="flex items-center space-x-2 text-gray-600 hover:text-gray-900 transition-colors px-4 py-2 rounded-2xl hover:bg-gray-100 border border-gray-200"
              title={t('dashboard.switchLanguage')}
            >
              <Globe className="w-4 h-4" />
              <span className="text-sm font-semibold">{i18n.language.toUpperCase()}</span>
            </button>
            
            <button
              onClick={handleUploadClick}
              className="bg-gradient-to-r from-[#29AB87] to-[#238f73] text-white px-4 sm:px-6 py-3 rounded-2xl font-semibold hover:shadow-lg transform hover:scale-105 transition-all duration-200 flex items-center space-x-2"
            >
              <Upload className="w-5 h-5" />
              <span className="hidden sm:inline">{t('dashboard.upload')}</span>
            </button>
            
            {subscription && subscription.subscription_status === 'active' && (
              <button
                onClick={handleManageSubscription}
                disabled={stripeLoading}
                className="text-gray-600 hover:text-gray-900 p-3 rounded-2xl hover:bg-gray-100 transition-all duration-200"
                title={t('dashboard.manageSubscription')}
              >
                <Settings className="w-6 h-6" />
              </button>
            )}
            
            {/* Pricing Button for Free Users */}
            {currentPlan.id === 'free' && (
              <button
                onClick={() => setShowPricingSection(true)}
                className="bg-gradient-to-r from-orange-500 to-red-500 text-white px-4 py-3 rounded-2xl font-semibold hover:shadow-lg transform hover:scale-105 transition-all duration-200 flex items-center space-x-2"
                title="View Pro Plans"
              >
                <Crown className="w-5 h-5" />
                <span className="hidden sm:inline">Upgrade</span>
              </button>
            )}
            
            <div className="hidden sm:flex items-center space-x-3">
              <div className="text-right">
                <div className="text-sm font-medium text-gray-900">
                  {t('dashboard.welcome')}, {getUserDisplayName()}
                </div>
                <div className="text-xs text-gray-500">
                  {getSubscriptionStatusDisplay()}
                </div>
              </div>
              
              <button
                onClick={handleSignOut}
                className="group relative bg-gradient-to-r from-red-500 to-red-600 text-white p-3 rounded-2xl hover:shadow-lg transform hover:scale-105 transition-all duration-200 overflow-hidden"
                title={t('dashboard.signOut')}
              >
                <div className="absolute inset-0 bg-gradient-to-r from-red-600 to-red-700 opacity-0 group-hover:opacity-100 transition-opacity duration-200"></div>
                <LogOut className="w-5 h-5 relative z-10" />
              </button>
            </div>

            {/* Mobile sign out */}
            <button
              onClick={handleSignOut}
              className="sm:hidden group relative bg-gradient-to-r from-red-500 to-red-600 text-white p-3 rounded-2xl hover:shadow-lg transform hover:scale-105 transition-all duration-200"
            >
              <LogOut className="w-5 h-5" />
            </button>
          </div>
        </div>

        {/* Mobile search */}
        <div className="sm:hidden mt-4">
          <div className="relative">
            <Search className="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
            <input
              type="text"
              placeholder={t('dashboard.searchPlaceholder')}
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-12 pr-4 py-3 w-full border border-gray-200 rounded-2xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] bg-gray-50 focus:bg-white transition-all duration-200"
            />
          </div>
        </div>
      </header>

      <div className="flex">
        {/* Sidebar */}
        <aside className={`${
          sidebarOpen ? 'translate-x-0' : '-translate-x-full'
        } lg:translate-x-0 fixed lg:static inset-y-0 left-0 z-50 w-80 bg-white/90 backdrop-blur-lg border-r border-gray-200/50 transition-transform duration-300 ease-in-out lg:transition-none`}>
          <div className="p-6 h-full overflow-y-auto">
            {/* Mobile close button */}
            <div className="lg:hidden flex justify-between items-center mb-6">
              <h2 className="text-lg font-semibold text-gray-900">{t('dashboard.filters')}</h2>
              <button
                onClick={() => setSidebarOpen(false)}
                className="p-2 rounded-xl hover:bg-gray-100 transition-colors"
              >
                <X className="w-5 h-5" />
              </button>
            </div>

            <div className="space-y-8">
              {/* Categories */}
              <div>
                <h3 className="text-sm font-bold text-gray-900 mb-4 flex items-center">
                  <Filter className="w-5 h-5 mr-2 text-[#29AB87]" />
                  {t('dashboard.categories.title')}
                </h3>
                <div className="space-y-2">
                  {categories.map((category) => (
                    <button
                      key={category.id}
                      onClick={() => {
                        setSelectedCategory(category.id)
                        setSidebarOpen(false)
                      }}
                      className={`w-full flex items-center justify-between px-4 py-3 rounded-xl transition-all duration-200 text-sm font-medium ${
                        selectedCategory === category.id
                          ? 'bg-gradient-to-r from-[#29AB87] to-[#238f73] text-white shadow-lg'
                          : 'text-gray-700 hover:bg-gray-100 hover:shadow-sm'
                      }`}
                    >
                      <span>{category.name}</span>
                      <span className={`text-xs px-2 py-1 rounded-full font-bold ${
                        selectedCategory === category.id
                          ? 'bg-white/20 text-white'
                          : 'bg-gray-200 text-gray-600'
                      }`}>
                        {category.count}
                      </span>
                    </button>
                  ))}
                </div>
              </div>

              {/* Upcoming Dates */}
              {upcomingDates.length > 0 && (
                <div>
                  <h3 className="text-sm font-bold text-gray-900 mb-4 flex items-center">
                    <Calendar className="w-5 h-5 mr-2 text-[#29AB87]" />
                    {t('dashboard.upcomingDates')}
                  </h3>
                  <div className="space-y-3">
                    {upcomingDates.map((item, index) => {
                      const daysUntil = Math.ceil((new Date(item.date).getTime() - new Date().getTime()) / (1000 * 60 * 60 * 24))
                      const isUrgent = daysUntil <= 7
                      
                      return (
                        <div 
                          key={index} 
                          className={`p-4 rounded-xl border-l-4 ${
                            isUrgent 
                              ? 'bg-red-50 border-red-400 border border-red-200' 
                              : 'bg-blue-50 border-blue-400 border border-blue-200'
                          }`}
                        >
                          <div className={`text-sm font-bold ${isUrgent ? 'text-red-800' : 'text-blue-800'}`}>
                            {daysUntil === 0 ? t('dashboard.dueToday') : 
                             daysUntil === 1 ? t('dashboard.dueTomorrow') :
                             `${daysUntil} ${t('dashboard.daysLeft')}`}
                          </div>
                          <div className={`text-xs mt-1 ${isUrgent ? 'text-red-600' : 'text-blue-600'} truncate`}>
                            {item.document.title}
                          </div>
                          <div className="text-xs text-gray-500 mt-1">
                            {format(new Date(item.date), 'MMM d, yyyy')}
                          </div>
                        </div>
                      )
                    })}
                  </div>
                </div>
              )}
            </div>
          </div>
        </aside>

        {/* Overlay for mobile */}
        {sidebarOpen && (
          <div
            className="lg:hidden fixed inset-0 bg-black bg-opacity-50 z-40"
            onClick={() => setSidebarOpen(false)}
          />
        )}

        {/* Main Content */}
        <main className="flex-1 p-6">
          {loading ? (
            <div className="flex items-center justify-center h-64">
              <div className="relative">
                <div className="animate-spin rounded-full h-12 w-12 border-4 border-[#29AB87]/20"></div>
                <div className="animate-spin rounded-full h-12 w-12 border-4 border-[#29AB87] border-t-transparent absolute top-0"></div>
              </div>
            </div>
          ) : (
            <>
              {/* Enhanced Stats Grid */}
              <div className="grid grid-cols-2 lg:grid-cols-5 gap-6 mb-8">
                {/* Smart Document Limit Display */}
                <div className={`bg-white/70 backdrop-blur-sm p-6 rounded-3xl shadow-lg border border-gray-200/50 ${
                  currentPlan.id === 'free' && documentsCount >= 8 ? 'ring-2 ring-orange-300' : ''
                }`}>
                  {getDocumentLimitDisplay()}
                </div>

                <div className="bg-white/70 backdrop-blur-sm p-6 rounded-3xl shadow-lg border border-gray-200/50">
                  <div className="text-center">
                    <div className="w-12 h-12 bg-gradient-to-r from-[#29AB87] to-[#238f73] rounded-2xl flex items-center justify-center mx-auto mb-3">
                      <FileText className="w-6 h-6 text-white" />
                    </div>
                    <div className="text-2xl font-bold text-gray-900">{documents.length}</div>
                    <div className="text-sm text-gray-600">{t('dashboard.documents')}</div>
                  </div>
                </div>

                <div className="bg-white/70 backdrop-blur-sm p-6 rounded-3xl shadow-lg border border-gray-200/50">
                  <div className="text-center">
                    <div className="w-12 h-12 bg-gradient-to-r from-blue-500 to-blue-600 rounded-2xl flex items-center justify-center mx-auto mb-3">
                      <DollarSign className="w-6 h-6 text-white" />
                    </div>
                    <div className="text-2xl font-bold text-gray-900">
                      {documents.reduce((acc, doc) => acc + (doc.extracted_data.amounts?.length || 0), 0)}
                    </div>
                    <div className="text-sm text-gray-600">{t('dashboard.amounts')}</div>
                  </div>
                </div>

                <div className="bg-white/70 backdrop-blur-sm p-6 rounded-3xl shadow-lg border border-gray-200/50">
                  <div className="text-center">
                    <div className="w-12 h-12 bg-gradient-to-r from-purple-500 to-purple-600 rounded-2xl flex items-center justify-center mx-auto mb-3">
                      <Calendar className="w-6 h-6 text-white" />
                    </div>
                    <div className="text-2xl font-bold text-gray-900">{upcomingDates.length}</div>
                    <div className="text-sm text-gray-600">{t('dashboard.upcoming')}</div>
                  </div>
                </div>

                <div className="bg-white/70 backdrop-blur-sm p-6 rounded-3xl shadow-lg border border-gray-200/50">
                  <div className="text-center">
                    <div className="w-12 h-12 bg-gradient-to-r from-orange-500 to-orange-600 rounded-2xl flex items-center justify-center mx-auto mb-3">
                      <Hash className="w-6 h-6 text-white" />
                    </div>
                    <div className="text-2xl font-bold text-gray-900">
                      {new Set(documents.map(d => d.category)).size}
                    </div>
                    <div className="text-sm text-gray-600">{t('dashboard.categories.title')}</div>
                  </div>
                </div>
              </div>

              {/* Documents Section */}
              <div className="bg-white/70 backdrop-blur-sm rounded-3xl shadow-lg border border-gray-200/50">
                <div className="p-6 border-b border-gray-200/50">
                  <div className="flex items-center justify-between">
                    <div>
                      <h2 className="text-xl font-bold text-gray-900">
                        {selectedCategory === 'all' ? t('dashboard.allDocuments') : `${categories.find(c => c.id === selectedCategory)?.name} ${t('dashboard.documents')}`}
                        {searchTerm && ` - "${searchTerm}"`}
                      </h2>
                      <p className="text-sm text-gray-600 mt-1">
                        {filteredDocuments.length} {t('dashboard.documentsFound')}
                      </p>
                    </div>
                    
                    {currentPlan.id !== 'free' && (
                      <div className="flex items-center space-x-2 bg-gradient-to-r from-[#29AB87]/10 to-[#238f73]/10 px-4 py-2 rounded-xl">
                        <Crown className="w-5 h-5 text-[#29AB87]" />
                        <span className="text-sm font-semibold text-[#29AB87]">
                          {t('dashboard.proUser')}
                        </span>
                      </div>
                    )}
                  </div>
                </div>
                
                <DocumentList documents={filteredDocuments} onDocumentDeleted={fetchDocuments} />
              </div>
            </>
          )}
        </main>
      </div>

      {/* Upload Modal */}
      {showUpload && (
        <FileUpload
          onClose={() => setShowUpload(false)}
          onUploadComplete={() => {
            fetchDocuments()
            refetch()
          }}
        />
      )}

      {/* Upgrade Modal */}
      {showUpgradeModal && (
        <UpgradeModal
          onClose={() => setShowUpgradeModal(false)}
          onSelectPlan={handlePlanSelect}
          documentsUsed={documentsCount}
          maxDocuments={currentPlan.limits.documents}
        />
      )}

      {/* Pricing Section Modal */}
      {showPricingSection && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
          <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            className="bg-white rounded-3xl max-w-6xl w-full mx-4 max-h-[90vh] overflow-y-auto"
          >
            <div className="sticky top-0 bg-white border-b border-gray-200 px-6 sm:px-8 py-6 rounded-t-3xl flex items-center justify-between">
              <div>
                <h2 className="text-xl sm:text-2xl font-bold text-gray-900">Choose Your Plan</h2>
                <p className="text-gray-600 text-sm sm:text-base">Upgrade to unlock unlimited documents and AI features</p>
              </div>
              <button
                onClick={() => setShowPricingSection(false)}
                className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
              >
                <X className="w-5 h-5" />
              </button>
            </div>
            <div className="px-6 sm:px-8 pb-8">
              <PricingSection 
                onSelectPlan={handlePlanSelect}
                showTitle={false}
                compact={true}
              />
            </div>
          </motion.div>
        </div>
      )}
      {/* Click outside to close notifications */}
      {showNotifications && (
        <div
          className="fixed inset-0 z-30"
          onClick={() => setShowNotifications(false)}
        />
      )}
    </div>
  )
}