# Papierbox — Project Context

## What This Is
Grocery price comparison micro-SaaS for expats/students in Germany.
Users search a product + city → see cheapest prices across supermarkets.
Domain: www.papierbox.eu (primary), papierbox.eu (redirects to www)
GitHub: github.com/PratikAutomation/Papierbox

## Current Status (March 23, 2026) — LIVE IN PRODUCTION

### ALL 10 TASKS COMPLETE
- Task 1: Supabase + pg_trgm + RPC function — DONE
- Task 2: Mock data seeded (127 offers) — DONE
- Task 3: Types updated (brand, category, isOffer) — DONE
- Task 4: API routes → Supabase — DONE
- Task 5: Neo-brutalist frontend + EN/DE + 5 pages — DONE
- Task 6: Universal scraper (Claude API) — DONE
- Task 7: Regular price estimation (Tier 2) — DONE
- Task 8: GitHub Actions cron (Mon + Thu) — DONE + TESTED
- Task 9: Old files cleaned up — DONE
- Task 10: Deploy to Vercel + papierbox.eu — DONE + LIVE

### ADDITIONAL FEATURES BUILT
- Neo-brutalist redesign from Google Stitch (shadow-neo, grainy-bg, squiggle)
- EN/DE one-click translation across entire site
- 5 pages: Home, Our Story, How It Works, Impressum, Privacy Policy
- Real logo integrated (header, footer, favicon)
- Smart email capture (price alert card below search results)
- Subscribers table in Supabase with RLS
- POST /api/subscribe endpoint (service role key for writes)
- Comprehensive SEO (robots.txt, sitemap, OG tags, JSON-LD, per-page metadata)
- Google Search Console submitted
- Success Matrix (docs/SUCCESS_MATRIX.md)
- Scraper improvements: JSON-LD extraction, inline JS data, retry logic

### REAL DATA IN PRODUCTION
- 77 real scraped offers (Aldi Süd: 44, Kaufland: 24, Penny: 6, Lidl: 2, Netto: 1)
- 74 estimated regular prices (Claude-generated)
- 42 unique brands (Kerrygold, Barilla, FERRERO, Heinz, HARIBO, Milka, etc.)
- 26 unique categories
- 1 email subscriber (owner)

### KNOWN ISSUES
- Lidl scraping: JS-rendered pages, getting only 2 offers (needs Playwright or API discovery)
- Netto scraping: only 1 offer extracted
- Penny: 6 offers (partial)
- Google/Bing showing old cached content from previous Netlify/bolt.new site (resolving within 24-48h)
- City dropdown default still showing Hamburg on some cached deploys (should be blank)

### TODO (Next Steps)
- Get first 100 users: post in 5 expat Facebook groups + Reddit
- Improve scraping for Lidl, Penny, Netto (find API endpoints or use Playwright)
- Create OG image (1200x630) for social media sharing
- Add Vercel Analytics for tracking
- Start weekly "Best Deals" newsletter once 50+ subscribers
- Consider adding Rewe (regional pricing)

## Tech Stack
- Frontend: Next.js 14, Tailwind CSS, Plus Jakarta Sans + Inter + Bricolage Grotesque fonts
- Design: Neo-brutalist (shadow-neo, border-4, grainy-bg, squiggle underlines)
- Database: Supabase PostgreSQL (free tier)
  - Project ref: jgtgikvwfwlrhxdbwzdm
  - pg_trgm for fuzzy search
  - Bilingual synonyms table (50+ entries)
  - search_offers() RPC function
  - subscribers table with RLS
- Scraper: Python + Anthropic SDK (Claude Haiku primary, Sonnet fallback)
- Deployment: Vercel (free tier)
- Automation: GitHub Actions cron (Mon + Thu 5:00 UTC / 6:00 CET)
- Domain: www.papierbox.eu (GoDaddy registrar)

## File Structure
```
src/
├── app/
│   ├── api/
│   │   ├── search/route.ts        — Supabase RPC search, two-tier results
│   │   ├── autocomplete/route.ts  — ILIKE product name search
│   │   └── subscribe/route.ts     — Email capture (service role key)
│   ├── story/page.tsx             — Our Story (personal expat narrative)
│   ├── how-it-works/page.tsx      — 3-step explanation
│   ├── impressum/page.tsx         — Legal (§5 TMG)
│   ├── privacy/page.tsx           — GDPR privacy policy
│   ├── sitemap.ts                 — Dynamic sitemap for SEO
│   ├── layout.tsx                 — Root layout, SEO meta, JSON-LD, fonts
│   ├── page.tsx                   — Main search page (neo-brutalist)
│   └── globals.css                — Neo-brutalist CSS classes
├── components/
│   ├── Header.tsx                 — Logo + EN/DE toggle
│   └── Footer.tsx                 — Links, logo, region pill
├── lib/
│   ├── supabase.ts                — Supabase client (anon key)
│   └── types.ts                   — Offer, SearchResult, Store, City
scrapers/
├── config.py                      — 5 stores, Claude model, rate limits
├── universal_scraper.py           — Claude API HTML parser + Supabase insert
├── estimate_regular_prices.py     — Tier 2 typical prices via Claude
├── seed_mock_data.py              — One-time seed (already run)
├── debug_fetch.py                 — URL content checker
├── find_urls.py                   — URL discovery for stores
├── test_connection.py             — API + Supabase connectivity test
├── .env                           — API keys (gitignored)
└── requirements.txt               — Python deps
supabase/
├── schema.sql                     — Tables, indexes, RPC, RLS, seed data
└── subscribers.sql                — Subscribers table + policies
.github/workflows/
└── scrape-offers.yml              — Mon + Thu cron automation
public/
├── logo.png                       — Brand logo (1292x708)
└── robots.txt                     — SEO crawl directives
docs/
├── SUCCESS_MATRIX.md              — 5-dimension scoring system
└── superpowers/
    ├── specs/2026-03-22-data-pipeline-design.md
    └── plans/2026-03-22-data-pipeline-implementation.md
```

## Key Design Decisions
1. Claude API as universal HTML parser (not CSS scraping) — resilient to redesigns
2. pg_trgm in Supabase for fuzzy search — professional, in-database
3. Two-tier pricing: real offers (green, 99% accuracy) + estimated regular (gray, labeled)
4. Brand-level extraction: "Kerrygold Butter" not just "Butter"
5. 5 national-price supermarkets. Rewe deferred (regional pricing)
6. Replace-on-scrape (no price history for MVP)
7. Mon + Thu scraping via GitHub Actions
8. Neo-brutalist design (unique, memorable, Gen-Z oriented)
9. English-first with one-click German toggle
10. Email capture as "Price Alert" not "Newsletter" (higher conversion)

## Supabase
- URL: https://jgtgikvwfwlrhxdbwzdm.supabase.co
- Anon Key: in .env.local (NEXT_PUBLIC_SUPABASE_ANON_KEY)
- Service Role Key: in scrapers/.env + Vercel env var (SUPABASE_SERVICE_KEY)
- Tables: stores, offers, bilingual_synonyms, scrape_logs, subscribers

## Vercel
- Project connected to GitHub (auto-deploy on push)
- Env vars: NEXT_PUBLIC_SUPABASE_URL, NEXT_PUBLIC_SUPABASE_ANON_KEY, SUPABASE_SERVICE_KEY

## GitHub Actions Secrets
- ANTHROPIC_API_KEY, SUPABASE_URL, SUPABASE_SERVICE_KEY

## Skills Created
- /deploy-to-github — commits and pushes after feature completion
- /create-skill-rest — scaffolds REST API endpoints

## Cost
- Current: ~€1/month (Claude API ~€0.50, everything else free tier)
- Domain: already owned (GoDaddy)

## Success Score (Launch Day)
- Data Quality: 45/100
- Search Quality: 70/100
- User Engagement: 0/100 (just launched)
- Growth: 0/100 (no marketing yet)
- Infrastructure: 90/100
- Composite: 38/100 (normal for Day 1, target 60+ by Month 1)
