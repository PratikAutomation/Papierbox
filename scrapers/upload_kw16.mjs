/**
 * Upload KW16 (Apr 13-18, 2026) offer files to Supabase
 * Run: node scrapers/upload_kw16.mjs
 */
import { createClient } from '@supabase/supabase-js';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));

const SUPABASE_URL = 'https://jgtgikvwfwlrhxdbwzdm.supabase.co';
const SERVICE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpndGdpa3Z3Zndscmh4ZGJ3emRtIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NDE4NDk2NSwiZXhwIjoyMDg5NzYwOTY1fQ.rWhvRoUL4oJyLftamZX5cUUNwGVUBM5U1XQtUSOtA98';

const sb = createClient(SUPABASE_URL, SERVICE_KEY);

const PROSPECT_DIR = join(__dirname, '..', 'Prospect', 'Prospects_bis_18.4');

const SOURCE_URLS = {
  '1': 'https://www.lidl.de/angebote',
  '2': 'https://www.aldi-sued.de/de/angebote.html',
  '3': 'https://www.penny.de/angebote',
  '5': 'https://www.netto-online.de/angebote',
};

const FILES = [
  { file: 'lidl_offers_kw16_2026.sql', storeId: '1', name: 'Lidl' },
  { file: 'aldi_sued_offers.sql', storeId: '2', name: 'Aldi Süd' },
  { file: 'penny_offers.sql', storeId: '3', name: 'Penny' },
  { file: 'netto_offers_kw16_2026.sql', storeId: '5', name: 'Netto' },
];

function parseSql(filepath, storeId) {
  const content = readFileSync(filepath, 'utf8');
  const rows = [];

  for (const line of content.split('\n')) {
    const trimmed = line.trim();
    if (!trimmed.startsWith(`('${storeId}'`)) continue;

    // Remove trailing comma/semicolon
    const clean = trimmed.replace(/[,;]\s*$/, '');
    if (!clean.startsWith('(') || !clean.endsWith(')')) continue;

    // Remove outer parens
    const inner = clean.slice(1, -1);

    // Parse comma-separated values respecting single-quoted strings
    const parts = [];
    let temp = '';
    let inQ = false;
    let i = 0;
    while (i < inner.length) {
      const ch = inner[i];
      if (ch === "'" && !inQ) {
        inQ = true;
        temp += ch;
      } else if (ch === "'" && inQ) {
        // Check for escaped ''
        if (inner[i + 1] === "'") {
          temp += "''";
          i += 2;
          continue;
        }
        inQ = false;
        temp += ch;
      } else if (ch === ',' && !inQ) {
        parts.push(temp.trim());
        temp = '';
      } else {
        temp += ch;
      }
      i++;
    }
    parts.push(temp.trim());

    if (parts.length < 13) continue;

    const cv = (v) => {
      v = v.trim();
      if (v.toUpperCase() === 'NULL') return null;
      if (v === 'true') return true;
      if (v === 'false') return false;
      if (v.startsWith("'") && v.endsWith("'")) return v.slice(1, -1).replace(/''/g, "'");
      const num = Number(v);
      return isNaN(num) ? v : num;
    };

    const vals = parts.map(cv);
    const price = vals[6] != null ? Number(vals[6]) : null;
    const origPrice = vals[7] != null ? Number(vals[7]) : null;

    if (!price || price <= 0 || !vals[2]) continue;

    rows.push({
      store_id: String(vals[0]),
      brand: vals[1] || '',
      product_name: String(vals[2]),
      product_name_en: String(vals[3] || vals[2]),
      category: String(vals[4] || 'Sonstiges'),
      category_en: String(vals[5] || 'Other'),
      price,
      original_price: origPrice,
      unit: String(vals[8] || 'Stück'),
      valid_from: String(vals[9]),
      valid_to: String(vals[10]),
      is_offer: typeof vals[11] === 'boolean' ? vals[11] : true,
      source_url: SOURCE_URLS[storeId] || '',
    });
  }

  return rows;
}

async function uploadStore({ file, storeId, name }) {
  const filepath = join(PROSPECT_DIR, file);
  console.log(`\n${'='.repeat(50)}`);
  console.log(`  ${name} (store_id=${storeId})`);
  console.log(`${'='.repeat(50)}`);

  const rows = parseSql(filepath, storeId);
  console.log(`  Parsed: ${rows.length} valid offers`);

  if (rows.length < 5) {
    console.log(`  ERROR: Too few rows — skipping!`);
    return 0;
  }

  // Delete old data
  console.log(`  Deleting old data for store_id=${storeId}...`);
  await sb.from('offers').delete().eq('store_id', storeId);
  await sb.from('price_estimates').delete().eq('store_id', storeId);

  // Insert in batches of 50
  let inserted = 0;
  const BATCH = 50;
  for (let i = 0; i < rows.length; i += BATCH) {
    const batch = rows.slice(i, i + BATCH);
    const { data, error } = await sb.from('offers').insert(batch);
    if (error) {
      console.log(`  ERROR batch ${Math.floor(i/BATCH)+1}: ${error.message}`);
      // Try one by one
      for (const row of batch) {
        const { error: e2 } = await sb.from('offers').insert(row);
        if (!e2) inserted++;
        else console.log(`  SKIP: ${row.product_name.slice(0,40)} — ${e2.message}`);
      }
    } else {
      inserted += batch.length;
      console.log(`  Batch ${Math.floor(i/BATCH)+1}: inserted ${batch.length} rows`);
    }
  }

  console.log(`  SUCCESS: ${inserted}/${rows.length} offers for ${name}`);
  return inserted;
}

async function verify() {
  console.log(`\n${'='.repeat(50)}`);
  console.log('FINAL VERIFICATION IN SUPABASE');
  console.log(`${'='.repeat(50)}`);

  const stores = { '1': 'Lidl', '2': 'Aldi Süd', '3': 'Penny', '4': 'Kaufland', '5': 'Netto' };
  let grandTotal = 0;

  for (const [sid, name] of Object.entries(stores)) {
    const { data } = await sb.from('offers').select('id, is_offer, valid_from, valid_to').eq('store_id', sid);
    const count = data?.length || 0;
    grandTotal += count;
    const onSale = data?.filter(r => r.is_offer).length || 0;
    const dates = [...new Set(data?.map(r => r.valid_from).filter(Boolean))].sort();
    console.log(`  ${name}: ${count} total (${onSale} on sale) | dates: ${dates.slice(0,2).join(', ')}${dates.length > 2 ? '...' : ''}`);
  }

  console.log(`\n  GRAND TOTAL: ${grandTotal} offers across all 5 stores`);
}

async function main() {
  let total = 0;
  for (const f of FILES) {
    total += await uploadStore(f);
  }
  console.log(`\n${'='.repeat(50)}`);
  console.log(`UPLOAD DONE: ${total} total offers`);
  console.log(`${'='.repeat(50)}`);
  await verify();
}

main().catch(console.error);
