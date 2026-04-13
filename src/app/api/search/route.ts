import { NextRequest, NextResponse } from 'next/server';
import { supabase } from '@/lib/supabase';
import { Offer, SearchResult } from '@/lib/types';
import { normalizeSingle, rankWithClaude } from '@/lib/claude-normalize';

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

  // Split product names into individual words for word-boundary checks
  const pNameWords = pName.split(/[\s,./\-_()+]+/).filter(w => w.length >= 2);
  const pNameEnWords = pNameEn.split(/[\s,./\-_()+]+/).filter(w => w.length >= 2);

  let score = 0;

  // ===================================================
  // TIER 1: PRODUCT NAME MATCH
  // Distinguish between:
  //   a) Query IS a standalone word in product name (best): "Milch" in "Haltbare Milch" → 250pts
  //   b) Query is a suffix of a compound word: "schokolade" in "Tafelschokolade" → 200pts
  //      German compounds: Tafelschokolade = Tafel+Schokolade, still IS chocolate
  //   c) Query is prefix/middle of compound (weak): "milch" in "Milchreis" → 50pts
  //      Milchreis is NOT milk, Buttermilch is NOT butter
  //   d) Product name is contained in query: "mango" contains product "Mango" → 200pts
  // ===================================================
  const qIsStandaloneInName = pNameWords.some(pw => pw === q) || pNameEnWords.some(pw => pw === q);
  // German compound suffix: query is the tail of a compound word (Tafelschokolade ends with schokolade)
  const qIsSuffixInName = !qIsStandaloneInName && q.length >= 4 && (
    pNameWords.some(pw => pw.endsWith(q) && pw !== q) ||
    pNameEnWords.some(pw => pw.endsWith(q) && pw !== q)
  );
  const nameIsInQuery = pNameWords.length <= 2 && (q.includes(pName) || q.includes(pNameEn));
  const qIsSubstringInName = !qIsStandaloneInName && !qIsSuffixInName && (pName.includes(q) || pNameEn.includes(q));

  if (qIsStandaloneInName || nameIsInQuery) {
    score += 250; // Strong: query is a whole word in name, or name is inside query
  } else if (qIsSuffixInName) {
    score += 200; // Good: compound suffix (Tafelschokolade → IS schokolade)
  } else if (qIsSubstringInName) {
    score += 50; // Weak: compound prefix/middle (Milchreis, Buttermilch)
  }

  // ===================================================
  // TIER 2: CATEGORY MATCH
  // User searches "butter" → category IS "butter" or "dairy"
  // Exact category match (cat === q) is stronger than broad parent category
  // "Milchprodukte" contains "milch" but is a broad umbrella category
  // ===================================================
  const exactCategoryMatch =
    cat === q || catEn === q ||
    qWords.some(w => cat === w || catEn === w);

  const broadCategoryMatch = !exactCategoryMatch && (
    cat.includes(q) || catEn.includes(q) ||
    qWords.some(w => cat.includes(w) && w.length >= 4) ||
    qWords.some(w => catEn.includes(w) && w.length >= 4)
  );

  const categoryMatch = exactCategoryMatch || broadCategoryMatch;

  if (exactCategoryMatch) {
    score += 150; // Category IS the product (e.g. category="Butter")
  } else if (broadCategoryMatch) {
    score += 30; // Broad parent category (e.g. "Milchprodukte" for milk search)
  }

  // ===================================================
  // TIER 3: BRAND MATCH
  // User searches "kerrygold" or "milka"
  // Must be exact brand match, not substring
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
  // Check query words against individual product name words
  // Standalone word match (word boundary): 40pts per word
  // Compound/stem match: 15pts per word
  // ===================================================
  let nameWordMatches = 0;
  for (const w of qWords) {
    const standaloneMatch = pNameWords.some(pw => pw === w) || pNameEnWords.some(pw => pw === w);
    // Stem: one contains the other, but only when lengths are close (within 3 chars)
    const stemMatch = !standaloneMatch && (
      pNameWords.some(pw => (pw.includes(w) || w.includes(pw)) && Math.abs(pw.length - w.length) <= 3) ||
      pNameEnWords.some(pw => (pw.includes(w) || w.includes(pw)) && Math.abs(pw.length - w.length) <= 3)
    );
    if (standaloneMatch) {
      nameWordMatches++;
      score += 40;
    } else if (stemMatch) {
      nameWordMatches++;
      score += 15;
    }
  }

  // ===================================================
  // STRICT FILTER: For generic product searches, product name MUST contain
  // the query as a standalone word, OR category must be an exact match.
  // Broad parent categories (Milchprodukte, Süßwaren) are NOT enough alone.
  // ===================================================
  const commonProducts: Record<string, string[]> = {
    // query → acceptable categories (normalized). Product is also accepted if name contains query as standalone word.
    butter: ['butter', 'milchprodukte', 'dairy', 'brotaufstrich', 'spreads'],
    milk: ['milch', 'milk', 'milchprodukte', 'dairy', 'getraenke', 'beverages'],
    milch: ['milch', 'milk', 'milchprodukte', 'dairy', 'getraenke', 'beverages'],
    bread: ['brot', 'bread', 'backwaren', 'bakery'],
    brot: ['brot', 'bread', 'backwaren', 'bakery'],
    cheese: ['kaese', 'cheese', 'milchprodukte', 'dairy'],
    kaese: ['kaese', 'cheese', 'milchprodukte', 'dairy'],
    coffee: ['kaffee', 'coffee', 'getraenke', 'beverages', 'heissgetraenke'],
    kaffee: ['kaffee', 'coffee', 'getraenke', 'beverages', 'heissgetraenke'],
    tea: ['tee', 'tea', 'getraenke', 'beverages', 'heissgetraenke'],
    tee: ['tee', 'tea', 'getraenke', 'beverages', 'heissgetraenke'],
    sugar: ['zucker', 'sugar', 'backzutaten', 'baking'],
    zucker: ['zucker', 'sugar', 'backzutaten', 'baking'],
    flour: ['mehl', 'flour', 'backzutaten', 'baking'],
    mehl: ['mehl', 'flour', 'backzutaten', 'baking'],
    rice: ['reis', 'rice', 'beilagen', 'sides'],
    reis: ['reis', 'rice', 'beilagen', 'sides'],
    pasta: ['nudeln', 'pasta', 'teigwaren', 'noodles'],
    nudeln: ['nudeln', 'pasta', 'teigwaren', 'noodles'],
    oil: ['oel', 'oil', 'speiseoel', 'cooking'],
    oel: ['oel', 'oil', 'speiseoel', 'cooking'],
    water: ['wasser', 'water', 'getraenke', 'beverages'],
    wasser: ['wasser', 'water', 'getraenke', 'beverages'],
    juice: ['saft', 'juice', 'getraenke', 'beverages'],
    saft: ['saft', 'juice', 'getraenke', 'beverages'],
    yogurt: ['joghurt', 'yogurt', 'milchprodukte', 'dairy'],
    joghurt: ['joghurt', 'yogurt', 'milchprodukte', 'dairy'],
    cream: ['sahne', 'cream', 'milchprodukte', 'dairy'],
    sahne: ['sahne', 'cream', 'milchprodukte', 'dairy'],
    egg: ['eier', 'egg', 'eggs'],
    eier: ['eier', 'egg', 'eggs'],
    chicken: ['haehnchen', 'chicken', 'gefluegel', 'poultry', 'fleisch', 'meat'],
    haehnchen: ['haehnchen', 'chicken', 'gefluegel', 'poultry', 'fleisch', 'meat'],
    beef: ['rind', 'beef', 'fleisch', 'meat'],
    rind: ['rind', 'beef', 'fleisch', 'meat'],
    pork: ['schwein', 'pork', 'fleisch', 'meat'],
    schwein: ['schwein', 'pork', 'fleisch', 'meat'],
    fish: ['fisch', 'fish', 'meeresfrüchte', 'seafood'],
    fisch: ['fisch', 'fish', 'meeresfrüchte', 'seafood'],
    salmon: ['lachs', 'salmon', 'fisch', 'fish', 'meeresfrüchte', 'seafood'],
    lachs: ['lachs', 'salmon', 'fisch', 'fish', 'meeresfrüchte', 'seafood'],
    chocolate: ['schokolade', 'chocolate', 'suesswaren', 'sweets', 'suessigkeiten', 'confectionery'],
    schokolade: ['schokolade', 'chocolate', 'suesswaren', 'sweets', 'suessigkeiten', 'confectionery'],
    chips: ['chips', 'snacks', 'knabberartikel'],
    ice: ['eis', 'ice', 'tiefkuehl', 'frozen'],
    eis: ['eis', 'ice', 'tiefkuehl', 'frozen'],
    beer: ['bier', 'beer', 'getraenke', 'beverages', 'alkohol', 'alcohol'],
    bier: ['bier', 'beer', 'getraenke', 'beverages', 'alkohol', 'alcohol'],
    wine: ['wein', 'wine', 'getraenke', 'beverages', 'alkohol', 'alcohol'],
    wein: ['wein', 'wine', 'getraenke', 'beverages', 'alkohol', 'alcohol'],
    sekt: ['sekt', 'sparkling', 'getraenke', 'beverages', 'alkohol', 'alcohol'],
    vodka: ['vodka', 'spirituosen', 'spirits', 'alkohol', 'alcohol'],
    whisky: ['whisky', 'spirituosen', 'spirits', 'alkohol', 'alcohol'],
    ham: ['schinken', 'ham', 'wurst', 'fleisch', 'meat', 'aufschnitt', 'deli'],
    schinken: ['schinken', 'ham', 'wurst', 'fleisch', 'meat', 'aufschnitt', 'deli'],
    sausage: ['wurst', 'sausage', 'fleisch', 'meat', 'aufschnitt', 'deli'],
    wurst: ['wurst', 'sausage', 'fleisch', 'meat', 'aufschnitt', 'deli'],
    salami: ['salami', 'wurst', 'fleisch', 'meat', 'aufschnitt', 'deli'],
  };

  const genericKey = qWords.find(w => commonProducts[w]);
  const isGenericSearch = qWords.length <= 2 && !!genericKey;

  if (isGenericSearch) {
    const acceptableCats = commonProducts[genericKey!];
    const catAcceptable = acceptableCats.some(ac => cat.includes(ac) || catEn.includes(ac));
    const nameHasQuery = qIsStandaloneInName || qIsSuffixInName || qIsSubstringInName;

    if (!catAcceptable && !nameHasQuery) {
      // Category doesn't match AND query isn't in product name at all → kill
      return 0;
    }

    if (!catAcceptable && nameHasQuery) {
      // Query appears in name but category is wrong → heavily penalize
      // e.g. "Butter Croissant" (Bakery), "Butter Chicken" (Ready Meals)
      return Math.min(score, 25);
    }

    // Category is acceptable but query is NOT in product name at all → penalize heavily
    // e.g. "Ehrmann Almighurt" (yogurt in Milchprodukte) appearing for "milk" search
    if (catAcceptable && !nameHasQuery) {
      return Math.min(score, 20);
    }
  }

  // ===================================================
  // MULTI-WORD BONUS: More matching words = better
  // "Kerrygold Irish Butter" → all 3 words match = high score
  // ===================================================
  if (qWords.length > 1) {
    const totalMatches = nameWordMatches + (brandMatch ? 1 : 0) + (categoryMatch ? 1 : 0);
    const ratio = totalMatches / qWords.length;
    if (ratio >= 0.8) score += 50;
    else if (ratio < 0.3) score = Math.floor(score * 0.2);
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

    // STEP 3: LLM RANKING — Claude picks the genuinely matching products
    // Falls back to scoreProduct() if Claude is unavailable
    let allRelevant: Offer[] = [];

    // Try Claude ranking first
    const rankCandidates = candidates.map(o => ({
      id: o.id,
      product_name: o.productName || '',
      product_name_en: o.productNameEn || '',
      brand: o.brand || '',
      category_en: o.categoryEn || '',
      price: o.price,
      unit: o.unit || '',
    }));

    console.log(`[Search] "${product}" → ${rankCandidates.length} candidates, calling Claude...`);
    let claudeWasCalled = false;
    let claudeMatchIds: string[] = [];
    try {
      claudeMatchIds = await rankWithClaude(product, rankCandidates);
      claudeWasCalled = true;
      console.log(`[Search] Claude returned ${claudeMatchIds.length} matches for "${product}"`);
    } catch (err) {
      console.log(`[Search] Claude API failed for "${product}", falling back to scoreProduct()`, err);
    }

    if (claudeWasCalled && claudeMatchIds.length > 0) {
      // Claude found genuine matches — use its ordering
      const idToOffer = new Map(candidates.map(o => [o.id, o]));
      allRelevant = claudeMatchIds
        .map(id => idToOffer.get(id))
        .filter((o): o is Offer => !!o);
    } else if (claudeWasCalled && claudeMatchIds.length === 0) {
      // Claude explicitly said "nothing matches" — trust it, don't fall back to scoreProduct()
      // This will trigger price estimation below (step 4)
      console.log(`[Search] Claude says no genuine matches for "${product}" — will estimate prices`);
      allRelevant = [];
    } else {
      // Claude API was not available — fall back to keyword scoring
      console.log(`[Fallback] Claude unavailable for "${product}", using scoreProduct()`);
      const searchTermEn = normalized.normalized_en || product;
      const scored = candidates
        .filter(offer => {
          if (excludeTerms.length === 0) return true;
          const pName = norm(offer.productName || '').toLowerCase();
          return !excludeTerms.some(ex => pName.includes(ex.toLowerCase()));
        })
        .map(offer => {
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
      allRelevant = scored.map(s => s.offer);
    }

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

    // Fire-and-forget — never await, never block the search response
    fetch(`${request.nextUrl.origin}/api/stats/increment`, { method: 'POST' }).catch(() => {});

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
