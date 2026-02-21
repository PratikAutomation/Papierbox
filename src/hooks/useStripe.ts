import { useState } from 'react'
import { stripePromise } from '../lib/stripe'
import { supabase } from '../lib/supabase'
import { useAuth } from './useAuth'

export function useStripe() {
  const [loading, setLoading] = useState(false)
  const { user } = useAuth()

  const createCheckoutSessionDirect = async (priceId: string, planId: string, couponCode?: string, userEmail?: string) => {
    if (!stripePromise) {
      alert('Stripe is not configured. Please add your VITE_STRIPE_PUBLISHABLE_KEY to the .env file.')
      return
    }

    setLoading(true)
    try {
      // For direct payments (without authentication), we need to handle differently
      const response = await fetch(`${import.meta.env.VITE_SUPABASE_URL}/functions/v1/stripe-checkout-direct`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          price_id: priceId,
          mode: 'subscription',
          coupon_code: couponCode,
          user_email: userEmail,
          success_url: `${window.location.origin}/dashboard?success=true`,
          cancel_url: `${window.location.origin}?canceled=true`,
        }),
      })

      if (!response.ok) {
        const errorData = await response.json()
        throw new Error(errorData.error || 'Failed to create checkout session')
      }

      const { sessionId } = await response.json()
      
      // Redirect to Stripe Checkout
      const stripe = await stripePromise
      if (!stripe) throw new Error('Stripe not loaded')

      const { error } = await stripe.redirectToCheckout({ sessionId })
      if (error) throw error

    } catch (error) {
      console.error('Error creating direct checkout session:', error)
      throw error
    } finally {
      setLoading(false)
    }
  }

  const createCheckoutSession = async (priceId: string, planId: string, couponCode?: string) => {
    if (!user) throw new Error('User not authenticated')
    
    if (!stripePromise) {
      throw new Error('Stripe is not configured. Please add your VITE_STRIPE_PUBLISHABLE_KEY to the .env file.')
    }

    setLoading(true)
    try {
      // Get the user's JWT token
      const { data: { session } } = await supabase.auth.getSession()
      if (!session?.access_token) {
        throw new Error('No valid session found')
      }

      // Call your edge function to create checkout session
      const response = await fetch(`${import.meta.env.VITE_SUPABASE_URL}/functions/v1/stripe-checkout`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${session.access_token}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          price_id: priceId,
          mode: 'subscription',
          success_url: `${window.location.origin}/dashboard?success=true`,
          cancel_url: `${window.location.origin}/dashboard?canceled=true`,
        }),
      })

      if (!response.ok) {
        const errorData = await response.json()
        throw new Error(errorData.error || 'Failed to create checkout session')
      }

      const { sessionId } = await response.json()
      
      // Redirect to Stripe Checkout
      const stripe = await stripePromise
      if (!stripe) throw new Error('Stripe not loaded')

      const { error } = await stripe.redirectToCheckout({ sessionId })
      if (error) throw error

    } catch (error) {
      console.error('Error creating checkout session:', error)
      throw error
    } finally {
      setLoading(false)
    }
  }

  const createPortalSession = async () => {
    if (!user) throw new Error('User not authenticated')

    setLoading(true)
    try {
      const response = await fetch(`${import.meta.env.VITE_SUPABASE_URL}/functions/v1/create-portal-session`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          userId: user.id,
          returnUrl: `${window.location.origin}/dashboard`,
        }),
      })

      if (!response.ok) {
        throw new Error('Failed to create portal session')
      }

      const { url } = await response.json()
      window.location.href = url

    } catch (error) {
      console.error('Error creating portal session:', error)
      throw error
    } finally {
      setLoading(false)
    }
  }

  return {
    loading,
    createCheckoutSession,
    createCheckoutSessionDirect,
    createPortalSession,
  }
}