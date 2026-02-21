import React, { useState } from 'react'
import { useTranslation } from 'react-i18next'
import { motion } from 'framer-motion'
import { Check, Zap, Crown, Gift, ArrowRight, Star, Tag, Loader2 } from 'lucide-react'
import { STRIPE_PRODUCTS } from '../stripe-config'
import { useStripe } from '../hooks/useStripe'

interface PricingSectionProps {
  onSelectPlan?: (planId: string) => void
  onGetStarted?: () => void
  onDirectPurchase?: (planId: string, couponCode?: string) => void
  showTitle?: boolean
  compact?: boolean
}

export function PricingSection({ onSelectPlan, onGetStarted, onDirectPurchase, showTitle = true, compact = false }: PricingSectionProps) {
  const { t } = useTranslation()
  const { createCheckoutSession, loading: stripeLoading } = useStripe()
  const [billingCycle, setBillingCycle] = useState<'monthly' | 'yearly'>('monthly')
  const [processingPlan, setProcessingPlan] = useState<string | null>(null)

  const handlePlanSelect = async (planId: string) => {
    if (planId === 'free') {
      if (onGetStarted) {
        onGetStarted()
      }
      return
    }

    // If we have onSelectPlan, use it (this means we're in dashboard - direct to payment)
    if (onSelectPlan) {
      onSelectPlan(planId)
      return
    }

    // For homepage, redirect to auth page first
    if (onDirectPurchase) {
      onDirectPurchase(planId)
      return
    }
  }

  const currentPlan = billingCycle === 'monthly' ? STRIPE_PRODUCTS.PAPERBOX_PRO_MONTHLY : STRIPE_PRODUCTS.PAPERBOX_PRO_YEARLY

  return (
    <section className={`${compact ? 'py-8' : 'py-12 sm:py-20'} px-4 sm:px-6`}>
      <div className="max-w-7xl mx-auto">
        {showTitle && (
          <div className="text-center mb-8 sm:mb-12">
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              className="space-y-4"
            >
              <h2 className="text-2xl sm:text-3xl lg:text-4xl font-bold text-gray-900">
                {t('pricing.title')}
              </h2>
              <p className="text-base sm:text-lg lg:text-xl text-gray-600 max-w-3xl mx-auto">
                {t('pricing.subtitle')}
              </p>
            </motion.div>
          </div>
        )}

        {/* Billing Toggle */}
        <div className="flex justify-center mb-8 sm:mb-12">
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

        {/* Pricing Cards */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 sm:gap-8 max-w-5xl mx-auto">
          {/* Free Plan */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="relative bg-white rounded-3xl shadow-lg hover:shadow-xl transition-all duration-300 overflow-hidden"
          >
            <div className="p-6 sm:p-8">
              {/* Plan Header */}
              <div className="text-center mb-6 sm:mb-8">
                <div className="flex items-center justify-center mb-4">
                  <div className="w-12 h-12 bg-gray-100 rounded-2xl flex items-center justify-center">
                    <Zap className="w-6 h-6 text-gray-600" />
                  </div>
                </div>
                
                <h3 className="text-xl sm:text-2xl font-bold text-gray-900 mb-2">
                  {t('pricing.free.name')}
                </h3>
                
                <div className="space-y-2">
                  <div className="flex items-baseline justify-center space-x-1">
                    <span className="text-3xl sm:text-4xl lg:text-5xl font-bold text-gray-900">
                      €0
                    </span>
                  </div>
                  <p className="text-sm text-gray-600">
                    {t('pricing.free.subtitle')}
                  </p>
                </div>
              </div>

              {/* Features */}
              <div className="space-y-3 sm:space-y-4 mb-6 sm:mb-8">
                {(t('pricing.free.features', { returnObjects: true }) as string[]).map((feature: string, featureIndex: number) => (
                  <div key={featureIndex} className="flex items-start space-x-3">
                    <div className="flex-shrink-0 w-5 h-5 bg-[#29AB87] rounded-full flex items-center justify-center mt-0.5">
                      <Check className="w-3 h-3 text-white" />
                    </div>
                    <span className="text-gray-700 text-sm sm:text-base leading-relaxed">
                      {feature}
                    </span>
                  </div>
                ))}
              </div>

              {/* CTA Button */}
              <button
                onClick={() => handlePlanSelect('free')}
                className="w-full py-3 sm:py-4 rounded-2xl font-semibold text-sm sm:text-base transition-all duration-200 flex items-center justify-center space-x-2 bg-gradient-to-r from-[#29AB87] to-[#238f73] text-white hover:shadow-lg transform hover:scale-105"
              >
                <span>{t('pricing.free.cta')}</span>
                <ArrowRight className="w-4 h-4" />
              </button>
            </div>
          </motion.div>

          {/* Pro Plan */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6, delay: 0.1 }}
            className="relative bg-white rounded-3xl shadow-lg hover:shadow-xl transition-all duration-300 overflow-hidden ring-2 ring-[#29AB87] scale-105"
          >
            <div className="absolute top-0 left-0 right-0 bg-gradient-to-r from-[#29AB87] to-[#238f73] text-white text-center py-3 font-semibold text-sm">
              <Star className="w-4 h-4 inline mr-2" />
              {t('pricing.mostPopular')}
            </div>

            <div className="p-6 sm:p-8 pt-16">
              {/* Plan Header */}
              <div className="text-center mb-6 sm:mb-8">
                <div className="flex items-center justify-center mb-4">
                  <div className="w-12 h-12 bg-gradient-to-r from-[#29AB87] to-[#238f73] rounded-2xl flex items-center justify-center">
                    <Crown className="w-6 h-6 text-white" />
                  </div>
                </div>
                
                <h3 className="text-xl sm:text-2xl font-bold text-gray-900 mb-2">
                  {t('pricing.pro.name')}
                </h3>
                
                <div className="space-y-2">
                  <div className="flex items-baseline justify-center space-x-1">
                    <span className="text-3xl sm:text-4xl lg:text-5xl font-bold text-gray-900">
                      €{currentPlan.price}
                    </span>
                    <span className="text-gray-600 text-base sm:text-lg">
                      /{billingCycle === 'monthly' ? t('pricing.month') : t('pricing.year')}
                    </span>
                  </div>
                  
                  {billingCycle === 'yearly' && (
                    <div className="flex items-center justify-center space-x-2">
                      <span className="text-gray-500 line-through text-sm">
                        €41.88/year
                      </span>
                      <span className="bg-green-100 text-green-800 text-xs px-2 py-1 rounded-full font-medium">
                        {t('pricing.saveAmount')}
                      </span>
                    </div>
                  )}
                  
                  {billingCycle === 'yearly' && (
                    <div className="flex items-center justify-center text-[#29AB87] text-sm font-medium">
                      <Gift className="w-4 h-4 mr-1" />
                      {t('pricing.twoMonthsFree')}
                    </div>
                  )}
                  
                  <p className="text-sm text-gray-600">
                    {currentPlan.description}
                  </p>
                </div>
              </div>

              {/* Features */}
              <div className="space-y-3 sm:space-y-4 mb-6 sm:mb-8">
                {currentPlan.features.map((feature: string, featureIndex: number) => (
                  <div key={featureIndex} className="flex items-start space-x-3">
                    <div className="flex-shrink-0 w-5 h-5 bg-[#29AB87] rounded-full flex items-center justify-center mt-0.5">
                      <Check className="w-3 h-3 text-white" />
                    </div>
                    <span className="text-gray-700 text-sm sm:text-base leading-relaxed">
                      {feature}
                    </span>
                  </div>
                ))}
              </div>

              {/* CTA Button */}
              <button
                onClick={() => handlePlanSelect(billingCycle)}
                disabled={stripeLoading || processingPlan === billingCycle}
                className="w-full py-3 sm:py-4 rounded-2xl font-semibold text-sm sm:text-base transition-all duration-200 flex items-center justify-center space-x-2 bg-gradient-to-r from-[#29AB87] to-[#238f73] text-white hover:shadow-lg transform hover:scale-105 disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none"
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

              <p className="text-center text-xs sm:text-sm text-gray-500 mt-4">
                {t('pricing.guarantee')}
              </p>
            </div>
          </motion.div>
        </div>

        {/* Trust Indicators */}
        <div className="text-center mt-8 sm:mt-12">
          <div className="flex flex-wrap justify-center items-center gap-4 sm:gap-8 text-sm text-gray-500">
            <div className="flex items-center space-x-2">
              <div className="w-4 h-4 bg-green-500 rounded-full"></div>
              <span>{t('pricing.moneyBack')}</span>
            </div>
            <div className="flex items-center space-x-2">
              <div className="w-4 h-4 bg-blue-500 rounded-full"></div>
              <span>{t('pricing.cancelAnytime')}</span>
            </div>
            <div className="flex items-center space-x-2">
              <div className="w-4 h-4 bg-purple-500 rounded-full"></div>
              <span>{t('pricing.euServers')}</span>
            </div>
          </div>
        </div>
      </div>
    </section>
  )
}