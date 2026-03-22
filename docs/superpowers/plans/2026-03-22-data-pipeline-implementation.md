# Data Pipeline Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Connect Papierbox to real supermarket data via Claude API parsing, Supabase database with pg_trgm fuzzy search, and automated GitHub Actions scraping.

**Architecture:** Universal Python scraper fetches HTML from 5 German supermarket offer pages, sends to Claude API for structured extraction (brand, product, price, category), validates and stores in Supabase PostgreSQL. Next.js API routes query Supabase via RPC function with pg_trgm fuzzy matching and bilingual synonyms. Two-tier display: real offers (green) + estimated regular prices (gray). GitHub Actions cron runs Mon + Thu.

**Tech Stack:** Python 3.12, Anthropic SDK, Supabase (PostgreSQL + pg_trgm), Next.js 14, TypeScript, GitHub Actions

**Spec:** `docs/superpowers/specs/2026-03-22-data-pipeline-design.md`

---

## File Map

### Files to CREATE
```
src/lib/supabase.ts                     — Supabase client initialization
scrapers/universal_scraper.py           — Claude API-powered scraper for all stores
scrapers/estimate_regular_prices.py     — Tier 2 regular price estimation
scrapers/.env.example                   — Environment variable template
supabase/schema.sql                     — Full database schema + RPC function + seed data
.github/workflows/scrape-offers.yml     — Cron automation workflow
```

### Files to MODIFY
```
src/lib/types.ts                        — Add brand, category, isOffer fields
src/app/api/search/route.ts             — Switch from mock-data to Supabase RPC
src/app/api/autocomplete/route.ts       — Switch from mock-data to Supabase query
src/app/page.tsx                        — Two-tier result display (offers vs estimates)
scrapers/config.py                      — Update store configs for universal scraper
scrapers/requirements.txt               — Add anthropic, supabase dependencies
package.json                            — Add @supabase/supabase-js dependency
.gitignore                              — Add .env files
```

### Files to DELETE (after migration verified)
```
src/lib/mock-data.ts                    — Replaced by Supabase
src/lib/search.ts                       — Replaced by Supabase pg_trgm RPC
scrapers/base_scraper.py                — Replaced by universal_scraper.py
scrapers/lidl_scraper.py                — Replaced by universal_scraper.py
scrapers/run_all.py                     — Replaced by universal_scraper.py
```

---

## Task 1: Supabase Project Setup & Schema

**Files:**
- Create: `supabase/schema.sql`
- Create: `src/lib/supabase.ts`
- Modify: `package.json`
- Modify: `.gitignore`

**Prerequisite:** User must create a Supabase project at supabase.com (free tier) and provide the project URL + anon key + service role key.

- [ ] **Step 1: Create Supabase project**

Go to https://supabase.com, create a new project called "papierbox". Note:
- Project URL (e.g., `https://xxx.supabase.co`)
- Anon key (public, for frontend)
- Service role key (private, for scraper writes)

- [ ] **Step 2: Install Supabase JS client**

```bash
cd /mnt/c/petroject/Project_1
npm install @supabase/supabase-js
```

- [ ] **Step 3: Create the schema SQL file**

Create `supabase/schema.sql` with the full schema from the design spec:
- Enable pg_trgm extension
- Create tables: stores, offers (with brand, category, is_offer columns), bilingual_synonyms, scrape_logs
- Create GIN indexes for pg_trgm fuzzy search on product_name_normalized, brand, category
- Create the `search_offers()` RPC function
- Insert store seed data (5 stores: Lidl, Aldi Sud, Penny, Kaufland, Netto)
- Insert bilingual synonym seed data (50+ entries, both EN→DE and DE→EN)
- Enable row-level security with public read policies

- [ ] **Step 4: Run schema in Supabase SQL Editor**

Go to Supabase Dashboard → SQL Editor → paste and run `supabase/schema.sql`.
Verify: tables created, indexes created, RPC function available.

- [ ] **Step 5: Create Supabase client**

Create `src/lib/supabase.ts`:
```typescript
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
```

- [ ] **Step 6: Create .env.local with Supabase credentials**

Create `.env.local` (gitignored):
```
NEXT_PUBLIC_SUPABASE_URL=https://xxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ...
```

- [ ] **Step 7: Update .gitignore**

Add `.env.local` and `.env` entries (verify they're listed).

- [ ] **Step 8: Commit**

```bash
git add supabase/schema.sql src/lib/supabase.ts package.json package-lock.json .gitignore
git commit -m "feat: add Supabase schema, client, and pg_trgm search function"
```

---

## Task 2: Seed Mock Data into Supabase

**Files:**
- Create: `scrapers/seed_mock_data.py`
- Modify: `scrapers/requirements.txt`

- [ ] **Step 1: Update scrapers/requirements.txt**

```
requests>=2.31.0
beautifulsoup4>=4.12.0
lxml>=5.0.0
python-dotenv>=1.0.0
anthropic>=0.40.0
supabase>=2.0.0
```

- [ ] **Step 2: Create scrapers/.env.example**

```
ANTHROPIC_API_KEY=sk-ant-api03-...
SUPABASE_URL=https://xxx.supabase.co
SUPABASE_SERVICE_KEY=eyJ...
```

- [ ] **Step 3: Create scrapers/.env with real credentials**

Copy `.env.example` to `.env`, fill in real values. This file is gitignored.

- [ ] **Step 4: Create seed_mock_data.py**

Script that reads the current mock-data.ts offers and inserts them into Supabase as `is_offer = true` with sensible brand/category values. This gives us data to test API routes against Supabase before real scraping works.

```python
# Read offers from mock-data, map to new schema, insert into Supabase
# For each offer: infer brand from product_name, set category, insert
```

- [ ] **Step 5: Install Python deps and run seed script**

```bash
cd scrapers
pip install -r requirements.txt
python seed_mock_data.py
```

Verify: check Supabase dashboard → Table Editor → offers table has ~167 rows.

- [ ] **Step 6: Test search_offers RPC from Supabase dashboard**

Go to SQL Editor, run:
```sql
SELECT * FROM search_offers('butter', 'hamburg', 20);
```
Expected: returns butter offers sorted by is_offer DESC, similarity DESC, price ASC.

- [ ] **Step 7: Commit**

```bash
git add scrapers/requirements.txt scrapers/.env.example scrapers/seed_mock_data.py
git commit -m "feat: add Supabase seed script and Python dependencies"
```

---

## Task 3: Update TypeScript Types

**Files:**
- Modify: `src/lib/types.ts`

- [ ] **Step 1: Update types to match new Supabase schema**

Rewrite `src/lib/types.ts`:
```typescript
export interface Store {
  id: string;
  name: string;
  slug: string;
  brandColor: string;
  offersUrl?: string;
}

export interface Offer {
  id: string;
  storeId: string;
  storeName: string;
  storeBrandColor: string;
  brand: string;
  productName: string;
  productNameEn: string;
  category: string;
  categoryEn: string;
  price: number;
  originalPrice: number | null;
  unit: string;
  validFrom: string;
  validTo: string;
  isOffer: boolean;
  sourceUrl: string;
  similarityScore?: number;
}

export interface SearchResult {
  product: string;
  city: string;
  offers: Offer[];
  regularPrices: Offer[];
  bestPrice: number | null;
  worstPrice: number | null;
  savingsAmount: number | null;
  totalOffers: number;
  totalRegular: number;
  isSuggestion?: boolean;
}

export interface City {
  id: string;
  name: string;
  slug: string;
  state: string;
}
```

- [ ] **Step 2: Verify types compile**

```bash
npx tsc --noEmit
```

Expected: may show errors in files importing old types — that's fine, we'll fix those in the next tasks.

- [ ] **Step 3: Commit**

```bash
git add src/lib/types.ts
git commit -m "feat: update types for Supabase schema with brand, category, isOffer"
```

---

## Task 4: Rewrite API Routes for Supabase

**Files:**
- Modify: `src/app/api/search/route.ts`
- Modify: `src/app/api/autocomplete/route.ts`

- [ ] **Step 1: Rewrite search route**

Replace `src/app/api/search/route.ts` to:
- Import supabase client from `@/lib/supabase`
- Sanitize input (trim, max 100 chars, strip HTML)
- Call `supabase.rpc('search_offers', { search_query, city_slug, result_limit: 50 })`
- Map Supabase snake_case response to camelCase TypeScript types
- Separate results into `offers` (is_offer=true) and `regularPrices` (is_offer=false)
- Calculate bestPrice, worstPrice, savingsAmount from offers only
- If zero results: query 5 cheapest offers as suggestions with `isSuggestion: true`
- Return `{ data: SearchResult, meta: { query, city, timestamp } }`
- Add Cache-Control header

- [ ] **Step 2: Rewrite autocomplete route**

Replace `src/app/api/autocomplete/route.ts` to:
- Import supabase client
- Query: `supabase.from('offers').select('product_name, product_name_en').ilike('product_name', '%' + query + '%').limit(8)`
- Also query with `similarity()` via RPC for fuzzy matches
- Deduplicate and return top 8 suggestions

- [ ] **Step 3: Verify TypeScript compiles**

```bash
npx tsc --noEmit
```

Expected: PASS (no errors)

- [ ] **Step 4: Test locally**

Restart dev server (`npm run dev`), test in browser:
- `localhost:3000/api/search?product=butter` → returns offers from Supabase
- `localhost:3000/api/autocomplete?q=but` → returns suggestions from Supabase

- [ ] **Step 5: Commit**

```bash
git add src/app/api/search/route.ts src/app/api/autocomplete/route.ts
git commit -m "feat: switch API routes from mock-data to Supabase with pg_trgm search"
```

---

## Task 5: Update Frontend for Two-Tier Results

**Files:**
- Modify: `src/app/page.tsx`

- [ ] **Step 1: Update SearchResult handling in page.tsx**

The page currently expects `result.offers` as a flat array. Update to handle:
- `result.offers` — real offers (green cards, existing design)
- `result.regularPrices` — estimated prices (new gray cards)
- `result.totalOffers` and `result.totalRegular` counts

- [ ] **Step 2: Add RegularPriceCard component**

Add a new component in the same file for regular price display:
- Gray left border (use `#9CA3AF` gray)
- "Typical Price" badge in gray instead of "Best Value" green
- Price shown with tilde: "~EUR 2.49"
- No originalPrice, no validTo date
- Small disclaimer text: "Estimated — actual store price may vary"
- No "View Leaflet" link

- [ ] **Step 3: Add section divider between offers and regular prices**

After the last offer card and before regular price cards:
```tsx
{result.regularPrices.length > 0 && (
  <div className="flex items-center gap-4 py-4">
    <div className="flex-1 h-px bg-zinc-200" />
    <span className="text-zinc-400 text-xs font-medium uppercase tracking-wider">
      Typical prices below
    </span>
    <div className="flex-1 h-px bg-zinc-200" />
  </div>
)}
```

- [ ] **Step 4: Update summary bar**

- Show `totalOffers` offers + `totalRegular` regular prices in the count
- bestPrice and savingsAmount calculated from offers only (not regular prices)

- [ ] **Step 5: Add brand display to PriceCard**

Update the existing PriceCard component:
- Show `offer.brand` in a small label above the product name
- This differentiates "Kerrygold Irische Butter" from "JA! Deutsche Markenbutter"

- [ ] **Step 6: Verify in browser**

Restart dev server, search for "butter":
- Should see offer cards (green) first
- Then divider
- Then regular price cards (gray) with "~" prefix
- Brand names visible on each card

- [ ] **Step 7: Commit**

```bash
git add src/app/page.tsx
git commit -m "feat: two-tier results display with offers and estimated regular prices"
```

---

## Task 6: Build Universal Scraper

**Files:**
- Create: `scrapers/universal_scraper.py`
- Modify: `scrapers/config.py`
- Create: `scrapers/.env.example` (if not done in Task 2)

- [ ] **Step 1: Update scrapers/config.py**

Rewrite config.py with:
- 5 store definitions (slug, name, brand_color, offers_url placeholder)
- Claude model setting: `CLAUDE_MODEL = "claude-haiku-4-5-20251001"`
- Rate limit: `RATE_LIMIT_SECONDS = 3`
- Validation thresholds: `MIN_OFFERS_PER_STORE = 5`, `MAX_PRICE = 200`
- The extraction prompt from the spec (the full prompt text)
- User-agent strings list for rotation

- [ ] **Step 2: Create scrapers/universal_scraper.py**

Build the main scraper with these functions:

```python
def fetch_html(url: str) -> str:
    """Fetch HTML with browser headers. Return raw HTML string."""

def extract_offers_with_claude(html: str, store_slug: str) -> list[dict]:
    """Send HTML to Claude API, parse JSON response, return offers list."""

def validate_offer(offer: dict) -> bool:
    """Validate: price > 0, price < 200, name not empty, dates valid."""

def save_to_supabase(store_id: str, offers: list[dict]) -> int:
    """Delete old offers for store, insert new ones. Return count."""

def log_scrape(store_id: str, status: str, count: int, error: str | None, duration_ms: int):
    """Insert scrape_log entry."""

def scrape_store(store_config: dict) -> int:
    """Orchestrate: fetch → extract → validate → save → log. Return offer count."""

def main():
    """Run all stores sequentially. Log summary."""
```

Key behaviors:
- If `validated_count < MIN_OFFERS_PER_STORE` (5), DON'T delete old data, log error
- If HTTP fetch fails, log and skip to next store
- If Claude returns invalid JSON, retry once with Sonnet, then skip
- Rate limit between stores (3 second sleep)
- Print summary at end: "Scraped X offers from Y stores"

- [ ] **Step 3: Test with one store manually**

```bash
cd scrapers
python -c "from universal_scraper import fetch_html; print(len(fetch_html('https://www.lidl.de/c/billiger-montag/a10006065')))"
```

Check if HTML is returned (should be >10KB). If <1KB, the page needs JS rendering.

- [ ] **Step 4: Test full pipeline with one store**

```bash
python universal_scraper.py --store lidl
```

Expected: "Scraped X offers from Lidl" with X > 5.
Check Supabase dashboard: new offers with real brand names and prices.

- [ ] **Step 5: Run for all stores**

```bash
python universal_scraper.py
```

Expected: "Scraped X offers from 5 stores" with scrape_logs entries.

- [ ] **Step 6: Verify in browser**

Open `localhost:3000`, search for a product that appeared in real scraping.
Verify: real brand names, real prices, valid dates.

- [ ] **Step 7: Commit**

```bash
git add scrapers/config.py scrapers/universal_scraper.py
git commit -m "feat: universal scraper with Claude API extraction for 5 supermarkets"
```

---

## Task 7: Build Regular Price Estimation (Tier 2)

**Files:**
- Create: `scrapers/estimate_regular_prices.py`

- [ ] **Step 1: Create estimate_regular_prices.py**

Build a script that:
1. Sends the Tier 2 prompt from the spec to Claude (Haiku)
2. Asks for ~200 common grocery products with typical German prices
3. Parses JSON response
4. Validates each entry (price > 0, name not empty)
5. For each product, creates entries for each of the 5 stores (same estimated price per store)
6. Inserts into Supabase with `is_offer = false`
7. Logs count

```python
def estimate_prices() -> list[dict]:
    """Send prompt to Claude, return list of estimated products."""

def save_estimates(estimates: list[dict]) -> int:
    """Delete old estimates (is_offer=false), insert new ones."""

def main():
    """Run estimation and save."""
```

- [ ] **Step 2: Run estimation**

```bash
python estimate_regular_prices.py
```

Expected: "Inserted ~200 estimated regular prices"
Check Supabase: offers table has rows with `is_offer = false`.

- [ ] **Step 3: Verify in browser**

Search for an uncommon product (e.g., "Zahnpasta").
Expected: if no offer exists, regular price cards appear with gray badge and "~" prefix.

- [ ] **Step 4: Commit**

```bash
git add scrapers/estimate_regular_prices.py
git commit -m "feat: Tier 2 regular price estimation via Claude API"
```

---

## Task 8: GitHub Actions Cron Automation

**Files:**
- Create: `.github/workflows/scrape-offers.yml`

- [ ] **Step 1: Create workflow file**

```yaml
name: Scrape Supermarket Offers

on:
  schedule:
    - cron: '0 5 * * 1,4'  # Monday + Thursday 5:00 UTC (6:00 CET)
  workflow_dispatch:  # Manual trigger

jobs:
  scrape:
    runs-on: ubuntu-latest
    timeout-minutes: 15

    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-python@v5
        with:
          python-version: '3.12'

      - name: Install dependencies
        run: pip install -r scrapers/requirements.txt

      - name: Scrape weekly offers
        run: python scrapers/universal_scraper.py
        env:
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
          SUPABASE_URL: ${{ secrets.SUPABASE_URL }}
          SUPABASE_SERVICE_KEY: ${{ secrets.SUPABASE_SERVICE_KEY }}

      - name: Estimate regular prices
        run: python scrapers/estimate_regular_prices.py
        env:
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
          SUPABASE_URL: ${{ secrets.SUPABASE_URL }}
          SUPABASE_SERVICE_KEY: ${{ secrets.SUPABASE_SERVICE_KEY }}
```

- [ ] **Step 2: Add secrets to GitHub repo**

Go to GitHub → repo Settings → Secrets and variables → Actions → add:
- `ANTHROPIC_API_KEY`
- `SUPABASE_URL`
- `SUPABASE_SERVICE_KEY`

- [ ] **Step 3: Push and test with manual dispatch**

```bash
git add .github/workflows/scrape-offers.yml
git commit -m "feat: GitHub Actions cron for automated scraping Mon + Thu"
git push origin main
```

Then: GitHub → Actions tab → "Scrape Supermarket Offers" → Run workflow.
Monitor: check logs, verify Supabase data updated.

- [ ] **Step 4: Verify cron will work**

Check Actions tab shows "scheduled" indicator. Next run should be Monday or Thursday 5:00 UTC.

---

## Task 9: Clean Up Old Files

**Files:**
- Delete: `src/lib/mock-data.ts`
- Delete: `src/lib/search.ts`
- Delete: `scrapers/base_scraper.py`
- Delete: `scrapers/lidl_scraper.py`
- Delete: `scrapers/run_all.py`

- [ ] **Step 1: Verify nothing imports deleted files**

```bash
grep -r "mock-data" src/ --include="*.ts" --include="*.tsx"
grep -r "from.*search" src/ --include="*.ts" --include="*.tsx"
```

Expected: no imports of mock-data or search.ts remain (API routes were rewritten in Task 4).

- [ ] **Step 2: Delete old files**

```bash
rm src/lib/mock-data.ts src/lib/search.ts
rm scrapers/base_scraper.py scrapers/lidl_scraper.py scrapers/run_all.py
```

- [ ] **Step 3: Verify build still works**

```bash
npx tsc --noEmit
npm run build
```

Expected: PASS

- [ ] **Step 4: Commit**

```bash
git add -A
git commit -m "chore: remove mock data and old scrapers, replaced by Supabase + universal scraper"
```

---

## Task 10: Deploy to Vercel

**Files:** None (Vercel dashboard configuration)

- [ ] **Step 1: Connect GitHub repo to Vercel**

Go to https://vercel.com → New Project → Import `PratikAutomation/Papierbox` → Deploy.

Framework: Next.js (auto-detected)
Root directory: `./` (default)

- [ ] **Step 2: Add environment variables in Vercel**

Vercel → Project Settings → Environment Variables → add:
- `NEXT_PUBLIC_SUPABASE_URL` = your Supabase project URL
- `NEXT_PUBLIC_SUPABASE_ANON_KEY` = your Supabase anon key

- [ ] **Step 3: Trigger redeploy**

Vercel → Deployments → Redeploy (to pick up env vars).

- [ ] **Step 4: Verify on Vercel URL**

Open the Vercel-provided URL (e.g., `papierbox.vercel.app`).
Test: search for "Butter", verify real data appears.

- [ ] **Step 5: Connect papierbox.eu domain**

Vercel → Project Settings → Domains → Add `papierbox.eu`.
Vercel will show DNS records to add at your domain registrar:
- A record: `76.76.21.21`
- CNAME: `cname.vercel-dns.com`

Update DNS at your domain registrar. Wait for propagation (5-30 minutes).

- [ ] **Step 6: Verify production**

Open `https://papierbox.eu` → should show the full working app with real data.
Test search, autocomplete, offer cards, regular price cards.

- [ ] **Step 7: Commit any final changes and push**

```bash
git add -A
git commit -m "chore: finalize for production deployment"
git push origin main
```

---

## Execution Order & Dependencies

```
Task 1 (Supabase setup)
  └→ Task 2 (Seed mock data)
       └→ Task 3 (Update types)
            └→ Task 4 (Rewrite API routes)
                 ├→ Task 5 (Update frontend) — can run parallel with Task 6
                 └→ Task 6 (Universal scraper)
                      └→ Task 7 (Regular prices)
                           └→ Task 8 (GitHub Actions)
                                └→ Task 9 (Clean up)
                                     └→ Task 10 (Deploy)
```

Tasks 5 and 6 are independent and can run in parallel.

---

## Checkpoints

**After Task 2:** Search API returns mock data from Supabase (same as before but from DB)
**After Task 5:** Frontend shows two-tier results with brand names
**After Task 6:** Real supermarket data in Supabase, visible on localhost
**After Task 8:** Scraping runs automatically Mon + Thu
**After Task 10:** Live at papierbox.eu with real data
