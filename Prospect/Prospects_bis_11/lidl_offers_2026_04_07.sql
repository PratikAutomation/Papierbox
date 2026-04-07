DELETE FROM public.offers WHERE store_id = '1' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2: Cover Ab Di. 7.4. bis Sa. 11.4. ===
('1', 'Langnese', 'Langnese Stieleis versch. Sorten', 'Langnese Ice Cream Sticks assorted', 'Eiscreme', 'Ice Cream', 1.99, 3.99, '4/6/8 Stück', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Red Bull', 'Red Bull Energy Drink versch. Sorten', 'Red Bull Energy Drink assorted', 'Getränke', 'Beverages', 4.99, 7.45, '6x0.25L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Pepsi', 'Pepsi/Schwip Schwap Zero Erfrischungsgetränk', 'Pepsi/Schwip Schwap Zero Soft Drink', 'Getränke', 'Beverages', 0.99, 1.79, '1.5L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 5: Obst & Gemüse Ab Di. 7.4. bis Sa. 11.4. ===
('1', 'Eigenmarke', 'Cocktailstrauchtomaten Niederlande/Spanien Klasse I 500g', 'Cocktail Vine Tomatoes Netherlands/Spain Class I 500g', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, NULL, '500g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Eigenmarke', 'Erdbeeren Spanien/Griechenland/Marokko Klasse I', 'Strawberries Spain/Greece/Morocco Class I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.99, 1.35, '500g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 6: Obst & Gemüse Ab Di. 7.4. bis Sa. 11.4. ===
('1', 'Eigenmarke', 'Rote Äpfel Deutschland/Italien Klasse I 2-kg-Netz', 'Red Apples Germany/Italy Class I 2kg Net', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, NULL, '2kg', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Eigenmarke', 'Dunkle Pflaumen lose Chile/Südafrika Klasse I', 'Dark Plums loose Chile/South Africa Class I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, NULL, 'kg', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Eigenmarke', 'Grapefruit Spanien Klasse I', 'Grapefruit Spain Class I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.49, 0.69, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Eigenmarke', 'Möhren Deutschland/Dänemark Klasse I 2kg', 'Carrots Germany/Denmark Class I 2kg', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, NULL, '2kg', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Bioland', 'Bio Feldsalat Italien Klasse 2', 'Organic Lamb''s Lettuce Italy Class 2', 'Obst & Gemüse', 'Fruits & Vegetables', 1.11, 1.69, '100g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Eigenmarke', 'Grüner Spargel Spanien/Marokko/Italien Klasse I', 'Green Asparagus Spain/Morocco/Italy Class I', 'Obst & Gemüse', 'Fruits & Vegetables', 3.33, 4.99, '500g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 15: Spirituosen & Snacks Ab Di. 7.4. bis Sa. 11.4. ===
('1', 'Billie Green', 'Billie Green Vegane Frikadellen/Gemüsebällchen', 'Billie Green Vegan Meatballs/Vegetable Balls', 'Fleischersatz', 'Meat Alternatives', 2.99, 3.99, '180g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Bud Spencer', 'Bud Spencer Bratwurst versch. Sorten', 'Bud Spencer Bratwurst assorted', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, '450g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sarti', 'Sarti Rosa Likör', 'Sarti Rosa Liqueur', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.99, 17.99, '0.7L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Mevgal', 'Mevgal Feta Griechisch', 'Mevgal Greek Feta', 'Käse', 'Cheese', 1.99, NULL, '150g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Loose', 'Loose Quake Skyr/Protein versch. Sorten', 'Loose Quake Skyr/Protein assorted', 'Milchprodukte', 'Dairy', 1.69, 1.99, '115g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Genossenschaftskellerei Heilbronn', 'Genossenschaftskellerei Heilbronn Wein feinfruchtig versch. Sorten', 'Heilbronn Cooperative Cellar Wine fruity assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 5.49, '0.75L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Toblerone', 'Toblerone versch. Sorten', 'Toblerone assorted', 'Süßwaren', 'Sweets', 1.69, 2.79, '100g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Ouzo 12', 'Ouzo 12 versch. Sorten', 'Ouzo 12 assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, 11.99, '0.7L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Formil', 'Formil Voll-/Colorwaschmittel 5 Liter', 'Formil Full/Color Detergent 5 Liter', 'Haushalt', 'Household', 8.99, NULL, '5L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Coca-Cola', 'Coca-Cola versch. Sorten 10er-Pack', 'Coca-Cola assorted 10-pack', 'Getränke', 'Beverages', 5.49, 7.90, '10x0.33L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 16: XXL Ab Di. 7.4. bis Sa. 11.4. ===
('1', 'Dulano', 'Dulano Delikatess Bacon XXL', 'Dulano Delicatessen Bacon XXL', 'Fleisch & Wurst', 'Meat & Sausage', 2.29, 2.59, '200g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'True Fruits', 'True Fruits Smoothies versch. Sorten', 'True Fruits Smoothies assorted', 'Getränke', 'Beverages', 3.49, NULL, '0.75L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Müller', 'Müller Milchreis versch. Sorten', 'Müller Rice Pudding assorted', 'Milchprodukte', 'Dairy', 0.59, NULL, '250g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Haltbare Vollmilch 3,5% 1,5 Liter', 'Milbona Long-life Whole Milk 3.5% 1.5 Liter', 'Milchprodukte', 'Dairy', 9.50, 11.40, '12x1.5L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Alesto', 'Alesto Cashew Kerne XXL geröstet & gesalzen', 'Alesto Cashew Nuts XXL roasted & salted', 'Snacks & Nüsse', 'Snacks & Nuts', 2.99, NULL, '250g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Softlan', 'Softlan Weichspüler Windfrisch', 'Softlan Fabric Softener Wind Fresh', 'Haushalt', 'Household', 2.59, 3.19, '1L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Lenor', 'Lenor Waschmittel versch. Sorten', 'Lenor Detergent assorted', 'Haushalt', 'Household', 17.99, 23.99, '100WL', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Floralys', 'Floralys Premium Toilettenpapier XXL 16 Rollen', 'Floralys Premium Toilet Paper XXL 16 Rolls', 'Haushalt', 'Household', 5.99, NULL, '16 Rollen', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'San Miguel', 'San Miguel Bier', 'San Miguel Beer', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, NULL, '6x0.33L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Kuchenzauber', 'Kuchenzauber Croissant XXL', 'Kuchenzauber Croissant XXL', 'Brot & Backwaren', 'Bread & Bakery', 1.79, NULL, '3x65g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sheba', 'Sheba Geflügel/Fisch Variation 60er-Pack', 'Sheba Poultry/Fish Variation 60-pack', 'Tierbedarf', 'Pet Supplies', 21.49, NULL, '60x85g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 17: Ab Di. 7.4. Weitere Angebote ===
('1', 'Vitasia', 'Vitasia Japanese Style Ramen/Udon Nudeln', 'Vitasia Japanese Style Ramen/Udon Noodles', 'Nudeln & Reis', 'Pasta & Rice', 0.99, NULL, '200g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Gouda Jung in Scheiben', 'Milbona Young Gouda Sliced', 'Käse', 'Cheese', 4.79, 5.85, '700g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Ocean Sea', 'Ocean Sea Lachsfiletportionen XXL', 'Ocean Sea Salmon Fillet Portions XXL', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 11.99, NULL, '1kg', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Harvest Basket', 'Harvest Basket Pommes Frites XXL', 'Harvest Basket French Fries XXL', 'Tiefkühl', 'Frozen', 3.99, 5.19, '3.5kg', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Joghurt mild XXL', 'Milbona Yogurt mild XXL', 'Milchprodukte', 'Dairy', 1.49, 1.79, '1kg', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Alesto', 'Alesto Nussmix XXL', 'Alesto Nut Mix XXL', 'Snacks & Nüsse', 'Snacks & Nuts', 3.99, 4.99, '300g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Freeway', 'Freeway Limonaden versch. Sorten', 'Freeway Lemonades assorted', 'Getränke', 'Beverages', 0.65, NULL, '1.5L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Solevita', 'Solevita Aloe Vera Getränk versch. Sorten', 'Solevita Aloe Vera Drink assorted', 'Getränke', 'Beverages', 1.29, NULL, '500ml', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 18: Dauerhaft im Sortiment - Bellarom Kaffee ===
('1', 'Bellarom', 'Bellarom Kaffee versch. Sorten gemahlen', 'Bellarom Coffee assorted ground', 'Kaffee & Tee', 'Coffee & Tea', 5.99, NULL, '500g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Bellarom', 'Bellarom Löslicher Kaffee Classic/Mild', 'Bellarom Instant Coffee Classic/Mild', 'Kaffee & Tee', 'Coffee & Tea', 5.49, NULL, '200g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Bellarom', 'Bellarom Kaffeepads versch. Sorten 40 Stück', 'Bellarom Coffee Pads assorted 40 pcs', 'Kaffee & Tee', 'Coffee & Tea', 5.19, NULL, '40 Stück', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Bellarom', 'Bellarom Kaffee-/Espressokapseln 44 Kapseln', 'Bellarom Coffee/Espresso Capsules 44 capsules', 'Kaffee & Tee', 'Coffee & Tea', 7.99, NULL, '44 Kapseln', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Bellarom', 'Bellarom Caffè Crema Gustoso Ganze Bohnen', 'Bellarom Caffè Crema Gustoso Whole Beans', 'Kaffee & Tee', 'Coffee & Tea', 10.99, NULL, '1kg', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Bellarom', 'Bellarom Barista Espresso Ganze Bohnen', 'Bellarom Barista Espresso Whole Beans', 'Kaffee & Tee', 'Coffee & Tea', 11.99, NULL, '1kg', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),

-- === PAGE 19: Dauerhaft im Sortiment - Milbona Milchprodukte ===
('1', 'Milbona', 'Milbona Saure Sahne 10% Fett', 'Milbona Sour Cream 10% fat', 'Milchprodukte', 'Dairy', 0.59, NULL, '200g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Cremejoghurt versch. Sorten', 'Milbona Cream Yogurt assorted', 'Milchprodukte', 'Dairy', 2.49, NULL, '1kg', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Milchdrink versch. Sorten', 'Milbona Milk Drink assorted', 'Milchprodukte', 'Dairy', 0.89, NULL, '500ml', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Skyr versch. Sorten', 'Milbona Skyr assorted', 'Milchprodukte', 'Dairy', 1.39, NULL, '500g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Joghurt 1,5%/3,5% Fett', 'Milbona Yogurt 1.5%/3.5% fat', 'Milchprodukte', 'Dairy', 0.79, NULL, '500g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Laktosefreier Joghurt mild', 'Milbona Lactose-free Yogurt mild', 'Milchprodukte', 'Dairy', 0.89, NULL, '500g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),

-- === PAGE 20: Dauerhaft im Sortiment - Milbona Milchprodukte 2 ===
('1', 'Milbona', 'Milbona Joghurt versch. Sorten Becher', 'Milbona Yogurt assorted cup', 'Milchprodukte', 'Dairy', 0.45, NULL, '115g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Leckere Softpudding versch. Sorten', 'Milbona Delicious Soft Pudding assorted', 'Milchprodukte', 'Dairy', 0.49, NULL, '200g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Frische Alpenmilch 3,5% Fett', 'Milbona Fresh Alpine Milk 3.5% fat', 'Milchprodukte', 'Dairy', 1.19, NULL, '1L', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Laktosefreie H-Vollmilch 3,5% Fett', 'Milbona Lactose-free UHT Whole Milk 3.5% fat', 'Milchprodukte', 'Dairy', 1.15, NULL, '1L', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Yohurti mit Schokoflits', 'Milbona Yogurt with Chocolate Bits', 'Milchprodukte', 'Dairy', 0.85, NULL, '200g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona High Protein Joghurt versch. Sorten', 'Milbona High Protein Yogurt assorted', 'Milchprodukte', 'Dairy', 0.79, NULL, '200g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Joghurt Griechischer Art Pur 4er-Pack', 'Milbona Greek Style Yogurt Plain 4-pack', 'Milchprodukte', 'Dairy', 1.39, NULL, '4x100g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona High Protein Quarkdrink! versch. Sorten', 'Milbona High Protein Quark Drink assorted', 'Milchprodukte', 'Dairy', 0.79, NULL, '400g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Speisequark 500g', 'Milbona Quark 500g', 'Milchprodukte', 'Dairy', 1.38, NULL, '500g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Laktosefreie Schlagsahne', 'Milbona Lactose-free Whipping Cream', 'Milchprodukte', 'Dairy', 0.99, NULL, '200g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Kondensmilch 4% Fett', 'Milbona Condensed Milk 4% fat', 'Milchprodukte', 'Dairy', 0.69, NULL, '340g', '2026-04-07', '2026-04-11', false, 'https://www.lidl.de'),

-- === PAGE 21: Qualität vom Preisführer Ab Di. 7.4. bis Sa. 11.4. ===
('1', 'Vemondo', 'Vemondo Veganer Bio Brotaufstrich Papaya Mango Curry', 'Vemondo Vegan Organic Bread Spread Papaya Mango Curry', 'Brotaufstrich', 'Spreads', 0.99, 1.25, '125g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Formil', 'Formil Flüssigwaschmittel 37 Waschladungen', 'Formil Liquid Detergent 37 Washes', 'Haushalt', 'Household', 1.95, 2.65, '1.85L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sondey', 'Sondey Butterkeks', 'Sondey Butter Biscuits', 'Süßwaren', 'Sweets', 1.49, 1.89, '200g', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Perlenbacher', 'Perlenbacher Bier alkoholfrei', 'Perlenbacher Beer non-alcoholic', 'Getränke', 'Beverages', 2.09, 2.69, '6x0.5L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Freeway', 'Freeway Erfrischungsgetränk Orange', 'Freeway Soft Drink Orange', 'Getränke', 'Beverages', 0.49, 0.65, '1.5L', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Dentalux', 'Dentalux Zahncreme Sensitive', 'Dentalux Toothpaste Sensitive', 'Haushalt', 'Household', 0.65, 0.85, '125ml', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Cien', 'Cien Cremeseife Naturell Milch und Honig', 'Cien Cream Soap Natural Milk and Honey', 'Haushalt', 'Household', 1.69, 1.99, '300ml', '2026-04-07', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 50: Sol & Mar Ab Do. 9.4. ===
('1', 'Sol & Mar', 'Sol & Mar Tapas Snack versch. Sorten', 'Sol & Mar Tapas Snack assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 1.99, NULL, '100-200g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Artischockenherzen', 'Sol & Mar Artichoke Hearts', 'Grundnahrungsmittel', 'Staples', 1.99, NULL, '240g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Natives Olivenöl Extra 3 Liter', 'Sol & Mar Extra Virgin Olive Oil 3 Liter', 'Öle & Essig', 'Oils & Vinegar', 19.99, NULL, '3L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Weiße Bohnen', 'Sol & Mar White Beans', 'Grundnahrungsmittel', 'Staples', 1.29, NULL, '540g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Knuspriger Snackmix', 'Sol & Mar Crunchy Snack Mix', 'Snacks & Nüsse', 'Snacks & Nuts', 1.99, NULL, '300g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Mini Churros versch. Sorten', 'Sol & Mar Mini Churros assorted', 'Süßwaren', 'Sweets', 2.49, NULL, '200g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Dessert versch. Sorten', 'Sol & Mar Dessert assorted', 'Süßwaren', 'Sweets', 1.19, 1.49, '140-145g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Kartoffel-Omelette versch. Sorten', 'Sol & Mar Potato Omelette assorted', 'Fertiggerichte', 'Ready Meals', 2.99, NULL, '500g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Cepa Lebrel', 'Cepa Lebrel Gran Reserva Rioja DOC Rotwein trocken', 'Cepa Lebrel Gran Reserva Rioja DOC Red Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 7.77, 12.99, '0.75L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 51: Sol & Mar Wurst Ab Do. 9.4. ===
('1', 'Sol & Mar', 'Sol & Mar Chorizo versch. Sorten', 'Sol & Mar Chorizo assorted', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, NULL, '300g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Tapasplatte mit Käse und Jamón Serrano', 'Sol & Mar Tapas Platter with Cheese and Jamón Serrano', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, '700g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Fuet Extra Spanische Rohwurst', 'Sol & Mar Fuet Extra Spanish Cured Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '100g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Tapas de Chorizo Paprikasalami in Scheiben', 'Sol & Mar Tapas de Chorizo Paprika Salami Sliced', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '100g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Jamón Serrano Reserva versch. Sorten', 'Sol & Mar Jamón Serrano Reserva assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '70g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Honigtopf Aus versch. Sorten', 'Sol & Mar Honey Pot assorted', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, NULL, '200g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Kichererbsen', 'Sol & Mar Chickpeas', 'Grundnahrungsmittel', 'Staples', 1.19, NULL, '570g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 52: Sol & Mar Oliven & Öl Ab Do. 9.4. ===
('1', 'Sol & Mar', 'Sol & Mar Natives Olivenöl Extra Spanien', 'Sol & Mar Extra Virgin Olive Oil Spain', 'Öle & Essig', 'Oils & Vinegar', 5.99, NULL, '0.75L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Riesen-Sonnenblumenkerne', 'Sol & Mar Giant Sunflower Seeds', 'Snacks & Nüsse', 'Snacks & Nuts', 0.79, NULL, '100g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Magdalenas Muffins', 'Sol & Mar Magdalenas Muffins', 'Süßwaren', 'Sweets', 2.99, NULL, '615g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Milchreig-Kuchen', 'Sol & Mar Milk Rice Cake', 'Süßwaren', 'Sweets', 1.99, NULL, '600g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Pudding mit Karamellüberzug 6er-Pack', 'Sol & Mar Pudding with Caramel Topping 6-pack', 'Süßwaren', 'Sweets', 1.69, NULL, '6x100g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Lupinen geschält', 'Sol & Mar Lupins peeled', 'Grundnahrungsmittel', 'Staples', 2.49, NULL, '870g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Spanische Oliven versch. Sorten', 'Sol & Mar Spanish Olives assorted', 'Grundnahrungsmittel', 'Staples', 1.99, NULL, '300g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Oliven ohne Stein versch. Sorten', 'Sol & Mar Pitted Olives assorted', 'Grundnahrungsmittel', 'Staples', 3.49, NULL, '400-460g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 53: Weine Ab Do. 9.4. ===
('1', 'Castillo de Albai', 'Castillo de Albai Crianza Rioja DOCa Rotwein trocken', 'Castillo de Albai Crianza Rioja DOCa Red Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.99, 6.99, '0.75L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Ánima Negra', 'Ánima Negra ÀN/2 Mallorca VdT Rotwein trocken', 'Ánima Negra ÀN/2 Mallorca VdT Red Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 18.95, 23.99, '0.75L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Barón del Cega', 'Barón del Cega Valdepeñas DO Reserva Rotwein trocken', 'Barón del Cega Valdepeñas DO Reserva Red Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.89, 6.99, '0.75L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sol & Mar', 'Sol & Mar Sangría 3,0-l-Bag-in-Box', 'Sol & Mar Sangria 3.0l Bag-in-Box', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.99, 6.99, '3L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Gin Nostrum', 'Gin Nostrum Mediterranean Gin/Strawberry Gin/Citrus Gin', 'Gin Nostrum Mediterranean/Strawberry/Citrus Gin', 'Alkoholische Getränke', 'Alcoholic Beverages', 11.11, 14.99, '0.7L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 54: Weine & Spirituosen Ab Do. 9.4. ===
('1', 'Veuve Clicquot', 'Veuve Clicquot Yellow Label Champagner brut', 'Veuve Clicquot Yellow Label Champagne brut', 'Alkoholische Getränke', 'Alcoholic Beverages', 44.99, 49.99, '0.75L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Sansibar Deluxe', 'Sansibar Deluxe Prickelndes Gold Schaumwein', 'Sansibar Deluxe Sparkling Gold Sparkling Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 8.99, 11.99, '0.75L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Junge Winzer', 'Junge Winzer Grauer Burgunder/Spätburgunder Selektion Baden', 'Junge Winzer Pinot Gris/Pinot Noir Selection Baden', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.99, NULL, '0.75L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Eigenmarke', 'Sauvignon Blanc Awatere Valley Marlborough/Neuseeland trocken', 'Sauvignon Blanc Awatere Valley Marlborough/New Zealand dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 7.99, 11.99, '0.75L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Goldmauch', 'Goldmauch Alter Mirabellen Brand 45% vol.', 'Goldmauch Old Mirabelle Brandy 45% vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, 12.99, '0.5L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Goldmauch', 'Goldmauch Hausbrand Edeldestillat 40% vol.', 'Goldmauch House Brandy Noble Distillate 40% vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, 12.99, '0.5L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Goldmauch', 'Goldmauch Williams-Christ-Birnenbrand mit Frucht', 'Goldmauch Williams Pear Brandy with Fruit', 'Alkoholische Getränke', 'Alcoholic Beverages', 19.99, 24.99, '0.7L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Kilbeggan', 'Kilbeggan Irish Whiskey', 'Kilbeggan Irish Whiskey', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.99, 15.99, '0.7L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Siegfried', 'Siegfried Wonderleaf Alkoholfrei', 'Siegfried Wonderleaf Non-alcoholic', 'Getränke', 'Beverages', 15.99, 18.99, '0.5L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 55: Obst Ab Do. 9.4. bis Sa. 11.4. ===
('1', 'Eigenmarke', 'Äpfel Pink Lady lose Frankreich Klasse I', 'Apples Pink Lady loose France Class I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.29, 2.69, 'kg', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Eigenmarke', 'Avocado lose Spanien/Marokko/Kolumbien/Südafrika/Peru Klasse I', 'Avocado loose Spain/Morocco/Colombia/South Africa/Peru Class I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.99, NULL, 'Stück', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Eigenmarke', 'Mango Peru/Brasilien Klasse I', 'Mango Peru/Brazil Class I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.11, NULL, 'Stück', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Eigenmarke', 'Frischer Zuckermais Senegal Klasse I 2 Stück', 'Fresh Corn on the Cob Senegal Class I 2 pcs', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 2.99, '2 Stück', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 56: Fleisch Ab Do. 9.4. bis Sa. 11.4. ===
('1', 'Grillmeister', 'Grillmeister Schweine-Grillfackeln versch. Sorten XXL 800g', 'Grillmeister Pork Grill Torches assorted XXL 800g', 'Fleisch & Wurst', 'Meat & Sausage', 7.49, NULL, '800g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Fischerstolz', 'Fischerstolz Wolfsbarsch', 'Fischerstolz Sea Bass', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 8.25, NULL, 'Stück', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Grillmeister', 'Grillmeister Schweine-Nackensteaks mariniert versch. Sorten XXL 1kg', 'Grillmeister Marinated Pork Neck Steaks assorted XXL 1kg', 'Fleisch & Wurst', 'Meat & Sausage', 6.49, 7.99, '1kg', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Grillmeister', 'Grillmeister Cevapcici XXL 800g', 'Grillmeister Cevapcici XXL 800g', 'Fleisch & Wurst', 'Meat & Sausage', 6.99, NULL, '800g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch Frisches Schweinegulasch XXL 1,4kg', 'Metzgerfrisch Fresh Pork Goulash XXL 1.4kg', 'Fleisch & Wurst', 'Meat & Sausage', 9.49, 12.39, '1.4kg', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch Bayerischer Traditioneller Leberkäse', 'Metzgerfrisch Bavarian Traditional Meat Loaf', 'Fleisch & Wurst', 'Meat & Sausage', 4.80, NULL, 'ca. 800g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch Hähnchen-Hacksteaks XXL 500g', 'Metzgerfrisch Chicken Mince Steaks XXL 500g', 'Fleisch & Wurst', 'Meat & Sausage', 4.49, NULL, '500g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Metzgerfrisch', 'Metzgerfrisch Hähnchen-Knusperchen 540g', 'Metzgerfrisch Chicken Crunchies 540g', 'Fleisch & Wurst', 'Meat & Sausage', 4.49, NULL, '540g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 57: Angebote Ab Do. 9.4. bis Sa. 11.4. ===
('1', 'Teekanne', 'Teekanne Ländertee versch. Sorten', 'Teekanne Country Tea assorted', 'Kaffee & Tee', 'Coffee & Tea', 1.49, 2.29, '40-50g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Aoste', 'Aoste Stickado/Longhetti versch. Sorten', 'Aoste Stickado/Longhetti assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, 2.49, '70g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Meggle', 'Meggle Streichzart versch. Sorten', 'Meggle Spreadable assorted', 'Butter', 'Butter', 2.29, 3.99, '400g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Funny-frisch', 'Funny-frisch Kessel Chips versch. Sorten', 'Funny-frisch Kettle Chips assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, 2.49, '120g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Yfood', 'Yfood This is Food Trinkmahlzeit versch. Sorten', 'Yfood This is Food Drink Meal assorted', 'Getränke', 'Beverages', 2.99, 3.99, '500ml', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 58: Angebote Ab Do. 9.4. bis Sa. 11.4. ===
('1', 'Doygan', 'Doygan Plombir Original Vanilleeis', 'Doygan Plombir Original Vanilla Ice Cream', 'Eiscreme', 'Ice Cream', 4.99, 6.19, '1L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Fol Epi', 'Fol Epi Schnittkäse versch. Sorten', 'Fol Epi Semi-hard Cheese assorted', 'Käse', 'Cheese', 2.99, NULL, '125g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Saint Albray', 'Saint Albray/Saint Agur/Chavroux versch. Sorten', 'Saint Albray/Saint Agur/Chavroux assorted', 'Käse', 'Cheese', 2.49, 3.49, '100-175g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Kiri', 'Kiri Frischkäse Portionen', 'Kiri Cream Cheese Portions', 'Käse', 'Cheese', 2.99, NULL, '180g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Amicelli', 'Amicelli Waffelröllchen', 'Amicelli Wafer Rolls', 'Süßwaren', 'Sweets', 2.99, 4.29, '200g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Golden Sun', 'Golden Sun Basmati Reis 1kg', 'Golden Sun Basmati Rice 1kg', 'Nudeln & Reis', 'Pasta & Rice', 2.19, 2.49, '1kg', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Trolli', 'Trolli Fruchtgummi XXL versch. Sorten 350g', 'Trolli Fruit Gummies XXL assorted 350g', 'Süßwaren', 'Sweets', 1.79, NULL, '350g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Capri-Sun', 'Capri-Sun versch. Sorten', 'Capri-Sun assorted', 'Getränke', 'Beverages', 3.49, 4.29, '10x200ml', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Gerolsteiner', 'Gerolsteiner Mineralwasser medium', 'Gerolsteiner Mineral Water medium', 'Getränke', 'Beverages', 0.89, 1.09, '1.5L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Ironmaxx', 'Ironmaxx Protein Porridge/Light Sauce/Glow Maxx versch. Sorten', 'Ironmaxx Protein Porridge/Light Sauce/Glow Maxx assorted', 'Frühstück & Cerealien', 'Breakfast & Cereal', 1.29, NULL, '45-500g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Persil', 'Persil Flüssigwaschmittel 60/72 Waschladungen', 'Persil Liquid Detergent 60/72 Washes', 'Haushalt', 'Household', 15.99, 22.99, '60/72WL', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Bref', 'Bref Power Reiniger versch. Sorten', 'Bref Power Cleaner assorted', 'Haushalt', 'Household', 1.99, 2.35, '750ml', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 59: Angebote Ab Do. 9.4. bis Sa. 11.4. ===
('1', 'Bauer', 'Bauer Der kleine Fruchtjoghurt versch. Sorten', 'Bauer The Little Fruit Yogurt assorted', 'Milchprodukte', 'Dairy', 0.49, 0.89, '100g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Chef Select', 'Chef Select Gefüllte Knusperrollen XXL 1kg versch. Sorten', 'Chef Select Filled Crunchy Rolls XXL 1kg assorted', 'Tiefkühl', 'Frozen', 3.99, NULL, '1kg', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Frühlingsquark versch. Sorten', 'Milbona Spring Quark assorted', 'Milchprodukte', 'Dairy', 1.99, 2.99, '175g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Rotkäppchen', 'Rotkäppchen Grillplautz versch. Sorten', 'Rotkäppchen Grill Cheese assorted', 'Käse', 'Cheese', 2.49, 3.49, '150g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Galbani', 'Galbani Mozzarella versch. Sorten 3er-Pack', 'Galbani Mozzarella assorted 3-pack', 'Käse', 'Cheese', 3.33, NULL, '3x125g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Milbona', 'Milbona Auflauf-/Pizza-Liebe versch. Sorten', 'Milbona Gratin/Pizza Cheese assorted', 'Käse', 'Cheese', 1.49, 2.69, '150g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Hella', 'Hella Erfrischungsgetränk versch. Sorten', 'Hella Soft Drink assorted', 'Getränke', 'Beverages', 0.59, NULL, '0.75L', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Müller', 'Müller High Protein Mousse versch. Sorten', 'Müller High Protein Mousse assorted', 'Milchprodukte', 'Dairy', 1.29, NULL, '200g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Exquisa', 'Exquisa Quark-Joghurt-Creme versch. Sorten', 'Exquisa Quark Yogurt Cream assorted', 'Milchprodukte', 'Dairy', 1.49, 1.99, '500g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Mainpfest', 'Mainpfest Gummies Springerle versch. Sorten', 'Mainpfest Gummies Springerle assorted', 'Süßwaren', 'Sweets', 1.99, NULL, '125g', '2026-04-09', '2026-04-11', true, 'https://www.lidl.de'),

-- === PAGE 61: Ab Fr. 10.4. bis Sa. 11.4. (Lidl Plus Weekend) ===
('1', 'Eigenmarke', 'Hamburger 6er-Pack', 'Hamburger 6-pack', 'Fleisch & Wurst', 'Meat & Sausage', 6.99, NULL, '6 Stück', '2026-04-10', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Wagner', 'Wagner Piccolinis versch. Sorten 24 Stück', 'Wagner Piccolinis assorted 24 pcs', 'Tiefkühl', 'Frozen', 4.49, 9.49, '24 Stück', '2026-04-10', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Segafredo', 'Segafredo Zanetti Intermezzo Caffè', 'Segafredo Zanetti Intermezzo Coffee', 'Kaffee & Tee', 'Coffee & Tea', 12.88, 21.99, '1kg', '2026-04-10', '2026-04-11', true, 'https://www.lidl.de'),
('1', 'Granini', 'Granini Trinkgenuss/Selection versch. Sorten', 'Granini Drink Pleasure/Selection assorted', 'Getränke', 'Beverages', 1.49, 2.69, '1L', '2026-04-10', '2026-04-11', true, 'https://www.lidl.de');
