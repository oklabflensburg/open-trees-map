# Baumkataster Flensburg

Interaktive webbasierte Baumkataster Karten basierend auf Daten des TBZ Flensburg


![Screenshot Baumkataster Karte](https://raw.githubusercontent.com/oklabflensburg/open-trees-map/main/baumkataster_stadt_flensburg.png)


## Haftungsausschluss
Das OK Lab Flensburg hostet die zum Download bereitgestellten Daten des TBZ Flensburg ohne inhaltliche Änderung als Feature Service über über die Webseite [https://baumkataster-flensburg.de](https://baumkataster-flensburg.de) für Analysen zur Verfügung. Alle Daten werden ungeprüft und ohne Gewähr auf deren Genauigkeit zur Verfügung gestellt. Das OK Lab Flensburg übernimmt hierfür keinerlei Haftung und Gewähr.


## Prerequisite

```
sudo apt install python3.10 virtualenv git
git clone https://github.com/oklabflensburg/open-trees-map.git
cd open-trees-map
virtualenv venv
. venv/bin/activate
pip install -r requirements.txt
```


## Datenquelle

- https://opendata.schleswig-holstein.de/dataset/baumkataster-flensburg-2023-05-11


## Import GeoJSON

```
ogr2ogr -f "PostgreSQL" PG:"dbname=database user=username password=password" "data/baumkataster_flensburg.geojson" -nln baumkataster_flensburg -overwrite
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
COPY (SELECT type FROM baumkataster WHERE tkey IS NULL GROUP BY type) TO 'data/unknown_species.csv' WITH DELIMITER ',' CSV HEADER;
sudo chown user:user data/unknown_species.csv
```


## Dump Baumarten

```
pg_dump -h localhost -p 5432 -U postgis_user -d postgis_db -t tree_species > tree_species.sql
```
