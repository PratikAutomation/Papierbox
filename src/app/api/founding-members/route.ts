// src/app/api/founding-members/route.ts
import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_KEY!;

const MAX_MEMBERS = 500;

export async function GET() {
  try {
    const sb = createClient(supabaseUrl, supabaseServiceKey);
    const { count } = await sb
      .from('founding_members')
      .select('*', { count: 'exact', head: true });
    return NextResponse.json({ count: count ?? 0, max: MAX_MEMBERS });
  } catch {
    return NextResponse.json({ count: 0, max: MAX_MEMBERS });
  }
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const email = (body.email ?? '').trim().toLowerCase();
    const city = (body.city ?? 'hamburg').trim().slice(0, 50);

    if (!email || !email.includes('@') || email.length < 5 || email.length > 254) {
      return NextResponse.json({ error: 'Valid email required' }, { status: 400 });
    }

    const sb = createClient(supabaseUrl, supabaseServiceKey);

    const { count } = await sb
      .from('founding_members')
      .select('*', { count: 'exact', head: true });

    const currentCount = count ?? 0;

    // Check if already a member
    const { data: existing } = await sb
      .from('founding_members')
      .select('member_number')
      .eq('email', email)
      .single();

    if (existing) {
      return NextResponse.json({
        success: true,
        member_number: existing.member_number,
        count: currentCount,
        already_member: true,
      });
    }

    if (currentCount >= MAX_MEMBERS) {
      await sb.from('subscribers').upsert(
        { email, city, lang: 'en', is_active: true },
        { onConflict: 'email' }
      );
      return NextResponse.json({ success: false, waitlisted: true, count: currentCount });
    }

    const memberNumber = currentCount + 1;
    const { error } = await sb.from('founding_members').insert({
      email,
      city,
      member_number: memberNumber,
    });

    if (error) {
      console.error('Founding member insert error:', error);
      return NextResponse.json({ error: 'Could not register' }, { status: 500 });
    }

    // Also add to subscribers for the weekly digest
    await sb.from('subscribers').upsert(
      { email, city, lang: 'en', is_active: true },
      { onConflict: 'email' }
    );

    return NextResponse.json({
      success: true,
      member_number: memberNumber,
      count: memberNumber,
    });
  } catch {
    return NextResponse.json({ error: 'Internal error' }, { status: 500 });
  }
}
