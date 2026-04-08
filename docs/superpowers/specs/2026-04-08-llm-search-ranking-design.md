# LLM-Powered Search Ranking — Design Spec

**Date:** 2026-04-08
**Status:** Approved
**Goal:** Replace keyword-based `scoreProduct()` with Claude Haiku LLM ranking to achieve ~95% search accuracy.

## Problem

The current `scoreProduct()` function uses keyword/category matching that fails for:
- English queries with no German product match ("Eggs" → no "Eier" products in DB)
- German compound words ("Milchreis" incorrectly matching "Milch" search)
- Generic queries where multiple irrelevant products score equally
- Compare feature's `pickBestMatch()` selecting wrong products

Users are getting Chicken Salami for "Eggs" and Rice Pudding for "Milk". This is destroying trust.

## Architecture

```
User query ("Eggs", Hamburg)
  │
  ├─ Step 1: Local normalizer → {de: "Eier", en: "Eggs", category_hint: "Eier"}
  │
  ├─ Step 2: Supabase RPC search_offers("Eier", "hamburg", 100)
  │          + search_offers("Eggs", "hamburg", 50) — deduplicated
  │          → ~50-100 fuzzy candidates
  │
  ├─ Step 3: Claude Haiku rankWithClaude(query, candidates)
  │          Input: user query + candidate list (id, name, name_en, brand, category, price, unit)
  │          Output: ordered array of matching product IDs
  │          Latency: ~0.5-1.5s
  │
  ├─ Step 4: If <2 matches → estimatePrices() fallback (existing)
  │          Claude estimates typical shelf prices per store
  │
  └─ Step 5: Return response (unchanged format)
             {offers: [...], regularPrices: [...]}
```

## Claude Prompt

```
You are a grocery product matcher for a German supermarket price comparison app.

User searched: "{query}"

Here are products from our database:
{JSON array of candidates with fields: id, product_name, product_name_en, brand, category_en, price, unit}

Return ONLY the IDs of products that genuinely match what the user wants to buy, ranked best-match first.

Matching rules:
- Understand intent: "Eggs" = Eier (chicken eggs for cooking/eating)
- German compound words are tricky:
  - Milchreis (rice pudding) is NOT Milch (milk)
  - Buttermilch (buttermilk) is NOT Butter
  - Erdnussbutter (peanut butter) is NOT Butter
  - Eier-Spätzle (egg pasta) is NOT Eier (eggs)
  - Kinder Überraschungsei (chocolate toy) is NOT Eier (eggs)
- Include related variants: for "Milk" include whole milk, low-fat milk, lactose-free milk, plant milk
- Exclude products that merely contain the ingredient: "Eggs" should NOT return egg pasta, egg liqueur, or products with eggs as a sub-ingredient
- If NOTHING genuinely matches, return empty array

Return valid JSON only: {"matches": [id1, id2, id3, ...]}
```

## Files Changed

### 1. `src/lib/claude-normalize.ts`
Add new exported function:

```typescript
export async function rankWithClaude(
  query: string,
  candidates: {id: string, product_name: string, product_name_en: string, brand: string, category_en: string, price: number, unit: string}[]
): Promise<string[]>
```

- Calls Claude Haiku with the prompt above
- Returns ordered array of matching product IDs
- On failure (API error, bad JSON): returns empty array (caller falls back to scoreProduct)

### 2. `src/app/api/search/route.ts`
- After RPC returns candidates, call `rankWithClaude(query, candidates)`
- If Claude returns matches: use those IDs to filter and order results
- If Claude returns empty or fails: fall back to existing `scoreProduct()` logic
- Rest of the pipeline unchanged (price estimation fallback, response format)

### 3. `src/app/api/compare/route.ts`
- Replace `pickBestMatch()` internals with Claude call
- For each item in grocery list: include in a single batch Claude call
- Prompt variation: "For each item in this grocery list, pick the single best matching product"
- Fallback: existing `pickBestMatch()` keyword logic

## Cost

- Model: claude-haiku-4-5-20251001
- Input: ~1,500 tokens (prompt + 50-100 candidates)
- Output: ~100 tokens (JSON array of IDs)
- Cost per search: ~$0.003
- Current traffic: ~30-50 searches/day = ~$0.15/day = ~$4.50/month
- No caching — always fresh results

## Error Handling

| Scenario | Behavior |
|----------|----------|
| Claude API timeout (>5s) | Fall back to scoreProduct() |
| Claude API error (rate limit, auth) | Fall back to scoreProduct() |
| Claude returns invalid JSON | Fall back to scoreProduct() |
| Claude returns empty matches | Trigger price estimation fallback |
| ANTHROPIC_API_KEY not set | Fall back to scoreProduct() |

## What Stays Unchanged

- Supabase RPC `search_offers` — still fetches candidates
- Local normalizer — still translates EN→DE for RPC query
- Response format — offers[] + regularPrices[] structure identical
- UI — zero frontend changes
- Price estimation — still triggers when <2 results
- Autocomplete endpoint — unchanged (DB-only)

## Success Criteria

- "Eggs" search returns actual egg products (or "no results" + estimated prices if none in DB)
- "Milk" search returns actual milk, not rice pudding
- "Butter" search returns butter, not butter croissant
- Compare feature: "milk" in grocery list matches actual milk product
- Latency stays under 2 seconds total
- Graceful fallback when Claude API is unavailable
