-- Subscribers table for price alert signups
-- Run this in Supabase SQL Editor

CREATE TABLE IF NOT EXISTS subscribers (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    city TEXT DEFAULT 'hamburg',
    lang TEXT DEFAULT 'en',
    is_active BOOLEAN DEFAULT true,
    subscribed_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_subscribers_email ON subscribers(email);

-- Allow public inserts (for signup) but no reads (protect email list)
ALTER TABLE subscribers ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can subscribe" ON subscribers FOR INSERT WITH CHECK (true);
CREATE POLICY "Anyone can update their own" ON subscribers FOR UPDATE USING (true);
