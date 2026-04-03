import { ParsedItem } from './types';

const ANTHROPIC_API_KEY = process.env.ANTHROPIC_API_KEY || '';
const CLAUDE_MODEL = 'claude-haiku-4-5-20251001';

async function callClaude(system: string, user: string, maxTokens = 2048): Promise<string> {
  if (!ANTHROPIC_API_KEY) throw new Error('ANTHROPIC_API_KEY not set');

  const response = await fetch('https://api.anthropic.com/v1/messages', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'x-api-key': ANTHROPIC_API_KEY,
      'anthropic-version': '2023-06-01',
    },
    body: JSON.stringify({
      model: CLAUDE_MODEL,
      max_tokens: maxTokens,
      system,
      messages: [{ role: 'user', content: user }],
    }),
  });

  if (!response.ok) {
    console.error('Claude API error:', response.status, await response.text());
    throw new Error(`Claude API returned ${response.status}`);
  }

  const data = await response.json();
  return data.content?.[0]?.text?.trim() || '';
}

function parseJSON<T>(text: string): T | null {
  let clean = text;
  if (clean.startsWith('```')) {
    clean = clean.split('\n').slice(1, -1).join('\n');
  }
  clean = clean.replace(/,\s*}/g, '}').replace(/,\s*\]/g, ']');
  try {
    return JSON.parse(clean) as T;
  } catch {
    console.error('Failed to parse Claude JSON:', clean.slice(0, 200));
    return null;
  }
}

const NORMALIZE_SYSTEM = `You are a German grocery product search normalizer for papierbox.eu (compares Lidl, Aldi Sud, Penny, Kaufland, Netto).

Convert raw search input into the best database search terms. The database contains German product names from weekly supermarket Prospekte.

Rules:
- Return SINGULAR German product name
- Return both German and English terms
- Strip quantities (2x, 3 Stuck) — return just the product
- Correct obvious typos
- For brand names, return brand + generic product
- Return category hint for filtering
- Return exclusion terms to prevent irrelevant matches (e.g. for "Mango" exclude "gefroren", "smoothie", "saft", "eis")
- Prefer MOST COMMON grocery interpretation when ambiguous
- Respond ONLY with valid JSON. No explanation.`;

interface NormalizeRaw {
  original: string;
  de: string;
  en: string;
  brand: string | null;
  category_de: string;
  category_en: string;
  exclude: string[];
  qty: number;
}

export async function normalizeItems(rawItems: string[]): Promise<ParsedItem[]> {
  if (rawItems.length === 0) return [];

  const userPrompt = `Normalize these grocery items: ${JSON.stringify(rawItems)}

Return a JSON array. For each item:
{
  "original": "raw input exactly as given",
  "de": "German product name (singular)",
  "en": "English product name",
  "brand": "brand name or null",
  "category_de": "German category",
  "category_en": "English category",
  "exclude": ["terms to exclude from search results"],
  "qty": 1
}`;

  try {
    const text = await callClaude(NORMALIZE_SYSTEM, userPrompt, 2048);
    const parsed = parseJSON<NormalizeRaw[]>(text);
    if (!parsed || !Array.isArray(parsed)) {
      return rawItems.map(item => ({
        original: item,
        normalized_de: item,
        normalized_en: item,
        brand: null,
        category_de: '',
        category_en: '',
        exclude: [],
        qty: 1,
      }));
    }

    return parsed.map(p => ({
      original: p.original,
      normalized_de: p.de,
      normalized_en: p.en,
      brand: p.brand,
      category_de: p.category_de,
      category_en: p.category_en,
      exclude: p.exclude || [],
      qty: p.qty || 1,
    }));
  } catch (error) {
    console.error('Normalize error:', error);
    return rawItems.map(item => ({
      original: item,
      normalized_de: item,
      normalized_en: item,
      brand: null,
      category_de: '',
      category_en: '',
      exclude: [],
      qty: 1,
    }));
  }
}

export async function normalizeSingle(query: string): Promise<ParsedItem> {
  const results = await normalizeItems([query]);
  return results[0];
}

export async function ocrPhoto(base64Image: string): Promise<string[]> {
  if (!ANTHROPIC_API_KEY) return [];

  try {
    const response = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': ANTHROPIC_API_KEY,
        'anthropic-version': '2023-06-01',
      },
      body: JSON.stringify({
        model: CLAUDE_MODEL,
        max_tokens: 1024,
        system: `You extract grocery items from photos of shopping lists. Accept handwritten notes, phone screenshots, WhatsApp messages, Notes app screenshots. Return a JSON array of item strings exactly as written. Do not interpret or normalize — just extract the text. If you cannot read an item, skip it. Respond ONLY with a JSON array of strings.`,
        messages: [{
          role: 'user',
          content: [
            {
              type: 'image',
              source: {
                type: 'base64',
                media_type: 'image/jpeg',
                data: base64Image,
              },
            },
            { type: 'text', text: 'Extract all grocery items from this shopping list image.' },
          ],
        }],
      }),
    });

    if (!response.ok) return [];
    const data = await response.json();
    const text = data.content?.[0]?.text?.trim() || '[]';
    const items = parseJSON<string[]>(text);
    return items && Array.isArray(items) ? items.filter(i => typeof i === 'string' && i.trim()) : [];
  } catch (error) {
    console.error('OCR error:', error);
    return [];
  }
}

export interface PriceEstimate {
  product: string;
  unit: string;
  prices: Record<string, number>;
  confidence: string;
}

interface PriceEstimateRaw {
  product: string;
  unit: string;
  prices: Record<string, number>;
  confidence: string;
}

const ESTIMATE_SYSTEM = `You estimate typical shelf prices at German DISCOUNT supermarkets.
Stores: Lidl (id 1), Aldi Sud (id 2), Penny (id 3), Kaufland (id 4), Netto (id 5).

CRITICAL RULES:
- These are DISCOUNT supermarkets. Prices are LOW. Not Rewe/Edeka level.
- Estimate STORE BRAND (Eigenmarke) price, not premium brands
- Round to nearest 0.X9 EUR (German pricing convention: 1.09, 1.19, 1.49, 1.99...)
- When unsure, estimate HIGHER rather than lower (user prefers finding it cheaper than expected)
- Include the unit size you are estimating for
- Set confidence: "high" for staple items (milk, bread, eggs), "low" for specialty items
- Respond ONLY with valid JSON array. No explanation.`;

export async function estimatePrices(items: string[]): Promise<PriceEstimate[]> {
  if (items.length === 0) return [];

  const userPrompt = `Estimate typical shelf prices for these products: ${JSON.stringify(items)}

Return a JSON array. For each product:
{
  "product": "product name",
  "unit": "size/unit",
  "prices": { "1": X.XX, "2": X.XX, "3": X.XX, "4": X.XX, "5": X.XX },
  "confidence": "high or low"
}`;

  try {
    const text = await callClaude(ESTIMATE_SYSTEM, userPrompt, 2048);
    const parsed = parseJSON<PriceEstimateRaw[]>(text);
    if (!parsed || !Array.isArray(parsed)) return [];

    return parsed.map(p => ({
      product: p.product,
      unit: p.unit || 'Stk',
      prices: p.prices || {},
      confidence: p.confidence || 'low',
    }));
  } catch (error) {
    console.error('Price estimation error:', error);
    return [];
  }
}
