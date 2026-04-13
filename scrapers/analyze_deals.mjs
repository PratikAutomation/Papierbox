import { createClient } from '@supabase/supabase-js';

const sb = createClient(
  'https://jgtgikvwfwlrhxdbwzdm.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpndGdpa3Z3Zndscmh4ZGJ3emRtIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NDE4NDk2NSwiZXhwIjoyMDg5NzYwOTY1fQ.rWhvRoUL4oJyLftamZX5cUUNwGVUBM5U1XQtUSOtA98'
);

const STORES = { '1': 'Lidl', '2': 'Aldi Süd', '3': 'Penny', '4': 'Kaufland', '5': 'Netto' };

const { data, error } = await sb.from('offers')
  .select('*')
  .eq('is_offer', true)
  .gte('valid_to', '2026-04-13')
  .lte('valid_from', '2026-04-13')
  .not('original_price', 'is', null);

if (error) { console.error(error); process.exit(1); }

const withSavings = data.map(r => ({
  ...r,
  store_name: STORES[r.store_id] || r.store_id,
  saving_abs: Math.round((r.original_price - r.price) * 100) / 100,
  saving_pct: Math.round((1 - r.price / r.original_price) * 100),
})).filter(r => r.saving_abs > 0.01 && r.saving_pct > 0);

console.log(`Total offers with discount this week: ${withSavings.length}`);

// ─── TOP 10 OVERALL by % off ───────────────────────────────────────────────
console.log('\n══════════════ TOP 10 BIGGEST DEALS (% off) ══════════════');
const top10 = [...withSavings].sort((a, b) => b.saving_pct - a.saving_pct).slice(0, 10);
top10.forEach((r, i) => {
  console.log(`${i + 1}. [${r.store_name}] ${r.product_name}`);
  console.log(`   ${r.price}€  (was ${r.original_price}€)  →  -${r.saving_pct}%  /  save ${r.saving_abs}€  |  ${r.unit}`);
});

// ─── COMMON PRODUCTS: same category across 2+ stores ──────────────────────
console.log('\n══════════════ TOP 5 COMMON PRODUCTS ON DEAL (multiple stores) ══════════════');

const catMap = {};
for (const r of withSavings) {
  const key = r.category_en;
  if (!catMap[key]) catMap[key] = [];
  catMap[key].push(r);
}

const multiStore = Object.entries(catMap)
  .filter(([, items]) => new Set(items.map(i => i.store_id)).size >= 2)
  .map(([cat, items]) => {
    const storeCount = new Set(items.map(i => i.store_id)).size;
    const avgPct = Math.round(items.reduce((s, i) => s + i.saving_pct, 0) / items.length);
    const bestDeal = [...items].sort((a, b) => b.saving_pct - a.saving_pct)[0];
    return { cat, items, storeCount, avgPct, bestDeal };
  })
  .sort((a, b) => b.storeCount - a.storeCount || b.avgPct - a.avgPct)
  .slice(0, 5);

multiStore.forEach((g, i) => {
  const storeNames = [...new Set(g.items.map(r => r.store_name))].join(', ');
  console.log(`\n${i + 1}. 📦 ${g.cat}  —  ${g.storeCount} stores competing  |  avg -${g.avgPct}%`);
  console.log(`   Stores: ${storeNames}`);
  const top3 = [...g.items].sort((a, b) => b.saving_pct - a.saving_pct).slice(0, 4);
  top3.forEach(r => {
    console.log(`   • [${r.store_name}] ${r.product_name.slice(0, 60)}  →  ${r.price}€ (was ${r.original_price}€)  -${r.saving_pct}%`);
  });
});
