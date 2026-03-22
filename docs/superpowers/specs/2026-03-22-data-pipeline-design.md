# Data Pipeline Design Spec — Papierbox

## Overview

Real-time grocery price comparison pipeline for Papierbox.eu. Fetches weekly offers from 5 German supermarkets using Claude API as a universal HTML parser, stores in Supabase, and serves through Next.js API routes with in-database fuzzy search.

## Goals

1. Show real, verified weekly offer prices with 99% accuracy (hero feature)
2. Show estimated regular prices as fallback, clearly labeled, targeting 98% accuracy by week 4
3. Never show an empty screen — always return relevant results
4. Brand-level product granularity (Kerrygold Butter, not just Butter)
5. Total infrastructure cost under EUR 2/month

## Non-Goals (MVP)

- Rewe (regional pricing, deferred)
- Edeka (franchise-based, deferred)
- User accounts or shopping lists
- Price history / trend charts
- Mobile native app

---

## Architecture

```
GitHub Actions Cron (Mon + Thu 6AM CET)
    │
    ▼
universal_scraper.py
    │
    ├─── For each of 5 supermarkets:
    │      1. HTTP GET offers page
    │      2. Send HTML to Claude API (Haiku)
    │      3. Claude returns structured JSON with brand, category, price
    │      4. Validate (price > 0, name not empty, dates valid)
    │      5. Delete old offers for this store from Supabase
    │      6. Insert new offers into Supabase
    │
    ├─── Regular price estimation:
    │      1. Send product list to Claude with web-search prompt
    │      2. Claude returns estimated regular prices
    │      3. Insert with is_offer = false, clearly marked
    │
    └─── Log results to scrape_logs table

Supabase (PostgreSQL)
    │
    ├── stores (5 rows, static)
    ├── offers (dynamic, replaced Mon/Thu)
    │     ├── brand, product_name, category columns
    │     ├── is_offer flag (true = scraped, false = estimated)
    │     ├── pg_trgm fuzzy search indexes
    │     └── bilingual_synonyms for DE↔EN search
    ├── bilingual_synonyms (translation map table)
    └── scrape_logs (monitoring)

Next.js API (Vercel)
    │
    ├── GET /api/search?product=X&city=Y
    │     → Queries Supabase with pg_trgm fuzzy match
    │     → Returns offers sorted by price, offers first, then regular prices
    │
    └── GET /api/autocomplete?q=X
          → Queries Supabase for matching product names
```

---

## Component 1: Universal Scraper

### Purpose
Single Python script that fetches and extracts offer data from all 5 supermarkets using Claude API as the parser.

### Target Supermarkets

| Store | Slug | Brand Color | Offer Schedule | Pricing |
|-------|------|-------------|---------------|---------|
| Lidl | lidl | #0050AA | Mon + Thu | National |
| Aldi Sud | aldi-sued | #00005F | Mon + Thu | National |
| Penny | penny | #CD1719 | Mon + Thu | National |
| Kaufland | kaufland | #E10915 | Thu | National |
| Netto | netto | #FFE600 | Mon | National |

### Fetching Strategy

1. Try simple `requests.get()` with browser-like headers first
2. If response is empty or JS-only (<1KB of text content), fall back to Playwright headless browser for that specific store
3. Respect robots.txt, rate-limit to 1 request per 3 seconds
4. Rotate user-agent strings

### Claude API Extraction Prompt

```
You are a German grocery price extraction system.
You will receive HTML from a German supermarket's weekly offers page.

Extract EVERY product offer visible on the page.

Return a JSON array where each object has:
- brand: string — manufacturer/brand name (e.g., "Kerrygold", "JA!", "Barilla", "Milbona")
  If store's own brand, use the brand name as displayed.
  If no brand visible, use "Eigenmarke" (own brand).
- product_name: string — FULL product name as displayed, including brand
- product_name_en: string — English translation of the full product name
- category: string — generic product category in German (e.g., "Butter", "Milch", "Nudeln")
- category_en: string — generic category in English (e.g., "Butter", "Milk", "Pasta")
- price: number — current selling price in EUR (e.g., 1.79)
- original_price: number | null — old/crossed-out price if on sale, otherwise null
- unit: string — weight, volume, or count as displayed (e.g., "250g", "1L", "10er Pack")
- valid_from: string — offer start date in YYYY-MM-DD format
- valid_to: string — offer end date in YYYY-MM-DD format

Rules:
1. Extract ALL products with a visible price — food, drinks, household, everything
2. Prices must be numbers, not strings (1.79 not "1,79 EUR")
3. Convert German comma decimals to dots (1,79 -> 1.79)
4. If dates are not explicitly shown, use current week Monday to Sunday
5. Return ONLY the JSON array — no markdown, no explanation, no wrapping
6. If you cannot extract any offers, return an empty array []
7. Preserve exact brand names — "Kerrygold", not "Kerry Gold"
8. product_name must include the brand: "Kerrygold Irische Butter" not just "Irische Butter"
```

### Model Selection
- Primary: claude-haiku-4-5 (~EUR 0.005 per store)
- Fallback: claude-sonnet-4-5 if Haiku extraction quality drops below threshold

### Validation Rules (Post-Extraction)

Every extracted offer must pass ALL of these or it's rejected:
- `price > 0 and price < 200`
- `product_name` is not empty and length > 2
- `brand` is not empty
- `category` is not empty
- `valid_to >= valid_from`
- `valid_to >= today`
- No duplicate `(store_id, product_name, price)` combinations

If a store extraction fails entirely, log the error and keep the previous data. Stale verified data is better than no data.

### Data Flow Per Scrape Run

```
1. For each store in config:
   a. Fetch HTML (simple HTTP or Playwright)
   b. If HTML < 1KB text content → log warning, try Playwright
   c. Send HTML to Claude API
   d. Parse JSON response
   e. Validate each offer
   f. If validated_count >= 5:
        → DELETE FROM offers WHERE store_id = X AND is_offer = true
        → INSERT validated offers
   g. If validated_count < 5:
        → Log error, keep existing data (don't delete)
   h. Insert scrape_log entry

2. After all stores:
   a. Run regular price estimation (Tier 2)
   b. Log summary
```

---

## Component 2: Regular Price Estimation (Tier 2)

### Purpose
Provide baseline "typical prices" for common products not currently on offer, so users never get empty results.

### Approach
- After scraping offers, compile a list of common product categories
- Send to Claude with a prompt asking for current typical German supermarket prices
- Claude uses its training data + web knowledge to estimate
- Store with `is_offer = false` flag
- Display with "~" prefix and "Typical Price" gray badge
- Refresh 2x/week alongside offer scraping

### Claude Prompt for Regular Prices

```
You are a German grocery pricing expert.
Based on your knowledge of current German supermarket prices (Lidl, Aldi, Penny, Kaufland, Netto),
provide typical regular prices (NOT sale prices) for common grocery products.

Return a JSON array where each object has:
- brand: string — a common brand sold in German discounters
- product_name: string — full product name with brand
- product_name_en: string — English translation
- category: string — generic category in German
- category_en: string — English category
- price: number — typical regular price in EUR
- unit: string — standard unit sold

Focus on the 200 most commonly purchased grocery items in Germany.
Include: dairy, meats, produce, bakery, beverages, canned goods, frozen, snacks,
household basics (detergent, toilet paper, toothpaste).
Prices should reflect 2026 German discount supermarket pricing.
```

### Accuracy Roadmap
- Week 1: ~80% accuracy (Claude estimates only)
- Week 2-3: Cross-reference with real scraped offer data to calibrate
- Week 4: ~98% accuracy target (Claude estimates anchored by real historical data)

### Display Rules
- NEVER mix estimated prices with real offers in the same result card
- Estimated prices always show: gray badge "Typical Price", tilde prefix "~EUR 2.49"
- Disclaimer text: "Estimated price — actual store price may vary"
- Offers always rank ABOVE estimated prices in results

---

## Component 3: Supabase Database

### Schema

```sql
-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Stores (static)
CREATE TABLE stores (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    brand_color TEXT NOT NULL,
    offers_url TEXT
);

-- Main offers table (weekly offers + regular price estimates)
CREATE TABLE offers (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    store_id TEXT REFERENCES stores(id),
    brand TEXT NOT NULL DEFAULT 'Eigenmarke',
    product_name TEXT NOT NULL,
    product_name_en TEXT,
    category TEXT NOT NULL,
    category_en TEXT,
    product_name_normalized TEXT GENERATED ALWAYS AS (lower(product_name)) STORED,
    price DECIMAL(10,2) NOT NULL,
    original_price DECIMAL(10,2),
    unit TEXT,
    valid_from DATE,
    valid_to DATE,
    is_offer BOOLEAN NOT NULL DEFAULT true,
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Fuzzy search indexes (pg_trgm)
CREATE INDEX idx_offers_product_trgm ON offers USING GIN (product_name_normalized gin_trgm_ops);
CREATE INDEX idx_offers_brand_trgm ON offers USING GIN (lower(brand) gin_trgm_ops);
CREATE INDEX idx_offers_category_trgm ON offers USING GIN (lower(category) gin_trgm_ops);

-- Standard indexes
CREATE INDEX idx_offers_store ON offers(store_id);
CREATE INDEX idx_offers_price ON offers(price);
CREATE INDEX idx_offers_is_offer ON offers(is_offer);

-- Bilingual synonym table (for DE<->EN search)
CREATE TABLE bilingual_synonyms (
    id SERIAL PRIMARY KEY,
    term TEXT NOT NULL,
    synonyms TEXT[] NOT NULL
);

-- Scrape monitoring
CREATE TABLE scrape_logs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    store_id TEXT REFERENCES stores(id),
    status TEXT NOT NULL,
    offers_count INTEGER DEFAULT 0,
    error_message TEXT,
    duration_ms INTEGER,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Row-level security
ALTER TABLE offers ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read offers" ON offers FOR SELECT USING (true);
ALTER TABLE stores ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read stores" ON stores FOR SELECT USING (true);
ALTER TABLE bilingual_synonyms ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read synonyms" ON bilingual_synonyms FOR SELECT USING (true);
```

### Search Function (Supabase RPC)

```sql
CREATE OR REPLACE FUNCTION search_offers(
    search_query TEXT,
    city_slug TEXT DEFAULT 'hamburg',
    result_limit INTEGER DEFAULT 50
)
RETURNS TABLE (
    id UUID,
    store_id TEXT,
    store_name TEXT,
    store_brand_color TEXT,
    brand TEXT,
    product_name TEXT,
    product_name_en TEXT,
    category TEXT,
    category_en TEXT,
    price DECIMAL,
    original_price DECIMAL,
    unit TEXT,
    valid_from DATE,
    valid_to DATE,
    is_offer BOOLEAN,
    source_url TEXT,
    similarity_score REAL
) AS $$
DECLARE
    normalized_query TEXT := lower(trim(search_query));
    synonym_terms TEXT[];
BEGIN
    -- Look up synonyms
    SELECT s.synonyms INTO synonym_terms
    FROM bilingual_synonyms s
    WHERE lower(s.term) = normalized_query
    LIMIT 1;

    RETURN QUERY
    SELECT
        o.id, o.store_id, st.name, st.brand_color,
        o.brand, o.product_name, o.product_name_en,
        o.category, o.category_en,
        o.price, o.original_price, o.unit,
        o.valid_from, o.valid_to, o.is_offer, o.source_url,
        GREATEST(
            similarity(o.product_name_normalized, normalized_query),
            similarity(lower(o.brand), normalized_query),
            similarity(lower(o.category), normalized_query),
            CASE WHEN synonym_terms IS NOT NULL THEN
                (SELECT MAX(similarity(o.product_name_normalized, lower(syn)))
                 FROM unnest(synonym_terms) AS syn)
            ELSE 0 END
        ) AS similarity_score
    FROM offers o
    JOIN stores st ON o.store_id = st.id
    WHERE (
        o.product_name_normalized % normalized_query
        OR lower(o.brand) % normalized_query
        OR lower(o.category) % normalized_query
        OR o.product_name_normalized ILIKE '%' || normalized_query || '%'
        OR lower(o.brand) ILIKE '%' || normalized_query || '%'
        OR (synonym_terms IS NOT NULL AND EXISTS (
            SELECT 1 FROM unnest(synonym_terms) AS syn
            WHERE o.product_name_normalized % lower(syn)
               OR o.product_name_normalized ILIKE '%' || lower(syn) || '%'
        ))
    )
    ORDER BY
        o.is_offer DESC,
        similarity_score DESC,
        o.price ASC
    LIMIT result_limit;
END;
$$ LANGUAGE plpgsql;
```

### Bilingual Synonyms Seed Data

```sql
INSERT INTO bilingual_synonyms (term, synonyms) VALUES
('chicken', ARRAY['haehnchen', 'haehnchenbrust', 'chicken breast', 'haehnchen filet']),
('milk', ARRAY['milch', 'vollmilch', 'whole milk', 'frischmilch']),
('eggs', ARRAY['eier', 'frische eier', 'freilandeier']),
('butter', ARRAY['butter', 'markenbutter', 'deutsche markenbutter', 'suessrahmbutter']),
('bread', ARRAY['brot', 'vollkornbrot', 'toastbrot', 'toast bread']),
('cheese', ARRAY['kaese', 'gouda', 'emmentaler', 'mozzarella']),
('potatoes', ARRAY['kartoffeln', 'speisekartoffeln']),
('rice', ARRAY['reis', 'langkornreis', 'basmati reis', 'basmati']),
('pasta', ARRAY['nudeln', 'spaghetti', 'penne', 'fusilli']),
('yogurt', ARRAY['joghurt', 'naturjoghurt', 'fruchtjoghurt']),
('beef', ARRAY['hackfleisch', 'rinderhackfleisch', 'ground beef', 'rinderhack']),
('salmon', ARRAY['lachs', 'bio lachs', 'lachsfilet']),
('apples', ARRAY['aepfel', 'apfel', 'tafelaepfel']),
('bananas', ARRAY['bananen', 'banane']),
('tomatoes', ARRAY['tomaten', 'strauchtomaten', 'cherry tomaten']),
('cucumber', ARRAY['gurke', 'salatgurke']),
('onions', ARRAY['zwiebeln', 'speisezwiebeln']),
('coffee', ARRAY['kaffee', 'filterkaffee', 'kaffeebohnen']),
('water', ARRAY['wasser', 'mineralwasser', 'sprudelwasser']),
('sugar', ARRAY['zucker', 'raffinade']),
('flour', ARRAY['mehl', 'weizenmehl']),
('cream', ARRAY['sahne', 'schlagsahne', 'schmand']),
('tuna', ARRAY['thunfisch', 'thunfisch dose']),
('pizza', ARRAY['pizza', 'tiefkuehlpizza', 'frozen pizza']),
('detergent', ARRAY['waschmittel', 'vollwaschmittel', 'fluessigwaschmittel']),
('toilet paper', ARRAY['toilettenpapier', 'klopapier']),
('toothpaste', ARRAY['zahnpasta', 'zahncreme']),
('oats', ARRAY['haferflocken', 'kernige haferflocken']),
('lentils', ARRAY['linsen', 'rote linsen', 'berglinsen']),
('chickpeas', ARRAY['kichererbsen', 'kichererbsen dose']),
('coconut milk', ARRAY['kokosmilch', 'kokosnussmilch']),
('olive oil', ARRAY['olivenoel', 'natives olivenoel', 'extra virgin olive oil']),
('bell pepper', ARRAY['paprika', 'spitzpaprika', 'sweet pepper']),
('ketchup', ARRAY['ketchup', 'tomatenketchup']),
('mustard', ARRAY['senf', 'mittelscharfer senf']),
-- German-to-English direction
('milch', ARRAY['milk', 'whole milk', 'vollmilch']),
('haehnchen', ARRAY['chicken', 'chicken breast', 'haehnchenbrust']),
('eier', ARRAY['eggs', 'frische eier']),
('kaese', ARRAY['cheese', 'gouda', 'emmentaler']),
('kartoffeln', ARRAY['potatoes', 'speisekartoffeln']),
('reis', ARRAY['rice', 'langkornreis', 'basmati']),
('nudeln', ARRAY['pasta', 'spaghetti', 'noodles']),
('joghurt', ARRAY['yogurt', 'naturjoghurt']),
('hackfleisch', ARRAY['ground beef', 'beef', 'minced meat']),
('lachs', ARRAY['salmon', 'lachsfilet']),
('brot', ARRAY['bread', 'vollkornbrot', 'toast']),
('kaffee', ARRAY['coffee', 'filterkaffee']),
('zucker', ARRAY['sugar', 'raffinade']),
('mehl', ARRAY['flour', 'weizenmehl']),
('sahne', ARRAY['cream', 'schlagsahne']),
('wasser', ARRAY['water', 'mineralwasser']),
('senf', ARRAY['mustard', 'mittelscharfer senf']),
('zwiebeln', ARRAY['onions', 'speisezwiebeln']),
('tomaten', ARRAY['tomatoes', 'cherry tomaten']),
('gurke', ARRAY['cucumber', 'salatgurke']),
('bananen', ARRAY['bananas', 'banane']);
```

---

## Component 4: API Routes (Updated)

### GET /api/search

```
Input:  ?product=Kerrygold+Butter&city=hamburg
Output: {
  data: {
    product: "Kerrygold Butter",
    city: "hamburg",
    offers: [...],       // is_offer=true results first
    regularPrices: [...], // is_offer=false results, clearly separated
    bestPrice: 1.79,
    savingsAmount: 0.70,
    totalOffers: 4,
    totalRegular: 2
  },
  meta: { query, city, timestamp }
}
```

- Calls Supabase RPC `search_offers()` function
- Separates results into offers vs regular prices
- Offers sorted by similarity then price
- Regular prices always come after offers
- Cache-Control: 5 minutes

### GET /api/autocomplete

```
Input:  ?q=kerryg
Output: { suggestions: ["Kerrygold Irische Butter", "Kerrygold Spreadable", ...] }
```

- Queries Supabase with pg_trgm similarity on product_name
- Returns up to 8 unique suggestions
- Includes both German and English names
- Cache-Control: 1 minute

---

## Component 5: Frontend Changes

### Search Results Display

**Offer cards** (existing design, green-accented):
- Green left border / "OFFER" badge
- Exact price: "EUR 1.79"
- Original price strikethrough if on sale
- "Valid until Sun" date badge
- "View Leaflet" link
- Brand name prominently displayed

**Regular price cards** (new, gray-accented):
- Gray left border / "Typical Price" badge
- Approximate price: "~EUR 2.49"
- No original price, no dates
- Small disclaimer: "Estimated — actual store price may vary"
- No "View Leaflet" link

### Result ordering
1. Offers sorted by price (cheapest first)
2. Divider: "No more offers — typical prices below"
3. Regular prices sorted by price
4. If nothing found: "Today's Best Deals" fallback

---

## Component 6: GitHub Actions Automation

### Workflow: scrape-offers.yml

Triggers: Monday + Thursday 6:00 AM CET, plus manual dispatch

Steps:
1. Checkout repo
2. Setup Python 3.12
3. Install requirements (requests, anthropic, supabase-py, beautifulsoup4, playwright if needed)
4. Run universal_scraper.py with env vars from GitHub Secrets
5. On failure: create GitHub Issue with error details

### Required Secrets
- `ANTHROPIC_API_KEY` — Claude API key
- `SUPABASE_URL` — Supabase project URL
- `SUPABASE_SERVICE_KEY` — Supabase service role key (write access)

---

## Component 7: Environment & Configuration

### File: scrapers/.env.example
```
ANTHROPIC_API_KEY=sk-ant-...
SUPABASE_URL=https://xxx.supabase.co
SUPABASE_SERVICE_KEY=eyJ...
```

### File: scrapers/config.py
- Store definitions (name, slug, color, offers_url)
- Rate limiting settings
- Claude model selection
- Validation thresholds

---

## Migration Plan

### Phase 1: Deploy with Mock Data (Current State)
- App is live on localhost with 167 mock offers
- Search, autocomplete, UI all working

### Phase 2: Supabase Setup
- Create Supabase project
- Run schema SQL (stores, offers, bilingual_synonyms, scrape_logs)
- Seed stores and synonyms
- Migrate mock data into Supabase for testing
- Update API routes to query Supabase instead of mock-data.ts
- Verify search works identically

### Phase 3: Universal Scraper
- Create Anthropic API account
- Build universal_scraper.py
- Test with Lidl manually
- Validate extraction quality (compare to actual offers page)
- If quality >= 95%: proceed to all stores
- Load real data into Supabase

### Phase 4: Regular Price Estimation
- Build Tier 2 prompt for typical prices
- Run estimation, insert with is_offer=false
- Update frontend to show two-tier results
- Verify visual distinction between offers and estimates

### Phase 5: Automation
- Set up GitHub repo (if not already)
- Add secrets to GitHub
- Create scrape-offers.yml workflow
- Test with manual dispatch
- Enable cron schedule
- Monitor first automated run

### Phase 6: Deploy to Vercel
- Connect GitHub repo to Vercel
- Set environment variables
- Deploy
- Point papierbox.eu DNS to Vercel
- Verify everything works in production

---

## Cost Summary

| Service | Monthly | Notes |
|---------|---------|-------|
| Claude API (Haiku) | ~EUR 0.50 | 5 stores x 8 runs x EUR 0.01 |
| Claude API (regular prices) | ~EUR 0.50 | 2x estimation runs |
| Supabase | EUR 0 | Free tier: 500MB, 50K MAU |
| Vercel | EUR 0 | Free tier: 100GB bandwidth |
| GitHub Actions | EUR 0 | Free tier: 2000 min/month |
| Domain | EUR 0 | Already owned |
| **Total** | **~EUR 1/month** | |

---

## Success Criteria

- [ ] Weekly offers from 5 supermarkets loaded with 99% price accuracy
- [ ] Brand-level product names preserved (Kerrygold, not just Butter)
- [ ] Search handles: German, English, typos, brand names, partial matches
- [ ] Regular prices shown as fallback when no offers match
- [ ] Clear visual distinction between real offers and estimated prices
- [ ] Automated scraping runs Mon + Thu without manual intervention
- [ ] Zero empty-screen results for common grocery searches
- [ ] Total monthly cost under EUR 2
