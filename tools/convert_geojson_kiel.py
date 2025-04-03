import os
import click
import json
import psycopg2

from pathlib import Path
from dotenv import load_dotenv
from shapely.geometry import Point, shape
from shapely import wkb
from psycopg2.errors import UniqueViolation


env_path = Path('../.env')
load_dotenv(dotenv_path=env_path)


try:
    conn = psycopg2.connect(
        database=os.getenv('DB_NAME'),
        password=os.getenv('DB_PASS'),
        user=os.getenv('DB_USER'),
        host=os.getenv('DB_HOST'),
        port=os.getenv('DB_PORT')
    )
    conn.autocommit = True
except Exception as e:
    raise


def retrieve_features(cur, features):
    for feature in features:
        properties = feature['properties']

        insert_object(cur, properties, feature['geometry'])


def check_property(properties, key):
    if key in properties and properties[key]:
        value = properties[key]
    else:
        value = None

    return value


def insert_object(cur, properties, geometry):
    object_id = check_property(properties, 'OBJECTID')
    tree_species = check_property(properties, 'Baumart__bot._')
    crown_diameter = check_property(properties, 'Kronendurchmesser__m_')
    tree_type = check_property(properties, 'Baumart')

    g = Point(shape(geometry))
    wkb_geometry = wkb.dumps(g, hex=True, srid=4326)

    sql = '''
        INSERT INTO tree_inventory (object_id, hochwert, rechtswert,
        tree_type, tree_species, trunk_diameter, crown_diameter,
        total_height, felling_year, plant_year, place, wkb_geometry) 
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    '''

    try:
        cur.execute(sql, (
            object_id, None, None, tree_type,
            tree_species, None, crown_diameter, None,
            None, None, None, wkb_geometry
        ))
    except UniqueViolation as e:
        print(e)
        return


@click.command()
@click.option('--src', '-s', type=click.Path(exists=True), required=True, help='Path to the source GeoJSON file')
def main(src):
    cur = conn.cursor()

    with open(Path(src), 'r') as f:
        features = json.loads(f.read())['features']

    retrieve_features(cur, features)


if __name__ == '__main__':
    main()
