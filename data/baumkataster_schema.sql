-- POSTGIS ERWEITERUNG LADEN
CREATE EXTENSION IF NOT EXISTS postgis;


-- TABELLE BAUMKATASTER
DROP TABLE IF EXISTS tree_inventory CASCADE;

CREATE TABLE IF NOT EXISTS tree_inventory (
  id INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  species_id INT REFERENCES tree_inventory (id),
  district_id INT REFERENCES districts (id),
  object_id INT,
  hochwert NUMERIC,
  rechtswert NUMERIC,
  topology NUMERIC,
  tree_type VARCHAR,
  tree_species VARCHAR,
  trunk_diameter NUMERIC,
  crown_diameter NUMERIC,
  total_height NUMERIC,
  felling_year INT,
  plant_year INT,
  place VARCHAR,
  wkb_geometry GEOMETRY(GEOMETRY, 4326)
);

CREATE INDEX IF NOT EXISTS tree_inventory_object_id_idx ON tree_inventory (object_id);
CREATE INDEX IF NOT EXISTS tree_inventory_wkb_geometry_idx ON tree_inventory USING GIST (wkb_geometry);



-- HILFSTABELLE BOTANISCHE NAMEN
DROP TABLE IF EXISTS tree_species CASCADE;

CREATE TABLE IF NOT EXISTS tree_species (
  id INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  species_latin VARCHAR NOT NULL,
  species_german VARCHAR NOT NULL,
  wikipedia_url VARCHAR
);

CREATE UNIQUE INDEX IF NOT EXISTS tree_species_species_latin_idx ON tree_species (species_latin);
