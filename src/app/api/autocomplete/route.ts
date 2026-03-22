import { NextRequest, NextResponse } from 'next/server';
import { getAutocompleteSuggestions } from '@/lib/search';

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

    const suggestions = getAutocompleteSuggestions(query);

    return NextResponse.json(
      { suggestions },
      {
        status: 200,
        headers: {
          'Cache-Control': 'public, s-maxage=60',
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
