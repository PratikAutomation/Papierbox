-- ============================================================
-- Papierbox Database Schema
-- Run this in Supabase SQL Editor (Dashboard → SQL Editor)
-- ============================================================

-- Enable fuzzy search extension
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- ============================================================
-- TABLES
-- ============================================================

-- Stores (static, 5 supermarkets)
CREATE TABLE stores (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    brand_color TEXT NOT NULL,
    offers_url TEXT
);

-- Main offers table (weekly offers + regular price estimates)
CREATE TABLE offers (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    store_id TEXT REFERENCES stores(id),
    brand TEXT NOT NULL DEFAULT 'Eigenmarke',
    product_name TEXT NOT NULL,
    product_name_en TEXT,
    category TEXT NOT NULL,
    category_en TEXT,
    product_name_normalized TEXT GENERATED ALWAYS AS (lower(product_name)) STORED,
    price DECIMAL(10,2) NOT NULL,
    original_price DECIMAL(10,2),
    unit TEXT,
    valid_from DATE,
    valid_to DATE,
    is_offer BOOLEAN NOT NULL DEFAULT true,
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Bilingual synonym table (for DE<->EN search)
CREATE TABLE bilingual_synonyms (
    id SERIAL PRIMARY KEY,
    term TEXT NOT NULL,
    synonyms TEXT[] NOT NULL
);

-- Scrape monitoring
CREATE TABLE scrape_logs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    store_id TEXT REFERENCES stores(id),
    status TEXT NOT NULL,
    offers_count INTEGER DEFAULT 0,
    error_message TEXT,
    duration_ms INTEGER,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- INDEXES
-- ============================================================

-- Fuzzy search indexes (pg_trgm)
CREATE INDEX idx_offers_product_trgm ON offers USING GIN (product_name_normalized gin_trgm_ops);
CREATE INDEX idx_offers_brand_trgm ON offers USING GIN (lower(brand) gin_trgm_ops);
CREATE INDEX idx_offers_category_trgm ON offers USING GIN (lower(category) gin_trgm_ops);

-- Standard indexes
CREATE INDEX idx_offers_store ON offers(store_id);
CREATE INDEX idx_offers_price ON offers(price);
CREATE INDEX idx_offers_is_offer ON offers(is_offer);

-- ============================================================
-- SEARCH RPC FUNCTION
-- ============================================================

CREATE OR REPLACE FUNCTION search_offers(
    search_query TEXT,
    city_slug TEXT DEFAULT 'hamburg',
    result_limit INTEGER DEFAULT 50
)
RETURNS TABLE (
    id UUID,
    store_id TEXT,
    store_name TEXT,
    store_brand_color TEXT,
    brand TEXT,
    product_name TEXT,
    product_name_en TEXT,
    category TEXT,
    category_en TEXT,
    price DECIMAL,
    original_price DECIMAL,
    unit TEXT,
    valid_from DATE,
    valid_to DATE,
    is_offer BOOLEAN,
    source_url TEXT,
    similarity_score REAL
) AS $$
DECLARE
    normalized_query TEXT := lower(trim(search_query));
    synonym_terms TEXT[];
BEGIN
    -- Look up synonyms for the search term
    SELECT s.synonyms INTO synonym_terms
    FROM bilingual_synonyms s
    WHERE lower(s.term) = normalized_query
    LIMIT 1;

    RETURN QUERY
    SELECT
        o.id, o.store_id, st.name AS store_name, st.brand_color AS store_brand_color,
        o.brand, o.product_name, o.product_name_en,
        o.category, o.category_en,
        o.price, o.original_price, o.unit,
        o.valid_from, o.valid_to, o.is_offer, o.source_url,
        GREATEST(
            similarity(o.product_name_normalized, normalized_query),
            similarity(lower(o.brand), normalized_query),
            similarity(lower(o.category), normalized_query),
            CASE WHEN synonym_terms IS NOT NULL THEN
                (SELECT MAX(similarity(o.product_name_normalized, lower(syn)))
                 FROM unnest(synonym_terms) AS syn)
            ELSE 0 END
        ) AS similarity_score
    FROM offers o
    JOIN stores st ON o.store_id = st.id
    WHERE (
        o.product_name_normalized % normalized_query
        OR lower(o.brand) % normalized_query
        OR lower(o.category) % normalized_query
        OR o.product_name_normalized ILIKE '%' || normalized_query || '%'
        OR lower(o.brand) ILIKE '%' || normalized_query || '%'
        OR (synonym_terms IS NOT NULL AND EXISTS (
            SELECT 1 FROM unnest(synonym_terms) AS syn
            WHERE o.product_name_normalized % lower(syn)
               OR o.product_name_normalized ILIKE '%' || lower(syn) || '%'
        ))
    )
    ORDER BY
        o.is_offer DESC,
        similarity_score DESC,
        o.price ASC
    LIMIT result_limit;
END;
$$ LANGUAGE plpgsql;

-- ============================================================
-- ROW LEVEL SECURITY
-- ============================================================

ALTER TABLE offers ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read offers" ON offers FOR SELECT USING (true);

ALTER TABLE stores ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read stores" ON stores FOR SELECT USING (true);

ALTER TABLE bilingual_synonyms ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read synonyms" ON bilingual_synonyms FOR SELECT USING (true);

-- ============================================================
-- SEED DATA: STORES
-- ============================================================

INSERT INTO stores (id, name, slug, brand_color, offers_url) VALUES
('1', 'Lidl', 'lidl', '#0050AA', NULL),
('2', 'Aldi Süd', 'aldi-sued', '#00005F', NULL),
('3', 'Penny', 'penny', '#CD1719', NULL),
('4', 'Kaufland', 'kaufland', '#E10915', NULL),
('5', 'Netto', 'netto', '#FFE600', NULL);

-- ============================================================
-- SEED DATA: BILINGUAL SYNONYMS
-- ============================================================

INSERT INTO bilingual_synonyms (term, synonyms) VALUES
-- English to German
('chicken', ARRAY['haehnchen', 'haehnchenbrust', 'chicken breast', 'haehnchen filet']),
('milk', ARRAY['milch', 'vollmilch', 'whole milk', 'frischmilch']),
('eggs', ARRAY['eier', 'frische eier', 'freilandeier']),
('butter', ARRAY['butter', 'markenbutter', 'deutsche markenbutter', 'suessrahmbutter']),
('bread', ARRAY['brot', 'vollkornbrot', 'toastbrot', 'toast bread']),
('cheese', ARRAY['kaese', 'gouda', 'emmentaler', 'mozzarella']),
('potatoes', ARRAY['kartoffeln', 'speisekartoffeln']),
('rice', ARRAY['reis', 'langkornreis', 'basmati reis', 'basmati']),
('pasta', ARRAY['nudeln', 'spaghetti', 'penne', 'fusilli']),
('yogurt', ARRAY['joghurt', 'naturjoghurt', 'fruchtjoghurt']),
('beef', ARRAY['hackfleisch', 'rinderhackfleisch', 'ground beef', 'rinderhack']),
('salmon', ARRAY['lachs', 'bio lachs', 'lachsfilet']),
('apples', ARRAY['aepfel', 'apfel', 'tafelaepfel']),
('bananas', ARRAY['bananen', 'banane']),
('tomatoes', ARRAY['tomaten', 'strauchtomaten', 'cherry tomaten']),
('cucumber', ARRAY['gurke', 'salatgurke']),
('onions', ARRAY['zwiebeln', 'speisezwiebeln']),
('coffee', ARRAY['kaffee', 'filterkaffee', 'kaffeebohnen']),
('water', ARRAY['wasser', 'mineralwasser', 'sprudelwasser']),
('sugar', ARRAY['zucker', 'raffinade']),
('flour', ARRAY['mehl', 'weizenmehl']),
('cream', ARRAY['sahne', 'schlagsahne', 'schmand']),
('tuna', ARRAY['thunfisch', 'thunfisch dose']),
('pizza', ARRAY['pizza', 'tiefkuehlpizza', 'frozen pizza']),
('detergent', ARRAY['waschmittel', 'vollwaschmittel', 'fluessigwaschmittel']),
('toilet paper', ARRAY['toilettenpapier', 'klopapier']),
('toothpaste', ARRAY['zahnpasta', 'zahncreme']),
('oats', ARRAY['haferflocken', 'kernige haferflocken']),
('lentils', ARRAY['linsen', 'rote linsen', 'berglinsen']),
('chickpeas', ARRAY['kichererbsen', 'kichererbsen dose']),
('coconut milk', ARRAY['kokosmilch', 'kokosnussmilch']),
('olive oil', ARRAY['olivenoel', 'natives olivenoel', 'extra virgin olive oil']),
('bell pepper', ARRAY['paprika', 'spitzpaprika', 'sweet pepper']),
('ketchup', ARRAY['ketchup', 'tomatenketchup']),
('mustard', ARRAY['senf', 'mittelscharfer senf']),
-- German to English
('milch', ARRAY['milk', 'whole milk', 'vollmilch']),
('haehnchen', ARRAY['chicken', 'chicken breast', 'haehnchenbrust']),
('eier', ARRAY['eggs', 'frische eier']),
('kaese', ARRAY['cheese', 'gouda', 'emmentaler']),
('kartoffeln', ARRAY['potatoes', 'speisekartoffeln']),
('reis', ARRAY['rice', 'langkornreis', 'basmati']),
('nudeln', ARRAY['pasta', 'spaghetti', 'noodles']),
('joghurt', ARRAY['yogurt', 'naturjoghurt']),
('hackfleisch', ARRAY['ground beef', 'beef', 'minced meat']),
('lachs', ARRAY['salmon', 'lachsfilet']),
('brot', ARRAY['bread', 'vollkornbrot', 'toast']),
('kaffee', ARRAY['coffee', 'filterkaffee']),
('zucker', ARRAY['sugar', 'raffinade']),
('mehl', ARRAY['flour', 'weizenmehl']),
('sahne', ARRAY['cream', 'schlagsahne']),
('wasser', ARRAY['water', 'mineralwasser']),
('senf', ARRAY['mustard', 'mittelscharfer senf']),
('zwiebeln', ARRAY['onions', 'speisezwiebeln']),
('tomaten', ARRAY['tomatoes', 'cherry tomaten']),
('gurke', ARRAY['cucumber', 'salatgurke']),
('bananen', ARRAY['bananas', 'banane']);
