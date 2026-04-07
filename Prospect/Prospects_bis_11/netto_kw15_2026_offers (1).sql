DELETE FROM public.offers WHERE store_id = '5' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2 (Prospekt-Seite 1): Highlight-Angebote | gültig Di 07.04. – Sa 11.04.26 ===
('5', 'Netto', 'Schoko-Joghurt Vanille', 'Chocolate Yoghurt Vanilla', 'Milchprodukte', 'Dairy', 0.29, 0.89, '135g-150g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Erdbeeren', 'Strawberries', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, 2.99, 'Schale', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Hähnchen-Brustfilet mager', 'Chicken Breast Fillet Lean', 'Fleisch & Wurst', 'Meat & Sausage', 7.99, 9.99, '1 kg', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Costa Rica', 'Ananas Kl. I', 'Pineapple Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.00, 1.99, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'FRoSTA', 'FRoSTA Fertiggerichte tiefgekühlt versch. Sorten', 'FRoSTA Frozen Ready Meals various', 'Tiefkühl', 'Frozen', 2.29, 4.72, '450g-500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Jägermeister', 'Jägermeister versch. Sorten 33-35% Vol.', 'Jägermeister various 33-35% Vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.88, 14.49, '0,7 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Dash', 'Dash Waschmittel versch. Sorten 100 Waschladungen', 'Dash Laundry Detergent 100 loads', 'Haushalt', 'Household', 7.99, 14.99, '100 WL', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Falkenfelser', 'Falkenfelser Premium Biere versch. Sorten', 'Falkenfelser Premium Beers various', 'Alkoholische Getränke', 'Alcoholic Beverages', 7.99, 9.99, '20x0,5 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 3 (Prospekt-Seite 2): Knüller der Woche / App-Angebote ===
('5', 'Albi', 'Albi Saft oder Nektar versch. Sorten', 'Albi Juice or Nectar various', 'Getränke', 'Beverages', 1.49, 2.49, '1 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Albi', 'Albi Saft oder Nektar versch. Sorten (Netto App)', 'Albi Juice or Nectar various (Netto App)', 'Getränke', 'Beverages', 1.29, 2.49, '1 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'funny-frisch', 'funny-frisch Chipsfrisch versch. Sorten', 'funny-frisch Crisps various', 'Snacks & Nüsse', 'Snacks & Nuts', 1.29, 1.99, '110g-150g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'funny-frisch', 'funny-frisch Chipsfrisch versch. Sorten (Netto App)', 'funny-frisch Crisps various (Netto App)', 'Snacks & Nüsse', 'Snacks & Nuts', 1.11, 1.99, '110g-150g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Mövenpick', 'Mövenpick Kaffee gemahlen oder Ganze Bohnen versch. Sorten', 'Mövenpick Coffee Ground or Whole Beans various', 'Kaffee & Tee', 'Coffee & Tea', 6.99, 10.69, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Mövenpick', 'Mövenpick Kaffee gemahlen oder Ganze Bohnen versch. Sorten (Netto App)', 'Mövenpick Coffee Ground or Whole Beans various (Netto App)', 'Kaffee & Tee', 'Coffee & Tea', 6.49, 10.69, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'StarDrink', 'StarDrink Cola oder Limonaden versch. Sorten', 'StarDrink Cola or Lemonades various', 'Getränke', 'Beverages', 0.55, 0.65, '1,35 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 4 (Prospekt-Seite 3): Mengenrabatte / Payback ===
('5', 'Maggi', 'Maggi Fix versch. Sorten 11er Pack', 'Maggi Fix various 11-pack', 'Saucen & Gewürze', 'Sauces & Spices', 5.00, 11.99, '11x26-92g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Beste Ernte', 'Beste Ernte Sonnenmais ohne Zuckerzusatz 12er Pack', 'Beste Ernte Sweetcorn no added sugar 12-pack', 'Grundnahrungsmittel', 'Staples', 9.00, 10.68, '12x285g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Erasco', 'Erasco Eintopf versch. Sorten 6er Pack', 'Erasco Stew various 6-pack', 'Fertiggerichte', 'Ready Meals', 11.00, 19.74, '6x800g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Malterns', 'Nudelsauce versch. Sorten 10er Pack', 'Pasta Sauce various 10-pack', 'Saucen & Gewürze', 'Sauces & Spices', 12.00, 14.50, '10x420g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 7 (Prospekt-Seite 6): Obst & Gemüse ===
('5', 'Heimat', 'Minigurken Deutschland Kl. I', 'Mini Cucumbers Germany Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 2.99, '500g Netz', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Heimat', 'Rispentomaten Deutschland Kl. I', 'Vine Tomatoes Germany Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 3.49, 3.99, '650g Schale', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Spargel grün Spanien Kl. I', 'Green Asparagus Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 3.99, 4.99, '400g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Heimat', 'Chicoree Deutschland Kl. I', 'Chicory Germany Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.19, 1.99, '500g Beutel', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 8 (Prospekt-Seite 7): Obst & Gemüse ===
('5', 'Markt Tag', 'Suppengemüse', 'Soup Vegetables', 'Obst & Gemüse', 'Fruits & Vegetables', 1.11, 1.29, '500g Schale', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Avocado Sorte Hass Israel/Marokko Kl. I genussreif', 'Avocado Hass Israel/Morocco Cl. I ripe', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, 1.99, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Zwiebel Deutschland Kl. II', 'Onions Germany Cl. II', 'Obst & Gemüse', 'Fruits & Vegetables', 1.39, 1.79, '2 kg Netz', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Kanzi', 'Apfel Kanzi Sorte Nicoter Deutschland/Italien Kl. I', 'Apple Kanzi Nicoter Germany/Italy Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 3.99, 4.99, '2 kg Karton', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Pfanni', 'Pfanni Speisekartoffeln versch. Kocheigenschaften', 'Pfanni Potatoes various cooking types', 'Obst & Gemüse', 'Fruits & Vegetables', 2.15, 2.50, '2,5 kg Netz', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Birnen Belgien/Niederlande Kl. I', 'Pears Belgium/Netherlands Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.69, NULL, '1 kg Schale', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Orangen Griechenland/Spanien Kl. I', 'Oranges Greece/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.69, 2.99, '2 kg Netz', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Trauben dunkel kernlos Indien/Südafrika Kl. I', 'Dark Seedless Grapes India/South Africa Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, 2.15, '500g Schale', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 9 (Prospekt-Seite 8): Obst & Gemüse / Feinkost ===
('5', 'Netto', 'Spargel weiß violett Griechenland Kl. II', 'White Violet Asparagus Greece Cl. II', 'Obst & Gemüse', 'Fruits & Vegetables', 3.99, 4.99, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Eisbergsalat Spanien Kl. I', 'Iceberg Lettuce Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, 1.49, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Datteln Deglet Nour Tunesien entsteint', 'Dates Deglet Nour Tunisia pitted', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, 2.49, '400g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Champignons weiß Polen Kl. I', 'White Mushrooms Poland Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.39, 1.99, '400g Schale', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Kühne', 'Kühne Schlemmertöpfchen mit Kräutern oder Honig', 'Kühne Pickle Jar with Herbs or Honey', 'Saucen & Gewürze', 'Sauces & Spices', 2.39, 3.49, '300g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Kohlrabi Italien Kl. I', 'Kohlrabi Italy Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.69, 0.79, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Heimat', 'Möhren Deutschland Kl. I', 'Carrots Germany Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.39, 1.69, '2 kg Beutel', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Beste Ernte', 'Beste Ernte Geröstete Paprika ganze Schoten mit Olivenöl', 'Beste Ernte Roasted Peppers whole pods with olive oil', 'Saucen & Gewürze', 'Sauces & Spices', 1.79, 1.99, '400g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 11 (Prospekt-Seite 10): Dienstags-Kracher gültig 07.04.26 ===
('5', 'Heimat', 'Weißkohl Deutschland Kl. I', 'White Cabbage Germany Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.59, 1.19, '1 kg', '2026-04-07', '2026-04-07', true, 'https://www.netto-online.de'),

-- === PAGE 12 (Prospekt-Seite 11): Mittwochs-Kracher gültig 08.04.26 ===
('5', 'Markt Tag', 'Zitronen Italien/Spanien Kl. I', 'Lemons Italy/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, 1.49, '500g Netz', '2026-04-08', '2026-04-08', true, 'https://www.netto-online.de'),

-- === PAGE 13 (Prospekt-Seite 12): Fleisch & Wurst ===
('5', 'BiFi', 'BiFi versch. Sorten', 'BiFi various', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.99, '6x20g/3x45g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Original Österreichische Wurstspezialitäten versch. Sorten', 'Original Austrian Sausage Specialties various', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, 1.69, '80g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Wurst Aufschnitt versch. Sorten', 'Cold Cut Sausage various', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, 1.49, '100g-125g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Hofmaier', 'Hofmaier Mini Wiener geräuchert', 'Hofmaier Mini Wiener Sausages smoked', 'Fleisch & Wurst', 'Meat & Sausage', 2.19, 2.49, '2x160g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Tillman''s', 'Tillman''s XXL Schnitzel versch. Sorten', 'Tillman''s XXL Schnitzel various', 'Fleisch & Wurst', 'Meat & Sausage', 2.79, 3.19, '250g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Hofmaier', 'Hofmaier Hähnchenbrustfilet versch. Sorten', 'Hofmaier Chicken Breast Fillet various', 'Fleisch & Wurst', 'Meat & Sausage', 1.39, 1.59, '100g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Hofmaier', 'Hofmaier Salami-Aufschnitt versch. Sorten 2 für 3,-', 'Hofmaier Salami Slices various 2 for 3', 'Fleisch & Wurst', 'Meat & Sausage', 3.00, 3.38, '2x200g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Schwarzwälder Schinken handgesalzen geräuchert', 'Black Forest Ham hand-salted smoked', 'Fleisch & Wurst', 'Meat & Sausage', 2.19, 2.49, '2x100g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Schwarzwälder Schinken handgesalzen geräuchert (Netto App)', 'Black Forest Ham hand-salted smoked (Netto App)', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.49, '2x100g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 14 (Prospekt-Seite 13): Fleisch & Wurst ===
('5', 'Netto', 'Wade vom irischen Weiderind vakuumverpackt', 'Irish Grassfed Beef Shank vacuum packed', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, 1.69, 'pro 100g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Spanferkel-Cevapcici vorgegart', 'Suckling Pig Cevapcici pre-cooked', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, 3.99, '300g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Geschnetzeltes Gyros Art vom Hähnchen mit Zwiebeln', 'Chicken Gyros Style with Onions', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, 3.99, '400g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Barbecue', 'Hähnchen-Minutensteaks in Joghurt-Paprika-Marinade', 'Chicken Minute Steaks in Yoghurt Paprika Marinade', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 4.99, '400g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Leberkäs-Brät zum Selbstbacken', 'Meat Loaf Mix for Self-Baking', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 4.99, '800g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Rinder-Hackfleisch zum Braten', 'Beef Mince for Frying', 'Fleisch & Wurst', 'Meat & Sausage', 9.99, 12.99, '1 kg', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Chicken Tender Hähncheninnenfilet paniert mild Kentucky Style', 'Chicken Tenders breaded mild Kentucky Style', 'Fleisch & Wurst', 'Meat & Sausage', 5.79, 6.49, '600g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Gut Ponholz', 'Schweine-Schnitzel aus der Oberschale', 'Pork Schnitzel from the top round', 'Fleisch & Wurst', 'Meat & Sausage', 3.79, 4.55, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 15 (Prospekt-Seite 14): Milchprodukte / Käse ===
('5', 'Kerrygold', 'Kerrygold Reibekäse gekühlt versch. Sorten', 'Kerrygold Grated Cheese chilled various', 'Käse', 'Cheese', 1.49, 2.99, '150g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Milram', 'Milram Gewürzquark gekühlt versch. Sorten', 'Milram Herb Quark chilled various', 'Milchprodukte', 'Dairy', 1.00, 1.49, '185g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Minions', 'Minions Choco Banana Milk Snack gekühlt', 'Minions Choco Banana Milk Snack chilled', 'Milchprodukte', 'Dairy', 1.49, 1.99, '4x27g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Ehrmann', 'Ehrmann High Protein Skyr gekühlt versch. Sorten', 'Ehrmann High Protein Skyr chilled various', 'Milchprodukte', 'Dairy', 0.59, 0.89, '150g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Bauer', 'Bauer Biene Maja Kinderjoghurt versch. Sorten', 'Bauer Maya the Bee Kids Yoghurt various', 'Milchprodukte', 'Dairy', 1.49, 1.89, '4x100g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Oatly', 'Oatly Barista Drink versch. Sorten (Netto App)', 'Oatly Barista Drink various (Netto App)', 'Milchprodukte', 'Dairy', 1.69, 2.55, '1 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 16 (Prospekt-Seite 15): Kühlung & Tiefkühlung ===
('5', 'Zott', 'Zott Cheese Tiger Käsesnack gekühlt', 'Zott Cheese Tiger Cheese Snack chilled', 'Käse', 'Cheese', 1.99, 2.49, '4x21g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Andechser', 'Andechser Bio Kefir mild fettarm', 'Andechser Organic Kefir mild low-fat', 'Milchprodukte', 'Dairy', 1.11, 1.59, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Neni', 'Neni Aufstriche gekühlt versch. Sorten', 'Neni Dips & Spreads chilled various', 'Brotaufstrich', 'Spreads', 2.99, 3.99, '200g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Genuss Welt', 'Genuss Welt Pizzabrötchen versch. Sorten', 'Genuss Welt Pizza Rolls various', 'Brot & Backwaren', 'Bread & Bakery', 1.99, NULL, '250g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Weihenstephan', 'Weihenstephan Cremig & Quarkig versch. Sorten', 'Weihenstephan Creamy & Quarky various', 'Milchprodukte', 'Dairy', 1.69, 2.39, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Nestlé', 'Nestlé Gold Mousse versch. Sorten', 'Nestlé Gold Mousse various', 'Süßwaren', 'Sweets', 1.99, 2.69, '4x57g-59g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Like', 'Like vegane Spezialitäten Tender Crunch Paprika', 'Like Vegan Specialties Tender Crunch Paprika', 'Fleischersatz', 'Meat Alternatives', 2.49, 3.29, '180g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'go! Bubble Tea', 'Bubble Tea gekühlt versch. Sorten', 'Bubble Tea chilled various', 'Getränke', 'Beverages', 3.49, NULL, '460ml', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'go! Bubble Tea', 'Bubble Tea gekühlt versch. Sorten (Netto App)', 'Bubble Tea chilled various (Netto App)', 'Getränke', 'Beverages', 2.99, 3.49, '460ml', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Asia', 'Asia Fertiggerichte gekühlt versch. Sorten', 'Asia Ready Meals chilled various', 'Fertiggerichte', 'Ready Meals', 3.99, NULL, '360g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 17 (Prospekt-Seite 16): Tiefkühlung ===
('5', 'McCain', 'McCain Golden Longs tiefgekühlt extra knusprig', 'McCain Golden Longs frozen extra crispy', 'Tiefkühl', 'Frozen', 2.99, 4.89, '1 kg', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'McCain', 'McCain Golden Longs tiefgekühlt extra knusprig (Netto App)', 'McCain Golden Longs frozen extra crispy (Netto App)', 'Tiefkühl', 'Frozen', 2.49, 4.89, '1 kg', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Gour Meat', 'Hähnchenschenkel tiefgekühlt mit Rückenstück ungewürzt Hkl. A', 'Chicken Legs frozen with back piece unseasoned Grade A', 'Tiefkühl', 'Frozen', 2.99, 3.99, '1 kg', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Beste Ernte', 'Beste Ernte Mikrowellengemüse tiefgekühlt versch. Sorten', 'Beste Ernte Microwave Vegetables frozen various', 'Tiefkühl', 'Frozen', 1.49, 1.69, '300g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Sea Gold', 'Norwegische Lachsfilets tiefgekühlt', 'Norwegian Salmon Fillets frozen', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 7.99, 9.49, '3x125g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'American Style', 'Fingerfood tiefgekühlt versch. Sorten', 'Fingerfood frozen various', 'Tiefkühl', 'Frozen', 1.89, 2.19, '250g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'American Style', 'Hamburger Patties Classic oder XXL tiefgekühlt', 'Hamburger Patties Classic or XXL frozen', 'Tiefkühl', 'Frozen', 5.99, NULL, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 18 (Prospekt-Seite 17): Back Stube / Brot & Backwaren ===
('5', 'Back Stube', 'Back Stube Ciabatta nach traditioneller italienischer Art', 'Back Stube Ciabatta traditional Italian style', 'Brot & Backwaren', 'Bread & Bakery', 0.59, 0.79, '300g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Back Stube Bauernbrot', 'Back Stube Farmhouse Bread', 'Brot & Backwaren', 'Bread & Bakery', 0.59, 1.49, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Back Stube Laugenstange mit Saaten', 'Back Stube Lye Bread Stick with Seeds', 'Brot & Backwaren', 'Bread & Bakery', 0.49, 0.59, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Back Stube Weltmeister-/Sonnenblumen-/Kürbiskernbrötchen 3 für 1,-', 'Back Stube Seed Rolls 3 for 1', 'Brot & Backwaren', 'Bread & Bakery', 1.00, 1.17, '3 Stück', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Back Stube Laugenbrezel 4 für 1,-', 'Back Stube Lye Pretzel 4 for 1', 'Brot & Backwaren', 'Bread & Bakery', 1.00, 1.56, '4 Stück', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Back Stube Apfeltasche', 'Back Stube Apple Turnover', 'Brot & Backwaren', 'Bread & Bakery', 0.65, 0.89, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Back Stube Käse-Schinken-Croissant', 'Back Stube Cheese Ham Croissant', 'Brot & Backwaren', 'Bread & Bakery', 0.89, 1.19, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Back Stube Würstchendog 2 für', 'Back Stube Sausage Dog 2 for', 'Brot & Backwaren', 'Bread & Bakery', 2.00, 2.58, '2 Stück', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 19 (Prospekt-Seite 18): Feinkost / Fertiggerichte ===
('5', 'Netto', 'Alpen Cordon Bleu vom Schwein mit Bacon und Bergkäse', 'Alpen Cordon Bleu Pork with Bacon and Mountain Cheese', 'Fleisch & Wurst', 'Meat & Sausage', 4.49, 5.99, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Lieblings', 'Gulaschsuppe mit saftigem Rindfleisch aus Österreich', 'Goulash Soup with Austrian Beef', 'Fertiggerichte', 'Ready Meals', 1.99, 2.49, '480ml', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Kaiser', 'Kaiser Käspressknödel gekühlt', 'Kaiser Cheese Pressed Dumplings chilled', 'Fertiggerichte', 'Ready Meals', 2.99, NULL, '200g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Maggi', 'Maggi Wirtshaus Käse-Spätzle mit Röstzwiebeln', 'Maggi Wirtshaus Cheese Spätzle with Roasted Onions', 'Fertiggerichte', 'Ready Meals', 1.11, 1.79, '119g-168g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Gutes Land', 'Gutes Land Emmentaler Scheiben XXL', 'Gutes Land Emmental Cheese Slices XXL', 'Käse', 'Cheese', 4.44, 4.99, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Back Stube', 'Back Stube Speck & Zwiebel Donut', 'Back Stube Bacon & Onion Donut', 'Brot & Backwaren', 'Bread & Bakery', 0.89, NULL, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Wiesbauer', 'Wiesbauer Almaufschnitt Bergsteiger Käsewurst Beskada', 'Wiesbauer Alpine Charcuterie Selection', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.29, '120g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 20 (Prospekt-Seite 19): Öle / Wein / Wurst / Käse ===
('5', 'Birnstingl', 'Birnstingl Steirisches Kürbiskernöl', 'Birnstingl Styrian Pumpkin Seed Oil', 'Öle & Essig', 'Oils & Vinegar', 4.99, 5.99, '250ml', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Etschtaler', 'Etschtaler Edelvernatsch DOC Rotwein trocken', 'Etschtaler Edelvernatsch DOC Red Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.49, 3.99, '1 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Grüner Veltliner Österreich Weißwein trocken', 'Grüner Veltliner Austria White Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.29, 2.79, '1 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Grüner Veltliner Österreich Weißwein trocken (Netto App)', 'Grüner Veltliner Austria White Wine dry (Netto App)', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.99, 2.79, '1 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Alpen Schnaps', 'Alpenschnaps Marille oder Haselnuss 33-35% Vol.', 'Alpine Schnapps Apricot or Hazelnut 33-35% Vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.99, 9.99, '0,5 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Händl', 'Tyrolini versch. Sorten', 'Tyrolini Meat Sticks various', 'Fleisch & Wurst', 'Meat & Sausage', 1.79, 1.99, '90g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Mautner Markhof', 'Mautner Markhof Senf versch. Sorten', 'Mautner Markhof Mustard various', 'Saucen & Gewürze', 'Sauces & Spices', 1.74, 1.99, '200g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 21 (Prospekt-Seite 20): Süße Schmankerl / Getränke ===
('5', 'Dr. Oetker', 'Dr. Oetker Süße Mahlzeit Kaiserschmarrn versch. Sorten', 'Dr. Oetker Sweet Meal Kaiserschmarrn various', 'Fertiggerichte', 'Ready Meals', 1.00, 1.49, '165g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Settele', 'Settele Dampfnudeln gekühlt', 'Settele Steamed Dumplings chilled', 'Brot & Backwaren', 'Bread & Bakery', 1.69, 2.69, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Ölz', 'Ölz Mohn- oder Nussstrudel', 'Ölz Poppy Seed or Nut Strudel', 'Süßwaren', 'Sweets', 1.99, 2.79, '350g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'EiKo', 'EiKo Bayerischer Apfelstrudel tiefgekühlt', 'EiKo Bavarian Apple Strudel frozen', 'Tiefkühl', 'Frozen', 2.99, 3.39, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Pfanner', 'Pfanner Fruchtsaftgetränke versch. Sorten', 'Pfanner Fruit Juice Drinks various', 'Getränke', 'Beverages', 1.29, 1.99, '1 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 22 (Prospekt-Seite 21): Süßwaren / Getränke / Kaffee / Milch ===
('5', 'Manner', 'Manner Schnitten versch. Sorten', 'Manner Wafers various', 'Süßwaren', 'Sweets', 2.49, 3.79, '300g-440g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Almdudler', 'Almdudler Kräuterlimonade versch. Sorten', 'Almdudler Herbal Lemonade various', 'Getränke', 'Beverages', 1.69, 2.29, '1,5 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Mälzer & Fu', 'Mälzer & Fu Eis tiefgekühlt versch. Sorten', 'Mälzer & Fu Ice Cream frozen various', 'Eiscreme', 'Ice Cream', 6.49, NULL, '500ml', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Mälzer & Fu', 'Mälzer & Fu Eis tiefgekühlt versch. Sorten (Netto App)', 'Mälzer & Fu Ice Cream frozen various (Netto App)', 'Eiscreme', 'Ice Cream', 5.79, 6.49, '500ml', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Weihenstephan', 'Weihenstephan Frische Milch 1,5% oder 3,5% 2 für 2,-', 'Weihenstephan Fresh Milk 1.5% or 3.5% 2 for 2', 'Milchprodukte', 'Dairy', 2.00, 3.58, '2x1 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Chicco d''Oro', 'Chicco d''Oro Schümli Crema Intenso ganze Kaffeebohnen', 'Chicco d''Oro Schümli Crema Intenso whole coffee beans', 'Kaffee & Tee', 'Coffee & Tea', 8.39, 9.99, '1 kg', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Lindt', 'Lindt Hauchdünne Täfelchen versch. Sorten', 'Lindt Extra Thin Chocolate Bars various', 'Süßwaren', 'Sweets', 4.99, 6.99, '125g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Lindt', 'Lindt Hauchdünne Täfelchen versch. Sorten (Netto App)', 'Lindt Extra Thin Chocolate Bars various (Netto App)', 'Süßwaren', 'Sweets', 4.49, 6.99, '125g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 23 (Prospekt-Seite 22): Getränke / Alkohol ===
('5', 'Vinetti', 'Vinetti Hugo aromatisierter weinhaltiger Cocktail versch. Sorten', 'Vinetti Hugo Aromatized Wine Cocktail various', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.49, 1.79, '0,75 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Cinzano', 'Cinzano Asti D.O.C.G. Schaumwein mild', 'Cinzano Asti D.O.C.G. Sparkling Wine mild', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.49, 7.99, '0,75 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Michel Schneider', 'Michel Schneider Grauburgunder/Rivaner/Weißer Burgunder Qualitätswein', 'Michel Schneider Pinot Gris/Rivaner/Pinot Blanc Quality Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.79, 4.99, '0,75 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Fuze Tea', 'Fuze Tea versch. Sorten (Netto App)', 'Fuze Tea various (Netto App)', 'Getränke', 'Beverages', 1.11, 1.69, '1,25 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Effect', 'Effect Energy Drink versch. Sorten', 'Effect Energy Drink various', 'Getränke', 'Beverages', 0.79, 1.09, '0,33 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Warsteiner', 'Warsteiner versch. Sorten', 'Warsteiner various', 'Alkoholische Getränke', 'Alcoholic Beverages', 0.79, 0.99, '0,5 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Coca-Cola', 'Coca-Cola Fanta oder Mezzo Mix versch. Sorten', 'Coca-Cola Fanta or Mezzo Mix various', 'Getränke', 'Beverages', 3.99, 4.49, '6x0,33 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 24 (Prospekt-Seite 23): Getränke / Bier / Spirituosen ===
('5', 'Franziskaner', 'Franziskaner Premium Hefe Weißbier Naturtrüb', 'Franziskaner Premium Yeast Wheat Beer', 'Alkoholische Getränke', 'Alcoholic Beverages', 13.99, 21.49, '20x0,5 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Frankenbrunnen', 'Frankenbrunnen Mineralwasser versch. Sorten', 'Frankenbrunnen Mineral Water various', 'Getränke', 'Beverages', 5.49, 7.99, '12x1 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Schloss', 'Schloss Biere versch. Sorten', 'Schloss Beers various', 'Alkoholische Getränke', 'Alcoholic Beverages', 0.45, 0.55, '0,5 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Jim Beam', 'Jim Beam versch. Sorten 32,5-40% Vol. (Netto App)', 'Jim Beam various 32.5-40% Vol. (Netto App)', 'Alkoholische Getränke', 'Alcoholic Beverages', 10.49, 15.99, '0,7 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Bitburger', 'Bitburger Radler Naturtrüb oder Alkoholfrei', 'Bitburger Radler Natural or Alcohol-Free', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.15, 5.99, '6x0,33 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 25 (netto-online.de): Online-Exklusiv Getränke ===
('5', 'Ilis Brause', 'Ilis Brause Apfelsinenlimo/Waldmeister/Himbeer versch. Sorten', 'Ilis Lemonade Orange/Woodruff/Raspberry various', 'Getränke', 'Beverages', 4.99, 5.94, '6x1,5 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Voss', 'Voss Sparkling Water Lemon & Cucumber 10er Pack', 'Voss Sparkling Water Lemon & Cucumber 10-pack', 'Getränke', 'Beverages', 19.99, 24.99, '10x0,33 Liter Dose', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Fanta', 'Fanta Watermelon 24er Pack', 'Fanta Watermelon 24-pack', 'Getränke', 'Beverages', 46.99, 54.99, '24x0,33 Liter Dose', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Warheads', 'Warheads Soda Sour Peach 12er Pack', 'Warheads Soda Sour Peach 12-pack', 'Getränke', 'Beverages', 24.99, 29.99, '12x0,33 Liter Dose', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Coca-Cola', 'Coke Strawberry 24er Pack', 'Coke Strawberry 24-pack', 'Getränke', 'Beverages', 47.99, 57.99, '24x0,33 Liter Dose', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 26 (netto-online.de): Online-Exklusiv Getränke ===
('5', 'Fuze Tea', 'Fuze Tea Black Tea Peach Hibiscus 24er Pack', 'Fuze Tea Black Tea Peach Hibiscus 24-pack', 'Getränke', 'Beverages', 31.99, 37.99, '24x0,33 Liter Dose', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Rubicon', 'Rubicon Sparkling Passion 24er Pack', 'Rubicon Sparkling Passion 24-pack', 'Getränke', 'Beverages', 27.99, 34.99, '24x0,33 Liter Dose', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Afri Cola', 'Afri Cola Mix 24er Pack', 'Afri Cola Mix 24-pack', 'Getränke', 'Beverages', 21.99, 24.99, '24x0,33 Liter Dose', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Arizona', 'Arizona Ice Tea Raspberry 12er Pack', 'Arizona Ice Tea Raspberry 12-pack', 'Getränke', 'Beverages', 27.59, 32.08, '12x0,65 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Seven Up', 'Seven Up Mojito 24er Pack', 'Seven Up Mojito 24-pack', 'Getränke', 'Beverages', 27.59, 32.08, '24x0,33 Liter Dose', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 27 (netto-online.de): Wein des Monats April ===
('5', 'Eslizón', 'Eslizón Garnacha Viñas Viejas Rotwein trocken Spanien', 'Eslizón Garnacha Viñas Viejas Red Wine dry Spain', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, 6.99, '0,75 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'TorreSanta', 'TorreSanta Moscato IGT Weißwein lieblich Italien', 'TorreSanta Moscato IGT White Wine sweet Italy', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.99, 5.99, '0,75 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Ferrovieri', 'Ferrovieri Montepulciano d''Abruzzo DOC Rotwein trocken', 'Ferrovieri Montepulciano d''Abruzzo DOC Red Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 4.99, '0,75 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Torre Santa', 'Torre Santa Weine versch. Sorten 6 Flaschen Paket', 'Torre Santa Wines various 6-bottle pack', 'Alkoholische Getränke', 'Alcoholic Beverages', 22.00, 29.94, '6x0,75 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 28 (Kassenbereich): Vita Cola ===
('5', 'Vita Cola', 'Vita Cola koffeinhaltig Original oder Pur', 'Vita Cola caffeinated Original or Pur', 'Getränke', 'Beverages', 0.99, NULL, '0,33 Liter Dose', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 29 (307 Artikel): Dauerhaft im Preis gesenkt ===
('5', 'Bref', 'Bref Reiniger versch. Sorten', 'Bref Cleaner various', 'Haushalt', 'Household', 2.35, 2.55, '750ml', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Cafèt', 'Cafèt Kaffee Crema Gold ganze Bohnen 100% Arabica', 'Cafèt Coffee Crema Gold whole beans 100% Arabica', 'Kaffee & Tee', 'Coffee & Tea', 12.99, 14.99, '1 kg', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Vom Land', 'Vom Land Konfitüre Extra versch. Sorten', 'Vom Land Extra Jam various', 'Brotaufstrich', 'Spreads', 1.79, 1.99, '450g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 30 (307 Artikel): Kaffee dauerhaft gesenkt ===
('5', 'Cafèt', 'Cafèt Kaffee Extra gemahlen', 'Cafèt Coffee Extra ground', 'Kaffee & Tee', 'Coffee & Tea', 4.99, 5.49, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Cafèt', 'Cafèt Naturmild verschiedene Sorten', 'Cafèt Naturmild various', 'Kaffee & Tee', 'Coffee & Tea', 5.99, 6.49, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Cafèt', 'Cafèt Der Beste Kaffee gemahlen', 'Cafèt Der Beste Coffee ground', 'Kaffee & Tee', 'Coffee & Tea', 6.99, 7.59, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Cafèt', 'Cafèt Kaffeepads versch. Sorten', 'Cafèt Coffee Pads various', 'Kaffee & Tee', 'Coffee & Tea', 5.19, 5.39, '280g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Cafèt', 'Cafèt Crema Gustoso Ganze Bohnen', 'Cafèt Crema Gustoso Whole Beans', 'Kaffee & Tee', 'Coffee & Tea', 10.99, 11.99, '1 kg', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Cafèt', 'Cafèt Caffè Crema oder Espresso ganze Bohnen versch. Sorten', 'Cafèt Caffè Crema or Espresso whole beans various', 'Kaffee & Tee', 'Coffee & Tea', 11.99, 12.99, '1 kg', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 31 (307 Artikel): Desserts / Eis dauerhaft gesenkt ===
('5', 'Grandiso', 'Grandiso High Protein Grießpudding Pur oder Zimt', 'Grandiso High Protein Semolina Pudding Plain or Cinnamon', 'Milchprodukte', 'Dairy', 1.59, 1.69, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Gutes Land', 'Gutes Land Buttermilch-Dessert gekühlt versch. Sorten', 'Gutes Land Buttermilk Dessert chilled various', 'Milchprodukte', 'Dairy', 0.59, 0.65, '200g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Grandiso', 'Grandiso Grütze gekühlt versch. Sorten', 'Grandiso Fruit Jelly chilled various', 'Milchprodukte', 'Dairy', 4.59, 4.79, '1 kg', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Lieblings', 'Lieblings Sahnepudding gekühlt versch. Sorten', 'Lieblings Cream Pudding chilled various', 'Milchprodukte', 'Dairy', 1.39, 1.79, '500g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Ice Fantasy', 'Ice Fantasy Big Choc tiefgekühlt versch. Sorten', 'Ice Fantasy Big Choc frozen various', 'Eiscreme', 'Ice Cream', 2.99, 3.29, '600ml', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Remeier', 'Remeier Eis versch. Sorten', 'Remeier Ice Cream various', 'Eiscreme', 'Ice Cream', 1.89, 1.99, '1 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Ice Fantasy', 'Ice Fantasy Waffelhörnchen tiefgekühlt versch. Sorten', 'Ice Fantasy Waffle Cones frozen various', 'Eiscreme', 'Ice Cream', 1.99, 2.19, '720ml', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Ice Fantasy', 'Ice Fantasy Mini Choc tiefgekühlt versch. Sorten', 'Ice Fantasy Mini Choc frozen various', 'Eiscreme', 'Ice Cream', 2.99, 3.49, '600ml', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 32 (307 Artikel): Wein / Spirituosen dauerhaft gesenkt ===
('5', 'Netto', 'Riesling trocken Qualitätswein Deutschland', 'Riesling dry Quality Wine Germany', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.79, 2.89, '1 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Mosel/Rheinhessen Qualitätswein', 'Mosel/Rheinhessen Quality Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.49, 2.79, '1 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Müller-Thurgau trocken Qualitätswein', 'Müller-Thurgau dry Quality Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.29, 2.39, '1 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Old House', 'Old House No.1 Blended Scotch Whisky 40% Vol.', 'Old House No.1 Blended Scotch Whisky 40% Vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 7.99, 8.29, '0,7 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Schloss Herrenbrunn', 'Schloss Herrenbrunn Sekt halbtrocken', 'Schloss Herrenbrunn Sparkling Wine semi-dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 0.84, 0.93, '3x0,2 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Villa am Weinberg', 'Villa am Weinberg Dornfelder Rosé Qualitätswein', 'Villa am Weinberg Dornfelder Rosé Quality Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.19, 2.29, '0,75 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 33 (Tierbedarf): Tierbedarf ===
('5', 'Felix', 'Felix Katzennahrung versch. Sorten 60 Pouch Jumbo', 'Felix Cat Food various 60-pouch Jumbo', 'Tierbedarf', 'Pet Supplies', 15.99, 20.99, '5,1 kg', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Purina One', 'Purina One Katzennahrung versch. Sorten (Netto App)', 'Purina One Cat Food various (Netto App)', 'Tierbedarf', 'Pet Supplies', 2.69, 3.95, '750g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 49 (Do-Sa Super Wochenende): gültig 09.04.–11.04.26 ===
('5', 'Meica', 'Meica Curry King in würziger Currysauce 2 für 3,33', 'Meica Curry King in spicy curry sauce 2 for 3.33', 'Fertiggerichte', 'Ready Meals', 3.33, 5.38, '2x220g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Mirácoli', 'Mirácoli Spaghettizubereitung Klassiker 5 Portionen', 'Mirácoli Spaghetti Kit Classic 5 portions', 'Nudeln & Reis', 'Pasta & Rice', 2.99, 3.99, '610,4g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Tafelspitz vom Irischen Weiderind vakuumverpackt', 'Irish Grassfed Beef Top Round vacuum packed', 'Fleisch & Wurst', 'Meat & Sausage', 1.39, 1.89, 'pro 100g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Minipflaumentomaten Marokko/Spanien Kl. I', 'Mini Plum Tomatoes Morocco/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, 3.49, '500g Schale', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Actimel', 'Actimel gekühlt versch. Sorten XXL', 'Actimel chilled various XXL', 'Milchprodukte', 'Dairy', 2.99, 5.99, '12x100g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 50 (Do-Sa Super Wochenende): gültig 09.04.–11.04.26 ===
('5', 'Dr. Oetker', 'Dr. Oetker Ristorante Pizza tiefgekühlt versch. Sorten', 'Dr. Oetker Ristorante Pizza frozen various', 'Tiefkühl', 'Frozen', 3.69, 6.78, '2x Pizza 640g-760g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Almette', 'Almette Frischkäsezubereitung gekühlt versch. Sorten', 'Almette Fresh Cheese Preparation chilled various', 'Käse', 'Cheese', 0.99, 1.99, '150g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Almette', 'Almette Frischkäsezubereitung gekühlt versch. Sorten (Netto App)', 'Almette Fresh Cheese Preparation chilled various (Netto App)', 'Käse', 'Cheese', 0.99, 1.99, '150g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Kinder', 'Kinder Riegel oder Duplo versch. Sorten XXL', 'Kinder Bar or Duplo various XXL', 'Süßwaren', 'Sweets', 3.99, 5.39, '18+2/327g-420g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Hasseröder', 'Hasseröder Premium Pils', 'Hasseröder Premium Pils', 'Alkoholische Getränke', 'Alcoholic Beverages', 8.99, NULL, '20x0,5 Liter', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 51 (Do-Sa Super Wochenende): Obst & Gemüse gültig 09.04.–11.04.26 ===
('5', 'Heimat', 'Rhabarber Deutschland Kl. I', 'Rhubarb Germany Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 3.49, 3.99, '750g Bund', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Zucchini Marokko/Spanien Kl. I', 'Courgette Morocco/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.29, 3.49, '1 kg', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Markt Tag', 'Paprika rot Spanien/Niederlande Kl. I', 'Red Pepper Spain/Netherlands Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.29, 2.99, '500g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Brombeeren Marokko/Portugal Kl. I', 'Blackberries Morocco/Portugal Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.22, 2.79, '125g Schale', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Kiwi grün Griechenland/Italien Kl. I', 'Green Kiwi Greece/Italy Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 0.33, 0.39, 'Stück', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 52 (Do-Sa): BioBio / Milchprodukte / Getränke gültig 09.04.–11.04.26 ===
('5', 'Gazi', 'Gazi Jogurt Natur 3,5% Fett', 'Gazi Natural Yoghurt 3.5% fat', 'Milchprodukte', 'Dairy', 1.99, 2.89, '1 kg', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Müller', 'Müller Grießpudding gekühlt versch. Sorten', 'Müller Semolina Pudding chilled various', 'Milchprodukte', 'Dairy', 0.79, 0.99, '132g-200g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Sweet Delight', 'Sweet Delight Mini Zitronen oder Erdbeerröllchen tiefgekühlt', 'Sweet Delight Mini Lemon or Strawberry Rolls frozen', 'Tiefkühl', 'Frozen', 2.99, NULL, '350g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Mövenpick', 'Mövenpick Iced Coffee gekühlt versch. Sorten', 'Mövenpick Iced Coffee chilled various', 'Getränke', 'Beverages', 1.39, 2.19, '220ml', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Vici', 'Vici Surimi Teller gekühlt', 'Vici Surimi Tray chilled', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.69, NULL, '330g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Gutes Land', 'Gutes Land High Protein Drink tiefgekühlt versch. Sorten', 'Gutes Land High Protein Drink frozen various', 'Getränke', 'Beverages', 1.49, NULL, 'versch. Sorten', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 53 (Do-Sa): Fleisch & Wurst Super Wochenende gültig 09.04.–11.04.26 ===
('5', 'Netto', 'Spanferkel-Rollbraten besonders zart vakuumverpackt', 'Suckling Pig Rolled Roast vacuum packed', 'Fleisch & Wurst', 'Meat & Sausage', 8.99, 11.99, 'pro kg', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Kühne', 'Leberwurst versch. Sorten', 'Liverwurst various', 'Fleisch & Wurst', 'Meat & Sausage', 1.19, 1.39, '250g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Bud Spencer', 'Bud Spencer Rostbratwurst oder Schinkenkrakauer', 'Bud Spencer Grilling Sausage or Ham Krakauer', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, 6.29, '450g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Kalbs-Leber zum Braten', 'Veal Liver for Frying', 'Fleisch & Wurst', 'Meat & Sausage', 1.69, 2.19, 'pro 100g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Hofmaier', 'Hofmaier Bayerische Hüttenwurst nach Art einer Kochsalami', 'Hofmaier Bavarian Hüttenwurst cooked salami style', 'Fleisch & Wurst', 'Meat & Sausage', 2.69, 2.99, '300g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Barbecue', 'Geflügelbratwurst', 'Poultry Grilling Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, 3.49, '400g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Bratensülze mit herzhaften Schweinebraten (Netto App)', 'Pork Brawn with hearty roast pork (Netto App)', 'Fleisch & Wurst', 'Meat & Sausage', 3.49, 3.89, '350g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Hofmaier', 'Hofmaier Bayerisches Wammerl gegart und geräuchert', 'Hofmaier Bavarian Pork Belly cooked and smoked', 'Fleisch & Wurst', 'Meat & Sausage', 3.49, 3.99, '300g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Gut Ponholz', 'Rinder-Entrecôte Kräuter gewürzt', 'Beef Entrecôte with Herbs seasoned', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.49, 'pro 100g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Schweine-Nackensteaks vorwärts mariniert', 'Pork Neck Steaks marinated', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 4.79, '600g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 54 (Do-Sa): Grillsaison / Feinkost gültig 09.04.–11.04.26 ===
('5', 'Knorr', 'Knorr Feinkost Saucen versch. Sorten', 'Knorr Gourmet Sauces various', 'Saucen & Gewürze', 'Sauces & Spices', 1.00, 1.69, '250ml', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Develey', 'Develey Unsere Original Tomaten Ketchup', 'Develey Our Original Tomato Ketchup', 'Saucen & Gewürze', 'Sauces & Spices', 1.79, 2.69, '500ml', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Gutes Land', 'Gutes Land Kräuter- oder Knoblauchbutter gekühlt', 'Gutes Land Herb or Garlic Butter chilled', 'Butter', 'Butter', 1.00, 1.19, '100g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Fladenbrot', 'Flatbread', 'Brot & Backwaren', 'Bread & Bakery', 1.29, 1.49, '500g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Greco', 'Greco Feta Bio-Feta gekühlt versch. Sorten', 'Greco Feta Organic Feta chilled various', 'Käse', 'Cheese', 2.07, 2.99, '130g-150g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Rocky Mountain', 'Rocky Mountain Marshmallows', 'Rocky Mountain Marshmallows', 'Süßwaren', 'Sweets', 2.03, 2.99, '300g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Barbecue', 'Halloumi Grillkäse gekühlt', 'Halloumi Grilling Cheese chilled', 'Käse', 'Cheese', 2.49, NULL, '225g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Barbecue', 'Halloumi Grillkäse gekühlt (Netto App)', 'Halloumi Grilling Cheese chilled (Netto App)', 'Käse', 'Cheese', 1.99, 2.49, '225g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 55 (Do-Sa): Payback-Aktionen / Grundnahrungsmittel gültig 09.04.–11.04.26 ===
('5', 'Albat', 'Albat Pointee Pasta', 'Albat Pointee Pasta', 'Nudeln & Reis', 'Pasta & Rice', 1.19, NULL, '500g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Kikkoman', 'Kikkoman Sojasauce', 'Kikkoman Soy Sauce', 'Saucen & Gewürze', 'Sauces & Spices', 5.99, 6.99, '500ml', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Mondamin', 'Mondamin Soßenbinder hell oder dunkel', 'Mondamin Gravy Thickener light or dark', 'Saucen & Gewürze', 'Sauces & Spices', 1.59, 1.79, '250g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Zentis', 'Zentis Frühstücks-Konfitüre Extra versch. Sorten', 'Zentis Breakfast Jam Extra various', 'Brotaufstrich', 'Spreads', 1.29, NULL, '210g-230g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Maggi', 'Maggi Delikatess Sauce Rahm-Sauce 2x250ml oder 500ml', 'Maggi Gourmet Sauce Cream Sauce', 'Saucen & Gewürze', 'Sauces & Spices', 1.00, 1.49, '2x250ml/500ml', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Tillman''s', 'Tillman''s Toasty tiefgekühlt versch. Sorten', 'Tillman''s Toasty frozen various', 'Tiefkühl', 'Frozen', 3.33, 3.99, '4 Stück', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Wasa', 'Wasa Knäckebrot versch. Sorten', 'Wasa Crispbread various', 'Brot & Backwaren', 'Bread & Bakery', 1.99, 2.39, '200g-275g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 56 (Do-Sa): Getränke / Süßwaren / Haushalt gültig 09.04.–11.04.26 ===
('5', 'Bacardi', 'Bacardi versch. Sorten 27-37,5% Vol.', 'Bacardi various 27-37.5% Vol.', 'Alkoholische Getränke', 'Alcoholic Beverages', 11.49, 14.49, '0,7 Liter', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Active O2', 'Active O2 Erfrischungsgetränk versch. Sorten', 'Active O2 Refreshment Drink various', 'Getränke', 'Beverages', 1.00, 1.19, '0,75 Liter', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Kinder', 'Kinder Überraschungsei versch. Sorten', 'Kinder Surprise Egg various', 'Süßwaren', 'Sweets', 0.99, 1.19, '20g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Fruucs', 'Fruucs gefriergetrocknete Früchte versch. Sorten', 'Fruucs Freeze-dried Fruits various', 'Snacks & Nüsse', 'Snacks & Nuts', 4.99, NULL, '30g-50g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Brandt', 'Brandt Zwieback +37% gratis', 'Brandt Rusk +37% free', 'Frühstück & Cerealien', 'Breakfast & Cereal', 2.25, 2.99, '300g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Doritos', 'Doritos versch. Sorten', 'Doritos various', 'Snacks & Nüsse', 'Snacks & Nuts', 1.30, 1.99, '100g-110g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Fisherman''s Friend', 'Fisherman''s Friend versch. Sorten', 'Fisherman''s Friend various', 'Süßwaren', 'Sweets', 0.99, NULL, '90g', '2026-04-09', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 57 (Payback-Doppelseite): Tiefpreise dauerhaft ===
('5', 'Genuss Welt', 'Genuss Welt Antipasti Creme gekühlt versch. Sorten', 'Genuss Welt Antipasti Cream chilled various', 'Brotaufstrich', 'Spreads', 1.59, NULL, '150g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Laschinger', 'Laschinger Regenbogenforellenfilet geräuchert gekühlt', 'Laschinger Rainbow Trout Fillet smoked chilled', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.49, NULL, '125g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Leibniz', 'Leibniz Kekse versch. Sorten', 'Leibniz Biscuits various', 'Süßwaren', 'Sweets', 1.99, NULL, '150g-200g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Böhme', 'Böhme Schokolade versch. Sorten', 'Böhme Chocolate various', 'Süßwaren', 'Sweets', 0.99, NULL, '100g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Bonduelle', 'Bonduelle Goldmais', 'Bonduelle Sweetcorn Gold', 'Grundnahrungsmittel', 'Staples', 1.79, NULL, '285g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 58 (Payback): Kaffee / Tierbedarf / Grundnahrungsmittel dauerhaft ===
('5', 'Senseo', 'Senseo Kaffee Pads versch. Sorten', 'Senseo Coffee Pads various', 'Kaffee & Tee', 'Coffee & Tea', 3.99, NULL, '92-111g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Fruke''s', 'Fruke''s Fruchtkaramellen', 'Fruke''s Fruit Caramels', 'Süßwaren', 'Sweets', 1.89, NULL, '250g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Jacobs', 'Jacobs Sticks löslicher Bohnenkaffee versch. Sorten', 'Jacobs Sticks instant coffee various', 'Kaffee & Tee', 'Coffee & Tea', 2.79, NULL, '120g-124g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Pfanni', 'Pfanni Kartoffel Püree', 'Pfanni Mashed Potato', 'Grundnahrungsmittel', 'Staples', 2.49, NULL, '1,5 Liter', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Attica', 'Attica Katzensticks versch. Sorten', 'Attica Cat Sticks various', 'Tierbedarf', 'Pet Supplies', 0.95, NULL, '50g', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),
('5', '4Paws', '4Paws Hundetrockenfutter', '4Paws Dry Dog Food', 'Tierbedarf', 'Pet Supplies', 3.25, NULL, '2 kg', '2026-04-07', '2026-04-11', true, 'https://www.netto-online.de'),

-- === PAGE 60 (Freitags: Alles zum 1/2 Preis): gültig 10.04.26 ===
('5', 'Netto', 'Chicken Wings Box Hähnchen-Flügel tiefgekühlt gewürzt', 'Chicken Wings Box frozen seasoned', 'Tiefkühl', 'Frozen', 3.99, 7.99, '1 kg', '2026-04-10', '2026-04-10', true, 'https://www.netto-online.de'),
('5', 'Dr. Oetker', 'Dr. Oetker Bistro Baguettes tiefgekühlt versch. Sorten', 'Dr. Oetker Bistro Baguettes frozen various', 'Tiefkühl', 'Frozen', 1.14, 2.29, '250g', '2026-04-10', '2026-04-10', true, 'https://www.netto-online.de'),
('5', 'Dallmayr', 'Dallmayr Gold löslicher Bohnenkaffee', 'Dallmayr Gold Instant Bean Coffee', 'Kaffee & Tee', 'Coffee & Tea', 5.49, 10.99, '200g', '2026-04-10', '2026-04-10', true, 'https://www.netto-online.de'),
('5', 'Dovgan', 'Dovgan Gezuckerte Kondensmilch', 'Dovgan Sweetened Condensed Milk', 'Milchprodukte', 'Dairy', 0.99, 1.99, '370g', '2026-04-10', '2026-04-10', true, 'https://www.netto-online.de'),

-- === PAGE 61 (Samstags-Kracher): gültig 11.04.26 ===
('5', 'Netto', 'Schweine-Minutensteaks zart und mager XXL', 'Pork Minute Steaks tender and lean XXL', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, 7.99, '1 kg', '2026-04-11', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Dallmayr', 'Dallmayr Crema d''Oro ganze Kaffeebohnen versch. Sorten', 'Dallmayr Crema d''Oro Whole Coffee Beans various', 'Kaffee & Tee', 'Coffee & Tea', 12.88, 20.99, '1 kg', '2026-04-11', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Netto', 'Heidelbeeren Marokko/Spanien Kl. I', 'Blueberries Morocco/Spain Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 3.69, 4.99, '300g Schale', '2026-04-11', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Faber', 'Faber Sekt halbtrocken oder Light alkoholfrei', 'Faber Sparkling Wine semi-dry or Light alcohol-free', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.22, 3.79, '0,75 Liter', '2026-04-11', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Kerrygold', 'Kerrygold Extra XXL Butter gekühlt versch. Sorten', 'Kerrygold Extra XXL Butter chilled various', 'Butter', 'Butter', 2.59, 4.99, '400g', '2026-04-11', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Kerrygold', 'Kerrygold Extra XXL Butter gekühlt versch. Sorten (Netto App)', 'Kerrygold Extra XXL Butter chilled various (Netto App)', 'Butter', 'Butter', 2.39, 4.99, '400g', '2026-04-11', '2026-04-11', true, 'https://www.netto-online.de'),
('5', 'Limetta', 'Limetta Cola-Mix oder Cola-Mix Zero koffeinhaltig', 'Limetta Cola Mix or Cola Mix Zero caffeinated', 'Getränke', 'Beverages', 5.99, 8.49, '20x0,5 Liter', '2026-04-11', '2026-04-11', true, 'https://www.netto-online.de');
