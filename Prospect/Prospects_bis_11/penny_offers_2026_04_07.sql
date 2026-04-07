DELETE FROM public.offers WHERE store_id = '3' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2: Cover Di. 7.4. - Sa. 11.4. ===
('3', 'Coca-Cola', 'Coca-Cola Original Taste 2 Liter', 'Coca-Cola Original Taste 2 Liter', 'Getränke', 'Beverages', 1.49, 2.19, '2L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Coca-Cola', 'Coca-Cola Original Taste 2 Liter (Penny App)', 'Coca-Cola Original Taste 2 Liter (Penny App)', 'Getränke', 'Beverages', 1.29, 2.19, '2L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Wagner', 'Original Wagner Steinofen Pizza versch. Sorten', 'Original Wagner Stone Oven Pizza assorted', 'Tiefkühl', 'Frozen', 3.33, NULL, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Haribo', 'Haribo Fruchtgummi versch. Sorten', 'Haribo Fruit Gummies assorted', 'Süßwaren', 'Sweets', 0.79, 1.19, '175-200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Thomy', 'Thomy Delikatess-Mayonnaise oder Remoulade +20% gratis', 'Thomy Delicatessen Mayonnaise or Remoulade +20% free', 'Saucen & Gewürze', 'Sauces & Spices', 0.99, NULL, '300ml', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Hähnchenbrust-Aufschnitt XXL 200g', 'Mühlenhof Chicken Breast Cold Cut XXL 200g', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '200g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Dunkle Trauben kernlos Spanien/Griechenland Kl. I', 'Dark Seedless Grapes Spain/Greece Cl. I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, NULL, '500g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Lindahls', 'Lindahls Quarkhit versch. Sorten', 'Lindahls Quark Hit assorted', 'Milchprodukte', 'Dairy', 5.55, NULL, '3x150g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 3: Obst & Gemüse Di. 7.4. - Sa. 11.4. ===
('3', 'Eigenmarke', 'Mini-Gurke Kl. I Stück', 'Mini Cucumber Cl. I piece', 'Obst & Gemüse', 'Fruits & Vegetables', 0.33, NULL, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Speisefrühkartoffeln Drillinge festkochend 1,5kg', 'Early Season Baby Potatoes waxy 1.5kg', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, NULL, '1.5kg', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Speisefrühkartoffeln Drillinge 1,5kg (Penny App)', 'Early Season Baby Potatoes 1.5kg (Penny App)', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, NULL, '1.5kg', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Rucola Italien Kl. I 125g Schale', 'Rocket Italy Cl. I 125g Tray', 'Obst & Gemüse', 'Fruits & Vegetables', 0.75, 0.99, '125g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 4: Obst Di. 7.4. - Sa. 11.4. ===
('3', 'Naturgut', 'Naturgut Bio-Avocado 2 Stück', 'Naturgut Organic Avocado 2 pcs', 'Obst & Gemüse', 'Fruits & Vegetables', 1.00, NULL, '2 Stück', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Naturgut', 'Naturgut Bio-Erdbeeren Klasse I 250g', 'Naturgut Organic Strawberries Class I 250g', 'Obst & Gemüse', 'Fruits & Vegetables', 1.00, NULL, '250g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Wassermelone Kl. I Stück', 'Watermelon Cl. I piece', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, NULL, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 5: Fleisch Mühlenhof Di. 7.4. - Sa. 11.4. ===
('3', 'Mühlenhof', 'Mühlenhof Frische Rinder-Salami 1kg', 'Mühlenhof Fresh Beef Salami 1kg', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '1kg', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Naturgut', 'Naturgut Frisches Bio-Hackfleisch gemischt XXL 750g', 'Naturgut Fresh Organic Mixed Mince XXL 750g', 'Fleisch & Wurst', 'Meat & Sausage', 7.99, NULL, '750g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Hähnchenbrust-Cordon-Bleu küchenfertig 150g', 'Mühlenhof Chicken Breast Cordon Bleu ready-to-cook 150g', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, NULL, '150g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Frische Rinderroulade 2 Stück 400g', 'Fresh Beef Roulades 2 pcs 400g', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, NULL, '400g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Frischer Kasseler Lachs ausgelöst 400g', 'Mühlenhof Fresh Kasseler Loin boneless 400g', 'Fleisch & Wurst', 'Meat & Sausage', 4.44, NULL, '400g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Frische Hähnchenbrustfilets 500g', 'Fresh Chicken Breast Fillets 500g', 'Fleisch & Wurst', 'Meat & Sausage', 3.49, NULL, '500g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Grillparty', 'Grillparty Krustenbraten Paprika 600g', 'Grillparty Crusted Roast Paprika 600g', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 4.79, '600g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Butcher''s', 'Butcher''s Dry-Aged Rindersteak versch. Sorten', 'Butcher''s Dry-Aged Beef Steak assorted', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 4.99, '250g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 6: Wurst Di. 7.4. - Sa. 11.4. ===
('3', 'Mühlenhof', 'Mühlenhof Delikatess Fleischwurst XXL 280g +25% gratis', 'Mühlenhof Delicatessen Meat Sausage XXL 280g +25% free', 'Fleisch & Wurst', 'Meat & Sausage', 3.29, NULL, '280g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Delikatess Fleischwurst XXL (Penny App)', 'Mühlenhof Delicatessen Meat Sausage XXL (Penny App)', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, NULL, '280g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Metzger Pfeffermettwurst 250g', 'Butcher Pepper Mettwurst 250g', 'Fleisch & Wurst', 'Meat & Sausage', 1.69, NULL, '250g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Dickopf', 'Dickopf Kochmettwurst 150g', 'Dickopf Cooked Mettwurst 150g', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '150g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Aoste', 'Aoste Chorizo Rollen versch. Sorten', 'Aoste Chorizo Rolls assorted', 'Fleisch & Wurst', 'Meat & Sausage', 3.79, NULL, '250g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Argeta', 'Argeta Aufstrich versch. Sorten', 'Argeta Spread assorted', 'Brotaufstrich', 'Spreads', 1.19, NULL, '95g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Erntler Fleischgericht versch. Sorten 400g', 'Erntler Meat Dish assorted 400g', 'Fertiggerichte', 'Ready Meals', 3.33, NULL, '400g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Gutfried', 'Gutfried Geflügel-Würstchen/Wiener mit Käsebrühwürst versch. Sorten', 'Gutfried Poultry Sausages/Wieners with Cheese assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Gutfried', 'Gutfried Geflügel-Würstchen (Penny App)', 'Gutfried Poultry Sausages (Penny App)', 'Fleisch & Wurst', 'Meat & Sausage', 1.69, NULL, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Wieser Schwäbischer geräucherter Schinken', 'Wieser Swabian Smoked Ham', 'Fleisch & Wurst', 'Meat & Sausage', 2.39, NULL, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Wamser Wiener Würstchen 6 Stück', 'Wamser Vienna Sausages 6 pcs', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 4.69, '6 Stück', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Wieser', 'Wieser Münchner Weißwurst', 'Wieser Munich White Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, NULL, 'Packung', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Wieser', 'Wieser Münchner Weißwurst (Penny App)', 'Wieser Munich White Sausage (Penny App)', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, 'Packung', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 7: Käse Di. 7.4. - Sa. 11.4. ===
('3', 'Kerrygold', 'Kerrygold Cheddar-Scheiben versch. Sorten', 'Kerrygold Cheddar Slices assorted', 'Käse', 'Cheese', 1.49, 2.99, '150g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Lekka', 'Lekka Aufschnitt versch. Sorten', 'Lekka Cold Cuts assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.19, NULL, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Lindenhof', 'Lindenhof Ziegenweichkäse versch. Sorten', 'Lindenhof Goat Soft Cheese assorted', 'Käse', 'Cheese', 2.22, 2.59, '125g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Erdinger', 'Erdinger Chöritz versch. Sorten', 'Erdinger Chöritz assorted', 'Käse', 'Cheese', 1.99, 2.49, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'St. Mang', 'St. Mang Allgäuer Limburger Rubius Weichkäse', 'St. Mang Allgäu Limburger Rubius Soft Cheese', 'Käse', 'Cheese', 1.99, 3.09, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Milram', 'Milram Gewürzquark versch. Sorten', 'Milram Spiced Quark assorted', 'Milchprodukte', 'Dairy', 0.99, 1.49, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Bürger', 'Bürger Maultaschen versch. Sorten', 'Bürger Ravioli assorted', 'Fertiggerichte', 'Ready Meals', 1.79, NULL, '300g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Frasse Rein Hot Dogs versch. Sorten', 'Frasse Pure Hot Dogs assorted', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, NULL, '6 Stück', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Fischburger versch. Sorten', 'Berida Fish Burger assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.49, NULL, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Fischburger (Penny App)', 'Berida Fish Burger (Penny App)', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.49, NULL, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 8: Milchprodukte Di. 7.4. - Sa. 11.4. ===
('3', 'Rama', 'Rama mit Butter versch. Sorten', 'Rama with Butter assorted', 'Butter', 'Butter', 1.99, 3.19, '225g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Lätta', 'Lätta Halbfettmargarine', 'Lätta Half-fat Margarine', 'Butter', 'Butter', 1.29, 2.29, '450g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Müller', 'Müller Buttermilch Kefir 3,5% Fett 1,5L', 'Müller Buttermilk Kefir 3.5% fat 1.5L', 'Milchprodukte', 'Dairy', 0.88, 1.29, '1.5L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Kinder', 'Kinder Maxi King', 'Kinder Maxi King', 'Süßwaren', 'Sweets', 1.49, 1.99, '3 Stück', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Hiprofin', 'Hiprofin High Protein Quarkcreme versch. Sorten', 'Hiprofin High Protein Quark Cream assorted', 'Milchprodukte', 'Dairy', 0.95, 1.19, '250g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Hiprofin', 'Hiprofin High Protein Quarkcreme (Penny App)', 'Hiprofin High Protein Quark Cream (Penny App)', 'Milchprodukte', 'Dairy', 0.95, 1.19, '250g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Müller', 'Müller Froop Joghurt versch. Sorten', 'Müller Froop Yogurt assorted', 'Milchprodukte', 'Dairy', 0.39, 0.79, '150g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Dr. Oetker', 'Dr. Oetker Fruchtzwerge/Paula Pudding/Mamakueste Spätze versch. Sorten', 'Dr. Oetker Fruit Dwarfs/Paula Pudding/Mama Kitchen Spaetzle assorted', 'Milchprodukte', 'Dairy', 1.49, NULL, '4 Stück', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 9: Food for Future Di. 7.4. - Sa. 11.4. ===
('3', 'Food for Future', 'Food for Future Hummus Natur versch. Sorten', 'Food for Future Hummus Natural assorted', 'Brotaufstrich', 'Spreads', 0.79, 0.99, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Food for Future', 'Food for Future Aufschnitt versch. Sorten', 'Food for Future Cold Cut assorted', 'Fleischersatz', 'Meat Alternatives', 1.29, NULL, '100g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Food for Future', 'Food for Future Bio Mandeldrink', 'Food for Future Organic Almond Drink', 'Milchprodukte', 'Dairy', 1.35, NULL, '1L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Food for Future', 'Food for Future Frischcreme versch. Sorten', 'Food for Future Fresh Cream assorted', 'Brotaufstrich', 'Spreads', 1.09, NULL, '150g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Food for Future', 'Food for Future Veganer Aufschnitt versch. Sorten', 'Food for Future Vegan Cold Cut assorted', 'Fleischersatz', 'Meat Alternatives', 1.25, NULL, '100g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Food for Future', 'Food for Future Vegane Nuggets versch. Sorten', 'Food for Future Vegan Nuggets assorted', 'Fleischersatz', 'Meat Alternatives', 1.89, 2.19, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Food for Future', 'Food for Future Vegane Crispy Sticks', 'Food for Future Vegan Crispy Sticks', 'Fleischersatz', 'Meat Alternatives', 2.29, NULL, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Food for Future', 'Food for Future Falafel versch. Sorten', 'Food for Future Falafel assorted', 'Fleischersatz', 'Meat Alternatives', 1.99, NULL, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 10: Lay''s & Doritos Di. 7.4. - Sa. 11.4. ===
('3', 'Doritos', 'Doritos Tortilla Chips versch. Sorten', 'Doritos Tortilla Chips assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 1.19, NULL, '110g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Doritos', 'Doritos Tortilla Chips (Penny App)', 'Doritos Tortilla Chips (Penny App)', 'Snacks & Nüsse', 'Snacks & Nuts', 0.99, NULL, '110g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Lay''s', 'Lay''s Chips versch. Sorten', 'Lay''s Chips assorted', 'Snacks & Nüsse', 'Snacks & Nuts', 1.19, NULL, '150g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Lay''s', 'Lay''s Chips (Penny App)', 'Lay''s Chips (Penny App)', 'Snacks & Nüsse', 'Snacks & Nuts', 0.99, NULL, '150g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 11: Kaffee & Süßes Di. 7.4. - Sa. 11.4. ===
('3', 'Schogetten', 'Schogetten Schokolade versch. Sorten', 'Schogetten Chocolate assorted', 'Süßwaren', 'Sweets', 1.11, 1.99, '100g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Schogetten', 'Schogetten Schokolade (Penny App)', 'Schogetten Chocolate (Penny App)', 'Süßwaren', 'Sweets', 0.95, 1.99, '100g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Nescafé', 'Nescafé Espresso Sticks versch. Sorten', 'Nescafé Espresso Sticks assorted', 'Kaffee & Tee', 'Coffee & Tea', 5.99, 8.19, '25 Stück', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Teekanne', 'Teekanne Früchtetee versch. Sorten', 'Teekanne Fruit Tea assorted', 'Kaffee & Tee', 'Coffee & Tea', 1.59, 2.49, '20 Beutel', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Krüger', 'Krüger Family Cappuccino versch. Sorten', 'Krüger Family Cappuccino assorted', 'Kaffee & Tee', 'Coffee & Tea', 2.49, NULL, '500g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Segafredo', 'Segafredo Intermezzo Caffè Ganze Bohnen 1kg', 'Segafredo Intermezzo Coffee Whole Beans 1kg', 'Kaffee & Tee', 'Coffee & Tea', 13.99, 21.99, '1kg', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Grandessa', 'Grandessa Classic Porridge versch. Sorten', 'Grandessa Classic Porridge assorted', 'Frühstück & Cerealien', 'Breakfast & Cereal', 1.49, 1.89, '350g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', '7 Days', '7 Days Mini-Croissants versch. Sorten', '7 Days Mini Croissants assorted', 'Brot & Backwaren', 'Bread & Bakery', 1.79, 2.99, '185g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Nürtinger Blütenhonig 500g', 'Nürtinger Blossom Honey 500g', 'Brotaufstrich', 'Spreads', 3.99, NULL, '500g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Ritter Sport', 'Ritter Sport Bunte Vielfalt versch. Sorten 100g', 'Ritter Sport Colorful Variety assorted 100g', 'Süßwaren', 'Sweets', 2.99, 4.29, '100g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Manner', 'Manner Neapolitaner Schnitten versch. Sorten', 'Manner Neapolitan Wafers assorted', 'Süßwaren', 'Sweets', 1.11, 1.99, '75g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Milka', 'Milka Choco Trio/9 Cakes versch. Sorten', 'Milka Choco Trio/9 Cakes assorted', 'Süßwaren', 'Sweets', 1.99, NULL, '150g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 12: Lebensmittel Di. 7.4. - Sa. 11.4. ===
('3', 'Barilla', 'Barilla Collezione Pasta versch. Sorten', 'Barilla Collezione Pasta assorted', 'Nudeln & Reis', 'Pasta & Rice', 1.69, NULL, '500g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Barilla', 'Barilla Bolognese/Ricotta Sauce versch. Sorten', 'Barilla Bolognese/Ricotta Sauce assorted', 'Saucen & Gewürze', 'Sauces & Spices', 2.29, NULL, '400g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Maggi', 'Maggi 5 Minuten Terrine Kartoffelbrei versch. Sorten', 'Maggi 5 Minute Cup Mashed Potatoes assorted', 'Fertiggerichte', 'Ready Meals', 0.99, 1.49, '60g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', '3 Glocken', 'Drei Glocken Genuss Pur versch. Sorten', 'Three Bells Pure Pleasure assorted', 'Nudeln & Reis', 'Pasta & Rice', 1.99, NULL, '500g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Develey', 'Develey Sauce versch. Sorten', 'Develey Sauce assorted', 'Saucen & Gewürze', 'Sauces & Spices', 1.29, NULL, '250ml', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Develey', 'Develey Tomaten-Ketchup', 'Develey Tomato Ketchup', 'Saucen & Gewürze', 'Sauces & Spices', 1.79, 2.69, '500ml', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Larsen', 'Larsen Lachssalat versch. Sorten 150g', 'Larsen Salmon Salad assorted 150g', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.79, 1.99, '150g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Thomy', 'Thomy Joghurt-Salat-Mayonnaise Normandie versch. Sorten', 'Thomy Yogurt Salad Mayonnaise Normandy assorted', 'Saucen & Gewürze', 'Sauces & Spices', 2.49, 3.29, '240ml', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Leimer', 'Leimer Panko Paniermehl versch. Sorten', 'Leimer Panko Breadcrumbs assorted', 'Grundnahrungsmittel', 'Staples', 0.79, NULL, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 13: Süßwaren & Getränke Di. 7.4. - Sa. 11.4. ===
('3', 'Kinder', 'Kinder Tronky 5 Stück', 'Kinder Tronky 5 pcs', 'Süßwaren', 'Sweets', 1.69, 2.19, '5x18g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Nutella', 'Nutella B-ready versch. Sorten', 'Nutella B-ready assorted', 'Süßwaren', 'Sweets', 2.39, NULL, '6 Stück', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Milka', 'Milka/Oreo Favourites versch. Sorten', 'Milka/Oreo Favourites assorted', 'Süßwaren', 'Sweets', 2.99, 4.99, '150-159g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Sämpi Holländische Lakritze versch. Sorten', 'Sämpi Dutch Liquorice assorted', 'Süßwaren', 'Sweets', 0.89, 1.19, '200g', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Franken', 'Franken Bräu Qualitätsbier versch. Sorten', 'Franken Bräu Quality Beer assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.79, NULL, '6x0.5L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Veltins', 'Veltins Energy Drink 0.5L Dose', 'Veltins Energy Drink 0.5L can', 'Getränke', 'Beverages', 0.69, 0.95, '0.5L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Tyskie', 'Tyskie Pils Bier 6x0.5L', 'Tyskie Pilsner Beer 6x0.5L', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.44, 5.49, '6x0.5L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Jack Daniel''s', 'Jack Daniel''s Whiskey 0.7L', 'Jack Daniel''s Whiskey 0.7L', 'Alkoholische Getränke', 'Alcoholic Beverages', 15.99, 19.99, '0.7L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Jack Daniel''s', 'Jack Daniel''s Whiskey (Penny App)', 'Jack Daniel''s Whiskey (Penny App)', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.99, 19.99, '0.7L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Bayreuther Brauhaus', 'Bayreuther Brauhaus Bier versch. Sorten 20x0.5L', 'Bayreuth Brewery Beer assorted 20x0.5L', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.49, 19.49, '20x0.5L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Gösser', 'Gösser Natur Radler Bier versch. Sorten 20x0.5L', 'Gösser Natural Radler Beer assorted 20x0.5L', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.99, 16.99, '20x0.5L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Warsteiner', 'Warsteiner Pilsner oder Radler 6x0.33L', 'Warsteiner Pilsner or Radler 6x0.33L', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.95, 4.95, '6x0.33L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 14: Haushalt Di. 7.4. - Sa. 11.4. ===
('3', 'Sagrotan', 'Sagrotan Tücher/Spray versch. Sorten', 'Sagrotan Wipes/Spray assorted', 'Haushalt', 'Household', 2.99, NULL, 'Stück', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Sagrotan', 'Sagrotan Reiniger versch. Sorten', 'Sagrotan Cleaner assorted', 'Haushalt', 'Household', 2.79, 3.29, '750ml', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Sagrotan', 'Sagrotan Wäsche-Hygienespüler 1,5L', 'Sagrotan Laundry Hygiene Rinse 1.5L', 'Haushalt', 'Household', 5.99, 6.49, '1.5L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Persil', 'Persil Color Pulver 76 Waschladungen', 'Persil Color Powder 76 Washes', 'Haushalt', 'Household', 18.99, NULL, '76WL', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Persil', 'Persil Color Pulver (Penny App)', 'Persil Color Powder (Penny App)', 'Haushalt', 'Household', 16.99, NULL, '76WL', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Vernel', 'Vernel Weichspüler versch. Sorten', 'Vernel Fabric Softener assorted', 'Haushalt', 'Household', 2.49, NULL, '1L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Pril', 'Pril Geschirrspülmittel versch. Sorten', 'Pril Dish Soap assorted', 'Haushalt', 'Household', 1.39, 1.69, '450ml', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Listerine', 'Listerine Mundspülung versch. Sorten', 'Listerine Mouthwash assorted', 'Haushalt', 'Household', 4.49, NULL, '600ml', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Fa', 'Fa Duschgel versch. Sorten', 'Fa Shower Gel assorted', 'Haushalt', 'Household', 1.29, NULL, '250ml', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 15: Wein & Sekt Di. 7.4. - Sa. 11.4. ===
('3', 'Chloé', 'Chloé Spritz versch. Sorten', 'Chloé Spritz assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 0.99, NULL, '0.2L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Prosecco oder Cava Brut versch. Sorten', 'Prosecco or Cava Brut assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 6.49, '0.75L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Aprezzo', 'Aprezzo Pink oder Spritz versch. Sorten', 'Aprezzo Pink or Spritz assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 4.49, '0.75L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Naturgut', 'Naturgut Bio Prosecco Spumante', 'Naturgut Organic Prosecco Spumante', 'Alkoholische Getränke', 'Alcoholic Beverages', 0.99, NULL, '0.2L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Richtig Lecker Weißwein 0,5L alkoholfrei', 'Really Tasty White Wine 0.5L non-alcoholic', 'Getränke', 'Beverages', 2.49, 2.99, '0.75L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Apéritif Spritz', 'Apéritif Spritz versch. Sorten 0,75L', 'Aperitif Spritz assorted 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.89, NULL, '0.75L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Maracujón', 'Maracujón Maracuja-Sekt 0,75L', 'Maracujón Passion Fruit Sparkling Wine 0.75L', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.49, 8.49, '0.75L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Waltraud', 'Waltraud Gebirgskräuterlikör', 'Waltraud Mountain Herb Liqueur', 'Alkoholische Getränke', 'Alcoholic Beverages', 5.49, 7.99, '0.7L', '2026-04-07', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 35: XXL Ab Do. 9.4. - Sa. 11.4. ===
('3', 'Happy End', 'Happy End XXL Toilettenpapier 3-lagig 20+4 Rollen', 'Happy End XXL Toilet Paper 3-ply 20+4 Rolls', 'Haushalt', 'Household', 6.99, NULL, '24 Rollen', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Landjunker', 'Landjunker XXL Aufschnitt Schnitzel/Wiener/Bierschinken 300g', 'Landjunker XXL Cold Cuts Schnitzel/Wiener/Beer Ham 300g', 'Fleisch & Wurst', 'Meat & Sausage', 5.55, NULL, '300g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof XXL Delikatess Bratwurst', 'Mühlenhof XXL Delicatessen Bratwurst', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '400g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof XXL Delikatess Bockwurst', 'Mühlenhof XXL Delicatessen Bockwurst', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, NULL, '720g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Eierquarkpfannkuchen XXL Maultaschen', 'Egg Quark Pancakes XXL Ravioli', 'Fertiggerichte', 'Ready Meals', 4.99, NULL, '600g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Mirácoli', 'Mirácoli Pasta Klassiker versch. Sorten', 'Mirácoli Pasta Classic assorted', 'Fertiggerichte', 'Ready Meals', 3.49, NULL, '610g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Ben''s Original', 'Ben''s Original Express-Reis Basmati', 'Ben''s Original Express Rice Basmati', 'Nudeln & Reis', 'Pasta & Rice', 2.69, NULL, '400g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Heinz', 'Heinz XXL Baked Beans 415g', 'Heinz XXL Baked Beans 415g', 'Grundnahrungsmittel', 'Staples', 3.99, NULL, '415g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 36: XL Süßwaren Ab Do. 9.4. - Sa. 11.4. ===
('3', 'Berida', 'Berida XXL Räucherlachs versch. Sorten 300g', 'Berida XXL Smoked Salmon assorted 300g', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 4.29, NULL, '300g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Nestlé', 'Nestlé KitKat XXL Packung versch. Sorten 8 Riegel', 'Nestlé KitKat XXL Pack assorted 8 bars', 'Süßwaren', 'Sweets', 3.79, 6.29, '8 Riegel', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios XXL Gigant Puri Quartett Eis', 'Rios XXL Giant Puri Quartet Ice Cream', 'Eiscreme', 'Ice Cream', 4.35, NULL, '4 Stück', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Storck', 'Storck Riesen XXL-Pack 700g', 'Storck Riesen XXL Pack 700g', 'Süßwaren', 'Sweets', 2.99, NULL, '700g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Ferrero', 'Ferrero XXL Yogurette oder Kinder Schoko Bons Sparpreis versch. Sorten', 'Ferrero XXL Yogurette or Kinder Schoko Bons Budget assorted', 'Süßwaren', 'Sweets', 4.99, NULL, '300g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Bravo', 'Bravo XXL Cashew versch. Sorten 200g', 'Bravo XXL Cashew assorted 200g', 'Snacks & Nüsse', 'Snacks & Nuts', 2.99, NULL, '200g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Chocalls', 'Chocalls XXL Schaumnüsse versch. Sorten', 'Chocalls XXL Foam Nuts assorted', 'Süßwaren', 'Sweets', 1.99, NULL, '300g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Milbona', 'Milbona XXL Kondensmilch', 'Milbona XXL Condensed Milk', 'Milchprodukte', 'Dairy', 0.99, NULL, '340g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 37: Ab Do. 9.4. - Sa. 11.4. ===
('3', 'Nescafé', 'Nescafé Farmers Origins Kapseln versch. Sorten', 'Nescafé Farmers Origins Capsules assorted', 'Kaffee & Tee', 'Coffee & Tea', 2.49, 3.19, '10 Kapseln', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Melitta', 'Melitta Barista Caffè Crema Ganze Bohnen 1kg', 'Melitta Barista Caffè Crema Whole Beans 1kg', 'Kaffee & Tee', 'Coffee & Tea', 12.99, 19.49, '1kg', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Lavazza', 'Lavazza Caffè Crema/Espresso Ganze Bohnen 1kg', 'Lavazza Caffè Crema/Espresso Whole Beans 1kg', 'Kaffee & Tee', 'Coffee & Tea', 13.99, NULL, '1kg', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Treets', 'Treets Choco Peanut Müsli versch. Sorten', 'Treets Choco Peanut Muesli assorted', 'Frühstück & Cerealien', 'Breakfast & Cereal', 2.49, NULL, '450g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Best Sandwich Cookies versch. Sorten', 'Penny Best Sandwich Cookies assorted', 'Süßwaren', 'Sweets', 2.39, NULL, '300g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Milch Muh', 'Milch Muh Roll Bonbons versch. Sorten', 'Milk Muh Roll Candies assorted', 'Süßwaren', 'Sweets', 1.49, NULL, '150g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Rapsgold', 'Rapsgold Rapsöl 750ml', 'Rapsgold Rapeseed Oil 750ml', 'Öle & Essig', 'Oils & Vinegar', 2.99, 3.99, '750ml', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Hengstenberg', 'Hengstenberg Knax Dill-Gurken XXL versch. Sorten', 'Hengstenberg Knax Dill Pickles XXL assorted', 'Grundnahrungsmittel', 'Staples', 2.59, 4.49, '720ml', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Vittel', 'Vittel Mineralwasser 1,5L', 'Vittel Mineral Water 1.5L', 'Getränke', 'Beverages', 1.79, 2.79, '1.5L', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Erdmann Sahnelikör versch. Sorten', 'Erdmann Cream Liqueur assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.49, 2.39, '0.35L', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 38: Haushalt & Getränke Ab Do. 9.4. - Sa. 11.4. ===
('3', 'Maoam', 'Maoam Mr. Tom versch. Sorten', 'Maoam Mr. Tom assorted', 'Süßwaren', 'Sweets', 1.99, 2.89, '150g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Disney Schoko-Bons versch. Sorten', 'Disney Choco Bons assorted', 'Süßwaren', 'Sweets', 1.99, 2.79, '150g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Pustefix', 'Pustefix Schaum versch. Sorten', 'Pustefix Foam assorted', 'Haushalt', 'Household', 1.69, 1.99, '200g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Rockstar', 'Rockstar Energy Drink versch. Sorten 0.5L', 'Rockstar Energy Drink assorted 0.5L', 'Getränke', 'Beverages', 0.88, 1.79, '0.5L', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Aurel', 'Aurel Active Fitness Drink O2 versch. Sorten', 'Aurel Active Fitness Drink O2 assorted', 'Getränke', 'Beverages', 0.99, 1.19, '0.75L', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Hella', 'Hella Mineralwasser versch. Sorten 0.75L', 'Hella Mineral Water assorted 0.75L', 'Getränke', 'Beverages', 0.59, 0.79, '0.75L', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Eigenmarke', 'Lindburg Cola Mix versch. Sorten 1.5L', 'Lindburg Cola Mix assorted 1.5L', 'Getränke', 'Beverages', 0.88, 1.00, '1.5L', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Gliss', 'Gliss Shampoo oder Spülung versch. Sorten 250ml', 'Gliss Shampoo or Conditioner assorted 250ml', 'Haushalt', 'Household', 2.49, 2.99, '250ml', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Taft', 'Taft Haarspray/Schaumfestiger versch. Sorten', 'Taft Hair Spray/Mousse assorted', 'Haushalt', 'Household', 2.99, NULL, '250ml', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Gillette', 'Gillette Blue3 Rasierer Einwegrasierer', 'Gillette Blue3 Disposable Razors', 'Haushalt', 'Household', 1.99, NULL, '3 Stück', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Zewa', 'Zewa Wisch & Weg Original Küchenrollen 4 Rollen', 'Zewa Wipe & Away Original Kitchen Rolls 4 Rolls', 'Haushalt', 'Household', 4.59, 4.99, '4 Rollen', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Whiskas', 'Whiskas Vollwertiges Katzenfutter versch. Sorten', 'Whiskas Complete Cat Food assorted', 'Tierbedarf', 'Pet Supplies', 2.49, NULL, '800g', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Catsan', 'Catsan Hygiene-Streu 10L', 'Catsan Hygiene Cat Litter 10L', 'Tierbedarf', 'Pet Supplies', 9.99, NULL, '10L', '2026-04-09', '2026-04-11', true, 'https://www.penny.de'),

-- === PAGE 39: FRAMSTAG Fr. 10.4. - Sa. 11.4. ===
('3', 'Eigenmarke', 'Mineralwasser Kasten 12x1L', 'Mineral Water Crate 12x1L', 'Getränke', 'Beverages', 6.50, NULL, '12x1L', '2026-04-10', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Grasovka', 'Grasovka Vodka de Luxe 0.5L', 'Grasovka Vodka de Luxe 0.5L', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.66, 8.99, '0.5L', '2026-04-10', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Delikatess Bacon 150g', 'Mühlenhof Delicatessen Bacon 150g', 'Fleisch & Wurst', 'Meat & Sausage', 0.99, 1.29, '150g', '2026-04-10', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Delikatess Bacon (Penny App)', 'Mühlenhof Delicatessen Bacon (Penny App)', 'Fleisch & Wurst', 'Meat & Sausage', 0.88, 1.29, '150g', '2026-04-10', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Frische Schweine-Schnitzel aus der Keule 400g', 'Mühlenhof Fresh Pork Schnitzel from Leg 400g', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, 3.19, '400g', '2026-04-10', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Schweine-Schnitzel (Penny App)', 'Mühlenhof Pork Schnitzel (Penny App)', 'Fleisch & Wurst', 'Meat & Sausage', 2.22, 3.19, '400g', '2026-04-10', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Harry', 'Harry Sammy''s Super Sandwich 750g', 'Harry Sammy''s Super Sandwich 750g', 'Brot & Backwaren', 'Bread & Bakery', 1.99, 2.49, '750g', '2026-04-10', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Harry', 'Harry Sammy''s Super Sandwich (Penny App)', 'Harry Sammy''s Super Sandwich (Penny App)', 'Brot & Backwaren', 'Bread & Bakery', 1.49, 2.49, '750g', '2026-04-10', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Barilla', 'Barilla Pesto versch. Sorten 190g', 'Barilla Pesto assorted 190g', 'Saucen & Gewürze', 'Sauces & Spices', 1.79, 3.49, '190g', '2026-04-10', '2026-04-11', true, 'https://www.penny.de'),
('3', 'Barilla', 'Barilla Pesto (Penny App)', 'Barilla Pesto (Penny App)', 'Saucen & Gewürze', 'Sauces & Spices', 1.69, 3.49, '190g', '2026-04-10', '2026-04-11', true, 'https://www.penny.de');
