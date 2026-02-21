import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error('Missing Supabase environment variables. Please set VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY in your .env file.')
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

export type Document = {
  id: string
  user_id: string
  title: string
  filename: string
  category: string
  file_path: string
  mime_type: string
  file_size: number
  extracted_data: {
    dates?: string[]
    amounts?: string[]
    reference_ids?: string[]
    keywords?: string[]
    due_dates?: string[]
    expiry_dates?: string[]
    payment_dates?: string[]
    renewal_dates?: string[]
  }
  due_date?: string
  amount?: number
  reference_id?: string
  urgency_score?: number
  confidence_score?: number
  created_at: string
  updated_at: string
}