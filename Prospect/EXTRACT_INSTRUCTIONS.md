# Prospekt Data Extraction — Instructions for Claude

## How to Use

1. Download the Prospekt PDF from KaufDa
2. Open a new Claude chat (claude.ai)
3. Upload the PDF
4. Copy-paste the prompt below (change the store name and dates)
5. Claude outputs a .sql file
6. Save it in this folder
7. On upload day: run it in Supabase SQL Editor

---

## PROMPT — Copy This Exactly

Replace [STORE_NAME], [STORE_ID], and [DATE_RANGE] before pasting.

### Store IDs:
| Store | ID |
|-------|----|
| Lidl | 1 |
| Aldi Süd | 2 |
| Penny | 3 |
| Kaufland | 4 |
| Netto | 5 |

---

### THE PROMPT:

```
I'm uploading a German supermarket weekly offers Prospekt (leaflet) PDF.

Extract EVERY product with a price from ALL pages.

Output as SQL INSERT statements for PostgreSQL in this EXACT format:

-- First: Delete old offers for this store
DELETE FROM public.offers WHERE store_id = '[STORE_ID]' AND is_offer = true;

-- Then: Insert new offers
INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES
-- Page X: [description]
('[STORE_ID]', 'BrandName', 'Full German Product Name', 'English Translation', 'German Category', 'English Category', 1.99, 2.49, '250g', 'YYYY-MM-DD', 'YYYY-MM-DD', true, 'https://www.[store].de'),
... more rows ...
('[STORE_ID]', 'LastBrand', 'Last Product', 'Last Product EN', 'Category', 'Category EN', 0.99, NULL, '100g', 'YYYY-MM-DD', 'YYYY-MM-DD', true, 'https://www.[store].de');

RULES:
1. Store ID: Use '[STORE_ID]' for ALL rows
2. brand: Exact brand name as shown (e.g., "Kerrygold", "Milka", "Barilla"). For store's own brand, use "Eigenmarke"
3. product_name: FULL German name including brand (e.g., "Kerrygold Original Irische Butter")
4. product_name_en: English translation
5. category / category_en: Use these standard categories:
   - Milchprodukte / Dairy
   - Käse / Cheese
   - Fleisch & Wurst / Meat & Sausage
   - Fisch & Meeresfrüchte / Fish & Seafood
   - Obst & Gemüse / Fruits & Vegetables
   - Brot & Backwaren / Bread & Bakery
   - Tiefkühl / Frozen
   - Getränke / Beverages
   - Alkoholische Getränke / Alcoholic Beverages
   - Kaffee & Tee / Coffee & Tea
   - Süßwaren / Sweets
   - Snacks & Nüsse / Snacks & Nuts
   - Nudeln & Reis / Pasta & Rice
   - Saucen & Gewürze / Sauces & Spices
   - Öle & Essig / Oils & Vinegar
   - Brotaufstrich / Spreads
   - Grundnahrungsmittel / Staples
   - Haushalt / Household
   - Eiscreme / Ice Cream
   - Fertiggerichte / Ready Meals
   - Fleischersatz / Meat Alternatives
   - Tierbedarf / Pet Supplies
   - Frühstück & Cerealien / Breakfast & Cereal
6. price: Current offer price as number (1.79 not 1,79€). Convert German comma to dot.
7. original_price: Old/crossed-out price as number, or NULL if no discount shown
8. unit: Weight/volume as shown (e.g., "250g", "1L", "500ml", "Stück", "kg", "XXL Pack")
9. valid_from / valid_to: Offer validity dates in YYYY-MM-DD format
10. is_offer: true for weekly deals, false for "Dauerhaft im Sortiment" (permanent range)
11. source_url: 'https://www.[store].de'
12. Extract from ALL pages — food, drinks, household, pet supplies, EVERYTHING with a price
13. Skip pages with only non-food items (clothes, electronics, tools) UNLESS they have a clear price
14. The last row must end with ; (semicolon) not , (comma)
15. Use single quotes. Escape apostrophes in names by doubling them: O'Brien → O''Brien
16. Include page comments (-- === PAGE X: description ===) for traceability
17. Start the SQL with DELETE statement to clear old data for this store

Output ONLY the SQL. No explanations, no markdown wrapping.
```

---

## EXAMPLE — For Lidl (next week)

Upload Lidl PDF and paste:

```
[paste the prompt above with these replacements:]
- [STORE_ID] → 1
- [store] → lidl
```

## EXAMPLE — For Netto

Upload Netto PDF and paste:

```
[paste the prompt above with these replacements:]
- [STORE_ID] → 5
- [store] → netto-online
```

---

## After Getting the SQL

1. Save the .sql file in this folder: `C:\petroject\Project_1\Prospect\`
2. Naming: `[store]_offers_YYYY_MM_DD.sql` (e.g., `lidl_offers_2026_03_30.sql`)
3. On the night before the offers go live:
   - Open Supabase SQL Editor
   - Paste the SQL
   - Click Run
   - Verify: offers appear on papierbox.eu

## Weekly Schedule

| Day | Time | What to Do |
|-----|------|-----------|
| Sunday evening | 10 min | Download Mon PDFs (Lidl, Aldi, Penny, Netto) from KaufDa |
| Sunday evening | 10 min | Upload each PDF to Claude → get SQL files |
| Sunday night | 2 min | Run SQL files in Supabase SQL Editor |
| Wednesday evening | 5 min | Download Thu PDFs (Lidl, Kaufland) if new offers |
| Wednesday night | 2 min | Run SQL in Supabase |

## Total Weekly Effort: ~30 minutes for ALL stores, 100% accurate data
