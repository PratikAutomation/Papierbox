DELETE FROM public.offers WHERE store_id = '2' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2: Cover Di. 7.4. - Sa. 11.4. ===
('2', 'Farmer Naturel', 'Farmer Naturel Pinienkerne', 'Farmer Naturel Pine Nuts', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, 2.49, '50g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 5: Obst & Gemüse Di. 7.4. - Sa. 11.4. ===
('2', 'Eigenmarke', 'Rispentomaten lose Niederlande/Spanien Klasse I', 'Vine Tomatoes loose Netherlands/Spain Class I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.39, NULL, 'kg', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Spargel mild/weiß-violett Deutschland Klasse II 400g', 'Asparagus mild/white-violet Germany Class II 400g', 'Obst & Gemüse', 'Fruits & Vegetables', 4.39, 5.99, '400g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Speisekartoffeln festkochend 1,5kg Netz', 'Potatoes waxy 1.5kg Net', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, 1.85, '1.5kg', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Porree Deutschland Klasse I Stück', 'Leek Germany Class I piece', 'Obst & Gemüse', 'Fruits & Vegetables', 0.59, NULL, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Rucola Italien Klasse I 125g Schale', 'Rocket Italy Class I 125g Tray', 'Obst & Gemüse', 'Fruits & Vegetables', 0.66, 0.89, '125g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Erdbeeren Klasse I 300g Schale', 'Strawberries Class I 300g Tray', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, NULL, '300g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 6: Fleisch Di. 7.4. - Sa. 11.4. ===
('2', 'Meine Metzgerei', 'Meine Metzgerei Grillbauchscheiben vom Schwein gewürzt 400g', 'My Butcher Grilled Pork Belly Slices seasoned 400g', 'Fleisch & Wurst', 'Meat & Sausage', 3.19, 3.99, '400g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Meine Metzgerei', 'Meine Metzgerei Hähnchenbrustfilet Teilstücke 600g', 'My Butcher Chicken Breast Fillet Pieces 600g', 'Fleisch & Wurst', 'Meat & Sausage', 5.19, NULL, '600g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Nur Nur Natur Bio-Land-Hähnchen-Flügel versch. Sorten 350g', 'Nur Nur Natur Organic Free-range Chicken Wings assorted 350g', 'Fleisch & Wurst', 'Meat & Sausage', 2.39, 2.99, '350g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Meine Metzgerei', 'Meine Metzgerei Hähnchen-Schenkel mit Rückenstück XXL 2kg', 'My Butcher Chicken Legs with Back XXL 2kg', 'Fleisch & Wurst', 'Meat & Sausage', 6.99, NULL, '2kg', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Bio', 'Bio-Hamburger vom Rind küchenfertig 300g', 'Organic Beef Burger ready-to-cook 300g', 'Fleisch & Wurst', 'Meat & Sausage', 3.39, 3.99, '300g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'BBQ Hähnchen-Ministeaks versch. Sorten mariniert 400g', 'BBQ Chicken Mini Steaks assorted marinated 400g', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 4.99, '400g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Bio', 'Bio-Steak vom Rind versch. Sorten ca. 200-255g', 'Organic Beef Steak assorted ca. 200-255g', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, 7.65, '255g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Grobe Bratwurst vom Schwein oder Rind ca. 400g', 'Coarse Bratwurst Pork or Beef ca. 400g', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.59, '400g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 7: Haushalt Power Force Di. 7.4. - Sa. 11.4. ===
('2', 'Power Force', 'Power Force Topf- oder Geschirr-Reiniger 3er-/6er-Packung', 'Power Force Pot or Dish Cleaner 3/6-pack', 'Haushalt', 'Household', 0.45, 0.65, '3/6 Stück', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Power Force', 'Power Force Feuchte Allzwecktücher versch. Sorten 80er-Packung', 'Power Force Moist All-purpose Wipes assorted 80-pack', 'Haushalt', 'Household', 0.79, 1.49, '80 Stück', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Power Force', 'Power Force Universal- oder Fenstertuch mit Mikrofaser', 'Power Force Universal or Window Cloth with Microfibre', 'Haushalt', 'Household', 0.49, 0.99, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Power Force', 'Power Force Müllbeutel mit Tragegriffen 25L 50er-Packung', 'Power Force Bin Bags with Handles 25L 50-pack', 'Haushalt', 'Household', 0.59, 0.99, '50 Stück', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Power Force', 'Power Force Schwammtücher Luft-getrocknet', 'Power Force Sponge Cloths Air-dried', 'Haushalt', 'Household', 4.79, 6.99, '10 Stück', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Power Force', 'Power Force Nitril-Einmalhandschuhe versch. Größen 100er-Packung', 'Power Force Nitrile Disposable Gloves assorted sizes 100-pack', 'Haushalt', 'Household', 4.79, 6.99, '100 Stück', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Power Force', 'Power Force Schwamm-/Scheuerkissen 5er-Packung', 'Power Force Sponge/Scouring Pads 5-pack', 'Haushalt', 'Household', 0.65, 0.85, '5 Stück', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 8: Haushalt & Getränke Di. 7.4. - Sa. 11.4. ===
('2', 'Power Force', 'Power Force Bio-Kompostbeutel 20er-Packung', 'Power Force Organic Compost Bags 20-pack', 'Haushalt', 'Household', 0.99, 1.49, '20 Stück', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Power Force', 'Power Force WC-Duft-Juwelen versch. Sorten', 'Power Force WC Fragrance Jewels assorted', 'Haushalt', 'Household', 0.75, 0.95, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Power Force', 'Power Force Geschirrspülmittel versch. Sorten 500ml', 'Power Force Dish Soap assorted 500ml', 'Haushalt', 'Household', 0.79, 0.95, '500ml', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Power Force', 'Power Force Geschirr-Reiniger-Pulver 1,5kg 100 Spülgänge', 'Power Force Dishwasher Powder 1.5kg 100 Washes', 'Haushalt', 'Household', 2.49, 2.95, '1.5kg', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Rio d''Oro', 'Rio d''Oro Orangen-Direktsaft 1L Flasche', 'Rio d''Oro Orange Direct Juice 1L Bottle', 'Getränke', 'Beverages', 1.79, 2.59, '1L', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Rio d''Oro', 'Rio d''Oro Fruchtsaft versch. Sorten 100% Saft 1L', 'Rio d''Oro Fruit Juice assorted 100% Juice 1L', 'Getränke', 'Beverages', 0.47, 0.69, '1L', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Grauer Burgunder oder Weißer Burgunder QbA Pfalz trocken 0,75L', 'Pinot Gris or Pinot Blanc QbA Pfalz dry 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.79, 2.59, '0.75L', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Cucina', 'Cucina Pasta versch. Sorten 500g', 'Cucina Pasta assorted 500g', 'Nudeln & Reis', 'Pasta & Rice', 0.55, 0.69, '500g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 9: Marken & Eigenmarken Di. 7.4. - Sa. 11.4. ===
('2', 'Choceur', 'Choceur Schokolade versch. Sorten 100g Tafel', 'Choceur Chocolate assorted 100g bar', 'Süßwaren', 'Sweets', 0.79, 0.89, '100g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Alpenmilch Schokolade', 'Alpine Milk Chocolate', 'Süßwaren', 'Sweets', 0.79, 0.89, '100g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Gut Drei Eichen', 'Gut Drei Eichen Geflügel-Aspik-Aufschnitt versch. Sorten 200g', 'Gut Drei Eichen Poultry Aspic Cold Cut assorted 200g', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, 2.19, '200g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Gut Drei Eichen', 'Gut Drei Eichen Nürnberger Rostbratwurst versch. Sorten 200-300g', 'Gut Drei Eichen Nuremberg Grilled Sausage assorted 200-300g', 'Fleisch & Wurst', 'Meat & Sausage', 2.79, 3.29, '300g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Goldähren', 'Goldähren Laugenmischgebäck versch. Sorten ca. 800g', 'Goldähren Pretzel Mixed Baked Goods assorted ca. 800g', 'Tiefkühl', 'Frozen', 1.49, 1.99, '800g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Lyttos', 'Lyttos Joghurt griechischer Art versch. Sorten', 'Lyttos Greek Style Yogurt assorted', 'Milchprodukte', 'Dairy', 1.59, 2.19, '450g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Fair & Gut', 'Fair & Gut Frischkäse-Fass versch. Sorten 200g', 'Fair & Gut Cream Cheese Barrel assorted 200g', 'Käse', 'Cheese', 1.19, 1.59, '200g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'All Seasons', 'All Seasons Obst versch. Sorten tiefgekühlt 750g', 'All Seasons Fruit assorted frozen 750g', 'Tiefkühl', 'Frozen', 2.79, 3.49, '750g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Cucina', 'Cucina Mascarpone Frischkäse nach italienischer Art 250g', 'Cucina Mascarpone Italian-style Cream Cheese 250g', 'Käse', 'Cheese', 1.39, 1.79, '250g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 10: Deine Marken zum ALDI Preis Di. 7.4. - Sa. 11.4. ===
('2', 'Balisto', 'Balisto Riegel versch. Sorten 9 Riegel 166g', 'Balisto Bars assorted 9 bars 166g', 'Süßwaren', 'Sweets', 1.79, 2.99, '166g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Golden Toast', 'Golden Toast Toastbrot versch. Sorten 500g', 'Golden Toast Toast Bread assorted 500g', 'Brot & Backwaren', 'Bread & Bakery', 1.11, 1.89, '500g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Bahlsen', 'Bahlsen Mini-Babyfuß versch. Sorten 100g', 'Bahlsen Mini Baby Foot assorted 100g', 'Süßwaren', 'Sweets', 1.99, 2.89, '100g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Funny-frisch', 'Funny-frisch Chipsfrisch versch. Sorten 150g', 'Funny-frisch Chips assorted 150g', 'Snacks & Nüsse', 'Snacks & Nuts', 1.11, 1.99, '150g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Head & Shoulders', 'Head & Shoulders Shampoo versch. Sorten 500ml', 'Head & Shoulders Shampoo assorted 500ml', 'Haushalt', 'Household', 5.29, NULL, '500ml', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Corny', 'Corny Müsliriegel versch. Sorten 4 Riegel/6 Riegel 150-230g', 'Corny Cereal Bars assorted 4/6 bars 150-230g', 'Frühstück & Cerealien', 'Breakfast & Cereal', 1.59, 2.39, '150-230g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Gerolsteiner', 'Gerolsteiner Mineralwasser Medium 1,5L', 'Gerolsteiner Mineral Water Medium 1.5L', 'Getränke', 'Beverages', 0.75, 1.09, '1.5L', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 11: Marke bei ALDI vs Eigenmarke ===
('2', 'Lorenz', 'Lorenz Saltletts Sticks 225g', 'Lorenz Saltletts Sticks 225g', 'Snacks & Nüsse', 'Snacks & Nuts', 2.29, NULL, '225g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Snackos', 'Snackos Salzstangen 250g', 'Snackos Salt Sticks 250g', 'Snacks & Nüsse', 'Snacks & Nuts', 0.69, NULL, '250g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Bresso', 'Bresso Frischkäse Kräuter 150g', 'Bresso Cream Cheese Herbs 150g', 'Käse', 'Cheese', 2.39, NULL, '150g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Roi de Trefle', 'Roi de Trefle Frische Kräuter 150g', 'Roi de Trefle Fresh Herbs Cheese 150g', 'Käse', 'Cheese', 0.99, NULL, '150g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Barilla', 'Barilla Pesto Genovese 190g', 'Barilla Pesto Genovese 190g', 'Saucen & Gewürze', 'Sauces & Spices', 3.49, NULL, '190g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Cucina', 'Cucina Pesto Genovese 190g', 'Cucina Pesto Genovese 190g', 'Saucen & Gewürze', 'Sauces & Spices', 0.99, NULL, '190g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 12: Marke vs Eigenmarke Vergleich ===
('2', 'Volvic', 'Volvic Naturell Mineralwasser 1,5L', 'Volvic Natural Mineral Water 1.5L', 'Getränke', 'Beverages', 1.25, NULL, '1.5L', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Quellbrunn', 'Quellbrunn Mineralwasser Naturell 1,5L', 'Quellbrunn Mineral Water Natural 1.5L', 'Getränke', 'Beverages', 0.29, NULL, '1.5L', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Ehrmann', 'Ehrmann Almighurt Erdbeere 150g', 'Ehrmann Almighurt Strawberry 150g', 'Milchprodukte', 'Dairy', 0.89, NULL, '150g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Milsani', 'Milsani Alpighurt Erdbeere 150g', 'Milsani Alpighurt Strawberry 150g', 'Milchprodukte', 'Dairy', 0.29, NULL, '150g', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Heinz', 'Heinz Tomatenketchup 400ml', 'Heinz Tomato Ketchup 400ml', 'Saucen & Gewürze', 'Sauces & Spices', 2.79, NULL, '400ml', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Delikato', 'Delikato Tomatenketchup 500ml', 'Delikato Tomato Ketchup 500ml', 'Saucen & Gewürze', 'Sauces & Spices', 1.29, NULL, '500ml', '2026-04-07', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 25: Ab Fr. 10.4. Feinkost ===
('2', 'Nabio', 'Nabio Brotaufstrich versch. Sorten 135g', 'Nabio Bread Spread assorted 135g', 'Brotaufstrich', 'Spreads', 1.99, NULL, '135g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Salakis', 'Salakis Original Feta 150g', 'Salakis Original Feta 150g', 'Käse', 'Cheese', 1.99, NULL, '150g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Giovanni Ferrari', 'Giovanni Ferrari Grana Padano 150g', 'Giovanni Ferrari Grana Padano 150g', 'Käse', 'Cheese', 3.99, NULL, '150g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Kikkoman', 'Kikkoman Teriyaki-Sauce versch. Sorten 250ml', 'Kikkoman Teriyaki Sauce assorted 250ml', 'Saucen & Gewürze', 'Sauces & Spices', 3.69, NULL, '250ml', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Bertolli', 'Bertolli Olivenöl oder Natives Olivenöl Extra 500ml', 'Bertolli Olive Oil or Extra Virgin Olive Oil 500ml', 'Öle & Essig', 'Oils & Vinegar', 4.99, NULL, '500ml', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Youcook', 'Youcook Fertiggericht versch. Sorten 420g', 'Youcook Ready Meal assorted 420g', 'Fertiggerichte', 'Ready Meals', 3.79, NULL, '420g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Original Sahne Muh Muhs', 'Original Sahne Muh Muhs Toffees 250g', 'Original Cream Muh Muhs Toffees 250g', 'Süßwaren', 'Sweets', 1.99, NULL, '250g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Lü', 'Lü Mikado versch. Sorten 75g', 'Lü Mikado assorted 75g', 'Süßwaren', 'Sweets', 1.29, NULL, '75g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Meine Metzgerei', 'Meine Metzgerei Hähnchen Gran Gala IRRL al. versch. Gewichte ca. 2,5kg', 'My Butcher Chicken Gran Gala ca. 2.5kg', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, 'kg', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 26: Ab Fr. 10.4. XXL ===
('2', 'Gut Drei Eichen', 'Gut Drei Eichen Hähnchen-Edelsalami 100g', 'Gut Drei Eichen Chicken Premium Salami 100g', 'Fleisch & Wurst', 'Meat & Sausage', 1.39, NULL, '100g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Meine Metzgerei', 'Meine Metzgerei Hähnchen-Minutenschnitzel 800g', 'My Butcher Chicken Minute Schnitzel 800g', 'Fleisch & Wurst', 'Meat & Sausage', 7.99, NULL, '800g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Herta', 'Herta Grillschinken versch. Sorten XXL 160g', 'Herta Grilled Ham assorted XXL 160g', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '160g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Herta', 'Herta Kochschinken versch. Sorten', 'Herta Cooked Ham assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '160g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Meine Metzgerei', 'Meine Metzgerei Schnitzel Ösi Classic küchenfertig 500g', 'My Butcher Schnitzel Ösi Classic ready-to-cook 500g', 'Fleisch & Wurst', 'Meat & Sausage', 7.99, NULL, '500g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Meine Metzgerei', 'Meine Metzgerei Gemischtes Hackfleisch XXL aus Rind und Schwein 1kg', 'My Butcher Mixed Mince XXL Beef and Pork 1kg', 'Fleisch & Wurst', 'Meat & Sausage', 7.99, NULL, '1kg', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Chio', 'Chio Tortillas versch. Sorten XXL 200g', 'Chio Tortillas assorted XXL 200g', 'Snacks & Nüsse', 'Snacks & Nuts', 1.79, NULL, '200g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Axe', 'Axe Duschgel oder Bodyspray versch. Sorten 2in1 3er-Pack', 'Axe Shower Gel or Body Spray assorted 2in1 3-pack', 'Haushalt', 'Household', 4.49, NULL, '3 Stück', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Carefree', 'Carefree Cotton Feel Normal Slipeinlagen 100er-Packung', 'Carefree Cotton Feel Normal Panty Liners 100-pack', 'Haushalt', 'Household', 3.99, NULL, '100 Stück', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 27: Ab Fr. 10.4. Haushalt & Getränke ===
('2', 'Dr. Beckmann', 'Dr. Beckmann Waschmaschinen Hygiene-Reiniger/Spülmaschinen-Reiniger', 'Dr. Beckmann Washing Machine Hygiene Cleaner/Dishwasher Cleaner', 'Haushalt', 'Household', 2.49, NULL, 'Stück', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Sagrotan', 'Sagrotan Reiniger oder Reinigungstücher versch. Sorten 10er-Packung', 'Sagrotan Cleaner or Cleaning Wipes assorted 10-pack', 'Haushalt', 'Household', 2.79, NULL, 'Stück', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Knack Cola versch. Sorten koffeinhaltig 0,33L Dose', 'Knack Cola assorted caffeinated 0.33L can', 'Getränke', 'Beverages', 0.99, NULL, '4x0.33L', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Mumm', 'Mumm Dry Jahrgangssekt versch. Sorten oder alkoholfrei 0,75L', 'Mumm Dry Vintage Sparkling Wine assorted or non-alcoholic 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, NULL, '0.75L', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Aperol', 'Aperol Spritz 10,5% vol. 3x0,2L Flasche', 'Aperol Spritz 10.5% vol. 3x0.2L bottle', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.99, NULL, '3x0.2L', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 28: Ab Fr. 10.4. Bio ===
('2', 'Bio', 'Bio Knusper-Ecken versch. Sorten 80g', 'Organic Crunchy Corners assorted 80g', 'Snacks & Nüsse', 'Snacks & Nuts', 1.45, NULL, '80g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Bio', 'Bio Buchweizen 500g', 'Organic Buckwheat 500g', 'Grundnahrungsmittel', 'Staples', 1.69, NULL, '500g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Bio', 'Bio Griechische Bio-Bohnen versch. Sorten 200g', 'Organic Greek Bio Beans assorted 200g', 'Grundnahrungsmittel', 'Staples', 1.99, NULL, '200g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Bio', 'Bio-Fonds versch. Sorten 400ml', 'Organic Stock assorted 400ml', 'Saucen & Gewürze', 'Sauces & Spices', 1.69, NULL, '400ml', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Bio', 'Bio Schoko-Tröpfchen oder Chunks versch. Sorten 100g', 'Organic Chocolate Drops or Chunks assorted 100g', 'Süßwaren', 'Sweets', 1.59, NULL, '100g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Andechser Natur', 'Andechser Natur Bio-Joghurt mild versch. Sorten 500g', 'Andechser Natur Organic Yogurt mild assorted 500g', 'Milchprodukte', 'Dairy', 1.19, NULL, '500g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Bio', 'Bio-Lachs 2x200g tiefgekühlt', 'Organic Salmon 2x200g frozen', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 10.99, NULL, '2x200g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Andechser Natur', 'Andechser Natur Bio Almbutter 250g', 'Andechser Natur Organic Alpine Butter 250g', 'Butter', 'Butter', 2.79, NULL, '250g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Bio', 'Bio-Kräuter flüssig versch. Sorten 125ml', 'Organic Herbs liquid assorted 125ml', 'Saucen & Gewürze', 'Sauces & Spices', 2.79, NULL, '125ml', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),
('2', 'Bio', 'Bio Tomatensauce versch. Sorten 300g', 'Organic Tomato Sauce assorted 300g', 'Saucen & Gewürze', 'Sauces & Spices', 1.49, NULL, '300g', '2026-04-10', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 29: Ab Sa. 11.4. ===
('2', 'Gardenline', 'Gardenline Bio-Hochbeet- und Gewächshauserde 20L', 'Gardenline Organic Raised Bed and Greenhouse Soil 20L', 'Haushalt', 'Household', 1.79, NULL, '20L', '2026-04-11', '2026-04-11', true, 'https://www.aldi-sued.de'),

-- === PAGE 30: Aus unserem Sortiment - Back Family ===
('2', 'Back Family', 'Back Family Streudekor versch. Sorten 20-80g', 'Back Family Decorating Sprinkles assorted 20-80g', 'Grundnahrungsmittel', 'Staples', 0.89, NULL, '20-80g', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Back Family', 'Back Family Kuvertüre versch. Sorten 200g', 'Back Family Couverture assorted 200g', 'Grundnahrungsmittel', 'Staples', 1.99, NULL, '200g', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Back Family', 'Back Family Kakao zum Backen 250g', 'Back Family Cocoa for Baking 250g', 'Grundnahrungsmittel', 'Staples', 3.29, NULL, '250g', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Back Family', 'Back Family Mandeln ganz 200g', 'Back Family Whole Almonds 200g', 'Snacks & Nüsse', 'Snacks & Nuts', 2.49, NULL, '200g', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Fairtrade', 'Fairtrade Südafrikanische Sultaninen 500g', 'Fairtrade South African Sultanas 500g', 'Snacks & Nüsse', 'Snacks & Nuts', 2.49, NULL, '500g', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Back Family', 'Back Family Raspelschokolade versch. Sorten 75-100g', 'Back Family Grated Chocolate assorted 75-100g', 'Süßwaren', 'Sweets', 1.59, NULL, '100g', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Back Family', 'Back Family Backmischung versch. Sorten 380-500g', 'Back Family Baking Mix assorted 380-500g', 'Grundnahrungsmittel', 'Staples', 1.99, NULL, '500g', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),

-- === PAGE 31: Aus unserem Sortiment - Back Family Grundzutaten ===
('2', 'Back Family', 'Back Family Vanillinzucker 15x8g 5er-Packung', 'Back Family Vanillin Sugar 15x8g 5-pack', 'Grundnahrungsmittel', 'Staples', 0.39, NULL, '5x15x8g', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Back Family', 'Back Family Backpulver 15x21g 5er-Packung', 'Back Family Baking Powder 15x21g 5-pack', 'Grundnahrungsmittel', 'Staples', 0.55, NULL, '5x15x21g', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Back Family', 'Back Family Weizenmehl Type 405 1kg', 'Back Family Wheat Flour Type 405 1kg', 'Grundnahrungsmittel', 'Staples', 0.59, NULL, '1kg', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Power Force', 'Power Force Backpapierzuschnitte FSC 38 Blatt', 'Power Force Baking Paper Sheets FSC 38 sheets', 'Haushalt', 'Household', 0.95, NULL, '38 Stück', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Brauner Rohrzucker Fairtrade versch. Sorten 500g', 'Brown Cane Sugar Fairtrade assorted 500g', 'Grundnahrungsmittel', 'Staples', 1.49, NULL, '500g', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Diadem', 'Diadem Puderzucker 250g', 'Diadem Powdered Sugar 250g', 'Grundnahrungsmittel', 'Staples', 0.49, NULL, '250g', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),

-- === PAGE 32: Aus unserem Sortiment - Weine ===
('2', 'Eigenmarke', 'Chardonnay d''Italia Italien trocken 0,75L', 'Chardonnay d''Italia Italy dry 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.19, NULL, '0.75L', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Dornfelder Spätburgunder QbA Rheinhessen/Pfalz halbtrocken', 'Dornfelder Pinot Noir QbA Rheinhessen/Pfalz semi-dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.69, NULL, '0.75L', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Weißer Burgunder QbA Italien trocken 0,75L', 'Pinot Blanc QbA Italy dry 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.79, NULL, '0.75L', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Grüner Veltliner Österreich trocken 0,75L', 'Grüner Veltliner Austria dry 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.79, NULL, '0.75L', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Barón Amarillo', 'Barón Amarillo Rioja DOCa Rosado Spanien trocken 0,75L', 'Barón Amarillo Rioja DOCa Rosé Spain dry 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.69, NULL, '0.75L', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Spätburgunder Baden trocken 0,75L', 'Pinot Noir Baden dry 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.49, NULL, '0.75L', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Edition Erster Keller', 'Edition Erster Keller 2024 Weißer Burgunder QbA Baden trocken 0,75L', 'Edition Erster Keller 2024 Pinot Blanc QbA Baden dry 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.99, NULL, '0.75L', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),

-- === PAGE 33: Aus unserem Sortiment - Weine 2 ===
('2', 'Eigenmarke', 'Riesling QbA Rheinhessen/Pfalz feinherb 0,75L', 'Riesling QbA Rheinhessen/Pfalz off-dry 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.79, NULL, '0.75L', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Barón Amarillo', 'Barón Amarillo Rioja DOCa Reserva Spanien trocken 0,75L', 'Barón Amarillo Rioja DOCa Reserva Spain dry 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.49, NULL, '0.75L', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Leitz', '2025 Leitz Riesling QbA Rheingau trocken 0,75L', '2025 Leitz Riesling QbA Rheingau dry 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.99, NULL, '0.75L', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Doppio Tratto', 'Doppio Tratto Primitivo Puglia IGT Italien halbtrocken 0,75L', 'Doppio Tratto Primitivo Puglia IGT Italy semi-dry 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.69, NULL, '0.75L', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Burlwood', 'Burlwood Cabernet Sauvignon Kalifornien trocken 0,75L', 'Burlwood Cabernet Sauvignon California dry 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.69, NULL, '0.75L', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Chardonnay Alkoholfrei Spanien 0,75L', 'Chardonnay Non-alcoholic Spain 0.75L', 'Getränke', 'Beverages', 2.99, NULL, '0.75L', '2026-04-07', '2026-04-11', false, 'https://www.aldi-sued.de');
