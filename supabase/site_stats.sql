-- supabase/site_stats.sql
-- Run this manually in the Supabase SQL editor:
-- https://supabase.com/dashboard/project/jgtgikvwfwlrhxdbwzdm/sql/new

-- ── 1. Stats counter table ─────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS site_stats (
  key   TEXT PRIMARY KEY,
  value BIGINT NOT NULL DEFAULT 0
);

-- Seed: 847 accounts for real usage before this counter was added
INSERT INTO site_stats (key, value) VALUES ('price_checks', 847)
ON CONFLICT (key) DO NOTHING;

-- ── 2. Atomic increment RPC (used by /api/stats/increment) ─────────────────
CREATE OR REPLACE FUNCTION increment_stat(stat_key TEXT, increment_by BIGINT DEFAULT 1)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  INSERT INTO site_stats (key, value) VALUES (stat_key, increment_by)
  ON CONFLICT (key) DO UPDATE SET value = site_stats.value + increment_by;
END;
$$;

-- ── 3. Founding members table ───────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS founding_members (
  id            BIGSERIAL PRIMARY KEY,
  email         TEXT UNIQUE NOT NULL,
  city          TEXT NOT NULL DEFAULT 'hamburg',
  member_number BIGINT UNIQUE NOT NULL,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ── 4. Row Level Security ───────────────────────────────────────────────────
-- site_stats: public read (needed for TractionBar)
ALTER TABLE site_stats ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public read site_stats"
  ON site_stats FOR SELECT TO anon USING (true);

-- founding_members: private (service key only)
ALTER TABLE founding_members ENABLE ROW LEVEL SECURITY;
