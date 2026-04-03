# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project: Papierbox (papierbox.eu)

Grocery price comparison for expats/students in Germany. Users search a product + city and get prices sorted cheapest-first across 5 German supermarkets: Lidl, Aldi Süd, Penny, Kaufland, Netto.

## Development Commands

```bash
npm run dev      # Start dev server at localhost:3000
npm run build    # Production build
npm run start    # Start production server
npm run lint     # Run ESLint
```

No test framework is configured. Scrapers run independently:
```bash
cd scrapers && python upload_prospects.py   # Upload SQL offer files to Supabase
cd scrapers && python universal_scraper.py  # Automated scraper (currently disabled)
```

### Environment Variables Required

```
NEXT_PUBLIC_SUPABASE_URL      # Supabase project URL
NEXT_PUBLIC_SUPABASE_ANON_KEY # Supabase anon key (frontend)
SUPABASE_SERVICE_KEY          # Supabase service key (scrapers only)
ANTHROPIC_API_KEY             # Claude API for search fallback estimates
```

## Tech Stack

- **Frontend/Backend**: Next.js 14 (App Router) + Tailwind CSS (no shadcn/ui)
- **Database**: Supabase (PostgreSQL) with RPC function `search_offers`
- **Data Pipeline**: Manual PDF extraction → Claude → SQL files → `upload_prospects.py`
- **Analytics**: Vercel Analytics + PostHog
- **Deployment**: Vercel
- **Language**: TypeScript (frontend/API), Python (scrapers)

## Architecture

```
Prospect/          - SQL files with weekly offer data per store
scrapers/          - Python scripts for data extraction and upload
  config.py        - Store definitions, Claude prompts, rate limits
  upload_prospects.py - Parses SQL from Prospect/ and uploads to Supabase
src/app/           - Next.js App Router pages and layouts
src/app/api/       - API routes (search, autocomplete, subscribe, contact)
src/components/    - Header, Footer (main UI is in src/app/page.tsx)
src/lib/           - supabase client, TypeScript types
```

Path alias: `@/*` maps to `./src/*` (configured in tsconfig.json).

### Data Flow
1. Download Prospekt PDFs from KaufDa → feed to Claude → get SQL files
2. SQL files stored in `Prospect/` (one per store per week)
3. `scrapers/upload_prospects.py` parses SQL, deletes old store data, batch-inserts new
4. Search API calls Supabase RPC `search_offers` for broad candidates (limit 150)
5. Client-side scoring in `src/app/api/search/route.ts` ranks results with category-aware, word-boundary matching
6. If <2 results, Claude Haiku generates estimated typical prices as fallback

### Key API Endpoints
- `GET /api/search?product=<query>&city=<slug>` — main search, returns offers + regular prices sorted by relevance then price
- `GET /api/autocomplete?q=<query>` — product name suggestions from DB
- `POST /api/subscribe` — email alert signup
- `POST /api/contact` — contact form

### Search Scoring System (`src/app/api/search/route.ts`)
The `scoreProduct()` function uses a tiered scoring system:
- **Tier 1 (200pts)**: Exact query match in product name
- **Tier 2 (150pts)**: Category match (most important for generic searches like "butter")
- **Tier 3 (100pts)**: Brand match (exact word boundary)
- **Tier 4 (30pts/word)**: Individual word matches in product name
- **Strict filter**: For common generic products, category MUST match or score = 0 (prevents "butter croissant" appearing for "butter" search)

### i18n Approach
Inline translation object in `src/app/page.tsx` — `t.en` / `t.de` dictionaries. Language toggle in Header. No i18n library.

## Database

Core table: `offers` — columns include store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url. Uses PostgreSQL GIN index on search_vector for full-text search.

Supporting tables: `stores` (5 chains), `cities`, `store_locations`.

Store IDs: 1=Lidl, 2=Aldi Süd, 3=Penny, 4=Kaufland, 5=Netto.

## Data Pipeline Rules

- Only scrape publicly available weekly offer pages (advertisements)
- Respect robots.txt, rate-limit to 1 req/3sec per domain
- Extract facts only: product name, price, unit, valid dates
- Always attribute source and link back to original offer page
- Manual PDF extraction is preferred (4x more products than automated scraping)

## Key Constraints

- English-first UI with German toggle (target audience: expats/students)
- Mobile-first responsive design
- The entire product is ONE screen: search input + results (`src/app/page.tsx` ~730 lines)
- German legal requirements: must have Impressum and Datenschutz pages
- No supermarket logos — use text names + brand colors only

## Design Tokens

- Primary: #22C55E (green)
- Text/borders: #1a1c1c
- Accent: #FBBF24 (yellow)
- Headline font: Plus Jakarta Sans (`--font-headline`)
- Body font: Inter (`--font-body`)
- Alt headline: Bricolage Grotesque (`--font-headline-alt`)
- Icons: Material Symbols Outlined (loaded via Google Fonts CDN)
- Style: Neo-brutalist (thick borders, shadow-neo, rounded-[2rem+], bold typography)
