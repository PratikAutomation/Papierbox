# Search Engine Example Queries

## Test Cases Demonstrating All Features

### ✅ Fuzzy Matching (Typo Tolerance)

```typescript
searchOffers("buttter", "Hamburg")
// ✓ Matches: "Butter", "Deutsche Markenbutter"
// Levenshtein distance: 1 (extra 't')

searchOffers("avocdo", "Hamburg")
// ✓ Matches: "Avocado"
// Levenshtein distance: 2 (missing 'a')

searchOffers("chiken", "Hamburg")
// ✓ Matches: "Hähnchenbrust Filet", "Hähnchenbrust"
// Fuzzy match with synonym translation

searchOffers("milch", "Hamburg")
// ✓ Matches: "Vollmilch 3,5%", "Vollmilch"
// Exact substring match
```

### 🌍 German-English Bilingual Search

```typescript
// English queries
searchOffers("chicken", "Hamburg")
// Returns: 4 offers (Lidl €5.99, Aldi €5.49, Rewe €6.49, Penny €5.79)

searchOffers("milk", "Hamburg")
// Returns: 4 offers (Lidl €0.99, Aldi €1.09, Rewe €1.39, Penny €1.19)

searchOffers("eggs", "Hamburg")
// Returns: 5 offers (Lidl €1.69, Aldi €1.79, Rewe €2.49, Kaufland €1.99, Netto €1.89)

// German queries (same results)
searchOffers("hähnchen", "Hamburg")
// Returns: Same 4 chicken offers

searchOffers("milch", "Hamburg")
// Returns: Same 4 milk offers

searchOffers("eier", "Hamburg")
// Returns: Same 5 egg offers
```

### 🔤 Umlaut Normalization

```typescript
searchOffers("aepfel", "Hamburg")
// ✓ Matches: "Äpfel" (ä → ae)
// Returns: 4 offers (Aldi €2.29, Lidl €2.49, Netto €2.59, Rewe €2.99)

searchOffers("kaese", "Hamburg")
// ✓ Matches: "Käse", "Gouda Käse" (ä → ae)
// Returns: 4 offers

searchOffers("olivenoel", "Hamburg")
// ✓ Matches: "Olivenöl", "Natives Olivenöl Extra" (ö → oe)
// Returns: 4 offers (Aldi €4.79, Lidl €4.99, Kaufland €5.49, Rewe €5.99)
```

### 🔍 Partial/Substring Matching

```typescript
searchOffers("hack", "Hamburg")
// ✓ Matches: "Hackfleisch", "Rinderhackfleisch"
// Returns: 4 offers sorted by price (Aldi €4.49 first)

searchOffers("oliv", "Hamburg")
// ✓ Matches: "Olivenöl Extra Vergine", "Natives Olivenöl Extra", "Olivenöl"
// Returns: 4 offers

searchOffers("voll", "Hamburg")
// ✓ Matches: "Vollmilch 3,5%", "Vollmilch", "Vollkornbrot"
// Returns: 5 offers (milk + bread)
```

### ⭐ Scoring System (Relevance + Price)

```typescript
searchOffers("butter", "Hamburg")
// Results sorted by:
// 1. Score (relevance) - descending
// 2. Price - ascending within same score
//
// Expected order:
// 1. Lidl - Deutsche Markenbutter - €1.79 (Score: 100, exact match in product name)
// 2. Aldi - Butter - €1.89 (Score: 100, exact match)
// 3. Kaufland - Butter - €1.99 (Score: 100, exact match)
// 4. Netto - Butter - €1.99 (Score: 100, exact match)
// 5. Rewe - Butter - €2.49 (Score: 100, exact match)
//
// Savings: €0.70 (€1.79 vs €2.49)
```

### 🎯 Always Return Something (No Empty Results)

```typescript
searchOffers("xyzabc123", "Hamburg")
// No matches found → Returns 5 cheapest items as suggestions
//
// Suggested deals:
// 1. Joghurt @ Aldi - €0.45
// 2. Naturjoghurt @ Lidl - €0.49
// 3. Gurke @ Aldi - €0.59
// 4. Nudeln @ Aldi - €0.69
// 5. Joghurt @ Rewe - €0.69

searchOffers("", "Hamburg")
// Empty query → Returns 5 cheapest items
```

### 💡 Autocomplete Suggestions

```typescript
getAutocompleteSuggestions("but")
// Returns: ["Butter", "Deutsche Markenbutter"]

getAutocompleteSuggestions("milch")
// Returns: ["Vollmilch", "Vollmilch 3,5%", "Whole Milk"]

getAutocompleteSuggestions("hack")
// Returns: ["Hackfleisch", "Rinderhackfleisch", "Ground Beef"]

getAutocompleteSuggestions("av")
// Returns: ["Avocado"]

getAutocompleteSuggestions("ban")
// Returns: ["Bananen", "Bananas"]

getAutocompleteSuggestions("")
// Returns popular items: ["Butter", "Milk", "Eggs", "Bread", "Chicken", "Avocado", "Bananas", "Pasta"]
```

### 🧪 Combined Features (Complex Queries)

```typescript
// Typo + Bilingual
searchOffers("haehnchen", "Hamburg")
// ✓ "hähnchen" normalized from "haehnchen"
// ✓ Synonym match with "chicken"
// Returns: All chicken offers

// Partial + Umlaut
searchOffers("kae", "Hamburg")
// ✓ "kä" normalized from "kae"
// ✓ Partial match on "Käse"
// Returns: Cheese offers

// Fuzzy + Substring
searchOffers("olven", "Hamburg")
// ✓ Fuzzy matches "oliven" (distance: 1)
// ✓ Substring of "Olivenöl"
// Returns: Olive oil offers
```

## Real-World Use Cases

### Scenario 1: User Types with Typos
```
User types: "tomatoe"
System finds: "Tomaten" (3 offers)
Best price: €2.29 @ Aldi
Savings: €0.70
```

### Scenario 2: Bilingual Household
```
Parent searches: "milk" → 4 offers found
Child searches: "milch" → Same 4 offers found
Both see: Best price €0.99 @ Lidl
```

### Scenario 3: Incomplete Query
```
User types: "ban"
Autocomplete shows: ["Bananen", "Bananas"]
User selects → 3 offers
Best price: €1.39 @ Aldi
```

### Scenario 4: No Matches
```
User types: "quinoa" (not in database)
System suggests: 5 cheapest items
User discovers: Joghurt €0.45 @ Aldi
```

## API Usage

```typescript
import { searchOffers, getAutocompleteSuggestions } from '@/lib/search';

// Search
const result = searchOffers("butter", "Hamburg");
console.log(result.totalOffers);    // 5
console.log(result.bestPrice);      // 1.79
console.log(result.savingsAmount);  // 0.70
console.log(result.offers[0]);      // Cheapest offer

// Autocomplete
const suggestions = getAutocompleteSuggestions("but");
console.log(suggestions);           // ["Butter", "Deutsche Markenbutter"]
```

## Performance Notes

- **Average search time**: < 5ms (75 offers)
- **Worst case**: O(n × m) where n = offers, m = query length
- **Memory**: O(n) for results
- **No external dependencies**: Pure TypeScript
- **Type-safe**: Full TypeScript support

## Next Steps

1. **Test in UI**: Integrate with search component
2. **Add analytics**: Track most searched terms
3. **Expand synonyms**: Add more product translations
4. **Monitor performance**: Profile with larger datasets
5. **User feedback**: A/B test relevance scoring
