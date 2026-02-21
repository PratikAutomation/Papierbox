import React, { useState } from 'react'
import { HomePage } from './components/HomePage'
import { AuthPage } from './components/AuthPage'
import { Dashboard } from './components/Dashboard'
import { useAuth } from './hooks/useAuth'

function App() {
  const [currentPage, setCurrentPage] = useState<'home' | 'auth'>('home')
  const { user, loading } = useAuth()

  if (loading) {
    return (
      <div className="min-h-screen bg-white flex items-center justify-center">
        <div className="relative">
          <div className="animate-spin rounded-full h-12 w-12 border-4 border-[#29AB87]/20"></div>
          <div className="animate-spin rounded-full h-12 w-12 border-4 border-[#29AB87] border-t-transparent absolute top-0"></div>
        </div>
      </div>
    )
  }

  if (user) {
    return <Dashboard />
  }

  // When user signs out, always return to home page
  if (currentPage === 'auth') {
    return <AuthPage onBack={() => setCurrentPage('home')} />
  }

  return <HomePage onGetStarted={() => setCurrentPage('auth')} />
}

export default App