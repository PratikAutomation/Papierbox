import { loadStripe } from '@stripe/stripe-js'

const stripePublishableKey = import.meta.env.VITE_STRIPE_PUBLISHABLE_KEY

if (!stripePublishableKey) {
  console.warn('VITE_STRIPE_PUBLISHABLE_KEY is not set. Please add it to your .env file to enable payments.')
}

const stripePromise = stripePublishableKey && stripePublishableKey !== 'your_stripe_publishable_key_here' 
  ? loadStripe(stripePublishableKey) 
  : null

export { stripePromise }

export const PRICING_PLANS = {
  FREE: {
    id: 'free',
    name: 'Free',
    price: 0,
    currency: 'EUR',
    interval: 'lifetime',
    features: [
      'Up to 10 documents (lifetime)',
      'Basic document storage',
      'Manual categorization',
      'Standard support',
      'Basic search functionality'
    ],
    limits: {
      documents: 10
    },
    popular: false
  },
  PRO_MONTHLY: {
    id: 'pro_monthly',
    name: 'Pro Monthly',
    price: 3.49,
    currency: 'EUR',
    interval: 'month',
    stripeProductId: 'prod_StdoP8qQeDAyu8',
    stripePriceId: 'price_1RxqWkKGoVx0hUihNX1E84QX',
    features: [
      'Unlimited documents',
      'AI-powered auto-categorization',
      'Smart due-date reminders',
      'Encrypted cloud vault (EU servers)',
      'Advanced search & filters',
      'Priority support',
      'Document sharing & collaboration',
      'Mobile app access'
    ],
    limits: {
      documents: -1 // unlimited
    },
    popular: true
  },
  PRO_YEARLY: {
    id: 'pro_yearly',
    name: 'Pro Yearly',
    price: 29,
    currency: 'EUR',
    interval: 'year',
    stripeProductId: 'prod_Stdp54UIhXhltG',
    stripePriceId: 'price_1RxqXVKGoVx0hUihKdOktHHa',
    originalPrice: 41.88, // 3.49 * 12
    savings: 12.88,
    features: [
      'Everything in Pro Monthly',
      '2 months FREE (save €12.88)',
      'Priority feature requests',
      'Advanced analytics',
      'Custom categories',
      'Bulk document processing',
      'API access',
      'White-label options'
    ],
    limits: {
      documents: -1 // unlimited
    },
    popular: false
  }
}

export type PricingPlan = typeof PRICING_PLANS[keyof typeof PRICING_PLANS]