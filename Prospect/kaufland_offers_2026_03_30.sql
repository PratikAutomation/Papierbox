-- Kaufland Prospekt: Two weeks combined
-- Week 1: Mo 30.03 - Mi 01.04.2026 (some items until Sa 04.04)
-- Week 2: Do 02.04 - Mi 08.04.2026
-- store_id = '4'

DELETE FROM public.offers WHERE store_id = '4' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2: Cover - Ab Mo. 30.3. bis Mi. 01.4. ===
('4', 'Eigenmarke', 'Span. Eisbergsalat im Netz', 'Spanish Iceberg Lettuce in Net', 'Obst & Gemüse', 'Fruits & Vegetables', 0.88, 1.29, 'Stück', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Norwegischer Räucherlachs', 'K-Classic Norwegian Smoked Salmon', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.49, NULL, '200g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Bree', 'Bree Wein oder Free Alkoholfrei versch. Sorten', 'Bree Wine or Free Non-alcoholic assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.88, 5.49, '0.75L', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Merci', 'Merci Vielfalt Schokoladen-Spezialitäten versch. Sorten', 'Merci Variety Chocolate Specialties assorted', 'Süßwaren', 'Sweets', 2.77, NULL, '200g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Mövenpick', 'Mövenpick Frucht-Joghurt versch. Sorten', 'Mövenpick Fruit Yogurt assorted', 'Milchprodukte', 'Dairy', 0.49, 0.99, '150g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Géramont', 'Géramont Franz. Weichkäse versch. Sorten', 'Géramont French Soft Cheese assorted', 'Käse', 'Cheese', 1.99, 3.49, '150g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),

-- === PAGE 3: Obst & Gemüse ab Mo. 30.3. ===
('4', 'Eigenmarke', 'Brasil. Mini-Wassermelone lose', 'Brazilian Mini Watermelon loose', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, 3.99, 'Stück', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Südafrik. Nektarinen', 'South African Nectarines', 'Obst & Gemüse', 'Fruits & Vegetables', 3.99, 5.99, 'kg', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Span. Mandarinen Nadorcott', 'Spanish Mandarins Nadorcott', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 3.49, '1kg', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Ital./Franz. Spargelspitzen grün', 'Italian/French Green Asparagus Tips', 'Obst & Gemüse', 'Fruits & Vegetables', 3.99, 4.99, '500g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Ital. Blumenkohl', 'Italian Cauliflower', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.79, 'Stück', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Span./niederl. Paprika-Mix', 'Spanish/Dutch Pepper Mix', 'Obst & Gemüse', 'Fruits & Vegetables', 3.49, NULL, '1kg', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Laugenstange', 'Pretzel Stick', 'Brot & Backwaren', 'Bread & Bakery', 0.39, 0.59, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Dt. poln. Ente Haltungsform 3', 'German/Polish Duck', 'Fleisch & Wurst', 'Meat & Sausage', 4.49, NULL, 'ca. 2.5kg', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),

-- === PAGE 4: Fleisch & Käse ab Mo. 30.3. (bis Sa. 04.4.) ===
('4', 'Eigenmarke', 'Viktoria Barschfilet geräuchert', 'Victoria Perch Fillet smoked', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, 2.59, '160g', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Nothwang', 'Nothwang Delikatess Schinkenspeck geräuchert', 'Nothwang Delicatessen Smoked Ham Bacon', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, NULL, '100g', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Landana', 'Landana Gouda pikant', 'Landana Gouda spicy', 'Käse', 'Cheese', 0.89, 1.89, '100g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Schlagsahne 200g Becher', 'K-Classic Whipping Cream 200g Cup', 'Milchprodukte', 'Dairy', 0.77, 0.89, '200g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'XTRA Butter 250g', 'XTRA Butter 250g', 'Milchprodukte', 'Dairy', 0.69, NULL, '250g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Bürger', 'Bürger Maultaschen versch. Sorten', 'Bürger Ravioli assorted', 'Fertiggerichte', 'Ready Meals', 1.69, 2.29, '360g', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Rougette', 'Rougette Grill- oder Ofenkäse versch. Sorten', 'Rougette Grill or Oven Cheese assorted', 'Käse', 'Cheese', 2.69, 3.79, '2x160g', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),

-- === PAGE 5: Süßwaren & Lebensmittel ab Mo. 30.3. ===
('4', 'Milka', 'Milka Pralinés oder Mouchettes Herzen versch. Sorten', 'Milka Pralines or Mouchettes Hearts assorted', 'Süßwaren', 'Sweets', 1.79, 3.49, '110g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Barilla', 'Barilla Pasta Sauce versch. Sorten', 'Barilla Pasta Sauce assorted', 'Saucen & Gewürze', 'Sauces & Spices', 1.99, NULL, '400g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Barilla', 'Barilla Pasta Sauce XTRA Preis', 'Barilla Pasta Sauce XTRA Price', 'Saucen & Gewürze', 'Sauces & Spices', 1.69, NULL, '400g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Bärenmarke', 'Bärenmarke Genussvolle Kaffee-Milch Kännchen', 'Bärenmarke Premium Coffee Milk Jug', 'Milchprodukte', 'Dairy', 0.99, 1.45, '6 Stück', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Nescafé', 'Nescafé Gold versch. Sorten', 'Nescafé Gold assorted', 'Kaffee & Tee', 'Coffee & Tea', 2.69, 4.49, '125-144g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Instant-Teegetränk versch. Sorten', 'K-Classic Instant Tea Drink assorted', 'Kaffee & Tee', 'Coffee & Tea', 1.39, NULL, '400g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Salatdressing versch. Sorten', 'K-Classic Salad Dressing assorted', 'Saucen & Gewürze', 'Sauces & Spices', 1.29, NULL, '500ml', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Champignons Wahl- oder Scheiben', 'K-Classic Mushrooms Whole or Sliced', 'Grundnahrungsmittel', 'Staples', 0.79, 0.99, '400g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Bonduelle', 'Bonduelle Goldmais oder Hülsen-Mix', 'Bonduelle Sweet Corn or Legume Mix', 'Grundnahrungsmittel', 'Staples', 1.29, 1.79, '400g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),

-- === PAGE 6: Ostern & Snacks ab Mo. 30.3. (bis Sa. 04.4.) ===
('4', 'Eigenmarke', 'Blühende Osterarrangements versch. Sorten', 'Blooming Easter Arrangements assorted', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Maggi', 'Maggi Ravioli versch. Sorten', 'Maggi Ravioli assorted', 'Fertiggerichte', 'Ready Meals', 1.99, NULL, '800g', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Maggi', 'Maggi Ravioli XTRA Preis', 'Maggi Ravioli XTRA Price', 'Fertiggerichte', 'Ready Meals', 1.79, NULL, '800g', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Pom-Bär', 'Pom-Bär Kartoffelsnacks', 'Pom-Bär Potato Snacks', 'Snacks & Nüsse', 'Snacks & Nuts', 0.88, 1.79, '75g', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Nimm 2', 'Nimm 2 Frucht-Bonbons Soft oder Lollies versch. Sorten', 'Nimm 2 Fruit Candies Soft or Lollies assorted', 'Süßwaren', 'Sweets', 1.69, NULL, '300-429g', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Nippon', 'Nippon Puffreis in Schokolade', 'Nippon Puffed Rice in Chocolate', 'Süßwaren', 'Sweets', 1.79, 2.69, '200g', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Nestlé', 'Nestlé KitKat Lion oder Smarties versch. Sorten', 'Nestlé KitKat Lion or Smarties assorted', 'Süßwaren', 'Sweets', 2.49, 4.79, 'Beutel', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Backofensnack Mozzarella Sticks', 'K-Classic Oven Snack Mozzarella Sticks', 'Tiefkühl', 'Frozen', 1.69, 2.19, '250g', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Kaliforn. Pistazien', 'K-Classic Californian Pistachios', 'Snacks & Nüsse', 'Snacks & Nuts', 2.69, 3.49, '200g', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Salatmayonnaise', 'K-Classic Salad Mayonnaise', 'Saucen & Gewürze', 'Sauces & Spices', 0.55, 0.69, '500ml', '2026-03-30', '2026-04-04', true, 'https://www.kaufland.de'),

-- === PAGE 7: Haushalt & Spirituosen ab Mo. 30.3. ===
('4', 'Lenor', 'Lenor Unstoppables Wäscheparfüm', 'Lenor Unstoppables Laundry Scent', 'Haushalt', 'Household', 7.99, 11.99, '455g', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Mönchshof', 'Mönchshof Edelherz oder Naturradler', 'Mönchshof Noble or Natural Radler', 'Alkoholische Getränke', 'Alcoholic Beverages', 13.99, 17.99, '20x0.5L', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Carefree', 'Carefree Slipeinlagen versch. Sorten', 'Carefree Panty Liners assorted', 'Haushalt', 'Household', 2.22, 2.95, 'Packung', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Tena', 'Tena Discreet versch. Sorten', 'Tena Discreet assorted', 'Haushalt', 'Household', 2.99, 3.75, 'Packung', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Rexona', 'Rexona Deo-Spray oder Roll-On versch. Sorten', 'Rexona Deodorant Spray or Roll-On assorted', 'Haushalt', 'Household', 2.22, NULL, '150ml', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Pril', 'Pril Geschirrspülmittel versch. Sorten', 'Pril Dish Soap assorted', 'Haushalt', 'Household', 1.39, 1.75, '450ml', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Der General', 'Der General Allzweckreiniger versch. Sorten', 'Der General All-purpose Cleaner assorted', 'Haushalt', 'Household', 1.59, 1.95, '750ml', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Lenor', 'Lenor Vollwaschmittel Pulver', 'Lenor Laundry Detergent Powder', 'Haushalt', 'Household', 4.49, NULL, '2.6kg', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),

-- === PAGE 8: Spirituosen ab Mo. 30.3. ===
('4', 'Smirnoff', 'Smirnoff Vodka No. 21', 'Smirnoff Vodka No. 21', 'Alkoholische Getränke', 'Alcoholic Beverages', 8.99, 12.99, '0.7L', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Tullamore Dew', 'Tullamore Dew Irish Whiskey', 'Tullamore Dew Irish Whiskey', 'Alkoholische Getränke', 'Alcoholic Beverages', 12.99, 18.99, '0.7L', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'YO', 'YO Sirup versch. Sorten', 'YO Syrup assorted', 'Getränke', 'Beverages', 3.49, 3.79, '0.7L', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'MM Extra', 'MM Extra Sekt versch. Sorten', 'MM Extra Sparkling Wine assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.99, 4.69, '0.75L', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Campari', 'Campari Bitter', 'Campari Bitter', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, 15.99, '0.7L', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Ultra-Klumpstreu Katzenstreu', 'K-Classic Ultra Clumping Cat Litter', 'Tierbedarf', 'Pet Supplies', 2.99, NULL, '6L', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Kober''s', 'Kober''s Likör versch. Sorten', 'Kober''s Liqueur assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 7.99, 12.49, '0.5L', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),
('4', 'Oettinger', 'Original Oettinger Weißbier versch. Sorten', 'Original Oettinger Wheat Beer assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 7.99, NULL, '20x0.5L', '2026-03-30', '2026-04-01', true, 'https://www.kaufland.de'),

-- === PAGE 16: Cover Do. 02.4. - Mi. 08.4. ===
('4', 'K-Purland', 'K-Purland Hähnchen-Brustfilet-Teilstücke', 'K-Purland Chicken Breast Fillet Pieces', 'Fleisch & Wurst', 'Meat & Sausage', 7.99, NULL, 'kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Südafrik. Tafeltrauben rot', 'South African Red Table Grapes', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, 2.49, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Span./ital. Spargel grün', 'Spanish/Italian Green Asparagus', 'Obst & Gemüse', 'Fruits & Vegetables', 3.33, 4.99, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Coca-Cola', 'Coca-Cola/Fanta/Sprite/Mezzo Mix versch. Sorten', 'Coca-Cola/Fanta/Sprite/Mezzo Mix assorted', 'Getränke', 'Beverages', 0.79, 1.59, '1.25L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Coppenrath & Wiese', 'Coppenrath & Wiese Feinste Sahne versch. Sorten', 'Coppenrath & Wiese Finest Cream assorted', 'Tiefkühl', 'Frozen', 7.99, 16.99, 'Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Iglo', 'Iglo Fischstäbchen versch. Sorten', 'Iglo Fish Fingers assorted', 'Tiefkühl', 'Frozen', 2.22, 4.49, '360-680g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Toffifee', 'Toffifee Haselnuss in Caramel versch. Sorten', 'Toffifee Hazelnut in Caramel assorted', 'Süßwaren', 'Sweets', 0.99, 1.49, '125g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Maggi', 'Maggi Fix Airfryer Würzpaste versch. Sorten', 'Maggi Fix Airfryer Spice Paste assorted', 'Saucen & Gewürze', 'Sauces & Spices', 0.39, 1.09, '25-50g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Melitta', 'Melitta Kaffee Auslese versch. Sorten', 'Melitta Coffee Auslese assorted', 'Kaffee & Tee', 'Coffee & Tea', 4.99, NULL, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Melitta', 'Melitta Kaffee XTRA Preis', 'Melitta Coffee XTRA Price', 'Kaffee & Tee', 'Coffee & Tea', 5.29, NULL, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 17: Obst & Gemüse ab Do. 02.4. ===
('4', 'Eigenmarke', 'Ungar./Altmark. Bärlauch', 'Hungarian/Altmark Wild Garlic', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.49, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Dtsch. Multicolor-Salat oder Kopf-Salat', 'German Multicolor or Head Lettuce', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, 1.69, 'Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Dtsch. Speisekartoffeln versch. Kochtypen', 'German Potatoes assorted cooking types', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.99, '2.5kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 18: Obst & Gemüse ab Do. 02.4. ===
('4', 'Bioland', 'Bioland Dtsch. Shiitake-Pilze/Kräuterseitlinge/Champignons braun', 'Bioland German Shiitake/King Oyster/Brown Mushrooms', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, NULL, '150-250g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Dtsch./poln. Petersilienwurzeln oder Pastinaken', 'German/Polish Parsley Roots or Parsnips', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, 1.99, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Span./dtsch. Minigurken', 'Spanish/German Mini Cucumbers', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 3.49, '250g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Dtsch./span. Kräuter XXL', 'German/Spanish Herbs XXL', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, 1.99, '50-200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Niederl. Rote Bete lose', 'Dutch Beetroot loose', 'Obst & Gemüse', 'Fruits & Vegetables', 0.99, 1.49, 'kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 19: Obst ab Do. 02.4. ===
('4', 'SanLucar', 'Soneg. Melone Futuro oder Riesenpapayas lose Gold Edition', 'Senegalese Futuro Melon or Giant Papaya loose Gold Edition', 'Obst & Gemüse', 'Fruits & Vegetables', 4.99, 5.99, 'Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Costa-rican. Ananas', 'Costa Rican Pineapple', 'Obst & Gemüse', 'Fruits & Vegetables', 3.33, 3.99, 'Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Kolumb. Physalis', 'Colombian Physalis', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, 1.79, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Ecuad. domest. Bio-Bananen', 'Ecuadorian domestic Organic Bananas', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, 1.99, 'kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Span. Saftorangen/Blondorangen oder Blutorangen', 'Spanish Juice/Blonde or Blood Oranges', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 2.99, '1.5kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Span. Bio-Zitronen', 'Spanish Organic Lemons', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, 1.79, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 21: Käse & Fleisch ab Do. 02.4. ===
('4', 'Kerrygold', 'Kerrygold Orig. irisch. Traditionsrahm oder Cheddar versch. Sorten', 'Kerrygold Original Irish Traditional Cream or Cheddar assorted', 'Käse', 'Cheese', 1.79, 2.99, '120-150g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Sonnen Bassermann', 'Sonnen Bassermann Eintopf versch. Sorten', 'Sonnen Bassermann Stew assorted', 'Fertiggerichte', 'Ready Meals', 1.99, 2.99, '800g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Bresso', 'Bresso Frischkäse oder Frischkäse-Zubereitung versch. Sorten', 'Bresso Cream Cheese assorted', 'Käse', 'Cheese', 1.11, 2.39, '120-150g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Norweg. Räucherlachs in Scheiben', 'K-Classic Norwegian Smoked Salmon Sliced', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.49, NULL, '200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Kinder', 'Kinder Pingui versch. Sorten', 'Kinder Pingui assorted', 'Süßwaren', 'Sweets', 1.99, 2.49, '8 Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Ben''s Original', 'Ben''s Original Express-Reis Basmati-Reis', 'Ben''s Original Express Rice Basmati', 'Nudeln & Reis', 'Pasta & Rice', 1.49, 2.29, '220g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Oswald', 'Oswald Schofolade versch. Sorten', 'Oswald Chocolate assorted', 'Süßwaren', 'Sweets', 2.99, NULL, '125g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 22: Desserts & Eis ab Do. 02.4. ===
('4', 'Friends of Asia', 'Friends of Asia Frozen Dessert Mochi versch. Sorten', 'Friends of Asia Frozen Dessert Mochi assorted', 'Eiscreme', 'Ice Cream', 1.99, 2.99, '156g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Nescafé', 'Nescafé Gold Instantkaffee versch. Sorten', 'Nescafé Gold Instant Coffee assorted', 'Kaffee & Tee', 'Coffee & Tea', 5.99, 11.99, '200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Langnese', 'Langnese Cremissimo Premium-Eis versch. Sorten', 'Langnese Cremissimo Premium Ice Cream assorted', 'Eiscreme', 'Ice Cream', 1.49, 3.99, '500-900ml', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Frosta', 'Frosta Fertiggerichte versch. Sorten', 'Frosta Ready Meals assorted', 'Tiefkühl', 'Frozen', 1.99, 3.49, '375-500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Bratwurst einer anderen Sorte', 'K-Classic Bratwurst assorted', 'Fleisch & Wurst', 'Meat & Sausage', 2.69, 3.49, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Pick', 'Pick Orig. ung. Wintersalami', 'Pick Original Hungarian Winter Salami', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 5.99, '200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Ben''s Original', 'Ben''s Original Fertig-Reis versch. Sorten', 'Ben''s Original Ready Rice assorted', 'Nudeln & Reis', 'Pasta & Rice', 1.49, 2.79, '220g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Heinz', 'Heinz Tomato Ketchup', 'Heinz Tomato Ketchup', 'Saucen & Gewürze', 'Sauces & Spices', 2.99, 4.69, '800ml', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 23: Süßwaren ab Do. 02.4. ===
('4', 'M&M''s', 'M&M''s Schokolinsen versch. Sorten', 'M&M''s Chocolate Buttons assorted', 'Süßwaren', 'Sweets', 1.79, 2.89, '150-180g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Storck', 'Storck Merci Fälschen versch. Sorten', 'Storck Merci Small assorted', 'Süßwaren', 'Sweets', 1.29, NULL, '112g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Milka', 'Milka Schokolade MMMAX versch. Sorten', 'Milka Chocolate MMMAX assorted', 'Süßwaren', 'Sweets', 2.59, 4.99, '270-300g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Nimm 2', 'Nimm 2 Lachgummi versch. Sorten', 'Nimm 2 Laughing Gummies assorted', 'Süßwaren', 'Sweets', 0.99, NULL, '250-356g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Ültje', 'Ültje Erdnüsse versch. Sorten', 'Ültje Peanuts assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, NULL, '180-200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Purina', 'Purina Gourmet Gold Katzenfutter versch. Sorten', 'Purina Gourmet Gold Cat Food assorted', 'Tierbedarf', 'Pet Supplies', 0.49, NULL, '85g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Lenor', 'Lenor Weichspüler 71 Waschladungen', 'Lenor Fabric Softener 71 Washes', 'Haushalt', 'Household', 3.99, NULL, '1.42L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Hakle', 'Hakle Toilettenpapier', 'Hakle Toilet Paper', 'Haushalt', 'Household', 2.79, 3.99, '8 Rollen', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 24: XTRA Coupon ab Do. 02.4. ===
('4', 'Balisto', 'Balisto oder Twix Schokoriegel versch. Sorten', 'Balisto or Twix Chocolate Bars assorted', 'Süßwaren', 'Sweets', 1.99, 2.99, '150-200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Söhnlein', 'Söhnlein Brillant Sekt trocken versch. Sorten', 'Söhnlein Brillant Sparkling Wine dry assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.59, 4.29, '0.75L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Monster', 'Monster Energy Drink versch. Sorten', 'Monster Energy Drink assorted', 'Getränke', 'Beverages', 0.77, 1.49, '0.5L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Franziskaner', 'Franziskaner Premium Weissbier', 'Franziskaner Premium Wheat Beer', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.49, NULL, '20x0.5L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Bitburger', 'Bitburger Premium Pils', 'Bitburger Premium Pilsner', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, NULL, '20x0.5L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Fuze Tea', 'Fuze Tea Erfrischungsgetränk versch. Sorten', 'Fuze Tea Soft Drink assorted', 'Getränke', 'Beverages', 1.29, 1.69, '1.25L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Budweiser', 'Budweiser Budvar Lagerbier', 'Budweiser Budvar Lager', 'Alkoholische Getränke', 'Alcoholic Beverages', 12.99, NULL, '20x0.5L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Jameson', 'Jameson Irish Whiskey', 'Jameson Irish Whiskey', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.99, NULL, '0.7L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Warsteiner', 'Warsteiner Radler 0,0% alkoholfrei', 'Warsteiner Radler 0.0% non-alcoholic', 'Getränke', 'Beverages', 3.99, NULL, '6x0.33L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 25: Oster-Knüller Nur am Sa. 04.4. ===
('4', 'Bergader', 'Bergader Bergbauern Käse Schnittkäse versch. Sorten', 'Bergader Mountain Farmer Cheese assorted', 'Käse', 'Cheese', 1.49, 2.69, '120-195g', '2026-04-04', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Ben & Jerry''s', 'Ben & Jerry''s Eis versch. Sorten', 'Ben & Jerry''s Ice Cream assorted', 'Eiscreme', 'Ice Cream', 3.49, NULL, '427-458ml', '2026-04-04', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Nutella', 'Nutella Nuss-Nugat-Creme', 'Nutella Hazelnut Chocolate Spread', 'Brotaufstrich', 'Spreads', 2.99, 5.29, '750g', '2026-04-04', '2026-04-04', true, 'https://www.kaufland.de'),

-- === PAGE 26: Fleisch & Gemüse (Highlights bis Sa. 04.4.) ===
('4', 'Eigenmarke', 'Franz./ital. Feldsalat', 'French/Italian Lamb''s Lettuce', 'Obst & Gemüse', 'Fruits & Vegetables', 0.88, 1.79, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Span./niederl. Gurke lose', 'Spanish/Dutch Cucumber loose', 'Obst & Gemüse', 'Fruits & Vegetables', 0.39, 0.49, 'Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Ital. Tafeläpfel Pink Lady', 'Italian Pink Lady Table Apples', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.99, '900g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Marokk. Spitzpaprika', 'Moroccan Pointed Peppers', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, 2.49, '300g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Span./ital. Brokkoli', 'Spanish/Italian Broccoli', 'Obst & Gemüse', 'Fruits & Vegetables', 0.79, 1.29, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Schweinenacken/-kotelett XXL', 'K-Purland Pork Neck/Chops XXL', 'Fleisch & Wurst', 'Meat & Sausage', 5.49, 8.49, 'kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Gourmetbraten', 'K-Purland Gourmet Roast', 'Fleisch & Wurst', 'Meat & Sausage', 8.39, NULL, 'kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Kasseler Lachs', 'K-Purland Smoked Pork Loin', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, NULL, 'kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 27: Mehr Oster-Knüller Nur am Sa. 04.4. ===
('4', 'Verpoorten', 'Verpoorten Eierlikör', 'Verpoorten Egg Liqueur', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, NULL, '0.7L', '2026-04-04', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Paulaner', 'Paulaner Münchner Hell Kasten', 'Paulaner Munich Lager Crate', 'Alkoholische Getränke', 'Alcoholic Beverages', 12.99, 20.99, '20x0.5L', '2026-04-04', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Mövenpick', 'Mövenpick Caffè Crema Ganze Bohnen', 'Mövenpick Caffè Crema Whole Beans', 'Kaffee & Tee', 'Coffee & Tea', 11.99, 17.99, '1kg', '2026-04-04', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Coppenrath & Wiese', 'Coppenrath & Wiese Kuchen Vielfalt versch. Sorten', 'Coppenrath & Wiese Cake Variety assorted', 'Tiefkühl', 'Frozen', 5.79, 8.99, '800g', '2026-04-04', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'Barilla', 'Barilla Collezione oder Al Bronzo Pasta versch. Sorten', 'Barilla Collezione or Al Bronzo Pasta assorted', 'Nudeln & Reis', 'Pasta & Rice', 1.24, 2.49, '400-500g', '2026-04-04', '2026-04-04', true, 'https://www.kaufland.de'),
('4', 'WC-Frisch', 'WC-Frisch Kraft Aktiv versch. Sorten', 'WC-Frisch Power Active assorted', 'Haushalt', 'Household', 0.99, 1.29, '50g', '2026-04-04', '2026-04-04', true, 'https://www.kaufland.de'),

-- === PAGE 28: Mumm & Spirituosen ===
('4', 'Mumm', 'Mumm Jahrgangssekt versch. Sorten', 'Mumm Vintage Sparkling Wine assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.66, 6.49, '0.75L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 29: K-Gold Edition ab Do. 02.4. ===
('4', 'K-Gold Edition', 'K-Gold Edition Tapas Creme versch. Sorten', 'K-Gold Edition Tapas Cream assorted', 'Brotaufstrich', 'Spreads', 1.99, 2.49, '200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Gold Edition', 'K-Gold Edition Kaminwurzen versch. Sorten', 'K-Gold Edition Chimney Sausages assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.69, 1.99, '105g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Gold Edition', 'K-Gold Edition Aufschnittplatte Feinschmecker', 'K-Gold Edition Cold Cut Platter Gourmet', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '120-150g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Jamon Serrano', 'Jamon Serrano Original versch. Sorten', 'Jamon Serrano Original assorted', 'Fleisch & Wurst', 'Meat & Sausage', 2.29, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Mövenpick', 'Mövenpick Gourmet Frühstück versch. Sorten', 'Mövenpick Gourmet Breakfast assorted', 'Brotaufstrich', 'Spreads', 1.99, 3.19, '225-250g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Reinert', 'Reinert Bärchen-Wurst-Aufschnitt versch. Sorten', 'Reinert Bear Sausage Cold Cut assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, NULL, '90-180g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Lachsschinken gepökelt und geräuchert', 'K-Classic Salmon Ham cured and smoked', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, 1.59, '200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Gold Edition', 'K-Gold Edition Schafskäse versch. Sorten', 'K-Gold Edition Sheep Cheese assorted', 'Käse', 'Cheese', 3.99, NULL, '120-130g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 30: Käse & Wurst ab Do. 02.4. ===
('4', 'La Leyenda', 'La Leyenda Queso de Oveja con Trufa', 'La Leyenda Sheep Cheese with Truffle', 'Käse', 'Cheese', 2.99, 3.89, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'St. Mang', 'St. Mang Orig. Allgäuer Limburger oder Rubius', 'St. Mang Original Allgäu Limburger or Rubius', 'Käse', 'Cheese', 1.99, NULL, '160-200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Gervais', 'Gervais Hüttenkäse versch. Sorten', 'Gervais Cottage Cheese assorted', 'Käse', 'Cheese', 1.29, 1.99, '200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Favourites', 'K-Favourites Franz. Camembert versch. Sorten', 'K-Favourites French Camembert assorted', 'Käse', 'Cheese', 1.99, 2.59, '240g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Président', 'Président Meersalz-Butter', 'Président Sea Salt Butter', 'Milchprodukte', 'Dairy', 2.49, NULL, '200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Gutes aus der Bäckerei Frühstücksbrötchen versch. Sorten', 'From the Bakery Breakfast Rolls assorted', 'Brot & Backwaren', 'Bread & Bakery', 1.11, NULL, '350g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Buttercroissant', 'Butter Croissant', 'Brot & Backwaren', 'Bread & Bakery', 0.39, NULL, 'Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Hohes C', 'Hohes C Orangensaft', 'Hohes C Orange Juice', 'Getränke', 'Beverages', 1.99, 2.29, '1L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Senseo', 'Senseo Kaffeepads versch. Sorten', 'Senseo Coffee Pads assorted', 'Kaffee & Tee', 'Coffee & Tea', 2.49, 3.99, '16 Pads', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Blüten- oder Waldhonig', 'K-Classic Blossom or Forest Honey', 'Brotaufstrich', 'Spreads', 2.29, 2.69, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 31: Wildlachsfilet & Wein ab Do. 02.4. ===
('4', 'Paulus', 'Paulus Wildlachsfilet', 'Paulus Wild Salmon Fillet', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 5.99, NULL, '600g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Gold Edition', 'K-Gold Edition Steirisches Kürbiskernöl', 'K-Gold Edition Styrian Pumpkin Seed Oil', 'Öle & Essig', 'Oils & Vinegar', 3.99, NULL, '250ml', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Gold Edition', 'K-Gold Edition Langkorn-/Wildreis-Mischung', 'K-Gold Edition Long Grain/Wild Rice Mix', 'Nudeln & Reis', 'Pasta & Rice', 1.59, 1.99, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Gold Edition', 'K-Gold Edition Risotto di Andrea g.g.A.', 'K-Gold Edition Risotto di Andrea PGI', 'Nudeln & Reis', 'Pasta & Rice', 1.69, 2.19, '300g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Henglein', 'Henglein Seidenknödel versch. Sorten', 'Henglein Silk Dumplings assorted', 'Fertiggerichte', 'Ready Meals', 1.99, 2.99, '750g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Favourites', 'K-Favourites Tagliolini oder Pappardelle frische Pasta', 'K-Favourites Tagliolini or Pappardelle fresh Pasta', 'Nudeln & Reis', 'Pasta & Rice', 1.99, NULL, '250g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Buttergemüse', 'K-Bio Buttered Vegetables', 'Tiefkühl', 'Frozen', 1.29, 1.49, '450g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Niklas', 'Niklas Pfifferlinge 300-600g', 'Niklas Chanterelles 300-600g', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, 3.99, '300g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Weida', 'Weida Neuseel. Lammbraten mit Knochen', 'Weida New Zealand Lamb Roast with Bone', 'Fleisch & Wurst', 'Meat & Sausage', 9.99, NULL, 'kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 32: Pralinen & Wein ab Do. 02.4. ===
('4', 'K-Gold Edition', 'K-Gold Edition Macarons Sélection versch. Sorten', 'K-Gold Edition Macarons Selection assorted', 'Süßwaren', 'Sweets', 2.99, 3.99, '144g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Lindt', 'Lindt Lindor Kugeln versch. Sorten', 'Lindt Lindor Balls assorted', 'Süßwaren', 'Sweets', 4.79, NULL, '136-137g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Lindt', 'Lindt Exquisite Pralinés', 'Lindt Exquisite Pralines', 'Süßwaren', 'Sweets', 5.99, NULL, '150g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Gold Edition', 'K-Gold Edition Mousse au Chocolat Zartbitter oder Vollmilch', 'K-Gold Edition Mousse au Chocolat Dark or Milk', 'Süßwaren', 'Sweets', 3.79, NULL, '350g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Mini-Windbeutel versch. Sorten', 'K-Classic Mini Cream Puffs assorted', 'Tiefkühl', 'Frozen', 1.19, 1.49, '200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Dan Cake', 'Dan Cake Cake Bites Baileys oder Lemon', 'Dan Cake Cake Bites Baileys or Lemon', 'Süßwaren', 'Sweets', 2.49, 2.99, '250g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Rotkäppchen', 'Rotkäppchen Piccolo Sekt oder Fruchtsecco versch. Sorten', 'Rotkäppchen Piccolo Sparkling Wine or Fruit Secco assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 0.99, NULL, '0.2L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Botucal', 'Botucal Reserva Exclusiva Rum 12 Jahre', 'Botucal Reserva Exclusiva Rum 12 Years', 'Alkoholische Getränke', 'Alcoholic Beverages', 29.99, 42.99, '0.7L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Amarula', 'Amarula Cream & Marula Fruit Likör', 'Amarula Cream & Marula Fruit Liqueur', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, NULL, '0.7L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Heidsieck', 'Heidsieck Monopole Blue Top Champagner brut', 'Heidsieck Monopole Blue Top Champagne brut', 'Alkoholische Getränke', 'Alcoholic Beverages', 24.99, 33.99, '0.75L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 33: Bio ab Do. 02.4. ===
('4', 'K-Bio', 'K-Bio Oliven versch. Sorten', 'K-Bio Olives assorted', 'Grundnahrungsmittel', 'Staples', 1.19, 1.49, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Kräuter versch. Sorten', 'K-Bio Herbs assorted', 'Saucen & Gewürze', 'Sauces & Spices', 0.69, 0.89, '50g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Knusperbrot versch. Sorten', 'K-Bio Crispbread assorted', 'Brot & Backwaren', 'Bread & Bakery', 0.89, NULL, '75g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Dinkel-/Vollkorn-Nudeln versch. Sorten', 'K-Bio Spelt/Wholegrain Pasta assorted', 'Nudeln & Reis', 'Pasta & Rice', 1.29, 1.45, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Agavendicksaft', 'K-Bio Agave Syrup', 'Brotaufstrich', 'Spreads', 1.99, NULL, '350g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Bioland Rote Bete', 'K-Bio Bioland Beetroot', 'Grundnahrungsmittel', 'Staples', 0.89, NULL, '350g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Pesto versch. Sorten', 'K-Bio Pesto assorted', 'Saucen & Gewürze', 'Sauces & Spices', 1.75, NULL, '190g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Pflanzenmilch versch. Sorten', 'K-Bio Plant Milk assorted', 'Milchprodukte', 'Dairy', 4.49, NULL, '1L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 34: Bio Spezialitäten ab Do. 02.4. ===
('4', 'Voelkel', 'Voelkel Demeter Ingwer-Shot', 'Voelkel Demeter Ginger Shot', 'Getränke', 'Beverages', 2.99, 3.99, '280ml', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Demeter', 'Bäuerliche Erzeuger Gemeinschaft Schwäbisch Hall Demeter Wurst-Spezialitäten', 'Demeter Sausage Specialties', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 4.99, '200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Glowkitchen', 'Glowkitchen Bio-Rote-Beeren-Bananenbrot', 'Glowkitchen Organic Red Berry Banana Bread', 'Brot & Backwaren', 'Bread & Bakery', 1.59, 1.99, '170g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Wholey', 'Wholey Bio-Açaí Bowl versch. Sorten', 'Wholey Organic Açaí Bowl assorted', 'Tiefkühl', 'Frozen', 1.00, NULL, '250g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Pukka', 'Pukka Bio-Tee versch. Sorten', 'Pukka Organic Tea assorted', 'Kaffee & Tee', 'Coffee & Tea', 2.99, NULL, '20 Beutel', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Campo Verde', 'Campo Verde Demeter Kokosmilch', 'Campo Verde Demeter Coconut Milk', 'Milchprodukte', 'Dairy', 2.22, 2.99, '400ml', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Naturpura', 'Naturpura Bio-Protein Dinkelwaffeln', 'Naturpura Organic Protein Spelt Waffles', 'Snacks & Nüsse', 'Snacks & Nuts', 1.19, 1.49, '80g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Heimatgut', 'Heimatgut Bio-Popcorn versch. Sorten', 'Heimatgut Organic Popcorn assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 1.39, 1.75, '90g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'HiPP', 'HiPP Bio Fertiggericht Spaghetti Bolognese/Lasagne', 'HiPP Organic Ready Meal Spaghetti Bolognese/Lasagna', 'Fertiggerichte', 'Ready Meals', 1.79, NULL, '250g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Tartex', 'Tartex Bio-Abendbrote/aufstrich versch. Sorten', 'Tartex Organic Evening Bread Spread assorted', 'Brotaufstrich', 'Spreads', 1.99, 2.35, '140g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 35: Fisch ab Do. 02.4. ===
('4', 'Eigenmarke', 'Wolfsbarsch aus Aquakultur', 'Sea Bass from Aquaculture', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.59, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Saibling ausgenommen', 'Char gutted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.69, 2.29, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Heringsmatjesfilet Bismarck oder Bratklopse', 'Herring Matjes Fillet Bismarck or Fried Balls', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.39, 1.79, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Grüne Oliven mit Mandeln', 'Green Olives with Almonds', 'Grundnahrungsmittel', 'Staples', 0.99, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Weinblätter gefüllt mit Reis', 'Vine Leaves stuffed with Rice', 'Fertiggerichte', 'Ready Meals', 1.99, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Stremellachs versch. Sorten', 'Stremel Salmon assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.89, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Milram', 'Milram Müritzer Käse', 'Milram Müritzer Cheese', 'Käse', 'Cheese', 0.99, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Landana', 'Landana Gouda mild', 'Landana Gouda mild', 'Käse', 'Cheese', 0.99, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Switzerland', 'Switzerland Appenzeller Extra-Würzig', 'Switzerland Appenzeller Extra-Spicy', 'Käse', 'Cheese', 2.22, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Saint Albray', 'Saint Albray oder Chaumes Franz. Weichkäse', 'Saint Albray or Chaumes French Soft Cheese', 'Käse', 'Cheese', 1.79, 2.55, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 36: Frischetheke Wurst ab Do. 02.4. ===
('4', 'Eigenmarke', 'Delikatess-Fleischkäse gebacken', 'Delicatessen Meat Loaf baked', 'Fleisch & Wurst', 'Meat & Sausage', 0.99, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Montorsi', 'Montorsi Mortadella Bologna IGP', 'Montorsi Mortadella Bologna IGP', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Zimmermann', 'Zimmermann Allgäuer Bergkräuter-Schinken', 'Zimmermann Allgäu Mountain Herb Ham', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Zwiebelmettwurst', 'Onion Minced Pork Spread', 'Fleisch & Wurst', 'Meat & Sausage', 1.09, 1.39, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Klümper', 'Klümper Schwarzwälder Schinken', 'Klümper Black Forest Ham', 'Fleisch & Wurst', 'Meat & Sausage', 2.29, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Kaiserfleisch Kasseler Aufschnitt', 'Emperor Meat Kasseler Cold Cut', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 37: Fleisch ab Do. 02.4. ===
('4', 'K-Purland', 'K-Purland Grobe Bratwurst versch. Sorten', 'K-Purland Coarse Bratwurst assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '400g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Kasseler Nussschinken am Stück', 'K-Purland Kasseler Nut Ham Piece', 'Fleisch & Wurst', 'Meat & Sausage', 7.29, 10.99, 'kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Schweine-Schmetterlingsbauch mariniert', 'K-Purland Pork Butterfly Belly marinated', 'Fleisch & Wurst', 'Meat & Sausage', 3.59, 4.43, '600g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 38: Fleisch ab Do. 02.4. ===
('4', 'K-Purland', 'K-Purland Kalbschnitzel', 'K-Purland Veal Schnitzel', 'Fleisch & Wurst', 'Meat & Sausage', 6.29, 6.99, '200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Schweinegulasch', 'K-Purland Pork Goulash', 'Fleisch & Wurst', 'Meat & Sausage', 3.29, 3.89, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Schweinerücken am Stück', 'K-Purland Pork Back Piece', 'Fleisch & Wurst', 'Meat & Sausage', 5.49, 7.79, 'kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Rinderschmorbraten vom Jungbullen', 'K-Purland Young Bull Beef Pot Roast', 'Fleisch & Wurst', 'Meat & Sausage', 15.99, 18.99, 'kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Rinderhackfleisch XXL', 'K-Purland Beef Mince XXL', 'Fleisch & Wurst', 'Meat & Sausage', 9.99, NULL, '1kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 39: Fleisch ab Do. 02.4. ===
('4', 'K-Purland', 'K-Purland Geschnetzeltes Jäger Art XXL mariniert', 'K-Purland Sliced Hunter Style XXL marinated', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, '800g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Kasseler Nacken/Kamm XXL', 'K-Purland Kasseler Neck/Comb XXL', 'Fleisch & Wurst', 'Meat & Sausage', 6.29, NULL, '2.5kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Bard', 'Bard Schweinefilet mit Steinpilzfüllung', 'Bard Pork Fillet with Porcini Filling', 'Fleisch & Wurst', 'Meat & Sausage', 11.19, NULL, '800g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Beef Brisket vom Jungbullen gegart', 'K-Purland Beef Brisket Young Bull cooked', 'Fleisch & Wurst', 'Meat & Sausage', 13.99, 15.99, 'ca. 1.5kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 40: Geflügel & Fisch ab Do. 02.4. ===
('4', 'Eigenmarke', 'Chicken-Nuggets XXL', 'Chicken Nuggets XXL', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, '1kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Hähnchen-Unterschenkel XXL', 'K-Purland Chicken Drumsticks XXL', 'Fleisch & Wurst', 'Meat & Sausage', 4.39, NULL, '1kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Crunchy Chicken Patties XXL versch. Sorten', 'Crunchy Chicken Patties XXL assorted', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Wertschätze', 'K-Wertschätze Hähnchen ganz', 'K-Wertschätze Whole Chicken', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, 7.49, 'ca. 1.5kg', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Blue Bay', 'K-Blue Bay Alaska-Seelachsloin-Portionen', 'K-Blue Bay Alaska Pollock Loin Portions', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.49, NULL, '250g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Crusta C', 'Crusta C White Tiger Garnelen geschält', 'Crusta C White Tiger Shrimp peeled', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, NULL, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 41: Bäckerei ab Do. 02.4. ===
('4', 'Eigenmarke', 'Schweizer Weckli', 'Swiss Roll', 'Brot & Backwaren', 'Bread & Bakery', 0.44, NULL, 'Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 42: Bäckerei ab Do. 02.4. ===
('4', 'Eigenmarke', 'Laugenbaguette', 'Pretzel Baguette', 'Brot & Backwaren', 'Bread & Bakery', 0.99, 1.29, '260g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Rustikales Wurzelbrot mit Natursauerteig', 'Rustic Root Bread with Natural Sourdough', 'Brot & Backwaren', 'Bread & Bakery', 1.49, 1.99, '400g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Vegetarische Pizza mit Blumenkohl', 'Vegetarian Pizza with Cauliflower', 'Brot & Backwaren', 'Bread & Bakery', 0.69, NULL, 'Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Eigenmarke', 'Donut Ostern versch. Sorten', 'Donut Easter assorted', 'Brot & Backwaren', 'Bread & Bakery', 0.39, NULL, 'Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 43: Wurst ab Do. 02.4. ===
('4', 'K-Classic', 'K-Classic Kochhinterschinken gespritzt', 'K-Classic Cooked Back Ham injected', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, 1.49, '200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Wiener Würstchen', 'K-Classic Vienna Sausages', 'Fleisch & Wurst', 'Meat & Sausage', 2.69, NULL, '400g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Berschneider', 'Berschneider Nussschinken gebacken', 'Berschneider Nut Ham baked', 'Fleisch & Wurst', 'Meat & Sausage', 1.39, 1.79, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Du Darfst', 'Du Darfst Leberwurst oder Kalbfleischwurst', 'Du Darfst Liverwurst or Veal Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 1.19, 1.89, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Handl Tyrol', 'Handl Tyrol Tiroler Puten-Sticks Classic', 'Handl Tyrol Tyrolean Turkey Sticks Classic', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '90g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Leerdammer', 'Leerdammer Knusper-Minis versch. Sorten', 'Leerdammer Crispy Minis assorted', 'Käse', 'Cheese', 2.22, 2.99, '160g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Cathedral City', 'Cathedral City English Cheddar Käse versch. Sorten', 'Cathedral City English Cheddar Cheese assorted', 'Käse', 'Cheese', 2.99, 3.99, '200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Ömür', 'Ömür Böreklik aus Magerquark und Pflanzenfett', 'Ömür Böreklik from Low-fat Quark and Vegetable Fat', 'Milchprodukte', 'Dairy', 5.49, NULL, '800g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Sandwichscheiben Gouda Emmentaler', 'K-Classic Sandwich Slices Gouda Emmental', 'Käse', 'Cheese', 2.22, NULL, '400g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Soignon', 'Soignon Ziegenkäse-Rolle versch. Sorten', 'Soignon Goat Cheese Roll assorted', 'Käse', 'Cheese', 2.29, NULL, '180g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 44: Milchprodukte ab Do. 02.4. ===
('4', 'Ehrmann', 'Ehrmann Obstgarten Quarkspeise versch. Sorten', 'Ehrmann Orchard Quark Dessert assorted', 'Milchprodukte', 'Dairy', 0.49, 0.79, '125g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Zott', 'Zott Monte Milchdessert versch. Sorten', 'Zott Monte Milk Dessert assorted', 'Milchprodukte', 'Dairy', 1.69, 2.99, '400g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Exquisa', 'Exquisa Fitline Protein Skyr Vanille oder Zero versch. Sorten', 'Exquisa Fitline Protein Skyr Vanilla or Zero assorted', 'Milchprodukte', 'Dairy', 1.49, NULL, '400g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Meggle', 'Meggle Kräuter-Butter Original versch. Sorten', 'Meggle Herb Butter Original assorted', 'Milchprodukte', 'Dairy', 1.49, 2.49, '100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Popp', 'Popp Kartoffel- oder Nudelsalat versch. Sorten', 'Popp Potato or Pasta Salad assorted', 'Fertiggerichte', 'Ready Meals', 1.49, 1.89, '400g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Nadler', 'Nadler Heringsfilets versch. Sorten', 'Nadler Herring Fillets assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, NULL, '300g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Glücksklee', 'Glücksklee Sprüh-Sahne Finesse', 'Glücksklee Spray Cream Finesse', 'Milchprodukte', 'Dairy', 0.99, NULL, '250ml', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Milram', 'Milram Gewürzquark versch. Sorten', 'Milram Spiced Quark assorted', 'Milchprodukte', 'Dairy', 0.99, NULL, '185g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'McCain', 'McCain Kartoffelprodukt Frites 1-2-3 versch. Sorten', 'McCain Potato Product Fries 1-2-3 assorted', 'Tiefkühl', 'Frozen', 1.59, 2.79, '600-900g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Iglo', 'Iglo Rahm-Spinat', 'Iglo Creamed Spinach', 'Tiefkühl', 'Frozen', 1.99, 3.49, '750g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Garden Gourmet', 'Garden Gourmet Vegane Fleisch-Alternative versch. Sorten', 'Garden Gourmet Vegan Meat Alternative assorted', 'Fleischersatz', 'Meat Alternatives', 2.49, 2.99, '170-220g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 45: Konserven & Lebensmittel ab Do. 02.4. ===
('4', 'K-Classic', 'K-Classic Rotkohl', 'K-Classic Red Cabbage', 'Grundnahrungsmittel', 'Staples', 0.89, NULL, '400g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Gartenerbsen', 'K-Classic Garden Peas', 'Grundnahrungsmittel', 'Staples', 1.29, 1.49, '800g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Oro di Parma', 'Oro di Parma Passierte Tomaten', 'Oro di Parma Passata Tomatoes', 'Saucen & Gewürze', 'Sauces & Spices', 1.99, 2.59, '700g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Maggi', 'Maggi Brühe Gemüse-/Hühner-/Würze versch. Sorten', 'Maggi Broth Vegetable/Chicken/Seasoning assorted', 'Saucen & Gewürze', 'Sauces & Spices', 1.59, 1.99, '1L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Hellmann''s', 'Hellmann''s Sauce für Burger oder Sandwiches versch. Sorten', 'Hellmann''s Sauce for Burgers or Sandwiches assorted', 'Saucen & Gewürze', 'Sauces & Spices', 1.49, 1.99, '210ml', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Develey', 'Develey Würzsaucen versch. Sorten', 'Develey Seasoning Sauces assorted', 'Saucen & Gewürze', 'Sauces & Spices', 1.39, 1.79, '250ml', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Dr. Oetker', 'Dr. Oetker Süße Mahlzeit Milchreis/Grießbrei versch. Sorten', 'Dr. Oetker Sweet Meal Rice Pudding/Semolina assorted', 'Milchprodukte', 'Dairy', 0.99, NULL, '75-99g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Blitz-Start oder Pfannenkuchen-Teig', 'K-Classic Quick Start or Pancake Batter', 'Grundnahrungsmittel', 'Staples', 2.49, NULL, '250g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Harry', 'Harry Vollkorn Toast', 'Harry Wholegrain Toast', 'Brot & Backwaren', 'Bread & Bakery', 0.99, NULL, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Nestlé', 'Nestlé Cerealien-Riegel Lion oder Cini Minis versch. Sorten', 'Nestlé Cereal Bars Lion or Cini Minis assorted', 'Frühstück & Cerealien', 'Breakfast & Cereal', 1.12, 1.59, '5 Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Weizenwaffeln gebacken und geröstet', 'K-Classic Wheat Waffles baked and toasted', 'Süßwaren', 'Sweets', 2.79, 3.49, '200g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Frischei-Waffeln', 'K-Classic Fresh Egg Waffles', 'Süßwaren', 'Sweets', 1.29, 1.49, '250g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 46: Süßwaren & Kaffee ab Do. 02.4. ===
('4', 'Gusto', 'Gusto Pufuletti versch. Sorten', 'Gusto Pufuletti assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 0.89, 1.19, '80-100g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Chupa Chups', 'Chupa Chups Lollies versch. Sorten', 'Chupa Chups Lollies assorted', 'Süßwaren', 'Sweets', 1.39, 1.79, '120g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Giotto', 'Giotto Mini-Gebäckkugeln Haselnuss', 'Giotto Mini Biscuit Balls Hazelnut', 'Süßwaren', 'Sweets', 2.99, 3.65, '6 Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Ricola', 'Ricola Kräuterbonbons versch. Sorten', 'Ricola Herbal Candies assorted', 'Süßwaren', 'Sweets', 1.79, NULL, '75g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Maoam', 'Maoam MaoMix oder Joystixx versch. Sorten', 'Maoam MaoMix or Joystixx assorted', 'Süßwaren', 'Sweets', 2.29, 2.79, '250-325g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Harry', 'Harry Anno 1688 Rosinenbrot oder Brötchen', 'Harry Anno 1688 Raisin Bread or Rolls', 'Brot & Backwaren', 'Bread & Bakery', 1.79, NULL, '500g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Baguettes oder Brötchen', 'K-Classic Baguettes or Rolls', 'Brot & Backwaren', 'Bread & Bakery', 0.55, NULL, '300g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Teekanne', 'Teekanne Kräuter- oder Früchtetee versch. Sorten', 'Teekanne Herbal or Fruit Tea assorted', 'Kaffee & Tee', 'Coffee & Tea', 1.49, NULL, '18-20 Beutel', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Kaba', 'Kaba Choco Kakaogetränkepulver', 'Kaba Choco Cocoa Drink Powder', 'Getränke', 'Beverages', 2.22, NULL, '400g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Nescafé', 'Nescafé Frappé Typ Eiskaffee Getränkepulver', 'Nescafé Frappé Iced Coffee Drink Powder', 'Kaffee & Tee', 'Coffee & Tea', 2.69, 3.79, '275g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Jacobs', 'Jacobs Kaffeekapseln Lungo oder Espresso versch. Sorten', 'Jacobs Coffee Capsules Lungo or Espresso assorted', 'Kaffee & Tee', 'Coffee & Tea', 4.44, 5.49, '20 Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 47: Getränke & Bier ab Do. 02.4. ===
('4', 'Oberbräu', 'Oberbräu Hell Kasten', 'Oberbräu Lager Crate', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.99, 20.99, '20x0.5L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Juizy Wow', 'Juizy Wow Getränkesirup versch. Sorten', 'Juizy Wow Beverage Syrup assorted', 'Getränke', 'Beverages', 2.99, 3.99, '4L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Sanpellegrino', 'Sanpellegrino Fruchtsaftgetränk versch. Sorten', 'Sanpellegrino Fruit Juice Drink assorted', 'Getränke', 'Beverages', 0.89, NULL, '0.33L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Mein T', 'Mein T Erfrischungsgetränk versch. Sorten', 'Mein T Soft Drink assorted', 'Getränke', 'Beverages', 0.59, 0.79, '500ml', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Beck''s', 'Beck''s Pils oder Gold Kasten', 'Beck''s Pilsner or Gold Crate', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, 11.99, '20x0.5L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Michel Schneider', 'Michel Schneider Qualitätswein oder alkoholfreier Wein versch. Sorten', 'Michel Schneider Quality Wine or Non-alcoholic Wine assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 5.49, '0.75L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Gracioso', 'Gracioso Weinhaltiger Cocktail versch. Sorten', 'Gracioso Wine Cocktail assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.99, 2.99, '0.75L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'WZG', 'WZG Rödlinger Süß & Fruchtig Württemberg', 'WZG Rödlinger Sweet & Fruity Württemberg', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.49, NULL, '0.75L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Gourmet Père & Fils', 'Gourmet Père & Fils Entrecoté Merlot Cabernet Sauvignon', 'Gourmet Père & Fils Entrecoté Merlot Cabernet Sauvignon', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, NULL, '0.75L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 48: Spirituosen ab Do. 02.4. ===
('4', 'Captain Morgan', 'Captain Morgan/Smirnoff/Gordon''s/Johnnie Walker/Jim Beam Mixgetränk versch. Sorten', 'Captain Morgan/Smirnoff/Gordon''s/Johnnie Walker/Jim Beam Mix Drink assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.99, NULL, '0.33L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Le Favori', 'Le Favori Triple Sec Orange-Likör', 'Le Favori Triple Sec Orange Liqueur', 'Alkoholische Getränke', 'Alcoholic Beverages', 8.99, NULL, '0.7L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Gordon''s', 'Gordon''s London Dry Gin oder 0.0', 'Gordon''s London Dry Gin or 0.0', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, 13.99, '0.7L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Southern Comfort', 'Southern Comfort Whiskey-Likör', 'Southern Comfort Whiskey Liqueur', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, NULL, '0.7L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Ouzo 12', 'Ouzo 12 oder Gold 12 Anissprituose', 'Ouzo 12 or Gold 12 Anise Spirit', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, NULL, '0.7L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Cellini', 'Cellini Grappa Oro oder Cru', 'Cellini Grappa Oro or Cru', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, 12.99, '0.7L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Teeling', 'Teeling Irish Whiskey Small Batch', 'Teeling Irish Whiskey Small Batch', 'Alkoholische Getränke', 'Alcoholic Beverages', 24.99, NULL, '0.7L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Novantaceppi', 'Novantaceppi Primitivo/Pinot Grigio versch. Sorten', 'Novantaceppi Primitivo/Pinot Grigio assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, NULL, '0.75L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Zonin', 'Zonin Prosecco DOC', 'Zonin Prosecco DOC', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.99, 9.99, '0.75L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', '9 Mile', '9 Mile Vodka', '9 Mile Vodka', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, NULL, '0.7L', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 50: Haushalt & Tierbedarf ab Do. 02.4. ===
('4', 'Cottonelle', 'Cottonelle Feuchtes Toilettenpapier versch. Sorten', 'Cottonelle Moist Toilet Paper assorted', 'Haushalt', 'Household', 1.19, 1.55, '42 Stück', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'The Papermakers', 'The Papermakers Sunny Küchenrolle', 'The Papermakers Sunny Kitchen Roll', 'Haushalt', 'Household', 3.33, NULL, '8x45 Blatt', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Fit', 'Fit Geschirrspülmittel versch. Sorten', 'Fit Dish Soap assorted', 'Haushalt', 'Household', 1.49, 1.95, '500-750ml', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Frosch', 'Frosch Universal-Reiniger Orange', 'Frosch Universal Cleaner Orange', 'Haushalt', 'Household', 1.59, 1.95, '750ml', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Viss', 'Viss Reiniger Bad & Dusche versch. Sorten', 'Viss Cleaner Bath & Shower assorted', 'Haushalt', 'Household', 1.99, 2.55, '750ml', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Josera', 'Josera Cat oder JosiDog Katzen- oder Hundetrockennahrung versch. Sorten', 'Josera Cat or JosiDog Cat or Dog Dry Food assorted', 'Tierbedarf', 'Pet Supplies', 0.88, NULL, '400-900g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Vitakraft', 'Vitakraft Beef-Stick versch. Sorten', 'Vitakraft Beef Stick assorted', 'Tierbedarf', 'Pet Supplies', 0.99, 1.29, '30g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Vitakraft', 'Vitakraft Katzen-Snacks Liquid versch. Sorten', 'Vitakraft Cat Snacks Liquid assorted', 'Tierbedarf', 'Pet Supplies', 0.99, NULL, '70-90g', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Air Wick', 'Air Wick Freshmatic Lufterfrischer versch. Sorten', 'Air Wick Freshmatic Air Freshener assorted', 'Haushalt', 'Household', 6.49, NULL, '2x250ml', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Ariel', 'Ariel Voll- oder Colorwaschmittel 100 Waschladungen', 'Ariel Full or Color Detergent 100 Washes', 'Haushalt', 'Household', 21.99, NULL, '100WL', '2026-04-02', '2026-04-08', true, 'https://www.kaufland.de');
