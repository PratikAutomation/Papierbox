# Prospekt Data Extraction Guide

## Workflow (30 min/week)

1. Go to **kaufda.de** → find the store → download the Prospekt PDF
2. Open **claude.ai** → new chat → upload the PDF
3. Paste the prompt for that store (see below)
4. Claude outputs SQL → copy into a `.sql` file in this folder
5. Paste the **verification prompt** → Claude checks its own work → fix any issues
6. Run the SQL in **Supabase Dashboard → SQL Editor**

## Store Reference

| Store | ID | source_url | Offer Days |
|-------|----|------------|------------|
| Lidl | 1 | https://www.lidl.de | Mon + Thu |
| Aldi Süd | 2 | https://www.aldi-sued.de | Mon |
| Penny | 3 | https://www.penny.de | Mon |
| Kaufland | 4 | https://www.kaufland.de | Mon + Thu |
| Netto | 5 | https://www.netto-online.de | Mon |

---

## PROMPT: LIDL (Store ID: 1)

```
I'm uploading a Lidl weekly Prospekt PDF. Extract EVERY product with a price from ALL pages.

OUTPUT FORMAT — SQL INSERT statements:

DELETE FROM public.offers WHERE store_id = '1' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES
-- === PAGE 1: [section name] ===
('1', 'Brand', 'German Name', 'English Name', 'Category DE', 'Category EN', 1.99, 2.49, '250g', 'YYYY-MM-DD', 'YYYY-MM-DD', true, 'https://www.lidl.de'),
('1', 'Brand', 'Last Product', 'English', 'Cat DE', 'Cat EN', 0.99, NULL, '100g', 'YYYY-MM-DD', 'YYYY-MM-DD', true, 'https://www.lidl.de');

PRICE READING — THIS IS CRITICAL:
- German prices use COMMA: 1,79€ → write 1.79 in SQL (dot not comma)
- The BIG prominent number = offer price (the "price" column)
- The small struck-through number = old price (the "original_price" column)
- "UVP" or "statt" = original price
- original_price must ALWAYS be higher than price. If it's not, you read one of them wrong.
- If a price is hard to read, use context: milk is ~0.85-1.50€, butter ~1.50-2.50€, chocolate bars ~0.77-2€, coffee ~5-12€, meat ~3-15€. If your reading doesn't fit, re-examine the image.
- NEVER guess a price. If truly unreadable, add a comment: -- PRICE UNCLEAR: [product] estimated ~X.XX

LIDL EIGENMARKE BRANDS (use these, not "Eigenmarke"):
Milbona (dairy), Deluxe (premium), Bioland/Bio (organic), Alesto (nuts/dried fruit), Solevita (juice), Freeway (soda), Grillmeister (BBQ meat), Meine Metzgerei (deli), Chef Select (ready meals), Nautica (fish), Italiamo (Italian), Cien (cosmetics), W5 (cleaning), Crivit (sports), Silvercrest (electronics)

LIDL-SPECIFIC:
- Two offer periods per week: "Ab Montag" and "Ab Donnerstag" — use correct valid_from dates
- "Lidl Plus Preis" = app-exclusive price — extract as separate row with " (Lidl Plus)" appended to product_name
- "versch. Sorten" = assorted varieties → English: "assorted"

CATEGORIES — use ONLY these exact pairs:
Milchprodukte / Dairy | Butter / Butter | Käse / Cheese
Fleisch & Wurst / Meat & Sausage | Fisch & Meeresfrüchte / Fish & Seafood
Obst & Gemüse / Fruits & Vegetables | Brot & Backwaren / Bread & Bakery
Tiefkühl / Frozen | Getränke / Beverages | Alkoholische Getränke / Alcoholic Beverages
Kaffee & Tee / Coffee & Tea | Süßwaren / Sweets | Snacks & Nüsse / Snacks & Nuts
Nudeln & Reis / Pasta & Rice | Saucen & Gewürze / Sauces & Spices
Öle & Essig / Oils & Vinegar | Brotaufstrich / Spreads
Grundnahrungsmittel / Staples | Haushalt / Household
Eiscreme / Ice Cream | Fertiggerichte / Ready Meals
Fleischersatz / Meat Alternatives | Tierbedarf / Pet Supplies
Frühstück & Cerealien / Breakfast & Cereal

SQL RULES:
- Escape apostrophes: Lay's → Lay''s, O'Brien → O''Brien
- Last row ends with ; (semicolon), all others with , (comma)
- Add page comments: -- === PAGE X: [section] ===
- "Dauerhaft im Sortiment" → is_offer = false
- Skip non-food without prices (clothes, tools, decoration)
- unit: exact as shown (250g, 1L, 500ml, Stück, kg, XXL Pack, versch. Sorten)

BEFORE YOU OUTPUT — self-check:
1. Go through each page one more time. Count visible products vs extracted rows. If you see a product you didn't extract, add it.
2. Scan all prices: does any price look wrong for that product type? Fix it.
3. Verify every original_price > price.
4. Verify last row ends with ; not ,

Output ONLY the SQL. No explanation, no markdown code blocks.
```

---

## PROMPT: ALDI SÜD (Store ID: 2)

```
I'm uploading an Aldi Süd weekly Prospekt PDF. Extract EVERY product with a price from ALL pages.

OUTPUT FORMAT — SQL INSERT statements:

DELETE FROM public.offers WHERE store_id = '2' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES
-- === PAGE 1: [section name] ===
('2', 'Brand', 'German Name', 'English Name', 'Category DE', 'Category EN', 1.99, 2.49, '250g', 'YYYY-MM-DD', 'YYYY-MM-DD', true, 'https://www.aldi-sued.de'),
('2', 'Brand', 'Last Product', 'English', 'Cat DE', 'Cat EN', 0.99, NULL, '100g', 'YYYY-MM-DD', 'YYYY-MM-DD', true, 'https://www.aldi-sued.de');

PRICE READING — THIS IS CRITICAL:
- German prices use COMMA: 1,79€ → write 1.79 in SQL (dot not comma)
- The BIG prominent number = offer price (the "price" column)
- The small struck-through number = old price (the "original_price" column)
- original_price must ALWAYS be higher than price. If not, you read one wrong.
- If a price is hard to read, use context: milk ~0.85-1.50€, butter ~1.50-2.50€, chocolate ~0.77-2€, coffee ~5-12€, meat ~3-15€
- NEVER guess. If unreadable: -- PRICE UNCLEAR: [product] estimated ~X.XX

ALDI EIGENMARKE BRANDS:
Milsani (dairy), Milfina (dairy), Moser Roth (premium chocolate), Choceur (chocolate), Gut Bio (organic), Meine Metzgerei (meat), Golden Seafood (fish), All Seasons (frozen), Grandessa (baking/jam), Tandil (household), Lacura (cosmetics), Mamia (baby), Romeo (Italian), Casa Morando (wine), Cerveza (beer)

ALDI-SPECIFIC:
- Offers typically run full week Mon-Sat
- "ALDI Preis" badge = still extract it (is_offer = true since it's in the Prospekt)
- "ab [date]" = offers starting later in the week — use that date as valid_from

CATEGORIES — use ONLY these exact pairs:
Milchprodukte / Dairy | Butter / Butter | Käse / Cheese
Fleisch & Wurst / Meat & Sausage | Fisch & Meeresfrüchte / Fish & Seafood
Obst & Gemüse / Fruits & Vegetables | Brot & Backwaren / Bread & Bakery
Tiefkühl / Frozen | Getränke / Beverages | Alkoholische Getränke / Alcoholic Beverages
Kaffee & Tee / Coffee & Tea | Süßwaren / Sweets | Snacks & Nüsse / Snacks & Nuts
Nudeln & Reis / Pasta & Rice | Saucen & Gewürze / Sauces & Spices
Öle & Essig / Oils & Vinegar | Brotaufstrich / Spreads
Grundnahrungsmittel / Staples | Haushalt / Household
Eiscreme / Ice Cream | Fertiggerichte / Ready Meals
Fleischersatz / Meat Alternatives | Tierbedarf / Pet Supplies
Frühstück & Cerealien / Breakfast & Cereal

SQL RULES:
- Escape apostrophes: Lay's → Lay''s
- Last row ends with ; all others with ,
- Page comments: -- === PAGE X: [section] ===
- Skip non-food without prices

BEFORE YOU OUTPUT — self-check:
1. Go through each page again. Count visible products vs extracted. Add any missing.
2. Scan all prices for sanity. Fix anything that looks wrong.
3. Verify every original_price > price.
4. Verify last row ends with ;

Output ONLY the SQL.
```

---

## PROMPT: PENNY (Store ID: 3)

```
I'm uploading a Penny weekly Prospekt PDF. Extract EVERY product with a price from ALL pages.

OUTPUT FORMAT — SQL INSERT statements:

DELETE FROM public.offers WHERE store_id = '3' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES
-- === PAGE 1: [section name] ===
('3', 'Brand', 'German Name', 'English Name', 'Category DE', 'Category EN', 1.99, 2.49, '250g', 'YYYY-MM-DD', 'YYYY-MM-DD', true, 'https://www.penny.de'),
('3', 'Brand', 'Last Product', 'English', 'Cat DE', 'Cat EN', 0.99, NULL, '100g', 'YYYY-MM-DD', 'YYYY-MM-DD', true, 'https://www.penny.de');

PRICE READING — THIS IS CRITICAL:
- German prices use COMMA: 1,79€ → write 1.79 in SQL (dot not comma)
- The BIG prominent number = offer price
- The small struck-through number = old price (original_price)
- original_price must ALWAYS be higher than price.
- Context check: milk ~0.85-1.50€, butter ~1.50-2.50€, chocolate ~0.77-2€, coffee ~5-12€, meat ~3-15€
- NEVER guess. If unreadable: -- PRICE UNCLEAR: [product] estimated ~X.XX

PENNY EIGENMARKE BRANDS:
Naturgut (organic/bio), Best Moments (premium), Mühlenhof (meat), San Fabio (Italian), Bäckerkrönung (baking), Maître Philippe (wine), Penny (store brand)

PENNY-SPECIFIC:
- "mit Penny App" / "Penny Kartenvorteil" = app price — extract as separate row with " (Penny App)" in product_name
- "Dauerhaft Günstiger" section = permanent price reductions → is_offer = false
- "Framstag" = Friday+Saturday deals — use those dates as valid_from/valid_to
- Penny pages are often DENSE with 8-10 small product tiles. Be thorough — re-examine each page after your first pass.

CATEGORIES — use ONLY these exact pairs:
Milchprodukte / Dairy | Butter / Butter | Käse / Cheese
Fleisch & Wurst / Meat & Sausage | Fisch & Meeresfrüchte / Fish & Seafood
Obst & Gemüse / Fruits & Vegetables | Brot & Backwaren / Bread & Bakery
Tiefkühl / Frozen | Getränke / Beverages | Alkoholische Getränke / Alcoholic Beverages
Kaffee & Tee / Coffee & Tea | Süßwaren / Sweets | Snacks & Nüsse / Snacks & Nuts
Nudeln & Reis / Pasta & Rice | Saucen & Gewürze / Sauces & Spices
Öle & Essig / Oils & Vinegar | Brotaufstrich / Spreads
Grundnahrungsmittel / Staples | Haushalt / Household
Eiscreme / Ice Cream | Fertiggerichte / Ready Meals
Fleischersatz / Meat Alternatives | Tierbedarf / Pet Supplies
Frühstück & Cerealien / Breakfast & Cereal

SQL RULES:
- Escape apostrophes: Lay's → Lay''s
- Last row ends with ; all others with ,
- Page comments: -- === PAGE X: [section] ===
- Skip non-food without prices

BEFORE YOU OUTPUT — self-check:
1. Go through each page again. Penny pages are dense — count visible products vs extracted. Add any missing.
2. Scan all prices for sanity.
3. Verify every original_price > price.
4. Verify last row ends with ;

Output ONLY the SQL.
```

---

## PROMPT: KAUFLAND (Store ID: 4)

```
I'm uploading a Kaufland weekly Prospekt PDF. Extract EVERY product with a price from ALL pages.

IMPORTANT: Kaufland Prospekte are the LARGEST — often 30+ pages with 200+ products. Do NOT stop early. Extract from EVERY page until the end.

OUTPUT FORMAT — SQL INSERT statements:

DELETE FROM public.offers WHERE store_id = '4' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES
-- === PAGE 1: [section name] ===
('4', 'Brand', 'German Name', 'English Name', 'Category DE', 'Category EN', 1.99, 2.49, '250g', 'YYYY-MM-DD', 'YYYY-MM-DD', true, 'https://www.kaufland.de'),
('4', 'Brand', 'Last Product', 'English', 'Cat DE', 'Cat EN', 0.99, NULL, '100g', 'YYYY-MM-DD', 'YYYY-MM-DD', true, 'https://www.kaufland.de');

PRICE READING — THIS IS CRITICAL:
- German prices use COMMA: 1,79€ → write 1.79 in SQL (dot not comma)
- The BIG prominent number = offer price
- The small struck-through number = old price (original_price)
- original_price must ALWAYS be higher than price.
- "je" before a price = "each" — use that as the item price
- "ab" before a price = "starting from" — use that price
- Context check: milk ~0.85-1.50€, butter ~1.50-2.50€, chocolate ~0.77-2€, coffee ~5-12€, meat ~3-15€
- NEVER guess. If unreadable: -- PRICE UNCLEAR: [product] estimated ~X.XX

KAUFLAND EIGENMARKE BRANDS (all start with "K-"):
K-Classic (budget), K-Bio (organic), K-Favourites (premium), K-take away (convenience), K-Purland (meat), K-Free (free-from), K-Jardin (garden)

KAUFLAND-SPECIFIC:
- Two offer periods: "Ab Montag" and "Ab Donnerstag" — use correct valid_from
- Kaufland pages are very DENSE — often 10-15 products per page. After your first pass through a page, look again for products you may have missed in corners or margins.
- "Exklusiv" badge = Kaufland exclusive
- Kaufland shows kg-Preis in small text — use the ITEM price, not per-kg price

CATEGORIES — use ONLY these exact pairs:
Milchprodukte / Dairy | Butter / Butter | Käse / Cheese
Fleisch & Wurst / Meat & Sausage | Fisch & Meeresfrüchte / Fish & Seafood
Obst & Gemüse / Fruits & Vegetables | Brot & Backwaren / Bread & Bakery
Tiefkühl / Frozen | Getränke / Beverages | Alkoholische Getränke / Alcoholic Beverages
Kaffee & Tee / Coffee & Tea | Süßwaren / Sweets | Snacks & Nüsse / Snacks & Nuts
Nudeln & Reis / Pasta & Rice | Saucen & Gewürze / Sauces & Spices
Öle & Essig / Oils & Vinegar | Brotaufstrich / Spreads
Grundnahrungsmittel / Staples | Haushalt / Household
Eiscreme / Ice Cream | Fertiggerichte / Ready Meals
Fleischersatz / Meat Alternatives | Tierbedarf / Pet Supplies
Frühstück & Cerealien / Breakfast & Cereal

SQL RULES:
- Escape apostrophes: Lay's → Lay''s
- Last row ends with ; all others with ,
- Page comments: -- === PAGE X: [section] ===
- Skip non-food without prices

BEFORE YOU OUTPUT — self-check:
1. You should have 200+ products for Kaufland. If you have less than 150, you missed pages.
2. Go through each page again — Kaufland pages are dense. Add any missing products.
3. Scan all prices for sanity.
4. Verify every original_price > price.
5. Verify last row ends with ;

Output ONLY the SQL.
```

---

## PROMPT: NETTO (Store ID: 5)

```
I'm uploading a Netto Marken-Discount weekly Prospekt PDF. Extract EVERY product with a price from ALL pages.

Note: This is Netto Marken-Discount (yellow logo with the dog) — NOT Netto without dog.

OUTPUT FORMAT — SQL INSERT statements:

DELETE FROM public.offers WHERE store_id = '5' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES
-- === PAGE 1: [section name] ===
('5', 'Brand', 'German Name', 'English Name', 'Category DE', 'Category EN', 1.99, 2.49, '250g', 'YYYY-MM-DD', 'YYYY-MM-DD', true, 'https://www.netto-online.de'),
('5', 'Brand', 'Last Product', 'English', 'Cat DE', 'Cat EN', 0.99, NULL, '100g', 'YYYY-MM-DD', 'YYYY-MM-DD', true, 'https://www.netto-online.de');

PRICE READING — THIS IS CRITICAL:
- German prices use COMMA: 1,79€ → write 1.79 in SQL (dot not comma)
- The BIG prominent number = offer price
- The small struck-through number = old price (original_price)
- original_price must ALWAYS be higher than price.
- "kg-Preis" in small text = price per kg — ignore it, use the ITEM price instead
- Context check: milk ~0.85-1.50€, butter ~1.50-2.50€, chocolate ~0.77-2€, coffee ~5-12€, meat ~3-15€
- NEVER guess. If unreadable: -- PRICE UNCLEAR: [product] estimated ~X.XX

NETTO-SPECIFIC:
- "Netto App" prices — extract as separate row with " (Netto App)" in product_name
- "Marken-Qualität zum Netto-Preis" = branded product at discount price

CATEGORIES — use ONLY these exact pairs:
Milchprodukte / Dairy | Butter / Butter | Käse / Cheese
Fleisch & Wurst / Meat & Sausage | Fisch & Meeresfrüchte / Fish & Seafood
Obst & Gemüse / Fruits & Vegetables | Brot & Backwaren / Bread & Bakery
Tiefkühl / Frozen | Getränke / Beverages | Alkoholische Getränke / Alcoholic Beverages
Kaffee & Tee / Coffee & Tea | Süßwaren / Sweets | Snacks & Nüsse / Snacks & Nuts
Nudeln & Reis / Pasta & Rice | Saucen & Gewürze / Sauces & Spices
Öle & Essig / Oils & Vinegar | Brotaufstrich / Spreads
Grundnahrungsmittel / Staples | Haushalt / Household
Eiscreme / Ice Cream | Fertiggerichte / Ready Meals
Fleischersatz / Meat Alternatives | Tierbedarf / Pet Supplies
Frühstück & Cerealien / Breakfast & Cereal

SQL RULES:
- Escape apostrophes: Lay's → Lay''s
- Last row ends with ; all others with ,
- Page comments: -- === PAGE X: [section] ===
- Skip non-food without prices

BEFORE YOU OUTPUT — self-check:
1. Go through each page again. Count visible products vs extracted. Add any missing.
2. Scan all prices for sanity.
3. Verify every original_price > price.
4. Verify last row ends with ;

Output ONLY the SQL.
```

---

## VERIFICATION PROMPT (paste after getting SQL)

```
Review the SQL you just generated against the PDF pages. Check these things:

1. PAGE COVERAGE: Go through every PDF page. For each page, confirm you extracted products from it. List any pages you skipped or missed.

2. PRODUCT COUNT: Count your total extracted products. Expected minimums:
   - Lidl: 150+  |  Aldi: 100+  |  Penny: 150+  |  Kaufland: 200+  |  Netto: 100+
   If you're below the minimum, go back and find what you missed.

3. PRICE SANITY: Flag any product where:
   - Dairy/yogurt price is outside €0.29-4.00
   - Butter price is outside €0.99-3.50
   - Fresh meat price is outside €1.99-20.00
   - Coffee price is outside €3.00-15.00
   - Chocolate/sweets price is outside €0.49-5.00
   - Drinks price is outside €0.39-5.00

4. ORIGINAL PRICE: List any row where original_price <= price (this is always wrong).

5. DUPLICATES: Any product appearing twice with same price?

6. DATES: Do valid_from and valid_to match the Prospekt header?

If you find issues, output the corrected SQL. If all good, say "VERIFIED: [X] products, no issues."
```

---

## File Naming

Save as: `[store]_offers_YYYY_MM_DD.sql`

Examples:
- `lidl_offers_2026_04_07.sql`
- `aldi_offers_2026_04_07.sql`
- `penny_offers_2026_04_07.sql`
- `kaufland_offers_2026_04_07.sql`
- `netto_offers_2026_04_07.sql`

## Weekly Schedule

| Day | Task | Time |
|-----|------|------|
| Sunday evening | Download Mon PDFs from KaufDa (Lidl, Aldi, Penny, Netto) | 5 min |
| Sunday evening | Upload each PDF to Claude + paste store prompt | 15 min |
| Sunday evening | Run verification prompt for each | 5 min |
| Sunday night | Run all SQL in Supabase SQL Editor | 5 min |
| Wednesday evening | Download Thu PDFs (Lidl, Kaufland) | 2 min |
| Wednesday evening | Upload + extract + verify | 10 min |
| Wednesday night | Run SQL in Supabase | 2 min |

**Total: ~45 min/week for 1,000+ accurate products across 5 stores**
