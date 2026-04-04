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
  const q = norm(parsed.normalized_de);
  const qEn = norm(parsed.normalized_en);
  const excludeTerms = parsed.exclude.map(e => norm(e));

  const scored = candidates
    .filter(offer => {
      const pName = norm(offer.productName || '');
      return !excludeTerms.some(ex => pName.includes(ex));
    })
    .map(offer => {
      const pName = norm(offer.productName || '');
      const pNameEn = norm(offer.productNameEn || '');
      const cat = norm(offer.category || '');
      const catEn = norm(offer.categoryEn || '');
      const pNameWords = pName.split(/[\s,./\-_()+]+/).filter(w => w.length >= 2);
      const pNameEnWords = pNameEn.split(/[\s,./\-_()+]+/).filter(w => w.length >= 2);
      let score = 0;

      // Standalone word match (best): "Milch" is a whole word in "Haltbare Milch"
      const qStandalone = pNameWords.some(pw => pw === q) || pNameEnWords.some(pw => pw === qEn);
      // Compound suffix: "schokolade" at end of "tafelschokolade"
      const qSuffix = !qStandalone && q.length >= 4 && (
        pNameWords.some(pw => pw.endsWith(q) && pw !== q) ||
        pNameEnWords.some(pw => pw.endsWith(qEn) && pw !== qEn));
      // Substring of compound word (weak): "milch" in "milchreis"
      const qSubstring = !qStandalone && !qSuffix && (pName.includes(q) || pNameEn.includes(qEn));

      if (qStandalone) score += 250;
      else if (qSuffix) score += 200;
      else if (qSubstring) score += 50;
      else if (q.includes(pName) || qEn.includes(pNameEn)) score += 200; // name inside query

      // Stem match: word-level overlap with length check
      const qWordsDe = q.split(/\s+/).filter(w => w.length >= 3);
      const hasStemMatch = qWordsDe.some(qw =>
        pNameWords.some(pw => (pw === qw) || ((pw.includes(qw) || qw.includes(pw)) && Math.abs(pw.length - qw.length) <= 3)) ||
        pNameEnWords.some(pw => (pw === qw) || ((pw.includes(qw) || qw.includes(pw)) && Math.abs(pw.length - qw.length) <= 3))
      );
      if (hasStemMatch && score === 0) score += 100;

      // Category match
      if (cat.includes(q) || catEn.includes(qEn)) score += 30;
      if (parsed.brand && norm(offer.brand || '').includes(norm(parsed.brand))) score += 100;

      return { offer, score };
    })
    .filter(s => s.score >= 50)
    .sort((a, b) => {
      if (b.score !== a.score) return b.score - a.score;
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
      const stripped = rawImage.replace(/^data:image\/\w+;base64,/, '');
      const ocrItems = await ocrPhoto(stripped);
      itemStrings = ocrItems;
    }

    if (rawItems) {
      const textItems = parseRawList(rawItems);
      itemStrings = [...itemStrings, ...textItems];
    }

    if (itemStrings.length === 0) {
      return NextResponse.json({ error: 'No items provided' }, { status: 400 });
    }

    itemStrings = itemStrings.slice(0, 25);

    // STEP 2: Normalize via Claude
    const parsedItems = await normalizeItems(itemStrings);

    // STEP 3: Match against DB for each item
    const matchedItems = await Promise.all(
      parsedItems.map(async (parsed) => {
        const offersByStore: Record<string, Offer | null> = {};
        for (const sid of STORE_IDS) {
          offersByStore[sid] = null;
        }

        const { data: rpcData } = await supabase.rpc('search_offers', {
          search_query: parsed.normalized_de || parsed.original,
          city_slug: city,
          result_limit: 50,
        });

        const candidates: Offer[] = (rpcData || []).map((row: Record<string, unknown>) =>
          mapRowToOffer(row as Record<string, any>) // eslint-disable-line @typescript-eslint/no-explicit-any
        );

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
    const cachedEstimates: Record<string, Record<string, number>> = {};
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

    const needEstimation = unmatchedItems.filter(
      item => !cachedEstimates[item.toLowerCase()] ||
              Object.keys(cachedEstimates[item.toLowerCase()]).length < 5
    );

    const freshEstimates = needEstimation.length > 0
      ? await estimatePrices(needEstimation)
      : [];

    // Cache fresh estimates (fire and forget)
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

      // Fire and forget - don't await
      void supabase.from('price_estimates').upsert(rows, {
        onConflict: 'product_normalized,store_id',
      });
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
