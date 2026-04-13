DELETE FROM public.offers WHERE store_id = '5' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2: Titelseite / Highlights ===
('5', 'Zott', 'Zott Sahnejoghurt', 'Zott Cream Yoghurt', 'Milchprodukte', 'Dairy', 0.39, 0.99, '140g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Rinder-Hackfleisch zum Braten', 'Beef Mince for Roasting', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, 6.49, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Meggle', 'Meggle Feine Butter oder Joghurtbutter', 'Meggle Fine Butter or Yoghurt Butter', 'Butter', 'Butter', 0.99, 2.59, '250g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Heimat', 'Spargel weiß Deutschland Kl. I', 'White Asparagus Germany Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 4.44, NULL, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Aperol', 'Aperol Aperitivo 11% Vol.', 'Aperol Aperitivo 11% Vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, 13.99, '0,7 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Mövenpick', 'Mövenpick Kaffee ganze Kaffeebohnen', 'Mövenpick Coffee Whole Beans', 'Kaffee & Tee', 'Coffee & Tea', 13.99, 19.49, '1kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Mövenpick', 'Mövenpick Kaffee ganze Kaffeebohnen (Netto App)', 'Mövenpick Coffee Whole Beans (Netto App)', 'Kaffee & Tee', 'Coffee & Tea', 12.99, 19.49, '1kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Leerdammer', 'Leerdammer Käsescheiben versch. Sorten', 'Leerdammer Cheese Slices various', 'Käse', 'Cheese', 1.49, 2.89, '100g-140g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Mönchshof', 'Mönchshof Biere versch. Sorten', 'Mönchshof Beers various', 'Alkoholische Getränke', 'Alcoholic Beverages', 12.99, 17.99, '20x0,5 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 3: Knüller der Woche ===
('5', 'Back Stube', 'Kaiser-, Mohn- oder Sesambrötchen', 'Kaiser, Poppy or Sesame Rolls', 'Brot & Backwaren', 'Bread & Bakery', 1.49, NULL, '7 Stück', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Marken Metzger', 'Marken-Metzger Salami-Sortiment', 'Brand Butcher Salami Assortment', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, NULL, '100g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Coca-Cola', 'Coca-Cola Kombikiste versch. Sorten', 'Coca-Cola Combo Crate various', 'Getränke', 'Beverages', 11.97, 15.99, '12x1 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Coca-Cola', 'Coca-Cola Kombikiste (Netto App 2 Flaschen gratis)', 'Coca-Cola Combo Crate (Netto App 2 bottles free)', 'Getränke', 'Beverages', 8.99, 15.99, '12x1 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Knoppers', 'Knoppers Waffel oder Riegel versch. Sorten', 'Knoppers Wafer or Bar various', 'Süßwaren', 'Sweets', 1.69, 2.49, '200g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Melitta', 'Melitta Auslese, Harmonie oder Barista Kaffee gemahlen', 'Melitta Auslese, Harmonie or Barista Ground Coffee', 'Kaffee & Tee', 'Coffee & Tea', 6.99, NULL, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Melitta', 'Melitta Auslese, Harmonie oder Barista (Netto App)', 'Melitta Auslese, Harmonie or Barista (Netto App)', 'Kaffee & Tee', 'Coffee & Tea', 5.99, 9.29, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Tulpen ca. 35 cm 9er Bund versch. Farben', 'Tulips ca. 35cm bunch of 9 various colours', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, NULL, '9er Bund', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 4: Highlight der Woche ===
('5', 'Mondo Italiano', 'Original Italienische Teigwaren versch. Ausformungen', 'Original Italian Pasta various shapes', 'Nudeln & Reis', 'Pasta & Rice', 0.50, 0.69, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'YumYum', 'YumYum Instant Nudeln versch. Sorten', 'YumYum Instant Noodles various', 'Nudeln & Reis', 'Pasta & Rice', 0.40, 0.69, '10x60g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Thomy', 'Thomy Reines Sonnenblumenöl', 'Thomy Pure Sunflower Oil', 'Öle & Essig', 'Oils & Vinegar', 2.00, 2.99, '3x750ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Maggi', 'Maggi Ravioli in Tomatensauce', 'Maggi Ravioli in Tomato Sauce', 'Fertiggerichte', 'Ready Meals', 1.67, 2.99, '6x800g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 5: Preissenkung / Dauerhaft gesenkt ===
('5', 'Patros', 'Patros FETA versch. Sorten', 'Patros Feta various', 'Käse', 'Cheese', 2.99, 3.29, '150g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'BioBio', 'BioBio Knusper Müsli versch. Sorten', 'BioBio Crunchy Muesli various', 'Frühstück & Cerealien', 'Breakfast & Cereal', 2.65, 2.99, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 9: Obst & Gemüse ===
('5', 'Driscolls', 'Erdbeeren Griechenland/Spanien Kl. I', 'Strawberries Greece/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.69, 2.99, '500g Schale', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Orangen Spanien Kl. I', 'Oranges Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, 3.99, '1,5 kg Netz', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Driscolls', 'Driscoll''s Himbeeren Marokko/Portugal Kl. I', 'Driscoll''s Raspberries Morocco/Portugal Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.22, 3.49, '125g Schale', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Mandarinen Spanien Kl. I', 'Mandarins Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.79, 3.49, '1 kg Netz', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Birnen Belgien/Niederlande Kl. I', 'Pears Belgium/Netherlands Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, 1.79, '1 kg Schale', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Trauben dunkel Brasilien/Südafrika Kl. I', 'Dark Grapes Brazil/South Africa Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.69, 2.19, '500g Schale', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 10: Obst ===
('5', '', 'Wassermelone Costa Rica/Panama Kl. I', 'Watermelon Costa Rica/Panama Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.69, 1.99, '1 kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Avocado Ecuador/Israel Kl. I', 'Avocado Ecuador/Israel Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.59, '500g Netz', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Bananen Costa Rica/Ecuador', 'Bananas Costa Rica/Ecuador', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, NULL, '1 kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'BioBio', 'Bio Bananen Dominikanische Republik/Ecuador', 'Organic Bananas Dominican Republic/Ecuador', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, NULL, '1 kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Chiquita', 'Chiquita Bananen Costa Rica/Ecuador', 'Chiquita Bananas Costa Rica/Ecuador', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, NULL, '1 kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Chiquita', 'Chiquita Mango Peru Kl. I', 'Chiquita Mango Peru Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, NULL, 'Stück', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 11: Obst & Gemüse ===
('5', 'Markt Tag', 'Mini-Romana Salat Spanien Kl. I', 'Mini Romaine Lettuce Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, 1.49, 'Stück', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Kühne', 'Kühne Dressing versch. Sorten', 'Kühne Dressing various', 'Saucen & Gewürze', 'Sauces & Spices', 1.99, 2.49, '500ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Kühne', 'Kühne Salata fertige Salatwürze', 'Kühne Salata Ready Salad Seasoning', 'Saucen & Gewürze', 'Sauces & Spices', 1.11, 1.89, '0,75 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Heimat', 'Lauchzwiebeln Deutschland', 'Spring Onions Germany', 'Obst & Gemüse', 'Fruits & Vegetables', 0.69, 0.99, 'Stück', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Speisefrühkartoffeln Ägypten festkochend', 'New Potatoes Egypt firm', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, 3.49, '2 kg Netz', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Champignon braun Polen Kl. I', 'Brown Mushrooms Poland Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, 2.19, '400g Schale', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Paprika-Mix Niederlande/Spanien Kl. I', 'Peppers Mix Netherlands/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.29, 2.99, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Erdnüsse Ägypten', 'Peanuts Egypt', 'Snacks & Nüsse', 'Snacks & Nuts', 2.22, 2.49, '400g Beutel', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 13: Dienstags-Kracher (gültig am 14.04.26) ===
('5', '', 'Heidelbeeren Spanien Kl. I', 'Blueberries Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, NULL, '125g Schale', '2026-04-14', '2026-04-14', true, 'https://www.netto-online.de'),

-- === PAGE 14: Mittwochs-Kracher (gültig am 15.04.26) ===
('5', 'Heimat', 'Rhabarber Deutschland Kl. I', 'Rhubarb Germany Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, NULL, '750g Bund', '2026-04-15', '2026-04-15', true, 'https://www.netto-online.de'),

-- === PAGE 15: Fleisch ===
('5', '', 'Schweine-Bauch ohne Knochen vakuumverpackt', 'Pork Belly boneless vacuum packed', 'Fleisch & Wurst', 'Meat & Sausage', 5.49, 9.99, '1 kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Cevapcici aus Rind- und Schweinefleisch', 'Cevapcici Beef and Pork', 'Fleisch & Wurst', 'Meat & Sausage', 6.99, NULL, '800g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Cevapcici (Netto App)', 'Cevapcici (Netto App)', 'Fleisch & Wurst', 'Meat & Sausage', 6.29, 7.99, '800g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Hähnchen-Geschnetzeltes natur', 'Chicken Strips natural', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 4.99, '400g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Hähnchen-Brustfilet mager', 'Chicken Breast Fillet lean', 'Fleisch & Wurst', 'Meat & Sausage', 5.19, 6.79, '600g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Brust vom Irischen Weiderind pro 100g', 'Irish Grass-Fed Beef Breast per 100g', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, 1.79, '100g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Hähnchen-Minutenschnitzel paniert', 'Breaded Chicken Minute Schnitzel', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, 5.99, '800g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Schweine-Schinkenbraten aus der Nuss vakuumverpackt', 'Pork Ham Roast vacuum packed', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, 7.49, '1 kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Schweine-Schälrippen vakuumverpackt', 'Pork Spare Ribs vacuum packed', 'Fleisch & Wurst', 'Meat & Sausage', 4.79, 6.49, '1 kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 16: Fleisch & Wurst ===
('5', 'Hofmaier', 'Geflügelmortadella versch. Sorten', 'Poultry Mortadella various', 'Fleisch & Wurst', 'Meat & Sausage', 1.11, 1.29, '200g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Hofmaier', 'Kochhinterschinken', 'Cooked Ham', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, 1.49, '200g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Hofmaier', 'Lachsschinken versch. Sorten', 'Salmon Ham various', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.39, '150g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Hofmaier', 'Wiener Würstchen über Buchenholz geräuchert', 'Wiener Sausages beech-smoked', 'Fleisch & Wurst', 'Meat & Sausage', 2.69, 2.99, '2x200g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Hofmaier', 'Leberwurst oder Teewurst versch. Sorten', 'Liver Sausage or Tea Sausage various', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, NULL, '125g-175g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'American Style', 'Rinder-Burger, Chicken-Burger oder Hot-Dog', 'Beef Burger, Chicken Burger or Hot Dog', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, NULL, '2x100g-150g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Bacon milder Frühstücksspeck geräuchert', 'Bacon mild breakfast rasher smoked', 'Fleisch & Wurst', 'Meat & Sausage', 1.19, NULL, '100g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Bacon milder Frühstücksspeck (Netto App)', 'Bacon mild breakfast rasher (Netto App)', 'Fleisch & Wurst', 'Meat & Sausage', 0.99, 1.39, '100g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Snack It', 'Snack It Kabanossi to go versch. Sorten', 'Snack It Kabanossi to go various', 'Fleisch & Wurst', 'Meat & Sausage', 0.99, NULL, '50g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 17: Milch & Kühlregal ===
('5', 'Henglein', 'Henglein Gnocchi gekühlt versch. Sorten', 'Henglein Gnocchi chilled various', 'Fertiggerichte', 'Ready Meals', 1.49, 2.99, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Müller', 'Müller Doppeldecker oder Wackelpudding gekühlt', 'Müller Double Decker or Jelly Pudding chilled', 'Milchprodukte', 'Dairy', 1.00, 1.59, '4x125g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Rama', 'Rama Cremefine gekühlt versch. Sorten', 'Rama Cremefine chilled various', 'Milchprodukte', 'Dairy', 1.00, 1.49, '200ml-250ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Dr. Oetker', 'Dr. Oetker Wölkchen versch. Sorten', 'Dr. Oetker Wölkchen various', 'Milchprodukte', 'Dairy', 0.59, 0.79, '125g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Kinder', 'Kinder Choco fresh oder Paradiso gekühlt', 'Kinder Choco Fresh or Paradiso chilled', 'Süßwaren', 'Sweets', 1.69, 2.19, '5x20,5g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Chocomel', 'Chocomel gekühlt', 'Chocomel chilled', 'Getränke', 'Beverages', 1.00, 1.39, '300ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Gutes Land', 'Gutes Land Speisequark Magerstufe 0,2% Fett', 'Gutes Land Quark skimmed 0.2% fat', 'Milchprodukte', 'Dairy', 0.89, 0.99, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Bauer', 'Bauer Yo&Go Trinkjoghurt versch. Sorten', 'Bauer Yo&Go Drinking Yoghurt various', 'Milchprodukte', 'Dairy', 0.59, 0.99, '211ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Knack & Back', 'Knack & Back Sonntagsbrötchen oder Croissants gekühlt', 'Knack & Back Sunday Rolls or Croissants chilled', 'Brot & Backwaren', 'Bread & Bakery', 1.79, 2.49, '240g-400g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 18: Tiefkühl & Käse ===
('5', 'Coppenrath & Wiese', 'Coppenrath & Wiese Kuchen Vielfalt tiefgekühlt', 'Coppenrath & Wiese Cake Variety frozen', 'Tiefkühl', 'Frozen', 5.99, 8.99, '700g-810g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Hähnchen Gyros oder Kebab tiefgekühlt', 'Chicken Gyros or Kebab frozen', 'Tiefkühl', 'Frozen', 5.99, 7.45, '750g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Sea Gold', 'Schlemmerfilet tiefgekühlt versch. Sorten', 'Sea Gold Fish Fillet frozen various', 'Tiefkühl', 'Frozen', 2.22, 2.49, '400g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'St. Mang', 'St. Mang Limburger oder Rubius versch. Sorten', 'St. Mang Limburger or Rubius various', 'Käse', 'Cheese', 1.99, 2.99, '180g-200g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Alpenhain', 'Alpenhain Obazda oder Camembert Creme versch. Sorten', 'Alpenhain Obazda or Camembert Cream various', 'Käse', 'Cheese', 1.49, 2.29, '125g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Altenburger', 'Der Grüne Altenburger Ziegenkäse versch. Sorten', 'The Green Altenburger Goat Cheese various', 'Käse', 'Cheese', 2.29, 2.99, '150g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Gutes Land', 'Emmentaler gerieben XXL', 'Grated Emmental XXL', 'Käse', 'Cheese', 3.33, NULL, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Popp', 'Popp Baked Potatoes XXL tiefgekühlt', 'Popp Baked Potatoes XXL frozen', 'Tiefkühl', 'Frozen', 2.55, NULL, '650g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Sea Gold', 'Party Garnelen XXL tiefgekühlt', 'Party Prawns XXL frozen', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.69, NULL, '150g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Italpizza', 'Italpizza Numero Uno tiefgekühlt versch. Sorten', 'Italpizza Numero Uno frozen various', 'Tiefkühl', 'Frozen', 2.29, 3.69, '410g-440g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Italpizza', 'Italpizza Numero Uno (Netto App)', 'Italpizza Numero Uno (Netto App)', 'Tiefkühl', 'Frozen', 1.99, 3.69, '410g-440g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 19: Frühstück & Kaffee ===
('5', 'Lieblings', 'Lieblings Herzwaffeln versch. Sorten', 'Lieblings Heart Waffles various', 'Brot & Backwaren', 'Bread & Bakery', 1.49, 1.79, '165g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Krüger', 'Krüger Cappuccino versch. Sorten', 'Krüger Cappuccino various', 'Kaffee & Tee', 'Coffee & Tea', 2.99, 4.99, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Tchibo', 'Tchibo Feine Milde versch. Sorten', 'Tchibo Fine Mild various', 'Kaffee & Tee', 'Coffee & Tea', 7.99, 9.99, '2x250g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Meßmer', 'Meßmer Kräuter- oder Früchtetee versch. Sorten', 'Meßmer Herb or Fruit Tea various', 'Kaffee & Tee', 'Coffee & Tea', 1.49, 2.35, '37,5g-75g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Coppenrath & Wiese', 'Coppenrath & Wiese Brötchen XXL tiefgekühlt', 'Coppenrath & Wiese Rolls XXL frozen', 'Tiefkühl', 'Frozen', 2.99, 4.59, '0,7kg-1kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Gutes Land', 'Gutes Land Naturjoghurt 3,5% Fett', 'Gutes Land Natural Yoghurt 3.5% fat', 'Milchprodukte', 'Dairy', 0.79, 0.89, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Gutes Land', 'Frischkäse Ringe Ananas-Mandel versch. Sorten', 'Cream Cheese Rings Pineapple-Almond various', 'Käse', 'Cheese', 1.49, NULL, '125g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Nestlé', 'Nestlé Cerealien versch. Sorten', 'Nestlé Cereals various', 'Frühstück & Cerealien', 'Breakfast & Cereal', 2.49, 3.79, '200g-400g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 20: Brot & Backwaren ===
('5', 'Back Stube', 'Donut Pistazie', 'Pistachio Donut', 'Brot & Backwaren', 'Bread & Bakery', 0.79, NULL, 'Stück', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Buttercroissant', 'Butter Croissant', 'Brot & Backwaren', 'Bread & Bakery', 1.00, 1.47, '3 Stück', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Weißbrot', 'White Bread', 'Brot & Backwaren', 'Bread & Bakery', 1.29, 1.59, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Weizenmischbrot', 'Wheat Mixed Bread', 'Brot & Backwaren', 'Bread & Bakery', 0.89, 0.99, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Blaubeer Vanillestange', 'Blueberry Vanilla Stick', 'Brot & Backwaren', 'Bread & Bakery', 0.99, NULL, 'Stück', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Laugenstange mit Käse', 'Pretzel Stick with Cheese', 'Brot & Backwaren', 'Bread & Bakery', 1.00, 1.18, '2 Stück', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Geflügelrolle', 'Poultry Roll', 'Brot & Backwaren', 'Bread & Bakery', 1.52, 2.58, '2 Stück', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 21: Fleisch BBQ ===
('5', '', 'Hähnchen-Minutensteaks in Skyr-Style-Marinade', 'Chicken Minute Steaks Skyr Marinade', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 4.99, '400g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Schweine-Bauchscheiben trocken gewürzt', 'Pork Belly Slices dry-spiced', 'Fleisch & Wurst', 'Meat & Sausage', 3.33, 3.99, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Puten-Minutensteaks versch. mariniert', 'Turkey Minute Steaks various marinades', 'Fleisch & Wurst', 'Meat & Sausage', 4.29, 5.49, '400g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Wolfs', 'Mini Rostbratwürstchen grob gebrüht', 'Mini Rostbratwurst coarsely blanched', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, 2.79, '300g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Emmentaler Käse-Bockwurst', 'Emmental Cheese Bockwurst', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, 2.99, '2x200g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Wiesenhof', 'Wiesenhof Bruzzzler würzig', 'Wiesenhof Bruzzzler spicy', 'Fleisch & Wurst', 'Meat & Sausage', 3.79, 4.99, '400g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Feinschmecker Frikadellen in der Pfanne gebraten', 'Gourmet Meatballs pan-fried', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, 2.79, '300g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 22: Loaded Fries / Burger ===
('5', 'Block House', 'Block House American Burger Patties tiefgekühlt', 'Block House American Burger Patties frozen', 'Tiefkühl', 'Frozen', 6.99, 10.99, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Block House', 'Block House Brioche Buns', 'Block House Brioche Buns', 'Brot & Backwaren', 'Bread & Bakery', 1.49, 1.99, '160g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Papa Joe''s', 'Papa Joe''s Mayonnaise Spezialitäten versch. Sorten', 'Papa Joe''s Mayonnaise Specialities various', 'Saucen & Gewürze', 'Sauces & Spices', 1.49, 2.49, '300ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Papa Joe''s', 'Papa Joe''s Mayonnaise Spezialitäten (Netto App)', 'Papa Joe''s Mayonnaise Specialities (Netto App)', 'Saucen & Gewürze', 'Sauces & Spices', 0.99, 2.49, '300ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'McCain', 'MC Cain Frites tiefgekühlt versch. Sorten', 'McCain Fries frozen various', 'Tiefkühl', 'Frozen', 1.49, 2.79, '1,013 kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Rupp', 'Rupp Schmelzkäsescheiben Toast-Burger gekühlt', 'Rupp Processed Cheese Slices Toast-Burger chilled', 'Käse', 'Cheese', 1.79, NULL, '200g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Beste Ernte', 'Burgergurken', 'Burger Gherkins', 'Saucen & Gewürze', 'Sauces & Spices', 0.79, NULL, '185g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Papa Joe''s', 'Papa Joe''s Tomaten Ketchup oder Mayonnaise versch. Sorten', 'Papa Joe''s Tomato Ketchup or Mayonnaise various', 'Saucen & Gewürze', 'Sauces & Spices', 2.99, NULL, '500ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 23: Gemüse BBQ ===
('5', '', 'Spargel grün Italien/Spanien Kl. I', 'Green Asparagus Italy/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 3.49, 4.99, '400g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Auberginen Niederlande/Spanien Kl. I', 'Aubergines Netherlands/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.89, 1.29, 'Stück', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Zuckermais vakuumiert vorgegart', 'Sweetcorn vacuum pre-cooked', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, 1.99, '400g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Cocktail Rispentomaten Italien/Spanien Kl. I', 'Cocktail Vine Tomatoes Italy/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, 3.49, '500g Schale', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Zucchini Marokko/Spanien Kl. I', 'Courgettes Morocco/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.99, '1 kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 24: Grillbeilagen ===
('5', 'Genuss Welt', 'Beilagensalat gekühlt versch. Sorten', 'Side Salad chilled various', 'Fertiggerichte', 'Ready Meals', 2.22, 2.49, '0,9kg-1kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Billie Green', 'Billie Green vegane Bratwurst gekühlt versch. Sorten', 'Billie Green Vegan Bratwurst chilled various', 'Fleischersatz', 'Meat Alternatives', 2.49, 3.29, '180g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Kühne', 'Kühne Feinkostsaucen versch. Sorten', 'Kühne Gourmet Sauces various', 'Saucen & Gewürze', 'Sauces & Spices', 0.99, 1.69, '250ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Peperoni Baguette', 'Pepperoni Baguette', 'Brot & Backwaren', 'Bread & Bakery', 1.19, 1.39, '310g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Peperoni Baguette (Netto App)', 'Pepperoni Baguette (Netto App)', 'Brot & Backwaren', 'Bread & Bakery', 0.69, 1.39, '310g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Bautz''ner', 'Bautz''ner Senf mittelscharf', 'Bautz''ner Mustard medium hot', 'Saucen & Gewürze', 'Sauces & Spices', 0.79, NULL, '200ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Salatkönig', 'Salatkönig Tzaziki oder Kartoffelcreme gekühlt', 'Salatkönig Tzatziki or Potato Cream chilled', 'Saucen & Gewürze', 'Sauces & Spices', 1.69, NULL, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 25: BioBio ===
('5', 'BioBio', 'Bio Natives Olivenöl Extra', 'Organic Extra Virgin Olive Oil', 'Öle & Essig', 'Oils & Vinegar', 6.95, NULL, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'BioBio', 'Bio Tomatenketchup', 'Organic Tomato Ketchup', 'Saucen & Gewürze', 'Sauces & Spices', 2.29, NULL, '500ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'BioBio', 'Bio Salatkernemix', 'Organic Mixed Salad Seeds', 'Snacks & Nüsse', 'Snacks & Nuts', 1.65, NULL, '275g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'BioBio', 'Bio Dinkelbrot', 'Organic Spelt Bread', 'Brot & Backwaren', 'Bread & Bakery', 1.99, NULL, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'BioBio', 'Bio Antipasti versch. Sorten', 'Organic Antipasti various', 'Saucen & Gewürze', 'Sauces & Spices', 2.55, NULL, '180g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 26: BioBio Bio-Fleisch & Fisch ===
('5', 'BioBio', 'Bio Nürnberger Rostbratwurst gebrüht', 'Organic Nuremberg Rostbratwurst', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, NULL, '250g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'BioBio', 'Bio Norwegisches Lachsfilet tiefgekühlt ohne Haut', 'Organic Norwegian Salmon Fillet frozen skinless', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 5.59, NULL, '200g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'BioBio', 'Bio Hähnchen-Schenkelsteaks gewürzt', 'Organic Chicken Thigh Steaks seasoned', 'Fleisch & Wurst', 'Meat & Sausage', 6.49, NULL, '350g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'BioBio', 'Bio Tofu gekühlt versch. Sorten', 'Organic Tofu chilled various', 'Fleischersatz', 'Meat Alternatives', 2.49, NULL, '350g-400g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'BioBio', 'Bio Feta gekühlt', 'Organic Feta chilled', 'Käse', 'Cheese', 2.79, NULL, '200g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 27: Neu im Sortiment / Grillkäse ===
('5', 'Barbecue', 'Grill Weichkäse gekühlt versch. Sorten', 'Grill Soft Cheese chilled various', 'Käse', 'Cheese', 2.49, NULL, '200g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Barbecue', 'Grillkäse gekühlt versch. Sorten', 'Grilling Cheese chilled various', 'Käse', 'Cheese', 1.99, NULL, '150g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Genuss Welt', 'Laugenbaguette gekühlt', 'Pretzel Baguette chilled', 'Brot & Backwaren', 'Bread & Bakery', 1.29, NULL, '175g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Sangria arom. weinhaltiges Getränk', 'Sangria flavoured wine-based drink', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.99, NULL, '1,5 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Vinetti', 'Vinetti Spritz versch. Sorten arom. weinhaltiger Cocktail', 'Vinetti Spritz various aromatised wine cocktail', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.89, NULL, '0,75 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 28: BBQ Fleisch Dauertiefpreis ===
('5', '', 'Schweine-Nackensteaks Pfeffer-Marinade', 'Pork Neck Steaks Pepper Marinade', 'Fleisch & Wurst', 'Meat & Sausage', 4.95, NULL, '600g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Kupfer', 'Bratwurstschnecke gebrüht', 'Bratwurst Snail blanched', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '180g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Hähnchen-Minutensteaks in Paprika-Marinade', 'Chicken Minute Steaks Paprika Marinade', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, '400g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Hähnchen-Grillspieße in Joghurt-Paprika-Marinade', 'Chicken Grill Skewers Yoghurt Paprika Marinade', 'Fleisch & Wurst', 'Meat & Sausage', 4.49, NULL, '300g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Hähnchen-Grillfackeln aus der Oberkeule gewürzt', 'Chicken Grill Torches from thigh seasoned', 'Fleisch & Wurst', 'Meat & Sausage', 4.49, NULL, '400g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Mini Geflügelbratwurst', 'Mini Poultry Bratwurst', 'Fleisch & Wurst', 'Meat & Sausage', 3.49, NULL, '350g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 31: Exklusive Angebote Kassenbereich ===
('5', 'Katlenburger', 'Katlenburger Tropica Fruchtwein-Cocktail versch. Sorten', 'Katlenburger Tropica Fruit Wine Cocktail various', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.99, NULL, '0,75 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 32: Wein des Monats April ===
('5', 'Eslizón', 'Eslizón Garnacha Viñas Viejas', 'Eslizón Garnacha Old Vines', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, 6.99, '0,75 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'TorreSanta', 'TorreSanta Moscato IGT', 'TorreSanta Moscato IGT', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, 5.99, '0,75 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Ferrovieri', 'Ferrovieri Montepulciano d''Abruzzo DOC', 'Ferrovieri Montepulciano d''Abruzzo DOC', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 4.99, '0,75 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Torre Santa', 'Torre Santa Weine versch. Sorten', 'Torre Santa Wines various', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, NULL, '6x0,75 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 33: Snacks & Süßwaren ===
('5', 'Lorenz', 'Lorenz ErdnußLocken versch. Sorten', 'Lorenz Peanut Puffs various', 'Snacks & Nüsse', 'Snacks & Nuts', 1.11, 2.29, '150g-175g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Clarkys', 'Erdnüsse geröstet und gesalzen versch. Sorten', 'Peanuts roasted and salted various', 'Snacks & Nüsse', 'Snacks & Nuts', 1.99, NULL, '500g-550g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Crunchips', 'Crunchips Stackers versch. Sorten', 'Crunchips Stackers various', 'Snacks & Nüsse', 'Snacks & Nuts', 1.99, 2.49, '175g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Milka', 'Milka Schokolade versch. Sorten', 'Milka Chocolate various', 'Süßwaren', 'Sweets', 1.11, NULL, '87g-95g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Milka', 'Milka Schokolade (Netto App)', 'Milka Chocolate (Netto App)', 'Süßwaren', 'Sweets', 0.99, 1.99, '87g-95g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Nestlé', 'Nestlé Riegel versch. Sorten', 'Nestlé Bar various', 'Süßwaren', 'Sweets', 1.99, 2.99, '150g-166g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Ritter Sport', 'Ritter Sport Rum +25%', 'Ritter Sport Rum +25%', 'Süßwaren', 'Sweets', 2.99, 4.29, '250g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Trolli', 'Trolli Sweet Barbecue Party Fruchtgummi-Minis', 'Trolli Sweet Barbecue Party Fruit Gummy Minis', 'Süßwaren', 'Sweets', 2.99, 3.99, '360g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Kinder', 'Kinder Schokolade oder Yogurette', 'Kinder Chocolate or Yogurette', 'Süßwaren', 'Sweets', 4.99, 6.75, '400g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 34: Getränke ===
('5', 'Somersby', 'Somersby Sparkling Cider versch. Sorten', 'Somersby Sparkling Cider various', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.29, 1.59, '0,33 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Salitos', 'Salitos versch. Sorten', 'Salitos various', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.19, 1.69, '0,5 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Grey', 'Grey Grauburgunder Qualitätswein', 'Grey Pinot Gris Quality Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 4.99, '0,75 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Tyskie', 'Tyskie versch. Sorten', 'Tyskie various', 'Alkoholische Getränke', 'Alcoholic Beverages', 0.79, 1.19, '0,5 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Weinschorle weiß oder rosé 1 Liter', 'Wine Spritzer white or rosé 1 Litre', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.29, 1.69, '1 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Warsteiner', 'Warsteiner Premium Pilsener', 'Warsteiner Premium Pilsener', 'Alkoholische Getränke', 'Alcoholic Beverages', 11.99, NULL, '20x0,5 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 39: Getränke zur Grillparty ===
('5', 'Lipton', 'Lipton Eistee versch. Sorten', 'Lipton Ice Tea various', 'Getränke', 'Beverages', 1.29, 1.69, '1,25 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Fanta', 'Fanta, Sprite oder Mezzo Mix versch. Sorten', 'Fanta, Sprite or Mezzo Mix various', 'Getränke', 'Beverages', 1.19, 1.59, '1,25 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Monster', 'Monster Energy Drink versch. Sorten', 'Monster Energy Drink various', 'Getränke', 'Beverages', 1.00, 1.49, '0,5 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Monster', 'Monster Energy Drink (Netto App)', 'Monster Energy Drink (Netto App)', 'Getränke', 'Beverages', 0.79, 1.49, '0,5 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Ready to Drink versch. Sorten 10% Vol.', 'Ready to Drink various 10% Vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.39, 1.69, '0,33 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'StarDrink', 'StarDrink Schorle oder Frucht G'' Spritzer versch. Sorten', 'StarDrink Spritzer or Fruit Spritzer various', 'Getränke', 'Beverages', 2.99, NULL, '9x0,5 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Capri-Sun', 'Capri-Sun versch. Sorten', 'Capri-Sun various', 'Getränke', 'Beverages', 3.29, 4.29, '10x0,2 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Capri-Sun', 'Capri-Sun (Netto App)', 'Capri-Sun (Netto App)', 'Getränke', 'Beverages', 3.29, 4.29, '10x0,2 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Coca-Cola', 'Coca-Cola koffeinhaltig versch. Sorten', 'Coca-Cola caffeinated various', 'Getränke', 'Beverages', 8.99, 9.99, '18x0,33 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 40: Alkohol ===
('5', 'Mönchshof', 'Mönchshof Maibock', 'Mönchshof Maibock', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.49, 4.99, '4x0,5 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Zirndorfer', 'Zirndorfer Landbier oder Kellerbier Naturtrüb', 'Zirndorfer Country Beer or Cellar Beer', 'Alkoholische Getränke', 'Alcoholic Beverages', 11.99, 15.99, '20x0,5 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Anheuser Busch', 'Anheuser Busch Bud', 'Anheuser Busch Bud', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, 5.99, '6x0,3 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Cellini', 'Cellini Grappa oder Crema versch. Sorten', 'Cellini Grappa or Cream various', 'Alkoholische Getränke', 'Alcoholic Beverages', 8.99, NULL, '0,7 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Havana Club', 'Havana Club 3 Anos oder Especial 37,5% Vol.', 'Havana Club 3 Anos or Especial 37.5% Vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, NULL, '0,7 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Three Sixty', 'Three Sixty Vodka 37,5% Vol.', 'Three Sixty Vodka 37.5% Vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, NULL, '0,7 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Three Sixty', 'Three Sixty Vodka (Netto App)', 'Three Sixty Vodka (Netto App)', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, NULL, '0,7 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 41: Tierbedarf & Haushalt ===
('5', 'Gourmet', 'Gourmet Gold oder Perle versch. Sorten', 'Gourmet Gold or Perle various', 'Tierbedarf', 'Pet Supplies', 9.49, 14.49, '24x85g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Gourmet', 'Gourmet Gold oder Perle (Netto App)', 'Gourmet Gold or Perle (Netto App)', 'Tierbedarf', 'Pet Supplies', 9.49, 14.49, '24x85g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Felix', 'Felix Snacks / Play Tubes versch. Sorten', 'Felix Snacks / Play Tubes various', 'Tierbedarf', 'Pet Supplies', 2.99, NULL, '180g-200g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Pablo', 'Pablo Schweineohren', 'Pablo Pigs Ears', 'Tierbedarf', 'Pet Supplies', 4.99, 5.99, '300g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 55: Do-Fr-Sa Angebote ===
('5', 'Storck', 'Storck Toffifee', 'Storck Toffifee', 'Süßwaren', 'Sweets', 4.99, 5.95, '625g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Storck', 'Storck Toffifee (Netto App)', 'Storck Toffifee (Netto App)', 'Süßwaren', 'Sweets', 4.49, 5.95, '625g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Schweine-Rücken ohne Knochen vakuumverpackt', 'Pork Loin boneless vacuum packed', 'Fleisch & Wurst', 'Meat & Sausage', 4.79, 6.49, '1 kg', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Lätta', 'Lätta versch. Sorten', 'Lätta various', 'Brotaufstrich', 'Spreads', 1.19, 2.29, '450g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Sancho', 'Sancho Hundefutter versch. Sorten', 'Sancho Dog Food various', 'Tierbedarf', 'Pet Supplies', 7.00, 8.94, '6x1240g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 56: Super Wochenende (Do 16.04 – Sa 18.04) ===
('5', '', 'Gurken Niederlande/Spanien Kl. I', 'Cucumbers Netherlands/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.44, 0.59, 'Stück', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Cafèt', 'Cafèt Cafe Latte gekühlt versch. Sorten', 'Cafèt Cafe Latte chilled various', 'Milchprodukte', 'Dairy', 6.00, 7.50, '10x250ml', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Chicken Wings oder Drumsticks tiefgekühlt versch. Sorten', 'Chicken Wings or Drumsticks frozen various', 'Tiefkühl', 'Frozen', 10.00, 13.47, '3x750g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Chantré', 'Chantré Weinbrand 36% Vol.', 'Chantré Brandy 36% Vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.99, NULL, '0,7 Liter', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Bad Kissinger', 'Bad Kissinger Mineralwasser versch. Sorten', 'Bad Kissinger Mineral Water various', 'Getränke', 'Beverages', 3.99, NULL, '12x0,75 Liter', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Philadelphia', 'Philadelphia Frischkäse Zubereitung versch. Sorten', 'Philadelphia Cream Cheese Preparation various', 'Käse', 'Cheese', 2.29, NULL, '195g-200g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Philadelphia', 'Philadelphia Frischkäse 2er (Netto App)', 'Philadelphia Cream Cheese 2-pack (Netto App)', 'Käse', 'Cheese', 2.29, NULL, '2er Pack', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 57: XXL Sparen Super Wochenende ===
('5', '', 'Heidelbeeren Marokko/Spanien Kl. I', 'Blueberries Morocco/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 3.49, 4.44, '300g Schale', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Minipflaumen Tomaten Marokko/Spanien Kl. I', 'Mini Plum Tomatoes Morocco/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 4.99, 5.99, '1 kg Schale', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Zitronen Italien/Spanien Kl. I', 'Lemons Italy/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 2.99, '1 kg Netz', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Heimat', 'Äpfel Deutschland Kl. II', 'Apples Germany Cl. II', 'Obst & Gemüse', 'Fruits & Vegetables', 3.99, 4.99, '5 kg Karton', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Heimat', 'Zwiebeln Deutschland Kl. II', 'Onions Germany Cl. II', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.49, '3 kg Sack', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Heimat', 'Möhren Deutschland/Niederlande Kl. I', 'Carrots Germany/Netherlands Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, 1.69, '2 kg Beutel', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 58: Fleisch Super Wochenende ===
('5', 'Hofmaier', 'Geflügelfleischwurst', 'Poultry Meat Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 2.29, 2.69, '500g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Puten-Keule ganz vakuumverpackt Hkl. A', 'Turkey Leg whole vacuum packed Hkl. A', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, 5.99, '1 kg', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Käsekrainer mit Emmentaler Käse', 'Cheese Krainer with Emmental', 'Fleisch & Wurst', 'Meat & Sausage', 3.49, 4.49, '2x200g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Hintereisbein / Hinterhaxe vom Schwein vakuumverpackt', 'Pork Knuckle vacuum packed', 'Fleisch & Wurst', 'Meat & Sausage', 3.49, 4.99, '1 kg', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Hofmaier', 'Hähnchenbrustfilet-Roulade versch. Sorten', 'Chicken Breast Fillet Roulade various', 'Fleisch & Wurst', 'Meat & Sausage', 1.89, 2.19, '150g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Hähnchen-Schenkel mit Rückenstück natur Hkl. A', 'Chicken Leg with Back natural Hkl. A', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 5.29, '1,1 kg', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Hofmaier', 'Cabanossi gebrüht geräuchert', 'Cabanossi blanched smoked', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, NULL, '300g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Regenbogen-Forelle küchenfertig ausgenommen ca. 500g', 'Rainbow Trout kitchen-ready gutted ca. 500g', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 4.49, NULL, '100g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 59: Kühlregal Super Wochenende ===
('5', 'Landliebe', 'Landliebe H-Milch 3,5% und 1,5%', 'Landliebe UHT Milk 3.5% and 1.5%', 'Milchprodukte', 'Dairy', 1.00, NULL, '1 Liter', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Wagner', 'Wagner Backfrische Pizza tiefgekühlt versch. Sorten', 'Wagner Stone Oven Pizza frozen various', 'Tiefkühl', 'Frozen', 1.99, 3.49, '320g-360g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Bürger', 'Bürger Maultaschen gekühlt versch. Sorten', 'Bürger Maultaschen chilled various', 'Fertiggerichte', 'Ready Meals', 3.33, 4.58, '2x300g-360g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Homann', 'Homann Schinken-Lauchsalat oder Budapester Salat', 'Homann Ham-Leek Salad or Budapest Salad', 'Fertiggerichte', 'Ready Meals', 1.79, 1.99, '200g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Fruchtzwerge versch. Sorten', 'Fruchtzwerge various', 'Milchprodukte', 'Dairy', 1.99, 2.89, '4x100g / 8x50g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Mövenpick', 'Mövenpick Feinjoghurt oder Sahnepudding versch. Sorten', 'Mövenpick Fine Yoghurt or Cream Pudding various', 'Milchprodukte', 'Dairy', 0.69, 0.99, '150g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Zott', 'Zottarella Minis versch. Sorten', 'Zottarella Mozzarella Minis various', 'Käse', 'Cheese', 1.69, 2.29, '125g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 60: Markenstars Super Wochenende ===
('5', 'Knoppers', 'Knoppers Goodies', 'Knoppers Goodies', 'Süßwaren', 'Sweets', 1.99, 2.49, '180g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Milky Way, Snickers oder Mars Brotaufstrich', 'Milky Way, Snickers or Mars Spread', 'Brotaufstrich', 'Spreads', 3.49, 4.69, '350g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Raffaello', 'Raffaello', 'Raffaello', 'Süßwaren', 'Sweets', 3.49, NULL, '230g-260g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Raffaello', 'Raffaello (Netto App)', 'Raffaello (Netto App)', 'Süßwaren', 'Sweets', 2.99, 4.29, '230g-260g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Oreo', 'Oreo und Milka Mini Donuts', 'Oreo and Milka Mini Donuts', 'Süßwaren', 'Sweets', 2.99, 3.49, '144g-152g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Maggi', 'Maggi 5 Minuten Terrine versch. Sorten', 'Maggi 5 Minute Terrine various', 'Fertiggerichte', 'Ready Meals', 1.00, 1.49, '41g-64g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Oreo', 'Oreo Kekse versch. Sorten', 'Oreo Cookies various', 'Süßwaren', 'Sweets', 1.49, NULL, '154g-157g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Oreo', 'Oreo Kekse (Netto App)', 'Oreo Cookies (Netto App)', 'Süßwaren', 'Sweets', 1.29, 1.89, '154g-157g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Magnum', 'Magnum Stieleis tiefgekühlt versch. Sorten', 'Magnum Ice Cream frozen various', 'Eiscreme', 'Ice Cream', 3.99, NULL, '600ml', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Oro di Parma', 'Oro di Parma Tomaten Passata versch. Sorten', 'Oro di Parma Tomato Passata various', 'Saucen & Gewürze', 'Sauces & Spices', 0.99, NULL, '700g', '2026-04-16', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 62: Freitags alles zum 1/2 Preis (17.04.26) ===
('5', '', 'Kalbsbraten aus der Kugel mager', 'Veal Roast from the round lean', 'Fleisch & Wurst', 'Meat & Sausage', 1.69, 3.38, '100g', '2026-04-17', '2026-04-17', true, 'https://www.netto-online.de'),
('5', 'MM', 'MM Extra Sekt versch. Sorten', 'MM Extra Sparkling Wine various', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.19, NULL, '0,75 Liter', '2026-04-17', '2026-04-17', true, 'https://www.netto-online.de'),
('5', 'Volvic', 'Volvic Naturelle Mineralwasser', 'Volvic Still Natural Mineral Water', 'Getränke', 'Beverages', 2.75, NULL, '6x1,5 Liter', '2026-04-17', '2026-04-17', true, 'https://www.netto-online.de'),

-- === PAGE 63: Samstags-Kracher (18.04.26) ===
('5', '', 'Mais-Hähnchen ganz Hkl. A ca. 1,4 kg', 'Corn Chicken whole Hkl. A ca. 1.4 kg', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 5.49, '1 kg', '2026-04-18', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Südzucker', 'Südzucker Feiner Rüben Zucker', 'Südzucker Fine Beet Sugar', 'Grundnahrungsmittel', 'Staples', 0.66, 0.99, '1kg-1,1kg', '2026-04-18', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Heimat', 'Speisekartoffeln Deutschland', 'Potatoes Germany', 'Obst & Gemüse', 'Fruits & Vegetables', 4.44, 6.99, '10 kg Sack', '2026-04-18', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Nescafé', 'Nescafé Classic löslicher Bohnenkaffee versch. Sorten', 'Nescafé Classic Instant Coffee various', 'Kaffee & Tee', 'Coffee & Tea', 4.44, 8.99, '200g', '2026-04-18', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Bayreuther', 'Bayreuther Hell oder Alkoholfrei', 'Bayreuther Light or Alcohol-free', 'Alkoholische Getränke', 'Alcoholic Beverages', 12.99, 19.99, '20x0,5 Liter', '2026-04-18', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Rougette', 'Rougette Grill- oder Ofenkäse versch. Sorten', 'Rougette Grill or Oven Cheese various', 'Käse', 'Cheese', 2.22, NULL, '180g', '2026-04-18', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Rougette', 'Rougette Grill- oder Ofenkäse (Netto App)', 'Rougette Grill or Oven Cheese (Netto App)', 'Käse', 'Cheese', 1.99, 2.29, '180g', '2026-04-18', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 65: Dauerhaft gesenkt – Konfitüre & Kaffee ===
('5', 'Gutes Land', 'Konfitüre Extra versch. Sorten', 'Extra Jam various', 'Brotaufstrich', 'Spreads', 1.79, 1.99, '450g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Cafèt', 'Cafèt Kaffee Crema Gold ganze Bohnen', 'Cafèt Crema Gold Coffee Whole Beans', 'Kaffee & Tee', 'Coffee & Tea', 12.99, 14.99, '1 kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 66: Dauerhaft gesenkt – Wein & Spirituosen ===
('5', '', 'Riesling trocken Qualitätswein', 'Riesling dry Quality Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.79, 2.89, '1 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Mosel/Rheinhessen Qualitätswein', 'Mosel/Rheinhessen Quality Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.49, 2.79, '1 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', '', 'Müller-Thurgau Qualitätswein', 'Müller-Thurgau Quality Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.29, 2.39, '1 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Old House', 'Old House No.1 Blended Scotch Whisky 40% Vol.', 'Old House No.1 Blended Scotch Whisky 40% Vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 7.99, 8.29, '0,7 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Schloss Herrenbrunn', 'Schloss Herrenbrunn Sekt halbtrocken', 'Schloss Herrenbrunn Sparkling Wine semi-dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.99, 3.29, '3x0,2 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Villa am Weinberg', 'Villa am Weinberg Dornfelder Rosé Qualitätswein', 'Villa am Weinberg Dornfelder Rosé Quality Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.19, 2.29, '0,75 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 67: Dauerhaft gesenkt – Cafèt Kaffee ===
('5', 'Cafèt', 'Cafèt Kaffee Extra gemahlen', 'Cafèt Coffee Extra ground', 'Kaffee & Tee', 'Coffee & Tea', 4.99, 5.49, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Cafèt', 'Cafèt Naturmild verschiedene Sorten', 'Cafèt Naturmild various', 'Kaffee & Tee', 'Coffee & Tea', 5.99, 6.49, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Cafèt', 'Cafèt Der Beste Kaffee gemahlen', 'Cafèt The Best Ground Coffee', 'Kaffee & Tee', 'Coffee & Tea', 6.99, 7.59, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Cafèt', 'Cafèt Kaffeepads versch. Sorten', 'Cafèt Coffee Pads various', 'Kaffee & Tee', 'Coffee & Tea', 5.19, 5.39, '280g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Cafèt', 'Cafèt Crema Gustoso ganze Bohnen', 'Cafèt Crema Gustoso Whole Beans', 'Kaffee & Tee', 'Coffee & Tea', 10.99, 11.99, '1 kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Cafèt', 'Cafèt Caffè Crema & Aroma ganze Bohnen', 'Cafèt Caffè Crema & Aroma Whole Beans', 'Kaffee & Tee', 'Coffee & Tea', 11.99, 12.99, '1 kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),

-- === PAGE 68: Dauerhaft gesenkt – Dessert & Eis ===
('5', 'Grandiso', 'Grandiso High Protein Grießpudding Pur oder Zimt', 'Grandiso High Protein Semolina Pudding Plain or Cinnamon', 'Milchprodukte', 'Dairy', 1.59, 1.69, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Gutes Land', 'Gutes Land Buttermilch-Dessert versch. Sorten', 'Gutes Land Buttermilk Dessert various', 'Milchprodukte', 'Dairy', 0.59, 0.65, '200g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Grandiso', 'Grandiso Grütze versch. Sorten', 'Grandiso Fruit Jelly various', 'Milchprodukte', 'Dairy', 4.59, 4.79, '1 kg', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Lieblings', 'Lieblings Sahnepudding versch. Sorten', 'Lieblings Cream Pudding various', 'Milchprodukte', 'Dairy', 1.39, 1.79, '500g', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'ICE', 'Big Choc tiefgekühlt versch. Sorten', 'Big Choc frozen various', 'Eiscreme', 'Ice Cream', 2.99, 3.29, '600ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'Ramseier', 'Ramseier Eis versch. Sorten', 'Ramseier Ice Cream various', 'Eiscreme', 'Ice Cream', 1.89, 1.99, '1 Liter', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'ICE', 'Waffelhörnchen tiefgekühlt versch. Sorten', 'Waffle Cones frozen various', 'Eiscreme', 'Ice Cream', 1.99, 2.19, '720ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de'),
('5', 'ICE', 'Mini Choc tiefgekühlt versch. Sorten', 'Mini Choc frozen various', 'Eiscreme', 'Ice Cream', 2.99, 3.49, '600ml', '2026-04-13', '2026-04-18', true, 'https://www.netto-online.de');
