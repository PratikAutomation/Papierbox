-- ============================================================
-- SECURITY FIX: Lock down RLS policies
-- Run this in Supabase Dashboard → SQL Editor
-- ============================================================

-- FIX 1: Remove dangerous UPDATE policy on subscribers
-- The subscribe route uses service_role key, so it bypasses RLS anyway.
-- Anon users should NOT be able to update any subscriber record.
DROP POLICY IF EXISTS "Anyone can update their own" ON subscribers;

-- FIX 2: Remove dangerous INSERT policy on subscribers
-- Subscribe route uses service_role key, so anon INSERT is not needed.
DROP POLICY IF EXISTS "Anyone can subscribe" ON subscribers;

-- FIX 3: Lock down price_estimates to service_role only
-- Remove the overly permissive INSERT/UPDATE policies.
-- The compare route now uses service_role key for writes.
DROP POLICY IF EXISTS "Service insert price_estimates" ON price_estimates;
DROP POLICY IF EXISTS "Service update price_estimates" ON price_estimates;

-- Verify: list remaining policies (should only be SELECT/read policies)
SELECT schemaname, tablename, policyname, permissive, roles, cmd
FROM pg_policies
WHERE tablename IN ('subscribers', 'price_estimates', 'offers', 'stores')
ORDER BY tablename, policyname;
