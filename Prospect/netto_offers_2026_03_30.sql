-- Netto Marken-Discount Prospekt: Mo 30.03 - Sa 04.04.2026
-- store_id = '5'

DELETE FROM public.offers WHERE store_id = '5' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2: Cover Mo. 30.3. - Sa. 4.4. ===
('5', 'Weihenstephan', 'Weihenstephan Butter oder Streichzart', 'Weihenstephan Butter or Spreadable', 'Milchprodukte', 'Dairy', 0.99, 2.59, '250g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Dallmayr', 'Dallmayr Prodomo Kaffee gemahlen oder ganze Bohnen versch. Sorten', 'Dallmayr Prodomo Coffee ground or whole beans assorted', 'Kaffee & Tee', 'Coffee & Tea', 5.49, 10.49, '500g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Lindt', 'Lindt Goldhase versch. Sorten', 'Lindt Gold Bunny assorted', 'Süßwaren', 'Sweets', 1.49, NULL, '50g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Neuseeländische Lammkeule mit Röhrenknochen vakuumverpackt', 'New Zealand Lamb Leg with Bone vacuum-packed', 'Fleisch & Wurst', 'Meat & Sausage', 12.90, 16.50, '1.8kg', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Spargel weiß/violett Deutschland/Peru Kl. 1', 'White/Purple Asparagus Germany/Peru Cl. 1', 'Obst & Gemüse', 'Fruits & Vegetables', 3.99, 4.49, '500g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Toffifee', 'Toffifee versch. Sorten', 'Toffifee assorted', 'Süßwaren', 'Sweets', 1.00, NULL, '125g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Norwegisches Lachsfilet praktisch grätenfrei', 'Norwegian Salmon Fillet practically boneless', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.35, 1.79, '100g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Mühlenschnitzel Blanc versch. Sorten', 'Mill Schnitzel Blanc assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 4.49, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Franziskaner', 'Franziskaner Thüringer Qualitätsbier', 'Franziskaner Thuringian Quality Beer', 'Alkoholische Getränke', 'Alcoholic Beverages', 12.99, 17.99, '20x0.5L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 3: Knüller der Woche Mo. 30.3. - Sa. 4.4. ===
('5', 'Coca-Cola', 'Coca-Cola/Fanta/Sprite/Mezzo Mix versch. Sorten XXL', 'Coca-Cola/Fanta/Sprite/Mezzo Mix assorted XXL', 'Getränke', 'Beverages', 4.99, 9.52, '8x1.25L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Bergader', 'Bergader Bergbauern Käse versch. Sorten', 'Bergader Mountain Farmer Cheese assorted', 'Käse', 'Cheese', 1.69, 2.69, '150g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Wiener Würstchen oder Bockwurst geräuchert', 'Vienna Sausages or Bockwurst smoked', 'Fleisch & Wurst', 'Meat & Sausage', 5.49, 6.79, '1000g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Persil', 'Persil Waschmittel versch. Sorten 90-100 Waschladungen', 'Persil Detergent assorted 90-100 Washes', 'Haushalt', 'Household', 15.99, 27.99, 'XXL', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Jack Daniel''s', 'Jack Daniel''s Tennessee Whiskey 40% Vol.', 'Jack Daniel''s Tennessee Whiskey 40% Vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 15.99, 19.99, '0.7L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 4: Obst - Beeren & Eis Mo. 30.3. - Sa. 4.4. ===
('5', 'Eigenmarke', 'Heidelbeeren Marokko/Spanien Kl. I oder Erdbeeren Spanien oder Brombeeren Mexiko', 'Blueberries Morocco/Spain or Strawberries Spain or Blackberries Mexico', 'Obst & Gemüse', 'Fruits & Vegetables', 2.00, 2.79, '125-500g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Langnese', 'Langnese Cremissimo Eis tiefgekühlt versch. Sorten', 'Langnese Cremissimo Ice Cream frozen assorted', 'Eiscreme', 'Ice Cream', 1.67, 3.99, '750-1300ml', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 5: Alles für 1 Euro Mo. 30.3. - Sa. 4.4. ===
('5', 'Eigenmarke', 'Kiwi grün Griechenland/Italien Kl. I 3 Stück', 'Green Kiwi Greece/Italy Cl. I 3 pcs', 'Obst & Gemüse', 'Fruits & Vegetables', 1.00, 1.37, '3 Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Kopfsalat Italien Kl. I', 'Head Lettuce Italy Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.00, 1.49, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Auberginen Niederlande/Spanien Kl. I 2 Stück', 'Aubergines Netherlands/Spain Cl. I 2 pcs', 'Obst & Gemüse', 'Fruits & Vegetables', 1.00, 1.58, '2 Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'BioBio', 'BioBio Rote Bete gekocht', 'BioBio Beetroot cooked', 'Obst & Gemüse', 'Fruits & Vegetables', 1.00, 1.49, '500g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Zwiebeln rot Deutschland/Niederl. Kl. II 1kg Netz', 'Red Onions Germany/Netherlands Cl. II 1kg Net', 'Obst & Gemüse', 'Fruits & Vegetables', 1.00, NULL, '1kg', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 6: Obst & Gemüse Mo. 30.3. - Sa. 4.4. ===
('5', 'Eigenmarke', 'Lauch Deutschland/Niederlande Kl. I', 'Leek Germany/Netherlands Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.79, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Weißkohl Deutschland Kl. I 1kg', 'White Cabbage Germany Cl. I 1kg', 'Obst & Gemüse', 'Fruits & Vegetables', 1.00, 1.19, '1kg', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Chiquita', 'Chiquita Mango Peru Kl. I', 'Chiquita Mango Peru Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.11, 1.49, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Chiquita', 'Chiquita Bananen Costa Rica 1kg', 'Chiquita Bananas Costa Rica 1kg', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.49, '1kg', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'BioBio', 'BioBio Knoblauch Argentinien Kl. II 150g Netz', 'BioBio Garlic Argentina Cl. II 150g Net', 'Obst & Gemüse', 'Fruits & Vegetables', 1.00, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Chiquita', 'Chiquita Passions-Frucht/Maracuja Kolumbien 3er Schale', 'Chiquita Passion Fruit/Maracuja Colombia 3 pack', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, NULL, '3 Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 7: Dienstags-Kracher Di. 31.3. ===
('5', 'Eigenmarke', 'Zitronen Spanien Kl. I 1kg Netz XXL', 'Lemons Spain Cl. I 1kg Net XXL', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, NULL, '1kg', '2026-03-31', '2026-03-31', true, 'https://www.netto-online.de'),

-- === PAGE 8: Mittwochs-Kracher Mi. 01.4. ===
('5', 'Eigenmarke', 'Zucchini Spanien Kl. I 1kg lose', 'Zucchini Spain Cl. I 1kg loose', 'Obst & Gemüse', 'Fruits & Vegetables', 2.22, NULL, '1kg', '2026-04-01', '2026-04-01', true, 'https://www.netto-online.de'),

-- === PAGE 9: Obst & Gemüse Mo. 30.3. - Sa. 4.4. ===
('5', 'Eigenmarke', 'Mini Cherry-Rispentomaten Niederlande Kl. I', 'Mini Cherry Vine Tomatoes Netherlands Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 2.99, '200g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Speisefrühkartoffeln Ägypten festkochend 2kg Netz', 'Early Season Potatoes Egypt waxy 2kg Net', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, NULL, '2kg', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Orangen Spanien Kl. I 1.5kg Netz', 'Oranges Spain Cl. I 1.5kg Net', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, NULL, '1.5kg', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Mandarinen Spanien Kl. I 1kg Netz', 'Mandarins Spain Cl. I 1kg Net', 'Obst & Gemüse', 'Fruits & Vegetables', 2.79, 3.49, '1kg', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Äpfel rot Italien Kl. I 1kg Schale', 'Red Apples Italy Cl. I 1kg Tray', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, 2.29, '1kg', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Mandarin-Orangen oder geschälte Clementinen', 'Mandarin Oranges or Peeled Clementines', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, 1.49, '175g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Obstkonserven versch. Sorten', 'Canned Fruit assorted', 'Grundnahrungsmittel', 'Staples', 1.99, NULL, '310-530g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 10: Bäckerei Mo. 30.3. - Sa. 4.4. ===
('5', 'Back Stube', 'Back Stube Nuss-Nougat-Croissant 3 Stück', 'Back Stube Nut Nougat Croissant 3 pcs', 'Brot & Backwaren', 'Bread & Bakery', 1.50, 2.07, '3 Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Back Stube Schriffle/Brötchen 7 Stück', 'Back Stube Rolls 7 pcs', 'Brot & Backwaren', 'Bread & Bakery', 1.00, 1.33, '7 Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Back Stube Kirschbusche 2 Stück', 'Back Stube Cherry Puff 2 pcs', 'Brot & Backwaren', 'Bread & Bakery', 1.00, 1.78, '2 Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Back Stube Holzofenpinsa Salami', 'Back Stube Wood Oven Pinsa Salami', 'Brot & Backwaren', 'Bread & Bakery', 1.00, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Back Stube Weizenvollkornbrot 500g', 'Back Stube Whole Wheat Bread 500g', 'Brot & Backwaren', 'Bread & Bakery', 1.49, NULL, '500g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Back Stube Laugenstange 3 Stück', 'Back Stube Pretzel Sticks 3 pcs', 'Brot & Backwaren', 'Bread & Bakery', 1.00, 1.17, '3 Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 11: Fleisch Mo. 30.3. - Sa. 4.4. ===
('5', 'Eigenmarke', 'Rouladen vom Rind zart aus der Keule 1kg', 'Beef Roulades tender from leg 1kg', 'Fleisch & Wurst', 'Meat & Sausage', 15.90, 19.90, 'kg', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Osterbraten vom Schwein gepökelt und geräuchert ca. 1.6kg', 'Easter Roast Pork cured and smoked ca. 1.6kg', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, NULL, 'kg', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Bugbraten vom Irischen Weiderind mind. 180 Tage Weidehaltung', 'Shoulder Roast from Irish Grass-fed Beef min. 180 days grazing', 'Fleisch & Wurst', 'Meat & Sausage', 1.39, 1.79, '100g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Suppenfleisch vom Rind ohne Knochen 500g', 'Beef Stewing Meat boneless 500g', 'Fleisch & Wurst', 'Meat & Sausage', 6.79, 8.49, '500g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Hackfleisch gemischt 70% Schwein 30% Rind XXL 1kg', 'Mixed Mince 70% Pork 30% Beef XXL 1kg', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, 8.99, '1kg', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Hähnchen-Minutenschnitzel aus dem Brustfilet geschnitten XXL 800g', 'Chicken Minute Schnitzel from Breast Fillet XXL 800g', 'Fleisch & Wurst', 'Meat & Sausage', 7.99, 8.99, '800g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Hähnchen-Schenkel mit Rückenstück HKl. A XXL', 'Chicken Legs with Back Piece XXL', 'Fleisch & Wurst', 'Meat & Sausage', 6.99, NULL, 'kg', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 12: Fleisch & Wurst Mo. 30.3. - Sa. 4.4. ===
('5', 'Wiltmann', 'Wiltmann Salami Sortiment versch. Sorten', 'Wiltmann Salami Range assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, 2.29, '80g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Italienische handgelegte Aperitivo Platte', 'Italian Handmade Aperitivo Platter', 'Fleisch & Wurst', 'Meat & Sausage', 9.99, 12.99, '320g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Prosciutto Cotto 200g', 'Prosciutto Cotto 200g', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.39, '200g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Cabanossi versch. Sorten 150g', 'Cabanossi assorted 150g', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, 1.99, '150g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'XXL Frikadellenbrötchen kalt und warm ein Genuss', 'XXL Meatball Rolls hot and cold', 'Fleisch & Wurst', 'Meat & Sausage', 3.49, 4.69, 'XXL', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Bacon mild geräucherter Frühstücksspeck 100g', 'Bacon mild smoked breakfast bacon 100g', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, NULL, '100g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Echt ungarische Salami 400g', 'Real Hungarian Salami 400g', 'Fleisch & Wurst', 'Meat & Sausage', 3.49, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 13: Milchprodukte Mo. 30.3. - Sa. 4.4. ===
('5', 'Ehrmann', 'Ehrmann Almighurt Joghurt gekühlt versch. Sorten', 'Ehrmann Almighurt Yogurt chilled assorted', 'Milchprodukte', 'Dairy', 0.39, 0.89, '150g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Schofolade tiefgekühlt versch. Sorten', 'Chocolate Ice assorted frozen', 'Eiscreme', 'Ice Cream', 2.99, 3.89, '130g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Crème fraîche 30% oder 15% Fett', 'Crème fraîche 30% or 15% fat', 'Milchprodukte', 'Dairy', 1.50, 1.99, '2x200g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Landliebe', 'Landliebe Sahnepudding gekühlt versch. Sorten', 'Landliebe Cream Pudding chilled assorted', 'Milchprodukte', 'Dairy', 0.45, 0.99, '150g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Müller Buttermilch Drink', 'Müller Buttermilk Drink', 'Milchprodukte', 'Dairy', 0.99, NULL, '500ml', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Quarkwerk Quark Riegel versch. Sorten', 'Quarkwerk Quark Bar assorted', 'Milchprodukte', 'Dairy', 0.69, 0.89, '40g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Landliebe', 'Landliebe Frische Landmilch 3,8% Fett 1 Liter', 'Landliebe Fresh Country Milk 3.8% fat 1 Liter', 'Milchprodukte', 'Dairy', 1.00, 1.75, '1L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Moni Dessert Ei Vanillequark versch. Sorten', 'Moni Dessert Egg Vanilla Quark assorted', 'Milchprodukte', 'Dairy', 3.99, 4.99, '990g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 14: Tiefkühl & Käse Mo. 30.3. - Sa. 4.4. ===
('5', 'Iglo', 'Iglo Rahm-Spinat tiefgekühlt versch. Sorten', 'Iglo Creamed Spinach frozen assorted', 'Tiefkühl', 'Frozen', 1.99, 3.49, '750g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Wagner', 'Wagner Flammkuchen oder Steinofen Pizza tiefgekühlt versch. Sorten', 'Wagner Flammkuchen or Stone Oven Pizza frozen assorted', 'Tiefkühl', 'Frozen', 1.99, 3.49, '300-350g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Nestlé', 'Nestlé Schöller Pirulo oder KidKite Eis tiefgekühlt versch. Sorten', 'Nestlé Schöller Pirulo or KidKite Ice Cream frozen assorted', 'Eiscreme', 'Ice Cream', 2.22, 3.99, '350-400ml', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Gutshof-Ei Wachteleier 12 Stück', 'Gutshof-Ei Quail Eggs 12 pcs', 'Milchprodukte', 'Dairy', 2.99, NULL, '12 Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Gü', 'Gü Cheesecake versch. Sorten', 'Gü Cheesecake assorted', 'Süßwaren', 'Sweets', 2.99, 3.49, '2x90g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Paysan', 'Paysan Hirtenkäse gekühlt versch. Sorten 1kg XXL', 'Paysan Shepherd Cheese chilled assorted 1kg XXL', 'Käse', 'Cheese', 6.22, 7.22, '1kg', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Petrella', 'Petrella Frischkäse-Zubereitung versch. Sorten', 'Petrella Cream Cheese Preparation assorted', 'Käse', 'Cheese', 1.49, 2.29, '100g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Giovanni Rana', 'Giovanni Rana Pfannengericht gekühlt versch. Sorten', 'Giovanni Rana Pan Dish chilled assorted', 'Fertiggerichte', 'Ready Meals', 1.99, NULL, '285g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Rama', 'Rama Brotaufstrich gekühlt versch. Sorten', 'Rama Bread Spread chilled assorted', 'Brotaufstrich', 'Spreads', 1.11, 2.29, '225g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Gouda gerieben gekühlt 300g XXL', 'Gouda grated chilled 300g XXL', 'Käse', 'Cheese', 2.49, NULL, '300g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Mozzarella Kugel versch. Sorten', 'Mozzarella Ball assorted', 'Käse', 'Cheese', 0.79, NULL, '125g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Arla', 'Arla Skyr gekühlt versch. Sorten', 'Arla Skyr chilled assorted', 'Milchprodukte', 'Dairy', 1.29, NULL, '450g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 15: BioBio Oster-Frühstück (Dauertiefpreis) ===
('5', 'BioBio', 'BioBio Bio Eier 10 Stück', 'BioBio Organic Eggs 10 pcs', 'Milchprodukte', 'Dairy', 3.99, NULL, '10 Stück', '2026-03-30', '2026-04-04', false, 'https://www.netto-online.de'),
('5', 'BioBio', 'BioBio Knusper Schoko Müsli versch. Sorten 500g', 'BioBio Crunchy Chocolate Muesli assorted 500g', 'Frühstück & Cerealien', 'Breakfast & Cereal', 2.99, NULL, '500g', '2026-03-30', '2026-04-04', false, 'https://www.netto-online.de'),
('5', 'BioBio', 'BioBio Knäckebrot versch. Sorten', 'BioBio Crispbread assorted', 'Brot & Backwaren', 'Bread & Bakery', 1.29, NULL, '200g', '2026-03-30', '2026-04-04', false, 'https://www.netto-online.de'),
('5', 'BioBio', 'BioBio Konfitüre Extra versch. Sorten 300g', 'BioBio Extra Jam assorted 300g', 'Brotaufstrich', 'Spreads', 1.69, NULL, '300g', '2026-03-30', '2026-04-04', false, 'https://www.netto-online.de'),

-- === PAGE 16: BioBio Räucherlachs & Brot (Dauertiefpreis) ===
('5', 'BioBio', 'BioBio Räucherlachs gekühlt 100g', 'BioBio Smoked Salmon chilled 100g', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.99, NULL, '100g', '2026-03-30', '2026-04-04', false, 'https://www.netto-online.de'),
('5', 'BioBio', 'BioBio Dinkelbrot 500g', 'BioBio Spelt Bread 500g', 'Brot & Backwaren', 'Bread & Bakery', 1.99, NULL, '500g', '2026-03-30', '2026-04-04', false, 'https://www.netto-online.de'),
('5', 'BioBio', 'BioBio Butterkäse Scheiben gekühlt 200g', 'BioBio Butter Cheese Slices chilled 200g', 'Käse', 'Cheese', 1.99, NULL, '200g', '2026-03-30', '2026-04-04', false, 'https://www.netto-online.de'),
('5', 'BioBio', 'BioBio Orangensaft 1 Liter', 'BioBio Orange Juice 1 Liter', 'Getränke', 'Beverages', 2.49, NULL, '1L', '2026-03-30', '2026-04-04', false, 'https://www.netto-online.de'),

-- === PAGE 17: Coffee B Kaffee ab Mo. 30.3. ===
('5', 'Coffee B', 'Coffee B Kaffeemaschine schwarz oder weiß', 'Coffee B Coffee Machine black or white', 'Haushalt', 'Household', 20.00, 99.00, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Melitta', 'Melitta Coffee B Balls versch. Sorten 4x9 Stück', 'Melitta Coffee B Balls assorted 4x9 pcs', 'Kaffee & Tee', 'Coffee & Tea', 12.00, 15.96, '4x9 Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 18: Kaffee & Kuchen Mo. 30.3. - Sa. 4.4. ===
('5', 'Teekanne', 'Teekanne Ländertee XXL 40 Beutel versch. Sorten', 'Teekanne Country Tea XXL 40 Bags assorted', 'Kaffee & Tee', 'Coffee & Tea', 2.79, 3.19, '80-110g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Magdalenas mit Kokos oder Zimt versch. Sorten', 'Magdalenas with Coconut or Cinnamon assorted', 'Süßwaren', 'Sweets', 2.29, 2.69, '200-250g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Lieblings-Hefezopf versch. Sorten 440g', 'Favorite Braided Yeast Bread assorted 440g', 'Brot & Backwaren', 'Bread & Bakery', 2.39, 2.69, '440g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Nescafé', 'Nescafé Gold löslicher Bohnenkaffee versch. Sorten 200g', 'Nescafé Gold Instant Bean Coffee assorted 200g', 'Kaffee & Tee', 'Coffee & Tea', 6.99, 11.99, '200g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Dallmayr', 'Dallmayr Kaffeekapseln prodomo versch. Sorten', 'Dallmayr Coffee Capsules prodomo assorted', 'Kaffee & Tee', 'Coffee & Tea', 2.99, NULL, '10 Kapseln', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Obstboden oder Tortenboden', 'Fruit Base or Cake Base', 'Brot & Backwaren', 'Bread & Bakery', 1.49, 1.99, '200g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Coppenrath & Wiese', 'Coppenrath & Wiese Cafeteria Kuchen-Spezialitäten tiefgekühlt versch. Sorten', 'Coppenrath & Wiese Cafeteria Cake Specialties frozen assorted', 'Tiefkühl', 'Frozen', 2.99, NULL, '460-600g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 19: Wurst & Käse Mo. 30.3. - Sa. 4.4. ===
('5', 'Back Stube', 'Back Stube Weizenbaguette 2x260g', 'Back Stube Wheat Baguette 2x260g', 'Brot & Backwaren', 'Bread & Bakery', 1.00, 1.38, '2 Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Olivenöl 500ml', 'Olive Oil 500ml', 'Öle & Essig', 'Oils & Vinegar', 6.99, NULL, '500ml', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Maille', 'Maille Dijon Senf versch. Sorten 200ml', 'Maille Dijon Mustard assorted 200ml', 'Saucen & Gewürze', 'Sauces & Spices', 1.99, 2.79, '200ml', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Tessiner Senfspezialität versch. Sorten 65ml', 'Ticino Mustard Specialty assorted 65ml', 'Saucen & Gewürze', 'Sauces & Spices', 2.49, 2.99, '65ml', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 20: Feinkost Mo. 30.3. - Sa. 4.4. ===
('5', 'Eigenmarke', 'Antipasti Teller Mix gekühlt versch. Sorten', 'Antipasti Platter Mix chilled assorted', 'Fertiggerichte', 'Ready Meals', 4.99, NULL, '300-400g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Feinkostsalate gekühlt versch. Sorten 150g', 'Deli Salads chilled assorted 150g', 'Fertiggerichte', 'Ready Meals', 1.79, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Spargel grün Italien/Spanien Kl. I 400g', 'Green Asparagus Italy/Spain Cl. I 400g', 'Obst & Gemüse', 'Fruits & Vegetables', 4.44, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Blätterteig-Stangen 4 Stück', 'Puff Pastry Sticks 4 pcs', 'Brot & Backwaren', 'Bread & Bakery', 4.44, NULL, '4 Stück', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Carpaccio vom irischen Weiderind 100g', 'Carpaccio from Irish Grass-fed Beef 100g', 'Fleisch & Wurst', 'Meat & Sausage', 3.49, 3.79, '100g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Ziegentaler im Speckmantel 120g', 'Goat Cheese Medallion in Bacon 120g', 'Käse', 'Cheese', 2.99, NULL, '120g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Manuka Honig aus Neuseeland 250g', 'Manuka Honey from New Zealand 250g', 'Brotaufstrich', 'Spreads', 14.99, NULL, '250g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Burrata di Bufala 150g', 'Burrata di Bufala 150g', 'Käse', 'Cheese', 1.79, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Neuseeländische Lammlachse mariniert ca. 200g', 'New Zealand Lamb Loin marinated ca. 200g', 'Fleisch & Wurst', 'Meat & Sausage', 3.50, NULL, '100g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 21: Oster-Menü Mo. 30.3. - Sa. 4.4. ===
('5', 'Lacroix', 'Lacroix Fonds versch. Sorten', 'Lacroix Stock assorted', 'Saucen & Gewürze', 'Sauces & Spices', 1.99, 3.39, '400ml', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Meica', 'Meica Ragout Fin zartes Geflügelragout mit Champignons 400g', 'Meica Ragout Fin tender poultry ragout with mushrooms 400g', 'Fertiggerichte', 'Ready Meals', 3.49, 4.49, '400g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Wildlachsfilet tiefgekühlt versch. Sorten 700g', 'Wild Salmon Fillet frozen assorted 700g', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 6.99, NULL, '700g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Königspasteten 100g', 'King Pastries 100g', 'Brot & Backwaren', 'Bread & Bakery', 1.49, 1.99, '100g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 22: Feinkost & Spirituosen Mo. 30.3. - Sa. 4.4. ===
('5', 'Eigenmarke', 'Franken Silvanerwurst Qualitätswein 0.75 Liter', 'Franconian Silvaner Quality Wine 0.75 Liter', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, 5.99, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Pariser Spirituosen versch. Sorten 40% Vol. 0.7L', 'Parisian Spirits assorted 40% Vol. 0.7L', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.99, 18.99, '0.7L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Tortelloni oder Ravioli gekühlt versch. Sorten', 'Tortelloni or Ravioli chilled assorted', 'Nudeln & Reis', 'Pasta & Rice', 1.99, NULL, '250g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Premium Pesto versch. Sorten 190g', 'Premium Pesto assorted 190g', 'Saucen & Gewürze', 'Sauces & Spices', 1.99, NULL, '190g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Italienische Bronze Pasta versch. Sorten 500g', 'Italian Bronze Pasta assorted 500g', 'Nudeln & Reis', 'Pasta & Rice', 1.99, NULL, '500g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Calvet', 'Calvet Crémant de Bordeaux', 'Calvet Crémant de Bordeaux', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, NULL, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 23: Ostern Süßwaren Mo. 30.3. - Sa. 4.4. ===
('5', 'Milka', 'Milka Bonbons oder Feine Eier versch. Sorten', 'Milka Bonbons or Fine Eggs assorted', 'Süßwaren', 'Sweets', 1.99, 3.29, '86-90g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Milka', 'Milka Ostereier 199g', 'Milka Easter Eggs 199g', 'Süßwaren', 'Sweets', 5.99, 7.99, '199g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Windel Geschenk-korte gefüllt mit Alkohol 112g', 'Windel Gift Basket filled with Alcohol 112g', 'Süßwaren', 'Sweets', 5.99, 8.99, '112g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Funsch Marzipan-Sortiment versch. Sorten', 'Funsch Marzipan Assortment assorted', 'Süßwaren', 'Sweets', 1.99, NULL, '180g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Trolli', 'Trolli Hoppies Hasen Fruchtgummi 350g', 'Trolli Hoppies Bunny Fruit Gummies 350g', 'Süßwaren', 'Sweets', 2.49, 2.99, '350g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Edle Tropfen Obstbrände versch. Sorten', 'Noble Drops Fruit Brandies assorted', 'Süßwaren', 'Sweets', 2.99, 3.59, '250g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'After Eight', 'After Eight versch. Sorten 200g', 'After Eight assorted 200g', 'Süßwaren', 'Sweets', 2.29, 3.99, '200g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Ferrero', 'Ferrero Ostern Raffaello versch. Sorten', 'Ferrero Easter Raffaello assorted', 'Süßwaren', 'Sweets', 2.99, 3.49, '150g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 24: Osternest Süßwaren Mo. 30.3. - Sa. 4.4. ===
('5', 'Lindt', 'Lindt Pralinés Spezialitäten versch. Sorten', 'Lindt Pralines Specialties assorted', 'Süßwaren', 'Sweets', 6.99, 8.99, '175g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Merci', 'Merci Lovelies versch. Sorten 185g', 'Merci Lovelies assorted 185g', 'Süßwaren', 'Sweets', 2.49, 3.49, '185g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Milka', 'Milka Schöffel mich Ei', 'Milka Scoop Me Egg', 'Süßwaren', 'Sweets', 3.49, 3.99, '270g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Ritter Sport', 'Ritter Sport Schokowürfel versch. Sorten 176g', 'Ritter Sport Chocolate Cubes assorted 176g', 'Süßwaren', 'Sweets', 2.79, NULL, '176g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Lindt', 'Lindt Oster-Beutel versch. Sorten', 'Lindt Easter Bag assorted', 'Süßwaren', 'Sweets', 2.99, 4.99, '100g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Lindt', 'Lindt Osterspezialitäten versch. Sorten', 'Lindt Easter Specialties assorted', 'Süßwaren', 'Sweets', 2.99, NULL, '75-100g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Nestlé', 'Nestlé Osterhase versch. Sorten 40-90g', 'Nestlé Easter Bunny assorted 40-90g', 'Süßwaren', 'Sweets', 0.99, NULL, '40-90g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Prinzen Rolle versch. Sorten 352-400g', 'Prinzen Rolle assorted 352-400g', 'Süßwaren', 'Sweets', 1.49, NULL, '352-400g', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 27: Getränke Mo. 30.3. - Sa. 4.4. ===
('5', 'Eigenmarke', 'Premium Apfel Direktsaft naturtrüb 1 Liter', 'Premium Apple Direct Juice cloudy 1 Liter', 'Getränke', 'Beverages', 1.11, 1.29, '1L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Säfte Ananas oder Orange 1 Liter', 'Juices Pineapple or Orange 1 Liter', 'Getränke', 'Beverages', 1.99, 2.45, '1L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Traubensaft 1 Liter', 'Grape Juice 1 Liter', 'Getränke', 'Beverages', 1.11, 1.49, '1L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Gönrgy', 'Gönrgy Energy Drink versch. Sorten 0.5L', 'Gönrgy Energy Drink assorted 0.5L', 'Getränke', 'Beverages', 1.00, 1.49, '0.5L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Valensina', 'Valensina Saft oder Nektar versch. Sorten 1 Liter', 'Valensina Juice or Nectar assorted 1 Liter', 'Getränke', 'Beverages', 1.79, 2.49, '1L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Bionade', 'Bionade Biologisches Erfrischungsgetränk versch. Sorten 12x0.33L', 'Bionade Organic Soft Drink assorted 12x0.33L', 'Getränke', 'Beverages', 8.49, NULL, '12x0.33L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Paulaner', 'Paulaner Spezi XXL 12x0.33L', 'Paulaner Spezi XXL 12x0.33L', 'Getränke', 'Beverages', 6.99, NULL, '12x0.33L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Gerolsteiner', 'Gerolsteiner Mineralwasser versch. Sorten 6x1.5L', 'Gerolsteiner Mineral Water assorted 6x1.5L', 'Getränke', 'Beverages', 4.99, 6.54, '6x1.5L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 28: Bier & Spirituosen Mo. 30.3. - Sa. 4.4. ===
('5', 'Corona', 'Corona Lager Extra 24x0.355L', 'Corona Lager Extra 24x0.355L', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.99, NULL, '24x0.355L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Zinaet Likör versch. Sorten 17-25% Vol. 0.5L', 'Zinaet Liqueur assorted 17-25% Vol. 0.5L', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.49, NULL, '0.5L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eckes', 'Eckes Liköre versch. Sorten 15-30% Vol.', 'Eckes Liqueurs assorted 15-30% Vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.99, 7.59, '0.5L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Roth', 'Roth Franken Bier Kasten versch. Sorten', 'Roth Franconian Beer Crate assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.99, 18.99, '20x0.5L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Hirschquelle', 'Hirschquelle Mineralwasser versch. Sorten 12x0.75L', 'Hirschquelle Mineral Water assorted 12x0.75L', 'Getränke', 'Beverages', 3.99, NULL, '12x0.75L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Volvic', 'Volvic Tea oder Touch 1.5 Liter versch. Sorten', 'Volvic Tea or Touch 1.5 Liter assorted', 'Getränke', 'Beverages', 1.19, 1.89, '1.5L', '2026-03-30', '2026-04-04', true, 'https://www.netto-online.de'),

-- === PAGE 50: Super Wochenende Mi. 01.4. - Sa. 04.4. ===
('5', 'Bergader', 'Bergader Almzeit Weichkäse oder Bavaria Blu versch. Sorten 175g', 'Bergader Almzeit Soft Cheese or Bavaria Blu assorted 175g', 'Käse', 'Cheese', 1.99, 2.99, '175g', '2026-04-01', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Eigenmarke', 'Gurken Spanien Kl. I Stück', 'Cucumbers Spain Cl. I piece', 'Obst & Gemüse', 'Fruits & Vegetables', 0.55, 0.79, 'Stück', '2026-04-01', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Ritter Sport', 'Ritter Sport Bunte Vielfalt versch. Sorten 100g', 'Ritter Sport Colorful Variety assorted 100g', 'Süßwaren', 'Sweets', 0.99, 1.99, '100g', '2026-04-01', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Haribo', 'Haribo Picco-Balla Fruchtgummi', 'Haribo Picco-Balla Fruit Gummies', 'Süßwaren', 'Sweets', 0.79, NULL, '100g', '2026-04-01', '2026-04-04', true, 'https://www.netto-online.de'),
('5', 'Bionade', 'Bionade Limonaden Zitrone oder Orange 12x0.33L', 'Bionade Lemonades Lemon or Orange 12x0.33L', 'Getränke', 'Beverages', 6.49, NULL, '12x0.33L', '2026-04-01', '2026-04-04', true, 'https://www.netto-online.de');
