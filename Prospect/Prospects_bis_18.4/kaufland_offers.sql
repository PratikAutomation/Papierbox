DELETE FROM public.offers WHERE store_id = '4' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2 (PDF p.2): Titelseite – AB MONTAG, 13.04.2026 bis 15.04.2026 ===
('4', 'Penny', 'Span./niederl. Paprika gemischt', 'Mixed Bell Peppers', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.79, 'je 500g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', '7 Days', '7 Days Croissants mit Cremefüllung', '7 Days Croissants with Cream Filling', 'Brot & Backwaren', 'Bread & Bakery', 1.69, 2.99, 'je 4 St. = 240g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Aperol', 'Aperol Aperitivo', 'Aperol Aperitif', 'Alkoholische Getränke', 'Alcoholic Beverages', 8.88, 13.99, 'je 0,7-l-Fl.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Stremellachs', 'K-Classic Smoked Salmon Strips', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.59, 3.29, 'je 125g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Müller', 'Müller Milchreis / Kokosmilch-Reis / Grießpudding', 'Müller Rice Pudding / Coconut Rice / Semolina Pudding', 'Milchprodukte', 'Dairy', 0.35, 0.99, 'je 160-200g-Becher', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Palmolive', 'Palmolive Geschirrspülmittel Ultra-Konzentrat', 'Palmolive Dish Soap Ultra Concentrate', 'Haushalt', 'Household', 1.19, 1.75, 'je 500-750ml-Fl.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 3 (PDF p.3): AB MONTAG, 13.04. – Frische, Bäckerei, Käse, Wurst ===
('4', 'Kaufland', 'Chia-Skyr-Brötchen', 'Chia Skyr Bread Rolls', 'Brot & Backwaren', 'Bread & Bakery', 0.29, 0.45, 'je Stück', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Dtsch. Tafeläpfel »Elstar« 2-kg-Beutel', 'German Elstar Apples 2kg bag', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 3.99, 'je 2kg-Beutel', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Bioland dtsch. Zwiebeln', 'K-Bio Bioland German Onions', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, 2.29, 'je 1kg-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Miniromatomatem', 'Mini Roma Tomatoes', 'Obst & Gemüse', 'Fruits & Vegetables', 0.99, 1.49, 'je 250g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Comté AOP', 'Comté AOP Franz. Hartkäse 6 Monate gereift', 'Comté AOP French Hard Cheese 6 months aged', 'Käse', 'Cheese', 1.69, 3.59, 'je 100g', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Schulte', 'Schulte Sportler-Salami fettreduziert', 'Schulte Sport Salami Reduced Fat', 'Fleisch & Wurst', 'Meat & Sausage', 1.19, 2.39, 'je 100g', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Langewiesche', 'Langewiesche Putenbrust mit Paprika', 'Langewiesche Turkey Breast with Paprika', 'Fleisch & Wurst', 'Meat & Sausage', 1.79, NULL, 'je 100g', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Harry', 'Harry Sammy''s Dinkeltoast', 'Harry Sammy''s Spelt Toast', 'Brot & Backwaren', 'Bread & Bakery', 1.79, 2.49, 'je 500g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Salzburg-Milch', 'Salzburg-Milch Österr. Hartkäse Premium Original Bergkäse / Heujuwel', 'Salzburg-Milch Austrian Hard Cheese', 'Käse', 'Cheese', 2.22, 3.29, 'je 250g-Stück', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Rostbratwurst gebrüht', 'K-Classic Grilled Sausages', 'Fleisch & Wurst', 'Meat & Sausage', 2.79, 3.79, 'je 6 St. = 640g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 4 (PDF p.4): AB MONTAG, 13.04. – Tiefkühl, Käse, Fisch ===
('4', 'Iglo', 'Iglo Chicken Nuggets Classic / Safari-Mix / Backteig', 'Iglo Chicken Nuggets Classic / Safari / Batter', 'Tiefkühl', 'Frozen', 2.99, 3.99, 'je 230-250g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Käse-Snacks Gouda-/Bergkäse oder Edamer-/Butterkäse-Würfel', 'K-Classic Cheese Snacks Cubes', 'Käse', 'Cheese', 2.22, 2.69, 'je 220g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Coppenrath & Wiese', 'Coppenrath & Wiese Lust auf Kuchen/Torte', 'Coppenrath & Wiese Cake / Gateau', 'Tiefkühl', 'Frozen', 3.33, 4.99, 'je 360-580g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Frosta', 'Frosta Schlemmerfilet Alaska-Seelachs', 'Frosta Fish Fillet Alaska Pollock', 'Tiefkühl', 'Frozen', 2.79, 4.19, 'je 320-360g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Tarczynski', 'Tarczynski Original Polnische Krakauer', 'Tarczynski Original Polish Krakauer Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 2.79, 3.79, 'je 800g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Milkana', 'Milkana Tolle Rolle / Schmelzkäse-Zubereitung', 'Milkana Cheese Roll / Processed Cheese', 'Käse', 'Cheese', 1.89, NULL, 'je 100-190g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Arla', 'Arla Kaergarden Mischstreichfett', 'Arla Kaergarden Spreadable Butter Blend', 'Butter', 'Butter', 1.59, 2.69, 'je 200g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Heringsfilets in Sauce', 'K-Classic Herring Fillets in Sauce', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.49, 1.99, 'je 400g-Becher', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 5 (PDF p.5): AB MONTAG, 13.04. – Süßwaren, Honig, Kekse ===
('4', 'Langnese', 'Langnese Flotte Biene Honig', 'Langnese Flotte Biene Honey', 'Brotaufstrich', 'Spreads', 2.49, 3.49, 'je 250g-Fl.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Schwartau', 'Schwartau Konfitüre Extra', 'Schwartau Extra Jam', 'Brotaufstrich', 'Spreads', 1.79, 2.99, 'je 280-340g-Glas', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Ferrero', 'Ferrero Küsschen Nusspralinen Classic / Crispy White', 'Ferrero Küsschen Nut Pralines', 'Süßwaren', 'Sweets', 2.79, NULL, 'je 20 St. = 172-178g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Maoam', 'Maoam Kaubonbons Kracher / Pinballs / Happy Fruttis', 'Maoam Chewy Candies', 'Süßwaren', 'Sweets', 0.99, 1.29, 'je 175-200g-Beutel', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Alpia', 'Alpia Schokolade', 'Alpia Chocolate', 'Süßwaren', 'Sweets', 0.99, 1.69, 'je 100g-Tafel', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Nutella', 'Nutella B-Ready Waffeln', 'Nutella B-Ready Wafers', 'Süßwaren', 'Sweets', 1.69, 2.39, 'je 6 St. = 132g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Cookies', 'K-Classic Cookies', 'Süßwaren', 'Sweets', 1.39, 1.79, 'je 200-225g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Leibniz', 'Leibniz Cream Butterkeks mit Cremefüllung', 'Leibniz Cream Butter Biscuits', 'Süßwaren', 'Sweets', 1.49, 2.69, 'je 190-228g-Packg.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 6 (PDF p.6): AB MONTAG, 13.04. – Getränke & Spirits ===
('4', 'Veltins', 'Veltins Pilsener Kasten', 'Veltins Pilsner Beer Crate', 'Alkoholische Getränke', 'Alcoholic Beverages', 11.49, NULL, 'je Ka. 20x0,5-l-Fl.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Johnnie Walker', 'Johnnie Walker Black Label Whisky 40 Vol.%', 'Johnnie Walker Black Label Whisky', 'Alkoholische Getränke', 'Alcoholic Beverages', 19.99, 27.99, 'je 0,7-l-Fl.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Sirup', 'K-Classic Syrup', 'Getränke', 'Beverages', 1.59, 1.99, 'je 0,7-l-Fl.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Mionetto', 'Mionetto Prosecco DOC Treviso brut oder alkoholfrei', 'Mionetto Prosecco DOC Treviso Brut or Non-Alcoholic', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.99, 9.99, 'je 0,75-l-Fl.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),
('4', 'Sierra', 'Sierra Tequila Blanco oder Reposado 35 Vol.%', 'Sierra Tequila Blanco or Reposado', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, 16.99, 'je 0,7-l-Fl.', '2026-04-13', '2026-04-15', true, 'https://www.kaufland.de'),

-- === PAGE 14 (PDF p.14): AB DONNERSTAG, 16.04. – Titelseite ===
('4', 'Kaufland', 'Span./niederl. Cocktailrispentomaten', 'Cocktail Vine Tomatoes', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, 2.99, 'je 500g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Span./ital. Spargel grün', 'Green Asparagus', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, 4.99, 'je 500g-Bund', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Müller', 'Müller Joghurt mit der Ecke 3,8% Fett', 'Müller Corner Yoghurt 3.8% Fat', 'Milchprodukte', 'Dairy', 0.33, 0.89, 'je 113-150g-Becher', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Bayerischer Leberkäse 500g', 'K-Purland Bavarian Meatloaf', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, 3.99, 'je 500g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Herta', 'Herta Finesse Aufschnitt Puten-/Hähnchenbrust oder Schinken', 'Herta Finesse Fine Cut Meats', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, 2.59, 'je 100g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Granini', 'Granini Trinkgenuss Fruchtsaft/-nektar', 'Granini Fruit Juice / Nectar', 'Getränke', 'Beverages', 1.49, 2.69, 'je 1-l-PET-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Funny-Frisch', 'Funny-Frisch Chipsfrisch', 'Funny-Frisch Crisps', 'Snacks & Nüsse', 'Snacks & Nuts', 0.99, 1.99, 'je 150g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Berchtesgadener Land', 'Berchtesgadener Land Haltbare Berg-und Alpen-Milch 3,5% Fett Karton 6x1l', 'Berchtesgadener Land UHT Alpine Milk 3.5% Fat Carton', 'Milchprodukte', 'Dairy', 5.55, NULL, 'je Karton = 6x1-l-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 15 (PDF p.15): AB DONNERSTAG, 16.04. – Obst ===
('4', 'Kaufland', 'Dtsch./ital. Tafeläpfel rot 1-kg-Schale', 'Red Apples 1kg tray', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, 1.99, 'je 1kg-Schale', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Costa-rican. Ananas »Extra Sweet« lose', 'Costa Rican Pineapple Extra Sweet', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.29, 'je Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Peruan. Granatapfel lose', 'Peruvian Pomegranate', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, 1.99, 'je Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Ital. Kiwi lose', 'Italian Kiwi', 'Obst & Gemüse', 'Fruits & Vegetables', 0.39, 0.49, 'je Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 16 (PDF p.16): AB DONNERSTAG, 16.04. – Exotisches Obst ===
('4', 'K-Bio', 'K-Bio Bio-Avocados kenian./peruan.', 'K-Bio Organic Avocados', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 3.49, 'je 2-St.-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Costa-rican. Cantaloupe-Melone lose', 'Cantaloupe Melon', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 2.99, 'je Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Span. Mandarinen Sorte »Nadercott« 1-kg-Netz', 'Spanish Mandarins Nadercott', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 2.99, 'je 1kg-Netz', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Brasil./peruan. Mango »Kent«/»Keitt« lose', 'Brazilian/Peruvian Mango', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.49, 'je Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Südafrik./chilen. Tafeltrauben rot lose', 'Red Table Grapes', 'Obst & Gemüse', 'Fruits & Vegetables', 3.99, 5.99, 'je kg', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Sanlucar', 'Sanlucar Wassermelone/Ananas verzehrfertig', 'Sanlucar Watermelon/Pineapple Ready-to-Eat', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.99, 'je 290-315g-Schale', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 17 (PDF p.17): AB DONNERSTAG, 16.04. – Gemüse ===
('4', 'Kaufland', 'Span./niederl. Aubergine lose', 'Aubergine / Eggplant', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 3.49, 'je kg', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Dtsch. Rhabarber', 'German Rhubarb', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, 4.99, 'je 1kg-Bund', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Poln./dtsch. Kulturchampignons weiß', 'White Mushrooms', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, 2.19, 'je 400g-Schale', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Marokk. Stangenbohnen oder Buschbohnen', 'Moroccan Runner Beans or Bush Beans', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 3.49, 'je 500g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Dtsch. Multicolor-Salat', 'German Multicolour Salad', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, 1.49, 'je Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Parmentine', 'Parmentine franz. Gourmet-Kartoffeln 1,5kg', 'Parmentine French Gourmet Potatoes', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.99, 'je 1,5kg-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 19 (PDF p.19): AB DONNERSTAG, 16.04. – Bäckerei, Avocado, Milchprodukte ===
('4', 'Kaufland', 'Weltmeister-Chia-Krüstchen je Stück', 'Chia Crust Bread Roll', 'Brot & Backwaren', 'Bread & Bakery', 0.35, 0.39, 'je Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Südafrik./peruan. Avocado lose', 'Avocado', 'Obst & Gemüse', 'Fruits & Vegetables', 1.11, 1.49, 'je Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Rama', 'Rama Cremefine oder vegane Creme', 'Rama Cremefine or Vegan Cream', 'Milchprodukte', 'Dairy', 0.89, NULL, 'je 200-250ml-Fl.-Becher', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Bergader', 'Bergader Almzeit oder Bavaria Blu Weichkäse', 'Bergader Almzeit or Bavaria Blue Soft Cheese', 'Käse', 'Cheese', 1.89, NULL, 'je 175g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Weihen Stephan', 'Weihen Stephan Rahmjoghurt 10% Fett', 'Weihen Stephan Full-Fat Yoghurt', 'Milchprodukte', 'Dairy', 0.49, 0.99, 'je 150g-Becher', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Lätta', 'Lätta Brotaufstrich Original / Mit Joghurt / Extra fit', 'Lätta Bread Spread', 'Brotaufstrich', 'Spreads', 1.19, 2.29, 'je 450g-Becher', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Dr. Oetker', 'Dr. Oetker Die Ofenfrische oder Pizza Tradizionale', 'Dr. Oetker Fresh Baked or Tradizionale Pizza', 'Tiefkühl', 'Frozen', 1.88, 3.69, 'je 385-415g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 20 (PDF p.20): AB DONNERSTAG, 16.04. – Aufstrich, Käse, Pasta, Kaffee ===
('4', 'Argeta', 'Argeta Aufstrich', 'Argeta Spread', 'Brotaufstrich', 'Spreads', 1.19, 1.49, 'je 95g-Dose', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Rougette', 'Rougette Ofenkäse', 'Rougette Oven Cheese', 'Käse', 'Cheese', 3.49, 5.99, 'je 320g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Maggi', 'Maggi Würze flüssiges Würzmittel 1-kg-Fl.', 'Maggi Seasoning Sauce 1kg', 'Saucen & Gewürze', 'Sauces & Spices', 3.89, 6.29, 'je 1kg-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Birkel', 'Birkel No.1 Frischei-Nudeln', 'Birkel No.1 Fresh Egg Pasta', 'Nudeln & Reis', 'Pasta & Rice', 0.89, 1.99, 'je 500g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Tassimo', 'Tassimo Kaffee-Kapseln', 'Tassimo Coffee Capsules', 'Kaffee & Tee', 'Coffee & Tea', 3.99, 6.99, 'je 118-268g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Nesquik', 'Nesquik Getränkepulver Original Kakao oder Erdbeer 350g', 'Nesquik Drinking Powder', 'Getränke', 'Beverages', 1.99, NULL, 'je 350g-Beutel', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Vitakraft', 'Vitakraft Poésie Katzen-Nassfutter', 'Vitakraft Poésie Cat Wet Food', 'Tierbedarf', 'Pet Supplies', 0.44, 0.65, 'je 85g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 21 (PDF p.21): AB DONNERSTAG, 16.04. – Schokolade, Süßes ===
('4', 'Toblerone', 'Toblerone Schokolade 100g-Stück', 'Toblerone Chocolate', 'Süßwaren', 'Sweets', 1.79, 2.79, 'je 100g-Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Leibniz', 'Leibniz Choco Butterkeks mit Schokolade', 'Leibniz Choco Butter Biscuit', 'Süßwaren', 'Sweets', 2.22, 3.79, 'je 125g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Haribo', 'Haribo Fruchtgummis oder Lakritze', 'Haribo Fruit Gummies or Liquorice', 'Süßwaren', 'Sweets', 0.79, NULL, 'je 150-175g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kinder / Yogurette', 'Kinder Schokolade oder Yogurette Schokoriegel', 'Kinder Chocolate or Yogurette Chocolate Bar', 'Süßwaren', 'Sweets', 1.11, NULL, 'je 100g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Lindt', 'Lindt Lindor Schokolade', 'Lindt Lindor Chocolate', 'Süßwaren', 'Sweets', 4.99, 6.99, 'je 200g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 22 (PDF p.22): AB DONNERSTAG, 16.04. – Getränke & Bier ===
('4', 'Radeberger', 'Radeberger Pilsner oder Alkoholfrei Kasten', 'Radeberger Pilsner or Non-Alcoholic Beer Crate', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, 17.49, 'je Ka. 20x0,5-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Coca-Cola / Fanta', 'Coca-Cola oder Fanta Erfrischungsgetränk 6-Pack', 'Coca-Cola or Fanta Soft Drink 6-Pack', 'Getränke', 'Beverages', 3.60, 4.49, 'je Packg. 6x0,33-l-PET-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kinder', 'Kinder Joy je 20g-Stück', 'Kinder Joy Chocolate Egg', 'Süßwaren', 'Sweets', 0.99, 1.11, 'je 20g-Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Mönchshof', 'Mönchshof Kellerbier / Naturradler Kasten', 'Mönchshof Cellar Beer / Radler Crate', 'Alkoholische Getränke', 'Alcoholic Beverages', 12.99, 13.99, 'je Ka. 20x0,5-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Erdinger', 'Erdinger Weißbier oder Alkoholfrei Kasten', 'Erdinger Wheat Beer or Non-Alcoholic Crate', 'Alkoholische Getränke', 'Alcoholic Beverages', 13.99, NULL, 'je Ka. 20x0,5-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Effect', 'Effect Energy Drink', 'Effect Energy Drink', 'Getränke', 'Beverages', 0.65, NULL, 'je 0,33-l-Dose', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Freixenet', 'Freixenet Span. Schaumwein / alkoholfrei 0,0 Vol.%', 'Freixenet Spanish Sparkling Wine / Non-Alcoholic', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.88, 6.49, 'je 0,75-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Tekirdag', 'Tekirdag Rakisi Gold Anissspirituose 45 Vol.%', 'Tekirdag Rakisi Gold Anise Spirit', 'Alkoholische Getränke', 'Alcoholic Beverages', 19.99, 29.99, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 23 (PDF p.23): Wochenende 17./18.04. – Sonderangebote ===
('4', 'Kaufland', 'Dtsch. Speisekartoffeln XXL 7,5-kg-Sack', 'German XXL Potatoes 7.5kg sack', 'Obst & Gemüse', 'Fruits & Vegetables', 3.99, NULL, 'je 7,5kg-Sack', '2026-04-17', '2026-04-18', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Griech. Spargel weiß/violett', 'Greek Asparagus White/Purple', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, 5.99, 'je 500g-Bund', '2026-04-17', '2026-04-18', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Schweinebauch XXL ohne Knochen', 'K-Purland Pork Belly XXL Boneless', 'Fleisch & Wurst', 'Meat & Sausage', 5.49, NULL, 'je kg', '2026-04-17', '2026-04-18', true, 'https://www.kaufland.de'),
('4', 'Daily Kitchen', 'Daily Kitchen Hähnchen-Schnitte Cordon Bleu XXL', 'Daily Kitchen Chicken Cordon Bleu XXL', 'Tiefkühl', 'Frozen', 6.49, NULL, 'je 750g-Packg.', '2026-04-17', '2026-04-18', true, 'https://www.kaufland.de'),
('4', 'Hanuta', 'Hanuta Haselnuss-Schnitten 10 St. = 220g', 'Hanuta Hazelnut Wafers', 'Süßwaren', 'Sweets', 1.99, 3.29, 'je 10 St. = 220g-Packg.', '2026-04-17', '2026-04-18', true, 'https://www.kaufland.de'),
('4', 'Häagen-Dazs', 'Häagen-Dazs Eiscreme', 'Häagen-Dazs Ice Cream', 'Eiscreme', 'Ice Cream', 3.33, 6.99, 'je 420-460ml-Becher', '2026-04-17', '2026-04-18', true, 'https://www.kaufland.de'),

-- === PAGE 24 (PDF p.24): AB DONNERSTAG 16.04. – Highlights ===
('4', 'Contessa Carola', 'Contessa Carola Primitivo Puglia IGT Rotwein', 'Contessa Carola Primitivo Puglia IGT Red Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, 9.49, 'je 0,75-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Rapsöl', 'K-Classic Rapeseed Oil', 'Öle & Essig', 'Oils & Vinegar', 1.29, 1.59, 'je 1-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Mutti', 'Mutti Polpa fein gehackte ital. Tomaten', 'Mutti Polpa Finely Chopped Italian Tomatoes', 'Saucen & Gewürze', 'Sauces & Spices', 0.99, 1.99, 'je 400g-Dose', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Jacobs', 'Jacobs Gold löslicher Bohnenkaffee 200g-Glas', 'Jacobs Gold Instant Coffee', 'Kaffee & Tee', 'Coffee & Tea', 5.99, 10.99, 'je 200g-Glas', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 25 (PDF p.25): AB DONNERSTAG 16.04. – XXL Familienpackungen ===
('4', 'K-Purland', 'K-Purland Schweine-nacken/-kamm ohne Knochen', 'K-Purland Pork Neck/Loin Boneless', 'Fleisch & Wurst', 'Meat & Sausage', 5.49, NULL, 'je kg (2-kg-Packg.)', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Reibekäse XXL Emmentaler / Mozzarella / Gouda 500g', 'K-Classic Grated Cheese XXL', 'Käse', 'Cheese', 2.99, NULL, 'je 500g-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Salami geräuchert 240g', 'K-Classic Smoked Salami', 'Fleisch & Wurst', 'Meat & Sausage', 1.69, NULL, 'je 240g-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Schwarzwälder Schinken g.g.A. 250g', 'K-Classic Black Forest Ham', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, NULL, 'je 250g-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Frikadellen 600g', 'K-Classic Meatballs', 'Fleisch & Wurst', 'Meat & Sausage', 3.29, NULL, 'je 600g-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Berlinki', 'Berlinki Würstchen Classic 30 Stück 1,5kg', 'Berlinki Classic Sausages 30-pack', 'Fleisch & Wurst', 'Meat & Sausage', 8.99, NULL, 'je 1,5kg-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Räucherlachs 220g', 'K-Classic Smoked Salmon', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 4.29, NULL, 'je 220g-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Coppenrath & Wiese', 'Coppenrath & Wiese Goldstücke Weizen-/Dinkelbrötchen 10-20 St.', 'Coppenrath & Wiese Golden Buns', 'Brot & Backwaren', 'Bread & Bakery', 2.99, NULL, 'je 700-1000g-Beutel', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Waffelhörnchen Eis 8 St. = 960ml', 'K-Classic Ice Cream Waffle Cones 8-pack', 'Eiscreme', 'Ice Cream', 2.49, NULL, 'je 8 St. = 960ml-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 26 (PDF p.26): AB DONNERSTAG 16.04. – XXL Pasta, Pizza, Getränke ===
('4', 'Hilcona', 'Hilcona Tortelloni oder Gnocchi 750g', 'Hilcona Tortelloni or Gnocchi', 'Nudeln & Reis', 'Pasta & Rice', 2.99, NULL, 'je 750g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Nestlé', 'Nestlé Mix-in Joghurt mit Smarties/Lion/Cereals/KitKat 6-Becher', 'Nestlé Mix-In Yoghurt 6-pack', 'Milchprodukte', 'Dairy', 3.79, NULL, 'je 6x115-120g-Becher', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Haltbare Schlagsahne 3x200g', 'K-Classic Long-Life Whipping Cream 3-pack', 'Milchprodukte', 'Dairy', 1.99, NULL, 'je 3x200g-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Original Wagner', 'Original Wagner Piccolinis 24 Stück = 720g', 'Original Wagner Piccolinis 24-pack', 'Tiefkühl', 'Frozen', 4.49, NULL, 'je 24 St. = 720g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Captain Morgan', 'Captain Morgan Original Spiced Gold Rum 35 Vol.% 1,5-l-Fl.', 'Captain Morgan Spiced Gold Rum 1.5L', 'Alkoholische Getränke', 'Alcoholic Beverages', 19.99, NULL, 'je 1,5-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Frosta', 'Frosta Fertiggericht Hähnchen-Pfanne und weitere', 'Frosta Ready Meal Chicken Pan', 'Tiefkühl', 'Frozen', 3.99, NULL, 'je 800g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Schupfnudeln oder Spätzle 1kg', 'K-Classic Potato Dumplings or Spaetzle 1kg', 'Nudeln & Reis', 'Pasta & Rice', 2.99, NULL, 'je 1kg-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Fischstäbchen 30 St. = 900g', 'K-Classic Fish Fingers 30-pack', 'Tiefkühl', 'Frozen', 3.99, NULL, 'je 30 St. = 900g-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Chicken Nuggets 340g', 'K-Classic Chicken Nuggets', 'Tiefkühl', 'Frozen', 1.99, NULL, 'je 340g-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Pepsi / Schwip Schwap', 'Pepsi oder Schwip Schwap Erfrischungsgetränk 1,75-l-Flasche', 'Pepsi or Schwip Schwap Soft Drink 1.75L', 'Getränke', 'Beverages', 0.99, NULL, 'je 1,75-l-PET-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 27 (PDF p.27): AB DONNERSTAG 16.04. – Nüsse, Nudeln, Snacks ===
('4', 'K-Classic', 'K-Classic Cashewkerne geröstet und gesalzen 250g', 'K-Classic Roasted Salted Cashews', 'Snacks & Nüsse', 'Snacks & Nuts', 2.99, NULL, 'je 250g-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Nuts Royal Edelnuss-Mischung 500g', 'K-Classic Deluxe Nut Mix 500g', 'Snacks & Nüsse', 'Snacks & Nuts', 5.55, NULL, 'je 500g-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Maggi', 'Maggi 5-Minuten-Terrine 76-128g-Becher', 'Maggi 5-Minute Cup Meal', 'Fertiggerichte', 'Ready Meals', 1.29, 1.79, 'je 76-128g-Becher', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Nudeln Spaghetti oder Fusilli 600g', 'K-Classic Pasta Spaghetti or Fusilli 600g', 'Nudeln & Reis', 'Pasta & Rice', 0.69, NULL, 'je 600g-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Hengstenberg', 'Hengstenberg Knax Die Riesen Gewürzgurken 1,55kg-Glas', 'Hengstenberg Knax Giant Pickles', 'Saucen & Gewürze', 'Sauces & Spices', 2.59, NULL, 'je 1,55kg-Glas', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Knoppers', 'Knoppers Minis 18 St. = 200g', 'Knoppers Minis 18-pack', 'Süßwaren', 'Sweets', 1.99, NULL, 'je 18 St. = 200g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Knorr', 'Knorr Salat-Krönung 6-Beutel = 48-54g', 'Knorr Salad Seasoning 6-pack', 'Saucen & Gewürze', 'Sauces & Spices', 0.79, NULL, 'je 6 Btl. = 48-54g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Dr. Oetker', 'Dr. Oetker Original Pudding 4 Btl. = 148g', 'Dr. Oetker Original Pudding Powder 4-pack', 'Grundnahrungsmittel', 'Staples', 0.79, 0.99, 'je 4 Btl. = 148g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Gusto', 'Gusto Snacks z. B. Cheese Balls 300g', 'Gusto Snacks e.g. Cheese Balls', 'Snacks & Nüsse', 'Snacks & Nuts', 2.99, NULL, 'je 300g-Beutel', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 30 (PDF p.30): AB DONNERSTAG 16.04. – K-Bio Sektion ===
('4', 'K-Bio', 'K-Bio Bioland Apfel-Mehrfrucht-Mark', 'K-Bio Bioland Apple Multifruit Puree', 'Grundnahrungsmittel', 'Staples', 0.99, 1.15, 'je 360g-Glas', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Bio / K-Take It Veggie', 'K-Bio oder K-Take It Veggie Bio-Tomatensauce', 'K-Bio Organic Tomato Sauce', 'Saucen & Gewürze', 'Sauces & Spices', 1.19, 1.35, 'je 325-360ml-Glas', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Bio-Tomatenmark 2-fach konzentriert', 'K-Bio Organic Tomato Paste', 'Saucen & Gewürze', 'Sauces & Spices', 0.79, 0.95, 'je 200g-Tube', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Bio-Bacon mild geräuchert 100g', 'K-Bio Organic Bacon', 'Fleisch & Wurst', 'Meat & Sausage', 1.59, 1.99, 'je 100g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Kanad. Bio-Ahornsirup 250ml', 'K-Bio Canadian Organic Maple Syrup', 'Grundnahrungsmittel', 'Staples', 3.33, NULL, 'je 250ml-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Bio-Dinkelmehl Type 630/1050/Vollkorn', 'K-Bio Organic Spelt Flour', 'Grundnahrungsmittel', 'Staples', 1.11, 1.25, 'je 1kg-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Wiltmann', 'Wiltmann Bio-Fleischkäse oder Bio-Geflügel-Lyoner 80g', 'Wiltmann Organic Meatloaf or Poultry Lyoner', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, 2.69, 'je 80g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Andechser Natur', 'Andechser Natur Demeter Joghurt mild 3,8% 800g-Glas', 'Andechser Natur Demeter Mild Yoghurt', 'Milchprodukte', 'Dairy', 1.99, 2.79, 'je 800g-Glas', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 32 (PDF p.32): AB DONNERSTAG 16.04. – K-Bio Hülsenfrüchte, Saft, Wein ===
('4', 'K-Bio', 'K-Bio Bio-Linsen Rote / Grüne / Berglinsen 500g', 'K-Bio Organic Lentils', 'Grundnahrungsmittel', 'Staples', 1.11, 1.45, 'je 500g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Bio-Amaranth ganzes Korn 500g', 'K-Bio Organic Whole Grain Amaranth', 'Grundnahrungsmittel', 'Staples', 1.49, 1.99, 'je 500g-Beutel', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Bio-Gewürze', 'K-Bio Organic Spices', 'Saucen & Gewürze', 'Sauces & Spices', 0.99, 1.29, 'je 15-55g-Glas', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Bio-Apfelessig 0,75-l-Fl.', 'K-Bio Organic Apple Cider Vinegar', 'Öle & Essig', 'Oils & Vinegar', 1.29, 1.55, 'je 0,75-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Bio-Saft Tomaten-/Gemüse-/Frühstückssaft', 'K-Bio Organic Tomato/Vegetable/Breakfast Juice', 'Getränke', 'Beverages', 1.39, NULL, 'je 1-l-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Bio', 'K-Bio Bio-Würzmittel Zitrone oder Limette 200ml', 'K-Bio Organic Lemon or Lime Seasoning', 'Saucen & Gewürze', 'Sauces & Spices', 0.59, NULL, 'je 200ml-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Bio-Dinkelvollkornbrot 500g-Stück', 'Organic Spelt Wholegrain Bread', 'Brot & Backwaren', 'Bread & Bakery', 1.39, 1.89, 'je 500g-Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Little Lunch', 'Little Lunch Bio-Suppe vegetarisch', 'Little Lunch Organic Vegetarian Soup', 'Fertiggerichte', 'Ready Meals', 2.99, 3.79, 'je 350ml-Glas', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Biorebe', 'Biorebe Bio-Pinot-Grigio Venetien 0,75-l-Fl.', 'Biorebe Organic Pinot Grigio', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, NULL, 'je 0,75-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 33 (PDF p.33): AB DONNERSTAG 16.04. – Whisky ===
('4', 'Chivas Regal', 'Chivas Regal Blended Scotch Whisky 12 Jahre 40 Vol.%', 'Chivas Regal 12YO Blended Scotch Whisky', 'Alkoholische Getränke', 'Alcoholic Beverages', 19.99, NULL, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Label 5', 'Label 5 Blended Scotch Whisky 40 Vol.% 1-l-Fl.', 'Label 5 Blended Scotch Whisky 1L', 'Alkoholische Getränke', 'Alcoholic Beverages', 12.99, 15.99, 'je 1-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Glenfiddich', 'Glenfiddich Single Malt Scotch Whisky 12 Jahre 40 Vol.%', 'Glenfiddich 12YO Single Malt Scotch Whisky', 'Alkoholische Getränke', 'Alcoholic Beverages', 29.99, 37.99, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Ardbeg', 'Ardbeg Ten Islay Single Malt Scotch Whisky 10 Jahre 46 Vol.%', 'Ardbeg TEN Islay Single Malt Scotch Whisky', 'Alkoholische Getränke', 'Alcoholic Beverages', 39.99, 54.99, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kilbeggan', 'Kilbeggan Traditional Irish Whiskey 32,5-40 Vol.%', 'Kilbeggan Traditional Irish Whiskey', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, 16.99, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Connemara', 'Connemara Peated Single Malt Irish Whiskey 40 Vol.%', 'Connemara Peated Single Malt Irish Whiskey', 'Alkoholische Getränke', 'Alcoholic Beverages', 19.99, 27.99, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 34 (PDF p.34): AB DONNERSTAG 16.04. – Whisky & Schokolade ===
('4', 'Kentucky Highway', 'Kentucky Highway American Blended Whiskey 40 Vol.%', 'Kentucky Highway American Blended Whiskey', 'Alkoholische Getränke', 'Alcoholic Beverages', 7.49, 8.99, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Jack Daniel''s', 'Jack Daniel''s Single Barrel Select Tennessee Whiskey 45 Vol.%', 'Jack Daniel''s Single Barrel Select Tennessee Whiskey', 'Alkoholische Getränke', 'Alcoholic Beverages', 29.99, 35.99, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Jim Beam', 'Jim Beam Whiskey / Whiskey-Likör Kentucky Straight Bourbon', 'Jim Beam Kentucky Straight Bourbon Whiskey', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, NULL, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Maker''s Mark', 'Maker''s Mark Kentucky Straight Bourbon Whisky 45 Vol.%', 'Maker''s Mark Kentucky Straight Bourbon Whisky', 'Alkoholische Getränke', 'Alcoholic Beverages', 19.99, 27.99, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Favourites', 'K-Favourites Dunkle Schokolade Edelbitter/Edel-Zartbitter 100g', 'K-Favourites Dark Chocolate', 'Süßwaren', 'Sweets', 1.39, 1.75, 'je 100g-Tafel', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'After Eight', 'After Eight Hauchdünne Täfelchen 400g', 'After Eight Mint Chocolate Thins 400g', 'Süßwaren', 'Sweets', 3.99, 7.49, 'je 400g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Walter Gott', 'Walter Gott Ice Cubes oder Crushed Ice 2kg', 'Walter Gott Ice Cubes or Crushed Ice 2kg', 'Tiefkühl', 'Frozen', 0.99, 1.99, 'je 2kg-Beutel', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 35 (PDF p.35): AB DONNERSTAG 16.04. – Fisch & Käse Frischetheke ===
('4', 'Kaufland', 'Rotbarschfilet ohne Haut', 'Redfish Fillet Skinless', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, NULL, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Scholle küchenfertig', 'Plaice Ready-to-Cook', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.69, 2.29, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Regenbogenforelle ausgenommen', 'Rainbow Trout Gutted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.39, NULL, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Sweet Peppacaps Kirschpaprika mit Frischkäsefüllung', 'Sweet Peppacaps Cherry Peppers with Cream Cheese', 'Obst & Gemüse', 'Fruits & Vegetables', 1.59, NULL, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Grüne Peperoni gefüllt mit Thymian-Frischkäse', 'Green Peperoni Stuffed with Thyme Cream Cheese', 'Obst & Gemüse', 'Fruits & Vegetables', 0.99, NULL, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Flusskrebssalat Calvados oder Italia', 'Crayfish Salad Calvados or Italia', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, 2.89, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Hardegger', 'Hardegger Happy Swizz Cheese Schweizer Halbhartkäse', 'Hardegger Happy Swizz Cheese Swiss Semi-Hard', 'Käse', 'Cheese', 1.69, 2.19, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Schweizer Emmentaler AOP 45% Fett i. Tr.', 'Swiss Emmentaler AOP Cheese', 'Käse', 'Cheese', 1.99, NULL, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Alma', 'Alma Vorarlberger Bergkäse Rohmilchkäse 45% Fett i. Tr.', 'Alma Vorarlberger Mountain Cheese', 'Käse', 'Cheese', 1.49, 2.89, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Grünländer', 'Grünländer Dtsch. Schnittkäse 48% Fett i. Tr.', 'Grünländer German Sliced Cheese', 'Käse', 'Cheese', 1.11, NULL, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 36 (PDF p.36): AB DONNERSTAG 16.04. – Frischetheke Wurst ===
('4', 'Rügenwalder Mühle', 'Rügenwalder Mühle Pommersche Gutsleberwurst geräuchert', 'Rügenwalder Mühle Smoked Liver Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, 2.39, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Pick', 'Pick Echt ungar. Salami würzig-aromatisch', 'Pick Authentic Hungarian Salami', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 3.49, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Wiener oder Käsewürstchen knackig im Biss', 'Wiener or Cheese Sausages', 'Fleisch & Wurst', 'Meat & Sausage', 0.88, NULL, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Münnich', 'Münnich Jambon de Paris franz. Kochschinken', 'Münnich Jambon de Paris French Cooked Ham', 'Fleisch & Wurst', 'Meat & Sausage', 1.59, NULL, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Houdek', 'Houdek Kabanos Klassik feinwürzige Salami-Spezialität', 'Houdek Kabanos Classic Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 1.19, NULL, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Nothwang', 'Nothwang Honigschinken mildes Aroma weniger als 3% Fett', 'Nothwang Honey Ham Low Fat', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, 'je 100g', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 37 (PDF p.37): AB DONNERSTAG 16.04. – Fleisch SB ===
('4', 'K-Purland', 'K-Purland Rückensteak Paprika Style 6 St. = 900g', 'K-Purland Pork Neck Steak Paprika Style', 'Fleisch & Wurst', 'Meat & Sausage', 5.79, NULL, 'je 6 St. = 900g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Willms', 'Willms Schnelle Küche Schweinemedaillons 500g', 'Willms Quick Pork Medallions in Cream Sauce', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, 'je 500g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Rinderhackfleisch XXL 1kg zum Braten', 'K-Purland Beef Mince XXL 1kg', 'Fleisch & Wurst', 'Meat & Sausage', 10.39, NULL, 'je 1kg-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 38 (PDF p.38): AB DONNERSTAG 16.04. – Grillfleisch ===
('4', 'Werz', 'Werz Bratwurst-Mix Puszta-Griller/Fränkische Bratwürste 880g', 'Werz Mixed Bratwurst Grilling Pack', 'Fleisch & Wurst', 'Meat & Sausage', 6.49, NULL, 'je 880g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Holzfällerscheiben mariniert 4 Stück 750g', 'K-Purland Lumberjack Pork Steaks Marinated', 'Fleisch & Wurst', 'Meat & Sausage', 4.49, 6.37, 'je 750g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Beck', 'Beck Spanferkel-Grillplatte z.T. mariniert je kg', 'Beck Suckling Pig Grill Platter', 'Fleisch & Wurst', 'Meat & Sausage', 11.99, NULL, 'je kg', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Rinderschmorbraten vom Jungbullen je kg', 'K-Purland Beef Pot Roast', 'Fleisch & Wurst', 'Meat & Sausage', 15.99, NULL, 'je kg', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Saté-Spieße Schweinerücken 400g', 'K-Purland Pork Satay Skewers', 'Fleisch & Wurst', 'Meat & Sausage', 4.79, NULL, 'je 400g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 39 (PDF p.39): AB DONNERSTAG 16.04. – Fleisch K-Purland SB ===
('4', 'K-Purland', 'K-Purland Krustenbraten aus der Schweinehüfte gewürzt je kg', 'K-Purland Pork Rind Roast Seasoned', 'Fleisch & Wurst', 'Meat & Sausage', 4.49, 6.99, 'je kg', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Schweinerücken am Stück je kg', 'K-Purland Pork Loin Whole', 'Fleisch & Wurst', 'Meat & Sausage', 5.49, NULL, 'je kg', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Eisbein XXL vom Schwein je kg', 'K-Purland Pork Knuckle XXL', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, NULL, 'je kg', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Food Fox', 'Food Fox Hähnchen-Innenfilets XXL gegarte Kräuter/Grillsteak 800g', 'Food Fox Chicken Inner Fillets XXL', 'Fleisch & Wurst', 'Meat & Sausage', 7.99, NULL, 'je 800g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 40 (PDF p.40): AB DONNERSTAG 16.04. – Hähnchen & Fisch SB ===
('4', 'K-Purland', 'K-Purland Hähnchen-Schenkel XXL 2kg', 'K-Purland Chicken Legs XXL 2kg', 'Fleisch & Wurst', 'Meat & Sausage', 6.79, NULL, 'je 2kg-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Purland', 'K-Purland Hähnchenflügel XXL 1kg', 'K-Purland Chicken Wings XXL 1kg', 'Fleisch & Wurst', 'Meat & Sausage', 4.49, 5.45, 'je 1kg-Großpackg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Hähnchen-Grillschnitte XXL mariniert Paprika 560g', 'Chicken Grill Slice XXL Paprika Marinated', 'Fleisch & Wurst', 'Meat & Sausage', 4.79, NULL, 'je 560g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Daily Kitchen', 'Daily Kitchen Hähnchen-Mini-Schnitzel XXL Cornflakes-Panade 540g', 'Daily Kitchen Chicken Mini Schnitzel XXL Cornflake Crumb', 'Tiefkühl', 'Frozen', 4.99, NULL, 'je 540g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Blue Bay', 'K-Blue Bay Norweg. Lachsfilet-Portionen mit Haut 500g', 'K-Blue Bay Norwegian Salmon Fillet Portions', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 7.99, NULL, 'je 500g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Tintenfischringe Calamares Style 400g', 'Calamari Rings', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.99, NULL, 'je 400g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 41 (PDF p.41): AB DONNERSTAG 16.04. – Bäckerei ===
('4', 'Kaufland', 'Donut »Schoko« je Stück', 'Chocolate Donut', 'Brot & Backwaren', 'Bread & Bakery', 0.44, 0.55, 'je Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Rosenbrötchen dunkel je Stück', 'Dark Rosette Bread Roll', 'Brot & Backwaren', 'Bread & Bakery', 0.29, NULL, 'je Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 42 (PDF p.42): AB DONNERSTAG 16.04. – Bäckerei ===
('4', 'Kaufland', 'Muffin Yuzu mit Mascarpone- und Limetten-Füllung je Stück', 'Yuzu Muffin with Mascarpone Lime Filling', 'Brot & Backwaren', 'Bread & Bakery', 1.29, NULL, 'je Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Chili-Cheese-Stick Plunderteig je Stück', 'Chili Cheese Puff Pastry Stick', 'Brot & Backwaren', 'Bread & Bakery', 0.99, NULL, 'je Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Kastenweißbrot aus Weizenmehl 750g-Stück', 'White Tin Loaf', 'Brot & Backwaren', 'Bread & Bakery', 1.69, NULL, 'je 750g-Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kaufland', 'Wienerle-Croissant Plunderteighörnchen 79 Cent', 'Wiener Sausage Croissant', 'Brot & Backwaren', 'Bread & Bakery', 0.79, 0.99, 'je Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 43 (PDF p.43): AB DONNERSTAG 16.04. – Wurst, Käse, Tiefkühl ===
('4', 'Heidegrund', 'Heidegrund Fleischwurst 500g', 'Heidegrund Cooked Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.65, 'je 500g-Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Langewiesche', 'Langewiesche Delikatess Spargelschinken 100g', 'Langewiesche Asparagus Ham Deluxe', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.49, 'je 100g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Bierschinken oder Kräuter-Schinkenwurst 150g', 'K-Classic Beer Ham or Herb Ham Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 0.99, NULL, 'je 150g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Goldsteig', 'Goldsteig Protinella Pasta-Filata-Käse 125g', 'Goldsteig Protinella Pasta Filata Cheese', 'Käse', 'Cheese', 0.99, 1.79, 'je 125g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Yayla', 'Yayla Sucuk pikante Knoblauchwurst 100g', 'Yayla Sucuk Spicy Garlic Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 3.19, 'je 100-250g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Juliska', 'Juliska Ungar. Salami mit Edelschimmel 375g', 'Juliska Hungarian Salami with Noble Mould', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 4.99, 'je 375g-Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Jack Link''s', 'Jack Link''s Beef Jerky Original oder Teriyaki 60g', 'Jack Link''s Beef Jerky', 'Snacks & Nüsse', 'Snacks & Nuts', 3.49, NULL, 'je 60g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Salzburg-Milch', 'Salzburg-Milch Bergkäse österr. Premium-Hartkäse 150g', 'Salzburg-Milch Mountain Cheese Premium Hard Cheese', 'Käse', 'Cheese', 1.99, 2.99, 'je 150g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Milram', 'Milram Körniger Frischkäse 10% Fett 200g', 'Milram Cottage Cheese 10% Fat', 'Käse', 'Cheese', 1.29, 1.69, 'je 200g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Loose / Harzbube', 'Loose oder Harzbube Hausmacher Sauermilchkäse mit Kümmel 200g', 'Loose or Harzbube Sour Milk Cheese with Caraway', 'Käse', 'Cheese', 2.29, 2.99, 'je 200g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Dafgards', 'Dafgards Köttbullar oder Falafel 1kg', 'Dafgards Meatballs or Falafel 1kg', 'Tiefkühl', 'Frozen', 6.99, 9.99, 'je 1kg-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Iglo', 'Iglo Gemüse Rahm- / Blattspinnat / Buttergemüse 450-540g', 'Iglo Vegetables Creamed Spinach / Butter Mix', 'Tiefkühl', 'Frozen', 2.39, 3.29, 'je 450-540g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 44 (PDF p.44): AB DONNERSTAG 16.04. – Milch, Dessert, Käse ===
('4', 'Dr. Oetker', 'Dr. Oetker Löffelglück Fruchtgrütze 400g', 'Dr. Oetker Fruit Jelly Dessert 400g', 'Milchprodukte', 'Dairy', 1.99, 2.99, 'je 400g-Becher', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Zott', 'Zott Monte Snack Milchcreme & Schoko-Nuss 8 St. = 232g', 'Zott Monte Snack Milk Cream & Choco-Nut', 'Milchprodukte', 'Dairy', 1.99, 2.99, 'je 8 St. = 232g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Othüna', 'Othüna Kokosfett 250g', 'Othüna Coconut Fat 250g', 'Grundnahrungsmittel', 'Staples', 1.29, 1.59, 'je 250g-Stück', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Exquisa', 'Exquisa Milder Skyr Natur 375-400g', 'Exquisa Mild Skyr Natural', 'Milchprodukte', 'Dairy', 1.49, NULL, 'je 375-400g-Becher', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Homann', 'Homann Feinkostsalat Pellkartoffel-/Nudelsalat 400g', 'Homann Deli Salad Potato/Pasta', 'Fertiggerichte', 'Ready Meals', 1.99, 2.59, 'je 400g-Becher', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'The Vegetarian Butcher', 'The Vegetarian Butcher Crispy Chickimicki Burger 180g', 'The Vegetarian Butcher Crispy Chickimicki Burger', 'Fleischersatz', 'Meat Alternatives', 2.49, 3.49, 'je 180g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kerrygold', 'Kerrygold Extra Butter aus irischer Butter 250g', 'Kerrygold Extra Butter', 'Butter', 'Butter', 1.99, NULL, 'je 250g-Becher', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kathi', 'Kathi Apfelkuchen gedeckter Kuchen 1100g', 'Kathi Apple Cake Covered', 'Süßwaren', 'Sweets', 5.99, 7.99, 'je 1100g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Ferrero', 'Ferrero Raffaelo- oder Rocher-Eis 3 St. = 270ml', 'Ferrero Raffaello or Rocher Ice Cream 3-pack', 'Eiscreme', 'Ice Cream', 2.99, 3.89, 'je 3 St. = 270ml-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 45 (PDF p.45): AB DONNERSTAG 16.04. – Saucen, Öl, Kaffee ===
('4', 'Bull''s-Eye', 'Bull''s-Eye BBQ-Sauce 300ml', 'Bull''s-Eye BBQ Sauce', 'Saucen & Gewürze', 'Sauces & Spices', 1.79, 3.99, 'je 300ml-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Reis-Fit', 'Reis-Fit Spitzen-Langkorn-Reis 650g', 'Reis-Fit Long Grain Rice', 'Nudeln & Reis', 'Pasta & Rice', 1.39, 1.99, 'je 650g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Sauce Hollandaise 300ml', 'K-Classic Hollandaise Sauce', 'Saucen & Gewürze', 'Sauces & Spices', 0.79, NULL, 'je 300ml-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Maggi', 'Maggi Soße 2er-Doppelpack 2x250ml', 'Maggi Gravy Sauce Double Pack', 'Saucen & Gewürze', 'Sauces & Spices', 0.89, 1.49, 'je Doppelpack 2x250ml', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Knorr', 'Knorr Suppenliebe je Packg.', 'Knorr Soup Love Packet', 'Saucen & Gewürze', 'Sauces & Spices', 0.69, NULL, 'je Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Filippo Berio', 'Filippo Berio Natives Olivenöl extra Classico/Fruttato 500ml', 'Filippo Berio Extra Virgin Olive Oil', 'Öle & Essig', 'Oils & Vinegar', 4.99, 7.49, 'je 500ml-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Suntat', 'Suntat Sonnenblumenkerne geröstet und gesalzen 400g', 'Suntat Roasted Salted Sunflower Seeds', 'Snacks & Nüsse', 'Snacks & Nuts', 1.99, 3.29, 'je 400g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'D''Arbo', 'D''Arbo Naturrein Konfitüre Extra 450g', 'D''Arbo Pure Natural Jam Extra', 'Brotaufstrich', 'Spreads', 2.99, 4.09, 'je 450g-Glas', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'K-Classic', 'K-Classic Eintopf Hühnernudel-/Linsen-/Nudeleintopf 800g', 'K-Classic Stew Chicken Noodle/Lentil/Pasta', 'Fertiggerichte', 'Ready Meals', 1.59, 1.89, 'je 800g-Dose', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Dallmayr', 'Dallmayr Classic gemahlener Kaffee 500g', 'Dallmayr Classic Ground Coffee', 'Kaffee & Tee', 'Coffee & Tea', 6.99, 8.99, 'je 500g-Vak.-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 46 (PDF p.46): AB DONNERSTAG 16.04. – Süßes, Brot, Kaffee ===
('4', 'Ferrero', 'Ferrero Rocher- oder Raffaello-Schokolade 90g', 'Ferrero Rocher or Raffaello Chocolate', 'Süßwaren', 'Sweets', 1.79, 2.29, 'je 90g-Tafel', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Kinder', 'Kinder Schoko-Bons 200g', 'Kinder Schoko-Bons 200g', 'Süßwaren', 'Sweets', 2.99, NULL, 'je 200g-Beutel', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Ültje', 'Ültje Erdnüsse geröstet und gesalzen 200g', 'Ültje Roasted Salted Peanuts', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, NULL, 'je 200g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Hosta', 'Hosta Mr. Tom Erdnuss-Karamell-Riegel 3 St. = 120g', 'Hosta Mr. Tom Peanut Caramel Bar 3-pack', 'Süßwaren', 'Sweets', 1.11, NULL, 'je 3 St. = 120g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'IBIS', 'IBIS Sandwich-Baguettes XXL 4 St. = 340g', 'IBIS XXL Sandwich Baguettes 4-pack', 'Brot & Backwaren', 'Bread & Bakery', 1.89, NULL, 'je 4 St. = 340g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Smashed', 'Smashed Bagels Mehrkorn oder Brioche 4 St. = 300g', 'Smashed Bagels Multigrain or Brioche 4-pack', 'Brot & Backwaren', 'Bread & Bakery', 1.59, NULL, 'je 4 St. = 300g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Melitta', 'Melitta Instant-Kaffee Crema Gold 200g-Glas', 'Melitta Instant Coffee Crema Gold', 'Kaffee & Tee', 'Coffee & Tea', 6.99, 10.99, 'je 200g-Glas', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Nescafé', 'Nescafé Farmers Origins Kaffeekapseln 10 St. = 44g', 'Nescafé Farmers Origins Coffee Capsules', 'Kaffee & Tee', 'Coffee & Tea', 2.49, 2.99, 'je 10 St. = 44g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Jacobs', 'Jacobs Crema Kaffeepads 18 St. = 118g', 'Jacobs Crema Coffee Pads', 'Kaffee & Tee', 'Coffee & Tea', 2.29, NULL, 'je 18 St. = 118g-Beutel', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Nescafé', 'Nescafé Iced löslicher Kaffee 95g-Glas', 'Nescafé Iced Instant Coffee', 'Kaffee & Tee', 'Coffee & Tea', 4.99, 6.49, 'je 95g-Glas', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 47 (PDF p.47): AB DONNERSTAG 16.04. – Bier & Getränke ===
('4', 'Jever', 'Jever Pilsener oder Fun Alkoholfrei Kasten 20x0,5l', 'Jever Pilsner or Non-Alcoholic Beer Crate', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, NULL, 'je Ka. 20x0,5-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Almdudler', 'Almdudler Kräuterlimonade 1-l-PET-Fl.', 'Almdudler Herb Lemonade', 'Getränke', 'Beverages', 1.11, 1.79, 'je 1-l-PET-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Vöslauer', 'Vöslauer Erfrischungsgetränk 1-l-PET-Fl.', 'Vöslauer Flavoured Sparkling Water', 'Getränke', 'Beverages', 0.69, NULL, 'je 1-l-PET-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'A''Luna', 'A''Luna Aloe Vera Erfrischungsgetränk 0,5-l-Fl.', 'A''Luna Aloe Vera Drink', 'Getränke', 'Beverages', 0.99, 1.29, 'je 0,5-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Tri Top', 'Tri Top Sirup 0,5-0,6-l-Fl.', 'Tri Top Syrup', 'Getränke', 'Beverages', 2.99, NULL, 'je 0,5-0,6-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Paulaner', 'Paulaner Weißbier-Zitrone alkoholfrei 0,0 Vol.% 6x0,33-l-Fl.', 'Paulaner Wheat Beer Lemon Non-Alcoholic 6-pack', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 5.39, 'je 6x0,33-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Moloko', 'Moloko Erfrischungsgetränk Zitrus-Ingwer-Holunderblüten 0,25-l-Dose', 'Moloko Citrus Ginger Elderflower Drink', 'Getränke', 'Beverages', 0.99, 1.39, 'je 0,25-l-Dose', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Premium Quality', 'Premium Quality Erfrischungsgetränk Tonic Water / Wild Berry etc. 1-l-PET-Fl.', 'Premium Quality Tonic Water / Wild Berry Drink', 'Getränke', 'Beverages', 0.69, 0.89, 'je 1-l-PET-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Carlsberg', 'Carlsberg Premium Lager Beer Kasten 20x0,5l', 'Carlsberg Premium Lager Beer Crate', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.99, 19.99, 'je Ka. 20x0,5-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'San Miguel', 'San Miguel Especial span. Pils Kasten 24x0,33l', 'San Miguel Especial Spanish Pils Crate', 'Alkoholische Getränke', 'Alcoholic Beverages', 11.99, NULL, 'je Ka. 24x0,33-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Spaten', 'Spaten Münchner Hell Kasten 20x0,5l', 'Spaten Munich Lager Crate', 'Alkoholische Getränke', 'Alcoholic Beverages', 13.99, NULL, 'je Ka. 20x0,5-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 48 (PDF p.48): AB DONNERSTAG 16.04. – Wein & Spirituosen ===
('4', 'WZG Möglingen', 'WZG Möglingen Württemberger Rebsortenwein 0,75-l-Fl.', 'WZG Möglingen Württemberg Varietal Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.49, NULL, 'je 0,75-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Mezza Corona', 'Mezza Corona Pinot Grigio / Merlot / Moscato / Chardonnay 0,75-l-Fl.', 'Mezza Corona Italian Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.49, NULL, 'je 0,75-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Fürst von Metternich', 'Fürst von Metternich Sekt Riesling / Chardonnay 0,2-l-Fl.', 'Fürst von Metternich Sparkling Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.99, NULL, 'je 0,2-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Gallo Family', 'Gallo Family Cabernet Sauvignon / Chardonnay / Grenache Rosé 0,75-l-Fl.', 'Gallo Family California Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.44, NULL, 'je 0,75-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Le Filou', 'Le Filou Sweet Frankreich Rotwein 0,75-l-Fl.', 'Le Filou Sweet French Red Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.99, 3.99, 'je 0,75-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Berentzen', 'Berentzen Fruchtiger Likör 15-18 Vol.% 0,7-l-Fl.', 'Berentzen Fruity Liqueur', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, NULL, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Somersby', 'Somersby Cider Apple/Blackberry 0,33-l-Dose', 'Somersby Cider Apple/Blackberry', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.11, 1.49, 'je 0,33-l-Dose', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Gorbatschow / Havana Club', 'Gorbatschow oder Havana Club Alkohol. Mixgetränk 0,33-l-Dose', 'Gorbatschow or Havana Club Mixed Drink Can', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.99, NULL, 'je 0,33-l-Dose', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Gönrgy', 'Gönrgy Energy Drink by MontanaBlack 0,5-l-Dose', 'Gönrgy Energy Drink by MontanaBlack', 'Getränke', 'Beverages', 1.29, NULL, 'je 0,5-l-Dose', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Don Papa', 'Don Papa Baroko Rum 40 Vol.% 0,7-l-Fl.', 'Don Papa Baroko Rum', 'Alkoholische Getränke', 'Alcoholic Beverages', 29.99, NULL, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Metaxa', 'Metaxa 7 Sterne Branntweinspezialität 40 Vol.% 0,7-l-Fl.', 'Metaxa 7 Stars Brandy Specialty', 'Alkoholische Getränke', 'Alcoholic Beverages', 12.99, NULL, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Tanqueray', 'Tanqueray London Dry Gin 43,1 Vol.% 0,7-l-Fl.', 'Tanqueray London Dry Gin', 'Alkoholische Getränke', 'Alcoholic Beverages', 15.99, NULL, 'je 0,7-l-Fl.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 49 (PDF p.49): AB DONNERSTAG 16.04. – Baby & Tierbedarf ===
('4', 'Hipp', 'Hipp Bio-Fruchtbrei versch. Sorten 190g-Glas', 'Hipp Organic Fruit Purée', 'Grundnahrungsmittel', 'Staples', 1.19, 1.45, 'je 190g-Glas', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Hipp', 'Hipp Bio-Combiotik 2 oder 3 Bio-Folgemilch 600g', 'Hipp Bio-Combiotik Follow-On Milk', 'Grundnahrungsmittel', 'Staples', 10.99, 14.75, 'je 600g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),

-- === PAGE 50 (PDF p.50): AB DONNERSTAG 16.04. – Tierbedarf ===
('4', 'Felix', 'Felix Doppelt lecker Katzentrockenfutter 800g', 'Felix Doubly Tasty Dry Cat Food', 'Tierbedarf', 'Pet Supplies', 1.99, NULL, 'je 800g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Whiskas / Kitekat', 'Whiskas oder Kitekat Katzenfutter in Gelee/Sauce', 'Whiskas or Kitekat Cat Food in Jelly/Sauce', 'Tierbedarf', 'Pet Supplies', 11.99, NULL, 'je 40-48x85g-Packg.', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de'),
('4', 'Cesar', 'Cesar Hundenahrung 150g-Schale', 'Cesar Dog Food', 'Tierbedarf', 'Pet Supplies', 0.75, 0.99, 'je 150g-Schale', '2026-04-16', '2026-04-22', true, 'https://www.kaufland.de');
