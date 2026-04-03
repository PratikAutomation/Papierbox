# Smart Basket — Design Spec

**Feature:** Shopping List Comparison ("Smart Basket")
**Date:** 2026-04-03
**Status:** Approved for implementation

---

## Overview

Users input a grocery list (typed text or photo upload) and Papierbox recommends the single best supermarket to visit this week, showing total cost comparison across all 5 stores with item-by-item breakdown.

## User Flow

1. User toggles to "Compare my list" tab (above existing search box)
2. User types/pastes grocery items OR uploads a photo of their list
3. User selects city, clicks "FIND BEST STORE"
4. Backend: parses list -> normalizes via Claude -> matches DB offers -> estimates missing prices -> runs price matrix
5. Celebration popup: "GO TO PENNY THIS WEEK! Your 12 items cost ~EUR24.30. You save EUR6.20"
6. Below popup: store ranking (all 5 stores) + item-by-item breakdown at recommended store

## Scope (v1)

### In scope
- Tab toggle on main page: "Search a product" | "Compare my list"
- Text input (textarea, one item per line or comma-separated)
- Photo upload with OCR via Claude Vision API
- Claude-powered query normalization (fixes existing search too)
- Price matrix across 5 stores per item
- Single best store recommendation
- Celebration popup with savings amount
- Store ranking cards with offer counts and total costs
- Item breakdown: all items styled identically (same color/weight), separated by a divider line between offers and typical prices. No visual downgrading of estimated prices.
- Price estimate caching table (7-day TTL)
- Regular prices table for verified shelf prices
- Remove "No exact match" suggestion banner from existing search — Claude normalization handles this silently in backend

### Out of scope (v2+)
- Item-by-item picker UI
- Split-shopping recommendations
- Saved lists / user accounts
- Push notifications for list price changes
- Share results
- Receipt scanning

## Architecture

### New API Endpoint

`POST /api/compare`

Request:
```json
{
  "items": "Milk\n2x Butter\nEggs\nChicken breast",
  "image": "base64_string_or_null",
  "city": "hamburg"
}
```

Response:
```json
{
  "parsed_items": [
    { "original": "2x butter", "normalized": "Butter", "qty": 2 }
  ],
  "store_rankings": [
    {
      "store_id": "3",
      "store_name": "Penny",
      "total_cost": 24.30,
      "offer_count": 4,
      "verified_count": 5,
      "estimate_count": 3,
      "savings_vs_worst": 6.20,
      "items": [
        {
          "name": "Butter",
          "name_de": "Deutsche Markenbutter",
          "price": 1.49,
          "original_price": 2.29,
          "unit": "250g",
          "type": "offer",
          "qty": 2,
          "valid_to": "2026-04-04"
        }
      ]
    }
  ],
  "recommended_store_id": "3",
  "total_items": 12,
  "offer_items": 4,
  "verified_items": 5,
  "estimated_items": 3
}
```

### Processing Pipeline (5 steps)

**Step 1: Parse input**
- Text: split by newlines/commas, trim whitespace, filter empty
- Photo: send base64 image to Claude Vision -> get structured item list

**Step 2: Normalize items (Claude Haiku — 1 batch call)**
- Send all raw items in one call
- Returns: canonical German name, English name, brand, category, exclusions
- This same normalization also fixes single-product search

**Step 3: Match against offers DB**
- For each normalized item, call existing `search_offers` RPC
- Use `scoreProduct()` to rank matches per store
- Pick best match per item per store

**Step 4: Fill price gaps**
- First check `regular_prices` table (verified shelf prices)
- Then check `price_estimates` cache (7-day TTL)
- Only call Claude for items not in either table
- One batch Claude call for all remaining unmatched items
- Cache new estimates in `price_estimates`

**Step 5: Calculate price matrix**
- For each store: sum (price * qty) across all items
- Rank by weighted score: `total_cost * (1 + (1 - offer_ratio) * 0.15)`
- Stores with more real data (offers + verified) are preferred over pure estimates
- Tiebreaker within EUR0.50: more real offers wins

### Database Changes

**New table: `regular_prices`**
```sql
CREATE TABLE regular_prices (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  product_normalized TEXT NOT NULL,
  store_id TEXT NOT NULL REFERENCES stores(id),
  unit TEXT NOT NULL,
  verified_price DECIMAL(10,2) NOT NULL,
  source TEXT NOT NULL DEFAULT 'manual_check',
  verified_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  expires_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() + INTERVAL '30 days'),
  UNIQUE(product_normalized, store_id)
);
```

**New table: `price_estimates`**
```sql
CREATE TABLE price_estimates (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  product_normalized TEXT NOT NULL,
  store_id TEXT NOT NULL REFERENCES stores(id),
  unit TEXT NOT NULL,
  estimated_price DECIMAL(10,2) NOT NULL,
  confidence TEXT NOT NULL DEFAULT 'medium',
  estimated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  expires_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() + INTERVAL '7 days'),
  UNIQUE(product_normalized, store_id)
);
```

### Claude API Prompts

**Prompt 1: OCR (photo upload only)**
```
System: You extract grocery items from photos of shopping lists.
Accept handwritten notes, phone screenshots, WhatsApp messages, Notes app screenshots.
Return a JSON array of items exactly as written. Do not interpret or normalize — just extract text.
If you cannot read an item, skip it.
Respond ONLY with a JSON array of strings.

User: [image]
```

**Prompt 2: Normalize (every request)**
```
System: You are a German grocery product search normalizer for papierbox.eu
(compares Lidl, Aldi Sud, Penny, Kaufland, Netto).

Convert raw search input into the best database search terms.
The database contains German product names from weekly supermarket Prospekte.

Rules:
- Return SINGULAR German product name
- Return both German and English terms
- Strip quantities (2x, 3 Stuck) — return just the product
- Correct obvious typos
- For brand names, return brand + generic product
- Return category hint for filtering
- Return exclusion terms to prevent irrelevant matches
- Prefer MOST COMMON grocery interpretation when ambiguous
- Respond ONLY with valid JSON array. No explanation.

User: Normalize these grocery items: {items_json}

Return array of:
{
  "original": "raw input",
  "de": "German product name",
  "en": "English product name",
  "brand": "brand or null",
  "category_de": "German category",
  "category_en": "English category",
  "exclude": ["terms to exclude"],
  "qty": 1
}
```

**Prompt 3: Price estimation (gap-fill only)**
```
System: You estimate typical shelf prices at German DISCOUNT supermarkets.
Stores: Lidl, Aldi Sud, Penny, Kaufland, Netto.

CRITICAL RULES:
- These are DISCOUNT supermarkets. Prices are LOW. Not Rewe/Edeka level.
- Estimate STORE BRAND (Eigenmarke) price, not premium brands
- Round to nearest EUR0.X9 (German pricing convention: 1.09, 1.19, 1.49...)
- When unsure, estimate HIGHER (user prefers finding it cheaper than expected)
- Include unit size you are estimating for
- Set confidence: "high" for staple items, "low" for specialty items
- Respond ONLY with valid JSON array. No explanation.

User: Estimate typical shelf prices for:
{unmatched_items_json}

Return array of:
{
  "product": "name",
  "unit": "size",
  "prices": { "1": X.XX, "2": X.XX, "3": X.XX, "4": X.XX, "5": X.XX },
  "confidence": "high|low"
}
```

### API Cost Per Request

| Call | Model | Estimated Cost | Latency |
|------|-------|---------------|---------|
| OCR (photo only) | Haiku Vision | ~$0.002 | 500ms |
| Normalize | Haiku | ~$0.001 | 300ms |
| Price estimation | Haiku | ~$0.006 | 800ms |
| **Total worst case** | | **~$0.009** | **~1.6s** |

With caching (steady state): ~$0.003/request.
At 200 requests/day = ~$18/month.

### Display Rules

**All items look the same.** No gray/muted styling for estimated prices. No visual hierarchy that makes the app look "empty" or "data-poor" to first-time users.

- All items: same font color, same font weight, same card style
- Offers section: items that are on sale this week, shown with original price crossed out + savings amount
- Divider line (--- style) between offers and typical prices
- Typical prices section: shown at full visual weight, no tilde prefix, no "estimated" badge, no "price may vary" disclaimer
- Backend tracks the data source internally (offer/verified/estimate) but the UI does NOT expose this distinction to users

**Remove "No exact match" banner.** The existing search shows a yellow lightbulb banner "No exact match for X — here are today's best deals instead." This must be removed permanently. Claude normalization handles query fixing silently in the backend. The user should never see a "we couldn't find it" message — just results.

### UI Changes

**File: `src/app/page.tsx`**
- Add tab toggle component between subtext and search box (line ~296)
- When "Search a product" active: show existing search box + trending stickers (no changes)
- When "Compare my list" active: show textarea + photo upload button + city + "FIND BEST STORE"
- New results components: CelebrationPopup, StoreRanking, ItemBreakdown

**New files:**
- `src/app/api/compare/route.ts` — main comparison endpoint
- `src/lib/claude-normalize.ts` — shared normalization logic (used by both /api/search and /api/compare)
- `src/lib/price-matrix.ts` — store ranking algorithm
- `src/lib/types.ts` — add CompareResult, ParsedItem, StoreRanking types

**Modified files:**
- `src/app/page.tsx` — tab toggle, list input UI, results display
- `src/app/api/search/route.ts` — integrate Claude normalization before existing search

### Search Fix (Prerequisite)

The Claude normalization layer (Step 2) is integrated into single-product search too:

Current flow: "Mangos" -> search_offers RPC -> poor results
New flow: "Mangos" -> Claude normalize -> "Mango" + exclude:["gefroren","smoothie"] -> search_offers RPC -> correct results

This is the SAME normalization function used in the list feature. Built once, used everywhere.

### Mockup Reference

Interactive HTML mockup: `docs/mockups/smart-basket-mockup.html`
Shows all 4 states: input, photo upload, loading, results (with celebration popup).
