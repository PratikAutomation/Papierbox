import { NextRequest, NextResponse } from 'next/server';
import { supabase } from '@/lib/supabase';
import { Offer, SearchResult } from '@/lib/types';

function sanitizeInput(input: string): string {
  return input
    .trim()
    .slice(0, 100)
    .replace(/<[^>]*>/g, '');
}

/**
 * Smart relevance scoring — checks how many query words match the product.
 * "Nescafé Classic Kaffee" vs "K-CLASSIC Ice Cream" → low score (only "classic" matches)
 * "Nescafé Classic Kaffee" vs "NESCAFÉ Classic Kaffee 200g" → high score (all words match)
 */
function calculateRelevance(query: string, offer: Offer): number {
  const queryLower = query.toLowerCase();
  const queryWords = queryLower.split(/\s+/).filter(w => w.length >= 2);

  // Build a searchable string from all product fields
  const productText = [
    offer.productName,
    offer.productNameEn,
    offer.brand,
    offer.category,
    offer.categoryEn,
  ].join(' ').toLowerCase();

  // Normalize umlauts for matching
  const normalize = (s: string) => s
    .replace(/ä/g, 'ae').replace(/ö/g, 'oe').replace(/ü/g, 'ue').replace(/ß/g, 'ss')
    .replace(/é/g, 'e').replace(/è/g, 'e');

  const normalizedProduct = normalize(productText);
  const normalizedQuery = normalize(queryLower);

  let score = 0;
  let matchedWords = 0;

  for (const word of queryWords) {
    const normalizedWord = normalize(word);

    if (productText.includes(word) || normalizedProduct.includes(normalizedWord)) {
      matchedWords++;

      // Bonus for matching in product name (most important)
      if (offer.productName.toLowerCase().includes(word) ||
          normalize(offer.productName.toLowerCase()).includes(normalizedWord)) {
        score += 30;
      }
      // Bonus for matching brand
      if (offer.brand.toLowerCase().includes(word) ||
          normalize(offer.brand.toLowerCase()).includes(normalizedWord)) {
        score += 25;
      }
      // Bonus for matching category
      if ((offer.category || '').toLowerCase().includes(word) ||
          (offer.categoryEn || '').toLowerCase().includes(word)) {
        score += 20;
      }
      // Basic match in any field
      score += 10;
    }
  }

  // Critical: penalize heavily if less than half the query words match
  if (queryWords.length > 1) {
    const matchRatio = matchedWords / queryWords.length;
    if (matchRatio < 0.5) {
      score = Math.floor(score * 0.1); // Reduce to 10% — almost eliminate
    } else if (matchRatio < 0.75) {
      score = Math.floor(score * 0.5); // Reduce to 50%
    }
  }

  // Bonus for exact full query match
  if (productText.includes(queryLower) || normalizedProduct.includes(normalizedQuery)) {
    score += 100;
  }

  return score;
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function mapRowToOffer(row: Record<string, any>, fromRpc: boolean = true): Offer {
  return {
    id: row.id,
    storeId: fromRpc ? row.store_id : row.store_id,
    storeName: fromRpc ? row.store_name : row.stores?.name || '',
    storeBrandColor: fromRpc ? row.store_brand_color : row.stores?.brand_color || '',
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

    // Step 1: Get candidates from Supabase (broad search)
    const { data: rpcData, error: rpcError } = await supabase.rpc('search_offers', {
      search_query: product,
      city_slug: city,
      result_limit: 100, // Get more candidates for reranking
    });

    if (rpcError) {
      console.error('Supabase RPC error:', rpcError);
      return NextResponse.json({ error: 'Database query failed' }, { status: 500 });
    }

    const candidates: Offer[] = (rpcData || []).map((row: Record<string, unknown>) =>
      mapRowToOffer(row as Record<string, any>) // eslint-disable-line @typescript-eslint/no-explicit-any
    );

    // Step 2: Smart reranking — score each candidate by relevance to query
    const scored = candidates.map(offer => ({
      offer,
      relevance: calculateRelevance(product, offer),
    }));

    // Step 3: Filter out low-relevance junk (score < 15 = not relevant)
    const relevant = scored
      .filter(s => s.relevance >= 15)
      .sort((a, b) => {
        // Sort by relevance first, then offers before estimates, then price
        if (b.relevance !== a.relevance) return b.relevance - a.relevance;
        if (a.offer.isOffer !== b.offer.isOffer) return a.offer.isOffer ? -1 : 1;
        return a.offer.price - b.offer.price;
      })
      .slice(0, 30) // Top 30 relevant results
      .map(s => s.offer);

    // Step 4: Split into offers and regular prices
    const offers = relevant.filter(item => item.isOffer);
    const regularPrices = relevant.filter(item => !item.isOffer);

    let searchResult: SearchResult;

    if (relevant.length > 0) {
      const offerPrices = offers.map(o => o.price);
      const bestPrice = offerPrices.length > 0 ? Math.min(...offerPrices) : null;
      const worstPrice = offerPrices.length > 0 ? Math.max(...offerPrices) : null;
      const savingsAmount = bestPrice !== null && worstPrice !== null ? worstPrice - bestPrice : null;

      searchResult = {
        product,
        city,
        offers,
        regularPrices,
        bestPrice,
        worstPrice,
        savingsAmount,
        totalOffers: offers.length,
        totalRegular: regularPrices.length,
        isSuggestion: false,
      };
    } else {
      // No relevant results — show empty state (NOT random products)
      searchResult = {
        product,
        city,
        offers: [],
        regularPrices: [],
        bestPrice: null,
        worstPrice: null,
        savingsAmount: null,
        totalOffers: 0,
        totalRegular: 0,
        isSuggestion: false,
      };
    }

    return NextResponse.json(
      { data: searchResult, meta: { query: product, city, timestamp: new Date().toISOString() } },
      {
        status: 200,
        headers: {
          'Cache-Control': 'public, s-maxage=300, stale-while-revalidate=600',
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
