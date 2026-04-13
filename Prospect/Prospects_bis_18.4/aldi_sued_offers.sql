DELETE FROM public.offers WHERE store_id = '2' AND is_offer = true;

INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2: Titelseite / Übersicht ===
('2', 'Meine Backwelt', 'Franzbrötchen', 'Franzbrötchen (cinnamon pastry)', 'Brot & Backwaren', 'Bread & Bakery', 0.39, 0.79, 'je Stück', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 5: Obst & Gemüse – Tiefpreis-Versprechen ===
('2', 'ALDI', 'Heidelbeeren Kl. I', 'Blueberries Class I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.69, NULL, '150-g-Schale', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'ALDI', 'Champignons weiß Kl. I', 'White Mushrooms Class I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.35, 1.99, '400-g-Schale', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'ALDI', 'Ananas lose Kl. I', 'Pineapple loose Class I', 'Obst & Gemüse', 'Fruits & Vegetables', 1.15, 1.49, 'Stück', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'ALDI', 'Bunter Salat mit Wurzelballen', 'Mixed Salad with root ball', 'Obst & Gemüse', 'Fruits & Vegetables', 1.11, NULL, 'Stück', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 6: Obst & Gemüse ===
('2', 'Kleine Schätze', 'Erdbeeren Kl. I', 'Strawberries Class I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, NULL, '400-g-Schale', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'ALDI', 'Orangen Kl. I', 'Oranges Class I', 'Obst & Gemüse', 'Fruits & Vegetables', 2.49, NULL, '2-kg-Netz', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 7: Fleisch & Fisch ===
('2', 'BIO', 'Bio-Hackfleisch vom Rind', 'Organic Minced Beef', 'Fleisch & Wurst', 'Meat & Sausage', 4.79, 6.49, '400g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Meine Metzgerei', 'Hähnchen-Geschnetzeltes', 'Chicken Strips', 'Fleisch & Wurst', 'Meat & Sausage', 3.79, 4.99, '400g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Meine Metzgerei', 'Minutensteaks vom Schwein', 'Pork Minute Steaks', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, 3.19, '400g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Meine Metzgerei', 'Hüftsteak vom Rind', 'Beef Rump Steak', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, 5.72, 'versch. Gewichte', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'BBQ', 'Hähnchen-Filetspieße versch. Sorten', 'Chicken Fillet Skewers various sorts', 'Fleisch & Wurst', 'Meat & Sausage', 4.29, 5.29, '400g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'BBQ', 'Marinierte Nackensteaks vom Schwein versch. Sorten', 'Marinated Pork Neck Steaks various sorts', 'Fleisch & Wurst', 'Meat & Sausage', 3.99, 4.79, '600g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Golden Seafood', 'Lachsfiletportion mit Haut', 'Salmon Fillet Portion with Skin', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 4.49, 5.79, '300g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Meine Metzgerei', 'Hähnchen-Innenfilets XXL', 'Chicken Inner Fillets XXL', 'Fleisch & Wurst', 'Meat & Sausage', 6.88, 8.99, '800g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 8: Kühlwaren / Tiefkühl / Süßwaren ===
('2', 'Bauer', 'Der Große Bauer Joghurt versch. Sorten', 'Bauer Big Yoghurt various sorts', 'Milchprodukte', 'Dairy', 0.49, 0.99, '250-g-Becher', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Patros', 'Feta- oder Hirtenkäse versch. Sorten', 'Feta or Shepherd''s Cheese various sorts', 'Käse', 'Cheese', 1.79, 3.29, '150-180g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Brunch', 'Brotaufstrich versch. Sorten', 'Bread Spread various sorts', 'Brotaufstrich', 'Spreads', 1.29, 1.89, '185g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Milka', 'Schokolade versch. Sorten', 'Chocolate various sorts', 'Süßwaren', 'Sweets', 0.99, NULL, '87-100g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Original Wagner', 'Steinofen-Pizza oder Piccolinis versch. Sorten', 'Stone Oven Pizza or Piccolinis various sorts', 'Tiefkühl', 'Frozen', 1.99, 3.49, '270-350g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Langnese', 'Magnum-Minis oder -Stieleis versch. Sorten', 'Magnum Minis or Ice Lollies various sorts', 'Eiscreme', 'Ice Cream', 2.49, 4.49, '255-330ml', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Storck', 'nimm2 Lachgummi versch. Sorten', 'nimm2 Lachgummi various sorts', 'Süßwaren', 'Sweets', 0.99, 1.29, '225-325g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Storck', 'Knoppers 8x25g', 'Knoppers 8x25g', 'Süßwaren', 'Sweets', 1.49, 2.49, '200g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 9: Dein Wocheneinkauf / Backwelt / Milchprodukte ===
('2', 'Gut Drei Eichen/Güldenhof', 'Buffet-Koch-Hinterschinken oder Puten-Kochschinken', 'Cooked Ham or Turkey Ham', 'Fleisch & Wurst', 'Meat & Sausage', 1.59, 1.99, '150g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Meine Backwelt', 'Franzbrötchen', 'Franzbrötchen (cinnamon pastry)', 'Brot & Backwaren', 'Bread & Bakery', 0.39, 0.79, 'je Stück', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Meine Backwelt', 'Sonnenblumenkrüstchen', 'Sunflower Seed Bun', 'Brot & Backwaren', 'Bread & Bakery', 0.29, 0.49, 'je Stück', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Milsani', 'Fettarmer Joghurt versch. Sorten', 'Low-fat Yoghurt various sorts', 'Milchprodukte', 'Dairy', 0.49, 0.79, '500-g-Becher', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Milsani', 'Joghurt 3,5% Fett', 'Yoghurt 3.5% fat', 'Milchprodukte', 'Dairy', 0.59, 0.89, '500-g-Becher', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Milsani', 'Schmand 24% Fett', 'Sour Cream 24% fat', 'Milchprodukte', 'Dairy', 0.59, 0.79, '200-g-Becher', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Milsani', 'Emmentaler', 'Emmental Cheese', 'Käse', 'Cheese', 2.99, 3.79, '400g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 10: Fisch / Tiefkühl / Feinkost / Öl / Bio ===
('2', 'Praktisch Fertig', 'Asiatisches Gericht versch. Sorten', 'Asian Ready Meal various sorts', 'Fertiggerichte', 'Ready Meals', 2.19, 2.99, '400g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Golden Seafood', 'Fischstäbchen', 'Fish Fingers', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.79, 2.49, '450g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'All Seasons', 'Rahm-Spinat mit Sahne mild gewürzt', 'Creamed Spinach mildly seasoned', 'Tiefkühl', 'Frozen', 0.69, 0.89, '450g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Speise Zeit', 'Linseneintopf versch. Sorten 2-für-1', 'Lentil Stew various sorts 2-for-1', 'Fertiggerichte', 'Ready Meals', 2.89, 3.78, '2x800g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Gut Drei Eichen', 'Bayerischer Leberkäs versch. Sorten', 'Bavarian Meatloaf various sorts', 'Fleisch & Wurst', 'Meat & Sausage', 2.79, 3.49, '350-400g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Lyttos', 'Griechisches natives Olivenöl extra', 'Greek Extra Virgin Olive Oil', 'Öle & Essig', 'Oils & Vinegar', 4.79, 5.99, '500ml', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Nur Nur Natur', 'Bio-Sauerkonserven versch. Sorten', 'Organic Pickled Vegetables various sorts', 'Grundnahrungsmittel', 'Staples', 0.79, 0.99, '320-330g-Glas', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Nur Nur Natur', 'Bio-Fruchtmus versch. Sorten', 'Organic Fruit Puree various sorts', 'Grundnahrungsmittel', 'Staples', 0.89, 1.15, '360-g-Glas', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 11: Marken & Eigenmarken / Getränke / Süßwaren ===
('2', 'Choceur', 'Gelee-Bananen oder Pfefferminz-Taler', 'Jelly Bananas or Peppermint Coins', 'Süßwaren', 'Sweets', 1.19, 1.79, '250g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Meine Kuchen Welt', 'Mini-Donuts versch. Sorten', 'Mini Donuts various sorts', 'Süßwaren', 'Sweets', 1.49, 1.99, '9 Stück / 153-162g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Biscotto', 'Feine Butterwaffeln', 'Fine Butter Waffles', 'Süßwaren', 'Sweets', 1.49, 1.79, '6x40g = 240g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Rio d''Oro', 'Multivitaminsaft versch. Sorten', 'Multivitamin Juice various sorts', 'Getränke', 'Beverages', 1.11, 1.39, '1-l-Flasche', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Cucina', 'Grissotti versch. Sorten', 'Grissini Breadsticks various sorts', 'Snacks & Nüsse', 'Snacks & Nuts', 0.99, 1.29, '200g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Müller-Thurgau', 'QbA Weißwein trocken', 'QbA White Wine dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.79, 2.29, '1-l-Flasche', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 12: Marke bei ALDI vs. Eigenmarke ===
('2', 'Lorenz', 'Saltletts Sticks Classic', 'Saltletts Sticks Classic', 'Snacks & Nüsse', 'Snacks & Nuts', 2.29, NULL, '250g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Sunsnacks', 'Salzstangen', 'Salt Sticks', 'Snacks & Nüsse', 'Snacks & Nuts', 0.69, NULL, '250g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Bresso', 'Frischkäse Feine Kräuter', 'Cream Cheese Fine Herbs', 'Käse', 'Cheese', 2.39, NULL, '150g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Roi de Trefle', 'Fraîche Feine Kräuter', 'Fraîche Fine Herbs', 'Käse', 'Cheese', 0.99, NULL, '150g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Barilla', 'Pesto Genovese', 'Pesto Genovese', 'Saucen & Gewürze', 'Sauces & Spices', 3.49, NULL, '190-g-Glas', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Cucina', 'Pesto Genovese', 'Pesto Genovese', 'Saucen & Gewürze', 'Sauces & Spices', 0.99, NULL, '190-g-Glas', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 13: Marke vs. Eigenmarke – Wasser / Joghurt / Ketchup ===
('2', 'Volvic', 'Naturell Mineralwasser', 'Natural Mineral Water Still', 'Getränke', 'Beverages', 1.25, NULL, '1,5-l-Flasche', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Quellbrunn', 'Mineralwasser Naturell', 'Natural Mineral Water Still', 'Getränke', 'Beverages', 0.29, NULL, '1,5-l-Flasche', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Ehrmann', 'Almighurt Erdbeere', 'Almighurt Strawberry', 'Milchprodukte', 'Dairy', 0.89, NULL, '150-g-Becher', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Milsani', 'Alpighurt Erdbeere', 'Alpighurt Strawberry', 'Milchprodukte', 'Dairy', 0.29, NULL, '150-g-Becher', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Heinz', 'Tomatenketchup', 'Tomato Ketchup', 'Saucen & Gewürze', 'Sauces & Spices', 2.79, NULL, '400-ml-Flasche', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Delikato', 'Tomatenketchup', 'Tomato Ketchup', 'Saucen & Gewürze', 'Sauces & Spices', 1.29, NULL, '500-ml-Flasche', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 22: Tierbedarf (ab Do. 16.4.) ===
('2', 'Romeo Premium', 'Fleischsnacks versch. Sorten', 'Meat Snacks various sorts', 'Tierbedarf', 'Pet Supplies', 1.49, NULL, '100g', '2026-04-16', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Cachet', 'Katzenstreu Ultra', 'Cat Litter Ultra', 'Tierbedarf', 'Pet Supplies', 3.49, NULL, '8 Liter', '2026-04-16', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 24: Dein Wochenende – Dairy / Cheese / Spreads (ab Fr. 17.4.) ===
('2', 'Landliebe', 'H-Milch versch. Sorten', 'UHT Milk various sorts', 'Milchprodukte', 'Dairy', 0.99, NULL, '1-l-Packung', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Landliebe', 'Butter', 'Butter', 'Butter', 'Butter', 1.39, NULL, '250g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Landliebe', 'Konfitüre versch. Sorten', 'Jam various sorts', 'Brotaufstrich', 'Spreads', 1.99, NULL, '340-g-Glas', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Gervais', 'Hüttenkäse Original', 'Cottage Cheese Original', 'Käse', 'Cheese', 1.29, NULL, '200g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Old Amsterdam', 'Käsescheiben versch. Sorten', 'Cheese Slices various sorts', 'Käse', 'Cheese', 2.29, NULL, '115-130g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Président', 'Camembert L''Original', 'Camembert L''Original', 'Käse', 'Cheese', 2.59, NULL, '250g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Galbani', 'Mozzarella', 'Mozzarella', 'Käse', 'Cheese', 0.99, NULL, '230g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Wasa', 'Knäckebrot versch. Sorten', 'Crispbread various sorts', 'Brot & Backwaren', 'Bread & Bakery', 1.79, NULL, '200-275g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Zott', 'Sahnejoghurt versch. Sorten', 'Cream Yoghurt various sorts', 'Milchprodukte', 'Dairy', 0.44, NULL, '140-g-Becher', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 25: ab Fr. 17.4. – Dairy / Sweets / Beverages ===
('2', 'Müller', 'Kalinka-Kefir oder Ayran', 'Kefir or Ayran', 'Milchprodukte', 'Dairy', 0.79, NULL, '500g/500ml', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Müller', 'Doppeldecker oder Wackelpudding versch. Sorten', 'Doppeldecker or Jelly Pudding various sorts', 'Milchprodukte', 'Dairy', 0.99, NULL, '4x125g = 500g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Meine Kuchen Welt', 'Milch-Mäuse-Hörnchen versch. Sorten', 'Milk Mouse Croissants various sorts', 'Süßwaren', 'Sweets', 1.59, NULL, '5 Stück / 240g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Langnese', 'Magnum-Bonbon versch. Sorten', 'Magnum Bonbon various sorts', 'Eiscreme', 'Ice Cream', 3.79, NULL, '12 Stück / 204ml', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Starbucks', 'Chilled Coffee versch. Sorten', 'Chilled Coffee various sorts', 'Getränke', 'Beverages', 2.79, NULL, '750ml', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Kinder', 'Happy Hippo versch. Sorten', 'Happy Hippo various sorts', 'Süßwaren', 'Sweets', 1.99, NULL, '103,5g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Kinder', 'Duo versch. Sorten', 'Kinder Duo various sorts', 'Süßwaren', 'Sweets', 2.19, NULL, '128-150g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Kinder', 'Kinderini versch. Sorten', 'Kinderini various sorts', 'Süßwaren', 'Sweets', 2.79, NULL, '250g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Ferrero', 'Knusper Liebe versch. Sorten', 'Knusper Liebe various sorts', 'Süßwaren', 'Sweets', 1.89, NULL, '132g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Ferrero', 'kinder Maxi-King 3x35g', 'Kinder Maxi-King 3x35g', 'Süßwaren', 'Sweets', 1.49, NULL, '105g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 26: ab Fr. 17.4. – Snacks ===
('2', 'Aldiamo', 'Getrocknete Apfelchips', 'Dried Apple Chips', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, NULL, '70g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Maretti', 'Bruschette-Chips versch. Sorten', 'Bruschette Chips various sorts', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, NULL, '150g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Funny-Frisch', 'Cheese-Cracker versch. Sorten', 'Cheese Cracker various sorts', 'Snacks & Nüsse', 'Snacks & Nuts', 1.49, NULL, '100g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 27: ab Fr. 17.4. – Fleisch / Wurst / Alkohol / Fleischersatz ===
('2', 'Le Gusto', 'Kräuter oder Gewürze im Nachfüllbeutel versch. Sorten', 'Herbs or Spices Refill Pouch various sorts', 'Saucen & Gewürze', 'Sauces & Spices', 0.99, NULL, '8-70g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Handl Tyrol', 'Tiroler Speck g.g.A. versch. Sorten', 'Tyrolean Speck PGI various sorts', 'Fleisch & Wurst', 'Meat & Sausage', 1.99, NULL, '80g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Underberg', 'Kräuterspirituose 44% vol. 12+1 gratis', 'Herbal Spirit 44% vol. 12+1 free', 'Alkoholische Getränke', 'Alcoholic Beverages', 7.99, NULL, '13x0,02l', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Jack Daniel''s', 'Tennessee Whiskey versch. Sorten', 'Tennessee Whiskey various sorts', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.99, NULL, '0,7-l-Flasche', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Landbeck', 'Salami-Chips versch. Sorten', 'Salami Chips various sorts', 'Fleisch & Wurst', 'Meat & Sausage', 1.89, NULL, '100g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Meine Metzgerei', 'Simmentaler Steaks vom Rind versch. Sorten', 'Simmental Beef Steaks various sorts', 'Fleisch & Wurst', 'Meat & Sausage', 8.99, NULL, 'versch. Gewichte', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Barbarie-Entenbrustfilet Sous-vide-gegart', 'Barbary Duck Breast Fillet Sous-vide', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, NULL, '220g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Valess', 'Vegetarische Vielfalt versch. Sorten', 'Vegetarian Variety various sorts', 'Fleischersatz', 'Meat Alternatives', 1.99, NULL, '160-180g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Tillman''s', 'Toasty versch. Sorten', 'Toasty various sorts', 'Fertiggerichte', 'Ready Meals', 2.79, NULL, '4x70g = 280g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 28: ab Fr. 17.4. – XXL Fleisch / Fisch / Müsli ===
('2', 'Meine Metzgerei', 'Puten-Schnitzel Wiener Art', 'Turkey Schnitzel Viennese Style', 'Fleisch & Wurst', 'Meat & Sausage', 7.49, NULL, '800g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Gut Drei Eichen', 'Schwarzwälder Schinken geräuchert', 'Black Forest Ham smoked', 'Fleisch & Wurst', 'Meat & Sausage', 2.49, NULL, '250g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Golden Seafood', 'Backfisch in Panade aufgetaut', 'Battered Fish thawed', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 5.49, NULL, '560g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Nadler', 'Sahne-Heringsfilets versch. Sorten', 'Cream Herring Fillets various sorts', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.79, NULL, '500g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Üljte', 'Erdnüsse geröstet & gesalzen', 'Peanuts roasted & salted', 'Snacks & Nüsse', 'Snacks & Nuts', 3.33, NULL, '450g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Dr. Oetker', 'Vitalis-Müsli versch. Sorten', 'Vitalis Muesli various sorts', 'Frühstück & Cerealien', 'Breakfast & Cereal', 5.49, NULL, '1000-1500g', '2026-04-17', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 30: Aus unserem Sortiment – Moser Roth Schokolade ===
('2', 'Moser Roth', 'Helle Schokolade versch. Sorten', 'Milk Chocolate various sorts', 'Süßwaren', 'Sweets', 2.19, NULL, '5x25g = 125g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Moser Roth', 'Edelbitter-Schokolade 70% Cacao', 'Dark Chocolate 70% Cacao', 'Süßwaren', 'Sweets', 2.19, NULL, '5x25g = 125g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Moser Roth', 'Frucht-/Nussschokolade versch. Sorten', 'Fruit/Nut Chocolate various sorts', 'Süßwaren', 'Sweets', 2.19, NULL, '5x25g = 125g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Moser Roth', 'Chocolat Création oder Chocolat Délice versch. Sorten', 'Chocolat Création or Chocolat Délice various sorts', 'Süßwaren', 'Sweets', 2.59, NULL, '125-150g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 31: Aus unserem Sortiment – Moser Roth Pralinen ===
('2', 'Moser Roth', 'Délice-Pralinen versch. Sorten', 'Délice Pralines various sorts', 'Süßwaren', 'Sweets', 2.49, NULL, '140g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Moser Roth', 'Trüffelpralinen versch. Sorten', 'Truffle Pralines various sorts', 'Süßwaren', 'Sweets', 3.99, NULL, '200g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Moser Roth', 'Edelbitter-Schokolade versch. Sorten 85-90%', 'Dark Chocolate various sorts 85-90%', 'Süßwaren', 'Sweets', 2.19, NULL, '5x25g = 125g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Moser Roth', 'Feine Genussmomente versch. Sorten', 'Fine Pleasure Moments various sorts', 'Süßwaren', 'Sweets', 3.69, NULL, '180g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Moser Roth', 'Schokolade Mousse au Chocolat versch. Sorten', 'Mousse au Chocolat Chocolate various sorts', 'Süßwaren', 'Sweets', 2.59, NULL, '5x30g = 150g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 32: Aus unserem Sortiment – Nur Nur Natur Bio ===
('2', 'Nur Nur Natur', 'Bio-Sauerteig-Vollkorn-Krusti', 'Organic Sourdough Wholegrain Roll', 'Brot & Backwaren', 'Bread & Bakery', 0.49, NULL, 'je Stück', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Nur Nur Natur', 'Bio-Steinofen-Sauerteigkruste', 'Organic Stone Oven Sourdough Loaf', 'Brot & Backwaren', 'Bread & Bakery', 1.99, NULL, '600g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Nur Nur Natur', 'Bio-Roggenvollkorn-Sauerteigbrot', 'Organic Rye Wholegrain Sourdough Bread', 'Brot & Backwaren', 'Bread & Bakery', 2.19, NULL, '500g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Nur Nur Natur', 'Bio-Haferflocken Zartblatt', 'Organic Fine Oat Flakes', 'Frühstück & Cerealien', 'Breakfast & Cereal', 0.95, NULL, '500g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Nur Nur Natur', 'Bio-Dinkelmehl versch. Sorten', 'Organic Spelt Flour various sorts', 'Grundnahrungsmittel', 'Staples', 1.25, NULL, '1kg', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Nur Nur Natur', 'Bio-Bergbauern-Weichkäse versch. Sorten', 'Organic Mountain Farmer Soft Cheese various sorts', 'Käse', 'Cheese', 3.69, NULL, '200g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),

-- === PAGE 33: Aus unserem Sortiment – Nur Nur Natur Bio (Kühl/TK) ===
('2', 'Nur Nur Natur', 'Bio-Joghurt mild versch. Sorten', 'Organic Mild Yoghurt various sorts', 'Milchprodukte', 'Dairy', 0.89, NULL, '250-g-Becher', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Nur Nur Natur', 'Bio-Naturjoghurt Mild 3,8% Fett', 'Organic Natural Yoghurt Mild 3.8% fat', 'Milchprodukte', 'Dairy', 0.99, NULL, '400-g-Becher', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Nur Nur Natur', 'Bio-Tempeh versch. Sorten', 'Organic Tempeh various sorts', 'Fleischersatz', 'Meat Alternatives', 2.99, NULL, '200g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Nur Nur Natur', 'Bio-Dinkel-Steinofenpizza versch. Sorten', 'Organic Spelt Stone Oven Pizza various sorts', 'Tiefkühl', 'Frozen', 2.99, NULL, '315-335g', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Nur Nur Natur', 'Bio-Eiscreme oder -Sorbet versch. Sorten', 'Organic Ice Cream or Sorbet various sorts', 'Eiscreme', 'Ice Cream', 3.49, NULL, '500ml', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de'),
('2', 'Nur Nur Natur', 'Bio-Frischmilch Mind. 3,8% Fett', 'Organic Fresh Milk min. 3.8% fat', 'Milchprodukte', 'Dairy', 1.45, NULL, '1-l-Packung', '2026-04-13', '2026-04-18', true, 'https://www.aldi-sued.de');
