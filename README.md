# Baumkataster Karten

Interaktive webbasierte Baumkataster Karten basierend auf Opendata 


![Screenshot Baumkataster Karte](https://raw.githubusercontent.com/oklabflensburg/open-trees-map/main/baumkataster_gelsenkirchen.png)


## Prerequisite

```
sudo apt install python3.10 virtualenv git
git clone https://github.com/oklabflensburg/open-trees-map.git
cd open-trees-map
virtualenv venv
. venv/bin/activate
pip install -r requirements.txt
```


## Datasources

- https://opendata.gelsenkirchen.de/sites/default/files/baumkataster_ge.csv


## Import GeoJSON

```
ogr2ogr -f "PostgreSQL" PG:"dbname=postgis_db user=postgis_user password=postgis_password" "data/baumkataster_gelsenkirchen.geojson" -nln baumkataster_gelsenkirchen -overwrite
```


## Import Baumarten

```
create table tree_species (pkey SERIAL PRIMARY KEY, species_latin varchar, species_german varchar);
COPY tree_species(species_german, species_latin) FROM 'data/tree_species.csv' DELIMITERS ',' CSV HEADER;
```


## Export Baumarten

```
GRANT USAGE ON SCHEMA public TO postgis_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO postgis_user;
GRANT USAGE, SELECT ON SEQUENCE tree_species_pkey_seq TO postgis_user;

sudo chown user:postgres data/unknown_species.csv
COPY (SELECT type FROM baumkataster_gelsenkirchen WHERE tkey IS NULL GROUP BY type) TO 'data/unknown_species.csv' WITH DELIMITER ',' CSV HEADER;
sudo chown user:user data/unknown_species.csv
```


## Dump Baumarten

```
pg_dump -h localhost -p 5432 -U postgis_user -d postgis_db -t tree_species > tree_species.sql
```
