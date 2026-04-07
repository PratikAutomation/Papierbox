-- Kaufland Prospekt: Di. 7.4. bis Di. 15.4.2026
-- Source: kaufDA - Kaufland
-- store_id = '4'
-- Extracted via Claude.ai free tier (Sonnet), verified and fixed

DELETE FROM public.offers WHERE store_id = '4' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2: AB DIENSTAG 07.04. – Highlights ===
('4', 'Kaufland', 'Poln./kroat. Kulturchampignons weiß', 'Polish/Croatian White Mushrooms', 'Obst & Gemüse', 'Fruits & Vegetables', 1.39, NULL, '500g-Schale', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Ayhan / Kalinka', 'Kefir 1,5% Fett oder Joghurt, Wasser und Salz', 'Kefir 1.5% Fat or Yoghurt, Water and Salt', 'Milchprodukte', 'Dairy', 0.79, 1.29, '500g-Fl.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Krüger', 'Family Cappuccino Nachfüllbeutel versch. Sorten', 'Family Cappuccino Refill Bag various varieties', 'Kaffee & Tee', 'Coffee & Tea', 4.00, NULL, '500g', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Dr. Oetker', 'Ristorante Pizza versch. Sorten', 'Ristorante Pizza various varieties', 'Tiefkühl', 'Frozen', 1.77, 3.49, '320-410g-Packg.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Paulaner', 'Spezi, Cola oder Limo versch. Sorten', 'Spezi, Cola or Lemonade various varieties', 'Getränke', 'Beverages', 0.59, 0.85, '0,33-l-Dose', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Meggle', 'Schnitt- oder Hartkäse versch. Sorten 45-48% Fett', 'Sliced or Hard Cheese various varieties', 'Käse', 'Cheese', 1.49, 2.39, '125-150g-Packg.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Meggle', 'Butterkäse', 'Butter Cheese', 'Käse', 'Cheese', 1.49, 2.39, '125-150g-Packg.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 3: AB DIENSTAG 07.04. – Obst & Gemüse / Frischetheke ===
('4', 'Kaufland', 'Niederl./belg. Tafelbirnen Kl. I', 'Dutch/Belgian Table Pears Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, 1.99, '1-kg-Schale', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Span. Romatomaten Kl. I', 'Spanish Roma Tomatoes Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, 1.99, '500g-Schale', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Ital. Kohlrabi lose Kl. I', 'Italian Kohlrabi loose Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.49, 0.69, 'Stück', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Leerdammer', 'Original oder Delacrème holl. Schnittkäse mild-nussig bzw. mild-würzig 45-61% Fett', 'Leerdammer Original or Delacrème Dutch Sliced Cheese', 'Käse', 'Cheese', 1.09, NULL, '100g', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Sennenkäse schweiz. Schnittkäse aus Rohmilch 50% Fett', 'Swiss Raw Milk Sennenkäse Sliced Cheese', 'Käse', 'Cheese', 1.09, 2.19, '100g', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Langewiesche', 'Butterschinken ofengebacken', 'Baked Butter Ham', 'Fleisch & Wurst', 'Meat & Sausage', 1.19, NULL, '100g', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Weißbrot mit Glanz mit Natursauerteig', 'White Bread with Glaze with Natural Sourdough', 'Brot & Backwaren', 'Bread & Bakery', 1.39, 1.99, '500g-Stück', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'BiFi', 'Original, Roll oder Chicken High Protein geräuchert', 'BiFi Original, Roll or Chicken High Protein smoked', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.99, '3-6 St. / 100-135g-Packg.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Gutfried', 'Hähnchen- oder Putenbrust natur gepökelt geräuchert und gegart', 'Gutfried Chicken or Turkey Breast', 'Fleisch & Wurst', 'Meat & Sausage', 1.59, NULL, '100g-Packg.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 4: AB DIENSTAG 07.04. – Mix Seite ===
('4', 'Coppenrath & Wiese', 'Unsere Goldstücke Brötchen zum Aufbacken versch. Sorten', 'Coppenrath & Wiese Goldstücke Rolls to Bake', 'Brot & Backwaren', 'Bread & Bakery', 1.49, 2.29, '9 St. / 300-540g-Beutel', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Rama', 'Pflanzliches Streichfett Original oder Balance 39-60% Fett', 'Rama Plant-Based Spread Original or Balance', 'Butter', 'Butter', 1.39, 2.29, '400-450g-Becher', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Rama', 'Pflanzliches Streichfett 100% natürliche Zutaten', 'Rama Plant-Based Spread 100% Natural Ingredients', 'Butter', 'Butter', 1.11, NULL, '400-450g-Becher', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Rügenwalder Mühle', 'Vegane Wurstalternative Schinken-Spicker, Mühlensalami oder Hauchgenuss Typ Hähnchen', 'Rügenwalder Mühle Vegan Sausage Alternative', 'Fleischersatz', 'Meat Alternatives', 1.11, NULL, '70-80g-Packg.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'H-Vollmilch 3,5% Fett', 'K-Classic UHT Whole Milk 3.5% Fat', 'Milchprodukte', 'Dairy', 0.79, 0.95, '1-l-Packg.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'True Fruits', 'Smoothie versch. Sorten', 'True Fruits Smoothie various varieties', 'Getränke', 'Beverages', 2.99, 4.69, '0,75-l-Fl.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Herzhafte Minis Sauermilchkäse versch. Sorten weniger als 1% Fett', 'K-Classic Savory Minis Sour Milk Cheese', 'Käse', 'Cheese', 0.99, 1.19, '115g-Packg.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Gouda jung am Stück 48% Fett', 'K-Classic Young Gouda Block 48% Fat', 'Käse', 'Cheese', 3.33, 3.79, '450g-Stück', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Wiltmann', 'Bio-Salami versch. Sorten', 'Wiltmann Organic Salami various varieties', 'Fleisch & Wurst', 'Meat & Sausage', 1.79, 2.69, '50-80g-Packg.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 5: AB DIENSTAG 07.04. – Highlights ===
('4', 'K-Bio', 'Bio-Olivenöl Natives extra', 'K-Bio Organic Extra Virgin Olive Oil', 'Öle & Essig', 'Oils & Vinegar', 5.55, 6.95, '750ml-Fl.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Perwoll', 'Feinwaschmittel flüssig versch. Sorten', 'Perwoll Fine Laundry Detergent liquid', 'Haushalt', 'Household', 4.99, NULL, '1,35-l-Fl.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Haribo', 'Balla Stixx oder Spaghetti versch. Sorten', 'Haribo Balla Stixx or Spaghetti various varieties', 'Süßwaren', 'Sweets', 1.29, NULL, '175-200g-Packg.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Knoppers', 'Riegel versch. Sorten', 'Knoppers Bar various varieties', 'Süßwaren', 'Sweets', 1.69, 2.49, '5 St. / 200g-Packg.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Manner', 'Waffelschnitten versch. Sorten', 'Manner Wafer Slices various varieties', 'Süßwaren', 'Sweets', 2.22, 2.49, '300-400g-Beutel', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Lay''s', 'Chips Kartoffelchips Classic versch. Sorten oder MAX Roasted Onion & Sour Cream', 'Lay''s Chips Classic or MAX varieties', 'Snacks & Nüsse', 'Snacks & Nuts', 1.11, 1.99, '110-150g-Packg.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Somat', 'Geschirrspülreiniger XXL', 'Somat Dishwasher Cleaner XXL', 'Haushalt', 'Household', 6.99, 9.45, 'XXL-Packung', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Head & Shoulders', 'Shampoo XXL versch. Sorten', 'Head & Shoulders Shampoo XXL various varieties', 'Haushalt', 'Household', 7.99, 8.88, '800ml-Fl.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 6: AB DIENSTAG 07.04. – Mix Seite ===
('4', 'Nissin', 'Cup Noodles Instant-Nudelsuppe versch. Sorten', 'Nissin Cup Noodles Instant Noodle Soup', 'Fertiggerichte', 'Ready Meals', 0.99, 1.19, '63-67g-Becher', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Krini', 'Hülsenfrüchte Kichererbsen, Linsen oder versch. Sorten Bohnen', 'Krini Legumes Chickpeas, Lentils or Beans', 'Grundnahrungsmittel', 'Staples', 0.99, 1.89, '400g-Dose', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Krini', 'Weiße Riesenbohnen', 'Krini White Giant Beans', 'Grundnahrungsmittel', 'Staples', 0.79, NULL, '400g-Dose', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Deit', 'Zuckerfreie Limonade versch. Sorten', 'Deit Sugar-Free Lemonade various varieties', 'Getränke', 'Beverages', 0.99, 1.29, '0,75-l-PET-Fl.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Freixenet', 'Mederaño oder Mia Rotwein Halbtrocken Spanien', 'Freixenet Mederaño or Mia Red Wine Semi-Dry Spain', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.99, 4.49, '0,75-l-Fl.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Freixenet', 'Mederaño XTRA Angebot', 'Freixenet Mederaño XTRA', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.79, NULL, '0,75-l-Fl.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Havana Club', 'Original 3 Años oder Especial kubanischer Rum 35-40 Vol.%', 'Havana Club Original 3 Anos or Especial Cuban Rum', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, NULL, '0,7-l-Fl.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Echter Nordhäuser', 'Reiche Ernte Kornbrand und Obstbrand versch. Sorten', 'Echter Nordhäuser Reiche Ernte Grain and Fruit Brandy', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.99, NULL, '0,5-l-Fl.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Metaxa', '5-Stern griech. Spirituosenspezialität 38 Vol.%', 'Metaxa 5-Star Greek Spirit Specialty', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, NULL, '0,7-l-Fl.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),
('4', 'Fernet-Branca', 'Kräuterbitter 35 Vol.%', 'Fernet-Branca Herbal Bitters', 'Alkoholische Getränke', 'Alcoholic Beverages', 11.99, 17.99, '0,7-l-Fl.', '2026-04-07', '2026-04-08', true, 'https://www.kaufland.de'),

-- === PAGE 14: AB DONNERSTAG 09.04. – Highlights ===
('4', 'Kaufland', 'Marokk./span. Kulturheidelbeeren Kl. I', 'Moroccan/Spanish Blueberries Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 3.33, 4.99, '300g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Span./niederl. Gurke lose Kl. I', 'Spanish/Dutch Cucumber loose Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.59, NULL, 'Stück', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Schogetten', 'Schokolade versch. Sorten', 'Schogetten Chocolate various varieties', 'Süßwaren', 'Sweets', 0.95, 1.79, '100g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'Schinkenschnitzel aus der Oberschale vom Schwein', 'K-Purland Pork Escalope', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, NULL, '600g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Müller', 'Müllermilch Milchmischgetränk 1,5% Fett versch. Sorten', 'Müller Müllermilch Flavoured Milk Drink', 'Milchprodukte', 'Dairy', 0.59, 1.49, '400ml-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Jack Daniel''s', 'Tennessee Whiskey Original oder Whiskey-Likör Honey 35-40 Vol.%', 'Jack Daniel''s Tennessee Whiskey', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.99, 19.99, '0,7-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Erasco', 'Eintopf versch. Sorten', 'Erasco Stew various varieties', 'Fertiggerichte', 'Ready Meals', 1.79, 3.29, '800g-Dose', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Erasco', 'Hühner Nudel-Topf XTRA', 'Erasco Chicken Noodle Pot XTRA', 'Fertiggerichte', 'Ready Meals', 1.59, NULL, '800g-Dose', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Frosta', 'Fertiggericht versch. Sorten Hühner Frikassee oder Paella', 'Frosta Ready Meal Chicken Fricassee or Paella', 'Tiefkühl', 'Frozen', 2.22, 4.79, '450-500g-Beutel', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Franken Brunnen', 'Mineralwasser versch. Sorten', 'Franken Brunnen Mineral Water various varieties', 'Getränke', 'Beverages', 4.99, 7.99, 'je Ka. 12 x 1-l-PET-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 15: AB DONNERSTAG 09.04. – Obst & Gemüse Frühling ===
('4', 'Kaufland', 'Dtsch. Spargel weiß/violett Kl. II', 'German Asparagus white/violet Cl. II', 'Obst & Gemüse', 'Fruits & Vegetables', 4.99, 7.99, '500g-Bund', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Sanlucar', 'Span. Erdbeeren Kl. I', 'Spanish Strawberries Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, 4.99, '400g-Pack.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Südafrik./ind. Tafeltrauben hell kernlos Kl. I', 'South African/Indian White Seedless Grapes', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, 2.49, '500g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Chin./brasil. Ingwer lose', 'Chinese/Brazilian Ginger loose', 'Obst & Gemüse', 'Fruits & Vegetables', 3.99, 5.99, 'je kg', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Costarican./panam. Wassermelone lose Kl. I', 'Costa Rican/Panamanian Watermelon loose Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, 2.49, 'je kg', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 16: AB DONNERSTAG 09.04. – Obst & Gemüse ===
('4', 'Cameo', 'Dtsch. Tafeläpfel Cameo Coudie süß Kl. I', 'German Cameo Table Apples Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.79, '800g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Chilen./kolumb. Avocado lose Hass Kl. I', 'Chilean/Colombian Hass Avocado loose Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, 1.99, 'Stück', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Südafrik. Passionsfrucht Kl. I', 'South African Passion Fruit Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 2.99, '3-St.-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Span. Orangen Kl. I', 'Spanish Oranges Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 3.79, '1,5-kg-Netz', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Demeter', 'Dominik./kolumb. Bananen lose', 'Demeter Dominican/Colombian Bananas loose', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.49, 'je kg', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'Argent./chilen. Bio-Tafelbirnen Kl. I', 'K-Bio Argentinian/Chilean Organic Pears Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.29, 2.79, '500g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'Ital. Bio-Kiwis Kl. I', 'K-Bio Italian Organic Kiwis Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.79, '3-St.-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 17: AB DONNERSTAG 09.04. – Obst & Gemüse ===
('4', 'Kaufland', 'Dtsch. Möhren Kl. I', 'German Carrots Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.89, 1.29, '1-kg-Schale', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Dtsch. Radieschen oder Lauchzwiebeln Kl. I', 'German Radishes or Spring Onions Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.79, NULL, 'Bund', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Ital. Rucola, Pflücksalat oder Babyspinat Kl. I', 'Italian Rocket, Leaf Salad or Baby Spinach Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.79, 1.29, '125-150g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Dtsch. Cherryrispen-/Miniroma-/Cocktailrispen- oder Rispentomaten Kl. I', 'German Cherry/Mini Roma/Cocktail/Vine Tomatoes', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, 3.99, '200-650g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Dtsch. Speisekartoffeln XXL vorwiegend festkochend oder festkochend', 'German Eating Potatoes XXL', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, NULL, '5-kg-Sack', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 19: AB DONNERSTAG 09.04. – Fleisch / Käse / Molkerei ===
('4', 'Ferdi Fuchs', 'Mini-Würstchen versch. Sorten Geflügel', 'Ferdi Fuchs Mini Sausages Poultry', 'Fleisch & Wurst', 'Meat & Sausage', 1.39, 1.69, '48-130g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Montorsi', 'Ital. Salami in Scheiben Rustico, Spianata Romana oder Milano', 'Montorsi Italian Sliced Salami', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, 3.49, '100g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Philadelphia', 'Frischkäsezubereitung versch. Sorten', 'Philadelphia Cream Cheese Preparation', 'Milchprodukte', 'Dairy', 1.11, 2.29, '100-195g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Ehrmann', 'High Protein Pudding, Drink oder Joghurt versch. Sorten', 'Ehrmann High Protein Pudding, Drink or Yoghurt', 'Milchprodukte', 'Dairy', 0.88, 1.49, '200g-Becher oder 250ml-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Milch-Schnitte', 'Snack Schnitten mit Milchcreme Original oder Pfirsich-Maracuja', 'Milch-Schnitte Milk Cream Snack Original or Peach-Passion Fruit', 'Süßwaren', 'Sweets', 1.99, NULL, '280g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Arla Finello', 'geriebener Käse versch. Sorten 40-42% Fett', 'Arla Finello Grated Cheese various varieties', 'Käse', 'Cheese', 1.29, 2.59, '150g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 20: AB DONNERSTAG 09.04. – Kaffee / Cerealien / Saucen ===
('4', 'Meica', 'Curry King Currywurst versch. Sorten', 'Meica Curry King Curried Sausage various varieties', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.69, '220g-Schale', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Jacobs', 'Löslicher Kaffee 3 in 1 oder 2 in 1', 'Jacobs Instant Coffee 3 in 1 or 2 in 1', 'Kaffee & Tee', 'Coffee & Tea', 1.79, NULL, '120-124g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Nestlé', 'Cerealien Maxi-Pack Lion Karamell und Schokolade oder Cini Minis', 'Nestlé Cereal Maxi-Pack Lion or Cini Minis', 'Frühstück & Cerealien', 'Breakfast & Cereal', 3.99, 5.79, '625-675g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Dallmayr', 'Home Barista Caffè Crema Dolce ganze Bohnen', 'Dallmayr Home Barista Caffe Crema Dolce Whole Beans', 'Kaffee & Tee', 'Coffee & Tea', 12.99, 18.99, '1-kg-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Starbucks', 'Kaffeekapseln für Nespresso-Maschinen versch. Sorten', 'Starbucks Coffee Capsules for Nespresso Machines', 'Kaffee & Tee', 'Coffee & Tea', 3.49, NULL, '10 St. / 53-57g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Tomaten passiert', 'K-Classic Strained Tomatoes', 'Saucen & Gewürze', 'Sauces & Spices', 0.44, NULL, '500g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 21: AB DONNERSTAG 09.04. – Mix Seite ===
('4', 'Knorr', 'Fix versch. Sorten', 'Knorr Fix various varieties', 'Saucen & Gewürze', 'Sauces & Spices', 0.39, 1.19, '28-90g-Beutel', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Merci', 'Lovelies Classic, White oder Creamy', 'Merci Lovelies Classic, White or Creamy', 'Süßwaren', 'Sweets', 2.49, NULL, '185g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Felix', 'Katzennahrung So gut wie es aussieht versch. Sorten', 'Felix Cat Food So Good as it Looks', 'Tierbedarf', 'Pet Supplies', 3.79, NULL, '12 x 85g-Beutel', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Vernel', 'Weichspüler versch. Sorten flüssig', 'Vernel Fabric Softener various varieties liquid', 'Haushalt', 'Household', 1.99, 2.75, '1,012-1,1-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Cashewkerne naturbelassen', 'K-Classic Cashew Nuts natural', 'Snacks & Nüsse', 'Snacks & Nuts', 1.99, 2.89, '200g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Cola, Cola-Mix oder Limonade versch. Sorten', 'K-Classic Cola, Cola-Mix or Lemonade various varieties', 'Getränke', 'Beverages', 0.49, 0.65, '1,5-l-PET-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Powerade', 'Isotonisches Erfrischungsgetränk versch. Sorten', 'Powerade Isotonic Sports Drink various varieties', 'Getränke', 'Beverages', 0.99, NULL, '0,5-l-PET-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Rockstar', 'Energy Drink versch. Sorten', 'Rockstar Energy Drink various varieties', 'Getränke', 'Beverages', 0.79, 1.49, '0,5-l-Dose', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 22: AB DONNERSTAG 09.04. – Getränke & Alkohol ===
('4', 'Capri-Sun', 'Fruchtsaftgetränk versch. Sorten', 'Capri-Sun Fruit Juice Drink various varieties', 'Getränke', 'Beverages', 3.49, 4.29, '10 x 0,2-l-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Grand Sud', 'Franz. Wein Merlot, Merlot Rosé, Chardonnay oder Grenache', 'Grand Sud French Wine Merlot, Rosé, Chardonnay or Grenache', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.49, 4.99, '1-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Deutsches Weintor', 'Qualitätswein Grauer Burgunder oder Dornfelder', 'Deutsches Weintor Quality Wine Pinot Gris or Dornfelder', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.79, NULL, '0,75-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Henkell', 'Sekt trocken oder brut', 'Henkell Sparkling Wine dry or brut', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 5.99, '0,75-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Three Sixty', 'Vodka vierfach destilliert 37,5 Vol.%', 'Three Sixty Vodka quadruple distilled', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.49, NULL, '0,7-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Amecke', 'Plus oder Sanfte Säfte versch. Sorten', 'Amecke Plus or Gentle Juices Fruit Drink', 'Getränke', 'Beverages', 1.99, NULL, '1-l-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Krombacher', 'Pils', 'Krombacher Pils', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, 17.99, 'Ka. 20 x 0,5-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Paulaner', 'Hefe-Weißbier naturtrüb', 'Paulaner Hefeweizen naturally cloudy', 'Alkoholische Getränke', 'Alcoholic Beverages', 13.99, NULL, 'Ka. 20 x 0,5-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 23: WOCHENENDE 10./11.04. ===
('4', 'Kaufland', 'Ecuador./kolumb. Bananen lose', 'Ecuadorian/Colombian Bananas loose', 'Obst & Gemüse', 'Fruits & Vegetables', 0.99, 1.29, 'je kg', '2026-04-10', '2026-04-11', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Marokk. Spitzpaprika rot Kl. I', 'Moroccan Red Pointed Pepper Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, 2.49, '500g-Packg.', '2026-04-10', '2026-04-11', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'Schälrippchen XXL vom Schwein natur', 'K-Purland Pork Spare Ribs XXL natural', 'Fleisch & Wurst', 'Meat & Sausage', 4.39, NULL, 'je kg', '2026-04-10', '2026-04-11', true, 'https://www.kaufland.de'),
('4', 'Lion / Nuts / KitKat', 'Schokoriegel versch. Sorten oder Smarties', 'Lion / Nuts / KitKat Chocolate Bars or Smarties', 'Süßwaren', 'Sweets', 1.69, 2.99, '4-5 St. / 136-166g-Packg.', '2026-04-10', '2026-04-11', true, 'https://www.kaufland.de'),
('4', 'McCain', 'Golden Longs Pommes Frites extra knusprig', 'McCain Golden Longs Extra Crispy Fries', 'Tiefkühl', 'Frozen', 2.49, 4.89, '1-kg-Packg.', '2026-04-10', '2026-04-11', true, 'https://www.kaufland.de'),
('4', 'Weißer Riese', 'Voll- oder Colorwaschmittel', 'Weißer Riese Laundry Detergent', 'Haushalt', 'Household', 10.99, 11.99, 'Großpackung', '2026-04-10', '2026-04-11', true, 'https://www.kaufland.de'),

-- === PAGE 24: WOCHENENDE – Highlights ===
('4', 'Dr. Oetker', 'Bistro belegtes Baguette zum Aufbacken versch. Sorten', 'Dr. Oetker Bistro Baguette to bake various varieties', 'Tiefkühl', 'Frozen', 1.29, 2.29, '2 St. / 250g-Packg.', '2026-04-10', '2026-04-11', true, 'https://www.kaufland.de'),
('4', 'Funny-Frisch', 'Knuspersnack versch. Sorten', 'Funny-Frisch Crispy Snack various varieties', 'Snacks & Nüsse', 'Snacks & Nuts', 0.99, 1.99, '75-100g-Packg.', '2026-04-10', '2026-04-11', true, 'https://www.kaufland.de'),
('4', 'Doppio Passo', 'Primitivo IGT, Grillo DOC oder Alkoholfrei', 'Doppio Passo Primitivo IGT, Grillo DOC or Alcohol-free', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.88, NULL, '0,75-l-Fl.', '2026-04-10', '2026-04-11', true, 'https://www.kaufland.de'),
('4', 'Saint Albray / St. Agur', 'Franz. Weich- oder Schnittkäse versch. Sorten 50-62% Fett', 'Saint Albray / St. Agur French Soft or Semi-hard Cheese', 'Käse', 'Cheese', 1.99, 3.49, '125-180g-Packg.', '2026-04-10', '2026-04-11', true, 'https://www.kaufland.de'),

-- === PAGE 25: XTRA Angebote ===
('4', 'Kaufland', 'Span. Zitronen Kl. I', 'Spanish Lemons Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.39, 0.79, 'Stück', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Wiesenhof', 'Geflügelwurst Mortadella versch. Sorten oder Jagdwurst', 'Wiesenhof Poultry Sausage Mortadella or Hunting Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 0.99, 1.59, '80-100g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Starbucks', 'Kaffeemischgetränk versch. Sorten', 'Starbucks Coffee Drink various varieties', 'Kaffee & Tee', 'Coffee & Tea', 1.39, 2.49, '220ml-Becher', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Giovanni Rana', 'Tradizionali oder Amore di Pesto versch. Sorten', 'Giovanni Rana Tradizionali or Amore di Pesto Pasta', 'Nudeln & Reis', 'Pasta & Rice', 2.49, 3.79, '250g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Gustavo Gusto', 'Pizza versch. Sorten', 'Gustavo Gusto Pizza various varieties', 'Tiefkühl', 'Frozen', 2.99, 4.99, '410-475g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Appel', 'Zarte Heringsfilets in versch. Saucen', 'Appel Tender Herring Fillets in various sauces', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.11, 1.99, '190-200g-Dose', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 26: AB DONNERSTAG 09.04. – Mix Seite ===
('4', 'Doritos', 'Tortilla-Chips versch. Sorten', 'Doritos Tortilla Chips various varieties', 'Snacks & Nüsse', 'Snacks & Nuts', 0.99, 1.99, '110g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Trolli', 'Fruchtgummis versch. Sorten', 'Trolli Fruit Gummies various varieties', 'Süßwaren', 'Sweets', 0.69, 1.09, '150g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Knoppers', 'Goodies knusprige cremig gefüllte Waffelkugeln', 'Knoppers Goodies crispy cream-filled wafer balls', 'Süßwaren', 'Sweets', 1.89, 2.49, '180g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Dr. Oetker', 'Müsli Vitalis oder Paula Müslispaß versch. Sorten', 'Dr. Oetker Vitalis Muesli or Paula Muesli Fun', 'Frühstück & Cerealien', 'Breakfast & Cereal', 1.99, 3.99, '330-600g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Dr. Oetker', 'Backmischung für Cinnamon Rolls, Brookies, Muffins oder Brownies', 'Dr. Oetker Baking Mix for Cinnamon Rolls, Brookies, Muffins or Brownies', 'Grundnahrungsmittel', 'Staples', 1.99, 3.79, '280-462g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Tyskie', 'Premium-Pils', 'Tyskie Premium Pilsner', 'Alkoholische Getränke', 'Alcoholic Beverages', 12.99, 18.99, 'Ka. 20 x 0,5-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Rotwild', 'Dornfelder oder Riesling Qualitätsweine Rheinhessen trocken', 'Rotwild Dornfelder or Riesling Quality Wine Rheinhessen dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.49, 3.99, '0,75-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Bacardi', 'Rum oder Rum-Spirituose 27-37,5 Vol.%', 'Bacardi Rum or Rum Spirit', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, 14.49, '0,7-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Lenor', 'Wäscheparfüm versch. Sorten', 'Lenor Laundry Perfume various varieties', 'Haushalt', 'Household', 5.99, 7.45, '280g-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Purina ONE', 'Katzennahrung versch. Sorten', 'Purina ONE Cat Food various varieties', 'Tierbedarf', 'Pet Supplies', 2.79, 3.89, '750g-Beutel', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 27: AB DONNERSTAG 09.04. – Franken Regional ===
('4', 'Frankenland', 'Frische Vollmilch 3,5% Fett länger haltbar', 'Frankenland Fresh Whole Milk 3.5% Fat', 'Milchprodukte', 'Dairy', 0.99, 1.49, '1-l-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Frankenland', 'Schmand 24% Fett', 'Frankenland Sour Cream 24% Fat', 'Milchprodukte', 'Dairy', 0.99, 1.29, '200g-Becher', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Zimmermann', 'Münchner Weißwürste eine bayerische Spezialität', 'Zimmermann Munich White Sausages Bavarian Specialty', 'Fleisch & Wurst', 'Meat & Sausage', 2.69, NULL, '5 St. / 300g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Settele', 'Eier-Spätzle Knöpfle oder geschabt', 'Settele Egg Spaetzle Knöpfle or scraped', 'Nudeln & Reis', 'Pasta & Rice', 3.33, 4.49, '1-kg-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Coburger', 'Bayr. Landkäse cremig-würziger Weichkäse', 'Coburger Bavarian Country Cheese Soft Cheese', 'Käse', 'Cheese', 2.99, 3.59, '350g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Goldsteig', 'Emmentaler oder Almdammer in hauchdünnen Scheiben 45% Fett', 'Goldsteig Emmentaler or Almdammer wafer-thin slices', 'Käse', 'Cheese', 1.49, 1.99, '125g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 28: AB DONNERSTAG 09.04. – Regional / Wein / Bier ===
('4', 'Houdek', 'Kabanos heißgeräucherte Salamispezialität versch. Sorten', 'Houdek Kabanos Hot-Smoked Salami Speciality', 'Fleisch & Wurst', 'Meat & Sausage', 1.79, NULL, '150g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Mehlig & Heller', 'Hausmacher Spezialitäten Mutter''s Leberwurst, Opa''s Weißer oder Oma''s Roter', 'Mehlig & Heller Homemade Liver/White/Red Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.69, '250g-Glas', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Maintäl', 'Hagebutten-Konfitüre Extra', 'Maintäl Rosehip Jam Extra', 'Brotaufstrich', 'Spreads', 1.69, 2.19, '340g-Glas', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Händlmaier', 'Bayerischer Senf süßer Hausmacher-, Altbayerischer- oder Weißwurst-Senf', 'Händlmaier Bavarian Mustard', 'Saucen & Gewürze', 'Sauces & Spices', 1.49, 1.79, '335ml-Glas', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'GWF', 'Die jungen Frank''n Qualitätswein Franken versch. Sorten', 'GWF Young Franken Quality Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 5.49, '0,75-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Winzer Sommerach', 'Qualitätswein Silvaner, Domina, Bacchus oder Müller-Thurgau Franken', 'Winzer Sommerach Quality Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.99, 7.49, '1-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Paulaner', 'Spezi Orangenlimonade mit Cola', 'Paulaner Spezi Orange Lemonade with Cola', 'Getränke', 'Beverages', 10.99, NULL, 'Ka. 20 x 0,5-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Leikeim', 'Premium-Pils in der Bügelflasche', 'Leikeim Premium Pilsner swing-top bottle', 'Alkoholische Getränke', 'Alcoholic Beverages', 11.99, NULL, 'Ka. 20 x 0,5-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Weltenburger Kloster', 'Hell', 'Weltenburger Kloster Hell Lager', 'Alkoholische Getränke', 'Alcoholic Beverages', 12.99, 17.99, 'Ka. 20 x 0,5-l-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 29: AB DONNERSTAG 09.04. – Snacks ===
('4', 'Funny-Frisch', 'Donuts Knabberringe Erdnüssen süß & salzig', 'Funny-Frisch Donuts Peanut Rings sweet & salty', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, 1.99, '110g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Funny-Frisch', 'Kesselchips, Riffels oder Cheese Cracker versch. Sorten', 'Funny-Frisch Kettle Chips, Riffles or Cheese Crackers', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, NULL, '100-150g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Mister Free''d', 'Tortilla-Chips Cheezie, Blue Maize oder Avocado', 'Mister Free''d Tortilla Chips', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, 2.69, '135g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Gardschips', 'Kartoffelchips Tryffel oder Dill und Parmesan', 'Gardschips Potato Chips Truffle or Dill and Parmesan', 'Snacks & Nüsse', 'Snacks & Nuts', 1.69, NULL, '150g-Beutel', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Lorenz', 'Nic Nac''s ummantelte Erdnüsse versch. Sorten', 'Lorenz Nic Nac''s Coated Peanuts various varieties', 'Snacks & Nüsse', 'Snacks & Nuts', 0.99, 1.11, '110g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Lorenz', 'Erdnuss-Locken versch. Sorten', 'Lorenz Peanut Puffs various varieties', 'Snacks & Nüsse', 'Snacks & Nuts', 1.19, 2.29, '130-175g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Lorenz', 'Naturals Kartoffelchips versch. Sorten', 'Lorenz Naturals Potato Chips various varieties', 'Snacks & Nüsse', 'Snacks & Nuts', 1.59, 2.19, '95g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 30: AB DONNERSTAG 09.04. – Snacks / Nüsse ===
('4', 'K-Classic', 'Kaliforn. Pistazien XXL geröstet und gesalzen', 'K-Classic California Pistachios XXL roasted and salted', 'Snacks & Nüsse', 'Snacks & Nuts', 4.99, NULL, '400g-Großpackg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Cashew-Erdnuss-Mix Honig & Salz oder Hot Chili', 'K-Classic Cashew Peanut Mix Honey & Salt or Hot Chili', 'Snacks & Nüsse', 'Snacks & Nuts', 1.79, NULL, '200g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Ültje', 'Studentenfutter Original mit Rosinen', 'Ültje Student Mix Original with Raisins', 'Snacks & Nüsse', 'Snacks & Nuts', 2.49, 3.49, '200g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'TUC', 'Cracker versch. Sorten', 'TUC Crackers various varieties', 'Snacks & Nüsse', 'Snacks & Nuts', 0.99, 1.11, '100g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
-- FIXED: K-Classic Knuspriger Knabber-Mix had price 1.39 and original_price 1.11 (inverted). Removed invalid original_price.
('4', 'K-Classic', 'Knuspriger Knabber-Mix mit 8 Sorten Knabbergebäck', 'K-Classic Crunchy Snack Mix with 8 types', 'Snacks & Nüsse', 'Snacks & Nuts', 1.39, NULL, '300g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Lorenz', 'Saltletts Sticks Laugensticks mit Meersalz', 'Lorenz Saltletts Pretzel Sticks with Sea Salt', 'Snacks & Nüsse', 'Snacks & Nuts', 1.19, 2.29, '250g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Elephant', 'Knabbergebäck Baked Squeezed Pretzels oder Pretzel Pieces versch. Sorten', 'Elephant Snacks Baked Squeezed Pretzels or Pretzel Pieces', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, 1.99, '125g-Beutel', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Valledoro', 'Grissini Knabberstangen, Saltelli oder Torinesi', 'Valledoro Grissini Bread Sticks', 'Snacks & Nüsse', 'Snacks & Nuts', 1.29, 1.69, '100g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Tottis', 'Mini-Brotchips mit Meersalz oder Knoblauch vegan', 'Tottis Mini Bread Chips with Sea Salt or Garlic', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, 1.79, '250g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Mitsuba', 'Knusprige Snacks von asiatischer Streetfood-Kultur inspiriert versch. Sorten', 'Mitsuba Crispy Asian Street Food Snacks', 'Snacks & Nüsse', 'Snacks & Nuts', 1.99, 2.49, '85-140g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Chio', 'Popcorn versch. Sorten', 'Chio Popcorn various varieties', 'Snacks & Nüsse', 'Snacks & Nuts', 1.11, NULL, '120g-Beutel', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 31: AB DONNERSTAG 09.04. – K-Classic Dairy ===
('4', 'K-Classic', 'Joghurt mild 1,5% Fett oder aus Magermilch 0,1% Fett', 'K-Classic Mild Yoghurt 1.5% or Skimmed 0.1% Fat', 'Milchprodukte', 'Dairy', 0.59, 0.79, '500g-Becher', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Joghurt-Drink 1% Fett versch. Sorten', 'K-Classic Yoghurt Drink 1% Fat various varieties', 'Milchprodukte', 'Dairy', 0.77, 0.95, '500g-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Joghurt griech. Art Honig, Kokos, Salted Caramel oder Kirsch', 'K-Classic Greek Style Yoghurt', 'Milchprodukte', 'Dairy', 1.19, 1.59, '500g-Becher', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Schmelzkäsezubereitung Sahnig mit Gouda oder Kräuter', 'K-Classic Processed Cheese Spread Creamy', 'Käse', 'Cheese', 1.29, 1.59, '200g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Mildura Frischkäsezubereitung versch. Sorten', 'K-Classic Mildura Cream Cheese', 'Käse', 'Cheese', 0.99, 1.19, '175g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Feinkostsalat Kartoffel-, Nudel- oder Krautsalat', 'K-Classic Deli Salad Potato, Pasta or Coleslaw', 'Fertiggerichte', 'Ready Meals', 1.19, 1.49, '400g-Becher', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Rohschinken mild geräuchert fettreduziert und mager', 'K-Classic Raw Ham lightly smoked fat-reduced', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.56, '150g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 32: AB DONNERSTAG 09.04. – K-Classic Staples ===
('4', 'K-Classic', 'Frischer Flammkuchenteig', 'K-Classic Fresh Flammkuchen Dough', 'Grundnahrungsmittel', 'Staples', 1.11, 1.39, '280g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Tortelloni versch. Sorten', 'K-Classic Tortelloni various varieties', 'Nudeln & Reis', 'Pasta & Rice', 0.79, 0.99, '250g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Hähnchen-Knusperdinos paniert', 'K-Classic Chicken Crispy Dinos breaded', 'Tiefkühl', 'Frozen', 2.69, 3.29, '400g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Pastasauce versch. Sorten', 'K-Classic Pasta Sauce various varieties', 'Saucen & Gewürze', 'Sauces & Spices', 1.19, 1.45, '420g-Glas', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Gewürzmischung versch. Sorten', 'K-Classic Spice Mix various varieties', 'Saucen & Gewürze', 'Sauces & Spices', 1.11, 1.59, '35-75g-Dose', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Proteinbrötchen zum Fertigbacken vegan', 'K-Classic Protein Rolls to bake vegan', 'Brot & Backwaren', 'Bread & Bakery', 1.11, 1.39, '4 St. / 300g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Haferflocken zart oder kernig', 'K-Classic Oat Flakes soft or wholegrain', 'Frühstück & Cerealien', 'Breakfast & Cereal', 0.49, 0.69, '500g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Schoko-Röllchen mit Vollmilch- oder Zartbitterschokolade', 'K-Classic Chocolate Rolls', 'Süßwaren', 'Sweets', 1.59, 1.99, '125g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Tomatensaft mit Meersalz und Pfeffer', 'K-Classic Tomato Juice with Sea Salt and Pepper', 'Getränke', 'Beverages', 0.99, 1.29, '1-l-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'Sauerkirschen ohne Stein leicht gezuckert', 'K-Classic Sour Cherries pitted lightly sweetened', 'Grundnahrungsmittel', 'Staples', 2.99, NULL, '680g-Glas', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 33: AB DONNERSTAG 09.04. – K-Bio ===
('4', 'K-Bio', 'Bio-Kochhinterschinken Spitzenqualität', 'K-Bio Organic Cooked Ham top quality', 'Fleisch & Wurst', 'Meat & Sausage', 2.89, NULL, '100g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'Bio-Black-Tiger-Garnelen roh entdarmt', 'K-Bio Organic Black Tiger Prawns raw deveined', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 4.39, NULL, '180g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'Bio-Triangoli oder -Ravioli versch. Sorten', 'K-Bio Organic Triangoli or Ravioli', 'Nudeln & Reis', 'Pasta & Rice', 2.49, NULL, '250g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'Grüne Bio-Oliven ohne Stein griechisch', 'K-Bio Green Organic Olives pitted Greek', 'Grundnahrungsmittel', 'Staples', 1.79, NULL, '350g-Glas', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 34: AB DONNERSTAG 09.04. – K-Bio Fortsetzung ===
('4', 'K-Bio', 'Bio-Hummus classic fein abgeschmeckt vegan', 'K-Bio Organic Hummus Classic vegan', 'Grundnahrungsmittel', 'Staples', 1.29, NULL, '200g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'Bio-Couscous ideal für Salate als Beilage', 'K-Bio Organic Couscous', 'Nudeln & Reis', 'Pasta & Rice', 1.05, NULL, '500g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'Bio-Kichererbsenwaffeln mit Meersalz vegan', 'K-Bio Organic Chickpea Waffles with Sea Salt', 'Snacks & Nüsse', 'Snacks & Nuts', 1.35, NULL, '100g-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'Bio-Tomatenketchup', 'K-Bio Organic Tomato Ketchup', 'Saucen & Gewürze', 'Sauces & Spices', 1.99, NULL, '450ml-Fl.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'Bio-Stieleis Classic mit Bourbon-Vanillecreme', 'K-Bio Organic Classic Ice Cream Bar Bourbon Vanilla', 'Eiscreme', 'Ice Cream', 3.19, NULL, '3 St. / 270ml-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'Bioland Karottensaft mit Zitronensaft', 'K-Bio Bioland Carrot Juice with Lemon', 'Getränke', 'Beverages', 0.85, NULL, '500ml-Packg.', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 35: AB DONNERSTAG 09.04. – Frischetheke Fisch & Käse ===
('4', 'Kaufland', 'Seelachsfilet ohne Haut praktisch grätenfrei', 'Kaufland Pollock Fillet skinless boneless', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.49, NULL, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Steinbeißerfilet weißes festes Fleisch', 'Kaufland Wolffish Fillet', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.79, NULL, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Schwarzer Heilbutt geräucherte Endstücke', 'Kaufland Black Halibut Smoked Tail Pieces', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.19, NULL, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Pikante Florini-Paprika gefüllt mit Frischkäse', 'Kaufland Spicy Florini Peppers stuffed with cream cheese', 'Obst & Gemüse', 'Fruits & Vegetables', 0.89, NULL, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Grüne Oliven mit Basilikum ohne Stein', 'Kaufland Green Olives with Basil pitted', 'Grundnahrungsmittel', 'Staples', 0.99, 1.19, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Heringshappen in Dillcreme', 'Kaufland Herring Bites in Dill Cream', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.19, NULL, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Switzerland', 'Appenzeller mild-würzig schweiz. Schnittkäse 48% Fett', 'Appenzeller mild-spicy Swiss Cheese', 'Käse', 'Cheese', 2.22, NULL, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Cambozola, Montagnolo, Rougette Landkäse oder Fiorella 68-70% Fett', 'Cambozola/Montagnolo/Rougette/Fiorella German Soft Cheese', 'Käse', 'Cheese', 1.99, NULL, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Bonbel', 'Franz. Butterkäse cremig-mild 48% Fett', 'Bonbel French Butter Cheese creamy mild', 'Käse', 'Cheese', 1.99, 2.49, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Käserebellen', 'Österr. Schnitt- oder Hartkäse versch. Sorten 45-50% Fett', 'Käserebellen Austrian Semi-hard or Hard Cheese', 'Käse', 'Cheese', 1.99, NULL, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 36: AB DONNERSTAG 09.04. – Frischetheke Fleisch & Wurst ===
('4', 'Rügenwalder Mühle', 'Teewurst fein oder grob', 'Rügenwalder Mühle Tea Sausage fine or coarse', 'Fleisch & Wurst', 'Meat & Sausage', 1.79, NULL, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Bockwurst im Naturdarm', 'Kaufland Bockwurst in natural casing', 'Fleisch & Wurst', 'Meat & Sausage', 0.99, 1.49, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Krakauer im Ring', 'Kaufland Krakauer Ring Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, NULL, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Wacholderschinken mild geräuchert', 'Kaufland Juniper Ham lightly smoked', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, 1.99, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Neuburger', 'Neuburger österr. Spezialität aus Rind- und Schweinefleisch', 'Neuburger Austrian Speciality from Beef and Pork', 'Fleisch & Wurst', 'Meat & Sausage', 1.79, 2.59, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Steinhaus', 'Krustenbraten saftig und zart', 'Steinhaus Crackling Roast juicy and tender', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '100g', '2026-04-09', '2026-04-15', true, 'https://www.kaufland.de');
