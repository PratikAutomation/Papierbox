import React, { useState } from 'react'
import { motion } from 'framer-motion'
import { X, Crown, Zap, AlertTriangle, Tag, Loader2, Gift, Check, ArrowRight, Star } from 'lucide-react'
import { STRIPE_PRODUCTS } from '../stripe-config'
import { useStripe } from '../hooks/useStripe'
import { useTranslation } from 'react-i18next'

interface UpgradeModalProps {
  onClose: () => void
  onSelectPlan?: (planId: string) => void
  documentsUsed: number
  maxDocuments: number
}

export function UpgradeModal({ onClose, onSelectPlan, documentsUsed, maxDocuments }: UpgradeModalProps) {
  const { t } = useTranslation()
  const { createCheckoutSession, loading: stripeLoading } = useStripe()
  const [billingCycle, setBillingCycle] = useState<'monthly' | 'yearly'>('monthly')
  const [processingPlan, setProcessingPlan] = useState<string | null>(null)

  const handlePlanSelect = async (planId: string) => {
    if (onSelectPlan) {
      onSelectPlan(planId)
      return
    }

    // Handle Stripe checkout
    setProcessingPlan(planId)
    try {
      const priceId = planId === 'monthly' ? STRIPE_PRODUCTS.PAPERBOX_PRO_MONTHLY.priceId : STRIPE_PRODUCTS.PAPERBOX_PRO_YEARLY.priceId
      await createCheckoutSession(priceId, planId)
    } catch (error) {
      console.error('Error creating checkout session:', error)
      alert('Error starting checkout. Please try again.')
    } finally {
      setProcessingPlan(null)
    }
  }

  const currentPlan = billingCycle === 'monthly' ? STRIPE_PRODUCTS.PAPERBOX_PRO_MONTHLY : STRIPE_PRODUCTS.PAPERBOX_PRO_YEARLY

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
      <motion.div
        initial={{ opacity: 0, scale: 0.95 }}
        animate={{ opacity: 1, scale: 1 }}
        className="bg-white rounded-3xl max-w-4xl w-full mx-4 max-h-[90vh] overflow-y-auto"
      >
        {/* Header */}
        <div className="sticky top-0 bg-white border-b border-gray-200 px-6 sm:px-8 py-6 rounded-t-3xl">
          <div className="flex items-center justify-between">
            <div className="flex items-center space-x-4">
              <div className="w-12 h-12 bg-gradient-to-r from-orange-500 to-red-500 rounded-2xl flex items-center justify-center">
                <AlertTriangle className="w-6 h-6 text-white" />
              </div>
              <div>
                <h2 className="text-xl sm:text-2xl font-bold text-gray-900">
                  {t('upgrade.limitReached')}
                </h2>
                <p className="text-gray-600 text-sm sm:text-base">
                  {t('upgrade.documentsUsed', { used: documentsUsed, max: maxDocuments })}
                </p>
              </div>
            </div>
            <button
              onClick={onClose}
              className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
            >
              <X className="w-5 h-5" />
            </button>
          </div>
        </div>

        {/* Content */}
        <div className="px-6 sm:px-8 py-6">
          {/* Upgrade Message */}
          <div className="text-center mb-8">
            <div className="w-20 h-20 bg-gradient-to-r from-[#29AB87] to-[#238f73] rounded-full flex items-center justify-center mx-auto mb-6">
              <Crown className="w-10 h-10 text-white" />
            </div>
            
            <h3 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-4">
              {t('upgrade.readyToPro')} 🚀
            </h3>
            
            <p className="text-base sm:text-lg text-gray-600 max-w-2xl mx-auto leading-relaxed">
              {t('upgrade.description')}
            </p>
          </div>

          {/* Billing Toggle */}
          <div className="flex justify-center mb-8">
            <div className="bg-gray-100 p-1 rounded-2xl flex items-center">
              <button
                onClick={() => setBillingCycle('monthly')}
                className={`px-4 sm:px-6 py-2 sm:py-3 rounded-xl font-medium transition-all duration-200 text-sm sm:text-base ${
                  billingCycle === 'monthly'
                    ? 'bg-white text-gray-900 shadow-sm'
                    : 'text-gray-600 hover:text-gray-900'
                }`}
              >
                {t('pricing.monthly')}
              </button>
              <button
                onClick={() => setBillingCycle('yearly')}
                className={`px-4 sm:px-6 py-2 sm:py-3 rounded-xl font-medium transition-all duration-200 text-sm sm:text-base relative ${
                  billingCycle === 'yearly'
                    ? 'bg-white text-gray-900 shadow-sm'
                    : 'text-gray-600 hover:text-gray-900'
                }`}
              >
                {t('pricing.yearly')}
                <span className="absolute -top-2 -right-2 bg-[#29AB87] text-white text-xs px-2 py-1 rounded-full">
                  {t('pricing.save')}
                </span>
              </button>
            </div>
          </div>

          {/* Pro Plan Card */}
          <div className="max-w-md mx-auto">
            <div className="bg-gradient-to-r from-[#29AB87]/10 to-[#238f73]/10 rounded-3xl p-6 border-2 border-[#29AB87]/20">
              <div className="text-center mb-6">
                <div className="flex items-center justify-center mb-4">
                  <div className="w-16 h-16 bg-gradient-to-r from-[#29AB87] to-[#238f73] rounded-2xl flex items-center justify-center">
                    <Crown className="w-8 h-8 text-white" />
                  </div>
                </div>
                
                <h3 className="text-2xl font-bold text-gray-900 mb-2">
                  {t('pricing.pro.name')}
                </h3>
                
                <div className="space-y-2">
                  <div className="flex items-baseline justify-center space-x-1">
                    <span className="text-4xl font-bold text-gray-900">
                      €{currentPlan.price}
                    </span>
                    <span className="text-gray-600 text-lg">
                      /{billingCycle === 'monthly' ? t('pricing.month') : t('pricing.year')}
                    </span>
                  </div>
                  
                  {billingCycle === 'yearly' && (
                    <>
                      <div className="flex items-center justify-center space-x-2">
                        <span className="text-gray-500 line-through text-sm">
                          €41.88/year
                        </span>
                        <span className="bg-green-100 text-green-800 text-xs px-2 py-1 rounded-full font-medium">
                          {t('pricing.saveAmount')}
                        </span>
                      </div>
                      <div className="flex items-center justify-center text-[#29AB87] text-sm font-medium">
                        <Gift className="w-4 h-4 mr-1" />
                        {t('pricing.twoMonthsFree')}
                      </div>
                    </>
                  )}
                  
                  <p className="text-sm text-gray-600">
                    {currentPlan.description}
                  </p>
                </div>
              </div>

              {/* Key Features */}
              <div className="space-y-3 mb-6">
                {currentPlan.features.slice(0, 6).map((feature: string, featureIndex: number) => (
                  <div key={featureIndex} className="flex items-start space-x-3">
                    <div className="flex-shrink-0 w-5 h-5 bg-[#29AB87] rounded-full flex items-center justify-center mt-0.5">
                      <Check className="w-3 h-3 text-white" />
                    </div>
                    <span className="text-gray-700 text-sm leading-relaxed">
                      {feature}
                    </span>
                  </div>
                ))}
              </div>

              {/* CTA Button */}
              {/* Coupon Code Section */}
              <div className="mb-6">
                <button
                  type="button"
                  onClick={() => setShowCouponInput(!showCouponInput)}
                  className="flex items-center space-x-2 text-[#29AB87] hover:text-[#238f73] font-medium text-sm transition-colors mb-3"
                >
                  <Tag className="w-4 h-4" />
                  <span>Have a coupon code?</span>
                </button>
                
                {showCouponInput && (
                  <motion.div
                    initial={{ opacity: 0, height: 0 }}
                    animate={{ opacity: 1, height: 'auto' }}
                    className="mb-4"
                  >
                    <input
                      type="text"
                      value={couponCode}
                      onChange={(e) => setCouponCode(e.target.value)}
                      placeholder="Enter coupon code"
                      className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] text-sm"
                    />
                  </motion.div>
                )}
              </div>

              <button
                onClick={() => handlePlanSelect(billingCycle)}
                disabled={stripeLoading || processingPlan === billingCycle}
                className="w-full py-4 rounded-2xl font-semibold text-base transition-all duration-200 flex items-center justify-center space-x-2 bg-gradient-to-r from-[#29AB87] to-[#238f73] text-white hover:shadow-lg transform hover:scale-105 disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none"
              >
                {processingPlan === billingCycle ? (
                  <>
                    <Loader2 className="w-4 h-4 animate-spin" />
                    <span>{t('pricing.processing')}</span>
                  </>
                ) : (
                  <>
                    <span>{t('pricing.pro.cta')}</span>
                    <ArrowRight className="w-4 h-4" />
                  </>
                )}
              </button>

              <p className="text-center text-xs text-gray-500 mt-4">
                {t('pricing.guarantee')}
              </p>
            </div>
          </div>

          {/* Benefits Highlight */}
          <div className="bg-gradient-to-r from-[#29AB87]/10 to-[#238f73]/10 rounded-2xl p-6 mt-8">
            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
              <div className="text-center">
                <div className="w-12 h-12 bg-[#29AB87] rounded-xl flex items-center justify-center mx-auto mb-3">
                  <Zap className="w-6 h-6 text-white" />
                </div>
                <h4 className="font-semibold text-gray-900 mb-1">{t('upgrade.unlimitedStorage')}</h4>
                <p className="text-sm text-gray-600">{t('upgrade.neverWorryLimits')}</p>
              </div>
              
              <div className="text-center">
                <div className="w-12 h-12 bg-[#29AB87] rounded-xl flex items-center justify-center mx-auto mb-3">
                  <Crown className="w-6 h-6 text-white" />
                </div>
                <h4 className="font-semibold text-gray-900 mb-1">{t('upgrade.aiOrganization')}</h4>
                <p className="text-sm text-gray-600">{t('upgrade.smartCategorization')}</p>
              </div>
              
              <div className="text-center">
                <div className="w-12 h-12 bg-[#29AB87] rounded-xl flex items-center justify-center mx-auto mb-3">
                  <AlertTriangle className="w-6 h-6 text-white" />
                </div>
                <h4 className="font-semibold text-gray-900 mb-1">{t('upgrade.premiumSupport')}</h4>
                <p className="text-sm text-gray-600">{t('upgrade.priorityHelp')}</p>
              </div>
            </div>
          </div>
        </div>
      </motion.div>
    </div>
  )
}