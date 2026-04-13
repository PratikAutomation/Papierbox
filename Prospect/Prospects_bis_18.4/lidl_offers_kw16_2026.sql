DELETE FROM public.offers WHERE store_id = '1' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2 (Cover): Ab Mo. 13.4. ===
('1', 'Alesto', 'Alesto Selection Walnusskerne', 'Alesto Selection Walnut Kernels', 'Snacks & Nüsse', 'Snacks & Nuts', 1.99, 2.99, '200g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Katjes', 'Katjes Fruchtgummi Wunderland', 'Katjes Fruit Gummy Wunderland assorted', 'Süßwaren', 'Sweets', 0.66, 1.39, 'versch. Sorten', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Haltbare Milch 1,5% Fett', 'Milbona Long-life Milk 1.5% Fat', 'Milchprodukte', 'Dairy', 8.50, 10.20, '12x1L', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Danone', 'Danone Actimel XXL versch. Sorten', 'Danone Actimel XXL assorted', 'Milchprodukte', 'Dairy', 2.95, NULL, '8x100g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 9: Ab Mo. 13.4. – Obst & Gemüse ===
('1', 'Lidl', 'Erdbeeren', 'Strawberries', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, NULL, '500g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Salat-Mix', 'Salad Mix', 'Obst & Gemüse', 'Fruits & Vegetables', 0.77, NULL, '125g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 10: Ab Mo. 13.4. – Obst & Gemüse ===
('1', 'Lidl', 'Datteln Deglet Nour', 'Dates Deglet Nour', 'Obst & Gemüse', 'Fruits & Vegetables', 3.99, NULL, '1kg', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Bananen, lose', 'Bananas loose', 'Obst & Gemüse', 'Fruits & Vegetables', 0.99, NULL, 'kg', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Deutscher weißer/violetter Spargel', 'German white/purple asparagus', 'Obst & Gemüse', 'Fruits & Vegetables', 4.99, NULL, '500g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Rote Äpfel', 'Red Apples', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 3.29, '2kg', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Paprika Mix', 'Mixed Bell Peppers', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, NULL, '500g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Zucchini, lose', 'Zucchini loose', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, NULL, 'kg', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
-- Bio section page 10
('1', 'Maribel', 'Maribel Bio Agavendicksaft', 'Maribel Organic Agave Syrup', 'Grundnahrungsmittel', 'Staples', 2.09, 2.35, '500g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Maribel', 'Maribel Bio Agavendicksaft (Lidl Plus)', 'Maribel Organic Agave Syrup (Lidl Plus)', 'Grundnahrungsmittel', 'Staples', 2.09, 2.35, '500g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Solevita', 'Solevita Bio Karottensaft', 'Solevita Organic Carrot Juice', 'Getränke', 'Beverages', 1.59, 1.79, '1L', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Fairglobe', 'Fairglobe Bio Schokolade Bitter', 'Fairglobe Organic Dark Chocolate', 'Süßwaren', 'Sweets', 1.85, NULL, '100g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Bioland', 'Bioland 4 Körner Krusti', 'Bioland 4-Grain Crusty Bread', 'Brot & Backwaren', 'Bread & Bakery', 1.79, NULL, '4x95g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 11: Ab Mo. 13.4. – Brot & Backwaren ===
('1', 'Lidl', 'Kürbiskernbrötchen', 'Pumpkin Seed Rolls', 'Brot & Backwaren', 'Bread & Bakery', 0.98, 1.47, '3 Stück', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Laugeneck mit Saaten', 'Pretzel Corner with Seeds', 'Brot & Backwaren', 'Bread & Bakery', 1.70, 2.55, '3 Stück', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Laugeneck mit Saaten (Lidl Plus)', 'Pretzel Corner with Seeds (Lidl Plus)', 'Brot & Backwaren', 'Bread & Bakery', 1.70, 2.55, '3 Stück', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Schinken-Käse-Croissant', 'Ham and Cheese Croissant', 'Brot & Backwaren', 'Bread & Bakery', 1.58, 2.37, '3 Stück', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Schinken-Käse-Croissant (Lidl Plus)', 'Ham and Cheese Croissant (Lidl Plus)', 'Brot & Backwaren', 'Bread & Bakery', 1.58, 2.37, '3 Stück', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Spritzkuchen', 'Glazed Doughnuts', 'Brot & Backwaren', 'Bread & Bakery', 0.65, NULL, 'Stück', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Apfel-Quark-Tasche', 'Apple Quark Pastry', 'Brot & Backwaren', 'Bread & Bakery', 0.99, NULL, 'Stück', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Kakao-Haselnuss Berliner', 'Cocoa Hazelnut Doughnut', 'Brot & Backwaren', 'Bread & Bakery', 3.99, NULL, '10er-Pack', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 12: Ab Mo. 13.4. – Fleisch & Fisch ===
('1', 'Fischerstolz', 'Fischerstolz Norwegische Lachsfilet-Portionen', 'Fischerstolz Norwegian Salmon Fillet Portions', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 7.99, NULL, '500g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Deluxe', 'Deluxe Lammlachse in Gewürzmarinade', 'Deluxe Lamb Loin in Spice Marinade', 'Fleisch & Wurst', 'Meat & Sausage', 7.43, 8.74, '250g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch Frisches Gulasch gemischt', 'Metzgerfrisch Fresh Mixed Goulash', 'Fleisch & Wurst', 'Meat & Sausage', 7.77, NULL, '800g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch Hähnchen-Schenkel gewürzt', 'Metzgerfrisch Seasoned Chicken Legs', 'Fleisch & Wurst', 'Meat & Sausage', 8.99, NULL, '2.5kg', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch Frische Hähnchenflügel', 'Metzgerfrisch Fresh Chicken Wings', 'Fleisch & Wurst', 'Meat & Sausage', 4.79, 5.99, '1.1kg', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch Frische Hähnchenflügel (Lidl Plus)', 'Metzgerfrisch Fresh Chicken Wings (Lidl Plus)', 'Fleisch & Wurst', 'Meat & Sausage', 4.79, 5.99, '1.1kg', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Grillmeister', 'Grillmeister Rinder-Rumpsteak', 'Grillmeister Beef Rump Steak', 'Fleisch & Wurst', 'Meat & Sausage', 5.00, NULL, '250g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch High Protein Schweine- und Rindfleisch', 'Metzgerfrisch High Protein Pork and Beef', 'Fleisch & Wurst', 'Meat & Sausage', 3.79, NULL, '450g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Fischerstolz', 'Fischerstolz ASC White Tiger Garnelen', 'Fischerstolz ASC White Tiger Prawns', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.33, 4.29, '220g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Fischerstolz', 'Fischerstolz ASC White Tiger Garnelen (Lidl Plus)', 'Fischerstolz ASC White Tiger Prawns (Lidl Plus)', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.33, 4.29, '220g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 13: Ab Mo. 13.4. – Eis & Tiefkühl / Süßwaren ===
('1', 'Langnese', 'Langnese Magnum versch. Sorten', 'Langnese Magnum assorted', 'Eiscreme', 'Ice Cream', 2.49, 4.49, 'versch. Sorten', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Maggi', 'Maggi Fix versch. Sorten', 'Maggi Fix Sauce Mix assorted', 'Saucen & Gewürze', 'Sauces & Spices', 0.39, 1.09, 'versch. Sorten', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Danone', 'Danone Activia Joghurt versch. Sorten', 'Danone Activia Yogurt assorted', 'Milchprodukte', 'Dairy', 1.39, 2.79, '4x115g', '2026-04-13', '2026-04-26', true, 'https://www.lidl.de'),
('1', 'Danone', 'Danone Actimel XXL 12er-Pack', 'Danone Actimel XXL 12-pack', 'Milchprodukte', 'Dairy', 2.95, NULL, '12x100g', '2026-04-13', '2026-04-26', true, 'https://www.lidl.de'),

-- === PAGE 14: Ab Mo. 13.4. – Diverse ===
('1', 'Ehrmann', 'Ehrmann High Protein Pudding versch. Sorten', 'Ehrmann High Protein Pudding assorted', 'Milchprodukte', 'Dairy', 0.99, 1.49, '200g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Kerrygold', 'Kerrygold extra XXL versch. Sorten', 'Kerrygold Extra XXL assorted', 'Butter', 'Butter', 2.99, NULL, '400g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Nixe', 'Nixe Thunfisch Filets versch. Sorten', 'Nixe Tuna Fillets assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 0.99, 1.29, 'versch. Sorten', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Tuc', 'Tuc Bake Rolls versch. Sorten', 'Tuc Bake Rolls assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, 2.19, '150g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Snickers', 'Snickers/Mars/Twix Eisriegel versch. Sorten', 'Snickers/Mars/Twix Ice Cream Bars assorted', 'Eiscreme', 'Ice Cream', 4.99, NULL, 'versch. Sorten', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Snickers', 'Snickers/Mars/Twix Eisriegel (Lidl Plus)', 'Snickers/Mars/Twix Ice Cream Bars (Lidl Plus)', 'Eiscreme', 'Ice Cream', 4.99, NULL, 'versch. Sorten', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Alesto', 'Alesto Selection Mandeln', 'Alesto Selection Almonds', 'Snacks & Nüsse', 'Snacks & Nuts', 1.99, 2.99, '200g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Alesto', 'Alesto Selection Mandeln (Lidl Plus)', 'Alesto Selection Almonds (Lidl Plus)', 'Snacks & Nüsse', 'Snacks & Nuts', 1.99, 2.99, '200g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'hohes C', 'hohes C Vitamin Shots versch. Sorten', 'hohes C Vitamin Shots assorted', 'Getränke', 'Beverages', 1.99, 2.69, '330ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Rockstar', 'Rockstar Energy Drink versch. Sorten', 'Rockstar Energy Drink assorted', 'Getränke', 'Beverages', 0.89, 1.49, '500ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Dallmayr', 'Dallmayr Prodomo', 'Dallmayr Prodomo Coffee', 'Kaffee & Tee', 'Coffee & Tea', 7.99, 10.49, '500g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Dallmayr', 'Dallmayr Prodomo (Lidl Plus)', 'Dallmayr Prodomo Coffee (Lidl Plus)', 'Kaffee & Tee', 'Coffee & Tea', 7.99, 10.49, '500g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Schweppes', 'Schweppes Erfrischungsgetränk versch. Sorten', 'Schweppes Soft Drink assorted', 'Getränke', 'Beverages', 1.59, 1.99, '1.25L', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Mumm', 'Mumm Dry Jahrgangssekt versch. Sorten', 'Mumm Dry Vintage Sparkling Wine assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 6.49, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Captain Morgan', 'Captain Morgan Original Spiced Gold', 'Captain Morgan Original Spiced Gold', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, 12.99, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Captain Morgan', 'Captain Morgan Original Spiced Gold (Lidl Plus)', 'Captain Morgan Original Spiced Gold (Lidl Plus)', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, 12.99, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 15: Ab Mo. 13.4. – Tiefkühl / Süßwaren / Getränke ===
('1', 'Frosta', 'Frosta Fertiggericht XXL versch. Sorten', 'Frosta Ready Meal XXL assorted', 'Tiefkühl', 'Frozen', 4.79, 6.99, '800g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'McCain', 'McCain Original 1-2-3 Frites', 'McCain Original 1-2-3 Fries', 'Tiefkühl', 'Frozen', 2.99, 4.89, '1.5kg', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', '3 Glocken', '3 Glocken Genuss Pur versch. Sorten', '3 Glocken Pasta Genuss Pur assorted', 'Nudeln & Reis', 'Pasta & Rice', 1.99, 3.76, '1kg', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Kinder', 'Kinder Happy Hippo versch. Sorten', 'Kinder Happy Hippo assorted', 'Süßwaren', 'Sweets', 1.99, 2.39, '103.5g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Kinder', 'Kinder Schoko-Bons', 'Kinder Schoko-Bons', 'Süßwaren', 'Sweets', 3.29, 3.99, '200g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Kinder', 'Kinder Bueno versch. Sorten', 'Kinder Bueno assorted', 'Süßwaren', 'Sweets', 2.79, 3.29, '6 Stück', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Milka', 'Milka Kekse/Küchlein versch. Sorten', 'Milka Cookies/Mini Cakes assorted', 'Süßwaren', 'Sweets', 1.99, 2.99, 'versch. Sorten', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Duplo', 'Duplo/Kinder Riegel', 'Duplo/Kinder Chocolate Bars', 'Süßwaren', 'Sweets', 5.39, NULL, 'versch. Sorten', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Kinder', 'Kinder Country', 'Kinder Country', 'Süßwaren', 'Sweets', 4.89, NULL, '376g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Schwip Schwap', 'Schwip Schwap/7Up versch. Sorten', 'Schwip Schwap/7Up assorted', 'Getränke', 'Beverages', 0.88, 1.49, '1.25L', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Jack Daniel''s', 'Jack Daniel''s Mixgetränk versch. Sorten', 'Jack Daniel''s Mixed Drink assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.99, 2.99, '330ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'FuzeTea', 'FuzeTea versch. Sorten', 'FuzeTea assorted', 'Getränke', 'Beverages', 1.29, 1.69, '1.25L', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 17: Ab Mo. 13.4. – Diverses ===
('1', 'Mulino Bianco', 'Mulino Bianco Gebäck versch. Sorten', 'Mulino Bianco Biscuits assorted', 'Süßwaren', 'Sweets', 2.22, 3.69, 'versch. Sorten', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Dovgan', 'Dovgan Plombir Eis versch. Sorten', 'Dovgan Plombir Ice Cream assorted', 'Eiscreme', 'Ice Cream', 4.99, NULL, '1800ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Nordsee', 'Nordsee Knusper-Garnelen', 'Nordsee Crispy Shrimps', 'Tiefkühl', 'Frozen', 3.49, 4.59, '200g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Dogan', 'Dogan Adana Kebab Style versch. Sorten', 'Dogan Adana Kebab Style assorted', 'Tiefkühl', 'Frozen', 4.99, NULL, '560g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Meggle', 'Meggle Baguette versch. Sorten', 'Meggle Baguette assorted', 'Brot & Backwaren', 'Bread & Bakery', 1.19, 1.69, '160g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Cheeselings', 'Cheeselings versch. Sorten', 'Cheeselings assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 1.99, 2.29, '80g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Ballantine''s', 'Ballantine''s Finest Blended Scotch Whisky', 'Ballantine''s Finest Blended Scotch Whisky', 'Alkoholische Getränke', 'Alcoholic Beverages', 11.99, 15.49, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 19: Ab Mo. 13.4. – XXL Produkte ===
('1', 'Trattoria Alfredo', 'Trattoria Alfredo Steinofenpizza Speciale XXL', 'Trattoria Alfredo Stone Oven Pizza Speciale XXL', 'Tiefkühl', 'Frozen', 4.69, NULL, '3x330g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Ocean Sea', 'Ocean Sea MSC Alaska-Seelachs Portionsfilets XXL', 'Ocean Sea MSC Alaska Pollock Fillet Portions XXL', 'Tiefkühl', 'Frozen', 4.79, NULL, '960g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Fettarmer Kefir XXL', 'Milbona Low-Fat Kefir XXL', 'Milchprodukte', 'Dairy', 0.99, NULL, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Chef Select', 'Chef Select Käserollen XXL', 'Chef Select Cheese Rolls XXL', 'Tiefkühl', 'Frozen', 5.99, NULL, '10 Stück', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Hilcona', 'Hilcona Teigwaren XXL versch. Sorten', 'Hilcona Pasta XXL assorted', 'Tiefkühl', 'Frozen', 3.29, NULL, '750g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Maggi', 'Maggi 5 Minuten Terrine XL versch. Sorten', 'Maggi 5-Minute Pot Noodle XL assorted', 'Fertiggerichte', 'Ready Meals', 1.19, 1.79, 'versch. Sorten', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Golden Sun', 'Golden Sun Basmati Reis XXL', 'Golden Sun Basmati Rice XXL', 'Nudeln & Reis', 'Pasta & Rice', 9.99, NULL, '4.5kg', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 20: Ab Mo. 13.4. – XXL / Diverses ===
('1', 'Starbucks', 'Starbucks Kaffeegetränk/Proteindrink versch. Sorten', 'Starbucks Coffee Drink/Protein Drink assorted', 'Kaffee & Tee', 'Coffee & Tea', 1.99, 2.89, '330ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Alesto', 'Alesto Erdnusskerne XXL', 'Alesto Peanuts XXL', 'Snacks & Nüsse', 'Snacks & Nuts', 3.49, NULL, '1kg', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Sondey', 'Sondey Doppelkekse XXL', 'Sondey Double Cookies XXL', 'Süßwaren', 'Sweets', 4.49, NULL, '3x500g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Bellarom', 'Bellarom Caffè Crema & Aroma Ganze Bohnen XXL', 'Bellarom Caffè Crema & Aroma Whole Beans XXL', 'Kaffee & Tee', 'Coffee & Tea', 13.99, NULL, '1.2kg', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Nutella', 'Nutella +50g gratis', 'Nutella +50g free', 'Brotaufstrich', 'Spreads', 3.79, NULL, '500g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Sondey', 'Sondey Butterwaffeln Karamell XXL', 'Sondey Butter Waffles Caramel XXL', 'Süßwaren', 'Sweets', 3.49, NULL, '560g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Fin Carré', 'Fin Carré Tafelschokolade Nusskracher', 'Fin Carré Chocolate Bar Nut Cracker', 'Süßwaren', 'Sweets', 2.99, NULL, '3x100g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Sondey', 'Sondey Waffel-/Gebäckmischung XXL', 'Sondey Wafer/Biscuit Mix XXL', 'Süßwaren', 'Sweets', 2.79, NULL, 'versch. Sorten', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Beck''s', 'Beck''s Pils', 'Beck''s Pils', 'Alkoholische Getränke', 'Alcoholic Beverages', 0.79, 1.04, '568ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Surig', 'Surig Essigessenz', 'Surig Vinegar Essence', 'Öle & Essig', 'Oils & Vinegar', 4.49, 6.49, '2kg', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Sondey', 'Sondey Jaffa Cake Orange XXL', 'Sondey Jaffa Cake Orange XXL', 'Süßwaren', 'Sweets', 2.59, NULL, '450g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 22: Ab Mo. 13.4. – Fleischersatz (Vemondo) ===
('1', 'Vemondo', 'Vemondo Vegane Chunks versch. Sorten', 'Vemondo Vegan Chunks assorted', 'Fleischersatz', 'Meat Alternatives', 2.05, 2.45, '185g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Chunks (Lidl Plus)', 'Vemondo Vegan Chunks (Lidl Plus)', 'Fleischersatz', 'Meat Alternatives', 2.05, 2.45, '185g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Rostbratwurst Alternative', 'Vemondo Vegan Grilled Sausage Alternative', 'Fleischersatz', 'Meat Alternatives', 1.41, 1.67, '180g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Rostbratwurst Alternative (Lidl Plus)', 'Vemondo Vegan Grilled Sausage Alternative (Lidl Plus)', 'Fleischersatz', 'Meat Alternatives', 1.41, 1.67, '180g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Gyros-Alternative', 'Vemondo Vegan Gyros Alternative', 'Fleischersatz', 'Meat Alternatives', 1.69, 1.99, '300g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Gyros-Alternative (Lidl Plus)', 'Vemondo Vegan Gyros Alternative (Lidl Plus)', 'Fleischersatz', 'Meat Alternatives', 1.69, 1.99, '300g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Fleischalternative paniert', 'Vemondo Vegan Meat Alternative breaded', 'Fleischersatz', 'Meat Alternatives', 1.79, 2.12, '200g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Fleischalternative paniert (Lidl Plus)', 'Vemondo Vegan Meat Alternative breaded (Lidl Plus)', 'Fleischersatz', 'Meat Alternatives', 1.79, 2.12, '200g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Tortelloni versch. Sorten', 'Vemondo Vegan Tortelloni assorted', 'Fleischersatz', 'Meat Alternatives', 1.40, 1.79, '250g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Tortelloni (Lidl Plus)', 'Vemondo Vegan Tortelloni (Lidl Plus)', 'Fleischersatz', 'Meat Alternatives', 1.40, 1.79, '250g', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Veganer Bio Mandeldrink ohne Zucker', 'Vemondo Vegan Organic Almond Drink no Sugar', 'Milchprodukte', 'Dairy', 1.15, 1.35, '1L', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Veganer Bio Mandeldrink (Lidl Plus)', 'Vemondo Vegan Organic Almond Drink (Lidl Plus)', 'Milchprodukte', 'Dairy', 1.15, 1.35, '1L', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 23: Dauerhaft im Sortiment – Fleischersatz (Vemondo) ===
('1', 'Vemondo', 'Vemondo Vegane Nuggets Alternative', 'Vemondo Vegan Nuggets Alternative', 'Fleischersatz', 'Meat Alternatives', 2.19, NULL, '300g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Snack-Alternativen versch. Sorten', 'Vemondo Vegan Snack Alternatives assorted', 'Fleischersatz', 'Meat Alternatives', 1.99, NULL, '150g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Levervurst versch. Sorten', 'Vemondo Vegan Liver Sausage assorted', 'Fleischersatz', 'Meat Alternatives', 1.72, NULL, '150g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Veganer Reibegenuss', 'Vemondo Vegan Grated Cheese Alternative', 'Fleischersatz', 'Meat Alternatives', 0.99, NULL, '150g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Veganer Salat/Brotaufstrich versch. Sorten', 'Vemondo Vegan Salad/Spread assorted', 'Fleischersatz', 'Meat Alternatives', 0.99, NULL, 'versch. Sorten', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane No Bütter', 'Vemondo Vegan No Butter', 'Fleischersatz', 'Meat Alternatives', 1.19, NULL, '250g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),

-- === PAGE 24: Dauerhaft im Sortiment – Vemondo ===
('1', 'Vemondo', 'Vemondo Veganer Goldessa Aufstrich versch. Sorten', 'Vemondo Vegan Goldessa Spread assorted', 'Brotaufstrich', 'Spreads', 1.15, NULL, '175g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Soja Joghurtalternative versch. Sorten', 'Vemondo Vegan Soy Yogurt Alternative assorted', 'Milchprodukte', 'Dairy', 0.99, NULL, '500g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Veganer Bio Brotaufstrich Mango Curry', 'Vemondo Vegan Organic Spread Mango Curry', 'Brotaufstrich', 'Spreads', 1.25, NULL, '180g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Karamellkekse', 'Vemondo Vegan Caramel Cookies', 'Süßwaren', 'Sweets', 2.54, NULL, '200g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Fruitballs versch. Sorten', 'Vemondo Vegan Fruitballs assorted', 'Süßwaren', 'Sweets', 2.49, NULL, '144g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegane Muffins versch. Sorten', 'Vemondo Vegan Muffins assorted', 'Süßwaren', 'Sweets', 1.89, NULL, '360g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Veganer Bio Kakao Haferdrink', 'Vemondo Vegan Organic Cocoa Oat Drink', 'Milchprodukte', 'Dairy', 1.15, NULL, '1L', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Vemondo', 'Vemondo Vegan Food in a Bottle versch. Sorten', 'Vemondo Vegan Food in a Bottle assorted', 'Getränke', 'Beverages', 1.99, NULL, '500ml', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),

-- === PAGE 25: Dauerhaft im Sortiment – Milbona Käse ===
('1', 'Milbona', 'Milbona Edamer in Scheiben', 'Milbona Edam Sliced', 'Käse', 'Cheese', 1.99, 2.45, '400g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Französischer Camembert versch. Sorten', 'Milbona French Camembert assorted', 'Käse', 'Cheese', 2.19, 2.59, 'versch. Sorten', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Hirtenkäse in Salzlake', 'Milbona Shepherd''s Cheese in Brine', 'Käse', 'Cheese', 1.49, 1.79, '250g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Gratinkäse gerieben versch. Sorten', 'Milbona Grated Gratin Cheese assorted', 'Käse', 'Cheese', 1.49, 1.79, '250g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Gratinkäse (Lidl Plus)', 'Milbona Grated Gratin Cheese (Lidl Plus)', 'Käse', 'Cheese', 1.49, 1.79, '250g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Körniger Frischkäse', 'Milbona Cottage Cheese', 'Käse', 'Cheese', 1.49, 1.79, '300g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Cheddar versch. Sorten', 'Milbona Cheddar assorted', 'Käse', 'Cheese', 1.99, 2.39, 'versch. Sorten', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Bioland', 'Bioland Käsescheiben versch. Sorten', 'Bioland Cheese Slices assorted', 'Käse', 'Cheese', 1.79, NULL, '200g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Bioland', 'Bioland Käsescheiben (Lidl Plus)', 'Bioland Cheese Slices (Lidl Plus)', 'Käse', 'Cheese', 1.79, NULL, '200g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Bioland', 'Bioland Käse am Stück versch. Sorten', 'Bioland Cheese Block assorted', 'Käse', 'Cheese', 1.99, NULL, '200g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Bioland', 'Bioland Käse am Stück (Lidl Plus)', 'Bioland Cheese Block (Lidl Plus)', 'Käse', 'Cheese', 1.99, NULL, '200g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Käse Aufschnitt versch. Sorten', 'Milbona Cheese Cold Cuts assorted', 'Käse', 'Cheese', 1.59, 1.89, '250g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Käse Aufschnitt (Lidl Plus)', 'Milbona Cheese Cold Cuts (Lidl Plus)', 'Käse', 'Cheese', 1.59, 1.89, '250g', '2026-04-13', '2026-04-18', false, 'https://www.lidl.de'),

-- === PAGE 27: Hausbar / Spirituosen (nur online) ===
('1', 'Hennessy', 'Hennessy Very Special Cognac', 'Hennessy Very Special Cognac', 'Alkoholische Getränke', 'Alcoholic Beverages', 29.99, 35.99, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Mr. Finton''s', 'Mr. Finton''s Gin/Vodka', 'Mr. Finton''s Gin/Vodka', 'Alkoholische Getränke', 'Alcoholic Beverages', 7.99, 9.99, '500ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Don Papa', 'Don Papa Baroko Rum', 'Don Papa Baroko Rum', 'Alkoholische Getränke', 'Alcoholic Beverages', 29.99, 39.99, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Ron Rumbero', 'Ron Rumbero Kubanischer Rum 7 Jahre', 'Ron Rumbero Cuban Rum 7 Years', 'Alkoholische Getränke', 'Alcoholic Beverages', 12.99, 14.99, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Vega Cadur', 'Vega Cadur Brandy de Jerez Solera Reserva', 'Vega Cadur Brandy de Jerez Solera Reserva', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, 14.99, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Fireball', 'Fireball Likör Zimt- und Whiskygeschmack', 'Fireball Cinnamon Whisky Liqueur', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, 13.99, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 28: Spirituosen (nur online) ===
('1', 'Bushmills', 'Bushmills Single Malt Irish Whiskey 10 Jahre', 'Bushmills Single Malt Irish Whiskey 10 Years', 'Alkoholische Getränke', 'Alcoholic Beverages', 24.99, 32.99, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Wild Burrow', 'Wild Burrow Slow Distilled Irish Gin', 'Wild Burrow Slow Distilled Irish Gin', 'Alkoholische Getränke', 'Alcoholic Beverages', 11.99, 16.99, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Superb', 'Superb Doppelmagnum Vodka 3L', 'Superb Double Magnum Vodka 3L', 'Alkoholische Getränke', 'Alcoholic Beverages', 29.99, 39.99, '3L', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lagavulin', 'Lagavulin Islay Single Malt Scotch Whisky 16 Jahre', 'Lagavulin Islay Single Malt Scotch Whisky 16 Years', 'Alkoholische Getränke', 'Alcoholic Beverages', 69.99, 89.99, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Alliance', 'Alliance Kruskovac', 'Alliance Pear Liqueur', 'Alkoholische Getränke', 'Alcoholic Beverages', 8.99, 11.99, '1L', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Ben Bracken', 'Ben Bracken Highland Single Malt Scotch Whisky Peated 12 Jahre', 'Ben Bracken Highland Single Malt Scotch Whisky Peated 12 Years', 'Alkoholische Getränke', 'Alcoholic Beverages', 29.99, 39.99, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Ben Bracken', 'Ben Bracken Highland Single Malt Scotch Whisky Peated 17 Jahre', 'Ben Bracken Highland Single Malt Scotch Whisky Peated 17 Years', 'Alkoholische Getränke', 'Alcoholic Beverages', 47.99, 59.99, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Ben Bracken', 'Ben Bracken Speyside Single Malt Scotch Whisky', 'Ben Bracken Speyside Single Malt Scotch Whisky', 'Alkoholische Getränke', 'Alcoholic Beverages', 13.99, 17.99, '700ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 29: Wein (nur online / Ab Mo. 13.4.) ===
('1', 'Lidl', 'Weinpaket Weißburgunder/Sauvignon Blanc QbA', 'Wine Pack Pinot Blanc/Sauvignon Blanc QbA', 'Alkoholische Getränke', 'Alcoholic Beverages', 34.99, 59.94, '6x750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Deutsches Weintor', 'Deutsches Weintor Edition Mild Dornfelder versch. Sorten', 'Deutsches Weintor Edition Mild Dornfelder assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.79, 5.29, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Deidesheimer Weinmanufaktur', 'Deidesheimer Weinmanufaktur Hofstück Riesling QbA trocken', 'Deidesheimer Weinmanufaktur Hofstück Riesling QbA dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 4.99, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Riesling Scheurebe QbA halbtrocken', 'Riesling Scheurebe QbA off-dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 4.99, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Schaubeck 1272', 'Schaubeck 1272 Spätburgunder QbA trocken', 'Schaubeck 1272 Pinot Noir QbA dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, 6.99, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 30: Wein (nur online) ===
('1', 'Heidsieck & Co', 'Heidsieck & Co Monopole Blue Top Champagner brut', 'Heidsieck & Co Monopole Blue Top Champagne brut', 'Alkoholische Getränke', 'Alcoholic Beverages', 24.99, 33.99, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Reine Eleonore', 'Reine Eleonore Coteaux d''Aix-en-Provence AOP', 'Reine Eleonore Coteaux d''Aix-en-Provence AOP', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.79, 7.99, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Deluxe', 'Deluxe Chianti DOCG Nuova Generazione Rotwein trocken', 'Deluxe Chianti DOCG Nuova Generazione Red Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.99, 9.99, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Cloudy Bay', 'Cloudy Bay Sauvignon Blanc Weißwein trocken', 'Cloudy Bay Sauvignon Blanc White Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 23.99, 26.90, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', '5 Oros', '5 Oros Crianza DOCa Rotwein trocken', '5 Oros Crianza DOCa Red Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.99, 8.99, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Andean Vineyards', 'Andean Vineyards Chardonnay/Malbec versch. Sorten', 'Andean Vineyards Chardonnay/Malbec assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, 9.99, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Sansibar Deluxe', 'Sansibar Deluxe Primitivo di Manduria Reserva DOC', 'Sansibar Deluxe Primitivo di Manduria Reserva DOC', 'Alkoholische Getränke', 'Alcoholic Beverages', 7.99, 9.99, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Bonot Père & Fils', 'Bonot Père & Fils Crémant de Bourgogne Prestige AOC', 'Bonot Père & Fils Crémant de Bourgogne Prestige AOC', 'Alkoholische Getränke', 'Alcoholic Beverages', 8.99, 11.99, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Château d''Arsac', 'Château d''Arsac Margaux Cru Bourgeois Exceptionnel AOC', 'Château d''Arsac Margaux Cru Bourgeois Exceptionnel AOC', 'Alkoholische Getränke', 'Alcoholic Beverages', 19.99, 29.99, '750ml', '2026-04-13', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 60: Ab Do. 16.4. – Wein ===
('1', 'Hammel & Cie', 'Hammel & Cie Riesling & Weißburgunder Weißwein trocken', 'Hammel & Cie Riesling & Pinot Blanc White Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 4.99, '750ml', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Weingut Spreitzer', 'Weingut Spreitzer Riesling Ader VDP Weißwein trocken', 'Weingut Spreitzer Riesling Ader VDP White Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.99, 6.99, '750ml', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Rheinhessen Wine Lovers', 'Rheinhessen Wine Lovers Traumpaar Weissburgunder & Grauburgunder trocken', 'Rheinhessen Wine Lovers Traumpaar Pinot Blanc & Pinot Gris dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 4.99, '750ml', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Rheinhessen Wine Lovers', 'Rheinhessen Wine Lovers Traumprinz Roséwein halbtrocken', 'Rheinhessen Wine Lovers Traumprinz Rosé off-dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 4.99, '750ml', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Weingut Balthasar Ress', 'Weingut Balthasar Ress Rheinkind Riesling VDP Gutswein feinherb', 'Weingut Balthasar Ress Rheinkind Riesling VDP Gutswein off-dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 7.99, 12.99, '750ml', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Spätburgunder Weißherbst Baden QbA Roséwein halbtrocken', 'Pinot Noir Rosé Wine Baden QbA off-dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.79, 2.29, '750ml', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Junge Winzer', 'Junge Winzer Spätburgunder Rotwein trocken', 'Junge Winzer Pinot Noir Red Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, 5.99, '750ml', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Trollinger mit Lemberger QbA Rotwein feinherb', 'Trollinger with Lemberger QbA Red Wine off-dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.79, 3.99, '1L', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 61: Ab Do. 16.4. – Regionaler Genuss ===
('1', 'Settele', 'Settele Maultaschen versch. Sorten', 'Settele Swabian Pasta Pockets assorted', 'Fertiggerichte', 'Ready Meals', 1.79, NULL, '300g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Nothwang', 'Nothwang Aufschnitt XXL versch. Sorten', 'Nothwang Cold Cuts XXL assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.39, '150g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Alpenfest', 'Alpenfest Schweinehaxe', 'Alpenfest Pork Knuckle', 'Fleisch & Wurst', 'Meat & Sausage', 4.79, NULL, '600g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Dulano', 'Dulano Münchner Weißwurst', 'Dulano Munich White Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, NULL, '8 Stück', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Ein Gutes Stück Bayern', 'Ein Gutes Stück Bayern Weichkäse versch. Sorten', 'Ein Gutes Stück Bayern Soft Cheese assorted', 'Käse', 'Cheese', 3.49, NULL, '350g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Pahmeyer', 'Pahmeyer Reibekuchen XXL', 'Pahmeyer Hash Browns XXL', 'Tiefkühl', 'Frozen', 2.99, 3.99, '640g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Remagen', 'Remagen Griller versch. Sorten', 'Remagen Griller Sausages assorted', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, 5.29, '500g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Chef Select', 'Chef Select Kartoffelsalat versch. Sorten', 'Chef Select Potato Salad assorted', 'Fertiggerichte', 'Ready Meals', 1.69, NULL, '400g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 62: Ab Do. 16.4. – Diverses ===
('1', 'Wolf', 'Wolf Thüringer Knackwurst versch. Sorten', 'Wolf Thuringian Knackwurst assorted', 'Fleisch & Wurst', 'Meat & Sausage', 2.29, 2.69, '225g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Spreewaldhof', 'Spreewaldhof Spreewälder Gurken versch. Sorten', 'Spreewaldhof Spreewald Pickles assorted', 'Saucen & Gewürze', 'Sauces & Spices', 1.79, 2.59, '720ml', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lecker-Mäulchen', 'Lecker-Mäulchen Milch-Quark versch. Sorten', 'Lecker-Mäulchen Milk Quark assorted', 'Milchprodukte', 'Dairy', 0.66, 0.99, '150g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Confiserie Firenze', 'Confiserie Firenze Mini-Berliner versch. Sorten', 'Confiserie Firenze Mini Doughnuts assorted', 'Tiefkühl', 'Frozen', 2.49, NULL, '9x36g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Milram', 'Milram Käsescheiben XXL versch. Sorten', 'Milram Cheese Slices XXL assorted', 'Käse', 'Cheese', 2.89, 3.39, '260g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Holtseer', 'Holtseer Käse versch. Sorten', 'Holtseer Cheese assorted', 'Käse', 'Cheese', 2.49, 2.79, '250g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Appel', 'Appel Zarte Filets vom Hering versch. Sorten', 'Appel Tender Herring Fillets assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.11, 1.99, '200g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Femeg', 'Femeg Schollenfilet aus der Nordsee', 'Femeg Plaice Fillet from the North Sea', 'Tiefkühl', 'Frozen', 3.79, 4.29, '250g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 63: Ab Do. 16.4. – Obst & Gemüse ===
('1', 'Lidl', 'Porree', 'Leek', 'Obst & Gemüse', 'Fruits & Vegetables', 0.44, NULL, 'Stück', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Deutsche Speisekartoffeln', 'German Potatoes', 'Obst & Gemüse', 'Fruits & Vegetables', 2.29, NULL, '5kg', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Rote Äpfel', 'Red Apples', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, NULL, '1kg', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Lidl', 'Mandarinen/Clementinen', 'Mandarins/Clementines', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, NULL, '1kg', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 64: Ab Do. 16.4. – Fleisch & Fisch ===
('1', 'Grillmeister', 'Grillmeister Schweine-Schwenksteaks versch. Sorten', 'Grillmeister Pork Swing Steaks assorted', 'Fleisch & Wurst', 'Meat & Sausage', 6.99, NULL, '900g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Fischerstolz', 'Fischerstolz MSC Knusper-Backfisch', 'Fischerstolz MSC Crispy Battered Fish', 'Tiefkühl', 'Frozen', 4.99, NULL, '560g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch Frische Schweineschnitzel', 'Metzgerfrisch Fresh Pork Escalopes', 'Fleisch & Wurst', 'Meat & Sausage', 5.55, NULL, '800g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch Frische Schweine-Koteletts', 'Metzgerfrisch Fresh Pork Chops', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, NULL, '1kg', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Grillmeister', 'Grillmeister Frische Bratwurst Merguez', 'Grillmeister Fresh Merguez Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 7.77, NULL, '600g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Olivia', 'Olivia Ganzes Kaninchen', 'Olivia Whole Rabbit', 'Fleisch & Wurst', 'Meat & Sausage', 10.99, NULL, '1.2kg', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch Frische Schweinebauchscheiben', 'Metzgerfrisch Fresh Pork Belly Slices', 'Fleisch & Wurst', 'Meat & Sausage', 6.66, NULL, '1kg', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch Rinderbeinscheiben mit Knochen', 'Metzgerfrisch Beef Shin Slices with Bone', 'Fleisch & Wurst', 'Meat & Sausage', 9.99, NULL, '1kg', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Grillmeister', 'Grillmeister Schweine-Bifteki mariniert', 'Grillmeister Pork Bifteki marinated', 'Fleisch & Wurst', 'Meat & Sausage', 2.22, NULL, '320g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 65: Ab Do. 16.4. – Milch / Getränke / Snacks ===
('1', 'Müller', 'Müller Fruchtbuttermilch versch. Sorten', 'Müller Fruit Buttermilk assorted', 'Milchprodukte', 'Dairy', 0.69, 1.39, '500g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Volvic', 'Volvic Touch/Tee versch. Sorten', 'Volvic Touch/Tea assorted', 'Getränke', 'Beverages', 0.99, 1.89, '1.5L', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Dr. Oetker', 'Dr. Oetker Ristorante Pizza/Bistro Flammkuchen', 'Dr. Oetker Ristorante Pizza/Bistro Flammkuchen', 'Tiefkühl', 'Frozen', 3.99, 6.78, '2er-Pack', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Chio', 'Chio Tortillas versch. Sorten', 'Chio Tortillas assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 1.79, 2.99, '225g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Yo', 'Yo Sirup versch. Sorten', 'Yo Syrup assorted', 'Getränke', 'Beverages', 2.49, 3.79, '700ml', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 66: Ab Do. 16.4. – Diverses ===
('1', 'Nutella', 'Nutella Eis', 'Nutella Ice Cream', 'Eiscreme', 'Ice Cream', 4.44, 5.49, '470ml', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Nestlé', 'Nestlé Eis versch. Sorten', 'Nestlé Ice Cream assorted', 'Eiscreme', 'Ice Cream', 2.22, 3.79, 'versch. Sorten', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Granini', 'Granini Die Limo versch. Sorten', 'Granini Die Limo assorted', 'Getränke', 'Beverages', 1.29, 1.79, '1L', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Chef Select', 'Chef Select Sushi Push Up versch. Sorten', 'Chef Select Sushi Push Up assorted', 'Fertiggerichte', 'Ready Meals', 3.99, NULL, '175g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Arla', 'Arla Skyr versch. Sorten', 'Arla Skyr assorted', 'Milchprodukte', 'Dairy', 1.49, 1.99, '450g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'MM Extra', 'MM Extra Sekt versch. Sorten', 'MM Extra Sparkling Wine assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.99, 4.49, '750ml', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Mövenpick', 'Mövenpick Pudding/Feinjoghurt versch. Sorten', 'Mövenpick Pudding/Fine Yogurt assorted', 'Milchprodukte', 'Dairy', 0.69, 0.99, '150g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Yogurette', 'Yogurette/Kinder Schokolade versch. Sorten', 'Yogurette/Kinder Chocolate assorted', 'Süßwaren', 'Sweets', 5.19, NULL, '4x100g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Capico', 'Capico Knusper Röllchen versch. Sorten', 'Capico Crispy Wafer Rolls assorted', 'Süßwaren', 'Sweets', 0.99, 1.19, '75g', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Melitta', 'Melitta BellaCrema Ganze Bohnen versch. Sorten', 'Melitta BellaCrema Whole Beans assorted', 'Kaffee & Tee', 'Coffee & Tea', 13.99, NULL, '1kg', '2026-04-16', '2026-04-18', true, 'https://www.lidl.de'),

-- === PAGE 67: Ab Fr. 17.4. bis Sa. 18.4. ===
('1', 'Langnese', 'Langnese Cornetto versch. Sorten', 'Langnese Cornetto assorted', 'Eiscreme', 'Ice Cream', 2.49, 4.45, 'versch. Sorten', '2026-04-17', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Langnese', 'Langnese Cornetto (Lidl Plus)', 'Langnese Cornetto (Lidl Plus)', 'Eiscreme', 'Ice Cream', 2.49, 4.45, 'versch. Sorten', '2026-04-17', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch Premium Lammspieße mariniert', 'Metzgerfrisch Premium Lamb Skewers marinated', 'Fleisch & Wurst', 'Meat & Sausage', 5.50, NULL, '275g', '2026-04-17', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Weihenstephan', 'Weihenstephan Butter/Die Streichzarte ungesalzen', 'Weihenstephan Unsalted Butter', 'Butter', 'Butter', 1.39, 2.79, '250g', '2026-04-17', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Funny-Frisch', 'Funny-Frisch Chipsfrisch XXL versch. Sorten', 'Funny-Frisch Chips XXL assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 1.79, 2.79, '215g', '2026-04-17', '2026-04-18', true, 'https://www.lidl.de'),
('1', 'Whiskas', 'Whiskas Portionsbeutel versch. Sorten', 'Whiskas Pouch assorted', 'Tierbedarf', 'Pet Supplies', 14.99, 27.99, '60x85g', '2026-04-17', '2026-04-18', true, 'https://www.lidl.de');
