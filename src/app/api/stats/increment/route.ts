// src/app/api/stats/increment/route.ts
import { NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_KEY!;

export async function POST() {
  try {
    const sb = createClient(supabaseUrl, supabaseServiceKey);
    await sb.rpc('increment_stat', { stat_key: 'price_checks', increment_by: 1 });
    return NextResponse.json({ ok: true });
  } catch {
    // Silent fail — never block the search flow
    return NextResponse.json({ ok: false });
  }
}
