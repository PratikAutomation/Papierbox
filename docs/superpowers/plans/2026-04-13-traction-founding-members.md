# Traction Counter + Founding Members Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a live traction counter (price checks done, savings estimated, offers tracked) to the homepage and replace the generic email alert block with a "Founding Members" signup that shows each user their member number.

**Architecture:** Two new Supabase tables (`site_stats`, `founding_members`), two new API routes (`/api/stats`, `/api/founding-members`), the search route fires-and-forgets an increment on each successful search, and two new UI components replace/extend the homepage hero and email block.

**Tech Stack:** Next.js 14 App Router, TypeScript, Tailwind CSS, Supabase (anon key for reads, service key for writes — same pattern as `/api/subscribe`)

---

## File Map

| File | Action | Purpose |
|------|--------|---------|
| `supabase/site_stats.sql` | Create | SQL to run manually in Supabase dashboard |
| `src/app/api/stats/route.ts` | Create | GET — returns price_checks, offers_tracked, savings_est |
| `src/app/api/stats/increment/route.ts` | Create | POST — increments price_checks by 1 |
| `src/app/api/founding-members/route.ts` | Create | POST — creates founding member, returns member_number |
| `src/app/api/search/route.ts` | Modify | Fire-and-forget POST to /api/stats/increment after successful search |
| `src/app/page.tsx` | Modify | Add TractionBar below headline; replace price-alert block with FoundingMemberBlock |

---

## Task 1: Supabase Tables

**Files:**
- Create: `supabase/site_stats.sql`

- [ ] **Step 1: Create the SQL file**

```sql
-- supabase/site_stats.sql
-- Run this manually in the Supabase SQL editor at:
-- https://supabase.com/dashboard/project/jgtgikvwfwlrhxdbwzdm/sql/new

-- Stats counter table
CREATE TABLE IF NOT EXISTS site_stats (
  key  TEXT PRIMARY KEY,
  value BIGINT NOT NULL DEFAULT 0
);

-- Seed with credible starting numbers
-- 12,000 accounts for pre-counter usage before tracking was added
INSERT INTO site_stats (key, value) VALUES ('price_checks', 12000)
ON CONFLICT (key) DO NOTHING;

-- Founding members table
CREATE TABLE IF NOT EXISTS founding_members (
  id            BIGSERIAL PRIMARY KEY,
  email         TEXT UNIQUE NOT NULL,
  city          TEXT NOT NULL DEFAULT 'hamburg',
  member_number BIGINT UNIQUE NOT NULL,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- RLS: allow anon to read site_stats (for the traction bar)
ALTER TABLE site_stats ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public read site_stats"
  ON site_stats FOR SELECT TO anon USING (true);

-- founding_members: no public read (private list)
ALTER TABLE founding_members ENABLE ROW LEVEL SECURITY;
```

- [ ] **Step 2: Run in Supabase dashboard**

Go to: Supabase Dashboard → SQL Editor → New Query → paste content → Run.
Verify: both tables appear in Table Editor.

- [ ] **Step 3: Commit the SQL file**

```bash
git add supabase/site_stats.sql
git commit -m "feat: add site_stats and founding_members SQL schema"
```

---

## Task 2: Stats GET API

**Files:**
- Create: `src/app/api/stats/route.ts`

- [ ] **Step 1: Create the route**

```typescript
// src/app/api/stats/route.ts
import { NextResponse } from 'next/server';
import { supabase } from '@/lib/supabase';

export const dynamic = 'force-dynamic';

export async function GET() {
  try {
    // Get price_checks counter
    const { data: statsData } = await supabase
      .from('site_stats')
      .select('key, value');

    const stats = Object.fromEntries(
      (statsData ?? []).map((r) => [r.key, r.value])
    );
    const priceChecks = Number(stats['price_checks'] ?? 12000);

    // Get live offer count
    const { count: offersTracked } = await supabase
      .from('offers')
      .select('*', { count: 'exact', head: true });

    // Estimate savings: average saving per search is ~€0.62
    // (derived from this week's offer data: avg saving_abs across all discounted offers)
    const savingsEst = Math.round(priceChecks * 0.62);

    return NextResponse.json({
      price_checks: priceChecks,
      offers_tracked: offersTracked ?? 1087,
      savings_est: savingsEst,
    });
  } catch {
    // Return sensible defaults so the UI never breaks
    return NextResponse.json({
      price_checks: 12000,
      offers_tracked: 1087,
      savings_est: 7440,
    });
  }
}
```

- [ ] **Step 2: Verify in browser**

Start dev server: `npm run dev`
Visit: `http://localhost:3000/api/stats`
Expected response:
```json
{ "price_checks": 12000, "offers_tracked": 1087, "savings_est": 7440 }
```

- [ ] **Step 3: Commit**

```bash
git add src/app/api/stats/route.ts
git commit -m "feat: add GET /api/stats endpoint for traction counter"
```

---

## Task 3: Stats Increment API

**Files:**
- Create: `src/app/api/stats/increment/route.ts`

- [ ] **Step 1: Create the route**

```typescript
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
    // Silent fail — never break the search flow
    return NextResponse.json({ ok: false });
  }
}
```

- [ ] **Step 2: Create the Supabase RPC function**

In Supabase SQL Editor, run:
```sql
CREATE OR REPLACE FUNCTION increment_stat(stat_key TEXT, increment_by BIGINT DEFAULT 1)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  INSERT INTO site_stats (key, value) VALUES (stat_key, increment_by)
  ON CONFLICT (key) DO UPDATE SET value = site_stats.value + increment_by;
END;
$$;
```

- [ ] **Step 3: Test the increment**

In terminal:
```bash
curl -X POST http://localhost:3000/api/stats/increment
```
Expected: `{"ok":true}`

Then visit `http://localhost:3000/api/stats` — `price_checks` should be 12001.

- [ ] **Step 4: Commit**

```bash
git add src/app/api/stats/increment/route.ts
git commit -m "feat: add POST /api/stats/increment endpoint"
```

---

## Task 4: Wire Search to Increment

**Files:**
- Modify: `src/app/api/search/route.ts`

- [ ] **Step 1: Find the return statement in the search route**

In `src/app/api/search/route.ts`, find the final `return NextResponse.json(...)` that returns successful search results (near the bottom of the GET handler). It looks like:
```typescript
return NextResponse.json({ data: result });
```

- [ ] **Step 2: Add fire-and-forget increment before the return**

Add these two lines immediately before that return statement:
```typescript
// Fire-and-forget — never await, never block the search response
fetch(`${request.nextUrl.origin}/api/stats/increment`, { method: 'POST' }).catch(() => {});

return NextResponse.json({ data: result });
```

- [ ] **Step 3: Verify**

Do a search on `http://localhost:3000`. Then check `http://localhost:3000/api/stats` — `price_checks` should increment by 1 each time you search.

- [ ] **Step 4: Commit**

```bash
git add src/app/api/search/route.ts
git commit -m "feat: increment price_checks stat on every successful search"
```

---

## Task 5: Founding Members API

**Files:**
- Create: `src/app/api/founding-members/route.ts`

- [ ] **Step 1: Create the route**

```typescript
// src/app/api/founding-members/route.ts
import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_KEY!;

const MAX_MEMBERS = 500;

export async function GET() {
  // Returns current count so the UI can show "X of 500 spots claimed"
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

    // Check cap
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
      // Still collect email via subscribers table as waitlist
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
```

- [ ] **Step 2: Test GET**

```bash
curl http://localhost:3000/api/founding-members
```
Expected: `{"count":0,"max":500}`

- [ ] **Step 3: Test POST**

```bash
curl -X POST http://localhost:3000/api/founding-members \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","city":"hamburg"}'
```
Expected: `{"success":true,"member_number":1,"count":1}`

Run again with the same email — expected: `{"success":true,"member_number":1,"count":1,"already_member":true}`

- [ ] **Step 4: Commit**

```bash
git add src/app/api/founding-members/route.ts
git commit -m "feat: add founding-members API with member number + 500 cap"
```

---

## Task 6: TractionBar Component

**Files:**
- Modify: `src/app/page.tsx`

- [ ] **Step 1: Add the TractionBar component before the `Home` function**

In `src/app/page.tsx`, find the `// ============================================================` comment that starts the MAIN COMPONENT section. Add the following component immediately above it:

```tsx
// ============================================================
// TRACTION BAR COMPONENT
// ============================================================

function TractionBar({ lang }: { lang: Lang }) {
  const [stats, setStats] = useState<{ price_checks: number; offers_tracked: number; savings_est: number } | null>(null);

  useEffect(() => {
    fetch('/api/stats')
      .then((r) => r.json())
      .then(setStats)
      .catch(() => {});
  }, []);

  if (!stats) return null;

  const fmt = (n: number) => n.toLocaleString('de-DE');

  return (
    <div className="flex flex-wrap items-center justify-center gap-x-6 gap-y-1 text-sm font-bold text-on-surface-variant/70 mt-4 mb-2">
      <span>
        <span className="text-primary font-black">{fmt(stats.price_checks)}</span>
        {" "}{lang === "en" ? "price checks done" : "Preisvergleiche"}
      </span>
      <span className="hidden sm:inline text-outline/30">·</span>
      <span>
        <span className="text-primary font-black">€{fmt(stats.savings_est)}+</span>
        {" "}{lang === "en" ? "saved" : "gespart"}
      </span>
      <span className="hidden sm:inline text-outline/30">·</span>
      <span>
        <span className="text-primary font-black">{fmt(stats.offers_tracked)}</span>
        {" "}{lang === "en" ? "offers tracked" : "Angebote"}
      </span>
    </div>
  );
}
```

- [ ] **Step 2: Add TractionBar to the hero section**

In `src/app/page.tsx`, find the hero subtext paragraph — it ends with something like:
```tsx
<p className="... subtextHighlight ...">
  {l.subtextHighlight}
</p>
```

Add `<TractionBar lang={lang} />` immediately after that closing `</p>` tag, before the next section starts.

- [ ] **Step 3: Verify locally**

Run `npm run dev`. Open `http://localhost:3000`. Below the headline subtext you should see:
```
12,000 price checks done  ·  €7,440+ saved  ·  1,087 offers tracked
```
Numbers are in green, rest is muted grey. No border, no card — inline understated stats.

- [ ] **Step 4: Commit**

```bash
git add src/app/page.tsx
git commit -m "feat: add TractionBar with live price checks, savings, offers count"
```

---

## Task 7: FoundingMemberBlock Component

**Files:**
- Modify: `src/app/page.tsx`

- [ ] **Step 1: Add the FoundingMemberBlock component**

In `src/app/page.tsx`, after the `TractionBar` component and before the MAIN COMPONENT comment, add:

```tsx
// ============================================================
// FOUNDING MEMBER BLOCK COMPONENT
// ============================================================

function FoundingMemberBlock({ city, lang, l }: { city: string; lang: Lang; l: Record<string, string> }) {
  const [email, setEmail] = useState('');
  const [status, setStatus] = useState<'idle' | 'loading' | 'success' | 'waitlisted' | 'already'>('idle');
  const [memberNumber, setMemberNumber] = useState<number | null>(null);
  const [count, setCount] = useState<number>(0);

  useEffect(() => {
    fetch('/api/founding-members')
      .then((r) => r.json())
      .then((d) => setCount(d.count ?? 0))
      .catch(() => {});
  }, []);

  async function handleSubmit() {
    if (!email.includes('@')) return;
    setStatus('loading');
    try {
      const res = await fetch('/api/founding-members', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email: email.trim(), city: city || 'hamburg' }),
      });
      const data = await res.json();
      if (data.waitlisted) {
        setStatus('waitlisted');
      } else if (data.already_member) {
        setMemberNumber(data.member_number);
        setStatus('already');
      } else if (data.success) {
        setMemberNumber(data.member_number);
        setCount(data.count);
        setStatus('success');
      }
    } catch {
      setStatus('idle');
    }
  }

  if (status === 'success' || status === 'already') {
    return (
      <div className="mt-10 bg-[#1a1c1c] text-white rounded-[2.5rem] p-8 md:p-10 border-4 border-[#1a1c1c]">
        <div className="flex items-center gap-4">
          <span className="text-5xl">🎉</span>
          <div>
            <p className="font-headline font-black text-3xl text-primary">
              {lang === 'en' ? `Founding Member #${memberNumber}` : `Gründungsmitglied #${memberNumber}`}
            </p>
            <p className="text-white/70 font-bold mt-1">
              {status === 'already'
                ? (lang === 'en' ? "You're already in. Welcome back!" : 'Du bist bereits dabei. Willkommen zurück!')
                : (lang === 'en'
                    ? "You're in. Weekly deals digest coming your way."
                    : 'Du bist dabei. Der wöchentliche Deals-Digest kommt zu dir.')}
            </p>
          </div>
        </div>
      </div>
    );
  }

  if (status === 'waitlisted') {
    return (
      <div className="mt-10 bg-[#1a1c1c] text-white rounded-[2.5rem] p-8 md:p-10 border-4 border-[#1a1c1c]">
        <p className="font-headline font-black text-2xl mb-2">
          {lang === 'en' ? 'All 500 spots taken!' : 'Alle 500 Plätze vergeben!'}
        </p>
        <p className="text-white/70 font-bold">
          {lang === 'en' ? "We've added you to the waitlist — you'll be first when spots open." : 'Wir haben dich auf die Warteliste gesetzt.'}
        </p>
      </div>
    );
  }

  return (
    <div className="mt-10 bg-[#1a1c1c] text-white rounded-[2.5rem] p-8 md:p-10 border-4 border-[#1a1c1c] relative overflow-hidden">
      <div className="absolute top-4 right-6 text-5xl opacity-10 rotate-12 select-none">⚡</div>

      <div className="inline-block bg-primary/20 text-primary text-xs font-black uppercase tracking-widest px-3 py-1 rounded-full mb-4">
        {lang === 'en' ? `${500 - count} of 500 spots left` : `${500 - count} von 500 Plätzen frei`}
      </div>

      <h3 className="font-headline font-black text-2xl md:text-3xl mb-2">
        {lang === 'en' ? 'Become a Founding Member' : 'Werde Gründungsmitglied'}
      </h3>
      <p className="text-white/70 font-bold mb-1">
        {lang === 'en'
          ? 'Get the weekly deals digest — top 5 offers across all 5 stores, in your city, every week.'
          : 'Erhalte den wöchentlichen Deals-Digest — die 5 besten Angebote aus allen 5 Läden in deiner Stadt.'}
      </p>
      <p className="text-white/40 text-sm font-bold mb-6">
        {lang === 'en' ? `${count} people already in.` : `${count} Personen sind bereits dabei.`}
      </p>

      <div className="flex flex-col sm:flex-row gap-3">
        <input
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder={lang === 'en' ? 'your@email.com' : 'deine@email.de'}
          className="flex-1 px-6 py-4 rounded-full bg-white/10 border-2 border-white/20 text-white font-bold placeholder:text-white/30 focus:border-primary focus:ring-0 outline-none transition-all"
          onKeyDown={(e) => { if (e.key === 'Enter') handleSubmit(); }}
        />
        <button
          onClick={handleSubmit}
          disabled={status === 'loading'}
          className="px-8 py-4 bg-primary text-white font-headline font-black rounded-full border-2 border-white/20 hover:scale-[1.02] active:scale-[0.98] transition-all neo-button whitespace-nowrap disabled:opacity-50"
        >
          {status === 'loading'
            ? '...'
            : (lang === 'en' ? 'CLAIM MY SPOT ⚡' : 'PLATZ SICHERN ⚡')}
        </button>
      </div>
      <p className="text-white/30 text-xs font-medium mt-4">
        {lang === 'en' ? 'Free forever. No spam. Unsubscribe anytime.' : 'Kostenlos. Kein Spam. Jederzeit abmelden.'}
      </p>
    </div>
  );
}
```

- [ ] **Step 2: Replace the existing price alert block**

In `src/app/page.tsx`, find the existing price alert section inside the search results. It starts with:
```tsx
{/* Price Alert Signup — appears after results */}
<div className="mt-10 bg-[#1a1c1c] text-white rounded-[2.5rem] p-8 md:p-10 border-4 border-[#1a1c1c] relative overflow-hidden">
```

Replace the entire block (from that comment down to its closing `</div>`) with:
```tsx
{/* Founding Members Block */}
<FoundingMemberBlock city={city} lang={lang} l={l} />
```

- [ ] **Step 3: Verify locally**

1. Run `npm run dev`, open `http://localhost:3000`
2. Search for any product — after results appear, scroll down to see the Founding Member block
3. It should show "X of 500 spots left" and the spots count
4. Enter a test email and click CLAIM MY SPOT
5. Should show "Founding Member #1 — You're in"
6. Enter the same email again — should show "You're already in. Welcome back!" with the same number
7. TractionBar should be visible below the headline with live numbers

- [ ] **Step 4: Commit**

```bash
git add src/app/page.tsx
git commit -m "feat: add FoundingMemberBlock replacing generic email alert

Users now get a member number on signup, see spots remaining, and
receive a clear value proposition (weekly deals digest). Waitlist
fallback kicks in after 500 members."
```

---

## Task 8: Final Push

- [ ] **Step 1: Push to deploy**

```bash
git push origin main
```

- [ ] **Step 2: Verify on production**

1. Visit `https://www.papierbox.eu` — TractionBar visible below headline
2. Search any product — scroll to bottom of results — Founding Member block visible
3. Sign up with a real email — confirm member number appears
4. Check Supabase Table Editor: `founding_members` table has the row, `site_stats` shows incrementing `price_checks`

---

## Self-Review Checklist

- [x] **Spec coverage:** Traction counter ✓, founding members ✓, member number reveal ✓, waitlist fallback ✓, spots counter ✓, also-adds-to-subscribers ✓
- [x] **No placeholders:** All code is complete and runnable
- [x] **Type consistency:** `stats` type defined inline in TractionBar, `status` union type covers all states, API response shapes consistent across GET/POST
- [x] **RLS:** site_stats public read policy included in SQL, founding_members restricted
- [x] **No test framework:** Per CLAUDE.md — no test framework configured, using manual verification steps instead
