import { NextRequest, NextResponse } from 'next/server';
import { supabase } from '@/lib/supabase';
import { Offer, SearchResult } from '@/lib/types';

function sanitizeInput(input: string): string {
  return input
    .trim()
    .slice(0, 100)
    .replace(/<[^>]*>/g, '');
}

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const rawProduct = searchParams.get('product');
    const rawCity = searchParams.get('city');

    if (!rawProduct) {
      return NextResponse.json(
        { error: 'Product parameter is required' },
        { status: 400 }
      );
    }

    const product = sanitizeInput(rawProduct);
    const city = rawCity ? sanitizeInput(rawCity) : 'hamburg';

    if (product === '') {
      return NextResponse.json(
        { error: 'Product parameter must be non-empty' },
        { status: 400 }
      );
    }

    // Call Supabase RPC function
    const { data: rpcData, error: rpcError } = await supabase.rpc('search_offers', {
      search_query: product,
      city_slug: city,
      result_limit: 50
    });

    if (rpcError) {
      console.error('Supabase RPC error:', rpcError);
      return NextResponse.json(
        { error: 'Database query failed' },
        { status: 500 }
      );
    }

    // Map snake_case Supabase response to camelCase Offer type
    const allResults: Offer[] = (rpcData || []).map((row: any) => ({
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
      similarityScore: row.similarity_score
    }));

    // Split results into offers and regular prices
    const offers = allResults.filter(item => item.isOffer);
    const regularPrices = allResults.filter(item => !item.isOffer);

    let searchResult: SearchResult;
    let isSuggestion = false;

    // If zero results total, query 5 cheapest offers as fallback suggestion
    if (allResults.length === 0) {
      const { data: fallbackData, error: fallbackError } = await supabase
        .from('offers')
        .select('*, stores!inner(name, brand_color)')
        .eq('is_offer', true)
        .order('price')
        .limit(5);

      if (fallbackError) {
        console.error('Fallback query error:', fallbackError);
      }

      const fallbackOffers: Offer[] = (fallbackData || []).map((row: any) => ({
        id: row.id,
        storeId: row.store_id,
        storeName: row.stores.name,
        storeBrandColor: row.stores.brand_color,
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
        similarityScore: undefined
      }));

      isSuggestion = true;

      // Calculate metrics from fallback offers
      const fallbackPrices = fallbackOffers.map(o => o.price);
      const bestPrice = fallbackPrices.length > 0 ? Math.min(...fallbackPrices) : null;
      const worstPrice = fallbackPrices.length > 0 ? Math.max(...fallbackPrices) : null;
      const savingsAmount = bestPrice !== null && worstPrice !== null ? worstPrice - bestPrice : null;

      searchResult = {
        product,
        city,
        offers: fallbackOffers,
        regularPrices: [],
        bestPrice,
        worstPrice,
        savingsAmount,
        totalOffers: fallbackOffers.length,
        totalRegular: 0,
        isSuggestion
      };
    } else {
      // Calculate bestPrice, worstPrice, savingsAmount from OFFERS ONLY
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
        isSuggestion: false
      };
    }

    return NextResponse.json(
      {
        data: searchResult,
        meta: {
          query: product,
          city,
          timestamp: new Date().toISOString(),
        },
      },
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
    return NextResponse.json(
      { error: 'Internal server error' },
      { status: 500 }
    );
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
