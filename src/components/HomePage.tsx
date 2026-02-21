import React, { useState } from 'react'
import { useTranslation } from 'react-i18next'
import { motion } from 'framer-motion'
import { Upload, Search, Bell, Shield, FileText, Zap, CheckCircle, ArrowRight, Eye, X, Facebook, Twitter, Linkedin, Instagram, Globe, Lock, Server, Smartphone, Mail } from 'lucide-react'
import { PricingSection } from './PricingSection'
import { useStripe } from '../hooks/useStripe'

interface HomePageProps {
  onGetStarted: () => void
}

export function HomePage({ onGetStarted }: HomePageProps) {
  const { t, i18n } = useTranslation()
  const { createCheckoutSessionDirect, loading: stripeLoading } = useStripe()
  const [showPrivacyModal, setShowPrivacyModal] = useState(false)
  const [showAiSampleModal, setShowAiSampleModal] = useState(false)
  const [showHelpModal, setShowHelpModal] = useState(false)
  const [showContactModal, setShowContactModal] = useState(false)
  const [showTermsModal, setShowTermsModal] = useState(false)
  const [showCheckoutModal, setShowCheckoutModal] = useState(false)
  const [selectedPlan, setSelectedPlan] = useState<'monthly' | 'yearly'>('monthly')
  const [currentHeadline, setCurrentHeadline] = useState<'document' | 'deadline'>('document')
  const [contactForm, setContactForm] = useState({
    name: '',
    email: '',
    subject: '',
    message: ''
  })
  const [contactLoading, setContactLoading] = useState(false)
  const [contactSuccess, setContactSuccess] = useState(false)

  const handleDirectPurchase = (planId: string) => {
    setSelectedPlan(planId as 'monthly' | 'yearly')
    setShowCheckoutModal(true)
  }

  const handleCheckoutWithEmail = async (email: string, couponCode?: string) => {
    // For direct purchases, we'll collect email and redirect to Stripe
    
    try {
      const priceId = planId === 'monthly' ? 'price_1RxqWkKGoVx0hUihNX1E84QX' : 'price_1RxqXVKGoVx0hUihKdOktHHa'
      await createCheckoutSessionDirect(priceId, planId, couponCode, email)
    } catch (error) {
      console.error('Error with direct purchase:', error)
      alert('Error starting checkout. Please try again or sign up first.')
    }
  }

  const handleContactSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setContactLoading(true)
    
    try {
      // In a real app, you'd send this to your backend
      // For now, we'll simulate the email sending
      await new Promise(resolve => setTimeout(resolve, 2000))
      
      setContactSuccess(true)
      setContactForm({ name: '', email: '', subject: '', message: '' })
      
      setTimeout(() => {
        setContactSuccess(false)
        setShowContactModal(false)
      }, 3000)
    } catch (error) {
      alert('Error sending message. Please try again.')
    } finally {
      setContactLoading(false)
    }
  }

  // Animate headline switching
  React.useEffect(() => {
    const interval = setInterval(() => {
      setCurrentHeadline(prev => prev === 'document' ? 'deadline' : 'document')
    }, 3000)
    return () => clearInterval(interval)
  }, [])

  const toggleLanguage = () => {
    const newLang = i18n.language === 'en' ? 'de' : 'en'
    i18n.changeLanguage(newLang)
  }

  return (
    <div className="min-h-screen bg-white">
      {/* Header */}
      <header className="px-4 sm:px-6 py-4 border-b border-gray-100">
        <div className="max-w-7xl mx-auto flex items-center justify-between">
          <div className="flex items-center space-x-2">
            <div className="w-8 h-8 bg-[#29AB87] rounded-lg flex items-center justify-center">
              <FileText className="w-5 h-5 text-white" />
            </div>
            <span className="text-xl font-bold text-gray-900">Papierbox</span>
          </div>
          
          {/* Desktop Navigation */}
          <nav className="hidden md:flex items-center space-x-8">
            <a href="#features" className="text-gray-600 hover:text-gray-900 transition-colors">{t('nav.features')}</a>
            <a href="#pricing" className="text-gray-600 hover:text-gray-900 transition-colors">{t('nav.pricing')}</a>
            <button onClick={() => setShowPrivacyModal(true)} className="text-gray-600 hover:text-gray-900 transition-colors">{t('nav.privacy')}</button>
            <button onClick={() => setShowHelpModal(true)} className="text-gray-600 hover:text-gray-900 transition-colors">{t('nav.help')}</button>
            <button onClick={() => setShowContactModal(true)} className="text-gray-600 hover:text-gray-900 transition-colors">{t('nav.contact')}</button>
          </nav>
          
          <div className="flex items-center space-x-4">
            {/* Language Toggle */}
            <button
              onClick={toggleLanguage}
              className="flex items-center space-x-2 text-gray-600 hover:text-gray-900 transition-colors px-3 py-2 rounded-lg hover:bg-gray-100 border border-gray-200"
              title="Switch Language"
            >
              <span className="text-sm font-semibold">{i18n.language.toUpperCase()}</span>
              <span className="text-gray-400">|</span>
              <span className="text-sm text-gray-500">{i18n.language === 'en' ? 'DE' : 'EN'}</span>
            </button>
            
            <button
              onClick={onGetStarted}
              className="bg-[#29AB87] text-white px-4 sm:px-6 py-2 rounded-xl font-medium hover:bg-[#238f73] transition-colors"
            >
              {t('nav.signIn')}
            </button>
          </div>
        </div>
      </header>

      {/* Hero Section */}
      <section className="px-4 sm:px-6 py-16 sm:py-24 bg-gradient-to-br from-gray-50 to-white relative overflow-hidden">
        <div className="max-w-7xl mx-auto">
          <div className="max-w-4xl mx-auto text-center">
              <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.6 }}
              >
                <h1 className="text-4xl sm:text-5xl lg:text-6xl font-bold text-gray-900 mb-6 leading-tight">
                  {t('hero.headline1')}{' '}
                  <motion.span
                    key={currentHeadline}
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    exit={{ opacity: 0, y: -20 }}
                    transition={{ duration: 0.5 }}
                    className="text-[#29AB87] relative inline-block"
                  >
                    {currentHeadline === 'document' ? t('hero.headline2Document') : t('hero.headline2Deadline')}
                    <motion.div
                      className="absolute -bottom-1 left-0 right-0 h-1 bg-gradient-to-r from-[#29AB87] to-[#238f73] rounded-full"
                      initial={{ scaleX: 0 }}
                      animate={{ scaleX: 1 }}
                      transition={{ duration: 0.8, delay: 0.2 }}
                    />
                  </motion.span>
                </h1>
                
                <p className="text-lg sm:text-xl text-gray-600 mb-8 max-w-3xl mx-auto leading-relaxed">
                  {t('hero.subhead')}
                </p>
                
                {/* Primary CTA */}
                <div className="space-y-5 mb-6">
                  <motion.button
                    onClick={onGetStarted}
                    className="bg-gradient-to-r from-[#29AB87] to-[#238f73] text-white px-12 py-5 rounded-2xl font-bold text-xl hover:shadow-2xl transform hover:scale-105 transition-all duration-300 shadow-xl relative overflow-hidden group"
                    whileHover={{ scale: 1.05 }}
                    whileTap={{ scale: 0.95 }}
                  >
                    <span className="relative z-10">{t('hero.ctaPrimary')}</span>
                    <div className="absolute inset-0 bg-gradient-to-r from-[#238f73] to-[#29AB87] opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
                  </motion.button>
                  
                  <div className="text-center">
                    <button 
                      onClick={onGetStarted}
                      className="text-[#29AB87] hover:text-[#238f73] font-medium text-base underline transition-colors"
                    >
                      {t('hero.ctaDemo')}
                    </button>
                  </div>
                  
                  {/* Price Reassurance */}
                  <div className="text-center mt-4">
                    <p className="text-sm text-gray-500">
                      ✨ <strong>{t('hero.alwaysFree')}</strong> {t('hero.noCard')}
                    </p>
                  </div>
                </div>
                
                {/* Trust Strip */}
                <div className="flex flex-wrap justify-center items-center gap-4 sm:gap-6 text-sm text-gray-600 mb-6">
                  <div className="flex items-center space-x-2">
                    <Server className="w-4 h-4 text-[#29AB87]" />
                    <span>{t('hero.trustStrip.euHosted')}</span>
                  </div>
                  <div className="flex items-center space-x-2">
                    <Lock className="w-4 h-4 text-[#29AB87]" />
                    <span>{t('hero.trustStrip.encrypted')}</span>
                  </div>
                  <div className="flex items-center space-x-2">
                    <Eye className="w-4 h-4 text-[#29AB87]" />
                    <span>{t('hero.trustStrip.localOcr')}</span>
                  </div>
                  <div className="flex items-center space-x-2">
                    <Shield className="w-4 h-4 text-[#29AB87]" />
                    <span>{t('hero.trustStrip.zeroKnowledge')}</span>
                  </div>
                </div>
                
                {/* AI Sample Link */}
                <div className="mt-6">
                <button
                  onClick={() => setShowAiSampleModal(true)}
                  className="inline-flex items-center space-x-2 bg-[#29AB87]/10 hover:bg-[#29AB87]/20 text-[#29AB87] hover:text-[#238f73] font-semibold text-base px-5 py-3 rounded-xl transition-all duration-200 border border-[#29AB87]/20 hover:border-[#29AB87]/40"
                >
                  <Eye className="w-5 h-5" />
                  <span>{t('hero.seeAiSample')}</span>
                  <ArrowRight className="w-4 h-4" />
                </button>
                </div>
              </motion.div>
          </div>
        </div>
        
        {/* Mobile Sticky CTA */}
        <div className="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 p-3 z-40 lg:hidden">
          <motion.div
            initial={{ y: 100 }}
            animate={{ y: 0 }}
            transition={{ duration: 0.5, delay: 1 }}
          >
            <button
              onClick={onGetStarted}
              className="w-full bg-gradient-to-r from-[#29AB87] to-[#238f73] text-white py-3 rounded-xl font-bold text-base shadow-lg relative overflow-hidden group"
            >
              <span className="relative z-10">Start free — 10 docs</span>
              <div className="absolute inset-0 bg-gradient-to-r from-[#238f73] to-[#29AB87] opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
            </button>
          </motion.div>
        </div>
      </section>

      {/* How It Works */}
      <section id="features" className="px-4 sm:px-6 py-16 sm:py-20">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-10 sm:mb-14">
            <h2 className="text-2xl sm:text-3xl lg:text-4xl font-bold text-gray-900 mb-4">{t('features.title')}</h2>
            <p className="text-base sm:text-lg lg:text-xl text-gray-600">{t('features.subtitle')}</p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 sm:gap-10">
            {[
              {
                icon: <Upload className="w-8 h-8" />,
                title: t('features.upload.title'),
                description: t('features.upload.description')
              },
              {
                icon: <Zap className="w-8 h-8" />,
                title: t('features.aiAnalysis.title'),
                description: t('features.aiAnalysis.description')
              },
              {
                icon: <Bell className="w-8 h-8" />,
                title: t('features.reminders.title'),
                description: t('features.reminders.description')
              }
            ].map((step, index) => (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.6, delay: index * 0.2 }}
                className="text-center group"
              >
                <div className="w-14 h-14 bg-[#29AB87] text-white rounded-2xl flex items-center justify-center mx-auto mb-5 group-hover:scale-110 transition-transform duration-200">
                  {step.icon}
                </div>
                <h3 className="text-lg sm:text-xl font-semibold text-gray-900 mb-4">{step.title}</h3>
                <p className="text-sm sm:text-base text-gray-600 leading-relaxed">{step.description}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Features Grid */}
      <section className="px-4 sm:px-6 py-16 sm:py-20 bg-gray-50">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-10 sm:mb-14">
            <h2 className="text-2xl sm:text-3xl lg:text-4xl font-bold text-gray-900 mb-4">Powerful Features</h2>
            <p className="text-base sm:text-lg lg:text-xl text-gray-600">Everything you need to stay organized</p>
          </div>
          
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-7">
            {[
              {
                icon: <Search className="w-6 h-6" />,
                title: "Smart Search",
                description: "Find any document instantly with powerful keyword search across all your files"
              },
              {
                icon: <Shield className="w-6 h-6" />,
                title: "Bank-Level Security",
                description: "Your documents are encrypted and stored securely with enterprise-grade protection"
              },
              {
                icon: <FileText className="w-6 h-6" />,
                title: "OCR Technology",
                description: "Extract text and data from scanned documents and images automatically"
              },
              {
                icon: <Bell className="w-6 h-6" />,
                title: "Smart Reminders",
                description: "Automatic notifications for important due dates and document renewals"
              },
              {
                icon: <CheckCircle className="w-6 h-6" />,
                title: "Auto-Categorization",
                description: "AI automatically sorts your documents by type with 95% accuracy"
              },
              {
                icon: <ArrowRight className="w-6 h-6" />,
                title: "Easy Sharing",
                description: "Share documents securely with family, advisors, or colleagues"
              }
            ].map((feature, index) => (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.6, delay: index * 0.1 }}
                className="bg-white p-5 sm:p-6 rounded-2xl shadow-sm hover:shadow-md transition-shadow duration-200"
              >
                <div className="w-11 h-11 bg-[#29AB87]/10 text-[#29AB87] rounded-xl flex items-center justify-center mb-4">
                  {feature.icon}
                </div>
                <h3 className="text-base sm:text-lg font-semibold text-gray-900 mb-2">{feature.title}</h3>
                <p className="text-sm sm:text-base text-gray-600">{feature.description}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Pricing Section */}
      <section id="pricing" className="bg-gray-50">
        <PricingSection onSelectPlan={onGetStarted} onDirectPurchase={handleDirectPurchase} />
      </section>

      {/* AI Sample Modal */}
      {showAiSampleModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
          <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            className="bg-white rounded-3xl p-6 sm:p-8 max-w-4xl w-full mx-4 max-h-[90vh] overflow-y-auto"
          >
            <div className="flex items-center justify-between mb-6">
              <h2 className="text-xl sm:text-2xl font-bold text-gray-900">What We Send to AI</h2>
              <button
                onClick={() => setShowAiSampleModal(false)}
                className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
              >
                <X className="w-5 h-5" />
              </button>
            </div>
            
            <div className="space-y-6 text-sm sm:text-base text-gray-600">
              <div className="bg-white rounded-2xl p-6 sm:p-8 mb-6 text-left border border-gray-200">
                <div className="flex items-center justify-between mb-4">
                  <h3 className="text-lg font-semibold text-gray-900 flex items-center">
                    <Eye className="w-5 h-5 mr-2 text-[#29AB87]" />
                    Privacy-First AI Processing
                  </h3>
                  <span className="text-sm text-gray-500">German Tax Document Example</span>
                </div>
                
                <div className="grid md:grid-cols-2 gap-6">
                  <div>
                    <div className="flex items-center mb-3">
                      <X className="w-4 h-4 text-red-500 mr-2" />
                      <span className="text-sm font-medium text-red-700">Original (NEVER sent)</span>
                    </div>
                    <div className="bg-red-50 border border-red-200 p-4 rounded-lg text-xs font-mono">
                      <div>Finanzamt Berlin-Mitte</div>
                      <div>Steuerbescheid 2023</div>
                      <div>Max Mustermann</div>
                      <div>Musterstraße 123</div>
                      <div>10115 Berlin</div>
                      <div>Steuer-ID: 12 345 678 901</div>
                      <div>IBAN: DE89 3704 0044 0532 0130 00</div>
                      <div className="mt-2">Sehr geehrter Herr Mustermann,</div>
                      <div>hiermit erhalten Sie Ihren Steuerbescheid für das Jahr 2023...</div>
                    </div>
                  </div>
                  
                  <div>
                    <div className="flex items-center mb-3">
                      <CheckCircle className="w-4 h-4 text-green-500 mr-2" />
                      <span className="text-sm font-medium text-green-700">Masked version (sent to AI)</span>
                    </div>
                    <div className="bg-green-50 border border-green-200 p-4 rounded-lg text-xs font-mono">
                      <div>Finanzamt ████████</div>
                      <div>Steuerbescheid 2023</div>
                      <div>████ ██████████</div>
                      <div>██████████ ███</div>
                      <div>█████ ██████</div>
                      <div>Steuer-ID: ██ ███ ███ ███</div>
                      <div>IBAN: ██ ████ ████ ████ ████ ██</div>
                      <div className="mt-2">Sehr geehrte/r ████████████,</div>
                      <div>hiermit erhalten Sie Ihren Steuerbescheid für das Jahr 2023...</div>
                    </div>
                  </div>
                </div>
                
                <div className="mt-6 p-4 bg-blue-50 border border-blue-200 rounded-lg">
                  <h4 className="font-medium text-blue-900 mb-2">AI Response:</h4>
                  <div className="text-sm text-blue-800 font-mono">
                    {`{
  "category": "Tax",
  "title": "Steuerbescheid 2023",
  "due_date": "2024-03-31",
  "urgency": 4,
  "confidence": 0.95
}`}
                  </div>
                </div>
                
                <div className="mt-4 text-xs text-gray-500">
                  <strong>Technical Details:</strong> Text redaction happens entirely in your browser using client-side JavaScript. 
                  The original document never leaves your device unencrypted. Only the masked text snippets are sent to OpenAI's API for categorization, 
                  and responses are not used for training.
                </div>
              </div>
              
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 text-center">
                <div className="bg-[#29AB87]/10 p-4 rounded-xl">
                  <Shield className="w-8 h-8 text-[#29AB87] mx-auto mb-2" />
                  <h4 className="font-semibold text-gray-900">Zero-Knowledge</h4>
                  <p className="text-sm text-gray-600">We never see your personal data</p>
                </div>
                <div className="bg-[#29AB87]/10 p-4 rounded-xl">
                  <Lock className="w-8 h-8 text-[#29AB87] mx-auto mb-2" />
                  <h4 className="font-semibold text-gray-900">Local Processing</h4>
                  <p className="text-sm text-gray-600">Masking happens on your device</p>
                </div>
              </div>
            </div>
          </motion.div>
        </div>
      )}

      {/* Privacy Section */}
      <section id="privacy" className="px-4 sm:px-6 py-12 sm:py-20">
        <div className="max-w-6xl mx-auto text-center">
          <div className="bg-[#29AB87]/5 p-6 sm:p-12 rounded-3xl">
            <Shield className="w-16 h-16 text-[#29AB87] mx-auto mb-6" />
            <h2 className="text-xl sm:text-2xl lg:text-3xl font-bold text-gray-900 mb-4">Your Privacy Matters</h2>
            <p className="text-base sm:text-lg lg:text-xl text-gray-600 mb-6 max-w-4xl mx-auto">
              We only process document metadata for organization. Your sensitive information 
              stays encrypted and private. Our AI sees only what's necessary for categorization - never your personal details.
            </p>
            
            {/* Privacy Example */}
            <div className="bg-white rounded-2xl p-6 sm:p-8 mb-6 text-left max-w-4xl mx-auto">
              <div className="flex items-center justify-between mb-4">
                <h3 className="text-lg font-semibold text-gray-900 flex items-center">
                  <Eye className="w-5 h-5 mr-2 text-[#29AB87]" />
                  What Our AI Sees
                </h3>
                <span className="text-sm text-gray-500">German Tax Document Example</span>
              </div>
              
              <div className="grid md:grid-cols-2 gap-6">
                <div>
                  <div className="flex items-center mb-3">
                    <X className="w-4 h-4 text-red-500 mr-2" />
                    <span className="text-sm font-medium text-red-700">Original (NEVER sent)</span>
                  </div>
                  <div className="bg-red-50 border border-red-200 p-4 rounded-lg text-xs font-mono">
                    <div>Finanzamt Berlin-Mitte</div>
                    <div>Steuerbescheid 2023</div>
                    <div>Max Mustermann</div>
                    <div>Musterstraße 123</div>
                    <div>10115 Berlin</div>
                    <div>Steuer-ID: 12 345 678 901</div>
                    <div>IBAN: DE89 3704 0044 0532 0130 00</div>
                    <div className="mt-2">Sehr geehrter Herr Mustermann,</div>
                    <div>hiermit erhalten Sie Ihren Steuerbescheid für das Jahr 2023...</div>
                  </div>
                </div>
                
                <div>
                  <div className="flex items-center mb-3">
                    <CheckCircle className="w-4 h-4 text-green-500 mr-2" />
                    <span className="text-sm font-medium text-green-700">Masked version (sent to AI)</span>
                  </div>
                  <div className="bg-green-50 border border-green-200 p-4 rounded-lg text-xs font-mono">
                    <div>Finanzamt ████████</div>
                    <div>Steuerbescheid 2023</div>
                    <div>████ ██████████</div>
                    <div>██████████ ███</div>
                    <div>█████ ██████</div>
                    <div>Steuer-ID: ██ ███ ███ ███</div>
                    <div>IBAN: ██ ████ ████ ████ ████ ██</div>
                    <div className="mt-2">Sehr geehrte/r ████████████,</div>
                    <div>hiermit erhalten Sie Ihren Steuerbescheid für das Jahr 2023...</div>
                  </div>
                </div>
              </div>
              
              <div className="mt-6 p-4 bg-blue-50 border border-blue-200 rounded-lg">
                <h4 className="font-medium text-blue-900 mb-2">AI Response:</h4>
                <div className="text-sm text-blue-800 font-mono">
                  {`{
  "category": "Tax",
  "title": "Steuerbescheid 2023",
  "due_date": "2024-03-31",
  "urgency": 4,
  "confidence": 0.95
}`}
                </div>
              </div>
              
              <div className="mt-4 text-xs text-gray-500">
                <strong>Technical Details:</strong> Text redaction happens entirely in your browser using client-side JavaScript. 
                The original document never leaves your device unencrypted. Only the masked text snippets are sent to OpenAI's API for categorization, 
                and responses are not used for training.
              </div>
            </div>
            
            <button 
              onClick={() => setShowPrivacyModal(true)}
              className="w-full sm:w-auto bg-white text-[#29AB87] px-6 py-3 rounded-xl font-semibold border-2 border-[#29AB87] hover:bg-[#29AB87] hover:text-white transition-colors"
            >
              Learn More About Our Security
            </button>
          </div>
        </div>
      </section>

      {/* Trust Indicators */}
      <section className="px-4 sm:px-6 py-12 sm:py-20 bg-gray-50">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-12">
            <h2 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-4">Trusted by Thousands</h2>
            <p className="text-base sm:text-lg text-gray-600">Built for privacy, designed for Germany and Europe</p>
          </div>
          
          <div className="grid grid-cols-2 md:grid-cols-4 gap-6 sm:gap-8">
            <div className="text-center">
              <div className="w-20 h-20 sm:w-24 sm:h-24 mx-auto mb-4 flex items-center justify-center bg-white rounded-xl shadow-sm">
                <img src="/Germany.svg" alt="Germany Flag" className="w-16 h-12 sm:w-18 sm:h-14" />
              </div>
              <div className="text-sm sm:text-base font-medium text-gray-900">Germany</div>
              <div className="text-xs sm:text-sm text-gray-600">Built for German bureaucracy</div>
            </div>
            <div className="text-center">
              <div className="w-20 h-20 sm:w-24 sm:h-24 mx-auto mb-4 flex items-center justify-center bg-white rounded-xl shadow-sm">
                <div className="text-4xl sm:text-5xl">🇪🇺</div>
              </div>
              <div className="text-sm sm:text-base font-medium text-gray-900">EU Compliant</div>
              <div className="text-xs sm:text-sm text-gray-600">GDPR ready and compliant</div>
            </div>
            <div className="text-center">
              <div className="w-20 h-20 sm:w-24 sm:h-24 mx-auto mb-4 flex items-center justify-center bg-white rounded-xl shadow-sm">
                <img src="/GDPR.jpeg" alt="GDPR Compliant" className="w-16 h-14 sm:w-18 sm:h-16 rounded-lg object-cover" />
              </div>
              <div className="text-sm sm:text-base font-medium text-gray-900">GDPR Ready</div>
              <div className="text-xs sm:text-sm text-gray-600">Your data, your control</div>
            </div>
            <div className="text-center">
              <div className="w-20 h-20 sm:w-24 sm:h-24 mx-auto mb-4 flex items-center justify-center bg-white rounded-xl shadow-sm">
                <img src="/cloud.png" alt="Secure EU Servers" className="w-16 h-14 sm:w-18 sm:h-16 object-contain" />
              </div>
              <div className="text-sm sm:text-base font-medium text-gray-900">EU Secure Servers</div>
              <div className="text-xs sm:text-sm text-gray-600">Database stored in secure EU servers</div>
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="px-4 sm:px-6 py-12 sm:py-16 bg-gray-900 text-white">
        <div className="max-w-7xl mx-auto">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-8 sm:gap-12">
            {/* Brand */}
            <div className="md:col-span-1">
              <div className="flex items-center space-x-2 mb-4">
                <div className="w-8 h-8 bg-[#29AB87] rounded-lg flex items-center justify-center">
                  <FileText className="w-5 h-5 text-white" />
                </div>
                <span className="text-lg sm:text-xl font-bold">Papierbox</span>
              </div>
              <p className="text-sm sm:text-base text-gray-400 mb-6">
                Private document organization for Germany and EU. Making bureaucracy manageable.
              </p>
              <div className="flex space-x-4">
                <a href="#" className="text-gray-400 hover:text-white transition-colors">
                  <Facebook className="w-5 h-5" />
                </a>
                <a href="#" className="text-gray-400 hover:text-white transition-colors">
                  <Twitter className="w-5 h-5" />
                </a>
                <a href="#" className="text-gray-400 hover:text-white transition-colors">
                  <Linkedin className="w-5 h-5" />
                </a>
                <a href="#" className="text-gray-400 hover:text-white transition-colors">
                  <Instagram className="w-5 h-5" />
                </a>
              </div>
            </div>

            {/* Product */}
            <div>
              <h3 className="text-base sm:text-lg font-semibold mb-4">Product</h3>
              <ul className="space-y-2 sm:space-y-3">
                <li><a href="#features" className="text-sm sm:text-base text-gray-400 hover:text-white transition-colors">Features</a></li>
                <li><a href="#pricing" className="text-sm sm:text-base text-gray-400 hover:text-white transition-colors">Pricing</a></li>
                <li><a href="#demo" className="text-sm sm:text-base text-gray-400 hover:text-white transition-colors">Try Demo</a></li>
                <li><a href="#api" className="text-sm sm:text-base text-gray-400 hover:text-white transition-colors">API</a></li>
              </ul>
            </div>

            {/* Legal */}
            <div>
              <h3 className="text-base sm:text-lg font-semibold mb-4">Legal</h3>
              <ul className="space-y-2 sm:space-y-3">
                <li><a href="#privacy" className="text-sm sm:text-base text-gray-400 hover:text-white transition-colors">Privacy Policy</a></li>
                <li><a href="#terms" className="text-sm sm:text-base text-gray-400 hover:text-white transition-colors">Terms of Service</a></li>
                <li><a href="#imprint" className="text-sm sm:text-base text-gray-400 hover:text-white transition-colors">Imprint</a></li>
                <li><a href="#gdpr" className="text-sm sm:text-base text-gray-400 hover:text-white transition-colors">GDPR</a></li>
              </ul>
            </div>

            {/* Support */}
            <div>
              <h3 className="text-base sm:text-lg font-semibold mb-4">Support</h3>
              <ul className="space-y-2 sm:space-y-3">
                <li><button onClick={() => setShowHelpModal(true)} className="text-sm sm:text-base text-gray-400 hover:text-white transition-colors">Help Center</button></li>
                <li><button onClick={() => setShowContactModal(true)} className="text-sm sm:text-base text-gray-400 hover:text-white transition-colors">Contact</button></li>
                <li><a href="#status" className="text-sm sm:text-base text-gray-400 hover:text-white transition-colors">System Status</a></li>
                <li><a href="#community" className="text-sm sm:text-base text-gray-400 hover:text-white transition-colors">Community</a></li>
              </ul>
            </div>
          </div>
          
          <div className="border-t border-gray-800 pt-8 mt-12">
            <div className="flex flex-col sm:flex-row justify-between items-center">
              <p className="text-xs sm:text-sm text-gray-500 mb-4 sm:mb-0">
                © 2025 Papierbox. Made with 💚 for privacy.
              </p>
              <div className="flex items-center space-x-4 text-xs sm:text-sm text-gray-500">
                <button onClick={() => setShowTermsModal(true)} className="hover:text-gray-300 transition-colors">Terms</button>
                <span>🇩🇪 Germany</span>
                <span>🇪🇺 EU Compliant</span>
                <span>🔒 GDPR Ready</span>
              </div>
            </div>
          </div>
        </div>
      </footer>

      {/* Help & FAQ Modal */}
      {showHelpModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
          <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            className="bg-white rounded-3xl p-6 sm:p-8 max-w-4xl w-full mx-4 max-h-[90vh] overflow-y-auto"
          >
            <div className="flex items-center justify-between mb-6">
              <h2 className="text-xl sm:text-2xl font-bold text-gray-900">Help & FAQ</h2>
              <button
                onClick={() => setShowHelpModal(false)}
                className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
              >
                <X className="w-5 h-5" />
              </button>
            </div>
            
            <div className="space-y-8">
              {/* Quick Contact */}
              <div className="bg-[#29AB87]/10 p-6 rounded-2xl">
                <h3 className="text-lg font-semibold text-gray-900 mb-3">Need Personal Help?</h3>
                <p className="text-gray-600 mb-4">Can't find what you're looking for? Our support team is here to help!</p>
                <button
                  onClick={() => {
                    setShowHelpModal(false)
                    setShowContactModal(true)
                  }}
                  className="bg-[#29AB87] text-white px-6 py-3 rounded-xl font-semibold hover:bg-[#238f73] transition-colors flex items-center space-x-2"
                >
                  <Mail className="w-5 h-5" />
                  <span>Contact Support</span>
                </button>
              </div>

              {/* FAQ Sections */}
              <div className="space-y-6">
                <div>
                  <h3 className="text-lg font-semibold text-gray-900 mb-4">🚀 Getting Started</h3>
                  <div className="space-y-4">
                    <div className="border-l-4 border-[#29AB87] pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">How do I upload my first document?</h4>
                      <p className="text-gray-600 text-sm">Simply click the "Upload" button in your dashboard and drag & drop your document, or click to select from your device. We support PDFs, images (JPG, PNG), and text files.</p>
                    </div>
                    <div className="border-l-4 border-[#29AB87] pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">What file types are supported?</h4>
                      <p className="text-gray-600 text-sm">We support PDF files, images (JPG, PNG, JPEG), and text documents. Our AI can read both digital documents and scanned/photographed papers.</p>
                    </div>
                    <div className="border-l-4 border-[#29AB87] pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">How accurate is the AI categorization?</h4>
                      <p className="text-gray-600 text-sm">Our AI achieves 95%+ accuracy for German documents. It's specifically trained on German bureaucratic documents like tax forms, rental agreements, insurance papers, and more.</p>
                    </div>
                  </div>
                </div>
              
                <div>
                  <h3 className="text-lg font-semibold text-gray-900 mb-4">🔒 Privacy & Security</h3>
                  <div className="space-y-4">
                    <div className="border-l-4 border-blue-500 pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">Is my data safe and private?</h4>
                      <p className="text-gray-600 text-sm">Absolutely! Your documents are encrypted at rest and in transit. Personal information is automatically masked before any AI processing. We're GDPR compliant and use EU servers.</p>
                    </div>
                    <div className="border-l-4 border-blue-500 pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">What does the AI see from my documents?</h4>
                      <p className="text-gray-600 text-sm">Only masked text for categorization. Names, addresses, account numbers, and personal details are replaced with ████ symbols before any AI processing.</p>
                    </div>
                    <div className="border-l-4 border-blue-500 pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">Where is my data stored?</h4>
                      <p className="text-gray-600 text-sm">All data is stored on secure EU servers in compliance with GDPR. Your documents never leave the European Union.</p>
                    </div>
                  </div>
                </div>

                <div>
                  <h3 className="text-lg font-semibold text-gray-900 mb-4">💳 Billing & Plans</h3>
                  <div className="space-y-4">
                    <div className="border-l-4 border-green-500 pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">What's included in the Free plan?</h4>
                      <p className="text-gray-600 text-sm">The Free plan includes up to 10 documents for lifetime, basic storage, manual categorization, and standard support. Perfect for trying out Papierbox!</p>
                    </div>
                    <div className="border-l-4 border-green-500 pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">Can I cancel my Pro subscription anytime?</h4>
                      <p className="text-gray-600 text-sm">Yes! You can cancel anytime from your dashboard. We also offer a 30-day money-back guarantee if you're not satisfied.</p>
                    </div>
                    <div className="border-l-4 border-green-500 pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">Do you offer discounts for yearly plans?</h4>
                      <p className="text-gray-600 text-sm">Yes! Our yearly plan saves you €12.88 (equivalent to 2 months free). We also accept coupon codes for additional discounts.</p>
                    </div>
                  </div>
                </div>

                <div>
                  <h3 className="text-lg font-semibold text-gray-900 mb-4">📱 Features & Usage</h3>
                  <div className="space-y-4">
                    <div className="border-l-4 border-purple-500 pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">How do smart reminders work?</h4>
                      <p className="text-gray-600 text-sm">Our AI automatically detects due dates, expiry dates, and payment deadlines from your documents. You'll receive notifications at the right time to never miss important deadlines.</p>
                    </div>
                    <div className="border-l-4 border-purple-500 pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">Can I share documents with others?</h4>
                      <p className="text-gray-600 text-sm">Yes! Pro users can generate secure sharing links for documents. Links are time-limited and can be shared with family, advisors, or colleagues.</p>
                    </div>
                    <div className="border-l-4 border-purple-500 pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">What languages are supported?</h4>
                      <p className="text-gray-600 text-sm">Papierbox supports German and English interfaces. Our AI is specially optimized for German documents but works with documents in multiple languages.</p>
                    </div>
                  </div>
                </div>

                <div>
                  <h3 className="text-lg font-semibold text-gray-900 mb-4">🛠️ Technical Support</h3>
                  <div className="space-y-4">
                    <div className="border-l-4 border-orange-500 pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">My document wasn't categorized correctly. What can I do?</h4>
                      <p className="text-gray-600 text-sm">Our AI is constantly learning! If a document is miscategorized, please contact support with details. We use this feedback to improve our categorization accuracy.</p>
                    </div>
                    <div className="border-l-4 border-orange-500 pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">Can I export my documents?</h4>
                      <p className="text-gray-600 text-sm">Yes! You can download individual documents anytime. Pro users also get bulk export features and API access for advanced integrations.</p>
                    </div>
                    <div className="border-l-4 border-orange-500 pl-4">
                      <h4 className="font-medium text-gray-900 mb-2">Is there a mobile app?</h4>
                      <p className="text-gray-600 text-sm">Pro users get access to our mobile app for iOS and Android. Upload documents on-the-go and receive push notifications for important deadlines.</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </motion.div>
        </div>
      )}

      {/* Privacy Modal */}
      {showPrivacyModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
          <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            className="bg-white rounded-3xl p-6 sm:p-8 max-w-4xl w-full mx-4 max-h-[90vh] overflow-y-auto"
          >
            <div className="flex items-center justify-between mb-6">
              <h2 className="text-xl sm:text-2xl font-bold text-gray-900">Privacy & Security Details</h2>
              <button
                onClick={() => setShowPrivacyModal(false)}
                className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
              >
                <X className="w-5 h-5" />
              </button>
            </div>
            
            <div className="space-y-6 text-sm sm:text-base text-gray-600">
              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">How We Protect Your Privacy</h3>
                <ul className="space-y-2 list-disc list-inside">
                  <li>All personal information is automatically removed before any text is sent to AI services</li>
                  <li>Names, addresses, account numbers, and other sensitive data are replaced with ████ symbols</li>
                  <li>Original documents never leave your device unencrypted</li>
                  <li>Only masked text snippets are sent to OpenAI's API for categorization</li>
                  <li>AI responses are not used for training or stored by OpenAI</li>
                </ul>
              </div>
              
              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">Technical Implementation</h3>
                <ul className="space-y-2 list-disc list-inside">
                  <li>Text redaction happens entirely in your browser using client-side JavaScript</li>
                  <li>Documents are encrypted at rest using AES-256 encryption</li>
                  <li>All data transmission uses TLS 1.3 encryption</li>
                  <li>Your Supabase environment is isolated and private to you</li>
                  <li>We follow GDPR guidelines and German data protection laws</li>
                </ul>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">What Information We Extract</h3>
                <ul className="space-y-2 list-disc list-inside">
                  <li>Document type and category (e.g., "Tax Document", "Bank Statement")</li>
                  <li>Due dates and important dates for reminders</li>
                  <li>Document structure and layout information</li>
                  <li>General keywords for search functionality</li>
                  <li>File metadata (size, type, creation date)</li>
                </ul>
              </div>

              <div className="mt-8 flex justify-end">
                <button
                  onClick={() => setShowPrivacyModal(false)}
                  className="bg-[#29AB87] text-white px-6 py-3 rounded-xl font-semibold hover:bg-[#238f73] transition-colors"
                >
                  Got it, thanks!
                </button>
              </div>
            </div>
          </motion.div>
        </div>
      )}

      {/* Contact Modal */}
      {showContactModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
          <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            className="bg-white rounded-3xl p-6 sm:p-8 max-w-2xl w-full mx-4 max-h-[90vh] overflow-y-auto"
          >
            <div className="flex items-center justify-between mb-6">
              <div className="flex items-center space-x-3">
                <div className="w-12 h-12 bg-gradient-to-r from-[#29AB87] to-[#238f73] rounded-2xl flex items-center justify-center">
                  <Mail className="w-6 h-6 text-white" />
                </div>
                <div>
                  <h2 className="text-xl sm:text-2xl font-bold text-gray-900">Contact Us</h2>
                  <p className="text-gray-600 text-sm">We'd love to hear from you!</p>
                </div>
              </div>
              <button
                onClick={() => setShowContactModal(false)}
                className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
              >
                <X className="w-5 h-5" />
              </button>
            </div>
            
            {contactSuccess ? (
              <div className="text-center py-12">
                <div className="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-6">
                  <CheckCircle className="w-10 h-10 text-green-600" />
                </div>
                <h3 className="text-xl font-bold text-gray-900 mb-3">Message Sent Successfully!</h3>
                <p className="text-gray-600">Thank you for contacting us. We'll get back to you within 24 hours at the email address you provided.</p>
              </div>
            ) : (
              <form onSubmit={handleContactSubmit} className="space-y-6">
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <label htmlFor="contact-name" className="block text-sm font-semibold text-gray-700 mb-2">
                      Full Name *
                    </label>
                    <input
                      type="text"
                      id="contact-name"
                      value={contactForm.name}
                      onChange={(e) => setContactForm(prev => ({ ...prev, name: e.target.value }))}
                      className="w-full px-4 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] transition-all duration-200"
                      placeholder="John Doe"
                      required
                    />
                  </div>
                  
                  <div>
                    <label htmlFor="contact-email" className="block text-sm font-semibold text-gray-700 mb-2">
                      Email Address *
                    </label>
                    <input
                      type="email"
                      id="contact-email"
                      value={contactForm.email}
                      onChange={(e) => setContactForm(prev => ({ ...prev, email: e.target.value }))}
                      className="w-full px-4 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] transition-all duration-200"
                      placeholder="john@example.com"
                      required
                    />
                  </div>
                </div>

                <div>
                  <label htmlFor="contact-subject" className="block text-sm font-semibold text-gray-700 mb-2">
                    Subject *
                  </label>
                  <select
                    id="contact-subject"
                    value={contactForm.subject}
                    onChange={(e) => setContactForm(prev => ({ ...prev, subject: e.target.value }))}
                    className="w-full px-4 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] transition-all duration-200"
                    required
                  >
                    <option value="">Select a topic...</option>
                    <option value="general">General Question</option>
                    <option value="technical">Technical Support</option>
                    <option value="billing">Billing & Subscriptions</option>
                    <option value="feature">Feature Request</option>
                    <option value="bug">Bug Report</option>
                    <option value="privacy">Privacy & Security</option>
                    <option value="partnership">Business Partnership</option>
                  </select>
                </div>

                <div>
                  <label htmlFor="contact-message" className="block text-sm font-semibold text-gray-700 mb-2">
                    Message *
                  </label>
                  <textarea
                    id="contact-message"
                    value={contactForm.message}
                    onChange={(e) => setContactForm(prev => ({ ...prev, message: e.target.value }))}
                    rows={6}
                    className="w-full px-4 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] transition-all duration-200 resize-none"
                    placeholder="Please describe your question or issue in detail..."
                    required
                  />
                </div>

                <div className="bg-gray-50 p-4 rounded-xl">
                  <p className="text-sm text-gray-600">
                    <strong>Response Time:</strong> We typically respond within 24 hours during business days. 
                    For urgent technical issues, please mention "URGENT" in your subject line.
                  </p>
                </div>

                <button
                  type="submit"
                  disabled={contactLoading}
                  className="w-full bg-gradient-to-r from-[#29AB87] to-[#238f73] text-white py-4 rounded-xl font-semibold hover:shadow-lg transform hover:scale-105 transition-all duration-200 disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none flex items-center justify-center space-x-2"
                >
                  {contactLoading ? (
                    <>
                      <div className="animate-spin rounded-full h-5 w-5 border-2 border-white border-t-transparent"></div>
                      <span>Sending Message...</span>
                    </>
                  ) : (
                    <>
                      <Mail className="w-5 h-5" />
                      <span>Send Message</span>
                    </>
                  )}
                </button>

                <p className="text-center text-xs text-gray-500">
                  Messages are sent to info@papierbox.eu • We respect your privacy and never share your information
                </p>
              </form>
            )}
          </motion.div>
        </div>
      )}

      {/* Terms of Service Modal */}
      {showTermsModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
          <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            className="bg-white rounded-3xl p-6 sm:p-8 max-w-4xl w-full mx-4 max-h-[90vh] overflow-y-auto"
          >
            <div className="flex items-center justify-between mb-6">
              <h2 className="text-xl sm:text-2xl font-bold text-gray-900">Terms of Service</h2>
              <button
                onClick={() => setShowTermsModal(false)}
                className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
              >
                <X className="w-5 h-5" />
              </button>
            </div>
            
            <div className="space-y-6 text-sm text-gray-600">
              <div className="bg-[#29AB87]/10 p-6 rounded-2xl">
                <p className="text-center text-gray-700">
                  <strong>Last Updated:</strong> January 2025 • <strong>Effective Date:</strong> January 1, 2025
                </p>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">1. Acceptance of Terms</h3>
                <p>By accessing and using Papierbox ("Service"), you accept and agree to be bound by the terms and provision of this agreement. If you do not agree to abide by the above, please do not use this service.</p>
              </div>
            
              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">2. Service Description</h3>
                <p>Papierbox is a document management platform that helps users organize, categorize, and manage their personal documents using AI-powered analysis. The service includes document storage, categorization, reminder notifications, and related features.</p>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">3. User Accounts and Registration</h3>
                <ul className="list-disc list-inside space-y-2">
                  <li>You must provide accurate and complete registration information</li>
                  <li>You are responsible for maintaining the security of your account credentials</li>
                  <li>You must notify us immediately of any unauthorized use of your account</li>
                  <li>One account per person; sharing accounts is prohibited</li>
                </ul>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">4. Privacy and Data Protection</h3>
                <ul className="list-disc list-inside space-y-2">
                  <li>We are committed to protecting your privacy and comply with GDPR regulations</li>
                  <li>Personal information in documents is masked before AI processing</li>
                  <li>Your documents are encrypted and stored securely on EU servers</li>
                  <li>We do not sell, rent, or share your personal information with third parties</li>
                </ul>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">5. Subscription Plans and Billing</h3>
                <ul className="list-disc list-inside space-y-2">
                  <li><strong>Free Plan:</strong> Limited to 10 documents with basic features</li>
                  <li><strong>Pro Plans:</strong> Unlimited documents with advanced AI features</li>
                  <li>Subscriptions automatically renew unless canceled</li>
                  <li>30-day money-back guarantee for new Pro subscriptions</li>
                  <li>You can cancel anytime from your dashboard or customer portal</li>
                </ul>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">6. Acceptable Use Policy</h3>
                <p>You agree not to use the Service to:</p>
                <ul className="list-disc list-inside space-y-2 mt-2">
                  <li>Upload illegal, harmful, or copyrighted content you don't own</li>
                  <li>Attempt to reverse engineer or hack the platform</li>
                  <li>Share your account credentials with others</li>
                  <li>Use the service for any unlawful purposes</li>
                  <li>Overload our systems with excessive requests</li>
                </ul>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">7. Intellectual Property</h3>
                <p>The Papierbox platform, including its design, features, and underlying technology, is owned by us and protected by intellectual property laws. You retain ownership of your uploaded documents.</p>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">8. Service Availability</h3>
                <p>While we strive for 99.9% uptime, we cannot guarantee uninterrupted service. We may perform maintenance that temporarily affects availability, with advance notice when possible.</p>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">9. Limitation of Liability</h3>
                <p>Papierbox is provided "as is" without warranties. We are not liable for any indirect, incidental, or consequential damages arising from your use of the service.</p>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">10. Termination</h3>
                <p>Either party may terminate this agreement at any time. Upon termination, your access to the service will cease, and you may download your documents for a period of 30 days.</p>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">11. Governing Law</h3>
                <p>These terms are governed by German law. Any disputes will be resolved in German courts, with jurisdiction in Berlin, Germany.</p>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">12. Contact Information</h3>
                <p>For questions about these Terms of Service, please contact us at:</p>
                <div className="bg-gray-50 p-4 rounded-xl mt-3">
                  <p><strong>Email:</strong> info@papierbox.eu</p>
                  <p><strong>Address:</strong> Papierbox GmbH, Berlin, Germany</p>
                </div>
              </div>

              <div className="bg-[#29AB87]/10 p-6 rounded-2xl">
                <p className="text-center text-gray-700">
                  By using Papierbox, you acknowledge that you have read, understood, and agree to be bound by these Terms of Service.
                </p>
              </div>
            </div>
          </motion.div>
        </div>
      )}
    </div>
  )
}