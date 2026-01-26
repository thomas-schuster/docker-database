-- ============================================================================
-- Mondial Schema Extension: Attractions (Sehenswürdigkeiten)
-- ============================================================================
-- This extension adds support for tourist attractions, landmarks, and points
-- of interest with their geographic coordinates and metadata.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Attraction Category Table
-- Categories for classifying attractions (e.g., museum, church, park, etc.)
-- ----------------------------------------------------------------------------
CREATE TABLE attraction_category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(500)
);

-- ----------------------------------------------------------------------------
-- Attraction Table
-- Main table for storing attractions/sights with coordinates
-- ----------------------------------------------------------------------------
CREATE TABLE attraction (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    local_name VARCHAR(200),
    city VARCHAR(50),
    country VARCHAR(4),
    province VARCHAR(50),
    category_id INTEGER REFERENCES attraction_category(id),
    coordinates GEOCOORD CONSTRAINT attraction_coord
        CHECK (((coordinates).latitude >= -90) AND 
               ((coordinates).latitude <= 90) AND
               ((coordinates).longitude >= -180) AND 
               ((coordinates).longitude <= 180)),
    elevation DECIMAL,
    established_year INTEGER,
    description TEXT,
    website VARCHAR(500),
    opening_hours VARCHAR(200),
    entrance_fee VARCHAR(100),
    unesco_heritage BOOLEAN DEFAULT FALSE,
    CONSTRAINT attraction_city_fk FOREIGN KEY (city, country, province) 
        REFERENCES city(name, country, province)
);

-- ----------------------------------------------------------------------------
-- Attraction Other Names (for alternative/historical names)
-- ----------------------------------------------------------------------------
CREATE TABLE attraction_othername (
    attraction_id INTEGER REFERENCES attraction(id),
    othername VARCHAR(200) NOT NULL,
    language VARCHAR(50),
    CONSTRAINT attraction_othername_key PRIMARY KEY (attraction_id, othername)
);

-- ----------------------------------------------------------------------------
-- Attraction Tags (for flexible categorization)
-- ----------------------------------------------------------------------------
CREATE TABLE attraction_tag (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE attraction_has_tag (
    attraction_id INTEGER REFERENCES attraction(id),
    tag_id INTEGER REFERENCES attraction_tag(id),
    CONSTRAINT attraction_tag_key PRIMARY KEY (attraction_id, tag_id)
);

-- ----------------------------------------------------------------------------
-- Indexes for better query performance
-- ----------------------------------------------------------------------------
CREATE INDEX idx_attraction_city ON attraction(city, country, province);
CREATE INDEX idx_attraction_category ON attraction(category_id);
CREATE INDEX idx_attraction_country ON attraction(country);

-- ----------------------------------------------------------------------------
-- Grant permissions to mondialuser
-- ----------------------------------------------------------------------------
GRANT ALL PRIVILEGES ON TABLE attraction_category TO mondialuser;
GRANT ALL PRIVILEGES ON TABLE attraction TO mondialuser;
GRANT ALL PRIVILEGES ON TABLE attraction_othername TO mondialuser;
GRANT ALL PRIVILEGES ON TABLE attraction_tag TO mondialuser;
GRANT ALL PRIVILEGES ON TABLE attraction_has_tag TO mondialuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO mondialuser;
