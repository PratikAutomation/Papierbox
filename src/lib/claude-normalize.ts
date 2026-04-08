import { ParsedItem } from './types';

const ANTHROPIC_API_KEY = process.env.ANTHROPIC_API_KEY || '';
const CLAUDE_MODEL = 'claude-haiku-4-5-20251001';

// ============================================================
// LOCAL NORMALIZER — works without API key, handles 80% of cases
// ============================================================

const EN_TO_DE: Record<string, string> = {
  chicken: 'Hähnchen', milk: 'Milch', eggs: 'Eier', butter: 'Butter',
  bread: 'Brot', cheese: 'Käse', rice: 'Reis',
  pasta: 'Nudeln', yogurt: 'Joghurt', beef: 'Hackfleisch', salmon: 'Lachs',
  cucumber: 'Gurke',
  coffee: 'Kaffee', water: 'Wasser', sugar: 'Zucker',
  flour: 'Mehl', cream: 'Sahne', tuna: 'Thunfisch', pizza: 'Pizza',
  oats: 'Haferflocken', lentils: 'Linsen', chickpeas: 'Kichererbsen',
  avocado: 'Avocado', mango: 'Mango',
  berry: 'Beeren', berries: 'Beeren', strawberry: 'Erdbeeren', strawberries: 'Erdbeeren',
  blueberry: 'Blaubeeren', blueberries: 'Blaubeeren', grape: 'Trauben', grapes: 'Trauben',
  orange: 'Orange', lemon: 'Zitrone',
  tomato: 'Tomaten', tomatoes: 'Tomaten', potato: 'Kartoffeln', potatoes: 'Kartoffeln',
  apple: 'Äpfel', apples: 'Äpfel', banana: 'Banane', bananas: 'Bananen',
  onion: 'Zwiebeln', onions: 'Zwiebeln', carrot: 'Karotten', carrots: 'Karotten',
  mushroom: 'Pilze', mushrooms: 'Pilze',
  garlic: 'Knoblauch', ginger: 'Ingwer', pepper: 'Paprika',
  spinach: 'Spinat', broccoli: 'Brokkoli', ham: 'Schinken',
  sausage: 'Wurst', salami: 'Salami', chocolate: 'Schokolade', chips: 'Chips',
  juice: 'Saft', beer: 'Bier', wine: 'Wein', oil: 'Öl',
  vinegar: 'Essig', mustard: 'Senf', ketchup: 'Ketchup', honey: 'Honig',
  jam: 'Marmelade', cereal: 'Müsli', noodles: 'Nudeln', soap: 'Seife',
  shampoo: 'Shampoo', detergent: 'Waschmittel',
  'toilet paper': 'Toilettenpapier', 'olive oil': 'Olivenöl',
  'coconut milk': 'Kokosmilch', 'bell pepper': 'Paprika',
  'chicken breast': 'Hähnchenbrust', 'ground beef': 'Hackfleisch',
  'peanut butter': 'Erdnussbutter', 'ice cream': 'Eiscreme',
};

// Common typos
const TYPO_MAP: Record<string, string> = {
  avacado: 'avocado', avacodo: 'avocado', avokado: 'avocado',
  chiken: 'chicken', chickn: 'chicken', checken: 'chicken',
  tomatoe: 'tomato', potatos: 'potatoes', brocoli: 'broccoli',
  bannana: 'banana', bannanas: 'bananas', coffe: 'coffee',
  youghurt: 'yogurt', yoghurt: 'yogurt', joghurt: 'joghurt',
  milch: 'milch', mangos: 'mango', mangoes: 'mango',
};

function localNormalize(raw: string): ParsedItem {
  let text = raw.trim();
  const original = text;

  // Strip quantity prefix: "2x butter" → "butter", "3 Eier" → "Eier"
  let qty = 1;
  const qtyMatch = text.match(/^(\d+)\s*[x×]?\s+(.+)/i);
  if (qtyMatch) {
    qty = parseInt(qtyMatch[1], 10) || 1;
    text = qtyMatch[2].trim();
  }

  // Strip trailing quantity/unit info: "milk 3.5 fat 2 packets" → "milk"
  // Remove patterns like "3.5 fat", "2 packets", "500g", "1L", and chained descriptors
  text = text.replace(/\s+\d+[\.,]?\d*\s*%.*$/i, '').trim(); // "milk 3.5% fat" → "milk"
  text = text.replace(/\s+\d+[\.,]?\d*\s*(g|kg|ml|l|liter|litre|fat|fett|packets?|stk|stück|pieces?|pack|packs?)(\s+\d+.*)?$/i, '').trim();
  // Catch remaining number-heavy suffixes: "milk 3.5 fat 2 packets" → "milk"
  text = text.replace(/\s+\d+[\.,]?\d*\s+\w+(\s+\d+.*)?$/i, '').trim();

  let lower = text.toLowerCase().trim();

  // Fix typos
  if (TYPO_MAP[lower]) {
    lower = TYPO_MAP[lower];
    text = lower;
  }

  // Strip English plurals: mangos→mango, berries→berry, tomatoes→tomato, apples→apple
  let singular = lower;
  if (singular.endsWith('ies') && singular.length > 4) {
    singular = singular.slice(0, -3) + 'y'; // berries → berry
  } else if (singular.endsWith('oes') && singular.length > 4) {
    singular = singular.slice(0, -2); // tomatoes → tomato, potatoes → potato
  } else if (singular.endsWith('es') && singular.length > 3) {
    singular = singular.slice(0, -2); // oranges → orang... hmm
    // Check if the -es version is in our dictionary
    if (!EN_TO_DE[singular]) singular = lower.slice(0, -1); // oranges → orange
  } else if (singular.endsWith('s') && singular.length > 3 && !singular.endsWith('ss')) {
    singular = singular.slice(0, -1); // mangos→mango, bananas→banana
  }

  // Try to find EN→DE translation
  const deTranslation = EN_TO_DE[lower] || EN_TO_DE[singular] || EN_TO_DE[text.toLowerCase()];

  return {
    original,
    normalized_de: deTranslation || text,
    normalized_en: deTranslation ? (singular || lower) : text,
    brand: null,
    category_de: '',
    category_en: '',
    exclude: [],
    qty,
  };
}

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

  // Always run local normalization first (handles plurals, typos, EN→DE)
  const localResults = rawItems.map(item => localNormalize(item));

  // Try Claude for enhanced normalization (better categories, exclude terms, brand detection)
  if (!ANTHROPIC_API_KEY) return localResults;

  try {
    const text = await callClaude(NORMALIZE_SYSTEM, userPrompt, 2048);
    const parsed = parseJSON<NormalizeRaw[]>(text);
    if (!parsed || !Array.isArray(parsed)) {
      return localResults;
    }

    return parsed.map((p, i) => ({
      original: p.original || localResults[i]?.original || rawItems[i],
      normalized_de: p.de || localResults[i]?.normalized_de || rawItems[i],
      normalized_en: p.en || localResults[i]?.normalized_en || rawItems[i],
      brand: p.brand,
      category_de: p.category_de,
      category_en: p.category_en,
      exclude: p.exclude || [],
      qty: p.qty || localResults[i]?.qty || 1,
    }));
  } catch (error) {
    console.error('Claude normalize failed, using local normalization:', error);
    return localResults;
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

// ============================================================
// LLM RANKING — Claude picks best matches from DB candidates
// ============================================================

interface RankCandidate {
  id: string;
  product_name: string;
  product_name_en: string;
  brand: string;
  category_en: string;
  price: number;
  unit: string;
}

const RANK_SYSTEM = `You are a grocery product matcher for a German supermarket price comparison app.
You receive a user's search query and a list of products from the database.
Your job: pick ONLY the products that genuinely match what the user wants to buy.

CRITICAL RULES:
- Understand the user's INTENT, not just keywords
- "Eggs" = Eier (chicken eggs for cooking). NOT egg pasta, NOT egg liqueur, NOT Kinder Surprise Egg, NOT products by brands containing "Ei"
- "Milk" = Milch (drinking milk). NOT Milchreis (rice pudding), NOT Müllermilch (flavored drink), NOT Milchschnitte (snack)
- "Butter" = actual butter/margarine. NOT Butterkeks (biscuit), NOT Buttermilch (buttermilk), NOT Erdnussbutter
- "Chicken" = raw/cooked chicken meat. NOT chicken-flavored sausage, NOT chicken-flavored chips
- German compound words: Milchreis is rice pudding (NOT milk), Eierlikör is egg liqueur (NOT eggs)
- Include genuine variants: "Milk" → whole milk, low-fat milk, lactose-free milk, oat milk all count
- Exclude products that just contain the ingredient as a sub-component
- If NOTHING genuinely matches, return an empty array

Return ONLY valid JSON: {"matches": ["id1", "id2", ...]}
Rank best matches first. Maximum 15 matches.`;

export async function rankWithClaude(
  query: string,
  candidates: RankCandidate[]
): Promise<string[]> {
  if (!ANTHROPIC_API_KEY || candidates.length === 0) return [];

  // Trim candidate data to minimize tokens
  const trimmed = candidates.map(c => ({
    id: c.id,
    n: c.product_name,
    ne: c.product_name_en,
    b: c.brand,
    c: c.category_en,
    p: c.price,
    u: c.unit,
  }));

  const userPrompt = `User searched: "${query}"

Products in database:
${JSON.stringify(trimmed)}

Which products match what the user wants? Return {"matches": ["id1", "id2", ...]} ranked by relevance.`;

  try {
    const text = await callClaude(RANK_SYSTEM, userPrompt, 512);
    const parsed = parseJSON<{ matches: string[] }>(text);
    if (!parsed || !Array.isArray(parsed.matches)) return [];
    return parsed.matches.filter(id => typeof id === 'string');
  } catch (error) {
    console.error('rankWithClaude failed:', error);
    return [];
  }
}

/**
 * For compare feature: pick best match for each item in a grocery list
 * Single Claude call for all items (cheaper than one call per item)
 */
export async function matchItemsWithClaude(
  items: string[],
  candidatesByItem: Map<string, RankCandidate[]>
): Promise<Map<string, string | null>> {
  if (!ANTHROPIC_API_KEY) return new Map();

  const itemData = items.map(item => ({
    item,
    candidates: (candidatesByItem.get(item) || []).map(c => ({
      id: c.id,
      n: c.product_name,
      ne: c.product_name_en,
      b: c.brand,
      c: c.category_en,
      p: c.price,
      u: c.unit,
    })),
  }));

  const userPrompt = `For each grocery list item, pick the SINGLE best matching product from its candidates.

${JSON.stringify(itemData)}

Rules:
- Pick the product that IS the item, not a product that merely contains it as ingredient
- "milk" → pick actual milk (Vollmilch, Frische Milch), NOT Milchreis, NOT Müllermilch
- "eggs" → pick actual eggs (Eier), NOT egg pasta, NOT egg liqueur
- If no candidate genuinely matches, use null
- Pick the cheapest genuine match when multiple products match equally

Return JSON: {"results": {"item_name": "product_id_or_null", ...}}`;

  try {
    const text = await callClaude(RANK_SYSTEM, userPrompt, 1024);
    const parsed = parseJSON<{ results: Record<string, string | null> }>(text);
    if (!parsed || !parsed.results) return new Map();
    return new Map(Object.entries(parsed.results));
  } catch (error) {
    console.error('matchItemsWithClaude failed:', error);
    return new Map();
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
