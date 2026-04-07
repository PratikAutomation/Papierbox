# Papierbox — Developer Guide

**URL:** https://www.papierbox.eu
**What:** Grocery price comparison for expats/students in Germany. Search a product → see prices across 5 supermarkets sorted cheapest-first.

## Quick Start

```bash
nvm use v20.20.1        # Required — Node 20+
npm install
npm run dev             # localhost:3000
```

Create `.env.local`:
```
NEXT_PUBLIC_SUPABASE_URL=https://jgtgikvwfwlrhxdbwzdm.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=<anon key from Supabase dashboard>
SUPABASE_SERVICE_KEY=<service role key — for API routes only>
ANTHROPIC_API_KEY=<Claude API key — for search normalization + price estimates>
```

## Tech Stack

| Layer | Tech |
|-------|------|
| Framework | Next.js 14 (App Router) |
| Language | TypeScript |
| Styling | Tailwind CSS (neo-brutalist design) |
| Database | Supabase (PostgreSQL) |
| AI | Claude API (search normalization, OCR, price estimates) |
| Analytics | Vercel Analytics + PostHog (EU) |
| Deployment | Vercel (auto-deploy on push to main) |
| Domain | papierbox.eu (Vercel DNS) |

## Project Structure

```
src/
├── app/
│   ├── page.tsx                    # Main app — search + compare (1183 lines)
│   ├── layout.tsx                  # Root layout, fonts, PostHog, meta tags
│   ├── globals.css                 # Tailwind + custom animations
│   ├── api/
│   │   ├── search/route.ts         # GET — product search with scoring (478 lines)
│   │   ├── compare/route.ts        # POST — smart basket comparison (287 lines)
│   │   ├── autocomplete/route.ts   # GET — search suggestions
│   │   ├── subscribe/route.ts      # POST — email alerts (rate limited)
│   │   └── contact/route.ts        # POST — contact form (rate limited)
│   ├── contact/page.tsx
│   ├── how-it-works/page.tsx
│   ├── story/page.tsx
│   ├── impressum/page.tsx          # Legal requirement (Germany)
│   └── privacy/page.tsx            # Legal requirement (Germany)
├── components/
│   ├── Header.tsx
│   └── Footer.tsx
└── lib/
    ├── supabase.ts                 # Supabase client (anon key)
    ├── types.ts                    # All TypeScript interfaces
    ├── claude-normalize.ts         # Local normalizer + Claude API (320 lines)
    └── price-matrix.ts             # Store ranking algorithm (153 lines)

Prospect/                           # Weekly SQL offer files per store
├── Prospects_bis_11/               # Current week's data
├── EXTRACT_INSTRUCTIONS.md         # How to extract from PDFs
scrapers/
├── config.py                       # Store definitions
├── upload_prospects.py             # SQL → Supabase uploader
supabase/
├── schema.sql                      # DB schema + RLS policies
├── subscribers.sql                 # Subscribers table
├── fix-rls-policies.sql            # Security fixes
docs/
├── DEVELOPER_GUIDE.md              # This file
marketing/                          # Instagram posts (excluded from build)
```

## Two Core Features

### 1. Product Search (default tab)
User types product name + selects city → sees offers sorted cheapest-first.

**Flow:**
```
User query ("milk")
  → Claude normalizes: {de: "Milch", en: "milk", category: "Dairy"}
  → Supabase RPC `search_offers` (pg_trgm fuzzy match, limit 150)
  → scoreProduct() ranks results (word-boundary + category scoring)
  → If <2 results: Claude estimates typical prices as fallback
  → Response: offers[] + regularPrices[] sorted by score then price
```

**Scoring system** (`scoreProduct()` in search/route.ts):
- Standalone word match in name: 250pts ("Milch" in "Haltbare Milch")
- Compound suffix match: 200pts ("schokolade" in "Tafelschokolade")
- Compound prefix match: 50pts ("milch" in "Milchreis")
- Exact category match: 150pts
- Broad category match: 30pts
- Brand match: 100pts
- Word-level matches: 40pts (standalone) or 15pts (stem)
- Strict filter: generic products (milk, butter, rice...) require category match or score = 0

### 2. Smart Basket / Compare (second tab)
User inputs a grocery list (text or photo) → gets single best supermarket recommendation.

**Flow:**
```
User input (text list or photo)
  → Photo? Claude Vision OCR → text items
  → normalizeItems() via Claude: parse quantities, translate, categorize
  → For each item: search Supabase → pickBestMatch()
  → Missing items: Claude estimates prices per store
  → buildPriceMatrix(): rank stores by total_cost * (1 + (1-offer_ratio)*0.15)
  → Response: store rankings + item breakdown
```

## Database

**Supabase project:** `jgtgikvwfwlrhxdbwzdm`

### Tables

| Table | Purpose |
|-------|---------|
| `offers` | Core — all product offers/prices (~634 rows, refreshed weekly) |
| `stores` | 5 supermarket chains (static) |
| `cities` | Supported cities |
| `store_locations` | Physical store addresses |
| `subscribers` | Email alert signups |
| `contact_messages` | Contact form submissions |
| `price_estimates` | Cached Claude price estimates (7-day TTL) |

### Store IDs
| ID | Store | Brand Color |
|----|-------|-------------|
| 1 | Lidl | #0050AA |
| 2 | Aldi Süd | #00005F |
| 3 | Penny | #CD1719 |
| 4 | Kaufland | #E10915 |
| 5 | Netto | #c4b800 |

### Key RPC
`search_offers(search_query, city_slug, result_limit)` — uses pg_trgm for fuzzy text search, returns candidates with similarity scores.

## Data Pipeline

Weekly manual process (~45 min):

1. Download Prospekt PDFs from **kaufda.de** for each store
2. Upload PDF to **claude.ai** (free tier works) + paste store-specific prompt from `Prospect/EXTRACT_INSTRUCTIONS.md`
3. Claude outputs SQL INSERT statements
4. Save as `[store]_offers_YYYY_MM_DD.sql` in `Prospect/`
5. Upload to Supabase (via SQL Editor or the Node.js upload script)

**Schedule:** Sunday evening (Mon offers: Lidl, Aldi, Penny, Netto), Wednesday evening (Thu offers: Lidl, Kaufland)

## Security

- Rate limiting on POST endpoints (subscribe: 5/min, contact: 3/min per IP)
- Supabase RLS: anon key = read-only on offers/stores. Service key for writes.
- Security headers: X-Frame-Options, X-Content-Type-Options, etc.
- Image upload validation: max 5MB on compare endpoint
- ANTHROPIC_API_KEY is server-side only (not NEXT_PUBLIC_)
- Input sanitization + length limits on all user inputs

## Design System

| Token | Value |
|-------|-------|
| Primary Green | #22C55E |
| Dark Text | #1a1c1c |
| Accent Yellow | #FBBF24 |
| Headline Font | Plus Jakarta Sans |
| Body Font | Inter |
| Alt Headline | Bricolage Grotesque |
| Icons | Material Symbols Outlined (Google Fonts CDN) |
| Style | Neo-brutalist — thick 3px borders, `shadow-neo`, rounded-[2rem+] |

## i18n

No library. Inline `t` object in `page.tsx` with `t.en` / `t.de` dictionaries. Language toggle in Header component. English-first (target: expats/international students in Germany).

## Common Commands

```bash
npm run dev          # Dev server
npm run build        # Production build
npm run lint         # ESLint
npx tsc --noEmit     # Type check only
git push origin main # Deploy (Vercel auto-deploys)
```

## Key Decisions & Gotchas

- **One-page app:** The entire product lives in `page.tsx`. Search + Compare are tab-toggled, not separate routes.
- **No test framework:** Verification is manual + TypeScript + ESLint.
- **marketing/ folder:** Excluded from tsconfig (has pre-existing type errors from Remotion files). Don't import from it.
- **German compound words** are the #1 search quality challenge. "Milchreis" contains "Milch" but is NOT milk. The scoring system handles this with standalone vs compound word detection.
- **Claude API is optional.** Local normalizer in `claude-normalize.ts` handles basic EN→DE translation, plurals, typos. Claude enhances with better category hints and brand detection.
- **Offers expire weekly.** If data isn't refreshed by Monday, users see empty results. This is the #1 operational risk.
