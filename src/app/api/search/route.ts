import { NextRequest, NextResponse } from 'next/server';
import { supabase } from '@/lib/supabase';
import { Offer, SearchResult } from '@/lib/types';
import { normalizeSingle } from '@/lib/claude-normalize';

const ANTHROPIC_API_KEY = process.env.ANTHROPIC_API_KEY || '';
const MAX_OFFERS = 8;
const MAX_REGULAR = 3;

function sanitizeInput(input: string): string {
  return input.trim().slice(0, 100).replace(/<[^>]*>/g, '');
}

function norm(s: string): string {
  return s.toLowerCase()
    .replace(/ä/g, 'ae').replace(/ö/g, 'oe').replace(/ü/g, 'ue').replace(/ß/g, 'ss')
    .replace(/é/g, 'e').replace(/è/g, 'e').replace(/ê/g, 'e');
}

/**
 * PRECISE PRODUCT MATCHING
 *
 * Core principle: If user searches "butter", show ONLY butter.
 * Not butter croissants, not buttermilk, not butter biscuits.
 *
 * How: Check if the search query matches the product's CATEGORY.
 * A product's category tells us what the product IS.
 * "Butter Croissant" → category is "Bakery" → NOT butter.
 * "Kerrygold Butter" → category is "Butter/Dairy" → IS butter.
 */
function scoreProduct(query: string, offer: Offer): number {
  const q = norm(query);
  const qWords = q.split(/\s+/).filter(w => w.length >= 2);

  const pName = norm(offer.productName || '');
  const pNameEn = norm(offer.productNameEn || '');
  const brand = norm(offer.brand || '');
  const cat = norm(offer.category || '');
  const catEn = norm(offer.categoryEn || '');

  let score = 0;

  // ===================================================
  // TIER 1: EXACT PRODUCT MATCH (highest priority)
  // Full query appears in product name OR product name appears in query
  // "mango" in "Mango" ✓, "mangos" contains "mango" ✓
  // ===================================================
  if (pName.includes(q) || pNameEn.includes(q) || q.includes(pName) || q.includes(pNameEn)) {
    score += 200;
  }

  // ===================================================
  // TIER 2: CATEGORY MATCH (most important for generic searches)
  // User searches "butter" → category IS "butter" or "dairy"
  // This is what separates real butter from butter croissants
  // ===================================================
  const categoryMatch =
    cat.includes(q) || catEn.includes(q) ||
    qWords.some(w => cat === w || catEn === w) ||
    qWords.some(w => cat.includes(w) && w.length >= 4) ||
    qWords.some(w => catEn.includes(w) && w.length >= 4);

  if (categoryMatch) {
    score += 150;
  }

  // ===================================================
  // TIER 3: BRAND MATCH
  // User searches "kerrygold" or "milka"
  // Must be exact brand match, not substring
  // "milk" should NOT match brand "milka"
  // ===================================================
  const brandWords = brand.split(/\s+/);
  const brandMatch = qWords.some(w =>
    brandWords.some(bw => bw === w) || brand === q
  );
  if (brandMatch) {
    score += 100;
  }

  // ===================================================
  // TIER 4: PRODUCT NAME WORD MATCH
  // Check how many query words appear in product name
  // Handles stems: "mangos" matches "mango", "tomatoes" matches "tomate"
  // ===================================================
  let nameWordMatches = 0;
  for (const w of qWords) {
    // Word boundary check: "milk" matches "Milk 1L" but not "Milka"
    const wbRegex = new RegExp(`(?:^|[\\s,./\\-_()])${w}(?:[\\s,./\\-_()]|$)`, 'i');
    // Also check stem overlap: shorter of (query word, product word) is substring of longer
    const stemMatch = pName.split(/\s+/).some(pw => pw.includes(w) || w.includes(pw)) ||
                      pNameEn.split(/\s+/).some(pw => pw.includes(w) || w.includes(pw));
    if (wbRegex.test(pName) || wbRegex.test(pNameEn) || stemMatch) {
      nameWordMatches++;
      score += 30;
    }
  }

  // ===================================================
  // STRICT FILTER: For generic product searches, category MUST match.
  // If it doesn't → score = 0. No exceptions.
  //
  // "butter" → category must contain "butter" or "dairy/milchprodukte"
  // "milk" → category must contain "milk" or "milch" or "dairy"
  // "Buttered Vegetables" (Frozen) → ZERO. Not butter.
  // "Milka Chocolate" (Sweets) → ZERO. Not milk.
  // ===================================================
  const commonProducts = [
    'butter', 'milk', 'milch', 'bread', 'brot', 'cheese', 'kaese',
    'coffee', 'kaffee', 'tea', 'tee', 'sugar', 'zucker', 'flour', 'mehl',
    'rice', 'reis', 'pasta', 'nudeln', 'oil', 'oel', 'water', 'wasser',
    'juice', 'saft', 'yogurt', 'joghurt', 'cream', 'sahne', 'egg', 'eier',
    'chicken', 'haehnchen', 'beef', 'rind', 'pork', 'schwein', 'fish', 'fisch',
    'salmon', 'lachs', 'chocolate', 'schokolade', 'chips', 'ice', 'eis',
    'beer', 'bier', 'wine', 'wein', 'sekt', 'vodka', 'whisky',
    'ham', 'schinken', 'sausage', 'wurst', 'salami',
  ];

  const isGenericSearch = qWords.length <= 2 && qWords.some(w => commonProducts.includes(w));

  if (isGenericSearch && !categoryMatch) {
    // Generic product search but category doesn't match → KILL IT
    // "butter" search + "Frozen" category = 0
    // "milk" search + "Sweets" category = 0
    return 0;
  }

  // ===================================================
  // MULTI-WORD BONUS: More matching words = better
  // "Kerrygold Irish Butter" → all 3 words match = high score
  // ===================================================
  if (qWords.length > 1) {
    const totalMatches = nameWordMatches + (brandMatch ? 1 : 0) + (categoryMatch ? 1 : 0);
    const ratio = totalMatches / qWords.length;
    if (ratio >= 0.8) score += 50; // Almost all words match
    else if (ratio < 0.3) score = Math.floor(score * 0.2); // Very few words match
  }

  return score;
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

async function claudeEstimate(query: string): Promise<Offer[]> {
  if (!ANTHROPIC_API_KEY) return [];

  const storeColors: Record<string, string> = {
    'Lidl': '#0050AA', 'Aldi Süd': '#00005F', 'Penny': '#CD1719',
    'Kaufland': '#E10915', 'Netto': '#FFE600',
  };

  try {
    const response = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': ANTHROPIC_API_KEY,
        'anthropic-version': '2023-06-01',
      },
      body: JSON.stringify({
        model: 'claude-haiku-4-5-20251001',
        max_tokens: 2048,
        messages: [{
          role: 'user',
          content: `You are a German grocery pricing expert. A user searched for "${query}" on a grocery price comparison website, but we have no matching offers.

Provide estimated typical prices for EXACTLY this product (not related products).

If user searched "butter", return ONLY butter — not butter croissants or buttermilk.
If user searched "Kerrygold Irish Butter", return ONLY Kerrygold Irish Butter.

Return a JSON array with up to 5 entries:
- brand: string
- product_name: string (full name)
- product_name_en: string (English)
- category: string (German)
- category_en: string (English)
- price: number (EUR)
- unit: string
- store: string (Lidl/Aldi Süd/Penny/Kaufland/Netto)

Return ONLY the JSON array. If you can't identify the product, return [].`,
        }],
      }),
    });

    if (!response.ok) return [];
    const data = await response.json();
    const text = data.content?.[0]?.text?.trim() || '[]';
    let clean = text;
    if (clean.startsWith('```')) clean = clean.split('\n').slice(1, -1).join('\n');
    clean = clean.replace(/,\s*}/g, '}').replace(/,\s*\]/g, ']');

    const products = JSON.parse(clean);
    if (!Array.isArray(products)) return [];

    return products
      .filter((p: Record<string, unknown>) => p.product_name && p.price && Number(p.price) > 0)
      .map((p: Record<string, unknown>): Offer => ({
        id: `ai-${Math.random().toString(36).slice(2, 10)}`,
        storeId: '0',
        storeName: (p.store as string) || 'Estimated',
        storeBrandColor: storeColors[(p.store as string)] || '#9CA3AF',
        brand: (p.brand as string) || 'Eigenmarke',
        productName: p.product_name as string,
        productNameEn: (p.product_name_en as string) || (p.product_name as string),
        category: (p.category as string) || '',
        categoryEn: (p.category_en as string) || '',
        price: Number(p.price),
        originalPrice: null,
        unit: (p.unit as string) || 'Stück',
        validFrom: '', validTo: '', isOffer: false, sourceUrl: '',
      }));
  } catch (error) {
    console.error('Claude estimate error:', error);
    return [];
  }
}

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const rawProduct = searchParams.get('product');
    const rawCity = searchParams.get('city');

    if (!rawProduct) {
      return NextResponse.json({ error: 'Product parameter is required' }, { status: 400 });
    }

    const product = sanitizeInput(rawProduct);
    const city = rawCity ? sanitizeInput(rawCity) : 'hamburg';

    if (product === '') {
      return NextResponse.json({ error: 'Product parameter must be non-empty' }, { status: 400 });
    }

    // STEP 1: Normalize query (local + Claude if available)
    const normalized = await normalizeSingle(product);
    const searchTerm = normalized.normalized_de || product;
    const excludeTerms = normalized.exclude || [];

    // STEP 2: Get candidates from database — search with BOTH normalized and original terms
    const { data: rpcData, error: rpcError } = await supabase.rpc('search_offers', {
      search_query: searchTerm,
      city_slug: city,
      result_limit: 150,
    });

    // Also search with original term if different from normalized (catches more results)
    let extraCandidates: Record<string, unknown>[] = [];
    if (searchTerm.toLowerCase() !== product.toLowerCase()) {
      const { data: extraData } = await supabase.rpc('search_offers', {
        search_query: product,
        city_slug: city,
        result_limit: 50,
      });
      extraCandidates = extraData || [];
    }

    if (rpcError) {
      console.error('Supabase RPC error:', rpcError);
      return NextResponse.json({ error: 'Database query failed' }, { status: 500 });
    }

    // Merge and deduplicate candidates
    const allRows = [...(rpcData || []), ...extraCandidates];
    const seenIds = new Set<string>();
    const candidates: Offer[] = [];
    for (const row of allRows) {
      const r = row as Record<string, any>; // eslint-disable-line @typescript-eslint/no-explicit-any
      if (!seenIds.has(r.id)) {
        seenIds.add(r.id);
        candidates.push(mapRowToOffer(r));
      }
    }

    // STEP 3: PRECISE scoring — score with BOTH normalized and original terms, take best
    // This is critical: Claude normalizes "milk 3.5 fat 2 packets" → "Milch"
    // Scoring with "Milch" matches German products, scoring with original catches English matches
    const searchTermEn = normalized.normalized_en || product;
    const scored = candidates
      .filter(offer => {
        if (excludeTerms.length === 0) return true;
        const pName = norm(offer.productName || '').toLowerCase();
        return !excludeTerms.some(ex => pName.includes(ex.toLowerCase()));
      })
      .map(offer => {
        // Score with all available terms, take the best score
        const scoreOriginal = scoreProduct(product, offer);
        const scoreNormDE = scoreProduct(searchTerm, offer);
        const scoreNormEN = scoreProduct(searchTermEn, offer);
        return { offer, score: Math.max(scoreOriginal, scoreNormDE, scoreNormEN) };
      })
      .filter(s => s.score >= 30)
      .sort((a, b) => {
        if (b.score !== a.score) return b.score - a.score;
        if (a.offer.isOffer !== b.offer.isOffer) return a.offer.isOffer ? -1 : 1;
        return a.offer.price - b.offer.price;
      });

    // STEP 3: Limit results
    const allRelevant = scored.map(s => s.offer);
    const offers = allRelevant.filter(i => i.isOffer).slice(0, MAX_OFFERS);
    const regularPrices = allRelevant.filter(i => !i.isOffer).slice(0, MAX_REGULAR);

    // STEP 4: Claude fallback if too few results
    let aiAssisted = false;
    if ((offers.length + regularPrices.length) < 2 && ANTHROPIC_API_KEY) {
      console.log(`[AI Fallback] "${product}" — ${offers.length + regularPrices.length} results, asking Claude...`);
      const aiEstimates = await claudeEstimate(product);
      if (aiEstimates.length > 0) {
        aiEstimates.forEach(e => regularPrices.push(e));
        aiAssisted = true;
      }
    }

    // STEP 5: Build response
    const offerPrices = offers.map(o => o.price);
    const bestPrice = offerPrices.length > 0 ? Math.min(...offerPrices) : null;
    const worstPrice = offerPrices.length > 0 ? Math.max(...offerPrices) : null;
    const savingsAmount = bestPrice !== null && worstPrice !== null ? worstPrice - bestPrice : null;

    return NextResponse.json(
      {
        data: {
          product, city, offers, regularPrices,
          bestPrice, worstPrice, savingsAmount,
          totalOffers: offers.length,
          totalRegular: regularPrices.length,
        } as SearchResult,
        meta: { query: product, city, timestamp: new Date().toISOString(), aiAssisted },
      },
      {
        status: 200,
        headers: {
          'Cache-Control': aiAssisted ? 'public, s-maxage=60' : 'public, s-maxage=300, stale-while-revalidate=600',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type',
        },
      }
    );
  } catch (error) {
    console.error('Search API error:', error);
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
  }
}

export async function OPTIONS() {
  return NextResponse.json({}, {
    status: 200,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type',
    },
  });
}
