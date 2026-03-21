# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project: GrocerySpy.de

Supermarket price comparison for expats/students in Germany. Users search a product + city and get prices sorted cheapest-first across major German supermarkets.

## Tech Stack

- **Frontend/Backend**: Next.js 14 (App Router) + Tailwind CSS + shadcn/ui
- **Database**: Supabase (PostgreSQL)
- **Data Pipeline**: Python scrapers (BeautifulSoup/Playwright) + Claude API for fallback extraction
- **Deployment**: Vercel
- **Language**: TypeScript (frontend/API), Python (scrapers)

## Architecture

```
scrapers/          - Python scripts, one per supermarket (lidl.py, aldi.py, etc.)
src/app/           - Next.js App Router pages and layouts
src/app/api/       - API routes (search endpoint, autocomplete)
src/components/    - React components (SearchBar, ResultCard, CitySelector)
src/lib/           - Shared utilities (supabase client, types, search helpers)
```

### Data Flow
1. Python scrapers fetch weekly offers from supermarket public "Angebote" pages
2. Scrapers normalize data and insert into Supabase `offers` table
3. Next.js API routes query Supabase with full-text search
4. Frontend renders sorted price results

### Key API Endpoint
- `GET /api/search?product=<query>&city=<slug>` — returns offers sorted by price ascending

## Data Pipeline Rules

- Only scrape publicly available weekly offer pages (advertisements)
- Respect robots.txt, rate-limit to 1 req/3sec per domain
- Extract facts only: product name, price, unit, valid dates
- No copyrighted images or brochure layouts
- Always attribute source and link back to original offer page
- Scrapers run on cron: once daily or when new Prospekte drop (Mon/Thu)

## Database

Core table is `offers` with columns: store_id, product_name, product_name_en, product_name_normalized, price, original_price, unit, valid_from, valid_to, source_url. Uses PostgreSQL GIN index on search_vector for full-text search.

Supporting tables: `stores` (6 supermarket chains), `cities`, `store_locations`.

## Target Supermarkets (MVP)

Lidl, Aldi Sud, Penny, Kaufland, Netto, Rewe. First five have national pricing (same everywhere). Rewe is regional.

## Key Constraints

- English-first UI with German toggle (target audience: expats/students)
- Mobile-first responsive design
- The entire product is ONE screen: search input + results. No navigation, no multi-page flows.
- German legal requirements: must have Impressum and Datenschutz pages
- No supermarket logos without permission — use text names + brand colors only
