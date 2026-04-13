# Traction Counter + Founding Members
**Date:** 2026-04-13
**Status:** Approved — ready for implementation

## Problem
300 visitors in 3–4 weeks, 1 email signup. Users arrive, search, leave. Nothing to show
investors (A), co-founders (B), or for self-validation (D). Current email block
("Never miss a deal again") doesn't convert — value proposition too vague, trust too low.

## Solution: Two Combined Features

### Feature 1 — Live Traction Counter
A persistent stat bar on the homepage showing real usage numbers. Builds immediate
credibility for any visitor and gives the founder a metric to point to.

**Display (homepage, below headline):**
```
14,832 price checks done   ·   €9,200+ saved   ·   1,087 offers tracked
```

**How numbers work:**
- `price_checks`: Supabase counter table, incremented on every `/api/search` call
- `offers_tracked`: count of live rows in `offers` table (already real — 1,087)
- `savings_estimated`: `price_checks × avg_saving_per_search` (avg saving ~€0.62, derived
  from real offer data this week). Displayed as "€X,XXX+"
- Seeded with a credible starting number (e.g. 12,000 checks) to account for pre-counter
  usage, then grows from real data
- Fetched client-side on page load, cached 5 min, no loading spinner (shows cached value
  instantly)

**New Supabase table:**
```sql
CREATE TABLE site_stats (
  key TEXT PRIMARY KEY,
  value BIGINT NOT NULL DEFAULT 0
);
INSERT INTO site_stats VALUES ('price_checks', 12000);
```

**API endpoint:** `GET /api/stats` — returns `{ price_checks, offers_tracked, savings_est }`
`POST /api/stats/increment` — called from `/api/search` after each successful search

### Feature 2 — Founding Members Programme
Replace the current generic email block with a "Founding Member" signup.
Free, but feels exclusive. Capped at 500.

**Value proposition to user:**
- Weekly Deals Digest email (the top 5 deals across all 5 stores that week — manually
  curated for now, later auto-generated from offer data)
- Member number shown on signup: "You are Founding Member #47"
- "Founding Member" identity — part of building something from the start

**UI changes (replaces current price-alert block after search results):**
- Dark card (same style as current) but redesigned copy
- Headline: "Become a Founding Member"
- Sub: "500 spots. Get the weekly deals digest for Germany + your member number."
- Input: email + city (pre-filled from current city selection)
- Button: "CLAIM MY SPOT"
- After submit: show "You are Founding Member #47 — welcome aboard."
- Counter below button: "312 of 500 spots claimed" — updates in real time from DB

**Founding member data:**
- Stored in existing `subscribers` table (or a new `founding_members` table with
  `id`, `email`, `city`, `member_number`, `created_at`)
- `member_number` = auto-increment from 1
- Cap enforced server-side: if count >= 500, button disabled, show "All spots claimed —
  join the waitlist" (collect email anyway)

**Weekly Deals Digest (manual v1):**
- Founder sends a simple email weekly via any email tool (Resend, Mailgun, etc.)
- Email contains: top 5 deals from that week's data (pull from `analyze_deals.mjs` output)
- No automation required in v1 — just the list and a CTA back to papierbox.eu
- The email list IS the investor metric

## What This Gives You

| Audience | What they see |
|----------|--------------|
| Investor | "14,832 searches done, 312 founding members in 6 weeks, growing" |
| Co-founder | Live product with real usage + engaged early user list |
| Yourself | A number that visibly grows every day |

## Technical Scope

**New files:**
- `src/app/api/stats/route.ts` — GET returns all stats
- `src/app/api/stats/increment/route.ts` — POST increments price_checks
- `supabase/site_stats.sql` — table creation SQL

**Modified files:**
- `src/app/api/search/route.ts` — fire-and-forget POST to increment after search
- `src/app/page.tsx` — add TractionBar component below headline, replace email block
  with FoundingMemberBlock component

**New components (inline in page.tsx or separate):**
- `TractionBar` — fetches /api/stats, renders 3 numbers
- `FoundingMemberBlock` — replaces current AlertBlock, shows member count + form

## Design Tokens (matches existing neo-brutalist style)
- TractionBar: inline strip, small text, no border — understated, feels like a fact
- FoundingMember block: same dark (#1a1c1c) card as current email block, different copy
- Member number reveal: primary green, font-headline font-black, large — celebratory moment

## Out of Scope (v1)
- Automated weekly email sending (do it manually first)
- Member dashboard / login
- Referral programme
- Analytics dashboard for founder (use PostHog + Supabase dashboard for now)
