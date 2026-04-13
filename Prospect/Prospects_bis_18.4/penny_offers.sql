DELETE FROM public.offers WHERE store_id = '3' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2 (PDF p.2): Titelseite / Cover Deals ===
('3', 'Milka', 'Milka Schokolade', 'Milka Chocolate', 'Süßwaren', 'Sweets', 2.99, 4.99, 'je 300g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Milka', 'Milka Schokolade (Penny App)', 'Milka Chocolate (Penny App)', 'Süßwaren', 'Sweets', 2.77, 4.99, 'je 300g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Schwip Schwap / Pepsi', 'Schwip Schwap / 7UP / Pepsi Erfrischungsgetränk', 'Schwip Schwap / 7UP / Pepsi Soft Drink', 'Getränke', 'Beverages', 0.69, 3.49, 'je 1,25l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Salakis', 'Salakis Tradition Feta im Holzfass', 'Salakis Tradition Feta in Wooden Barrel', 'Käse', 'Cheese', 1.79, 3.99, 'je 150g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Salakis', 'Salakis Feta Natur', 'Salakis Feta Natural', 'Käse', 'Cheese', 1.49, 2.29, 'je 180g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Marktliebe', 'Marktliebe Snacktomaten-Mix', 'Marktliebe Cherry Tomato Mix', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, 2.29, 'je 300g-Schale', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Meggle', 'Meggle Streichzart', 'Meggle Spreadable Butter', 'Butter', 'Butter', 2.29, 3.99, 'je 400g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Meggle', 'Meggle Streichzart (Penny App)', 'Meggle Spreadable Butter (Penny App)', 'Butter', 'Butter', 1.99, 3.99, 'je 400g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Pita Schiffchen', 'Mitakos Pita Boats', 'Brot & Backwaren', 'Bread & Bakery', 1.69, NULL, 'je 300g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Nussriegel', 'Mitakos Nut Bar', 'Snacks & Nüsse', 'Snacks & Nuts', 0.99, NULL, 'je 2x70g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 4 (PDF p.4): Körperpflege / Health & Beauty – skipped (non-food) ===

-- === PAGE 5 (PDF p.5): Aktuell im Preis gesenkt – non-food skipped ===

-- === PAGE 6 (PDF p.6): Käse, Butter, Getränke ===
('3', 'Rauch', 'Rauch Eistee Berries', 'Rauch Iced Tea Berries', 'Getränke', 'Beverages', 0.79, 0.89, 'je 0,33l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Schogetten', 'Schogetten Schokolade', 'Schogetten Chocolate', 'Süßwaren', 'Sweets', 1.79, 1.99, 'je 100g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Kerrygold', 'Kerrygold Original Irische Butter', 'Kerrygold Original Irish Butter', 'Butter', 'Butter', 3.49, 3.99, 'je 250g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Leerdammer', 'Leerdammer Käsescheiben', 'Leerdammer Cheese Slices', 'Käse', 'Cheese', 2.69, 2.89, 'je 140g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Leerdammer', 'Leerdammer Käsescheiben Caractère', 'Leerdammer Caractère Cheese Slices', 'Käse', 'Cheese', 2.69, 2.89, 'je 125g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Meggle', 'Meggle Kräuterbutter', 'Meggle Herb Butter', 'Butter', 'Butter', 2.19, 2.49, 'je 5x20g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Patros', 'Patros Feta Natur', 'Patros Feta Natural', 'Käse', 'Cheese', 2.99, 3.29, 'je 180g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Patros', 'Patros Feta Leicht', 'Patros Feta Light', 'Käse', 'Cheese', 2.99, 3.29, 'je 150g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Patros', 'Patros Feta Kräuter', 'Patros Feta Herbs', 'Käse', 'Cheese', 2.99, 3.29, 'je 150g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Bergader', 'Bergader Almzeit Cremig-mild', 'Bergader Almzeit Creamy Mild', 'Käse', 'Cheese', 3.99, 4.29, 'je 330g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Bergader', 'Bergader Almzeit Cremig-würzig', 'Bergader Almzeit Creamy Tangy', 'Käse', 'Cheese', 3.99, 4.29, 'je 330g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Bergader', 'Bergader Bavaria blu', 'Bergader Bavaria Blue Cheese', 'Käse', 'Cheese', 3.99, 4.29, 'je 300g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 7 (PDF p.7): Obst & Gemüse ===
('3', 'Penny', 'Orangen', 'Oranges', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, NULL, 'je 2kg-Netz', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Marktliebe', 'Grüne Birnen', 'Green Pears', 'Obst & Gemüse', 'Fruits & Vegetables', 2.22, 2.49, 'je kg', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Marktliebe', 'Zucchini', 'Zucchini', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, NULL, 'je kg', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 8 (PDF p.8): Spargel, Zwiebeln, Pflanzen ===
('3', 'Penny', 'Deutscher weißer Spargel', 'German White Asparagus', 'Obst & Gemüse', 'Fruits & Vegetables', 4.99, NULL, 'je 500g-Bund', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Deutsche Zwiebeln', 'German Onions', 'Obst & Gemüse', 'Fruits & Vegetables', 1.29, NULL, 'je 2kg-Netz', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Deutsche Zwiebeln (Penny App)', 'German Onions (Penny App)', 'Obst & Gemüse', 'Fruits & Vegetables', 1.11, 1.29, 'je 2kg-Netz', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 9 (PDF p.9): Naturgut Bio ===
('3', 'Naturgut', 'Naturgut Deutsche Bio-Äpfel', 'Naturgut Organic German Apples', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, NULL, 'je 1kg-Netz', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Naturgut', 'Naturgut Bio-Bananen', 'Naturgut Organic Bananas', 'Obst & Gemüse', 'Fruits & Vegetables', 1.69, 1.99, 'je kg', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Naturgut', 'Naturgut Bio-Heidelbeeren', 'Naturgut Organic Blueberries', 'Obst & Gemüse', 'Fruits & Vegetables', 1.59, 2.19, 'je 125g-Schale', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Naturgut', 'Naturgut Deutscher Bio-Zuckermais', 'Naturgut Organic German Sweet Corn', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, 2.29, 'je 400g-Packung', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Naturgut', 'Naturgut Deutsche Bio-Kartoffeln', 'Naturgut Organic German Potatoes', 'Obst & Gemüse', 'Fruits & Vegetables', 1.79, NULL, 'je 2kg-Zellulosenetz', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 11 (PDF p.11): Fleisch / Mühlenhof ===
('3', 'Mühlenhof', 'Mühlenhof Regional Frisches halbes Hähnchen', 'Mühlenhof Regional Fresh Half Chicken', 'Fleisch & Wurst', 'Meat & Sausage', 3.79, NULL, 'je 750g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Regional Frisches halbes Hähnchen (Penny App)', 'Mühlenhof Regional Fresh Half Chicken (Penny App)', 'Fleisch & Wurst', 'Meat & Sausage', 3.29, 3.79, 'je 750g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Regional Frische Hähnchen-Brustfilets', 'Mühlenhof Regional Fresh Chicken Breast Fillets', 'Fleisch & Wurst', 'Meat & Sausage', 7.99, NULL, 'je 1000g-Packung', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Frisches Puten-Geschnetzeltes', 'Mühlenhof Fresh Turkey Strips', 'Fleisch & Wurst', 'Meat & Sausage', 6.99, NULL, 'je 800g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Frisches Puten-Geschnetzeltes (Penny App)', 'Mühlenhof Fresh Turkey Strips (Penny App)', 'Fleisch & Wurst', 'Meat & Sausage', 6.49, 6.99, 'je 800g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Frisches Hackfleisch gemischt', 'Mühlenhof Fresh Mixed Minced Meat', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, 'je 800g-Packung', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Frisches Rinder-Gulasch', 'Mühlenhof Fresh Beef Goulash', 'Fleisch & Wurst', 'Meat & Sausage', 11.11, NULL, 'je 800g-Packung', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Frischer Schweinerückenbraten', 'Fresh Pork Back Roast', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, 'je kg', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Tillman''s', 'Tillman''s Schnitzeltaschen Chili Cheese', 'Tillman''s Schnitzel Pockets Chili Cheese', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, NULL, 'je 500g-Packung', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Willms', 'Willms Frische Rinder-Bratwurst Bosporus', 'Willms Fresh Beef Sausage Bosporus', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, NULL, 'je 300g-Packung', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 12 (PDF p.12): Wurst & Aufschnitt ===
('3', 'Berger', 'Berger Gourmet Aufschnitt', 'Berger Gourmet Cold Cuts', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, NULL, 'je 200g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Berger', 'Berger Gourmet Aufschnitt (Penny App)', 'Berger Gourmet Cold Cuts (Penny App)', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.49, 'je 200g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Charly''s Chicken', 'Charly''s Chicken Hähnchen Brustfilet', 'Charly''s Chicken Breast Fillet', 'Fleisch & Wurst', 'Meat & Sausage', 0.99, NULL, 'je 75g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Bille', 'Bille Geflügelsalami', 'Bille Poultry Salami', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, NULL, 'je 100g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'San Fabio', 'San Fabio Salami Spianata', 'San Fabio Salami Spianata', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, 1.99, 'je 100g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof XXL Schinkenbockwurst', 'Mühlenhof XXL Ham Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 4.44, NULL, 'je 800g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Dreistern', 'Dreistern Asiatische Spezialität', 'Dreistern Asian Specialty', 'Fertiggerichte', 'Ready Meals', 2.99, NULL, 'je 400g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rügenwalder', 'Rügenwalder Original Rügenwürmer XXL-Salami-Snack', 'Rügenwalder Original Salami Snack', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, NULL, 'je 100g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Kupfer', 'Kupfer Ofenfleischkäse', 'Kupfer Baked Loaf Cheese', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, 2.89, 'je 220g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Kupfer', 'Kupfer Nürnberger Rostbratwürste', 'Kupfer Nuremberg Bratwurst', 'Fleisch & Wurst', 'Meat & Sausage', 2.29, NULL, 'je 200g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Kupfer', 'Kupfer Hähnchen-Wiener', 'Kupfer Chicken Frankfurters', 'Fleisch & Wurst', 'Meat & Sausage', 6.49, NULL, 'je 800g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 13 (PDF p.13): Käse & Feinkost ===
('3', 'Milram', 'Milram Reibekäse / Käsescheiben', 'Milram Grated / Sliced Cheese', 'Käse', 'Cheese', 1.49, 2.59, 'je 150g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Milram', 'Milram Reibekäse / Käsescheiben (Penny App)', 'Milram Grated / Sliced Cheese (Penny App)', 'Käse', 'Cheese', 1.29, 2.59, 'je 150g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Milkana', 'Milkana Tolle Rolle / Schmelzkäse', 'Milkana Processed Cheese', 'Käse', 'Cheese', 1.99, 2.89, 'je 190g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Hochland', 'Hochland Sandwich- oder Burgerscheiben', 'Hochland Sandwich or Burger Slices', 'Käse', 'Cheese', 1.59, 2.69, 'je 150g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Almette', 'Almette Frischkäsezubereitung (Penny App)', 'Almette Fresh Cheese Spread (Penny App)', 'Käse', 'Cheese', 1.11, 1.99, 'je 150g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Bresso', 'Bresso Frischkäse', 'Bresso Cream Cheese', 'Käse', 'Cheese', 1.39, 2.39, 'je 150g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Zott', 'Zott Bayerntaler Käse', 'Zott Bavarian Cheese', 'Käse', 'Cheese', 1.79, 3.29, 'je 200g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Tzatziki', 'Mitakos Tzatziki', 'Saucen & Gewürze', 'Sauces & Spices', 1.39, 1.65, 'je 500g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Berida', 'Berida Graved Lachs', 'Berida Gravlax Salmon', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.99, NULL, 'je 200g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Homann', 'Homann Beilagensalat', 'Homann Side Salad', 'Fertiggerichte', 'Ready Meals', 1.79, NULL, 'je 400g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 14 (PDF p.14): Tiefkühl, Milch, Dessert ===
('3', 'Frosta', 'Frosta Bami Goreng / Tagliatelle Wildlachs', 'Frosta Bami Goreng / Wild Salmon Tagliatelle', 'Tiefkühl', 'Frozen', 2.99, 4.79, 'je 500g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'McCain', 'McCain Golden Longs / Smiles', 'McCain Golden Longs / Smiles', 'Tiefkühl', 'Frozen', 1.59, 2.99, 'je 450-600g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Wagner', 'Wagner Die Backfrische Hähnchen / Mozzarella', 'Wagner Fresh-Baked Pizza Chicken / Mozzarella', 'Tiefkühl', 'Frozen', 1.99, 3.69, 'je 370-350g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Ben & Jerry''s', 'Ben & Jerry''s Ice Cream', 'Ben & Jerry''s Ice Cream', 'Eiscreme', 'Ice Cream', 3.99, 6.99, 'je 465ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Ben & Jerry''s', 'Ben & Jerry''s Ice Cream (Penny App)', 'Ben & Jerry''s Ice Cream (Penny App)', 'Eiscreme', 'Ice Cream', 3.79, 6.99, 'je 465ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Langnese', 'Langnese Remix Cookie / Family Mix', 'Langnese Remix Cookie / Family Mix Ice Cream', 'Eiscreme', 'Ice Cream', 2.99, 4.49, 'je 260-462ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Berchtesgadener Land', 'Berchtesgadener Land Haltbare Bergbauern Milch', 'Berchtesgadener Land Long-Life Mountain Milk', 'Milchprodukte', 'Dairy', 1.11, 1.49, 'je 1l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Berchtesgadener Land', 'Berchtesgadener Land Haltbare Bergbauern Milch (Penny App)', 'Berchtesgadener Land Long-Life Mountain Milk (Penny App)', 'Milchprodukte', 'Dairy', 0.99, 1.49, 'je 1l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Dr. Oetker', 'Dr. Oetker Götterspeise XXL', 'Dr. Oetker Jelly XXL', 'Süßwaren', 'Sweets', 1.29, 1.69, 'je 500g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Müller', 'Müller Pudding mit Soße', 'Müller Pudding with Sauce', 'Milchprodukte', 'Dairy', 0.99, NULL, 'je 450g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Danone', 'Danone XXXL Actimel', 'Danone XXXL Actimel', 'Milchprodukte', 'Dairy', 3.49, 6.98, 'je 14x100g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 15 (PDF p.15): Penny Ready ===
('3', 'Penny', 'Penny Ready Frischer Blätterteig', 'Penny Ready Fresh Puff Pastry', 'Grundnahrungsmittel', 'Staples', 0.95, NULL, 'je 275g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready Super Smoothie', 'Penny Ready Super Smoothie', 'Getränke', 'Beverages', 1.39, NULL, 'je 250ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready Direktsaft Orange', 'Penny Ready Fresh Orange Juice', 'Getränke', 'Beverages', 2.59, NULL, 'je 1l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready Trinkmahlzeit (Penny App)', 'Penny Ready Meal Drink (Penny App)', 'Getränke', 'Beverages', 1.99, 2.49, 'je 500ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready Kaffeespezialität (Penny App)', 'Penny Ready Coffee Specialty (Penny App)', 'Kaffee & Tee', 'Coffee & Tea', 0.55, 0.75, 'je 250ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready Baguette', 'Penny Ready Baguette', 'Brot & Backwaren', 'Bread & Bakery', 0.99, NULL, 'je 175g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready Pizzateig', 'Penny Ready Pizza Dough', 'Brot & Backwaren', 'Bread & Bakery', 1.99, NULL, 'je 600g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 16 (PDF p.16): Penny Ready Fertiggerichte ===
('3', 'Penny', 'Penny Ready Snackbox', 'Penny Ready Snack Box', 'Fertiggerichte', 'Ready Meals', 1.69, NULL, 'je 175g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready Beilagensalat', 'Penny Ready Side Salad', 'Fertiggerichte', 'Ready Meals', 1.49, NULL, 'je 400g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready Frikadellen Bällchen', 'Penny Ready Meatballs', 'Fertiggerichte', 'Ready Meals', 2.79, NULL, 'je 500g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready Onigiri (Penny App)', 'Penny Ready Onigiri (Penny App)', 'Fertiggerichte', 'Ready Meals', 1.59, 1.99, 'je 100g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready Rinderburger', 'Penny Ready Beef Burger', 'Fertiggerichte', 'Ready Meals', 2.79, NULL, 'je 2x160g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready Sandwich', 'Penny Ready Sandwich', 'Fertiggerichte', 'Ready Meals', 1.99, NULL, 'je 185g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready Wraps (Penny App)', 'Penny Ready Wraps (Penny App)', 'Fertiggerichte', 'Ready Meals', 1.59, 1.99, 'je 190g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready Tortelloni', 'Penny Ready Tortelloni', 'Nudeln & Reis', 'Pasta & Rice', 1.89, NULL, 'je 400g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Penny', 'Penny Ready XXL-Lasagne', 'Penny Ready XXL Lasagne', 'Fertiggerichte', 'Ready Meals', 3.99, NULL, 'je 1kg', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 17 (PDF p.17): RIOS Eis ===
('3', 'Rios', 'Rios Nuss-Nougat Eis (Penny App)', 'Rios Nougat Ice Cream (Penny App)', 'Eiscreme', 'Ice Cream', 2.99, 3.49, 'je 470ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios High Protein Eis (Penny App)', 'Rios High Protein Ice Cream (Penny App)', 'Eiscreme', 'Ice Cream', 2.49, 2.99, 'je 500ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios Eis Bourbon Vanille', 'Rios Bourbon Vanilla Ice Cream', 'Eiscreme', 'Ice Cream', 3.29, NULL, 'je 2500ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios American Ice Cream (Penny App)', 'Rios American Ice Cream (Penny App)', 'Eiscreme', 'Ice Cream', 2.29, 2.79, 'je 500ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios Delizioso Eis', 'Rios Delizioso Ice Cream', 'Eiscreme', 'Ice Cream', 1.99, NULL, 'je 900ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios Grandioso Eis', 'Rios Grandioso Ice Cream', 'Eiscreme', 'Ice Cream', 1.89, NULL, 'je 1000ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios Stieleis', 'Rios Ice Lollies', 'Eiscreme', 'Ice Cream', 2.79, NULL, 'je 3x80ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 18 (PDF p.18): RIOS Eis (Fortsetzung) ===
('3', 'Rios', 'Rios Gigant Mini Quartett / Mini Fruits', 'Rios Gigant Mini Ice Cream', 'Eiscreme', 'Ice Cream', 2.99, NULL, 'je 12x50ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios Spaghetti-Eis', 'Rios Spaghetti Ice Cream Cups', 'Eiscreme', 'Ice Cream', 1.79, NULL, 'je 3x170ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios Eis im Becher (Penny App)', 'Rios Cup Ice Cream (Penny App)', 'Eiscreme', 'Ice Cream', 1.89, 2.29, 'je 3x170ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios Gigant Mini Mandel', 'Rios Gigant Mini Almond Ice Cream', 'Eiscreme', 'Ice Cream', 2.99, NULL, 'je 12x50ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios Gigant Versch. Sorten', 'Rios Gigant Ice Cream Various', 'Eiscreme', 'Ice Cream', 2.99, NULL, 'je 6x100ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios Waffelhörnchen', 'Rios Waffle Cones', 'Eiscreme', 'Ice Cream', 1.99, NULL, 'je 6x120ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios Sandwich Classic', 'Rios Classic Ice Cream Sandwich', 'Eiscreme', 'Ice Cream', 1.99, NULL, 'je 8x90ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios Sandwich Fürst Pückler Art', 'Rios Fürst Pückler Style Ice Cream Sandwich', 'Eiscreme', 'Ice Cream', 1.99, NULL, 'je 8x90ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rios', 'Rios Sandwich Haselnuss mit Buona Crema', 'Rios Hazelnut Ice Cream Sandwich', 'Eiscreme', 'Ice Cream', 2.19, NULL, 'je 6x90ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 19 (PDF p.19): Kaffee, Brotaufstrich, Cerealien ===
('3', 'Dallmayr', 'Dallmayr Classic Kaffee gemahlen', 'Dallmayr Classic Ground Coffee', 'Kaffee & Tee', 'Coffee & Tea', 6.99, 9.79, 'je 500g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Jacobs', 'Jacobs Barista Editions Origins', 'Jacobs Barista Editions Origins Coffee Beans', 'Kaffee & Tee', 'Coffee & Tea', 13.99, 21.99, 'je 1000g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Jacobs', 'Jacobs Barista Editions (Penny App)', 'Jacobs Barista Editions (Penny App)', 'Kaffee & Tee', 'Coffee & Tea', 12.99, 21.99, 'je 1000g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Nescafé', 'Nescafé Dolce Gusto Cappuccino', 'Nescafé Dolce Gusto Cappuccino', 'Kaffee & Tee', 'Coffee & Tea', 6.99, 10.59, 'je 349,5g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Thomy', 'Thomy Aufstrich Fürs Brot', 'Thomy Bread Spread', 'Brotaufstrich', 'Spreads', 1.79, NULL, 'je 180g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Ovomaltine', 'Ovomaltine Crunchy Cream', 'Ovomaltine Crunchy Cream', 'Brotaufstrich', 'Spreads', 3.49, 4.49, 'je 380g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Nesquik', 'Nesquik Milchdrink XXL', 'Nesquik Milk Drink XXL', 'Getränke', 'Beverages', 5.49, NULL, 'je 1000g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Kölln', 'Kölln Haferfleks', 'Kölln Oat Flakes', 'Frühstück & Cerealien', 'Breakfast & Cereal', 1.99, 2.99, 'je 375g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Corny', 'Corny Haferkraft', 'Corny Oat Bar', 'Frühstück & Cerealien', 'Breakfast & Cereal', 1.79, 2.39, 'je 4x35g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Storck', 'Storck Knoppers Riegel', 'Storck Knoppers Bar', 'Süßwaren', 'Sweets', 1.69, 2.49, 'je 5x40g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 20 (PDF p.20): Fertiggerichte, Nudeln, Saucen, Backwaren ===
('3', 'Sonnen Bassermann', 'Sonnen Bassermann Eintopf', 'Sonnen Bassermann Stew', 'Fertiggerichte', 'Ready Meals', 1.79, 2.99, 'je 800g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Ben''s Original', 'Ben''s Original Sauce', 'Ben''s Original Sauce', 'Saucen & Gewürze', 'Sauces & Spices', 2.49, NULL, 'je 675g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Ben''s Original', 'Ben''s Original Expressreis', 'Ben''s Original Express Rice', 'Nudeln & Reis', 'Pasta & Rice', 1.39, NULL, 'je 220g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Ben''s Original', 'Ben''s Original Expressreis (Penny App)', 'Ben''s Original Express Rice (Penny App)', 'Nudeln & Reis', 'Pasta & Rice', 1.29, 1.39, 'je 220g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Bernbacher', 'Bernbacher Nudelsauce Bolognaise', 'Bernbacher Bolognese Pasta Sauce', 'Saucen & Gewürze', 'Sauces & Spices', 1.49, 1.99, 'je 170ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Bernbacher', 'Bernbacher Die Guten Nudeln XL', 'Bernbacher The Good Pasta XL', 'Nudeln & Reis', 'Pasta & Rice', 1.69, 2.49, 'je 750g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Maggi', 'Maggi Gemüse Brühe', 'Maggi Vegetable Broth', 'Saucen & Gewürze', 'Sauces & Spices', 2.80, NULL, 'je 18l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Bonduelle', 'Bonduelle Erbsen & Möhrchen / Goldmais', 'Bonduelle Peas & Carrots / Sweetcorn', 'Grundnahrungsmittel', 'Staples', 2.79, NULL, 'je 4x150g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Saupiquet', 'Saupiquet Thunfisch-Salat', 'Saupiquet Tuna Salad', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.29, NULL, 'je Dose', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Oro di Parma', 'Oro di Parma Tomatenmark', 'Oro di Parma Tomato Paste', 'Saucen & Gewürze', 'Sauces & Spices', 1.29, 1.99, 'je 200g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Bäckerkrönung', 'Bäckerkrönung 4 kleine Kuchen', 'Bäckerkrönung 4 Small Cakes', 'Süßwaren', 'Sweets', 1.69, NULL, 'je 172-140g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Ölz', 'Ölz Rosinen Brötchen / Nuss Strudel', 'Ölz Raisin Rolls / Nut Strudel', 'Brot & Backwaren', 'Bread & Bakery', 1.99, NULL, 'je 250-350g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Dr. Oetker', 'Dr. Oetker Sahnesteif / Tortenguss', 'Dr. Oetker Whipped Cream Stabilizer / Cake Glaze', 'Grundnahrungsmittel', 'Staples', 0.69, 0.99, 'je 50g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 21 (PDF p.21): Süßwaren ===
('3', 'Nestlé', 'Nestlé Choclait Chips / Choco Crossies', 'Nestlé Choclait Chips / Choco Crossies', 'Süßwaren', 'Sweets', 1.69, 3.79, 'je 115-150g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Milka', 'Milka Pralinen (Penny App)', 'Milka Pralines (Penny App)', 'Süßwaren', 'Sweets', 1.79, 3.49, 'je 110g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Storck', 'Storck Toffifee', 'Storck Toffifee', 'Süßwaren', 'Sweets', 3.79, 4.69, 'je 400g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Ferrero', 'Ferrero Kinder Schokobons', 'Ferrero Kinder Schoko-Bons', 'Süßwaren', 'Sweets', 4.49, 4.99, 'je 300g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Ferrero', 'Ferrero Duplo Big Pack / Kinder Riegel Big Pack', 'Ferrero Duplo Big Pack / Kinder Bar Big Pack', 'Süßwaren', 'Sweets', 4.44, 5.39, 'je 20x18g / je 20x21g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Nestlé', 'Nestlé Lion / KitKat', 'Nestlé Lion / KitKat', 'Süßwaren', 'Sweets', 1.79, 3.19, 'je 5x30g / je 4x41,5g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Trolli', 'Trolli Fruchtgummi (Penny App)', 'Trolli Fruit Gummies (Penny App)', 'Süßwaren', 'Sweets', 1.49, 1.79, 'je 550g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Haribo', 'Haribo Spaghetti / Balla Stixx', 'Haribo Spaghetti / Balla Stixx', 'Süßwaren', 'Sweets', 1.29, NULL, 'je 200-175g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Funny-Frisch', 'Funny-Frisch Linsen Chips', 'Funny-Frisch Lentil Chips', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, 1.99, 'je 90g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Lorenz', 'Lorenz Naturals', 'Lorenz Naturals Crisps', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, 2.19, 'je 95g', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 22 (PDF p.22): Alkoholische Getränke, Mineralwasser ===
('3', 'Three Sixty', 'Three Sixty Vodka', 'Three Sixty Vodka', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, 13.99, 'je 0,7l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Light Live / Faber', 'Light Live / Faber Sekt alkoholfrei', 'Light Live / Faber Non-Alcoholic Sparkling Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.79, 3.79, 'je 0,75l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Gerstacker', 'Gerstacker Sprizz / Erdbeer-Sprizz', 'Gerstacker Spritzer / Strawberry Spritzer', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.79, NULL, 'je 0,75l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Bitburger', 'Bitburger Premium Pils', 'Bitburger Premium Pils', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.33, 5.79, 'je 6x0,5l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Aperol', 'Aperol Spritz', 'Aperol Spritz', 'Alkoholische Getränke', 'Alcoholic Beverages', 6.99, 8.99, 'je 3x0,2l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rotkäppchen', 'Rotkäppchen Fruchtsecco', 'Rotkäppchen Fruit Secco', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.44, 4.99, 'je 4x0,2l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rotkäppchen', 'Rotkäppchen Fruchtsecco (Penny App)', 'Rotkäppchen Fruit Secco (Penny App)', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.99, 4.99, 'je 4x0,2l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mönchshof', 'Mönchshof Premium Lager', 'Mönchshof Premium Lager', 'Alkoholische Getränke', 'Alcoholic Beverages', 12.99, 17.99, 'je 20x0,5l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Beck''s', 'Beck''s Pils (Penny App)', 'Beck''s Pils (Penny App)', 'Alkoholische Getränke', 'Alcoholic Beverages', 0.69, 1.09, 'je 568ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'König', 'König Pilsener', 'König Pilsener', 'Alkoholische Getränke', 'Alcoholic Beverages', 0.79, 0.99, 'je 568ml', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Monster', 'Monster Energy Drink', 'Monster Energy Drink', 'Getränke', 'Beverages', 7.99, NULL, 'je 10x0,5l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Adelholzener', 'Adelholzener Mineralwasser', 'Adelholzener Mineral Water', 'Getränke', 'Beverages', 5.49, 6.49, 'je 12x0,75l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Granini', 'Granini Mix-it / Trinkgenuss', 'Granini Mix-it / Drinking Pleasure', 'Getränke', 'Beverages', 1.69, 2.69, 'je 0,75-1l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Gerolsteiner', 'Gerolsteiner Apfelschorle / Limo', 'Gerolsteiner Apple Spritzer / Lemonade', 'Getränke', 'Beverages', 0.99, 1.79, 'je 0,75l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Capri-Sun', 'Capri-Sun Sirup (Penny App)', 'Capri-Sun Syrup (Penny App)', 'Getränke', 'Beverages', 1.99, 2.99, 'je 0,6l', '2026-04-13', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 31 (PDF p.31): Naturgut Gartenerde – non-food, skipped food items only ===
-- (Naturgut Bio Tomaten- und Gemüseerde and Floraline Gemüsedünger are garden products, skipped)

-- === PAGE 32 (PDF p.32): Pflanzen – skipped (non-food) ===

-- === PAGE 33 (PDF p.33): Do, 16.4.–Sa, 18.4. – Obst, Fleisch ===
('3', 'Marktliebe', 'Honigmelone', 'Honeydew Melon', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, NULL, 'je kg', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Marktliebe', 'Gurke', 'Cucumber', 'Obst & Gemüse', 'Fruits & Vegetables', 0.49, 0.69, 'je Stück', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Frische Schweine-Schnitzel', 'Mühlenhof Fresh Pork Schnitzel', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, 'je 800g-Packung', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mühlenhof', 'Mühlenhof Frische Chicken-Wings', 'Mühlenhof Fresh Chicken Wings', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, NULL, 'je 1000g-Packung', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Gutfried', 'Gutfried Geflügel-Fleischwurst', 'Gutfried Poultry Sausage', 'Fleisch & Wurst', 'Meat & Sausage', 2.79, NULL, 'je 350g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Kupfer', 'Kupfer Münchner Weißwurst / Schlemmerbraten', 'Kupfer Munich White Sausage / Roast', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, 'je 180-150g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Gustoland', 'Gustoland Prosciutto Cotto', 'Gustoland Cooked Ham', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, NULL, 'je 150g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 34 (PDF p.34): Do 16.4.–Sa 18.4. – Eis, Milchprodukte, Käse ===
('3', 'Doygan', 'Doygan Plombir Eiscreme', 'Doygan Plombir Ice Cream', 'Eiscreme', 'Ice Cream', 2.79, 3.99, 'je 6x120ml', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Oatly', 'Oatly Matcha Oat Drink', 'Oatly Matcha Oat Drink', 'Milchprodukte', 'Dairy', 2.49, NULL, 'je 1l', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Danone', 'Danone Fruchtzwerge XXL', 'Danone Fruity Dwarfs XXL', 'Milchprodukte', 'Dairy', 2.89, 4.78, 'je 6x100g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Dr. Oetker', 'Dr. Oetker Milchreis / Sahnepudding', 'Dr. Oetker Rice Pudding / Cream Pudding', 'Milchprodukte', 'Dairy', 1.99, NULL, 'je 400-500g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Kühlmann', 'Kühlmann Hummus Trio', 'Kühlmann Hummus Trio', 'Grundnahrungsmittel', 'Staples', 1.99, NULL, 'je 210g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Rougette', 'Rougette Grillkäse', 'Rougette Grilling Cheese', 'Käse', 'Cheese', 2.49, 3.79, 'je 180g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Bergader', 'Bergader Bavaria blu / Almzeit', 'Bergader Bavaria Blue / Almzeit Cheese', 'Käse', 'Cheese', 1.79, 1.99, 'je 150g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Burgis', 'Burgis Bayerischer Knödelteig', 'Burgis Bavarian Dumpling Dough', 'Grundnahrungsmittel', 'Staples', 1.49, 2.19, 'je 750g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Settele', 'Settele Teigwarenspezialität / Kässpätzle', 'Settele Pasta Specialty / Cheese Spaetzle', 'Nudeln & Reis', 'Pasta & Rice', 2.49, 2.99, 'je 400g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Settele', 'Settele Kässpätzle (Penny App)', 'Settele Cheese Spaetzle (Penny App)', 'Nudeln & Reis', 'Pasta & Rice', 1.99, 2.99, 'je 400g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 35 (PDF p.35): Mitakos Griechisch ===
('3', 'Mitakos', 'Mitakos Joghurt nach griechischer Art', 'Mitakos Greek Style Yoghurt', 'Milchprodukte', 'Dairy', 1.39, NULL, 'je 4x150g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Cremiger Hirtenkäse', 'Mitakos Creamy Shepherd Cheese', 'Käse', 'Cheese', 1.99, NULL, 'je 175g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Schafskäsedip', 'Mitakos Sheep Cheese Dip', 'Käse', 'Cheese', 1.49, NULL, 'je 175ml', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Griechischer Frischkäse', 'Mitakos Greek Fresh Cheese', 'Käse', 'Cheese', 1.59, NULL, 'je 100g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Feta Twin-Pack', 'Mitakos Feta Twin Pack', 'Käse', 'Cheese', 2.99, NULL, 'je 2x125g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Frische Bifteki', 'Mitakos Fresh Bifteki', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, NULL, 'je 315g-Packung', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Frikadellenbällchen', 'Mitakos Meatballs', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, NULL, 'je 325g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 36 (PDF p.36): Mitakos Tiefkühl ===
('3', 'Mitakos', 'Mitakos Hähnchengyrос', 'Mitakos Chicken Gyros', 'Tiefkühl', 'Frozen', 5.99, 7.45, 'je 750g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Blätterteigschnecke', 'Mitakos Puff Pastry Snail', 'Tiefkühl', 'Frozen', 3.79, NULL, 'je 1000g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Greek Style Pizza', 'Mitakos Greek Style Pizza', 'Tiefkühl', 'Frozen', 2.99, NULL, 'je 455g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Knusprige Filo Taschen', 'Mitakos Crispy Filo Pockets', 'Tiefkühl', 'Frozen', 2.79, NULL, 'je 300g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Mini Saganaki', 'Mitakos Mini Saganaki', 'Tiefkühl', 'Frozen', 2.49, NULL, 'je 250g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Schalengericht', 'Mitakos Baked Dish', 'Tiefkühl', 'Frozen', 1.99, NULL, 'je 300g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Börekschnecke', 'Mitakos Börek Snail', 'Tiefkühl', 'Frozen', 0.99, NULL, 'je Stück', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Pita Schiffchen', 'Mitakos Pita Boats', 'Tiefkühl', 'Frozen', 1.69, NULL, 'je 300g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Kritharaki XXL', 'Mitakos Kritharaki XXL Pasta', 'Nudeln & Reis', 'Pasta & Rice', 1.29, NULL, 'je 750g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 37 (PDF p.37): Mitakos Griechische Spezialitäten ===
('3', 'Mitakos', 'Mitakos Kalamata Oliven-Snack', 'Mitakos Kalamata Olive Snack', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, NULL, 'je 150g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Kichererbsen / Grüne Bohnen', 'Mitakos Chickpeas / Green Beans', 'Grundnahrungsmittel', 'Staples', 1.69, NULL, 'je 280g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Gefüllte Oliven', 'Mitakos Stuffed Olives', 'Grundnahrungsmittel', 'Staples', 1.99, NULL, 'je 370g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Riesenoliven ohne Stein', 'Mitakos Giant Pitted Olives', 'Grundnahrungsmittel', 'Staples', 5.99, NULL, 'je 1650g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Eintopf / Linseneintopf', 'Mitakos Bean Stew / Lentil Stew', 'Fertiggerichte', 'Ready Meals', 1.29, NULL, 'je 400g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Gyrossuppe / Biftekitopf', 'Mitakos Gyros Soup / Bifteki Pot', 'Fertiggerichte', 'Ready Meals', 2.99, NULL, 'je 800g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 38 (PDF p.38): Mitakos Gewürze, Öle, Snacks ===
('3', 'Mitakos', 'Mitakos Gewürzmischung Tzatziki / Gyros', 'Mitakos Seasoning Mix Tzatziki / Gyros', 'Saucen & Gewürze', 'Sauces & Spices', 1.59, NULL, 'je 60-65g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Grillsauce', 'Mitakos Grill Sauce', 'Saucen & Gewürze', 'Sauces & Spices', 1.49, NULL, 'je 250ml', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Nussriegel', 'Mitakos Nut Bar', 'Snacks & Nüsse', 'Snacks & Nuts', 0.99, NULL, 'je 2x70g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Halva', 'Mitakos Halva', 'Süßwaren', 'Sweets', 1.99, NULL, 'je 250g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Pita Cracker', 'Mitakos Pita Cracker', 'Snacks & Nüsse', 'Snacks & Nuts', 1.39, NULL, 'je 90g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Kesselchips', 'Mitakos Kettle Chips', 'Snacks & Nüsse', 'Snacks & Nuts', 1.39, NULL, 'je 150g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Natives Olivenöl extra', 'Mitakos Extra Virgin Olive Oil', 'Öle & Essig', 'Oils & Vinegar', 6.49, NULL, 'je 500ml', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Mitakos', 'Mitakos Linsen / Weiße Bohnen', 'Mitakos Lentils / White Beans', 'Grundnahrungsmittel', 'Staples', 1.49, NULL, 'je 500g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 39 (PDF p.39): Do 16.4.–Sa 18.4. – Kaffee, Süßes ===
('3', 'Jacobs', 'Jacobs Kaffeekapseln Origins Colombia / Guten Morgen XL', 'Jacobs Coffee Capsules', 'Kaffee & Tee', 'Coffee & Tea', 4.44, 5.99, 'je 93,6-114g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Jacobs', 'Jacobs Instantkaffee', 'Jacobs Instant Coffee', 'Kaffee & Tee', 'Coffee & Tea', 6.99, 10.99, 'je 200g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Dallmayr', 'Dallmayr Kaffeepads Crema d''Oro / Classic', 'Dallmayr Coffee Pads', 'Kaffee & Tee', 'Coffee & Tea', 2.22, 3.29, 'je 112-124g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Lotus', 'Lotus Biscoff', 'Lotus Biscoff Biscuits', 'Süßwaren', 'Sweets', 1.99, NULL, 'je 18x15,5g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Balconi', 'Balconi Plume Cake Schoko / Yoghurt', 'Balconi Plume Cake Chocolate / Yoghurt', 'Süßwaren', 'Sweets', 1.69, NULL, 'je 258-220g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Oreo / Mikado', 'Oreo Doppelkekse / Mikado Sticks', 'Oreo Double Cookies / Mikado Sticks', 'Süßwaren', 'Sweets', 1.29, 1.99, 'je 4x44g / je 75g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Werther''s Original', 'Werther''s Original Caramel Popcorn', 'Werther''s Original Caramel Popcorn', 'Snacks & Nüsse', 'Snacks & Nuts', 1.79, 2.39, 'je 140g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Pom-Bär', 'Pom-Bär Crizzlies', 'Pom-Bär Crizzlies', 'Snacks & Nüsse', 'Snacks & Nuts', 1.99, 2.79, 'je 155g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Dr. Karg''s', 'Dr. Karg''s Knäckebrot Tomate & Mozzarella / Protein Pita-Style', 'Dr. Karg''s Crispbread Tomato & Mozzarella / Protein', 'Snacks & Nüsse', 'Snacks & Nuts', 1.89, 2.79, 'je 150-200g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 40 (PDF p.40): Do 16.4.–Sa 18.4. – Getränke, Wein, Pasta, Tierbedarf ===
('3', 'Comet', 'Comet Limo / Cola / Mocktail', 'Comet Lemonade / Cola / Mocktail', 'Getränke', 'Beverages', 0.29, NULL, 'je 0,33l', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Lipton', 'Lipton Ice Tea', 'Lipton Iced Tea', 'Getränke', 'Beverages', 0.79, 0.99, 'je 0,33l', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Adelholzener', 'Adelholzener Sport', 'Adelholzener Sport Water', 'Getränke', 'Beverages', 0.59, 0.79, 'je 0,5l', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Blanchet', 'Blanchet Frankreich Wein', 'Blanchet French Wine', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.49, 3.99, 'je 0,75l', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Delverde', 'Delverde Pasta', 'Delverde Pasta', 'Nudeln & Reis', 'Pasta & Rice', 1.59, 3.58, 'je 1000g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Purina One', 'Purina One Bifensis Adult', 'Purina One Bifensis Adult Cat Food', 'Tierbedarf', 'Pet Supplies', 2.99, NULL, 'je 750g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Whiskas / Sheba', 'Whiskas Tasty Mix / Sheba Delikatesse in Gelee', 'Whiskas Tasty Mix / Sheba Delicacy in Jelly', 'Tierbedarf', 'Pet Supplies', 15.99, 16.49, 'je 40-60x85g', '2026-04-16', '2026-04-18', true, 'https://www.penny.de'),

-- === PAGE 41 (PDF p.41): FRSAMSTAG – Fr, 17.4. bis Sa, 18.4. ===
('3', 'Mike Mitchell''s', 'Mike Mitchell''s American Sandwich', 'Mike Mitchell''s American Sandwich Bread', 'Brot & Backwaren', 'Bread & Bakery', 0.99, 1.09, 'je 750g', '2026-04-17', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Müller', 'Müller Reine Buttermilch', 'Müller Pure Buttermilk', 'Milchprodukte', 'Dairy', 0.59, 0.99, 'je 500g', '2026-04-17', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Iglo', 'Iglo 13 Backfisch-Stäbchen / 15 Fischstäbchen', 'Iglo Fish Fingers', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.79, 4.89, 'je 564-450g', '2026-04-17', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Iglo', 'Iglo Fischstäbchen (Penny App)', 'Iglo Fish Fingers (Penny App)', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.22, 4.89, 'je 564g', '2026-04-17', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Zott', 'Zott Sahne Joghurt', 'Zott Cream Yoghurt', 'Milchprodukte', 'Dairy', 0.44, 0.99, 'je 140g', '2026-04-17', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Zott', 'Zott Sahne Joghurt (Penny App)', 'Zott Cream Yoghurt (Penny App)', 'Milchprodukte', 'Dairy', 0.39, 0.99, 'je 140g', '2026-04-17', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Lenor', 'Lenor Weichspüler', 'Lenor Fabric Softener', 'Haushalt', 'Household', 2.19, 2.99, 'je 798ml', '2026-04-17', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Lenor', 'Lenor Weichspüler (Penny App)', 'Lenor Fabric Softener (Penny App)', 'Haushalt', 'Household', 1.99, 2.99, 'je 798ml', '2026-04-17', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Three Sixty', 'Three Sixty Pornstar Martini / Vodka Energy', 'Three Sixty Pornstar Martini / Vodka Energy', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.99, 2.69, 'je 0,25-0,33l', '2026-04-17', '2026-04-18', true, 'https://www.penny.de'),
('3', 'Three Sixty', 'Three Sixty Pornstar Martini / Vodka Energy (Penny App)', 'Three Sixty Pornstar Martini / Vodka Energy (Penny App)', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.79, 2.69, 'je 0,25-0,33l', '2026-04-17', '2026-04-18', true, 'https://www.penny.de');
