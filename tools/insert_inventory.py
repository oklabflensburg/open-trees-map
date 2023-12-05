#!./venv/bin/python

import os
import click
import psycopg2
import json

from shapely import wkb
from psycopg2 import ProgrammingError
from psycopg2.errors import UniqueViolation, NotNullViolation
from shapely.geometry import shape, Point
from dotenv import load_dotenv
from pathlib import Path


env_path = Path('../.env')
load_dotenv(dotenv_path=env_path)


try:
    conn = psycopg2.connect(
        database = os.getenv('DB_NAME'),
        password = os.getenv('DB_PASS'),
        user = os.getenv('DB_USER'),
        host = os.getenv('DB_HOST'),
        port = os.getenv('DB_PORT')
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
    object_id = check_property(properties, 'object_id')
    tree_type = check_property(properties, 'tree_type')
    tree_species = check_property(properties, 'tree_species')
    trunk_diameter = check_property(properties, 'trunk_diameter')
    crown_diameter = check_property(properties, 'crown_diameter')
    total_height = check_property(properties, 'total_height')
    felling_year = check_property(properties, 'felling_year')
    plant_year = check_property(properties, 'plant_year')
    place = check_property(properties, 'place')

    g = Point(shape(geometry))
    wkb_geometry = wkb.dumps(g, hex=True, srid=4326)

    sql = '''
        INSERT INTO tree_inventory (object_id, tree_type, tree_species, trunk_diameter,
        crown_diameter, total_height, felling_year, plant_year, place, wkb_geometry)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    '''

    try:
        cur.execute(sql, (object_id, tree_type, tree_species, trunk_diameter,
            crown_diameter, total_height, felling_year, plant_year, place, wkb_geometry))
    except UniqueViolation as e:
        print(e)
        return


@click.command()
@click.argument('file')
def main(file):
    cur = conn.cursor()

    with open(Path(file), 'r') as f:
        features = json.loads(f.read())['features']

    retrieve_features(cur, features)


if __name__ == '__main__':
    main()
