-- ALDI SÜD Prospekt: Mo, 30.3. bis Sa, 4.4.2026
-- Source: kaufDA - ALDI SÜD - Gutes für Alle
-- store_id = '2'

-- First: Delete old offers for this store
DELETE FROM public.offers WHERE store_id = '2' AND is_offer = true;

-- Then: Insert new offers
INSERT INTO public.offers (store_id, brand, product_name, product_name_en, category, category_en, price, original_price, unit, valid_from, valid_to, is_offer, source_url) VALUES

-- === PAGE 2: Hauptangebote ab Mo. 30.3. ===
('2', 'Mövenpick', 'Mövenpick Eischokolade versch. Sorten', 'Mövenpick Ice Chocolate assorted', 'Eiscreme', 'Ice Cream', 1.49, 3.99, '900ml', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Philadelphia', 'Philadelphia Frischkäse versch. Sorten', 'Philadelphia Cream Cheese assorted', 'Käse', 'Cheese', 0.89, 2.29, '175g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Coppenrath & Wiese', 'Coppenrath & Wiese Unsere Goldstücke 9 Weizenbrötchen', 'Coppenrath & Wiese Our Golden Rolls 9 Wheat Rolls', 'Tiefkühl', 'Frozen', 1.11, 2.29, '450g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Valensina', 'Valensina Orange Direktsaft', 'Valensina Orange Direct Juice', 'Getränke', 'Beverages', 1.29, 2.49, '1L', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Dallmayr', 'Dallmayr Crema d''Oro Ganze Bohnen', 'Dallmayr Crema d''Oro Whole Beans', 'Kaffee & Tee', 'Coffee & Tea', 11.99, 20.99, '1kg', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Südzucker', 'Südzucker Puderzucker/Zucker', 'Südzucker Powdered/White Sugar', 'Grundnahrungsmittel', 'Staples', 0.59, 0.99, '500g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 5: Obst & Gemüse Mo. 30.3. – Sa. 4.4. ===
('2', 'Eigenmarke', 'Mini-Roma-Rispentomaten', 'Mini Roma Vine Tomatoes', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, NULL, '300g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Avocado', 'Avocado', 'Obst & Gemüse', 'Fruits & Vegetables', 0.85, NULL, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Gurke', 'Cucumber', 'Obst & Gemüse', 'Fruits & Vegetables', 0.44, 0.55, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 6: Obst & Gemüse Mo. 30.3. – Sa. 4.4. ===
('2', 'Eigenmarke', 'Trauben dunkel kernlos', 'Dark Seedless Grapes', 'Obst & Gemüse', 'Fruits & Vegetables', 1.49, NULL, '500g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Rio d''Oro', 'Rio d''Oro Saftorangon', 'Rio d''Oro Juice Oranges', 'Obst & Gemüse', 'Fruits & Vegetables', 1.89, NULL, '1.5kg', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Kleine Schätze', 'Kleine Schätze Heidelbeeren', 'Kleine Schätze Blueberries', 'Obst & Gemüse', 'Fruits & Vegetables', 1.99, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Kleine Schätze', 'Kleine Schätze Speisekartoffeln Drillinge', 'Kleine Schätze Baby Potatoes', 'Obst & Gemüse', 'Fruits & Vegetables', 1.39, NULL, '1kg', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 7: Marken ab Mo. 30.3. ===
('2', 'Eigenmarke', 'Meine Backwelt Flachsee/Focaccia', 'My Bakery Flatbread/Focaccia', 'Brot & Backwaren', 'Bread & Bakery', 0.59, 0.99, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Walnussbrötchen', 'Walnut Rolls', 'Brot & Backwaren', 'Bread & Bakery', 0.39, 0.59, 'Stück', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Alpro', 'Alpro Joghurtalternative Natur', 'Alpro Yogurt Alternative Natural', 'Milchprodukte', 'Dairy', 1.49, 2.19, '400g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 8: Gourmet & Ostern ab Mo. 30.3. ===
('2', 'Eigenmarke', 'Bunte Eier Ostereier', 'Colorful Easter Eggs', 'Süßwaren', 'Sweets', 1.99, NULL, '6 Stück', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Vital Tonno Rindfleisch in Thunfischsoße', 'Gourmet Finest Cuisine Vital Tonno Beef in Tuna Sauce', 'Fleisch & Wurst', 'Meat & Sausage', 2.79, 3.99, '160g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Isländischer Räucherlachs', 'Gourmet Finest Cuisine Icelandic Smoked Salmon', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 6.49, NULL, '300g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Serrano Gran Reserva', 'Gourmet Finest Cuisine Serrano Gran Reserva', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, 1.99, '70g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Lavazza', 'Lavazza Kaffeepads versch. Sorten', 'Lavazza Coffee Pads assorted', 'Kaffee & Tee', 'Coffee & Tea', 2.49, NULL, '125g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Wiltmann', 'Wiltmann Genießer-Teller versch. Sorten', 'Wiltmann Gourmet Plate assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.29, 2.29, '80g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 9: Milchprodukte & Wurst ab Mo. 30.3. ===
('2', 'Müller', 'Müller Joghurt mit der Ecke versch. Sorten', 'Müller Corner Yogurt assorted', 'Milchprodukte', 'Dairy', 0.33, 0.89, '140g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Almare', 'Almare Norwegischer Räucherlachs', 'Almare Norwegian Smoked Salmon', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.49, 4.29, '200g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Müller', 'Müller Müllermilch versch. Sorten', 'Müller Milk Drink assorted', 'Milchprodukte', 'Dairy', 0.66, 1.49, '400ml', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Grünländer', 'Grünländer Veganer Schinken-Spicker versch. Sorten', 'Grünländer Vegan Ham Slicer assorted', 'Fleischersatz', 'Meat Alternatives', 1.11, 1.59, '80g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Herta', 'Herta Finesse versch. Sorten', 'Herta Finesse assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.19, 2.59, '100g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 10: Backwaren & Wurst ab Mo. 30.3. ===
('2', 'Goldähren', 'Goldähren Laugenbrötchen versch. Sorten', 'Goldähren Pretzel Rolls assorted', 'Tiefkühl', 'Frozen', 2.99, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Goldähren', 'Goldähren Mini-Laugen-Mix', 'Goldähren Mini Pretzel Mix', 'Tiefkühl', 'Frozen', 2.69, NULL, '300g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Goldähren', 'Goldähren Croissant versch. Sorten', 'Goldähren Croissant assorted', 'Tiefkühl', 'Frozen', 2.99, 3.99, '300g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Milram', 'Milram Käsescheiben versch. Sorten XXL', 'Milram Cheese Slices assorted XXL', 'Käse', 'Cheese', 2.89, NULL, '260g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Grünländer', 'Grünländer Käsescheiben versch. Sorten', 'Grünländer Cheese Slices assorted', 'Käse', 'Cheese', 1.79, 2.99, '150g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Cucina', 'Cucina Salame Milano XXL', 'Cucina Salami Milano XXL', 'Fleisch & Wurst', 'Meat & Sausage', 1.79, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Gut Drei Eichen', 'Gut Drei Eichen Delikatess Lachsschinken', 'Gut Drei Eichen Delicatessen Salmon Ham', 'Fleisch & Wurst', 'Meat & Sausage', 1.69, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Gut Drei Eichen', 'Gut Drei Eichen Kochschinken XXL', 'Gut Drei Eichen Cooked Ham XXL', 'Fleisch & Wurst', 'Meat & Sausage', 1.49, 2.09, '250g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 11: Fleisch & Wein ab Mo. 30.3. ===
('2', 'Eigenmarke', '2025 Premium Lugana DOC', '2025 Premium Lugana DOC', 'Alkoholische Getränke', 'Alcoholic Beverages', 7.99, NULL, '0.75L', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'IBP', 'IBP Karree vom Ibérico-Schwein versch. Gewichte', 'IBP Ibérico Pork Loin assorted weights', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, 'ca. 225g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Meine Metzgerei Nackenbraten vom Schwein', 'My Butcher Pork Neck Roast', 'Fleisch & Wurst', 'Meat & Sausage', 6.49, NULL, 'kg', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Frisches Filetsteak vom Rind', 'Gourmet Finest Cuisine Fresh Beef Fillet Steak', 'Fleisch & Wurst', 'Meat & Sausage', 6.99, NULL, 'ca. 155g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Meine Metzgerei Kalbsmedaillons', 'My Butcher Veal Medallions', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, NULL, '300g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Meine Metzgerei Schweinefleisch am Stück versch. Gewichte', 'My Butcher Pork Piece assorted weights', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, '500g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Neuseeländische Lammfilets XXL', 'New Zealand Lamb Fillets XXL', 'Fleisch & Wurst', 'Meat & Sausage', 13.99, NULL, 'XXL Pack', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 12: Käse & Fleisch ab Mo. 30.3. ===
('2', 'Eigenmarke', 'Gorgonzola DOP versch. Sorten', 'Gorgonzola DOP assorted', 'Käse', 'Cheese', 2.19, 2.99, '200g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Frische junge Ente', 'Gourmet Finest Cuisine Fresh Young Duck', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, NULL, 'ca. 2kg', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Meine Metzgerei Neuseeländischer Lammrücken', 'My Butcher New Zealand Lamb Back', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, 7.89, 'ca. 300g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Bio-Knödel versch. Sorten', 'Organic Dumplings assorted', 'Fertiggerichte', 'Ready Meals', 2.99, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Amerikanisches/Argentinisches Beefsteak', 'American/Argentinian Beefsteak', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, 6.29, 'ca. 300g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 13: Ostern günstig schlemmen ab Mo. 30.3. ===
('2', 'Meggle', 'Meggle Vegane Kräuterbutter/Kräuterbutter-Trio', 'Meggle Vegan Herb Butter/Herb Butter Trio', 'Milchprodukte', 'Dairy', 1.49, NULL, '100g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Spareribs vom Schwein versch. Sorten', 'Pork Spare Ribs assorted', 'Fleisch & Wurst', 'Meat & Sausage', 5.99, 7.99, '800g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Meine Metzgerei Hähnchen-Flügel XXL', 'My Butcher Chicken Wings XXL', 'Fleisch & Wurst', 'Meat & Sausage', 4.79, 5.99, '1.5kg', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Patros', 'Patros Grill- & Ofenkäse versch. Sorten', 'Patros Grill & Oven Cheese assorted', 'Käse', 'Cheese', 1.99, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Arla', 'Arla Finello versch. Sorten', 'Arla Finello assorted', 'Käse', 'Cheese', 1.49, NULL, '150g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Meine Metzgerei Hähnchen-Brustfilets XXL', 'My Butcher Chicken Breast Fillets XXL', 'Fleisch & Wurst', 'Meat & Sausage', 12.99, NULL, '1.5kg', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 14: Fleisch & Getränke ab Mo. 30.3. ===
('2', 'Eigenmarke', 'Meine Metzgerei Chicken-Nuggets XXL', 'My Butcher Chicken Nuggets XXL', 'Fleisch & Wurst', 'Meat & Sausage', 4.99, NULL, 'XXL Pack', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Meine Metzgerei Hackfleisch vom Rind XXL', 'My Butcher Beef Mince XXL', 'Fleisch & Wurst', 'Meat & Sausage', 10.99, NULL, '1kg', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Milram', 'Milram Frühlingsquark oder Gemüsequark versch. Sorten', 'Milram Spring Quark or Vegetable Quark assorted', 'Milchprodukte', 'Dairy', 1.99, NULL, '175g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Meine Metzgerei Hähnchen-Schenkelsteaks mariniert versch. Sorten', 'My Butcher Marinated Chicken Thigh Steaks assorted', 'Fleisch & Wurst', 'Meat & Sausage', 3.29, 3.99, '500g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Johnnie Walker', 'Johnnie Walker/Ballantine''s/Singleton/Zacapa/Dimple Spirituosen versch. Sorten', 'Johnnie Walker/Ballantine''s/Singleton/Zacapa/Dimple Spirits assorted', 'Alkoholische Getränke', 'Alcoholic Beverages', 14.99, NULL, '0.7L', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Asbach', 'Asbach Uralt Weinbrand', 'Asbach Uralt Brandy', 'Alkoholische Getränke', 'Alcoholic Beverages', 9.99, NULL, '0.7L', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Coca-Cola', 'Coca-Cola/Fanta/Mezzo Mix/Sprite versch. Sorten', 'Coca-Cola/Fanta/Mezzo Mix/Sprite assorted', 'Getränke', 'Beverages', 0.79, NULL, '1.25L', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 15: Tiefkühl & Fisch ab Mo. 30.3. ===
('2', 'Iglo', 'Iglo Schlemmerfilets versch. Sorten', 'Iglo Gourmet Fillets assorted', 'Tiefkühl', 'Frozen', 2.49, 4.49, '380g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'All Seasons', 'All Seasons Buttergemüse', 'All Seasons Buttered Vegetables', 'Tiefkühl', 'Frozen', 0.75, 1.09, '300g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Golden Seafood', 'Golden Seafood Forellen Natur ausgenommen', 'Golden Seafood Trout Natural gutted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 4.99, NULL, 'ca. 500g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Norwegische Lachsfiletseite', 'Gourmet Finest Cuisine Norwegian Salmon Fillet Side', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 10.99, 13.99, '250g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Geräucherte Lachsforelle', 'Gourmet Finest Cuisine Smoked Salmon Trout', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 8.99, NULL, '250g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Bellasan', 'Bellasan Pflanzencreme', 'Bellasan Plant Cream', 'Milchprodukte', 'Dairy', 0.99, 1.59, '500ml', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 16: Asia ab Mo. 30.3. ===
('2', 'Asia Green Garden', 'Asia Green Garden Reisnudelsalat versch. Sorten', 'Asia Green Garden Rice Noodle Salad assorted', 'Fertiggerichte', 'Ready Meals', 0.99, NULL, '250g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Asia Green Garden', 'Asia Green Garden Sushi-Reis', 'Asia Green Garden Sushi Rice', 'Nudeln & Reis', 'Pasta & Rice', 1.29, NULL, '500g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Asia Green Garden', 'Asia Green Garden Nori-Blätter 10 Stück', 'Asia Green Garden Nori Sheets 10 pcs', 'Grundnahrungsmittel', 'Staples', 1.99, NULL, '28g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Golden Seafood', 'Golden Seafood Garnelen', 'Golden Seafood Shrimp', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 8.49, NULL, '200g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Litess', 'Litess Kretanaki Natives Olivenöl Extra Limited Edition', 'Litess Kretanaki Extra Virgin Olive Oil Limited Edition', 'Öle & Essig', 'Oils & Vinegar', 7.99, NULL, '500ml', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Asia Green Garden', 'Asia Green Garden Kimchi/Ingwer/Edamame versch. Sorten', 'Asia Green Garden Kimchi/Ginger/Edamame assorted', 'Grundnahrungsmittel', 'Staples', 1.29, NULL, '200g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 17: Kuchen & Eis ab Mo. 30.3. ===
('2', 'Eigenmarke', 'Meine Küchen Welt Strudel versch. Sorten', 'My Kitchen World Strudel assorted', 'Tiefkühl', 'Frozen', 1.49, 2.19, '600g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Dr. Oetker', 'Dr. Oetker Tortenguss versch. Sorten', 'Dr. Oetker Cake Glaze assorted', 'Grundnahrungsmittel', 'Staples', 0.69, 0.99, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Pott', 'Pott Eierlikör', 'Pott Egg Liqueur', 'Alkoholische Getränke', 'Alcoholic Beverages', 8.99, NULL, '0.7L', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Meine Küchen Welt Mini-Kuchen versch. Sorten', 'My Kitchen World Mini Cakes assorted', 'Süßwaren', 'Sweets', 1.99, 2.59, '240g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Traditionelle Genüsse Saftige Rosinenbrötchen', 'Traditional Treats Juicy Raisin Buns', 'Brot & Backwaren', 'Bread & Bakery', 1.99, NULL, '450g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 18: Desserts & Kuchen ab Mo. 30.3. ===
('2', 'Mövenpick', 'Mövenpick Klöhen & Fein versch. Sorten', 'Mövenpick Fine Yogurt assorted', 'Milchprodukte', 'Dairy', 1.99, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Zott', 'Zott Monte Maxi versch. Sorten', 'Zott Monte Maxi assorted', 'Milchprodukte', 'Dairy', 1.49, NULL, '400g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Coppenrath & Wiese', 'Conditorei Coppenrath & Wiese Cafeteria Klein & fein versch. Sorten', 'Coppenrath & Wiese Cafeteria Small & Fine assorted', 'Tiefkühl', 'Frozen', 3.29, 5.99, 'Packung', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Meine Küchen Welt Zimtrollen', 'My Kitchen World Cinnamon Rolls', 'Brot & Backwaren', 'Bread & Bakery', 1.79, NULL, '300g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Dr. Oetker', 'Dr. Oetker Kleine Kuchen versch. Sorten', 'Dr. Oetker Small Cakes assorted', 'Süßwaren', 'Sweets', 1.99, NULL, '140g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Starbucks', 'Starbucks Chilled Coffee/Chilled Coffee Oat versch. Sorten', 'Starbucks Chilled Coffee/Oat assorted', 'Getränke', 'Beverages', 1.49, NULL, '0.22L', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', '4 Maronen Kuchen', '4 Chestnut Cakes', 'Süßwaren', 'Sweets', 1.99, NULL, '4 Stück', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Gü', 'Gü Cheesecakes versch. Sorten', 'Gü Cheesecakes assorted', 'Süßwaren', 'Sweets', 1.99, NULL, '2 Stück', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Nestlé', 'Nestlé Yes! Kuchenriegel versch. Sorten', 'Nestlé Yes! Cake Bars assorted', 'Süßwaren', 'Sweets', 1.49, NULL, '90g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 19: Süßwaren ab Mo. 30.3. ===
('2', 'Mars', 'Mars/Snickers/Twix Schokoriegel versch. Sorten 5 Stück', 'Mars/Snickers/Twix Chocolate Bars assorted 5 pcs', 'Süßwaren', 'Sweets', 1.79, 3.29, '225g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Haribo', 'Haribo Goldbären Fruchtgummi versch. Sorten', 'Haribo Gold Bears Fruit Gummies assorted', 'Süßwaren', 'Sweets', 0.69, 1.19, '175g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Biscotto', 'Biscotto Waffel- oder Gebäckmischung', 'Biscotto Wafer or Biscuit Mix', 'Süßwaren', 'Sweets', 1.99, 2.89, '500g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Milka', 'Milka Ostertafel Alpenmilch und weiße Schokolade', 'Milka Easter Bar Alpine Milk and White Chocolate', 'Süßwaren', 'Sweets', 1.29, NULL, '100g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Milka', 'Milka Kekse versch. Sorten', 'Milka Cookies assorted', 'Süßwaren', 'Sweets', 1.69, 2.99, '156g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Ferrero', 'Ferrero Duplo oder Kinder Riegel', 'Ferrero Duplo or Kinder Bar', 'Süßwaren', 'Sweets', 1.99, 3.29, '10 Riegel', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 20: Süßwaren & Getränke ab Mo. 30.3. ===
('2', 'Ferrero', 'Ferrero Kinder Überraschung Maxi', 'Ferrero Kinder Surprise Maxi', 'Süßwaren', 'Sweets', 3.49, NULL, '100g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Choceur', 'Choceur Schoko-Rosinen', 'Choceur Chocolate Raisins', 'Süßwaren', 'Sweets', 1.29, 1.69, '250g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Choceur', 'Choceur Pistazien-Konfekt', 'Choceur Pistachio Confectionery', 'Süßwaren', 'Sweets', 2.49, NULL, '100g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Hitschies', 'Hitschies Kaubonbons versch. Sorten', 'Hitschies Chewing Candies assorted', 'Süßwaren', 'Sweets', 1.79, NULL, '210g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Ferrero', 'Ferrero Pralinen-Schokoladentafel versch. Sorten', 'Ferrero Praline Chocolate Bar assorted', 'Süßwaren', 'Sweets', 1.99, NULL, '90g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Leibniz', 'Leibniz Zoo Osterfarm', 'Leibniz Zoo Easter Farm', 'Süßwaren', 'Sweets', 1.29, NULL, '125g', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Pfanner', 'Pfanner Fruchtsaftgetränk versch. Sorten 1L 4-Packung', 'Pfanner Fruit Juice Drink assorted 1L 4-pack', 'Getränke', 'Beverages', 1.29, NULL, '4x1L', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Powerade', 'Powerade Isotonisches Sportgetränk versch. Sorten', 'Powerade Isotonic Sports Drink assorted', 'Getränke', 'Beverages', 0.99, NULL, '0.5L', '2026-03-30', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 32: Haushalt ab Mi. 1.4. ===
('2', 'Kokett', 'Kokett Toilettenpapier 3-lagig 8x180 Blatt', 'Kokett Toilet Paper 3-ply 8x180 sheets', 'Haushalt', 'Household', 2.79, NULL, '8 Rollen', '2026-04-01', '2026-04-04', true, 'https://www.aldi-sued.de'),

-- === PAGE 33: ab Do. 2.4. ===
('2', 'Eigenmarke', 'Feldsalat', 'Lamb''s Lettuce', 'Obst & Gemüse', 'Fruits & Vegetables', 0.95, 1.49, '150g', '2026-04-02', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Kleine Schätze', 'Kleine Schätze Erdbeeren', 'Kleine Schätze Strawberries', 'Obst & Gemüse', 'Fruits & Vegetables', 2.99, 3.59, '400g', '2026-04-02', '2026-04-04', true, 'https://www.aldi-sued.de'),
('2', 'Golden Seafood', 'Golden Seafood Lachsfilet-Portionen', 'Golden Seafood Salmon Fillet Portions', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 9.49, NULL, '4x125g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Meine Metzgerei Lamm-Medaillons', 'My Butcher Lamb Medallions', 'Fleisch & Wurst', 'Meat & Sausage', 6.49, NULL, '300g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),

-- === PAGE 34: Dauerhaft im Sortiment ===
('2', 'Biscotto', 'Biscotto Schoko-Waffeln versch. Sorten', 'Biscotto Chocolate Wafers assorted', 'Süßwaren', 'Sweets', 2.59, 2.89, '175g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Choceur', 'Choceur Schoko-Röllchen versch. Sorten', 'Choceur Chocolate Rolls assorted', 'Süßwaren', 'Sweets', 1.79, 1.99, '125g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Schwarzriesling Baden-Württemberg fruchtig', 'Schwarzriesling Baden-Württemberg fruity', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.29, 4.49, '1L', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Burlwood', 'Burlwood Cabernet Sauvignon Kalifornien trocken', 'Burlwood Cabernet Sauvignon California dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.69, NULL, '0.75L', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Zweigelt Österreich Cuvée Classic', 'Zweigelt Austria Cuvée Classic', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.49, 2.59, '1L', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),

-- === PAGE 35: Dauerhaft im Sortiment ===
('2', 'Barón Amarillo', 'Barón Amarillo Rioja Reserva DOCa Spanien trocken', 'Barón Amarillo Rioja Reserva DOCa Spain dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 4.29, 4.49, '0.75L', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Mario Collina', 'Mario Collina Pinot Grigio DOC Italien trocken', 'Mario Collina Pinot Grigio DOC Italy dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 2.69, 2.79, '0.75L', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Merlot Pays d''Oc IGP Frankreich trocken', 'Merlot Pays d''Oc IGP France dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 1.99, 2.19, '0.75L', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Biscotto', 'Biscotto Butterkeks versch. Sorten', 'Biscotto Butter Biscuits assorted', 'Süßwaren', 'Sweets', 1.89, 1.99, '2x200g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Pinkie-Donut', 'Pinkie Donut', 'Brot & Backwaren', 'Bread & Bakery', 0.55, NULL, 'Stück', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Castellore', 'Castellore IT Primitivo Nero Trois Italien halbtrocken', 'Castellore IT Primitivo Nero Trois Italy semi-dry', 'Alkoholische Getränke', 'Alcoholic Beverages', 3.69, 3.89, '0.75L', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Choceur', 'Choceur Kakaodrink', 'Choceur Cocoa Drink', 'Getränke', 'Beverages', 3.99, 4.29, '800g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Eigenmarke', 'Donut Milchschokolade', 'Donut Milk Chocolate', 'Brot & Backwaren', 'Bread & Bakery', 0.55, NULL, 'Stück', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),

-- === PAGE 36: Sortiment Gourmet ===
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Gegrillte Thunfischfilets in Olivenöl', 'Gourmet Finest Cuisine Grilled Tuna Fillets in Olive Oil', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.79, NULL, '105g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Gefüllte Gnocchi versch. Sorten', 'Gourmet Finest Cuisine Stuffed Gnocchi assorted', 'Fertiggerichte', 'Ready Meals', 1.99, NULL, '400g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Ibérico-Spezialitäten versch. Sorten', 'Gourmet Finest Cuisine Ibérico Specialties assorted', 'Fleisch & Wurst', 'Meat & Sausage', 2.29, NULL, '70g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Pesto versch. Sorten', 'Gourmet Finest Cuisine Pesto assorted', 'Saucen & Gewürze', 'Sauces & Spices', 1.99, NULL, '190g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Leberpastete versch. Sorten', 'Gourmet Finest Cuisine Liver Pâté assorted', 'Fleisch & Wurst', 'Meat & Sausage', 1.79, NULL, '125g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Bresaola della Valtellina', 'Gourmet Finest Cuisine Bresaola della Valtellina', 'Fleisch & Wurst', 'Meat & Sausage', 2.99, NULL, '80g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),

-- === PAGE 37: Sortiment Gourmet ===
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Filoncino versch. Sorten', 'Gourmet Finest Cuisine Filoncino assorted', 'Brot & Backwaren', 'Bread & Bakery', 1.89, NULL, '400g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Pfirsiche oder Birnen im Glas', 'Gourmet Finest Cuisine Peaches or Pears in Jar', 'Grundnahrungsmittel', 'Staples', 2.29, NULL, '680ml', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Maronen ganz geschält', 'Gourmet Finest Cuisine Chestnuts whole peeled', 'Grundnahrungsmittel', 'Staples', 3.39, NULL, '200g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Sockeye-Wildlachs', 'Gourmet Finest Cuisine Sockeye Wild Salmon', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.59, NULL, '100g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Schwäbische Maultaschen', 'Gourmet Finest Cuisine Swabian Ravioli', 'Fertiggerichte', 'Ready Meals', 2.49, NULL, '360g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Gourmet Finest Cuisine', 'Gourmet Finest Cuisine Trüffel versch. Sorten in Olivenöl', 'Gourmet Finest Cuisine Truffles assorted in Olive Oil', 'Saucen & Gewürze', 'Sauces & Spices', 4.29, NULL, '40g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),

-- === PAGE 38: Sortiment Almare Fisch ===
('2', 'Almare', 'Almare Heringsfilets in Creme versch. Sorten', 'Almare Herring Fillets in Cream assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.09, NULL, '200g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Almare', 'Almare Edle Matjesfilets versch. Sorten', 'Almare Premium Matjes Fillets assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, NULL, '250g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Almare', 'Almare Eismeergarnelen', 'Almare Arctic Shrimp', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, NULL, '100g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Almare', 'Almare Premium Matjesfilets versch. Sorten', 'Almare Premium Matjes Fillets assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.79, NULL, '250g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Almare', 'Almare Shrimps-Salat', 'Almare Shrimp Salad', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, NULL, '200g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Almare', 'Almare Stremellachs versch. Sorten', 'Almare Stremel Salmon assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 3.29, NULL, '125g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),

-- === PAGE 39: Sortiment Almare Fisch ===
('2', 'Almare', 'Almare Heringsfilets versch. Sorten', 'Almare Herring Fillets assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, NULL, '400g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Almare', 'Almare Lachs-Vielfalt versch. Sorten', 'Almare Salmon Variety assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.49, NULL, '100g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Almare', 'Almare Fischthekensalat versch. Sorten', 'Almare Fish Counter Salad assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.99, NULL, '200g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Almare', 'Almare Thunfisch mit Gemüse', 'Almare Tuna with Vegetables', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.29, NULL, '185g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Almare', 'Almare Thunfisch-Salat versch. Sorten', 'Almare Tuna Salad assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.39, NULL, '160g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Almare', 'Almare Thunfischfilets versch. Sorten', 'Almare Tuna Fillets assorted', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 1.29, NULL, '195g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de'),
('2', 'Almare', 'Almare Regenbogenforellen-Filets', 'Almare Rainbow Trout Fillets', 'Fisch & Meeresfrüchte', 'Fish & Seafood', 2.49, NULL, '125g', '2026-03-30', '2026-04-04', false, 'https://www.aldi-sued.de');
