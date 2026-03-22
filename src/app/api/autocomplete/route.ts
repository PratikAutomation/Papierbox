import { NextRequest, NextResponse } from 'next/server';
import { supabase } from '@/lib/supabase';

function sanitizeInput(input: string): string {
  return input
    .trim()
    .slice(0, 100)
    .replace(/<[^>]*>/g, '');
}

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const rawQuery = searchParams.get('q');

    if (!rawQuery || rawQuery.trim() === '') {
      return NextResponse.json({ suggestions: [] });
    }

    const query = sanitizeInput(rawQuery);

    if (query.length < 1) {
      return NextResponse.json({ suggestions: [] });
    }

    // Query Supabase for product names matching the query
    const searchPattern = `%${query}%`;

    // Search in product_name
    const { data: data1, error: error1 } = await supabase
      .from('offers')
      .select('product_name, product_name_en')
      .ilike('product_name', searchPattern)
      .limit(20);

    if (error1) {
      console.error('Supabase query error (product_name):', error1);
    }

    // Search in product_name_en
    const { data: data2, error: error2 } = await supabase
      .from('offers')
      .select('product_name, product_name_en')
      .ilike('product_name_en', searchPattern)
      .limit(20);

    if (error2) {
      console.error('Supabase query error (product_name_en):', error2);
    }

    // Combine results and deduplicate
    const allResults = [...(data1 || []), ...(data2 || [])];
    const uniqueNames = new Set<string>();

    allResults.forEach((row: any) => {
      if (row.product_name) {
        uniqueNames.add(row.product_name);
      }
      if (row.product_name_en && row.product_name_en !== row.product_name) {
        uniqueNames.add(row.product_name_en);
      }
    });

    // Convert to array and limit to 8 unique suggestions
    const suggestions = Array.from(uniqueNames).slice(0, 8);

    return NextResponse.json(
      { suggestions },
      {
        status: 200,
        headers: {
          'Cache-Control': 'public, s-maxage=60',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type',
        },
      }
    );
  } catch (error) {
    console.error('Autocomplete API error:', error);
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
