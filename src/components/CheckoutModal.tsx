import React, { useState } from 'react'
import { motion } from 'framer-motion'
import { X, Crown, Tag, Loader2, Mail, CreditCard, Gift, Check } from 'lucide-react'
import { STRIPE_PRODUCTS } from '../stripe-config'

interface CheckoutModalProps {
  planId: 'monthly' | 'yearly'
  onClose: () => void
  onCheckout: (email: string, couponCode?: string) => void
  loading: boolean
}

export function CheckoutModal({ planId, onClose, onCheckout, loading }: CheckoutModalProps) {
  const [email, setEmail] = useState('')
  const [couponCode, setCouponCode] = useState('')
  const [showCouponInput, setShowCouponInput] = useState(false)
  const [emailError, setEmailError] = useState('')

  const currentPlan = planId === 'monthly' ? STRIPE_PRODUCTS.PAPERBOX_PRO_MONTHLY : STRIPE_PRODUCTS.PAPERBOX_PRO_YEARLY

  const validateEmail = (email: string) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    return emailRegex.test(email)
  }

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    setEmailError('')

    if (!validateEmail(email)) {
      setEmailError('Please enter a valid email address')
      return
    }

    onCheckout(email, couponCode || undefined)
  }

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
      <motion.div
        initial={{ opacity: 0, scale: 0.95 }}
        animate={{ opacity: 1, scale: 1 }}
        className="bg-white rounded-3xl max-w-md w-full mx-4"
      >
        {/* Header */}
        <div className="px-6 sm:px-8 pt-6 sm:pt-8 pb-4 border-b border-gray-200">
          <div className="flex items-center justify-between">
            <div className="flex items-center space-x-3">
              <div className="w-10 h-10 bg-gradient-to-r from-[#29AB87] to-[#238f73] rounded-2xl flex items-center justify-center">
                <Crown className="w-5 h-5 text-white" />
              </div>
              <div>
                <h2 className="text-xl font-bold text-gray-900">Upgrade to Pro</h2>
                <p className="text-sm text-gray-600">{currentPlan.name}</p>
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
          {/* Plan Summary */}
          <div className="bg-gradient-to-r from-[#29AB87]/10 to-[#238f73]/10 rounded-2xl p-4 mb-6">
            <div className="flex items-center justify-between mb-3">
              <span className="font-semibold text-gray-900">{currentPlan.name}</span>
              <div className="text-right">
                <div className="text-2xl font-bold text-gray-900">€{currentPlan.price}</div>
                <div className="text-sm text-gray-600">/{planId === 'monthly' ? 'month' : 'year'}</div>
              </div>
            </div>
            
            {planId === 'yearly' && (
              <div className="flex items-center space-x-2 text-green-700 text-sm">
                <Gift className="w-4 h-4" />
                <span className="font-medium">Save €12.88 - 2 months FREE!</span>
              </div>
            )}
            
            <div className="mt-3 space-y-2">
              {currentPlan.features.slice(0, 4).map((feature: string, index: number) => (
                <div key={index} className="flex items-center space-x-2 text-sm text-gray-700">
                  <Check className="w-4 h-4 text-[#29AB87]" />
                  <span>{feature}</span>
                </div>
              ))}
            </div>
          </div>

          {/* Checkout Form */}
          <form onSubmit={handleSubmit} className="space-y-4">
            <div>
              <label htmlFor="checkout-email" className="block text-sm font-semibold text-gray-700 mb-2">
                Email Address
              </label>
              <div className="relative">
                <input
                  type="email"
                  id="checkout-email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  className="w-full px-4 py-3 text-gray-900 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] focus:bg-white transition-all duration-200 placeholder-gray-500 pl-12"
                  placeholder="Enter your email address"
                  required
                />
                <Mail className="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
              </div>
              {emailError && (
                <p className="text-red-600 text-sm mt-1">{emailError}</p>
              )}
            </div>

            {/* Coupon Code Section */}
            <div>
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

            {/* Checkout Button */}
            <button
              type="submit"
              disabled={loading}
              className="w-full py-4 rounded-2xl font-semibold text-base transition-all duration-200 flex items-center justify-center space-x-2 bg-gradient-to-r from-[#29AB87] to-[#238f73] text-white hover:shadow-lg transform hover:scale-105 disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none"
            >
              {loading ? (
                <>
                  <Loader2 className="w-4 h-4 animate-spin" />
                  <span>Processing...</span>
                </>
              ) : (
                <>
                  <CreditCard className="w-4 h-4" />
                  <span>Continue to Payment</span>
                </>
              )}
            </button>

            <p className="text-center text-xs text-gray-500 mt-4">
              Secure payment powered by Stripe • Cancel anytime • 30-day money-back guarantee
            </p>
          </form>
        </div>
      </motion.div>
    </div>
  )
}