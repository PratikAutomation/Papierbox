# Data Pipeline Plan — Papierbox Real-Time Pricing

## The Problem

We need real, weekly-updated grocery prices from 6 German supermarkets.
Each supermarket publishes new offers on different days (Mon/Thu).
Traditional CSS scraping breaks every time a site redesigns.
We need something reliable, cheap, and zero-maintenance.

---

## Proposed Solution: Claude API as Universal Parser

### Core Concept

```
Supermarket Website → Fetch HTML → Claude API extracts data → Supabase stores it → App queries it
```

One script. All supermarkets. No CSS selectors. No breakage on redesigns.

### Why Not Traditional Scraping?

| Problem | Impact |
|---------|--------|
| Site redesign breaks CSS selectors | Scraper fails silently, users see stale data |
| Each supermarket needs custom scraper code | 6x the maintenance |
| Cookie banners, JS rendering, anti-bot | Constant workarounds |
| Solo developer maintaining 6 scrapers | Unsustainable |

### Why Claude API Parsing Works

- Claude reads HTML like a human — understands product names, prices, units
- Site redesign? Claude still finds the data — it understands context, not DOM structure
- Adding a new supermarket = adding one URL
- Cost: ~2 cents per supermarket per run

---

## Architecture

```
┌─────────────────────────────────────────────────┐
│         GitHub Actions (FREE cron)               │
│         Runs: Monday 6AM + Thursday 6AM          │
│                                                   │
│  ┌──────────────────────────────────────────┐    │
│  │  universal_scraper.py                     │    │
│  │                                           │    │
│  │  For each supermarket:                    │    │
│  │    1. Fetch offers page HTML              │    │
│  │    2. Send HTML to Claude API             │    │
│  │    3. Claude returns structured JSON      │    │
│  │    4. Validate & clean data               │    │
│  │    5. Upsert into Supabase               │    │
│  └──────────────────────────────────────────┘    │
└─────────────────────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────┐
│              Supabase (FREE tier)                 │
│                                                   │
│  Tables:                                          │
│  ├── stores (6 rows, static)                     │
│  ├── cities (25 rows, static)                    │
│  ├── offers (dynamic, refreshed Mon/Thu)         │
│  └── scrape_logs (tracking runs)                 │
│                                                   │
│  Features:                                        │
│  ├── Full-text search (GIN index)                │
│  ├── Auto-expire old offers (valid_to < today)   │
│  └── Row-level security (read-only public)       │
└─────────────────────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────┐
│              Next.js App (Vercel FREE)            │
│                                                   │
│  /api/search?product=butter&city=hamburg          │
│    → Queries Supabase instead of mock-data        │
│    → Returns real prices, sorted cheapest first   │
│                                                   │
│  /api/autocomplete?q=but                          │
│    → Queries Supabase for product names           │
└─────────────────────────────────────────────────┘
```

---

## Supermarket Targets & Schedule

| # | Store | Offer Page | New Offers | Pricing |
|---|-------|-----------|------------|---------|
| 1 | Lidl | /angebote | Mon + Thu | National |
| 2 | Aldi Süd | /angebote | Mon + Thu | National |
| 3 | Penny | /angebote | Mon + Thu | National |
| 4 | Kaufland | /angebote/aktuelle-woche | Thu | National |
| 5 | Netto | /angebote | Mon | National |
| 6 | Rewe | /angebote | Mon | Regional |

**Cron schedule needed: Monday 6:00 AM + Thursday 6:00 AM CET**

---

## The Universal Scraper Script

### Input (per supermarket)
```python
{
    "store_slug": "lidl",
    "store_name": "Lidl",
    "offers_url": "https://www.lidl.de/c/angebote/a12345",
    "brand_color": "#0050AA"
}
```

### Process
```python
# Step 1: Fetch HTML
html = requests.get(url, headers=browser_headers).text

# Step 2: Send to Claude API
prompt = """
Extract ALL grocery offers from this HTML page.
Return a JSON array. Each item must have:
- product_name: string (German product name as shown)
- product_name_en: string (English translation)
- price: number (current price in EUR)
- original_price: number or null (crossed-out/old price if on sale)
- unit: string (e.g., "1kg", "500g", "Stück", "1L", "10 Stück")
- valid_from: string (ISO date, when offer starts)
- valid_to: string (ISO date, when offer ends)

Rules:
- Extract EVERY product with a visible price
- If original_price exists, the item is on sale
- Translate product_name to English for product_name_en
- Use ISO date format: YYYY-MM-DD
- Return ONLY the JSON array, nothing else
"""

response = claude.messages.create(
    model="claude-haiku-4-5-20251001",  # Cheapest, fast enough for extraction
    max_tokens=4096,
    messages=[{"role": "user", "content": f"{prompt}\n\nHTML:\n{html[:50000]}"}]
)

offers = json.loads(response.content[0].text)
```

### Output (per product)
```json
{
    "product_name": "Deutsche Markenbutter",
    "product_name_en": "German Brand Butter",
    "price": 1.79,
    "original_price": 2.29,
    "unit": "250g",
    "valid_from": "2026-03-17",
    "valid_to": "2026-03-23"
}
```

---

## Claude API Prompt Engineering

### The Extraction Prompt (Critical)

```
You are a German grocery price extraction system.
You will receive HTML from a German supermarket's weekly offers page.

Extract EVERY product offer visible on the page.

Return a JSON array where each object has:
- product_name: string — German name exactly as displayed
- product_name_en: string — English translation
- price: number — current selling price in EUR (e.g., 1.79)
- original_price: number | null — old/crossed-out price if item is on sale, otherwise null
- unit: string — weight, volume, or count (e.g., "250g", "1L", "Stück", "10er Pack")
- valid_from: string — offer start date in YYYY-MM-DD format
- valid_to: string — offer end date in YYYY-MM-DD format

Rules:
1. Extract ALL products, not just a few
2. Prices must be numbers, not strings (1.79 not "1,79€")
3. Convert German comma decimals to dots (1,79 → 1.79)
4. If dates aren't explicitly shown, use current week Mon-Sun
5. Only return the JSON array — no markdown, no explanation
6. If you cannot extract any offers, return an empty array []
```

### Model Choice

| Model | Cost per run | Speed | Accuracy |
|-------|-------------|-------|----------|
| claude-haiku-4-5 | ~€0.005 | 2-3 sec | Good enough |
| claude-sonnet-4-5 | ~€0.03 | 5-8 sec | Better |
| claude-opus-4 | ~€0.15 | 10-15 sec | Overkill |

**Recommendation: Haiku for daily runs, Sonnet as fallback if extraction quality drops.**

---

## Supabase Schema

```sql
-- Stores (static, seeded once)
CREATE TABLE stores (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    brand_color TEXT NOT NULL,
    offers_url TEXT,
    scrape_schedule TEXT DEFAULT 'mon,thu'
);

-- Offers (dynamic, refreshed by scraper)
CREATE TABLE offers (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    store_id TEXT REFERENCES stores(id),
    product_name TEXT NOT NULL,
    product_name_en TEXT,
    product_name_normalized TEXT,
    price DECIMAL(10,2) NOT NULL,
    original_price DECIMAL(10,2),
    unit TEXT,
    valid_from DATE,
    valid_to DATE,
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),

    -- Full-text search vector
    search_vector TSVECTOR GENERATED ALWAYS AS (
        to_tsvector('simple', coalesce(product_name, '') || ' ' || coalesce(product_name_en, ''))
    ) STORED
);

-- Indexes
CREATE INDEX idx_offers_search ON offers USING GIN(search_vector);
CREATE INDEX idx_offers_product_normalized ON offers(product_name_normalized);
CREATE INDEX idx_offers_valid ON offers(valid_from, valid_to);
CREATE INDEX idx_offers_store ON offers(store_id);
CREATE INDEX idx_offers_price ON offers(price);

-- Auto-cleanup: delete expired offers older than 2 weeks
-- (run via Supabase cron or pg_cron)

-- Scrape log (for monitoring)
CREATE TABLE scrape_logs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    store_id TEXT REFERENCES stores(id),
    status TEXT NOT NULL, -- 'success', 'error', 'partial'
    offers_count INTEGER DEFAULT 0,
    error_message TEXT,
    duration_ms INTEGER,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Row-level security: public read, service-key write
ALTER TABLE offers ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read" ON offers FOR SELECT USING (true);
CREATE POLICY "Service write" ON offers FOR ALL USING (auth.role() = 'service_role');
```

---

## GitHub Actions Cron (FREE)

```yaml
# .github/workflows/scrape-offers.yml
name: Scrape Supermarket Offers

on:
  schedule:
    # Monday and Thursday at 6:00 AM CET (5:00 UTC)
    - cron: '0 5 * * 1,4'
  workflow_dispatch: # Manual trigger button

jobs:
  scrape:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.12'
      - run: pip install -r scrapers/requirements.txt
      - run: python scrapers/universal_scraper.py
        env:
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
          SUPABASE_URL: ${{ secrets.SUPABASE_URL }}
          SUPABASE_SERVICE_KEY: ${{ secrets.SUPABASE_SERVICE_KEY }}
```

---

## Migration Plan: Mock Data → Real Data

### Phase 1: Keep Mock Data (NOW)
- App works with hardcoded mock-data.ts
- Deploy to Vercel, get user feedback on UI/UX

### Phase 2: Add Supabase (Day 2)
- Create Supabase project (free)
- Run schema SQL
- Seed with current mock data
- Switch API routes from mock-data imports to Supabase queries
- App now reads from database

### Phase 3: Add Universal Scraper (Day 2-3)
- Build universal_scraper.py with Claude API
- Test with 1 supermarket (Lidl) manually
- Verify extracted data quality
- Load real data into Supabase
- App now shows REAL prices

### Phase 4: Automate (Day 3)
- Set up GitHub Actions cron
- Add monitoring (scrape_logs table)
- Add Supabase auto-cleanup for expired offers
- Fully automated pipeline

---

## Costs Breakdown

| Service | Monthly Cost | Free Tier Limits |
|---------|-------------|------------------|
| Supabase | €0 | 500MB storage, 2GB bandwidth, 50K MAU |
| Vercel | €0 | 100GB bandwidth, serverless functions |
| GitHub Actions | €0 | 2,000 min/month |
| Claude API (Haiku) | ~€0.50-1.00 | Pay-as-you-go |
| Domain | €0 | Already owned |
| **Total** | **~€1/month** | |

---

## Risk Mitigation

| Risk | Mitigation |
|------|-----------|
| Supermarket blocks our requests | Use rotating user-agents, respect rate limits, fetch only 2x/week |
| Claude misextracts data | Validate: price > 0, price < 100, product_name not empty. Log errors. |
| Supabase free tier exceeded | 50K MAU is plenty for MVP. Upgrade only if needed (~€25/mo) |
| Offers page requires JavaScript | Use playwright/headless browser as fallback |
| API key exposed | Store in GitHub Secrets + Supabase env vars only |
| Claude API down | Keep last successful scrape data. Stale data > no data. |

---

## Open Questions for Brainstorm

1. **Should we scrape ALL products or only the "top 100" most searched?** Full scrape = more API cost but better coverage.

2. **Regional pricing (Rewe/Edeka):** These have different prices per city. Do we handle this in MVP or skip regional stores?

3. **Product name normalization:** "Deutsche Markenbutter 250g" vs "Butter" — how aggressively do we normalize? Should Claude do this or should we have a post-processing step?

4. **Price history:** Should we keep old offers for trend analysis ("butter was cheaper last week")? Storage is free on Supabase, but adds complexity.

5. **Real-time vs cached:** Current plan updates 2x/week. Is that enough? Some offers start mid-week.

6. **Fallback for JS-rendered pages:** Some sites need a headless browser. Do we add Playwright to the GitHub Action?

7. **User-submitted prices:** Should we allow users to submit prices they see in-store? This is crowdsourced data, adds coverage but needs moderation.

8. **Do we need the fuzzy search in Supabase too?** Or keep it in the Next.js API layer? (Current fuzzy engine is TypeScript-based, works great for mock data, but Supabase has pg_trgm for fuzzy search natively.)

---

*Created: March 21, 2026*
*Status: READY FOR BRAINSTORM*
