import { NextRequest, NextResponse } from 'next/server';
import { searchOffers } from '@/lib/search';

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

    const data = searchOffers(product, city);

    return NextResponse.json(
      {
        data,
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
