export const STRIPE_PRODUCTS = {
  PAPERBOX_PRO_YEARLY: {
    priceId: 'price_1Ry8wKK2T2pMmvg5yy0TNryz',
    name: 'Paperbox Pro Yearly',
    description: '(Save €12.88) - Everything + 2 months FREE',
    mode: 'subscription' as const,
    price: 29.00,
    currency: 'EUR',
    interval: 'year' as const,
    features: [
      'Unlimited documents',
      'AI-powered auto-categorization',
      'Smart due-date reminders',
      'Encrypted cloud vault (EU servers)',
      'Advanced search & filters',
      'Priority support',
      'Document sharing & collaboration',
      'Mobile app access',
      '2 months FREE (save €12.88)',
      'Priority feature requests',
      'Advanced analytics',
      'Custom categories',
      'Bulk document processing',
      'API access',
      'White-label options'
    ],
    popular: false
  },
  PAPERBOX_PRO_MONTHLY: {
    priceId: 'price_1Ry8ujK2T2pMmvg5hVjD2rgz',
    name: 'Papebox Pro Monthly',
    description: 'Unlimited documents + AI features',
    mode: 'subscription' as const,
    price: 3.49,
    currency: 'EUR',
    interval: 'month' as const,
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
    popular: true
  }
} as const

export type StripeProduct = typeof STRIPE_PRODUCTS[keyof typeof STRIPE_PRODUCTS]