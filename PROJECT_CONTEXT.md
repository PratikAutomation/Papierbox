# Papierbox — Project Context

## What This Is
Grocery price comparison micro-SaaS for expats/students in Germany.
Users search a product + city → see cheapest prices across supermarkets.
Domain: papierbox.eu (owned)

## Current Status (March 22, 2026)

### DONE
- Next.js 14 project (TypeScript, Tailwind, App Router)
- Stitch-designed UI (glassmorphic header, hero search, price cards, footer)
- Supabase database connected with pg_trgm fuzzy search
- 127 mock offers seeded in Supabase (5 stores, 40 product categories)
- Bilingual synonym table (50+ EN/DE translation pairs)
- search_offers() RPC function working (fuzzy, bilingual, scored)
- API routes query Supabase (not mock data anymore)
- Two-tier result display: green offer cards + gray "Typical Price" cards
- Brand display on cards
- Autocomplete from Supabase
- 25 German university/expat cities in dropdown
- Old mock-data.ts and search.ts deleted
- GitHub repo: github.com/PratikAutomation/Papierbox (pushed)
- Skill created: /deploy-to-github
- Skill created: /create-skill-rest

### TODO (Implementation Plan Tasks 6-10)
- Task 6: Universal scraper (Claude API parsing supermarket HTML)
- Task 7: Regular price estimation (Tier 2)
- Task 8: GitHub Actions cron (Mon + Thu 6AM)
- Task 9: Final cleanup
- Task 10: Deploy to Vercel + papierbox.eu DNS

### TODO (Other)
- Frontend refinement pass
- Anthropic API key setup (user needs to create account)
- Real supermarket data (replaces mock data)

## Tech Stack
- Frontend: Next.js 14, Tailwind CSS, Plus Jakarta Sans + Inter fonts
- Database: Supabase PostgreSQL (free tier)
  - Project: jgtgikvwfwlrhxdbwzdm
  - pg_trgm for fuzzy search
  - Bilingual synonyms table
  - search_offers() RPC function
- Scraper: Python + Anthropic SDK (Claude Haiku for HTML parsing)
- Deployment: Vercel (free tier)
- Automation: GitHub Actions cron
- Domain: papierbox.eu

## File Structure
```
src/
├── app/
│   ├── api/
│   │   ├── search/route.ts      — Queries Supabase RPC, returns two-tier results
│   │   └── autocomplete/route.ts — ILIKE search on product names
│   ├── layout.tsx               — Root layout, Plus Jakarta Sans + Inter fonts
│   ├── page.tsx                 — Main page: search, results, PriceCard, RegularPriceCard
│   └── globals.css
├── lib/
│   ├── supabase.ts              — Supabase client init
│   └── types.ts                 — Offer, SearchResult, Store, City interfaces
scrapers/
├── config.py                    — Store definitions, Claude model settings
├── universal_scraper.py         — TODO: Claude API scraper
├── seed_mock_data.py            — One-time seed script (already run)
├── .env                         — SUPABASE_URL, SUPABASE_SERVICE_KEY (gitignored)
├── .env.example                 — Template
└── requirements.txt             — requests, anthropic, supabase, beautifulsoup4
supabase/
└── schema.sql                   — Full schema + RPC + seed data
docs/superpowers/
├── specs/2026-03-22-data-pipeline-design.md
└── plans/2026-03-22-data-pipeline-implementation.md
```

## Key Design Decisions
1. Claude API as universal HTML parser (not CSS scraping) — resilient to site redesigns
2. pg_trgm in Supabase for fuzzy search (not TypeScript) — professional, scalable
3. Two-tier pricing: real offers (99% accuracy, green) + estimated regular (gray, clearly labeled)
4. Brand-level extraction: "Kerrygold Butter" not just "Butter"
5. 5 national-price supermarkets (Lidl, Aldi, Penny, Kaufland, Netto). Rewe deferred (regional pricing)
6. Replace-on-scrape (no price history for MVP)
7. Mon + Thu scraping schedule via GitHub Actions

## Database Schema (Key Tables)
- stores: 5 rows (Lidl, Aldi Süd, Penny, Kaufland, Netto)
- offers: brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url
- bilingual_synonyms: term + synonyms[] array (50+ entries)
- scrape_logs: store_id, status, offers_count, error_message, duration_ms

## Supabase Credentials
- URL: https://jgtgikvwfwlrhxdbwzdm.supabase.co
- Anon Key: in .env.local
- Service Role Key: in scrapers/.env
- MCP connected: yes

## Cost Target
~€1/month total (Claude API ~€0.50 + domain €0 + everything else free tier)
