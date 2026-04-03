-- Penny Prospekt: Mo, 30.3. bis Sa, 4.4.2026
-- Source: kaufDA - Penny - Wer günstig will, muss Penny
-- store_id = '3'

-- First: Delete old offers for this store
DELETE FROM public.offers WHERE store_id = '3' AND is_offer = true;

-- Then: Insert new offers
INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2: Hauptangebote Mo. 30.3. bis Sa. 4.4. ===
('3', 'Ferrero', 'Nutella 750g+50g gratis', 'Nutella 750g+50g free', 'Brotaufstrich', 'Spreads', 4.49, 5.29, '800g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Hohes C', 'Hohes C Orangensaft versch. Sorten', 'Hohes C Orange Juice assorted', 'Getränke', 'Beverages', 1.39, 2.99, '1L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Meggle', 'Meggle Feine Butter', 'Meggle Fine Butter', 'Milchprodukte', 'Dairy', 1.11, 2.59, '250g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Mango', 'Mango', 'Obst & Gemüse', 'Fruits & Vegetables', 0.69, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Coca-Cola', 'Coca-Cola/Fanta/Mezzo Mix/Sprite', 'Coca-Cola/Fanta/Mezzo Mix/Sprite', 'Getränke', 'Beverages', 0.89, NULL, '1.25L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Coca-Cola', 'Coca-Cola/Fanta/Mezzo Mix/Sprite mit Penny App', 'Coca-Cola/Fanta/Mezzo Mix/Sprite with Penny App', 'Getränke', 'Beverages', 0.79, 1.59, '1.25L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Ariel', 'Ariel Waschmittel 100 Waschladungen', 'Ariel Detergent 100 Washes', 'Haushalt', 'Household', 21.99, NULL, '100WL', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Jacobs', 'Jacobs Krönung versch. Sorten', 'Jacobs Krönung assorted', 'Kaffee & Tee', 'Coffee & Tea', 5.69, 10.69, '500g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Prezent', 'Prezent Sekt versch. Sorten', 'Prezent Sparkling Wine assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.79, 5.29, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Prezent', 'Prezent Frizzante versch. Sorten', 'Prezent Frizzante assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 6.79, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Prezent', 'Prezent Wein versch. Sorten', 'Prezent Wine assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.69, 6.69, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 3: Dauerhaft Günstiger ===
('3', 'Eigenmarke', 'Italien Pinot Grigio DOC', 'Italian Pinot Grigio DOC', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.69, 2.79, '0.75L', '2026-03-30', '2026-04-04', false, 'https://www.penny.de'),
('3', 'Maître Philippe', 'Maître Philippe Merlot Vin de France', 'Maître Philippe Merlot Vin de France', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.99, 2.19, '0.75L', '2026-03-30', '2026-04-04', false, 'https://www.penny.de'),

-- === PAGE 4: Eigenmarke Süßwaren ===
('3', 'Cono', 'Cono Schoko-Waffelröllchen Zartbitter', 'Cono Chocolate Wafer Rolls Dark', 'Süßwaren', 'Sweets', 1.79, NULL, '125g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Cono', 'Cono Schoko-Waffelröllchen Vollmilch', 'Cono Chocolate Wafer Rolls Milk', 'Süßwaren', 'Sweets', 1.79, NULL, '125g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Cono', 'Cono Butterkeks', 'Cono Butter Biscuits', 'Süßwaren', 'Sweets', 1.89, NULL, '2x200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Penny Cho Quick Kakao-Getränkepulver', 'Penny Cho Quick Cocoa Drink Powder', 'Getränke', 'Beverages', 3.99, 6.99, '800g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Chocola', 'Chocola Cho Quick Kakaopulver', 'Chocola Cho Quick Cocoa Powder', 'Getränke', 'Beverages', 3.99, 6.99, '800g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 5: Obst & Gemüse Mo. 30.3. bis Sa. 4.4. ===
('3', 'Best Moments', 'Best Moments Erdbeeren Calinda', 'Best Moments Strawberries Calinda', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, NULL, '500g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Orangen im Netz', 'Oranges in Net', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, NULL, '2kg', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Deutsche Äpfel', 'German Apples', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, 1.59, '2kg', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 6: Obst & Gemüse Mo. 30.3. bis Sa. 4.4. ===
('3', 'Naturgut', 'Naturgut Bio Babyspinat', 'Naturgut Organic Baby Spinach', 'Obst & Gemüse', 'Fruits & Vegetables', 1.00, NULL, '125g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Schalotten im Netz', 'Shallots in Net', 'Obst & Gemüse', 'Fruits & Vegetables', 1.00, 2.49, '500g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Deutscher Porree', 'German Leek', 'Obst & Gemüse', 'Fruits & Vegetables', 0.45, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Rotschalige Kartoffeln', 'Best Moments Red-skinned Potatoes', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, NULL, '1kg', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 7: Fleisch Mo. 30.3. bis Sa. 4.4. ===
('3', 'Eigenmarke', 'Junge bayerische Ente', 'Young Bavarian Duck', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, NULL, 'ca. 1.8kg', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Frische Rinderrouladen XXL Packung', 'Fresh Beef Roulades XXL Pack', 'Fleisch & Wurst', 'Meat & Sausage', 12.99, NULL, '600g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Frisches Schweinelachs-Filet', 'Mühlenhof Fresh Pork Loin Fillet', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, NULL, '300g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Frische Truthahnkeule', 'Fresh Turkey Leg', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, NULL, 'kg', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Deutsches Rinder-Entrecôte', 'Best Moments German Beef Entrecôte', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Frische Lammkeule', 'Best Moments Fresh Lamb Leg', 'Fleisch & Wurst', 'Meat & Sausage', 12.99, NULL, 'ca. 3.5kg', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Frische Puten-Bratenaufschnitt', 'Mühlenhof Fresh Turkey Roast Slices', 'Fleisch & Wurst', 'Meat & Sausage', 7.99, 9.59, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Frisches Hähnchen Grillfertig', 'Mühlenhof Fresh Chicken Ready to Grill', 'Fleisch & Wurst', 'Meat & Sausage', 6.99, NULL, 'ca. 1.2kg', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Schinkenkrustenbraten', 'Mühlenhof Crusted Ham Roast', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Frische Truthahnkeule/Putenkeule', 'Fresh Turkey Leg', 'Fleisch & Wurst', 'Meat & Sausage', 14.99, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 8: Wurst Mo. 30.3. bis Sa. 4.4. ===
('3', 'Mühlenhof', 'Mühlenhof Delikatess Wiener Würstchen XXL', 'Mühlenhof Delicatessen Vienna Sausages XXL', 'Fleisch & Wurst', 'Meat & Sausage', 6.44, 7.79, 'XXL Pack', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Wiesenhof', 'Wiesenhof Geflügel Edel Salami XXL Familien-Packung', 'Wiesenhof Poultry Premium Salami XXL Family Pack', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, NULL, 'XXL Pack', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Aufschnitt XXL versch. Sorten', 'Mühlenhof Cold Cuts XXL assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.19, NULL, 'XXL Pack', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Wiesenhof', 'Wiesenhof Spitzenqualitäts-Hähnchenbrust-Aufschnitt', 'Wiesenhof Premium Chicken Breast Cold Cuts', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, NULL, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Würzburger gebackener Fleischkäse', 'Mühlenhof Würzburg Baked Meatloaf', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.69, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Steinhaus', 'Steinhaus Burger mit Käse', 'Steinhaus Burger with Cheese', 'Fleisch & Wurst', 'Meat & Sausage', 4.44, NULL, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Krakauer Rauchwürstchen', 'Krakauer Smoked Sausages', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, NULL, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Dreistern', 'Dreistern Gulasch vom Rind', 'Dreistern Beef Goulash', 'Fertiggerichte', 'Ready Meals', 2.99, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Aoste', 'Aoste Stickado Classique', 'Aoste Stickado Classique', 'Fleisch & Wurst', 'Meat & Sausage', 1.79, NULL, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 9: Käse & Tiefkühl Mo. 30.3. bis Sa. 4.4. ===
('3', 'Philadelphia', 'Philadelphia Frischkäse Original versch. Sorten', 'Philadelphia Cream Cheese Original assorted', 'Käse', 'Cheese', 0.89, 2.29, '175g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Seeberger', 'Seeberger Brotchips versch. Sorten', 'Seeberger Bread Chips assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 5.85, NULL, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Rücker', 'Rücker Käse versch. Sorten', 'Rücker Cheese assorted', 'Käse', 'Cheese', 1.99, 2.29, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'San Fabio', 'San Fabio Mozzarella', 'San Fabio Mozzarella', 'Käse', 'Cheese', 0.66, 0.85, '125g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Géramont', 'Géramont Käseschalen versch. Sorten', 'Géramont Cheese Tubs assorted', 'Käse', 'Cheese', 2.22, 3.49, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Leerdammer', 'Leerdammer Käse-Körbchen versch. Sorten', 'Leerdammer Cheese Basket assorted', 'Käse', 'Cheese', 1.39, 2.49, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Coppenrath & Wiese', 'Coppenrath & Wiese Brötchen versch. Sorten', 'Coppenrath & Wiese Rolls assorted', 'Tiefkühl', 'Frozen', 1.11, 2.29, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Meica', 'Meica Curry King Big Box', 'Meica Curry King Big Box', 'Fertiggerichte', 'Ready Meals', 4.99, NULL, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'McCain', 'McCain Kroketten Trio', 'McCain Croquettes Trio', 'Tiefkühl', 'Frozen', 1.59, 2.85, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 10: Milchprodukte Mo. 30.3. bis Sa. 4.4. ===
('3', 'Dr. Oetker', 'Dr. Oetker Crème fraîche versch. Sorten', 'Dr. Oetker Crème fraîche assorted', 'Milchprodukte', 'Dairy', 0.99, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Brunch', 'Brunch Brotaufstrich versch. Sorten', 'Brunch Bread Spread assorted', 'Brotaufstrich', 'Spreads', 1.19, NULL, '185g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Rama', 'Rama Brotaufstrich versch. Sorten', 'Rama Bread Spread assorted', 'Brotaufstrich', 'Spreads', 1.29, 2.29, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Weihenstephan', 'Weihenstephan Haltbare Milch 3,5%', 'Weihenstephan Long-life Milk 3.5%', 'Milchprodukte', 'Dairy', 0.99, 1.59, '1L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Müller', 'Müller Milchreis versch. Sorten', 'Müller Rice Pudding assorted', 'Milchprodukte', 'Dairy', 0.66, 1.49, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Naturgut', 'Naturgut Fruchtjoghurt versch. Sorten', 'Naturgut Fruit Yogurt assorted', 'Milchprodukte', 'Dairy', 0.59, 0.99, '250g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Kinder', 'Kinder Choco fresh', 'Kinder Choco fresh', 'Süßwaren', 'Sweets', 1.49, 2.19, '5 Stück', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Zott', 'Zott Monte versch. Sorten', 'Zott Monte assorted', 'Milchprodukte', 'Dairy', 1.49, 2.69, '4x55g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Milbona', 'Milbona Sahnejoghurt versch. Sorten', 'Milbona Cream Yogurt assorted', 'Milchprodukte', 'Dairy', 0.49, 0.59, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Langnese', 'Langnese Cremissimo versch. Sorten', 'Langnese Cremissimo assorted', 'Eiscreme', 'Ice Cream', 1.49, 3.99, '900ml', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Coppenrath & Wiese', 'Coppenrath & Wiese Festtagstorte/Bunte Sahne Platte', 'Coppenrath & Wiese Festive Cake/Cream Platter', 'Tiefkühl', 'Frozen', 7.99, 13.79, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 11: Fisch Berida Mo. 30.3. bis Sa. 4.4. ===
('3', 'Berida', 'Berida Lachsfilet versch. Sorten', 'Berida Salmon Fillet assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 4.99, 5.99, '300g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Muscheln in versch. Saucen', 'Berida Mussels in assorted Sauces', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, NULL, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Bratheringsfilets', 'Berida Fried Herring Fillets', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, NULL, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Heringsfilets versch. Sorten', 'Berida Herring Fillets assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.09, NULL, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Sahne-/Gabelhappen', 'Berida Cream/Fork Bites', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, NULL, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Isla Matjesfilet versch. Sorten', 'Berida Isla Matjes Fillet assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, NULL, '250g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Thunfischfilets in Öl/Wasser', 'Berida Tuna Fillets in Oil/Water', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 0.99, 1.29, '150g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 12: Fisch Berida TK Mo. 30.3. bis Sa. 4.4. ===
('3', 'Berida', 'Berida Lachsfilet Natur TK', 'Berida Salmon Fillet Natural Frozen', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 4.99, NULL, '250g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Wildlachsfilet TK', 'Berida Wild Salmon Fillet Frozen', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.79, NULL, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Lachsstücke von Lachsfilet TK', 'Berida Salmon Pieces Frozen', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.69, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Lachs Portionen zum Braten', 'Salmon Portions for Frying', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 7.49, 9.49, '2x125g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Alaska-Seelachsfilet & Hähnchenstücke TK', 'Berida Alaska Pollock Fillet & Chicken Pieces Frozen', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 4.79, NULL, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Alaska-Seelachsfilet TK', 'Berida Alaska Pollock Fillet Frozen', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 5.89, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Zanderfilet TK', 'Berida Pike-Perch Fillet Frozen', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 4.99, NULL, '250g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Kabeljaufilet/Lachsrückenfilet TK', 'Berida Cod/Salmon Back Fillet Frozen', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.49, NULL, '250g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida White Tiger Garnelen', 'Berida White Tiger Shrimp', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 6.99, 7.99, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 13: Greenland Konserven Mo. 30.3. bis Sa. 4.4. ===
('3', 'Greenland', 'Greenland Feldgurken', 'Greenland Field Cucumbers', 'Grundnahrungsmittel', 'Staples', 1.49, 1.89, '530g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Gewürzgurken versch. Sorten', 'Greenland Pickled Cucumbers assorted', 'Grundnahrungsmittel', 'Staples', 1.19, NULL, '340g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Rote Bete', 'Greenland Beetroot', 'Grundnahrungsmittel', 'Staples', 1.09, NULL, '480g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Bohnen/Staudensellerie', 'Greenland Beans/Celery', 'Grundnahrungsmittel', 'Staples', 0.99, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Salat-Mayonnaise/Remoulade', 'Greenland Salad Mayonnaise/Remoulade', 'Saucen & Gewürze', 'Sauces & Spices', 1.89, NULL, '500ml', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Sauerkirschen', 'Greenland Sour Cherries', 'Grundnahrungsmittel', 'Staples', 3.69, NULL, '720ml', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Apfelmark/Apfelmus', 'Greenland Apple Sauce/Apple Puree', 'Grundnahrungsmittel', 'Staples', 0.99, NULL, '2x360g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 14: Greenland Konserven & TK Mo. 30.3. bis Sa. 4.4. ===
('3', 'Greenland', 'Greenland Erbsen mit Möhren', 'Greenland Peas with Carrots', 'Grundnahrungsmittel', 'Staples', 0.89, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Sonnenmais', 'Greenland Sweet Corn', 'Grundnahrungsmittel', 'Staples', 0.89, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Champignons 3. Wahl geschnitten', 'Greenland Mushrooms 3rd Choice sliced', 'Grundnahrungsmittel', 'Staples', 0.69, 0.79, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Linsen', 'Greenland Lentils', 'Grundnahrungsmittel', 'Staples', 1.19, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Kidney-Bohnen', 'Greenland Kidney Beans', 'Grundnahrungsmittel', 'Staples', 0.49, 0.69, '250g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Rahmspinat TK', 'Greenland Creamed Spinach Frozen', 'Tiefkühl', 'Frozen', 1.89, NULL, '450g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Gemüsepfanne versch. Sorten TK', 'Greenland Vegetable Pan assorted Frozen', 'Tiefkühl', 'Frozen', 1.99, NULL, '750g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Beeren-Mischung TK', 'Greenland Berry Mix Frozen', 'Tiefkühl', 'Frozen', 2.99, 3.49, '750g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Buttergemüse TK', 'Greenland Buttered Vegetables Frozen', 'Tiefkühl', 'Frozen', 1.09, NULL, '300g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Mango TK', 'Greenland Mango Frozen', 'Tiefkühl', 'Frozen', 2.99, 3.49, '500g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 15: Best Moments Mo. 30.3. bis Sa. 4.4. ===
('3', 'Best Moments', 'Best Moments Burrata', 'Best Moments Burrata', 'Käse', 'Cheese', 2.79, NULL, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Heidelbeeren', 'Best Moments Blueberries', 'Obst & Gemüse', 'Fruits & Vegetables', 2.79, 3.39, '350g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Camembert', 'Best Moments Camembert', 'Käse', 'Cheese', 2.59, NULL, '250g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Käse versch. Sorten', 'Best Moments Cheese assorted', 'Käse', 'Cheese', 2.79, NULL, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Prosciutto versch. Sorten', 'Best Moments Prosciutto assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '100g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 16: Best Moments Feinkost Mo. 30.3. bis Sa. 4.4. ===
('3', 'Best Moments', 'Best Moments Lachsforellen-Filet geräuchert', 'Best Moments Smoked Salmon Trout Fillet', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.99, NULL, '125g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Antipasti Mozzarella', 'Best Moments Antipasti Mozzarella', 'Käse', 'Cheese', 3.99, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Parmaschinken', 'Best Moments Parma Ham', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '80g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Mortadella', 'Best Moments Mortadella', 'Fleisch & Wurst', 'Meat & Sausage', 1.79, NULL, '70g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Salami versch. Sorten', 'Best Moments Salami assorted', 'Fleisch & Wurst', 'Meat & Sausage', 2.79, NULL, '80g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Pilatus', 'Pilatus Schweine-Medaillons im Speckmantel', 'Pilatus Pork Medallions in Bacon', 'Fleisch & Wurst', 'Meat & Sausage', 4.49, NULL, '300g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Premium-Fleischsalat', 'Best Moments Premium Meat Salad', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Gefüllte Gnocchi', 'Best Moments Stuffed Gnocchi', 'Fertiggerichte', 'Ready Meals', 2.29, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Beurre Noisette versch. Sorten', 'Best Moments Brown Butter assorted', 'Milchprodukte', 'Dairy', 1.89, NULL, '100g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Pralinen versch. Sorten', 'Best Moments Pralines assorted', 'Süßwaren', 'Sweets', 2.22, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Likör-Eier versch. Sorten', 'Best Moments Liqueur Eggs assorted', 'Süßwaren', 'Sweets', 2.22, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 17: Douceur Ostern Mo. 30.3. bis Sa. 4.4. ===
('3', 'Douceur', 'Douceur Bunthase-Ei Schokolade', 'Douceur Colorful Bunny Egg Chocolate', 'Süßwaren', 'Sweets', 9.99, 11.95, '350g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Douceur', 'Douceur Ostfiguren versch. Sorten', 'Douceur Easter Figures assorted', 'Süßwaren', 'Sweets', 1.49, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Douceur', 'Douceur Schokohase', 'Douceur Chocolate Bunny', 'Süßwaren', 'Sweets', 2.29, NULL, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Best Moments', 'Best Moments Pralineneier', 'Best Moments Praline Eggs', 'Süßwaren', 'Sweets', 0.99, NULL, '50g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Douceur', 'Douceur Osterfiguren versch. Sorten', 'Douceur Easter Figures assorted', 'Süßwaren', 'Sweets', 1.79, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Douceur', 'Douceur Nester Schokolade', 'Douceur Chocolate Nests', 'Süßwaren', 'Sweets', 2.99, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 18: Douceur Ostern Mo. 30.3. bis Sa. 4.4. ===
('3', 'Douceur', 'Douceur Bunte Schoko-Eier versch. Sorten', 'Douceur Colorful Chocolate Eggs assorted', 'Süßwaren', 'Sweets', 1.39, 1.79, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Douceur', 'Douceur Schoko-Eier Dragées', 'Douceur Chocolate Egg Dragées', 'Süßwaren', 'Sweets', 2.99, NULL, '250g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Douceur', 'Douceur Schokoladen-Eier versch. Sorten', 'Douceur Chocolate Eggs assorted', 'Süßwaren', 'Sweets', 1.79, 1.99, '100g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Douceur', 'Douceur Schoko-Eier Bio', 'Douceur Organic Chocolate Eggs', 'Süßwaren', 'Sweets', 1.79, NULL, '100g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Douceur', 'Douceur Osterhasen-Schokolade', 'Douceur Easter Bunny Chocolate', 'Süßwaren', 'Sweets', 3.59, NULL, '300g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Douceur', 'Douceur Baumkuchen-Gebäck versch. Sorten', 'Douceur Tree Cake Pastry assorted', 'Süßwaren', 'Sweets', 2.99, NULL, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Douceur', 'Douceur Baumkuchen', 'Douceur Tree Cake', 'Süßwaren', 'Sweets', 2.79, NULL, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Douceur', 'Douceur Oster-Fruchtgummis', 'Douceur Easter Fruit Gummies', 'Süßwaren', 'Sweets', 2.79, NULL, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Douceur', 'Douceur Fairtrade Schokolade', 'Douceur Fairtrade Chocolate', 'Süßwaren', 'Sweets', 0.69, NULL, '100g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 23: Regional Bayern Mo. 30.3. bis Sa. 4.4. ===
('3', 'Asel Holzfäller', 'Asel Holzfäller Schnaps versch. Sorten', 'Asel Lumberjack Schnapps assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 0.69, NULL, '20ml', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Dr. Rauch', 'Dr. Rauch Eierlikör', 'Dr. Rauch Egg Liqueur', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.99, 7.99, '0.7L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Sternberg', 'Sternberg Diät Bier', 'Sternberg Diet Beer', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.89, 4.19, '6x0.33L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Frizzel', 'Frizzel Frucht versch. Sorten', 'Frizzel Fruit assorted', 'Getränke', 'Beverages', 2.49, 4.19, '1L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Paulaner', 'Paulaner Hefe-Weissbier versch. Sorten', 'Paulaner Hefeweizen assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, NULL, '6er-Pack', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Frudel', 'Frudel Fruchtig versch. Sorten', 'Frudel Fruity assorted', 'Getränke', 'Beverages', 1.59, 1.99, '1L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Maintal', 'Maintal Konfitüre versch. Sorten', 'Maintal Jam assorted', 'Brotaufstrich', 'Spreads', 1.99, 2.49, '340g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 24: Regional Bayern Fleisch Mo. 30.3. bis Sa. 4.4. ===
('3', 'Münzert', 'Münzert Schweine-Bratwurst Fränkische', 'Münzert Franconian Pork Bratwurst', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Münzert', 'Münzert Fleischwurst', 'Münzert Meat Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Münzert', 'Münzert Schwarz-/Blutwurst', 'Münzert Black/Blood Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Münzert', 'Münzert Schinkenspeck', 'Münzert Ham Bacon', 'Fleisch & Wurst', 'Meat & Sausage', 1.19, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Meggle', 'Meggle Emmentaler Scheiben', 'Meggle Emmental Slices', 'Käse', 'Cheese', 1.49, 2.49, '200g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Berchtesgadener Land', 'Berchtesgadener Land Topfen', 'Berchtesgadener Land Quark', 'Milchprodukte', 'Dairy', 0.99, 1.39, '250g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Rohrnudeln', 'Tube Noodles', 'Fertiggerichte', 'Ready Meals', 1.99, 2.79, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Geladene Maultaschen', 'Loaded Ravioli', 'Fertiggerichte', 'Ready Meals', 1.69, NULL, '350g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Bernbacher', 'Bernbacher Bio-Trio XXL', 'Bernbacher Organic Trio XXL', 'Nudeln & Reis', 'Pasta & Rice', 1.59, 2.49, '500g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Andechser Natur', 'Andechser Natur Bio-Trüffel-Joghurt', 'Andechser Nature Organic Truffle Yogurt', 'Milchprodukte', 'Dairy', 2.49, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 26: Bier Mo. 30.3. bis Sa. 4.4. ===
('3', 'Zirndorfer', 'Zirndorfer Landbier Kasten', 'Zirndorfer Country Beer Crate', 'Alkoholische Getränke', 'Alcoholic Beverages', 11.49, 15.99, '20x0.5L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Paulaner', 'Paulaner Spezi 1 Kasten', 'Paulaner Spezi 1 Crate', 'Getränke', 'Beverages', 10.99, 14.99, '20x0.5L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Paulaner', 'Paulaner Spezi ab 2 Kästen', 'Paulaner Spezi from 2 Crates', 'Getränke', 'Beverages', 9.99, 14.99, '20x0.5L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 27: Lebensmittel Mo. 30.3. bis Sa. 4.4. ===
('3', 'Lavazza', 'Lavazza Caffè Crema e Aroma', 'Lavazza Caffè Crema e Aroma', 'Kaffee & Tee', 'Coffee & Tea', 12.99, 21.99, '1kg', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Jacobs', 'Jacobs Krönung Big Pack', 'Jacobs Krönung Big Pack', 'Kaffee & Tee', 'Coffee & Tea', 4.44, 7.49, '500g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Meßmer', 'Meßmer Tee Pfirsich/Pflaume versch. Sorten', 'Meßmer Tea Peach/Plum assorted', 'Kaffee & Tee', 'Coffee & Tea', 1.59, 2.39, '20 Beutel', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Kölner Zucker Walnussknacker', 'Cologne Sugar Walnut Cracker', 'Süßwaren', 'Sweets', 1.99, NULL, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Olz', 'Olz Oster-Walnussstriezel', 'Olz Easter Walnut Strudel', 'Brot & Backwaren', 'Bread & Bakery', 3.79, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Mundwasser Pepsinol', 'Pepsinol Mouthwash', 'Haushalt', 'Household', 7.99, 9.99, '1L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Barilla', 'Barilla Pasta versch. Sorten', 'Barilla Pasta assorted', 'Nudeln & Reis', 'Pasta & Rice', 0.79, 1.99, '500g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Hengstenberg', 'Hengstenberg Mildessa Sauerkraut versch. Sorten', 'Hengstenberg Mildessa Sauerkraut assorted', 'Grundnahrungsmittel', 'Staples', 1.49, 2.29, '580ml', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Fuchs', 'Fuchs Gewürze versch. Sorten', 'Fuchs Spices assorted', 'Saucen & Gewürze', 'Sauces & Spices', 1.99, NULL, 'Glas', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 28: Süßwaren Mo. 30.3. bis Sa. 4.4. ===
('3', 'Milka', 'Milka Schmunzelhase versch. Sorten', 'Milka Smiling Bunny assorted', 'Süßwaren', 'Sweets', 1.49, 3.49, '100g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Milka', 'Milka Tafelschokolade versch. Sorten', 'Milka Chocolate Bar assorted', 'Süßwaren', 'Sweets', 0.79, 1.99, '100g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Kinder', 'Kinder Überraschungs-Ei', 'Kinder Surprise Egg', 'Süßwaren', 'Sweets', 0.66, 1.49, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Toffifee', 'Toffifee versch. Sorten', 'Toffifee assorted', 'Süßwaren', 'Sweets', 0.88, 1.49, '125g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Kinder', 'Kinder Schoko-Bons', 'Kinder Schoko-Bons', 'Süßwaren', 'Sweets', 2.99, 3.99, '225g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Ferrero', 'Ferrero Küsschen/Mon Chéri', 'Ferrero Kisses/Mon Chéri', 'Süßwaren', 'Sweets', 2.49, 5.99, '178g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Balconi', 'Balconi Choco Dessert', 'Balconi Choco Dessert', 'Süßwaren', 'Sweets', 2.29, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Nestlé', 'Nestlé Smarties/KitKat versch. Sorten', 'Nestlé Smarties/KitKat assorted', 'Süßwaren', 'Sweets', 1.49, 2.79, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 29: Snacks & Getränke Mo. 30.3. bis Sa. 4.4. ===
('3', 'Funny-frisch', 'Funny-frisch Chipsfrisch versch. Sorten', 'Funny-frisch Chips assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 0.99, 1.99, '150g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Intense Chips versch. Sorten', 'Intense Chips assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 0.99, 1.99, '150g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Recover', 'Recover Energy Drink', 'Recover Energy Drink', 'Getränke', 'Beverages', 0.99, 1.49, '0.5L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Monster', 'Monster Energy versch. Sorten', 'Monster Energy assorted', 'Getränke', 'Beverages', 0.99, 1.49, '0.5L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Ültje', 'Ültje Kessel-Erdnüsse versch. Sorten', 'Ültje Kettle Peanuts assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, 2.49, '150g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Nimm 2', 'Nimm 2 Lachgummi versch. Sorten', 'Nimm 2 Laughing Gummies assorted', 'Süßwaren', 'Sweets', 0.99, 1.49, '225g', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Lipton', 'Lipton Ice Tea versch. Sorten', 'Lipton Ice Tea assorted', 'Getränke', 'Beverages', 1.49, 2.19, '1.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Corona', 'Corona Extra Bier 10er-Pack', 'Corona Extra Beer 10-pack', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, NULL, '10x0.355L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 30: Haushalt & Spirituosen Mo. 30.3. bis Sa. 4.4. ===
('3', 'Duschdas', 'Duschdas Duschgel versch. Sorten', 'Duschdas Shower Gel assorted', 'Haushalt', 'Household', 1.99, 2.29, '225ml', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Rexona', 'Rexona Deospray XL versch. Sorten', 'Rexona Deodorant Spray XL assorted', 'Haushalt', 'Household', 2.69, NULL, '200ml', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Mia Lugana DOC Weißwein', 'Mia Lugana DOC White Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.99, 6.49, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Primitivo Nero Rotwein', 'Primitivo Nero Red Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.99, 4.49, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Absolut', 'Absolut Vodka/Vanilia', 'Absolut Vodka/Vanilla', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, 14.99, '0.7L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Van Laack', 'Van Laack Bourbon Whiskey', 'Van Laack Bourbon Whiskey', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.44, 5.59, '0.7L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Bailey''s', 'Bailey''s Original Irish Cream Liqueur/White Chocolate', 'Bailey''s Original Irish Cream Liqueur/White Chocolate', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, 13.99, '0.7L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Ramazzotti', 'Ramazzotti Amaro', 'Ramazzotti Amaro', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.49, 13.99, '0.7L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 31: Wein Mo. 30.3. bis Sa. 4.4. ===
('3', 'Richtig Lecker', 'Richtig Lecker Wein versch. Sorten', 'Richtig Lecker Wine assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.49, 2.99, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Sauvignon', 'Sauvignon Blanc della Rocca Puglia IGT', 'Sauvignon Blanc della Rocca Puglia IGT', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 4.99, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Calvet', 'Calvet Crémant de Bordeaux', 'Calvet Crémant de Bordeaux', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.99, 6.49, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Baden Weißburgunder QbA', 'Baden Pinot Blanc QbA', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.99, 7.99, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Rheinhessen Silvaner Trocken', 'Rheinhessen Silvaner Dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.99, NULL, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Rheinhessen Muskat', 'Rheinhessen Muscat', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.49, NULL, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Fruchtig und süß Rosé', 'Fruity and sweet Rosé', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.49, NULL, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Naturparks', 'Naturparks Die Weinschorle', 'Naturparks Wine Spritzer', 'Alkoholische Getränke', 'Alcoholic Beverages', 0.99, NULL, '0.33L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 32: Editions-Weine Mo. 30.3. bis Sa. 4.4. ===
('3', 'Eigenmarke', 'Rheinhessen Amrei Straße Müller-Thurgau/Silvaner QbA', 'Rheinhessen Amrei Straße Müller-Thurgau/Silvaner QbA', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, NULL, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Stühlinger Gourmet Wein versch. Sorten', 'Stühlinger Gourmet Wine assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, NULL, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Sauvignon Blanc Franken', 'Sauvignon Blanc Franconia', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, NULL, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Rheinhessen Bianca Resin', 'Rheinhessen Bianca Resin', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, NULL, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 33: Haushalt Mo. 30.3. bis Sa. 4.4. ===
('3', 'Blend-a-Med', 'Blend-a-Med Zahncreme XXL Tube', 'Blend-a-Med Toothpaste XXL Tube', 'Haushalt', 'Household', 1.29, 1.55, '125ml', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Head & Shoulders', 'Head & Shoulders Shampoo versch. Sorten', 'Head & Shoulders Shampoo assorted', 'Haushalt', 'Household', 8.88, NULL, '2x500ml', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Fairy', 'Fairy Spülmittel versch. Sorten', 'Fairy Dish Soap assorted', 'Haushalt', 'Household', 2.99, NULL, '450ml', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Sagrotan', 'Sagrotan Desinfektion Tücher/Spray', 'Sagrotan Disinfection Wipes/Spray', 'Haushalt', 'Household', 4.49, NULL, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Lenor', 'Lenor Weichspüler versch. Sorten', 'Lenor Fabric Softener assorted', 'Haushalt', 'Household', 3.99, NULL, '1.05L', '2026-03-30', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 41: Mi. 1.4. bis Sa. 4.4. ===
('3', 'Eigenmarke', 'Pflaumen', 'Plums', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, NULL, '500g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Butcher''s', 'Butcher''s Frische Beef Burger Patties XXL 8 Stück', 'Butcher''s Fresh Beef Burger Patties XXL 8 pcs', 'Fleisch & Wurst', 'Meat & Sausage', 8.99, NULL, '8 Stück', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Deutscher Rhabarber', 'German Rhubarb', 'Obst & Gemüse', 'Fruits & Vegetables', 3.49, NULL, '725g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Frische Schweine-Krustenbraten XXL', 'Mühlenhof Fresh Pork Crusted Roast XXL', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, 'XXL Pack', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Schinkenbrötchen geräuchert', 'Mühlenhof Smoked Ham Rolls', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, 1.79, '200g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof XXL Pfeffersteaks', 'Mühlenhof XXL Pepper Steaks', 'Fleisch & Wurst', 'Meat & Sausage', 4.44, NULL, '600g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eberswalder', 'Eberswalder Bratwurst', 'Eberswalder Bratwurst', 'Fleisch & Wurst', 'Meat & Sausage', 4.44, NULL, '800g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 42: Mi. 1.4. bis Sa. 4.4. ===
('3', 'Bärenmarke', 'Bärenmarke Kaffee-Milch versch. Sorten', 'Bärenmarke Coffee Milk assorted', 'Milchprodukte', 'Dairy', 1.11, NULL, '340g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Ehrmann', 'Ehrmann Robby Quark versch. Sorten', 'Ehrmann Robby Quark assorted', 'Milchprodukte', 'Dairy', 0.59, NULL, '4x100g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Alpro', 'Alpro Ohne Zuckerzusatz Natur', 'Alpro No Added Sugar Natural', 'Milchprodukte', 'Dairy', 1.69, NULL, '400g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Gazi', 'Gazi Grill- und Pfannenkäse versch. Sorten', 'Gazi Grill & Frying Cheese assorted', 'Käse', 'Cheese', 1.99, 2.99, '200g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Patros', 'Patros Kräuter-/Natur Käse', 'Patros Herb/Natural Cheese', 'Käse', 'Cheese', 1.79, 3.29, '150g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Le Rustique', 'Le Rustique Käsescheiben', 'Le Rustique Cheese Slices', 'Käse', 'Cheese', 2.69, 2.99, '140g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Penny Ready', 'Penny Ready Feiner Tomatensalat', 'Penny Ready Fine Tomato Salad', 'Fertiggerichte', 'Ready Meals', 1.39, 1.69, '200g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Penny Ready', 'Penny Ready Nudelsalat', 'Penny Ready Pasta Salad', 'Fertiggerichte', 'Ready Meals', 0.85, 0.95, '200g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Henglein', 'Henglein Frische Schupfnudeln/Kartoffel-Gnocchi', 'Henglein Fresh Finger Noodles/Potato Gnocchi', 'Nudeln & Reis', 'Pasta & Rice', 1.79, NULL, '500g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Dr. Oetker', 'Suprema/Dr. Oetker Pizza versch. Sorten', 'Suprema/Dr. Oetker Pizza assorted', 'Tiefkühl', 'Frozen', 3.99, 5.49, 'Stück', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 43: Mi. 1.4. bis Sa. 4.4. ===
('3', 'Dallmayr', 'Dallmayr Prodomo Kaffee versch. Sorten', 'Dallmayr Prodomo Coffee assorted', 'Kaffee & Tee', 'Coffee & Tea', 5.49, 10.29, '500g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Jacobs', 'Jacobs Kaffeekapseln versch. Sorten', 'Jacobs Coffee Capsules assorted', 'Kaffee & Tee', 'Coffee & Tea', 7.49, NULL, '40 Kapseln', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Schwartau', 'Schwartau Extra Konfitüre versch. Sorten', 'Schwartau Extra Jam assorted', 'Brotaufstrich', 'Spreads', 3.29, 4.79, '340g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Teekanne', 'Teekanne Tee Pfefferminze/Waldbeere versch. Sorten', 'Teekanne Tea Peppermint/Wild Berry assorted', 'Kaffee & Tee', 'Coffee & Tea', 1.49, 2.19, '20 Beutel', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Senseo', 'Senseo Kaffeepads versch. Sorten', 'Senseo Coffee Pads assorted', 'Kaffee & Tee', 'Coffee & Tea', 2.22, 3.99, '16 Pads', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Nestlé', 'Nestlé Lion/Trix Cerealien versch. Sorten', 'Nestlé Lion/Trix Cereals assorted', 'Frühstück & Cerealien', 'Breakfast & Cereal', 2.49, NULL, '400g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Kölln', 'Kölln Knusper-Honig-Nuss Müsli', 'Kölln Crunchy Honey-Nut Muesli', 'Frühstück & Cerealien', 'Breakfast & Cereal', 5.99, 7.99, '1.5kg', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Dr. Oetker', 'Dr. Oetker Grießbrei/Milchreis versch. Sorten', 'Dr. Oetker Semolina/Rice Pudding assorted', 'Milchprodukte', 'Dairy', 0.99, 1.49, '400g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 44: Mi. 1.4. bis Sa. 4.4. ===
('3', 'Küchenmeister', 'Küchenmeister Osterlamm Kuchen', 'Küchenmeister Easter Lamb Cake', 'Brot & Backwaren', 'Bread & Bakery', 3.49, NULL, 'Stück', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Pascal Ernest', 'Pascal Ernest Baguette versch. Sorten', 'Pascal Ernest Baguette assorted', 'Brot & Backwaren', 'Bread & Bakery', 2.49, NULL, 'Stück', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Jomo', 'Jomo Bauernbrot versch. Sorten', 'Jomo Farmhouse Bread assorted', 'Brot & Backwaren', 'Bread & Bakery', 2.99, NULL, 'Stück', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Covo', 'Covo Kekse versch. Sorten', 'Covo Biscuits assorted', 'Süßwaren', 'Sweets', 1.29, NULL, '200g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'TUC', 'TUC Bake Rolls versch. Sorten', 'TUC Bake Rolls assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, 1.99, '150g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Heinz', 'Heinz Tomatenketchup/Mayonnaise', 'Heinz Tomato Ketchup/Mayonnaise', 'Saucen & Gewürze', 'Sauces & Spices', 2.99, NULL, '500ml', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Greenland', 'Greenland Mischobst/Nabelbohnen versch. Sorten', 'Greenland Mixed Fruit/Navel Beans assorted', 'Grundnahrungsmittel', 'Staples', 1.89, NULL, '400g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Truss Tortellini versch. Sorten', 'Truss Tortellini assorted', 'Nudeln & Reis', 'Pasta & Rice', 2.22, NULL, '500g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'HAK', 'HAK Appelmoes Apfelmus', 'HAK Appelmoes Apple Sauce', 'Grundnahrungsmittel', 'Staples', 1.29, 1.69, '720ml', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Heinz', 'Heinz Pasta Sauce versch. Sorten', 'Heinz Pasta Sauce assorted', 'Saucen & Gewürze', 'Sauces & Spices', 1.99, NULL, '500ml', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Bertolli', 'Bertolli Olivenöl', 'Bertolli Olive Oil', 'Öle & Essig', 'Oils & Vinegar', 5.99, NULL, '500ml', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Surig', 'Surig Essig-Essenz', 'Surig Vinegar Essence', 'Öle & Essig', 'Oils & Vinegar', 1.59, NULL, '400ml', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 45: Mi. 1.4. bis Sa. 4.4. ===
('3', 'Twix', 'Twix/Snickers Minis versch. Sorten', 'Twix/Snickers Minis assorted', 'Süßwaren', 'Sweets', 2.77, 3.99, '275g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Merci', 'Merci Finest Selection versch. Sorten', 'Merci Finest Selection assorted', 'Süßwaren', 'Sweets', 2.79, 4.49, '250g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Lindt', 'Lindt Lindor Kugeln', 'Lindt Lindor Balls', 'Süßwaren', 'Sweets', 4.99, 9.98, '200g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Poppins', 'Poppins Knusperstückchen versch. Sorten', 'Poppins Crispy Pieces assorted', 'Süßwaren', 'Sweets', 1.99, NULL, '200g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Alnatura', 'Alnatura Haferriegel/Müsliriegel', 'Alnatura Oat Bar/Muesli Bar', 'Süßwaren', 'Sweets', 2.99, 3.69, '100g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Küchle', 'Küchle Oblaten', 'Küchle Wafers', 'Süßwaren', 'Sweets', 0.89, NULL, '150g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Gerolsteiner', 'Gerolsteiner Mineralwasser 6er-Pack', 'Gerolsteiner Mineral Water 6-pack', 'Getränke', 'Beverages', 0.79, 1.09, '6x0.5L', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Coca-Cola', 'Coca-Cola/Fanta/Sprite 4er-Pack', 'Coca-Cola/Fanta/Sprite 4-pack', 'Getränke', 'Beverages', 3.99, 4.99, '4x1.5L', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 46: Mi. 1.4. bis Sa. 4.4. ===
('3', 'Karamalz', 'Karamalz Malzgetränk', 'Karamalz Malt Beverage', 'Getränke', 'Beverages', 0.89, 1.29, '0.5L', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Spaten', 'Spaten Münchner Hell', 'Spaten Munich Lager', 'Alkoholische Getränke', 'Alcoholic Beverages', 0.79, 0.99, '0.5L', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Mionetto', 'Mionetto Prosecco/Freixenet DOC', 'Mionetto Prosecco/Freixenet DOC', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.99, 4.29, '0.2L', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Ballantine''s', 'Ballantine''s Finest Blended Scotch Whisky', 'Ballantine''s Finest Blended Scotch Whisky', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, 15.49, '0.7L', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Havana Club', 'Havana Club Rum Especial', 'Havana Club Rum Especial', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, 15.49, '0.7L', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Tetesept', 'Tetesept Badezusatz Schaumbad versch. Sorten', 'Tetesept Bath Additive Bubble Bath assorted', 'Haushalt', 'Household', 0.99, NULL, 'Stück', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Bruno Banani', 'Bruno Banani Duschgel', 'Bruno Banani Shower Gel', 'Haushalt', 'Household', 2.29, NULL, '250ml', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Vitakraft', 'Vitakraft Pure Chicken XXL', 'Vitakraft Pure Chicken XXL', 'Tierbedarf', 'Pet Supplies', 4.49, 5.79, 'XXL Pack', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Whiskas', 'Whiskas Knuspertaschen versch. Sorten', 'Whiskas Temptations assorted', 'Tierbedarf', 'Pet Supplies', 2.99, NULL, '180g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Whiskas', 'Whiskas Nassfutter Multipack Selektion', 'Whiskas Wet Food Multipack Selection', 'Tierbedarf', 'Pet Supplies', 13.99, NULL, '40x85g', '2026-04-01', '2026-04-04', true, 'https://www.penny.de'),

-- === PAGE 47: FRAMSTAG Do. 2.4. bis Sa. 4.4. ===
('3', 'Milka', 'Milka Tafelschokolade versch. Sorten Framstag', 'Milka Chocolate Bar assorted Framstag', 'Süßwaren', 'Sweets', 1.49, 3.49, '270g', '2026-04-02', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Nescafé', 'Nescafé Gold versch. Sorten', 'Nescafé Gold assorted', 'Kaffee & Tee', 'Coffee & Tea', 5.77, 12.49, '200g', '2026-04-02', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Rama', 'Rama Cremefine versch. Sorten', 'Rama Cremefine assorted', 'Milchprodukte', 'Dairy', 0.89, 1.49, '250ml', '2026-04-02', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Langnese', 'Langnese Solero/Flutschfinger versch. Sorten', 'Langnese Solero/Flutschfinger assorted', 'Eiscreme', 'Ice Cream', 1.99, 3.99, '5/8 Stück', '2026-04-02', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Bäckerschnecke/Baguette versch. Sorten', 'Baker''s Roll/Baguette assorted', 'Brot & Backwaren', 'Bread & Bakery', 0.88, 1.29, 'Stück', '2026-04-02', '2026-04-04', true, 'https://www.penny.de'),
('3', 'Thai Chef', 'Thai Chef Nudelsuppe versch. Sorten', 'Thai Chef Noodle Soup assorted', 'Fertiggerichte', 'Ready Meals', 0.49, 0.59, '60g', '2026-04-02', '2026-04-04', true, 'https://www.penny.de');
