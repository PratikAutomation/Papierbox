import { NextRequest, NextResponse } from 'next/server';
import { supabase } from '@/lib/supabase';
import { Offer, SearchResult } from '@/lib/types';

const ANTHROPIC_API_KEY = process.env.ANTHROPIC_API_KEY || '';
const MIN_RELEVANT_RESULTS = 2;
const MAX_OFFERS_SHOWN = 8;
const MAX_REGULAR_SHOWN = 3;

function sanitizeInput(input: string): string {
  return input.trim().slice(0, 100).replace(/<[^>]*>/g, '');
}

function normalize(s: string): string {
  return s
    .replace(/ä/g, 'ae').replace(/ö/g, 'oe').replace(/ü/g, 'ue').replace(/ß/g, 'ss')
    .replace(/é/g, 'e').replace(/è/g, 'e').replace(/ê/g, 'e');
}

/**
 * Check if a word matches as a WHOLE WORD in text (not as substring).
 * "milk" matches "Milk", "Fresh Milk 1L" but NOT "Milka"
 */
function wordMatch(word: string, text: string): boolean {
  const regex = new RegExp(`(?:^|[\\s,./\\-_()"])${word}(?:[\\s,./\\-_()"]|$)`, 'i');
  return regex.test(text) || regex.test(normalize(text));
}

/**
 * Check if a word matches anywhere as substring (looser matching).
 */
function substringMatch(word: string, text: string): boolean {
  return text.toLowerCase().includes(word) || normalize(text.toLowerCase()).includes(normalize(word));
}

function calculateRelevance(query: string, offer: Offer): number {
  const queryLower = query.toLowerCase();
  const queryWords = queryLower.split(/\s+/).filter(w => w.length >= 2);

  const productName = offer.productName || '';
  const productNameEn = offer.productNameEn || '';
  const brand = offer.brand || '';
  const category = offer.category || '';
  const categoryEn = offer.categoryEn || '';

  const allText = [productName, productNameEn, brand, category, categoryEn].join(' ');

  let score = 0;
  let wholeWordMatches = 0;
  let substringMatches = 0;

  for (const word of queryWords) {
    const nWord = normalize(word);
    const isWholeWord = wordMatch(word, allText) || wordMatch(nWord, allText);
    const isSubstring = substringMatch(word, allText.toLowerCase());

    if (isWholeWord) {
      wholeWordMatches++;

      // Whole word match in product name — highest value
      if (wordMatch(word, productName) || wordMatch(word, productNameEn))
        score += 40;
      // Whole word match in brand
      if (wordMatch(word, brand))
        score += 30;
      // Whole word match in category
      if (wordMatch(word, category) || wordMatch(word, categoryEn))
        score += 25;

      score += 15;

    } else if (isSubstring) {
      substringMatches++;
      // Substring match gets much lower score (Milka contains "milk" but shouldn't rank high)
      score += 3;
    }
  }

  // Penalize heavily if no whole-word matches
  if (wholeWordMatches === 0 && substringMatches > 0) {
    score = Math.floor(score * 0.15); // 85% penalty for substring-only matches
  }

  // Multi-word queries: penalize if less than half match
  if (queryWords.length > 1) {
    const totalMatches = wholeWordMatches + substringMatches;
    const ratio = totalMatches / queryWords.length;
    if (ratio < 0.5) score = Math.floor(score * 0.1);
    else if (ratio < 0.75) score = Math.floor(score * 0.5);
  }

  // Bonus for exact phrase match
  const allTextLower = allText.toLowerCase();
  if (allTextLower.includes(queryLower) || normalize(allTextLower).includes(normalize(queryLower))) {
    score += 100;
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

/**
 * Claude AI Fallback — when our database doesn't have relevant results,
 * ask Claude for estimated prices based on its knowledge of German supermarkets.
 */
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
          content: `You are a German grocery pricing expert. A user searched for "${query}" on a grocery price comparison website, but we have no matching offers in our database.

Based on your knowledge of current German supermarket prices (Lidl, Aldi Süd, Penny, Kaufland, Netto), provide estimated typical prices for this product or the closest matching products.

Return a JSON array with up to 5 entries. Each entry:
- brand: string (e.g., "Nescafé", "JA!", "Eigenmarke")
- product_name: string (full name with brand)
- product_name_en: string (English translation)
- category: string (German category)
- category_en: string (English category)
- price: number (typical price in EUR)
- unit: string (e.g., "200g", "500ml")
- store: string (which store typically has this, e.g., "Lidl")

Rules:
1. Only return products that actually match what the user searched for
2. If searching "milk", return MILK products — NOT "Milka" chocolate
3. Realistic 2026 German discount supermarket prices
4. Return ONLY the JSON array, no markdown
5. If you truly can't identify the product, return []`,
        }],
      }),
    });

    if (!response.ok) return [];

    const data = await response.json();
    const text = data.content?.[0]?.text?.trim() || '[]';

    let cleanText = text;
    if (cleanText.startsWith('```')) {
      cleanText = cleanText.split('\n').slice(1, -1).join('\n');
    }
    cleanText = cleanText.replace(/,\s*}/g, '}').replace(/,\s*\]/g, ']');

    const products = JSON.parse(cleanText);
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
        validFrom: '',
        validTo: '',
        isOffer: false,
        sourceUrl: '',
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

    // STEP 1: Get candidates from database
    const { data: rpcData, error: rpcError } = await supabase.rpc('search_offers', {
      search_query: product,
      city_slug: city,
      result_limit: 100,
    });

    if (rpcError) {
      console.error('Supabase RPC error:', rpcError);
      return NextResponse.json({ error: 'Database query failed' }, { status: 500 });
    }

    const candidates: Offer[] = (rpcData || []).map((row: Record<string, unknown>) =>
      mapRowToOffer(row as Record<string, any>) // eslint-disable-line @typescript-eslint/no-explicit-any
    );

    // STEP 2: Smart reranking with word-boundary matching
    const scored = candidates
      .map(offer => ({ offer, relevance: calculateRelevance(product, offer) }))
      .filter(s => s.relevance >= 15)
      .sort((a, b) => {
        if (b.relevance !== a.relevance) return b.relevance - a.relevance;
        if (a.offer.isOffer !== b.offer.isOffer) return a.offer.isOffer ? -1 : 1;
        return a.offer.price - b.offer.price;
      });

    // STEP 3: Limit results — top offers + top regular prices
    const allRelevant = scored.map(s => s.offer);
    const offers = allRelevant.filter(item => item.isOffer).slice(0, MAX_OFFERS_SHOWN);
    const regularPrices = allRelevant.filter(item => !item.isOffer).slice(0, MAX_REGULAR_SHOWN);

    // STEP 4: If poor results, ask Claude for estimates (SMART FALLBACK)
    let aiAssisted = false;
    if ((offers.length + regularPrices.length) < MIN_RELEVANT_RESULTS && ANTHROPIC_API_KEY) {
      console.log(`[AI Fallback] "${product}" — only ${offers.length + regularPrices.length} results, asking Claude...`);
      const aiEstimates = await claudeEstimate(product);

      if (aiEstimates.length > 0) {
        aiEstimates.forEach(e => regularPrices.push(e));
        aiAssisted = true;
        console.log(`[AI Fallback] Claude provided ${aiEstimates.length} estimated prices`);
      }
    }

    // STEP 5: Build response
    const offerPrices = offers.map(o => o.price);
    const bestPrice = offerPrices.length > 0 ? Math.min(...offerPrices) : null;
    const worstPrice = offerPrices.length > 0 ? Math.max(...offerPrices) : null;
    const savingsAmount = bestPrice !== null && worstPrice !== null ? worstPrice - bestPrice : null;

    const searchResult: SearchResult = {
      product,
      city,
      offers,
      regularPrices,
      bestPrice,
      worstPrice,
      savingsAmount,
      totalOffers: offers.length,
      totalRegular: regularPrices.length,
      isSuggestion: aiAssisted && offers.length === 0,
    };

    return NextResponse.json(
      {
        data: searchResult,
        meta: {
          query: product,
          city,
          timestamp: new Date().toISOString(),
          aiAssisted,
        },
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
  return NextResponse.json(
    {},
    {
      status: 200,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type',
      },
    }
  );
}
