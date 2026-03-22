import { offers } from './mock-data';
import { SearchResult, Offer } from './types';

// ============================================================================
// PRODUCTION-QUALITY FUZZY SEARCH ENGINE
// Supports: German-English bilingual search, fuzzy matching, umlaut
// normalization, typo tolerance, and intelligent scoring
// ============================================================================

// Type for scored offer results
interface ScoredOffer extends Offer {
  score: number;
  isSuggestion?: boolean;
}

// ============================================================================
// 1. GERMAN-ENGLISH SYNONYM/TRANSLATION MAP
// ============================================================================

const BILINGUAL_MAP: Record<string, string[]> = {
  // Meats & Proteins
  'chicken': ['hähnchen', 'hähnchenbrust', 'chicken', 'chicken breast'],
  'hähnchen': ['chicken', 'hähnchenbrust', 'chicken breast', 'hähnchen'],
  'beef': ['rinderhackfleisch', 'hackfleisch', 'ground beef', 'beef'],
  'hackfleisch': ['ground beef', 'beef', 'rinderhackfleisch', 'hackfleisch'],
  'salmon': ['lachs', 'bio lachs', 'salmon', 'organic salmon'],
  'lachs': ['salmon', 'bio lachs', 'lachs', 'organic salmon'],
  'tuna': ['thunfisch', 'tuna'],
  'thunfisch': ['tuna', 'thunfisch'],

  // Dairy
  'milk': ['milch', 'vollmilch', 'milk', 'whole milk'],
  'milch': ['milk', 'vollmilch', 'milch', 'whole milk'],
  'butter': ['butter', 'markenbutter', 'butter'],
  'eggs': ['eier', 'eggs'],
  'eier': ['eggs', 'eier'],
  'cheese': ['käse', 'gouda', 'cheese', 'gouda cheese'],
  'käse': ['cheese', 'gouda', 'käse', 'gouda cheese'],
  'yogurt': ['joghurt', 'naturjoghurt', 'yogurt', 'natural yogurt'],
  'joghurt': ['yogurt', 'naturjoghurt', 'joghurt', 'natural yogurt'],
  'cream': ['sahne', 'schlagsahne', 'cream'],
  'sahne': ['cream', 'schlagsahne', 'sahne'],

  // Vegetables
  'potatoes': ['kartoffeln', 'potatoes'],
  'kartoffeln': ['potatoes', 'kartoffeln'],
  'onions': ['zwiebeln', 'onions'],
  'zwiebeln': ['onions', 'zwiebeln'],
  'cucumber': ['gurke', 'salatgurke', 'cucumber'],
  'gurke': ['cucumber', 'salatgurke', 'gurke'],
  'tomatoes': ['tomaten', 'tomatoes'],
  'tomaten': ['tomatoes', 'tomaten'],
  'bell pepper': ['paprika', 'bell pepper'],
  'paprika': ['bell pepper', 'paprika'],

  // Fruits
  'apples': ['äpfel', 'apples'],
  'äpfel': ['apples', 'äpfel'],
  'bananas': ['bananen', 'bananas'],
  'bananen': ['bananas', 'bananen'],
  'avocado': ['avocado', 'avocado'],

  // Grains & Staples
  'bread': ['brot', 'vollkornbrot', 'bread', 'whole grain bread'],
  'brot': ['bread', 'vollkornbrot', 'brot', 'whole grain bread'],
  'rice': ['reis', 'rice'],
  'reis': ['rice', 'reis'],
  'pasta': ['nudeln', 'spaghetti', 'pasta'],
  'nudeln': ['pasta', 'spaghetti', 'nudeln'],
  'flour': ['mehl', 'flour'],
  'mehl': ['flour', 'mehl'],
  'oats': ['haferflocken', 'oats'],
  'haferflocken': ['oats', 'haferflocken'],

  // Legumes
  'chickpeas': ['kichererbsen', 'chickpeas'],
  'kichererbsen': ['chickpeas', 'kichererbsen'],
  'lentils': ['linsen', 'lentils'],
  'linsen': ['lentils', 'linsen'],

  // Oils & Condiments
  'olive oil': ['olivenöl', 'olive oil'],
  'olivenöl': ['olive oil', 'olivenöl'],
  'coconut milk': ['kokosmilch', 'coconut milk'],
  'kokosmilch': ['coconut milk', 'kokosmilch'],
  'ketchup': ['ketchup', 'ketchup'],
  'mustard': ['senf', 'mustard'],
  'senf': ['mustard', 'senf'],

  // Beverages & Others
  'water': ['wasser', 'mineralwasser', 'water'],
  'wasser': ['water', 'mineralwasser', 'wasser'],
  'coffee': ['kaffee', 'coffee'],
  'kaffee': ['coffee', 'kaffee'],
  'sugar': ['zucker', 'sugar'],
  'zucker': ['sugar', 'zucker'],

  // Non-food items
  'pizza': ['pizza', 'tiefkühlpizza', 'pizza'],
  'detergent': ['waschmittel', 'detergent'],
  'waschmittel': ['detergent', 'waschmittel'],
  'toilet paper': ['toilettenpapier', 'toilet paper'],
  'toilettenpapier': ['toilet paper', 'toilettenpapier'],
  'toothpaste': ['zahnpasta', 'toothpaste'],
  'zahnpasta': ['toothpaste', 'zahnpasta'],
};

// ============================================================================
// 2. UMLAUT NORMALIZATION
// ============================================================================

/**
 * Normalizes German umlauts to their ASCII equivalents
 * ä → ae, ö → oe, ü → ue, ß → ss
 */
function normalizeUmlauts(text: string): string {
  return text
    .replace(/ä/g, 'ae')
    .replace(/ö/g, 'oe')
    .replace(/ü/g, 'ue')
    .replace(/ß/g, 'ss')
    .replace(/Ä/g, 'ae')
    .replace(/Ö/g, 'oe')
    .replace(/Ü/g, 'ue');
}

/**
 * Creates multiple normalized variants of a string
 * Returns: [original lowercase, umlaut-normalized, both]
 */
function createNormalizedVariants(text: string): string[] {
  const lower = text.toLowerCase().trim();
  const normalized = normalizeUmlauts(lower);

  // Return unique variants
  const variants = new Set([lower, normalized]);
  return Array.from(variants);
}

// ============================================================================
// 3. LEVENSHTEIN DISTANCE (Fuzzy Matching)
// ============================================================================

/**
 * Calculate Levenshtein distance between two strings
 * Used for typo tolerance (e.g., "buttter" → "butter")
 */
function levenshteinDistance(str1: string, str2: string): number {
  const len1 = str1.length;
  const len2 = str2.length;

  // Create a 2D array for dynamic programming
  const dp: number[][] = Array(len1 + 1)
    .fill(null)
    .map(() => Array(len2 + 1).fill(0));

  // Initialize base cases
  for (let i = 0; i <= len1; i++) dp[i][0] = i;
  for (let j = 0; j <= len2; j++) dp[0][j] = j;

  // Fill the dp table
  for (let i = 1; i <= len1; i++) {
    for (let j = 1; j <= len2; j++) {
      if (str1[i - 1] === str2[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1];
      } else {
        dp[i][j] = Math.min(
          dp[i - 1][j] + 1,     // deletion
          dp[i][j - 1] + 1,     // insertion
          dp[i - 1][j - 1] + 1  // substitution
        );
      }
    }
  }

  return dp[len1][len2];
}

/**
 * Check if fuzzy match is acceptable based on word length
 * Short words (<=5 chars): max distance 2
 * Longer words: max distance 3
 */
function isFuzzyMatch(query: string, target: string): boolean {
  const distance = levenshteinDistance(query, target);
  const maxDistance = query.length <= 5 ? 2 : 3;
  return distance <= maxDistance;
}

// ============================================================================
// 4. SCORING SYSTEM
// ============================================================================

/**
 * Calculate relevance score for a product match
 * Returns a score from 0-100 based on match quality
 */
function calculateScore(query: string, productName: string, productNameEn: string): number {
  const queryVariants = createNormalizedVariants(query);
  const nameVariants = createNormalizedVariants(productName);
  const nameEnVariants = createNormalizedVariants(productNameEn);

  let bestScore = 0;

  for (const qVariant of queryVariants) {
    // Check German name
    for (const nameVariant of nameVariants) {
      const score = getMatchScore(qVariant, nameVariant);
      bestScore = Math.max(bestScore, score);
    }

    // Check English name
    for (const nameEnVariant of nameEnVariants) {
      const score = getMatchScore(qVariant, nameEnVariant);
      bestScore = Math.max(bestScore, score);
    }

    // Check synonyms/translations
    const synonymScore = getSynonymScore(qVariant, productName, productNameEn);
    bestScore = Math.max(bestScore, synonymScore);
  }

  return bestScore;
}

/**
 * Get match score for a single query-target pair
 */
function getMatchScore(query: string, target: string): number {
  // Exact match: 100
  if (query === target) return 100;

  // Starts-with match: 80
  if (target.startsWith(query)) return 80;

  // Contains match: 60
  if (target.includes(query)) return 60;

  // Fuzzy match: 40 - (distance * 5)
  if (isFuzzyMatch(query, target)) {
    const distance = levenshteinDistance(query, target);
    return Math.max(25, 40 - (distance * 5));
  }

  // Check if query is contained in any word of the target
  const targetWords = target.split(/\s+/);
  for (const word of targetWords) {
    if (word.startsWith(query)) return 70;
    if (word.includes(query) && query.length >= 3) return 55;
    if (isFuzzyMatch(query, word)) {
      const distance = levenshteinDistance(query, word);
      return Math.max(25, 35 - (distance * 5));
    }
  }

  return 0;
}

/**
 * Get score based on synonym/translation matching
 */
function getSynonymScore(query: string, productName: string, productNameEn: string): number {
  const synonyms = BILINGUAL_MAP[query] || [];

  for (const synonym of synonyms) {
    const synVariants = createNormalizedVariants(synonym);
    const nameVariants = createNormalizedVariants(productName);
    const nameEnVariants = createNormalizedVariants(productNameEn);

    for (const synVariant of synVariants) {
      // Check against German name
      for (const nameVariant of nameVariants) {
        if (nameVariant.includes(synVariant) || synVariant.includes(nameVariant)) {
          return 90; // Synonym match score
        }
      }

      // Check against English name
      for (const nameEnVariant of nameEnVariants) {
        if (nameEnVariant.includes(synVariant) || synVariant.includes(nameEnVariant)) {
          return 90; // Synonym match score
        }
      }
    }
  }

  return 0;
}

// ============================================================================
// 5. MAIN SEARCH FUNCTION
// ============================================================================

/**
 * Search for offers with fuzzy matching, bilingual support, and intelligent scoring
 * Always returns results - either matches or suggestions
 */
export function searchOffers(product: string, city: string): SearchResult {
  const query = product.trim();

  if (!query) {
    // Return 5 cheapest items as suggestions for empty query
    const cheapestOffers = [...offers]
      .sort((a, b) => a.price - b.price)
      .slice(0, 5)
      .map(offer => ({ ...offer, score: 0, isSuggestion: true }));

    return buildSearchResult(query, city, cheapestOffers);
  }

  // Score all offers
  const scoredOffers: ScoredOffer[] = offers.map(offer => {
    const score = calculateScore(query, offer.productName, offer.productNameEn);
    return { ...offer, score };
  });

  // Filter by minimum score threshold
  const MIN_SCORE = 25;
  const matchedOffers = scoredOffers.filter(offer => offer.score >= MIN_SCORE);

  if (matchedOffers.length > 0) {
    // Sort by score (desc), then by price (asc)
    matchedOffers.sort((a, b) => {
      if (b.score !== a.score) {
        return b.score - a.score; // Higher score first
      }
      return a.price - b.price; // Lower price first within same score
    });

    return buildSearchResult(query, city, matchedOffers);
  }

  // No matches found - return 5 cheapest items as suggestions
  const suggestions = [...offers]
    .sort((a, b) => a.price - b.price)
    .slice(0, 5)
    .map(offer => ({ ...offer, score: 0, isSuggestion: true }));

  return buildSearchResult(query, city, suggestions);
}

/**
 * Build the final search result object
 */
function buildSearchResult(
  product: string,
  city: string,
  scoredOffers: ScoredOffer[]
): SearchResult {
  const prices = scoredOffers.map(offer => offer.price);
  const bestPrice = prices.length > 0 ? Math.min(...prices) : null;
  const worstPrice = prices.length > 0 ? Math.max(...prices) : null;
  const savingsAmount =
    bestPrice !== null && worstPrice !== null ? worstPrice - bestPrice : null;

  // Remove score and isSuggestion from final offers (type cleanup)
  const cleanOffers: Offer[] = scoredOffers.map(({ score, isSuggestion, ...offer }) => offer);

  return {
    product,
    city,
    offers: cleanOffers,
    bestPrice,
    worstPrice,
    savingsAmount,
    totalOffers: cleanOffers.length,
  };
}

// ============================================================================
// 6. AUTOCOMPLETE SUGGESTIONS
// ============================================================================

/**
 * Get autocomplete suggestions for a query
 * Returns up to 8 unique product names (both German and English)
 */
export function getAutocompleteSuggestions(query: string): string[] {
  const trimmedQuery = query.trim();

  if (!trimmedQuery) {
    // Return popular items for empty query
    return [
      'Butter',
      'Milk',
      'Eggs',
      'Bread',
      'Chicken',
      'Avocado',
      'Bananas',
      'Pasta',
    ];
  }

  // Score all unique product names
  interface ScoredProduct {
    name: string;
    score: number;
  }

  const productNames = new Map<string, number>();

  offers.forEach(offer => {
    const germanScore = calculateScore(trimmedQuery, offer.productName, '');
    const englishScore = calculateScore(trimmedQuery, offer.productNameEn, '');

    // Track German name
    if (germanScore > 0) {
      const existing = productNames.get(offer.productName) || 0;
      productNames.set(offer.productName, Math.max(existing, germanScore));
    }

    // Track English name (if different from German)
    if (englishScore > 0 && offer.productNameEn !== offer.productName) {
      const existing = productNames.get(offer.productNameEn) || 0;
      productNames.set(offer.productNameEn, Math.max(existing, englishScore));
    }
  });

  // Convert to array and sort by score
  const scoredProducts: ScoredProduct[] = Array.from(productNames.entries())
    .map(([name, score]) => ({ name, score }))
    .filter(p => p.score >= 25)
    .sort((a, b) => b.score - a.score);

  // Return top 8 suggestions
  return scoredProducts.slice(0, 8).map(p => p.name);
}
