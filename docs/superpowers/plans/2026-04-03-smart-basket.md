# Smart Basket Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a shopping list comparison feature ("Smart Basket") that lets users input a grocery list and get a single best-store recommendation with full price breakdown across 5 German supermarkets.

**Architecture:** Tab toggle on the existing main page switches between single-product search and list comparison mode. New `/api/compare` endpoint processes lists through a 5-step pipeline: parse -> Claude normalize -> DB match -> price gap-fill -> price matrix ranking. Claude normalization is also integrated into existing `/api/search` to fix search quality (e.g. "Mangos" -> "Mango").

**Tech Stack:** Next.js 14 App Router, TypeScript, Tailwind CSS, Supabase PostgreSQL, Claude Haiku API (normalization + price estimation + OCR)

**Spec:** `docs/superpowers/specs/2026-04-03-smart-basket-design.md`
**Mockup:** `docs/mockups/smart-basket-mockup.html`

---

## File Map

| File | Action | Responsibility |
|------|--------|---------------|
| `src/lib/types.ts` | Modify | Add `CompareResult`, `ParsedItem`, `StoreRanking`, `StoreItemDetail` types |
| `src/lib/claude-normalize.ts` | Create | Claude API calls: normalize, OCR, price estimation. Shared by search + compare. |
| `src/lib/price-matrix.ts` | Create | Store ranking algorithm: build matrix, score stores, pick winner |
| `src/app/api/compare/route.ts` | Create | POST endpoint: orchestrates the 5-step pipeline |
| `src/app/api/search/route.ts` | Modify | Integrate Claude normalization before existing search; remove `isSuggestion` logic |
| `src/app/page.tsx` | Modify | Tab toggle, list input UI, photo upload, celebration popup, store ranking, item breakdown |
| `supabase/schema.sql` | Modify | Add `price_estimates` table DDL (for reference) |

---

### Task 1: Add TypeScript Types

**Files:**
- Modify: `src/lib/types.ts`

- [ ] **Step 1: Add new types to types.ts**

Add these types after the existing `SearchResult` interface at line 40:

```typescript
export interface ParsedItem {
  original: string;
  normalized_de: string;
  normalized_en: string;
  brand: string | null;
  category_de: string;
  category_en: string;
  exclude: string[];
  qty: number;
}

export interface StoreItemDetail {
  name: string;
  name_de: string;
  price: number;
  original_price: number | null;
  unit: string;
  type: 'offer' | 'verified' | 'estimate';
  qty: number;
  valid_to: string | null;
  savings: number | null;
}

export interface StoreRanking {
  store_id: string;
  store_name: string;
  store_brand_color: string;
  total_cost: number;
  offer_count: number;
  items: StoreItemDetail[];
}

export interface CompareResult {
  parsed_items: ParsedItem[];
  store_rankings: StoreRanking[];
  recommended_store_id: string;
  recommended_store_name: string;
  total_items: number;
  savings_vs_worst: number;
}
```

- [ ] **Step 2: Verify build**

Run: `cd /mnt/c/petroject/Project_1 && npx tsc --noEmit`
Expected: No new errors

- [ ] **Step 3: Commit**

```bash
git add src/lib/types.ts
git commit -m "feat: add Smart Basket TypeScript types"
```

---

### Task 2: Create Claude Normalization Module

**Files:**
- Create: `src/lib/claude-normalize.ts`

This module contains all Claude API interactions: normalize search terms, OCR photo extraction, and price estimation for gap-filling.

- [ ] **Step 1: Create `src/lib/claude-normalize.ts`**

```typescript
import { ParsedItem } from './types';

const ANTHROPIC_API_KEY = process.env.ANTHROPIC_API_KEY || '';
const CLAUDE_MODEL = 'claude-haiku-4-5-20251001';

async function callClaude(system: string, user: string, maxTokens = 2048): Promise<string> {
  if (!ANTHROPIC_API_KEY) throw new Error('ANTHROPIC_API_KEY not set');

  const response = await fetch('https://api.anthropic.com/v1/messages', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'x-api-key': ANTHROPIC_API_KEY,
      'anthropic-version': '2023-06-01',
    },
    body: JSON.stringify({
      model: CLAUDE_MODEL,
      max_tokens: maxTokens,
      system,
      messages: [{ role: 'user', content: user }],
    }),
  });

  if (!response.ok) {
    console.error('Claude API error:', response.status, await response.text());
    throw new Error(`Claude API returned ${response.status}`);
  }

  const data = await response.json();
  return data.content?.[0]?.text?.trim() || '';
}

function parseJSON<T>(text: string): T | null {
  let clean = text;
  // Strip markdown code fences if present
  if (clean.startsWith('```')) {
    clean = clean.split('\n').slice(1, -1).join('\n');
  }
  // Fix trailing commas
  clean = clean.replace(/,\s*}/g, '}').replace(/,\s*\]/g, ']');
  try {
    return JSON.parse(clean) as T;
  } catch {
    console.error('Failed to parse Claude JSON:', clean.slice(0, 200));
    return null;
  }
}

// ============================================================
// NORMALIZE: Convert raw search terms into clean DB search terms
// Used by BOTH /api/search (single product) and /api/compare (list)
// ============================================================

const NORMALIZE_SYSTEM = `You are a German grocery product search normalizer for papierbox.eu (compares Lidl, Aldi Sud, Penny, Kaufland, Netto).

Convert raw search input into the best database search terms. The database contains German product names from weekly supermarket Prospekte.

Rules:
- Return SINGULAR German product name
- Return both German and English terms
- Strip quantities (2x, 3 Stuck) — return just the product
- Correct obvious typos
- For brand names, return brand + generic product
- Return category hint for filtering
- Return exclusion terms to prevent irrelevant matches (e.g. for "Mango" exclude "gefroren", "smoothie", "saft", "eis")
- Prefer MOST COMMON grocery interpretation when ambiguous
- Respond ONLY with valid JSON. No explanation.`;

interface NormalizeRaw {
  original: string;
  de: string;
  en: string;
  brand: string | null;
  category_de: string;
  category_en: string;
  exclude: string[];
  qty: number;
}

export async function normalizeItems(rawItems: string[]): Promise<ParsedItem[]> {
  if (rawItems.length === 0) return [];

  const userPrompt = `Normalize these grocery items: ${JSON.stringify(rawItems)}

Return a JSON array. For each item:
{
  "original": "raw input exactly as given",
  "de": "German product name (singular)",
  "en": "English product name",
  "brand": "brand name or null",
  "category_de": "German category",
  "category_en": "English category",
  "exclude": ["terms to exclude from search results"],
  "qty": 1
}`;

  try {
    const text = await callClaude(NORMALIZE_SYSTEM, userPrompt, 2048);
    const parsed = parseJSON<NormalizeRaw[]>(text);
    if (!parsed || !Array.isArray(parsed)) {
      // Fallback: return items as-is
      return rawItems.map(item => ({
        original: item,
        normalized_de: item,
        normalized_en: item,
        brand: null,
        category_de: '',
        category_en: '',
        exclude: [],
        qty: 1,
      }));
    }

    return parsed.map(p => ({
      original: p.original,
      normalized_de: p.de,
      normalized_en: p.en,
      brand: p.brand,
      category_de: p.category_de,
      category_en: p.category_en,
      exclude: p.exclude || [],
      qty: p.qty || 1,
    }));
  } catch (error) {
    console.error('Normalize error:', error);
    return rawItems.map(item => ({
      original: item,
      normalized_de: item,
      normalized_en: item,
      brand: null,
      category_de: '',
      category_en: '',
      exclude: [],
      qty: 1,
    }));
  }
}

// Single-item normalize for existing search
export async function normalizeSingle(query: string): Promise<ParsedItem> {
  const results = await normalizeItems([query]);
  return results[0];
}

// ============================================================
// OCR: Extract grocery items from a photo via Claude Vision
// ============================================================

export async function ocrPhoto(base64Image: string): Promise<string[]> {
  if (!ANTHROPIC_API_KEY) return [];

  try {
    const response = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': ANTHROPIC_API_KEY,
        'anthropic-version': '2023-06-01',
      },
      body: JSON.stringify({
        model: CLAUDE_MODEL,
        max_tokens: 1024,
        system: `You extract grocery items from photos of shopping lists. Accept handwritten notes, phone screenshots, WhatsApp messages, Notes app screenshots. Return a JSON array of item strings exactly as written. Do not interpret or normalize — just extract the text. If you cannot read an item, skip it. Respond ONLY with a JSON array of strings.`,
        messages: [{
          role: 'user',
          content: [
            {
              type: 'image',
              source: {
                type: 'base64',
                media_type: 'image/jpeg',
                data: base64Image,
              },
            },
            { type: 'text', text: 'Extract all grocery items from this shopping list image.' },
          ],
        }],
      }),
    });

    if (!response.ok) return [];
    const data = await response.json();
    const text = data.content?.[0]?.text?.trim() || '[]';
    const items = parseJSON<string[]>(text);
    return items && Array.isArray(items) ? items.filter(i => typeof i === 'string' && i.trim()) : [];
  } catch (error) {
    console.error('OCR error:', error);
    return [];
  }
}

// ============================================================
// PRICE ESTIMATION: Fill gaps for items not found in DB
// ============================================================

interface PriceEstimateRaw {
  product: string;
  unit: string;
  prices: Record<string, number>;
  confidence: string;
}

export interface PriceEstimate {
  product: string;
  unit: string;
  prices: Record<string, number>; // store_id -> price
  confidence: string;
}

const ESTIMATE_SYSTEM = `You estimate typical shelf prices at German DISCOUNT supermarkets.
Stores: Lidl (id 1), Aldi Sud (id 2), Penny (id 3), Kaufland (id 4), Netto (id 5).

CRITICAL RULES:
- These are DISCOUNT supermarkets. Prices are LOW. Not Rewe/Edeka level.
- Estimate STORE BRAND (Eigenmarke) price, not premium brands
- Round to nearest 0.X9 EUR (German pricing convention: 1.09, 1.19, 1.49, 1.99...)
- When unsure, estimate HIGHER rather than lower (user prefers finding it cheaper than expected)
- Include the unit size you are estimating for
- Set confidence: "high" for staple items (milk, bread, eggs), "low" for specialty items
- Respond ONLY with valid JSON array. No explanation.`;

export async function estimatePrices(items: string[]): Promise<PriceEstimate[]> {
  if (items.length === 0) return [];

  const userPrompt = `Estimate typical shelf prices for these products: ${JSON.stringify(items)}

Return a JSON array. For each product:
{
  "product": "product name",
  "unit": "size/unit",
  "prices": { "1": X.XX, "2": X.XX, "3": X.XX, "4": X.XX, "5": X.XX },
  "confidence": "high or low"
}`;

  try {
    const text = await callClaude(ESTIMATE_SYSTEM, userPrompt, 2048);
    const parsed = parseJSON<PriceEstimateRaw[]>(text);
    if (!parsed || !Array.isArray(parsed)) return [];

    return parsed.map(p => ({
      product: p.product,
      unit: p.unit || 'Stk',
      prices: p.prices || {},
      confidence: p.confidence || 'low',
    }));
  } catch (error) {
    console.error('Price estimation error:', error);
    return [];
  }
}
```

- [ ] **Step 2: Verify build**

Run: `cd /mnt/c/petroject/Project_1 && npx tsc --noEmit`
Expected: No new errors

- [ ] **Step 3: Commit**

```bash
git add src/lib/claude-normalize.ts
git commit -m "feat: add Claude normalization, OCR, and price estimation module"
```

---

### Task 3: Create Price Matrix Module

**Files:**
- Create: `src/lib/price-matrix.ts`

- [ ] **Step 1: Create `src/lib/price-matrix.ts`**

```typescript
import { Offer, StoreRanking, StoreItemDetail, ParsedItem } from './types';
import { PriceEstimate } from './claude-normalize';

const STORE_COLORS: Record<string, string> = {
  '1': '#0050AA',  // Lidl
  '2': '#00005F',  // Aldi Sud
  '3': '#CD1719',  // Penny
  '4': '#E10915',  // Kaufland
  '5': '#FFE600',  // Netto
};

const STORE_NAMES: Record<string, string> = {
  '1': 'Lidl',
  '2': 'Aldi Sud',
  '3': 'Penny',
  '4': 'Kaufland',
  '5': 'Netto',
};

const STORE_IDS = ['1', '2', '3', '4', '5'];

interface MatchedItem {
  parsed: ParsedItem;
  offersByStore: Record<string, Offer | null>;
}

interface PriceCell {
  price: number;
  original_price: number | null;
  unit: string;
  type: 'offer' | 'estimate';
  valid_to: string | null;
  product_name: string;
  product_name_de: string;
}

export function buildPriceMatrix(
  parsedItems: ParsedItem[],
  matchedItems: MatchedItem[],
  estimates: PriceEstimate[]
): StoreRanking[] {
  // Build a full price matrix: items x stores
  const matrix: Record<string, Record<string, PriceCell>> = {};

  for (let i = 0; i < parsedItems.length; i++) {
    const itemKey = `item_${i}`;
    const parsed = parsedItems[i];
    const matched = matchedItems[i];
    matrix[itemKey] = {};

    for (const storeId of STORE_IDS) {
      const offer = matched?.offersByStore[storeId] || null;

      if (offer) {
        // Real offer from DB
        matrix[itemKey][storeId] = {
          price: offer.price,
          original_price: offer.originalPrice,
          unit: offer.unit || 'Stk',
          type: 'offer',
          valid_to: offer.validTo,
          product_name: offer.productNameEn || offer.productName,
          product_name_de: offer.productName,
        };
      } else {
        // Look for estimate
        const estimate = estimates.find(
          e => e.product.toLowerCase() === parsed.normalized_de.toLowerCase() ||
               e.product.toLowerCase() === parsed.normalized_en.toLowerCase()
        );

        if (estimate && estimate.prices[storeId]) {
          matrix[itemKey][storeId] = {
            price: estimate.prices[storeId],
            original_price: null,
            unit: estimate.unit,
            type: 'estimate',
            valid_to: null,
            product_name: parsed.normalized_en || parsed.normalized_de,
            product_name_de: parsed.normalized_de,
          };
        } else {
          // Last resort: use average of other stores' estimates or a fallback
          const otherPrices = Object.values(estimate?.prices || {}).filter(p => p > 0);
          const avgPrice = otherPrices.length > 0
            ? Math.round(otherPrices.reduce((a, b) => a + b, 0) / otherPrices.length * 100) / 100
            : 1.99; // absolute fallback

          matrix[itemKey][storeId] = {
            price: avgPrice,
            original_price: null,
            unit: estimate?.unit || 'Stk',
            type: 'estimate',
            valid_to: null,
            product_name: parsed.normalized_en || parsed.normalized_de,
            product_name_de: parsed.normalized_de,
          };
        }
      }
    }
  }

  // Build store rankings
  const rankings: StoreRanking[] = STORE_IDS.map(storeId => {
    let totalCost = 0;
    let offerCount = 0;
    const items: StoreItemDetail[] = [];

    for (let i = 0; i < parsedItems.length; i++) {
      const itemKey = `item_${i}`;
      const cell = matrix[itemKey][storeId];
      const qty = parsedItems[i].qty || 1;
      const itemCost = cell.price * qty;
      totalCost += itemCost;

      if (cell.type === 'offer') offerCount++;

      const savings = cell.original_price ? Math.round((cell.original_price - cell.price) * qty * 100) / 100 : null;

      items.push({
        name: cell.product_name,
        name_de: cell.product_name_de,
        price: cell.price,
        original_price: cell.original_price,
        unit: cell.unit,
        type: cell.type,
        qty,
        valid_to: cell.valid_to,
        savings,
      });
    }

    totalCost = Math.round(totalCost * 100) / 100;

    return {
      store_id: storeId,
      store_name: STORE_NAMES[storeId] || `Store ${storeId}`,
      store_brand_color: STORE_COLORS[storeId] || '#9CA3AF',
      total_cost: totalCost,
      offer_count: offerCount,
      items,
    };
  });

  // Sort: weighted score — prefer lower cost AND more real offers
  rankings.sort((a, b) => {
    const aOfferRatio = a.offer_count / parsedItems.length;
    const bOfferRatio = b.offer_count / parsedItems.length;
    const aScore = a.total_cost * (1 + (1 - aOfferRatio) * 0.15);
    const bScore = b.total_cost * (1 + (1 - bOfferRatio) * 0.15);

    // If within 0.50 EUR, prefer more real offers
    if (Math.abs(aScore - bScore) < 0.50) {
      return b.offer_count - a.offer_count;
    }
    return aScore - bScore;
  });

  return rankings;
}
```

- [ ] **Step 2: Verify build**

Run: `cd /mnt/c/petroject/Project_1 && npx tsc --noEmit`
Expected: No new errors

- [ ] **Step 3: Commit**

```bash
git add src/lib/price-matrix.ts
git commit -m "feat: add price matrix store ranking algorithm"
```

---

### Task 4: Create `/api/compare` Endpoint

**Files:**
- Create: `src/app/api/compare/route.ts`

- [ ] **Step 1: Create the compare API route**

```typescript
import { NextRequest, NextResponse } from 'next/server';
import { supabase } from '@/lib/supabase';
import { Offer, ParsedItem, CompareResult } from '@/lib/types';
import { normalizeItems, ocrPhoto, estimatePrices } from '@/lib/claude-normalize';
import { buildPriceMatrix } from '@/lib/price-matrix';

const STORE_IDS = ['1', '2', '3', '4', '5'];

function sanitizeInput(input: string): string {
  return input.trim().slice(0, 5000).replace(/<[^>]*>/g, '');
}

function parseRawList(text: string): string[] {
  // Split by newlines or commas, trim, filter empty
  return text
    .split(/[\n,]+/)
    .map(line => line.trim())
    .filter(line => line.length > 0 && line.length < 200);
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function mapRowToOffer(row: Record<string, any>): Offer {
  return {
    id: row.id,
    storeId: row.store_id,
    storeName: row.store_name,
    storeBrandColor: row.store_brand_color,
    brand: row.brand,
    productName: row.product_name,
    productNameEn: row.product_name_en,
    category: row.category,
    categoryEn: row.category_en,
    price: row.price,
    originalPrice: row.original_price,
    unit: row.unit,
    validFrom: row.valid_from,
    validTo: row.valid_to,
    isOffer: row.is_offer,
    sourceUrl: row.source_url,
    similarityScore: row.similarity_score,
  };
}

function norm(s: string): string {
  return s.toLowerCase()
    .replace(/ä/g, 'ae').replace(/ö/g, 'oe').replace(/ü/g, 'ue').replace(/ß/g, 'ss')
    .replace(/é/g, 'e').replace(/è/g, 'e').replace(/ê/g, 'e');
}

function pickBestMatch(candidates: Offer[], parsed: ParsedItem): Offer | null {
  // Score and pick the single best match for this item
  const q = norm(parsed.normalized_de);
  const qEn = norm(parsed.normalized_en);
  const excludeTerms = parsed.exclude.map(e => norm(e));

  const scored = candidates
    .filter(offer => {
      // Exclude irrelevant matches
      const pName = norm(offer.productName || '');
      return !excludeTerms.some(ex => pName.includes(ex));
    })
    .map(offer => {
      const pName = norm(offer.productName || '');
      const pNameEn = norm(offer.productNameEn || '');
      const cat = norm(offer.category || '');
      const catEn = norm(offer.categoryEn || '');
      let score = 0;

      // Exact name match
      if (pName.includes(q) || pNameEn.includes(qEn)) score += 200;
      // Category match
      if (cat.includes(q) || catEn.includes(qEn)) score += 150;
      // Brand match
      if (parsed.brand && norm(offer.brand || '').includes(norm(parsed.brand))) score += 100;

      return { offer, score };
    })
    .filter(s => s.score >= 100)
    .sort((a, b) => {
      if (b.score !== a.score) return b.score - a.score;
      // Prefer offers over regular prices
      if (a.offer.isOffer !== b.offer.isOffer) return a.offer.isOffer ? -1 : 1;
      return a.offer.price - b.offer.price;
    });

  return scored.length > 0 ? scored[0].offer : null;
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const rawItems = body.items ? sanitizeInput(body.items) : null;
    const rawImage = body.image || null;
    const city = body.city ? sanitizeInput(body.city) : 'hamburg';

    // STEP 1: Parse input
    let itemStrings: string[] = [];

    if (rawImage) {
      // OCR from photo
      const stripped = rawImage.replace(/^data:image\/\w+;base64,/, '');
      const ocrItems = await ocrPhoto(stripped);
      itemStrings = ocrItems;
    }

    if (rawItems) {
      // Text input (append to OCR results if both provided)
      const textItems = parseRawList(rawItems);
      itemStrings = [...itemStrings, ...textItems];
    }

    if (itemStrings.length === 0) {
      return NextResponse.json({ error: 'No items provided' }, { status: 400 });
    }

    // Cap at 25 items
    itemStrings = itemStrings.slice(0, 25);

    // STEP 2: Normalize via Claude
    const parsedItems = await normalizeItems(itemStrings);

    // STEP 3: Match against DB for each item
    const matchedItems = await Promise.all(
      parsedItems.map(async (parsed) => {
        const searchTerms = [parsed.normalized_de, parsed.normalized_en].filter(Boolean);
        const offersByStore: Record<string, Offer | null> = {};

        // Initialize all stores as null
        for (const sid of STORE_IDS) {
          offersByStore[sid] = null;
        }

        // Search DB with the normalized German term
        const { data: rpcData } = await supabase.rpc('search_offers', {
          search_query: searchTerms[0] || parsed.original,
          city_slug: city,
          result_limit: 50,
        });

        const candidates: Offer[] = (rpcData || []).map((row: Record<string, unknown>) =>
          mapRowToOffer(row as Record<string, any>) // eslint-disable-line @typescript-eslint/no-explicit-any
        );

        // Pick best match per store
        for (const storeId of STORE_IDS) {
          const storeCandidates = candidates.filter(o => o.storeId === storeId);
          offersByStore[storeId] = pickBestMatch(storeCandidates, parsed);
        }

        return { parsed, offersByStore };
      })
    );

    // STEP 4: Find items that need price estimation
    const unmatchedItems: string[] = [];
    for (let i = 0; i < parsedItems.length; i++) {
      const matched = matchedItems[i];
      const hasAnyOffer = STORE_IDS.some(sid => matched.offersByStore[sid] !== null);
      if (!hasAnyOffer) {
        unmatchedItems.push(parsedItems[i].normalized_de);
      }
    }

    // Check price_estimates cache first
    let cachedEstimates: Record<string, Record<string, number>> = {};
    if (unmatchedItems.length > 0) {
      const { data: cached } = await supabase
        .from('price_estimates')
        .select('product_normalized, store_id, estimated_price')
        .in('product_normalized', unmatchedItems.map(i => i.toLowerCase()))
        .gte('expires_at', new Date().toISOString());

      if (cached) {
        for (const row of cached) {
          const key = (row.product_normalized as string).toLowerCase();
          if (!cachedEstimates[key]) cachedEstimates[key] = {};
          cachedEstimates[key][row.store_id as string] = Number(row.estimated_price);
        }
      }
    }

    // Items still needing estimation (not in cache)
    const needEstimation = unmatchedItems.filter(
      item => !cachedEstimates[item.toLowerCase()] ||
              Object.keys(cachedEstimates[item.toLowerCase()]).length < 5
    );

    // Call Claude for remaining items
    const freshEstimates = needEstimation.length > 0
      ? await estimatePrices(needEstimation)
      : [];

    // Cache fresh estimates in DB (fire and forget)
    if (freshEstimates.length > 0) {
      const rows = freshEstimates.flatMap(est =>
        Object.entries(est.prices).map(([storeId, price]) => ({
          product_normalized: est.product.toLowerCase(),
          store_id: storeId,
          unit: est.unit,
          estimated_price: price,
          confidence: est.confidence,
          estimated_at: new Date().toISOString(),
          expires_at: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000).toISOString(),
        }))
      );

      supabase.from('price_estimates').upsert(rows, {
        onConflict: 'product_normalized,store_id',
      }).then(() => {}).catch(err => console.error('Cache write error:', err));
    }

    // Merge cached + fresh estimates
    const allEstimates = [
      ...freshEstimates,
      ...Object.entries(cachedEstimates).map(([product, prices]) => ({
        product,
        unit: 'Stk',
        prices,
        confidence: 'cached',
      })),
    ];

    // STEP 5: Build price matrix and rank stores
    const storeRankings = buildPriceMatrix(parsedItems, matchedItems, allEstimates);

    const winner = storeRankings[0];
    const worstTotal = Math.max(...storeRankings.map(s => s.total_cost));

    const result: CompareResult = {
      parsed_items: parsedItems,
      store_rankings: storeRankings,
      recommended_store_id: winner.store_id,
      recommended_store_name: winner.store_name,
      total_items: parsedItems.length,
      savings_vs_worst: Math.round((worstTotal - winner.total_cost) * 100) / 100,
    };

    return NextResponse.json(
      { data: result },
      {
        status: 200,
        headers: {
          'Cache-Control': 'public, s-maxage=60',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'POST, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type',
        },
      }
    );
  } catch (error) {
    console.error('Compare API error:', error);
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
  }
}

export async function OPTIONS() {
  return NextResponse.json({}, {
    status: 200,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type',
    },
  });
}
```

- [ ] **Step 2: Verify build**

Run: `cd /mnt/c/petroject/Project_1 && npx tsc --noEmit`
Expected: No new errors

- [ ] **Step 3: Commit**

```bash
git add src/app/api/compare/route.ts
git commit -m "feat: add /api/compare endpoint with 5-step pipeline"
```

---

### Task 5: Integrate Claude Normalization into Existing Search + Remove Suggestion Banner

**Files:**
- Modify: `src/app/api/search/route.ts`
- Modify: `src/app/page.tsx` (remove suggestion banner)

- [ ] **Step 1: Update `/api/search` to use Claude normalization**

In `src/app/api/search/route.ts`, add the import at line 3:

```typescript
import { normalizeSingle } from '@/lib/claude-normalize';
```

Then replace the search logic inside the `GET` handler. Find lines 253-268 (the STEP 1 block) and replace with:

```typescript
    // STEP 1: Normalize query via Claude (fixes "Mangos" -> "Mango", typos, etc.)
    let searchTerm = product;
    let excludeTerms: string[] = [];
    try {
      const normalized = await normalizeSingle(product);
      searchTerm = normalized.normalized_de || product;
      excludeTerms = normalized.exclude || [];
    } catch (error) {
      console.error('Normalization failed, using raw query:', error);
    }

    // STEP 2: Get candidates from database (broad search)
    const { data: rpcData, error: rpcError } = await supabase.rpc('search_offers', {
      search_query: searchTerm,
      city_slug: city,
      result_limit: 150,
    });
```

Then update STEP 2 comment at line 269 to say STEP 3, and add exclusion filtering after scoring. Find the `scored` block (lines 270-277) and replace:

```typescript
    // STEP 3: PRECISE scoring — category-aware, word-boundary + Claude exclusion filtering
    const scored = candidates
      .filter(offer => {
        if (excludeTerms.length === 0) return true;
        const pName = norm(offer.productName || '').toLowerCase();
        return !excludeTerms.some(ex => pName.includes(ex.toLowerCase()));
      })
      .map(offer => ({ offer, score: scoreProduct(product, offer) }))
      .filter(s => s.score >= 30)
      .sort((a, b) => {
        if (b.score !== a.score) return b.score - a.score;
        if (a.offer.isOffer !== b.offer.isOffer) return a.offer.isOffer ? -1 : 1;
        return a.offer.price - b.offer.price;
      });
```

Also remove `isSuggestion` from the response object. Find line 308 and remove:

```typescript
          isSuggestion: aiAssisted && offers.length === 0,
```

Replace with nothing (just delete that line). The `SearchResult` type still has `isSuggestion` as optional, so no type error.

- [ ] **Step 2: Remove suggestion banner from page.tsx**

In `src/app/page.tsx`, delete lines 417-425 (the suggestion banner block):

```tsx
                {/* Suggestion Banner */}
                {result.isSuggestion && (
                  <div className="flex items-center gap-3 bg-amber-50 px-6 py-4 rounded-2xl border-2 border-outline mb-6">
                    <span className="material-symbols-outlined text-amber-600">lightbulb</span>
                    <p className="text-on-surface font-bold text-sm">
                      {l.noMatch} &quot;{query}&quot; &mdash; {l.bestDealsInstead}
                    </p>
                  </div>
                )}
```

- [ ] **Step 3: Verify build**

Run: `cd /mnt/c/petroject/Project_1 && npx tsc --noEmit`
Expected: No new errors

- [ ] **Step 4: Test manually**

Run: `cd /mnt/c/petroject/Project_1 && npm run dev`

Test in browser: search for "Mangos" — should now return Mango results correctly. The "No exact match" banner should no longer appear.

- [ ] **Step 5: Commit**

```bash
git add src/app/api/search/route.ts src/app/page.tsx
git commit -m "feat: integrate Claude normalization into search + remove suggestion banner"
```

---

### Task 6: Create `price_estimates` Table in Supabase

**Files:**
- Modify: `supabase/schema.sql` (for reference/documentation)

- [ ] **Step 1: Run SQL in Supabase Dashboard**

Go to Supabase Dashboard -> SQL Editor and run:

```sql
-- Price estimation cache table
CREATE TABLE IF NOT EXISTS price_estimates (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  product_normalized TEXT NOT NULL,
  store_id TEXT NOT NULL REFERENCES stores(id),
  unit TEXT NOT NULL DEFAULT 'Stk',
  estimated_price DECIMAL(10,2) NOT NULL,
  confidence TEXT NOT NULL DEFAULT 'medium',
  estimated_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ DEFAULT (NOW() + INTERVAL '7 days'),
  UNIQUE(product_normalized, store_id)
);

-- Enable RLS
ALTER TABLE price_estimates ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read price_estimates" ON price_estimates FOR SELECT USING (true);
CREATE POLICY "Service insert price_estimates" ON price_estimates FOR INSERT WITH CHECK (true);
CREATE POLICY "Service update price_estimates" ON price_estimates FOR UPDATE USING (true);

-- Index for fast lookups
CREATE INDEX idx_price_estimates_product ON price_estimates(product_normalized);
CREATE INDEX idx_price_estimates_expires ON price_estimates(expires_at);
```

- [ ] **Step 2: Add DDL to schema.sql for reference**

Append the above SQL to `supabase/schema.sql` after the existing tables section (after line 58).

- [ ] **Step 3: Commit**

```bash
git add supabase/schema.sql
git commit -m "feat: add price_estimates cache table"
```

---

### Task 7: Frontend — Tab Toggle and List Input UI

**Files:**
- Modify: `src/app/page.tsx`

This is the largest task. It adds: tab toggle component, list input textarea, photo upload, city selector for list mode, and the "FIND BEST STORE" button.

- [ ] **Step 1: Add new state variables and imports**

At the top of `src/app/page.tsx`, after the existing state declarations (line ~191), add:

```typescript
  const [mode, setMode] = useState<"search" | "list">("search");
  const [listText, setListText] = useState("");
  const [listPhoto, setListPhoto] = useState<string | null>(null);
  const [compareResult, setCompareResult] = useState<CompareResult | null>(null);
  const [compareLoading, setCompareLoading] = useState(false);
  const [showCelebration, setShowCelebration] = useState(false);
  const compareResultsRef = useRef<HTMLDivElement>(null);
  const fileInputRef = useRef<HTMLInputElement>(null);
```

And add the import at line 4:

```typescript
import { CompareResult, StoreRanking, StoreItemDetail } from "@/lib/types";
```

- [ ] **Step 2: Add list item count helper and compare handler**

After the `handleSearch` function (after line 262), add:

```typescript
  const listItemCount = listText.split(/[\n,]+/).filter(l => l.trim()).length;

  async function handleCompare() {
    setMissingField(null);
    if (!listText.trim() && !listPhoto) {
      setMissingField("product");
      setTimeout(() => setMissingField(null), 2000);
      return;
    }
    if (!city) {
      setMissingField("city");
      setTimeout(() => setMissingField(null), 2000);
      return;
    }

    setCompareLoading(true);
    setHasSearched(true);
    try {
      const res = await fetch('/api/compare', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          items: listText || null,
          image: listPhoto || null,
          city,
        }),
      });
      const data = await res.json();
      if (data.data) {
        setCompareResult(data.data);
        setShowCelebration(true);
        setTimeout(() => {
          compareResultsRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
        }, 100);
      }
    } catch {
      setCompareResult(null);
    } finally {
      setCompareLoading(false);
    }
  }

  function handlePhotoUpload(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    if (!file) return;
    const reader = new FileReader();
    reader.onload = (ev) => {
      const base64 = ev.target?.result as string;
      setListPhoto(base64);
    };
    reader.readAsDataURL(file);
  }
```

- [ ] **Step 3: Add tab toggle UI**

In the JSX, find the search box container (line ~297, after the subtext `</p>` tag). Add the tab toggle BEFORE the search box:

```tsx
          {/* Mode Toggle */}
          <div className="flex justify-center mb-8">
            <div className="inline-flex bg-white border-3 border-outline rounded-[2rem] p-1 shadow-neo-hover">
              <button
                onClick={() => setMode("search")}
                className={`px-6 py-3 rounded-[1.6rem] font-headline font-extrabold text-sm flex items-center gap-2 transition-all ${
                  mode === "search"
                    ? "bg-on-surface text-white shadow-neo-hover"
                    : "text-on-surface-variant hover:bg-gray-100"
                }`}
              >
                <span className="material-symbols-outlined text-xl">search</span>
                {lang === "en" ? "Search a product" : "Produkt suchen"}
              </button>
              <button
                onClick={() => setMode("list")}
                className={`px-6 py-3 rounded-[1.6rem] font-headline font-extrabold text-sm flex items-center gap-2 transition-all ${
                  mode === "list"
                    ? "bg-on-surface text-white shadow-neo-hover"
                    : "text-on-surface-variant hover:bg-gray-100"
                }`}
              >
                <span className="material-symbols-outlined text-xl">shopping_cart</span>
                {lang === "en" ? "Compare my list" : "Liste vergleichen"}
              </button>
            </div>
          </div>
```

- [ ] **Step 4: Wrap existing search box in mode conditional**

Wrap the existing search box `<div>` (the one with `bg-white p-2 md:p-3 rounded-[2.5rem]`) and the trending stickers section in:

```tsx
          {mode === "search" && (
            <>
              {/* ... existing search box ... */}
              {/* ... existing trending stickers ... */}
            </>
          )}
```

- [ ] **Step 5: Add list input mode UI**

After the search mode block, add:

```tsx
          {mode === "list" && (
            <>
              <div className="bg-white p-2 md:p-3 rounded-[2.5rem] border-4 border-outline shadow-neo mb-10">
                <div className="relative">
                  <span className="material-symbols-outlined absolute top-6 left-6 text-on-surface-variant text-2xl opacity-50">
                    format_list_bulleted
                  </span>
                  <textarea
                    className="w-full min-h-[180px] pl-16 pr-6 py-5 bg-transparent border-none rounded-t-[2rem] focus:ring-0 text-base font-semibold placeholder:text-slate-300 resize-y leading-relaxed"
                    placeholder={lang === "en"
                      ? "Type your grocery list here...\n\nExample:\nMilk\n2x Butter\nEggs\nChicken breast"
                      : "Einkaufsliste hier eingeben...\n\nBeispiel:\nMilch\n2x Butter\nEier\nHähnchenbrust"
                    }
                    value={listText}
                    onChange={(e) => setListText(e.target.value)}
                  />
                </div>
                <div className="flex items-center justify-between px-4 py-3 border-t-2 border-outline/5">
                  <div className="flex items-center gap-3">
                    <span className="bg-surface-container px-4 py-1.5 rounded-full font-headline font-extrabold text-sm text-on-surface-variant">
                      <strong className="text-primary-dark">{listItemCount}</strong> {lang === "en" ? "items" : "Artikel"}
                    </span>
                    <button
                      onClick={() => fileInputRef.current?.click()}
                      className="flex items-center gap-2 px-5 py-2.5 rounded-full border-2 border-outline bg-white font-headline font-extrabold text-sm shadow-neo-hover hover:translate-y-[-2px] hover:shadow-neo transition-all"
                    >
                      <span className="material-symbols-outlined text-lg text-primary-dark">photo_camera</span>
                      {lang === "en" ? "Upload Photo" : "Foto hochladen"}
                    </button>
                    <input
                      ref={fileInputRef}
                      type="file"
                      accept="image/*"
                      className="hidden"
                      onChange={handlePhotoUpload}
                    />
                    {listPhoto && (
                      <span className="text-primary font-bold text-sm flex items-center gap-1">
                        <span className="material-symbols-outlined text-sm">check_circle</span>
                        {lang === "en" ? "Photo added" : "Foto hinzugefugt"}
                      </span>
                    )}
                  </div>
                </div>
                <div className="flex flex-col md:flex-row gap-2 px-2 pb-2">
                  <div className="flex-1 relative md:border-l-0">
                    <span className="material-symbols-outlined absolute left-6 top-1/2 -translate-y-1/2 text-on-surface-variant text-2xl">
                      location_on
                    </span>
                    <select
                      className={`w-full pl-16 pr-6 py-5 bg-surface-container-low border-2 border-outline/10 rounded-[2rem] focus:ring-0 text-xl font-bold appearance-none cursor-pointer transition-all ${
                        missingField === "city" ? "ring-2 ring-red-400 bg-red-50/50 text-red-500" : ""
                      }`}
                      value={city}
                      onChange={(e) => { setCity(e.target.value); setMissingField(null); }}
                    >
                      <option value="">{lang === "en" ? "Where you at?" : "Wo bist du?"}</option>
                      {CITIES.map((c) => (
                        <option key={c.value} value={c.value}>{c.label}</option>
                      ))}
                    </select>
                  </div>
                  <button
                    onClick={handleCompare}
                    disabled={compareLoading}
                    className="md:w-auto bg-primary text-white font-headline font-black text-xl px-10 py-5 rounded-[2rem] border-2 border-outline shadow-neo hover:scale-[1.02] active:scale-[0.98] transition-all flex items-center justify-center gap-3 neo-button disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    {compareLoading
                      ? (lang === "en" ? "Crunching..." : "Berechne...")
                      : (lang === "en" ? "FIND BEST STORE" : "BESTEN LADEN FINDEN")
                    }
                    <span className="material-symbols-outlined">arrow_forward</span>
                  </button>
                </div>
              </div>
            </>
          )}
```

- [ ] **Step 6: Verify build**

Run: `cd /mnt/c/petroject/Project_1 && npx tsc --noEmit`
Expected: No new errors

- [ ] **Step 7: Test visually**

Run: `cd /mnt/c/petroject/Project_1 && npm run dev`

Open browser, verify:
- Tab toggle appears between subtext and search box
- Clicking "Compare my list" shows textarea input
- Clicking "Search a product" shows original search
- Photo upload button triggers file picker
- Item count updates as you type
- City selector works in list mode

- [ ] **Step 8: Commit**

```bash
git add src/app/page.tsx
git commit -m "feat: add tab toggle and list input UI for Smart Basket"
```

---

### Task 8: Frontend — Celebration Popup + Store Ranking + Item Breakdown

**Files:**
- Modify: `src/app/page.tsx`

- [ ] **Step 1: Add CelebrationPopup component**

After the `RegularPriceCard` component at the end of `page.tsx` (after line ~733), add:

```tsx
// ============================================================
// CELEBRATION POPUP
// ============================================================

function CelebrationPopup({
  result,
  lang,
  onClose,
}: {
  result: CompareResult;
  lang: Lang;
  onClose: () => void;
}) {
  const winner = result.store_rankings[0];
  if (!winner) return null;

  return (
    <div
      className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-6"
      onClick={onClose}
    >
      <div
        className="bg-white border-4 border-outline rounded-[2.5rem] p-12 max-w-lg w-full text-center shadow-[8px_8px_0px_0px_#1a1c1c] animate-[popIn_0.4s_cubic-bezier(0.175,0.885,0.32,1.275)]"
        onClick={(e) => e.stopPropagation()}
      >
        <button onClick={onClose} className="absolute top-4 right-6 text-2xl text-on-surface-variant hover:text-on-surface">
          &times;
        </button>
        <div className="text-4xl mb-4 animate-bounce">&#127881; &#127882; &#10024;</div>
        <div className="font-headline font-extrabold text-base uppercase tracking-[3px] text-primary-dark mb-1">
          {lang === "en" ? "THIS WEEK, GO TO" : "DIESE WOCHE, GEH ZU"}
        </div>
        <div className="font-headline font-black text-5xl md:text-6xl tracking-tighter text-on-surface mb-5">
          {winner.store_name.toUpperCase()}
        </div>
        <div className="inline-flex items-baseline gap-1 bg-primary text-white px-7 py-3 rounded-full font-headline font-black text-3xl border-3 border-outline shadow-neo-hover mb-4">
          <span className="text-xl">&euro;</span>{winner.total_cost.toFixed(2)}
        </div>
        {result.savings_vs_worst > 0 && (
          <div className="flex items-center justify-center gap-2 bg-amber-50 text-amber-800 px-5 py-2.5 rounded-full font-extrabold text-sm border-2 border-amber-400 mb-6 mx-auto w-fit">
            <span className="material-symbols-outlined text-lg">savings</span>
            {lang === "en"
              ? `You save \u20AC${result.savings_vs_worst.toFixed(2)} vs ${result.store_rankings[result.store_rankings.length - 1]?.store_name}`
              : `Du sparst \u20AC${result.savings_vs_worst.toFixed(2)} vs ${result.store_rankings[result.store_rankings.length - 1]?.store_name}`
            }
          </div>
        )}
        <div className="text-on-surface-variant text-sm font-semibold mb-6">
          <strong className="text-primary-dark">{result.total_items}</strong> {lang === "en" ? "items compared across 5 stores" : "Artikel in 5 Laden verglichen"}
        </div>
        <button
          onClick={onClose}
          className="px-8 py-4 bg-on-surface text-white font-headline font-black rounded-full border-2 border-outline shadow-neo-hover hover:translate-y-[-2px] hover:shadow-neo transition-all inline-flex items-center gap-2"
        >
          {lang === "en" ? "SEE FULL BREAKDOWN" : "DETAILS ANZEIGEN"}
          <span className="material-symbols-outlined text-lg">arrow_downward</span>
        </button>
      </div>
    </div>
  );
}

// ============================================================
// STORE RANKING CARD
// ============================================================

function StoreRankCard({
  ranking,
  index,
  isWinner,
  maxCost,
}: {
  ranking: StoreRanking;
  index: number;
  isWinner: boolean;
  maxCost: number;
}) {
  const medals = ["\u{1F947}", "\u{1F948}", "\u{1F949}"];
  const barPercent = maxCost > 0 ? Math.round((ranking.total_cost / maxCost) * 100) : 0;
  const barColors = ['var(--primary-container)', '#94a3b8', '#f97316', '#d1d5db', '#d1d5db'];

  return (
    <div className={`flex items-center gap-4 px-6 py-5 bg-white rounded-[2rem] transition-all hover:translate-y-[-2px] ${
      isWinner
        ? "border-4 border-outline shadow-neo"
        : "border-2 border-outline/10 hover:border-outline hover:shadow-neo-hover"
    }`}>
      <div className={`w-11 h-11 rounded-xl flex items-center justify-center text-xl font-black flex-shrink-0 ${
        index === 0 ? "bg-amber-100 border-2 border-amber-400" :
        index === 1 ? "bg-slate-100 border-2 border-slate-400" :
        index === 2 ? "bg-orange-100 border-2 border-orange-400" :
        "bg-gray-100 border-2 border-gray-300 font-headline text-on-surface-variant"
      }`}>
        {index < 3 ? medals[index] : index + 1}
      </div>
      <div className="flex-1 min-w-0">
        <div className="font-headline font-extrabold text-lg flex items-center gap-2">
          {ranking.store_name}
          {isWinner && (
            <span className="bg-primary text-white text-xs font-black px-2.5 py-0.5 rounded-full border-2 border-outline uppercase tracking-wider">
              Best Pick
            </span>
          )}
        </div>
        <div className="text-primary-dark font-bold text-xs">
          {ranking.offer_count} {ranking.offer_count === 1 ? "item on sale" : "items on sale"} this week
        </div>
      </div>
      <div className="hidden sm:block flex-1 min-w-0">
        <div className="h-2.5 bg-gray-100 rounded-full overflow-hidden">
          <div
            className="h-full rounded-full transition-all duration-1000"
            style={{ width: `${barPercent}%`, backgroundColor: barColors[index] || '#d1d5db' }}
          />
        </div>
      </div>
      <div className={`font-headline font-black text-2xl flex-shrink-0 ${isWinner ? "text-primary-dark" : ""}`}>
        &euro;{ranking.total_cost.toFixed(2)}
      </div>
    </div>
  );
}

// ============================================================
// ITEM BREAKDOWN
// ============================================================

function ItemBreakdown({
  ranking,
  lang,
}: {
  ranking: StoreRanking;
  lang: Lang;
}) {
  const offers = ranking.items.filter(i => i.type === 'offer');
  const typical = ranking.items.filter(i => i.type !== 'offer');

  return (
    <div className="bg-white border-4 border-outline rounded-[2.5rem] overflow-hidden shadow-neo">
      <div className="px-7 py-5 border-b-3 border-outline flex items-center justify-between">
        <h3 className="font-headline font-extrabold text-xl flex items-center gap-2">
          <span className="material-symbols-outlined text-primary">receipt_long</span>
          {lang === "en" ? `Item breakdown at ${ranking.store_name}` : `Artikelaufstellung bei ${ranking.store_name}`}
        </h3>
        <span className="font-headline font-extrabold text-sm text-on-surface-variant">
          {ranking.items.length} {lang === "en" ? "items" : "Artikel"}
        </span>
      </div>

      {/* Offer items */}
      <ul className="divide-y divide-outline/5">
        {offers.map((item, i) => (
          <li key={`offer-${i}`} className="flex items-center gap-4 px-7 py-4 hover:bg-surface-container-lowest transition-colors">
            <div className="w-9 h-9 rounded-xl bg-primary/15 text-primary-dark flex items-center justify-center flex-shrink-0">
              <span className="material-symbols-outlined text-lg">local_fire_department</span>
            </div>
            <div className="flex-1 min-w-0">
              <div className="font-bold text-sm">{item.name_de || item.name}{item.qty > 1 ? ` x${item.qty}` : ''}</div>
              <div className="text-xs font-semibold text-on-surface-variant">{item.unit}{item.valid_to ? ` \u00B7 Valid until ${item.valid_to}` : ''}</div>
            </div>
            <span className="bg-primary text-white text-xs font-extrabold px-2.5 py-0.5 rounded-full border-1.5 border-outline uppercase flex-shrink-0">
              {lang === "en" ? "ON SALE" : "ANGEBOT"}
            </span>
            <div className="text-right flex-shrink-0">
              {item.original_price && (
                <div className="text-xs text-on-surface-variant/40 line-through font-semibold">&euro;{item.original_price.toFixed(2)}</div>
              )}
              <div className="font-headline font-black text-lg">&euro;{item.price.toFixed(2)}</div>
              {item.savings && item.savings > 0 && (
                <div className="text-xs text-primary-dark font-extrabold">save &euro;{item.savings.toFixed(2)}</div>
              )}
            </div>
          </li>
        ))}
      </ul>

      {/* Divider */}
      {offers.length > 0 && typical.length > 0 && (
        <div className="flex items-center gap-3 px-7 py-3 bg-surface-container-lowest">
          <div className="flex-1 border-t-2 border-dashed border-outline/10" />
          <span className="text-xs font-extrabold uppercase tracking-widest text-on-surface-variant whitespace-nowrap">
            {lang === "en" ? "Typical prices" : "Typische Preise"}
          </span>
          <div className="flex-1 border-t-2 border-dashed border-outline/10" />
        </div>
      )}

      {/* Typical price items — same visual style as offers */}
      <ul className="divide-y divide-outline/5">
        {typical.map((item, i) => (
          <li key={`typical-${i}`} className="flex items-center gap-4 px-7 py-4 hover:bg-surface-container-lowest transition-colors">
            <div className="w-9 h-9 rounded-xl bg-primary/15 text-primary-dark flex items-center justify-center flex-shrink-0">
              <span className="material-symbols-outlined text-lg">shopping_basket</span>
            </div>
            <div className="flex-1 min-w-0">
              <div className="font-bold text-sm">{item.name_de || item.name}{item.qty > 1 ? ` x${item.qty}` : ''}</div>
              <div className="text-xs font-semibold text-on-surface-variant">{item.unit}</div>
            </div>
            <div className="text-right flex-shrink-0">
              <div className="font-headline font-black text-lg">&euro;{item.price.toFixed(2)}</div>
            </div>
          </li>
        ))}
      </ul>

      {/* Total */}
      <div className="flex items-center justify-between px-7 py-5 bg-on-surface text-white">
        <div>
          <div className="font-headline font-extrabold text-lg">
            {lang === "en" ? `TOTAL AT ${ranking.store_name.toUpperCase()}` : `GESAMT BEI ${ranking.store_name.toUpperCase()}`}
          </div>
          <div className="text-xs opacity-60 font-semibold">{ranking.items.length} {lang === "en" ? "items" : "Artikel"}</div>
        </div>
        <div className="font-headline font-black text-3xl">&euro;{ranking.total_cost.toFixed(2)}</div>
      </div>
    </div>
  );
}
```

- [ ] **Step 2: Add compare results rendering in the results section**

In the results section of the JSX (inside `{hasSearched && (...)}`), after the existing search results block, add the compare results. Find the closing of the search results section and add a new block for compare mode. Wrap the existing results in `{mode === "search" && (...)}` and add:

```tsx
            {mode === "list" && compareResult && !compareLoading && (
              <div ref={compareResultsRef} className="scroll-mt-24">
                {/* Summary */}
                <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-6 mb-8 bg-white border-4 border-outline p-8 rounded-[2.5rem] shadow-neo">
                  <div>
                    <h2 className="font-headline font-black text-3xl text-on-surface mb-1">
                      {lang === "en" ? `Your Grocery List in ${getCityLabel(city)}` : `Deine Einkaufsliste in ${getCityLabel(city)}`}
                    </h2>
                    <div className="flex items-center gap-2">
                      <span className="flex h-3 w-3 rounded-full bg-primary animate-pulse"></span>
                      <p className="text-on-surface-variant font-bold text-lg uppercase tracking-tight">
                        {compareResult.total_items} {lang === "en" ? "items compared across 5 stores" : "Artikel in 5 Laden verglichen"}
                      </p>
                    </div>
                  </div>
                </div>

                {/* Store Ranking */}
                <div className="flex flex-col gap-3 mb-8">
                  {compareResult.store_rankings.map((ranking, index) => (
                    <StoreRankCard
                      key={ranking.store_id}
                      ranking={ranking}
                      index={index}
                      isWinner={index === 0}
                      maxCost={Math.max(...compareResult.store_rankings.map(r => r.total_cost))}
                    />
                  ))}
                </div>

                {/* Item Breakdown for winner */}
                <ItemBreakdown ranking={compareResult.store_rankings[0]} lang={lang} />
              </div>
            )}

            {mode === "list" && compareLoading && (
              <div className="flex flex-col items-center justify-center py-20 gap-4">
                <span className="material-symbols-outlined text-5xl text-primary animate-spin">
                  progress_activity
                </span>
                <p className="font-headline font-bold text-xl text-on-surface">
                  {lang === "en" ? "Crunching numbers across 5 stores..." : "Preise werden verglichen..."}
                </p>
                <p className="text-on-surface-variant font-semibold text-sm">
                  {lang === "en" ? "This takes ~5 seconds" : "Das dauert ~5 Sekunden"}
                </p>
              </div>
            )}
```

- [ ] **Step 3: Add celebration popup rendering**

At the very end of the return JSX, just before the closing `</div>` of the root element (before `<Footer />`), add:

```tsx
      {/* Celebration Popup */}
      {showCelebration && compareResult && (
        <CelebrationPopup
          result={compareResult}
          lang={lang}
          onClose={() => setShowCelebration(false)}
        />
      )}
```

- [ ] **Step 4: Add popIn keyframe to globals.css**

In `src/app/globals.css`, add after the `.shadow-neo-hover` rule:

```css
@keyframes popIn {
  from { transform: scale(0.8); opacity: 0; }
  to { transform: scale(1); opacity: 1; }
}
```

- [ ] **Step 5: Verify build**

Run: `cd /mnt/c/petroject/Project_1 && npx tsc --noEmit`
Expected: No new errors

- [ ] **Step 6: Full visual test**

Run: `cd /mnt/c/petroject/Project_1 && npm run dev`

Test the complete flow:
1. Switch to "Compare my list" tab
2. Type a list: "Milk, Butter, Eggs, Coffee, Pasta, Mango"
3. Select Hamburg
4. Click "FIND BEST STORE"
5. Verify: loading spinner -> celebration popup -> store rankings -> item breakdown
6. Verify all items show same styling (no gray/muted for estimates)
7. Verify divider line between offers and typical prices
8. Switch back to "Search a product" — verify original search still works
9. Test on mobile viewport

- [ ] **Step 7: Commit**

```bash
git add src/app/page.tsx src/app/globals.css
git commit -m "feat: add celebration popup, store ranking, and item breakdown UI"
```

---

### Task 9: Final Build Verification and Production Test

- [ ] **Step 1: Run lint**

Run: `cd /mnt/c/petroject/Project_1 && npm run lint`
Expected: No errors (warnings OK)

- [ ] **Step 2: Run production build**

Run: `cd /mnt/c/petroject/Project_1 && npm run build`
Expected: Build succeeds with no errors

- [ ] **Step 3: Test production server**

Run: `cd /mnt/c/petroject/Project_1 && npm run start`
Test all flows in browser at localhost:3000

- [ ] **Step 4: Final commit**

```bash
git add -A
git commit -m "feat: Smart Basket v1 — shopping list comparison with store recommendation"
```
