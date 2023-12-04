# Baumkataster Flensburg

Interaktive webbasierte Baumkataster Karten basierend auf Daten des TBZ Flensburg


![Screenshot Baumkataster Karte](https://raw.githubusercontent.com/oklabflensburg/open-trees-map/main/baumkataster_stadt_flensburg.png)


## Haftungsausschluss

_Das OK Lab Flensburg hostet die zum Download bereitgestellten Daten des TBZ Flensburg ohne inhaltliche Änderung als Feature Service über über die Webseite [https://baumkataster-flensburg.de](https://baumkataster-flensburg.de) und stellt diese auf einer interaktiven Karte für Analysen zur Verfügung. Alle Daten werden ungeprüft und ohne Gewähr auf deren Genauigkeit zur Verfügung gestellt. Das OK Lab Flensburg übernimmt hierfür keinerlei Haftung und Gewähr._



## Datenquelle

- https://opendata.schleswig-holstein.de/dataset/baumkataster-flensburg-2023-05-11



## Prerequisite

Install system dependencies and clone repository

```
sudo apt install git git-lfs virtualenv python3 python3-pip postgresql-15 postgresql-15-postgis-3 postgis
git clone https://github.com/oklabflensburg/open-trees-map.git
```

Create dot `.env` file inside root directory. Make sure to add the following content repaced by your actual values

```
DB_PASS=postgres
DB_HOST=localhost
DB_USER=postgres
DB_NAME=postgres
DB_PORT=5432
```


## Update repository

```
git pull
git lfs pull
```


## Create SQL schema

Run sql statements inside `open-trees-map` root directory

```
sudo -i -Hu postgres psql -U postgres -h localhost -d postgres -p 5432 < data/baumkataster_schema.sql
```



## Transform projection

Notice, this must only be done when felling of trees dataset added

> Note, calling `transform_epsg.py` has three parameters, first is the source second the source projection EPSG number and last the destination EPSG number. Make sure to verify that your EPSG number are the correct one.

```
cd tools
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
python transform_epsg.py ../data/baumfaellungen_flensburg_2023.csv 31467 4326
deactivate
```


## Convert latest Geojson

Notice, this must only be done when updating dataset

```
cd tools
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
python convert_geojson.py ../data/baumkataster_flensburg.geojson OBJECT_ID TREE_TYPE type TRUNK_DIAMETER CROWN_DIAMETER TOTAL_HEIGHT PLANT_YEAR place
deactivate
```


## Import inventory

Required when you want to fetch data via API

```
cd tools
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
python insert_species.py ../data/tree_species.csv
python insert_inventory.py ../data/baumkataster_flensburg.updated.geojson
python update_species.py
deactivate
```


## Example statistics

Show how many trees are from the same species

```sql
SELECT
    ts.species_german,
    ti.tree_species,
    COUNT(*) AS amount
FROM
    tree_inventory AS ti
LEFT JOIN
    tree_species AS ts ON ts.species_latin = ti.tree_species
GROUP BY
    ti.tree_species,
    ts.species_german
ORDER BY
    amount DESC;
```


## Export Baumarten

```
GRANT USAGE ON SCHEMA public TO postgres;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO postgres;
GRANT USAGE, SELECT ON SEQUENCE tree_species_pkey_seq TO postgres;

sudo chown user:postgres data/unknown_species.csv
COPY (SELECT type FROM baumkataster WHERE tkey IS NULL GROUP BY type) TO 'data/unknown_species.csv' WITH DELIMITER ',' CSV HEADER;
sudo chown user:user data/unknown_species.csv
```


## Dump Baumarten

```
pg_dump -h localhost -p 5432 -U postgres -d postgis_db -t tree_species > tree_species.sql
```


## TODO

- Remove duplicates from `data/tree_species.csv`
