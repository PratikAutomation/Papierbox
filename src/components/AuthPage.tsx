import React, { useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { FileText, Eye, EyeOff, ArrowLeft, Mail, CheckCircle, AlertCircle, Loader2, User } from 'lucide-react'
import { useAuth } from '../hooks/useAuth'

interface AuthPageProps {
  onBack: () => void
}

type AuthStep = 'signin' | 'signup' | 'email-confirmation' | 'forgot-password'

export function AuthPage({ onBack }: AuthPageProps) {
  const [currentStep, setCurrentStep] = useState<AuthStep>('signin')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [firstName, setFirstName] = useState('')
  const [lastName, setLastName] = useState('')
  const [showPassword, setShowPassword] = useState(false)
  const [showConfirmPassword, setShowConfirmPassword] = useState(false)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const { signIn, signUp } = useAuth()

  const validateEmail = (email: string) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    return emailRegex.test(email)
  }

  const validatePassword = (password: string) => {
    return password.length >= 6
  }

  const validateName = (name: string) => {
    return name.trim().length >= 2
  }

  const handleSignIn = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError('')
    setSuccess('')

    if (!validateEmail(email)) {
      setError('Please enter a valid email address')
      setLoading(false)
      return
    }

    if (!validatePassword(password)) {
      setError('Password must be at least 6 characters long')
      setLoading(false)
      return
    }

    try {
      await signIn(email, password)
    } catch (err: any) {
      if (err.message.includes('Invalid login credentials')) {
        setError('Invalid email or password. Please check your credentials and try again.')
      } else if (err.message.includes('Email not confirmed')) {
        setError('Please confirm your email address before signing in. Check your inbox for a confirmation link.')
      } else if (err.message.includes('over_email_send_rate_limit')) {
        setError('Too many requests. Please wait a moment before trying again.')
      } else {
        setError(err.message || 'An error occurred during sign in')
      }
    } finally {
      setLoading(false)
    }
  }

  const handleSignUp = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError('')
    setSuccess('')

    if (!validateName(firstName)) {
      setError('First name must be at least 2 characters long')
      setLoading(false)
      return
    }

    if (!validateName(lastName)) {
      setError('Last name must be at least 2 characters long')
      setLoading(false)
      return
    }

    if (!validateEmail(email)) {
      setError('Please enter a valid email address')
      setLoading(false)
      return
    }

    if (!validatePassword(password)) {
      setError('Password must be at least 6 characters long')
      setLoading(false)
      return
    }

    if (password !== confirmPassword) {
      setError('Passwords do not match')
      setLoading(false)
      return
    }

    try {
      await signUp(email, password, firstName, lastName)
      setCurrentStep('email-confirmation')
      setSuccess('Account created successfully! Please check your email to confirm your account.')
    } catch (err: any) {
      if (err.message.includes('User already registered')) {
        setError('An account with this email already exists. Please sign in instead.')
      } else if (err.message.includes('over_email_send_rate_limit')) {
        setError('Too many requests. Please wait a moment before trying again.')
      } else {
        setError(err.message || 'An error occurred during sign up')
      }
    } finally {
      setLoading(false)
    }
  }

  const resendConfirmation = async () => {
    setLoading(true)
    setError('')
    setSuccess('')

    try {
      await signUp(email, password, firstName, lastName)
      setSuccess('Confirmation email sent! Please check your inbox.')
    } catch (err: any) {
      setError('Failed to resend confirmation email. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-50 via-white to-gray-100 flex items-center justify-center p-4">
      <div className="w-full max-w-md sm:max-w-lg mx-auto">
        <AnimatePresence mode="wait">
          <motion.div
            key={currentStep}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -20 }}
            transition={{ duration: 0.3 }}
            className="bg-white rounded-3xl shadow-2xl border border-gray-100 overflow-hidden"
          >
            {/* Header */}
            <div className="px-6 sm:px-8 pt-6 sm:pt-8 pb-6 sm:pb-8 bg-gradient-to-r from-[#29AB87] to-[#238f73] text-white">
              <button
                onClick={onBack}
                className="flex items-center text-white/80 hover:text-white mb-6 sm:mb-8 text-sm transition-colors"
              >
                <ArrowLeft className="w-4 h-4 mr-2" />
                Back to Home
              </button>
              
              <div className="text-center space-y-3 sm:space-y-4">
                <div className="flex items-center justify-center space-x-3">
                  <div className="w-12 sm:w-14 h-12 sm:h-14 bg-white/20 rounded-2xl flex items-center justify-center backdrop-blur-sm">
                    <FileText className="w-6 sm:w-7 h-6 sm:h-7 text-white" />
                  </div>
                  <span className="text-xl sm:text-2xl md:text-3xl font-bold">Paperbox</span>
                </div>
                
                <div className="space-y-2">
                  <h1 className="text-lg sm:text-xl md:text-2xl font-bold">
                    {currentStep === 'signin' && 'Welcome back'}
                    {currentStep === 'signup' && 'Create your account'}
                    {currentStep === 'email-confirmation' && 'Check your email'}
                    {currentStep === 'forgot-password' && 'Reset password'}
                  </h1>
                  <p className="text-white/90 text-sm sm:text-base">
                    {currentStep === 'signin' && 'Sign in to access your documents'}
                    {currentStep === 'signup' && 'Join thousands of organized users'}
                    {currentStep === 'email-confirmation' && 'We sent you a confirmation link'}
                    {currentStep === 'forgot-password' && 'Enter your email to reset password'}
                  </p>
                </div>
              </div>
            </div>

            <div className="px-6 sm:px-8 py-6 sm:py-8 md:py-10">
              {/* Sign In Form */}
              {currentStep === 'signin' && (
                <form onSubmit={handleSignIn} className="space-y-5 sm:space-y-6">
                  <div>
                    <label htmlFor="signin-email" className="block text-sm sm:text-base font-semibold text-gray-700 mb-2 sm:mb-3">
                      Email Address
                    </label>
                    <input
                      type="email"
                      id="signin-email"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      className="w-full px-4 py-3 sm:py-4 text-gray-900 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] focus:bg-white transition-all duration-200 placeholder-gray-500 text-sm sm:text-base"
                      placeholder="Enter your email address"
                      required
                    />
                  </div>

                  <div>
                    <label htmlFor="signin-password" className="block text-sm sm:text-base font-semibold text-gray-700 mb-2 sm:mb-3">
                      Password
                    </label>
                    <div className="relative">
                      <input
                        type={showPassword ? 'text' : 'password'}
                        id="signin-password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        className="w-full px-4 py-3 sm:py-4 text-gray-900 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] focus:bg-white transition-all duration-200 placeholder-gray-500 pr-12 text-sm sm:text-base"
                        placeholder="Enter your password"
                        required
                      />
                      <button
                        type="button"
                        onClick={() => setShowPassword(!showPassword)}
                        className="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-500 hover:text-gray-700 transition-colors p-1"
                      >
                        {showPassword ? <EyeOff className="w-5 h-5" /> : <Eye className="w-5 h-5" />}
                      </button>
                    </div>
                  </div>

                  {error && (
                    <motion.div
                      initial={{ opacity: 0, y: -10 }}
                      animate={{ opacity: 1, y: 0 }}
                      className="bg-red-50 border border-red-200 text-red-700 px-4 py-3 sm:py-4 rounded-xl flex items-start space-x-3"
                    >
                      <AlertCircle className="w-5 h-5 mt-0.5 flex-shrink-0" />
                      <span className="text-sm sm:text-base">{error}</span>
                    </motion.div>
                  )}

                  <button
                    type="submit"
                    disabled={loading}
                    className="w-full bg-[#29AB87] text-white py-3 sm:py-4 rounded-xl font-semibold hover:bg-[#238f73] transition-all duration-200 disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center space-x-2 shadow-lg hover:shadow-xl text-sm sm:text-base"
                  >
                    {loading ? (
                      <>
                        <Loader2 className="w-5 h-5 animate-spin" />
                        <span>Signing in...</span>
                      </>
                    ) : (
                      <span>Sign In</span>
                    )}
                  </button>

                  <div className="text-center space-y-4 sm:space-y-6">
                    <button
                      type="button"
                      onClick={() => setCurrentStep('forgot-password')}
                      className="text-[#29AB87] font-medium hover:text-[#238f73] text-sm sm:text-base transition-colors"
                    >
                      Forgot your password?
                    </button>
                    
                    <div className="flex items-center">
                      <div className="flex-1 border-t border-gray-200"></div>
                      <span className="px-4 text-gray-500 text-sm sm:text-base">or</span>
                      <div className="flex-1 border-t border-gray-200"></div>
                    </div>
                    
                    <p className="text-gray-600 text-sm sm:text-base">
                      Don't have an account?{' '}
                      <button
                        type="button"
                        onClick={() => setCurrentStep('signup')}
                        className="text-[#29AB87] font-semibold hover:text-[#238f73] transition-colors"
                      >
                        Create one now
                      </button>
                    </p>
                  </div>
                </form>
              )}

              {/* Sign Up Form */}
              {currentStep === 'signup' && (
                <form onSubmit={handleSignUp} className="space-y-4 sm:space-y-5">
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                      <label htmlFor="first-name" className="block text-sm sm:text-base font-semibold text-gray-700 mb-2">
                        First Name
                      </label>
                      <div className="relative">
                        <input
                          type="text"
                          id="first-name"
                          value={firstName}
                          onChange={(e) => setFirstName(e.target.value)}
                          className="w-full px-4 py-3 text-gray-900 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] focus:bg-white transition-all duration-200 placeholder-gray-500 text-sm sm:text-base pl-10"
                          placeholder="John"
                          required
                        />
                        <User className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                      </div>
                    </div>
                    
                    <div>
                      <label htmlFor="last-name" className="block text-sm sm:text-base font-semibold text-gray-700 mb-2">
                        Last Name
                      </label>
                      <div className="relative">
                        <input
                          type="text"
                          id="last-name"
                          value={lastName}
                          onChange={(e) => setLastName(e.target.value)}
                          className="w-full px-4 py-3 text-gray-900 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] focus:bg-white transition-all duration-200 placeholder-gray-500 text-sm sm:text-base pl-10"
                          placeholder="Doe"
                          required
                        />
                        <User className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                      </div>
                    </div>
                  </div>

                  <div>
                    <label htmlFor="signup-email" className="block text-sm sm:text-base font-semibold text-gray-700 mb-2">
                      Email Address
                    </label>
                    <input
                      type="email"
                      id="signup-email"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      className="w-full px-4 py-3 text-gray-900 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] focus:bg-white transition-all duration-200 placeholder-gray-500 text-sm sm:text-base"
                      placeholder="john.doe@example.com"
                      required
                    />
                  </div>

                  <div>
                    <label htmlFor="signup-password" className="block text-sm sm:text-base font-semibold text-gray-700 mb-2">
                      Password
                    </label>
                    <div className="relative">
                      <input
                        type={showPassword ? 'text' : 'password'}
                        id="signup-password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        className="w-full px-4 py-3 text-gray-900 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] focus:bg-white transition-all duration-200 placeholder-gray-500 pr-12 text-sm sm:text-base"
                        placeholder="Create a strong password"
                        required
                      />
                      <button
                        type="button"
                        onClick={() => setShowPassword(!showPassword)}
                        className="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-500 hover:text-gray-700 transition-colors p-1"
                      >
                        {showPassword ? <EyeOff className="w-5 h-5" /> : <Eye className="w-5 h-5" />}
                      </button>
                    </div>
                    <p className="text-xs sm:text-sm text-gray-500 mt-1">Must be at least 6 characters long</p>
                  </div>

                  <div>
                    <label htmlFor="confirm-password" className="block text-sm sm:text-base font-semibold text-gray-700 mb-2">
                      Confirm Password
                    </label>
                    <div className="relative">
                      <input
                        type={showConfirmPassword ? 'text' : 'password'}
                        id="confirm-password"
                        value={confirmPassword}
                        onChange={(e) => setConfirmPassword(e.target.value)}
                        className="w-full px-4 py-3 text-gray-900 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] focus:bg-white transition-all duration-200 placeholder-gray-500 pr-12 text-sm sm:text-base"
                        placeholder="Confirm your password"
                        required
                      />
                      <button
                        type="button"
                        onClick={() => setShowConfirmPassword(!showConfirmPassword)}
                        className="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-500 hover:text-gray-700 transition-colors p-1"
                      >
                        {showConfirmPassword ? <EyeOff className="w-5 h-5" /> : <Eye className="w-5 h-5" />}
                      </button>
                    </div>
                  </div>

                  {error && (
                    <motion.div
                      initial={{ opacity: 0, y: -10 }}
                      animate={{ opacity: 1, y: 0 }}
                      className="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-xl flex items-start space-x-3"
                    >
                      <AlertCircle className="w-5 h-5 mt-0.5 flex-shrink-0" />
                      <span className="text-sm sm:text-base">{error}</span>
                    </motion.div>
                  )}

                  <button
                    type="submit"
                    disabled={loading}
                    className="w-full bg-[#29AB87] text-white py-3 sm:py-4 rounded-xl font-semibold hover:bg-[#238f73] transition-all duration-200 disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center space-x-2 shadow-lg hover:shadow-xl text-sm sm:text-base"
                  >
                    {loading ? (
                      <>
                        <Loader2 className="w-5 h-5 animate-spin" />
                        <span>Creating account...</span>
                      </>
                    ) : (
                      <span>Create Account</span>
                    )}
                  </button>

                  <div className="text-center">
                    <div className="flex items-center mb-4">
                      <div className="flex-1 border-t border-gray-200"></div>
                      <span className="px-4 text-gray-500 text-sm sm:text-base">or</span>
                      <div className="flex-1 border-t border-gray-200"></div>
                    </div>
                    
                    <p className="text-gray-600 text-sm sm:text-base">
                      Already have an account?{' '}
                      <button
                        type="button"
                        onClick={() => setCurrentStep('signin')}
                        className="text-[#29AB87] font-semibold hover:text-[#238f73] transition-colors"
                      >
                        Sign in here
                      </button>
                    </p>
                  </div>
                </form>
              )}

              {/* Email Confirmation */}
              {currentStep === 'email-confirmation' && (
                <div className="text-center space-y-6 sm:space-y-8">
                  <div className="w-20 h-20 sm:w-24 sm:h-24 bg-[#29AB87]/10 rounded-full flex items-center justify-center mx-auto">
                    <Mail className="w-10 h-10 text-[#29AB87]" />
                  </div>
                  
                  <div>
                    <h3 className="text-lg sm:text-xl font-semibold text-gray-900 mb-3">Check your email</h3>
                    <p className="text-gray-600 text-sm sm:text-base leading-relaxed">
                      We've sent a confirmation link to <strong>{email}</strong>
                    </p>
                  </div>

                  <div className="bg-blue-50 border border-blue-200 rounded-xl p-4 sm:p-6">
                    <div className="flex items-start space-x-3">
                      <CheckCircle className="w-5 h-5 text-blue-600 mt-0.5 flex-shrink-0" />
                      <div className="text-left">
                        <p className="text-blue-800 font-medium text-sm sm:text-base mb-2">Next steps:</p>
                        <ol className="text-blue-700 text-sm sm:text-base space-y-1 list-decimal list-inside">
                          <li>Check your email inbox (and spam folder)</li>
                          <li>Click the confirmation link in the email</li>
                          <li>Return here and sign in with your credentials</li>
                        </ol>
                      </div>
                    </div>
                  </div>

                  {success && (
                    <motion.div
                      initial={{ opacity: 0, y: -10 }}
                      animate={{ opacity: 1, y: 0 }}
                      className="bg-green-50 border border-green-200 text-green-700 px-4 py-3 sm:py-4 rounded-xl flex items-start space-x-3"
                    >
                      <CheckCircle className="w-5 h-5 mt-0.5 flex-shrink-0" />
                      <span className="text-sm sm:text-base">{success}</span>
                    </motion.div>
                  )}

                  {error && (
                    <motion.div
                      initial={{ opacity: 0, y: -10 }}
                      animate={{ opacity: 1, y: 0 }}
                      className="bg-red-50 border border-red-200 text-red-700 px-4 py-3 sm:py-4 rounded-xl flex items-start space-x-3"
                    >
                      <AlertCircle className="w-5 h-5 mt-0.5 flex-shrink-0" />
                      <span className="text-sm sm:text-base">{error}</span>
                    </motion.div>
                  )}

                  <div className="space-y-3 sm:space-y-4">
                    <button
                      onClick={resendConfirmation}
                      disabled={loading}
                      className="w-full bg-gray-100 text-gray-700 py-3 sm:py-4 rounded-xl font-medium hover:bg-gray-200 transition-all duration-200 disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center space-x-2 text-sm sm:text-base"
                    >
                      {loading ? (
                        <>
                          <Loader2 className="w-5 h-5 animate-spin" />
                          <span>Sending...</span>
                        </>
                      ) : (
                        <span>Resend confirmation email</span>
                      )}
                    </button>
                    
                    <button
                      onClick={() => setCurrentStep('signin')}
                      className="w-full bg-[#29AB87] text-white py-3 sm:py-4 rounded-xl font-semibold hover:bg-[#238f73] transition-all duration-200 shadow-lg hover:shadow-xl text-sm sm:text-base"
                    >
                      Back to Sign In
                    </button>
                  </div>
                </div>
              )}

              {/* Forgot Password */}
              {currentStep === 'forgot-password' && (
                <div className="text-center space-y-6 sm:space-y-8">
                  <div className="w-20 h-20 sm:w-24 sm:h-24 bg-[#29AB87]/10 rounded-full flex items-center justify-center mx-auto">
                    <Mail className="w-10 h-10 text-[#29AB87]" />
                  </div>
                  
                  <div>
                    <h3 className="text-lg sm:text-xl font-semibold text-gray-900 mb-3">Reset your password</h3>
                    <p className="text-gray-600 text-sm sm:text-base">
                      Enter your email address and we'll send you a link to reset your password.
                    </p>
                  </div>

                  <form onSubmit={(e) => e.preventDefault()} className="space-y-4 sm:space-y-6">
                    <input
                      type="email"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      className="w-full px-4 py-3 sm:py-4 text-gray-900 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#29AB87] focus:border-[#29AB87] focus:bg-white transition-all duration-200 placeholder-gray-500 text-sm sm:text-base"
                      placeholder="Enter your email address"
                      required
                    />
                    
                    <button
                      type="submit"
                      className="w-full bg-[#29AB87] text-white py-3 sm:py-4 rounded-xl font-semibold hover:bg-[#238f73] transition-all duration-200 shadow-lg hover:shadow-xl text-sm sm:text-base"
                    >
                      Send Reset Link
                    </button>
                  </form>

                  <button
                    onClick={() => setCurrentStep('signin')}
                    className="text-[#29AB87] font-medium hover:text-[#238f73] text-sm sm:text-base transition-colors"
                  >
                    Back to Sign In
                  </button>
                </div>
              )}
            </div>
          </motion.div>
        </AnimatePresence>
      </div>
    </div>
  )
}