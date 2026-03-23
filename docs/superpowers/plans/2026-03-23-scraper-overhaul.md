# Scraper Overhaul — Get EVERY Product from ALL 5 Stores

> This is the moat. This is the value. Everything else is compromise-able.

**Goal:** Extract 100% of weekly offers from all 5 supermarkets with brand-level accuracy. Target: 200+ real offers per scrape run.

**Current Reality:**
- Aldi Süd: 46 offers (working, but missing products)
- Kaufland: 25 offers (working, but missing products)
- Lidl: 2 offers (broken — JS-rendered)
- Penny: 0 offers (broken — wrong URL or JS-rendered)
- Netto: 0 offers (broken — blocked or JS-rendered)

**New Approach:** Stop scraping HTML. **Find and call the actual APIs** these stores use internally. Every supermarket website/app loads its data from an API — we call that API directly and get clean JSON. No HTML parsing, no JS rendering issues, no Cloudflare blocks.

---

## Why APIs > HTML Scraping

| | HTML Scraping (Current) | Direct API Calls (New) |
|---|---|---|
| **Reliability** | Breaks on redesign | Never breaks (APIs are stable) |
| **Data quality** | Claude guesses structure | Perfect structured JSON |
| **Completeness** | Gets ~30% of products | Gets 100% of products |
| **Speed** | 50KB HTML → Claude → 10sec | 5KB JSON → instant parse |
| **Cost** | ~€0.01/store (Claude API) | €0.00/store (no AI needed) |
| **JS rendering** | Fails for SPAs | Not needed |

---

## Store-by-Store Strategy

### Store 1: Lidl (PRIORITY — Currently Broken)

**Why it fails:** Lidl.de is a React SPA. The HTML has no products — they load via API.

**API Discovery:**
- Lidl's website fetches offers from internal API endpoints
- Known patterns: `https://www.lidl.de/p/api/` prefix
- Their weekly offers use a "gridbox" or "campaign" API
- The Lidl Plus app also uses REST APIs

**Approach:**
1. Open Lidl.de/angebote in Chrome → DevTools → Network tab → filter XHR
2. Find the API call that loads product data
3. Replicate that call in Python with proper headers
4. Parse the JSON response directly — no Claude needed

**Expected data per API response:**
```json
{
  "title": "Milka Alpenmilch Schokolade",
  "price": {"price": 0.99, "basePrice": 1.29},
  "category": "Süßwaren",
  "brand": "Milka",
  "unit": "100g",
  "validFrom": "2026-03-24",
  "validTo": "2026-03-29"
}
```

### Store 2: Aldi Süd (Working — Optimize for More)

**Current:** 46 offers from HTML scraping. Good but not complete.

**API Discovery:**
- Aldi Süd also has internal APIs for their offers
- Their app (ALDI SÜD App) fetches from REST endpoints
- Known pattern: API behind their offers page

**Approach:**
1. Keep current HTML scraping as fallback (it works)
2. Additionally find their API for more complete data
3. Merge results from both sources

### Store 3: Penny (PRIORITY — Currently Broken)

**Why it fails:** Wrong URLs + JS-rendered page.

**API Discovery:**
- Penny is part of REWE Group
- They likely share API infrastructure with REWE
- Penny app uses REST APIs for offers
- Check for API calls on penny.de/angebote

**Approach:**
1. Find Penny's offers API endpoint
2. Call directly with proper headers
3. Parse JSON — no HTML/Claude needed

### Store 4: Kaufland (Working — Optimize)

**Current:** 25 offers. Some Cloudflare issues from local IP but works from GitHub Actions.

**API Discovery:**
- Kaufland has a public-facing offers page
- filiale.kaufland.de has offers data
- Kaufland app uses REST APIs

**Approach:**
1. Keep current approach (works from GitHub Actions)
2. Find API for more complete data
3. Merge results

### Store 5: Netto (PRIORITY — Currently Broken)

**Why it fails:** Access denied / very little content extracted.

**API Discovery:**
- Netto Marken-Discount has an app with offers
- Their website loads offers via JavaScript
- API endpoints behind netto-online.de

**Approach:**
1. Find Netto's offers API
2. Call directly
3. Parse JSON

---

## Implementation Tasks

### Task 1: API Discovery Script
Create a script that probes each store's website to find API endpoints.

**File:** `scrapers/discover_apis.py`

For each store:
1. Fetch the main offers page
2. Extract all URLs from JavaScript files (look for API base URLs)
3. Look for patterns: `/api/`, `/rest/`, `/v1/`, `/graphql/`
4. Look for JSON-LD and `__NEXT_DATA__` or `__INITIAL_STATE__`
5. Try known API patterns for each store
6. Log what works

### Task 2: Store-Specific API Scrapers
Create individual scraper modules that call each store's API directly.

**Files:**
- `scrapers/stores/lidl_api.py`
- `scrapers/stores/aldi_api.py`
- `scrapers/stores/penny_api.py`
- `scrapers/stores/kaufland_api.py`
- `scrapers/stores/netto_api.py`

Each module exports:
```python
def scrape() -> list[dict]:
    """Returns list of offers with brand, product_name, price, etc."""
```

### Task 3: Fallback Chain
For each store, try in order:
1. **Direct API call** (fastest, most reliable)
2. **HTML scraping + Claude** (current approach, as fallback)
3. **Playwright headless** (last resort for JS-rendered pages)

**File:** Update `scrapers/universal_scraper.py` to use this chain.

### Task 4: Playwright Integration
Add Playwright as a fallback for JS-rendered pages.

**File:** `scrapers/playwright_scraper.py`

```python
async def fetch_with_browser(url: str) -> str:
    """Launch headless Chrome, wait for page to fully load, return HTML."""
```

### Task 5: Data Normalization
Standardize product data from different API formats into our unified schema.

**File:** `scrapers/normalizer.py`

```python
def normalize_offer(raw: dict, store: str) -> dict:
    """Convert store-specific format to our schema."""
```

### Task 6: Update GitHub Actions
Add Playwright installation to the workflow for fallback scraping.

### Task 7: Monitoring Dashboard
Add a simple status page or API endpoint that shows scraping health.

**File:** `src/app/api/health/route.ts`

Returns: which stores succeeded, how many offers, last scrape time.

---

## Execution Order

```
Task 1: API Discovery (research, find endpoints)
  └→ Task 2: Store-specific API scrapers (build them)
       └→ Task 3: Fallback chain (integrate into universal_scraper)
            ├→ Task 4: Playwright (add as last-resort fallback)
            └→ Task 5: Normalizer (standardize data)
                 └→ Task 6: Update GitHub Actions
                      └→ Task 7: Health monitoring
```

## Target After Overhaul

| Store | Current | Target | Method |
|-------|---------|--------|--------|
| Lidl | 2 | 50+ | Direct API |
| Aldi Süd | 46 | 60+ | API + HTML fallback |
| Penny | 0 | 40+ | Direct API |
| Kaufland | 25 | 50+ | API + HTML fallback |
| Netto | 0 | 30+ | Direct API |
| **TOTAL** | **73** | **230+** | |

## Success Criteria
- [ ] All 5 stores return 20+ offers each
- [ ] Total offers per scrape: 200+
- [ ] Brand names preserved for 90%+ of products
- [ ] Categories assigned to 100% of products
- [ ] Scrape completes in under 5 minutes
- [ ] Zero Claude API cost for stores with direct API access
- [ ] Fallback chain ensures no store ever returns 0 offers
