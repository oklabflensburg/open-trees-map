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


def insert_object(cur, properties, geometry):
    object_id = properties['object_id'] if properties['object_id'] else None
    tree_type = properties['tree_type'] if properties['tree_type'] else None
    tree_species = properties['tree_species'] if properties['tree_species'] else None
    trunk_diameter = properties['trunk_diameter'] if properties['trunk_diameter'] else None
    crown_diameter = properties['crown_diameter'] if properties['crown_diameter'] else None
    total_height = properties['total_height'] if properties['total_height'] else None
    plant_year = properties['plant_year'] if properties['plant_year'] else None
    location = properties['location'] if properties['location'] else None

    g = Point(shape(geometry))
    wkb_geometry = wkb.dumps(g, hex=True, srid=4326)

    sql = '''
        INSERT INTO tree_inventory (object_id, tree_type, tree_species, trunk_diameter,
        crown_diameter, total_height, plant_year, location, wkb_geometry)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s) ON CONFLICT DO NOTHING RETURNING id
    '''

    try:
        cur.execute(sql, (object_id, tree_type, tree_species, trunk_diameter,
            crown_diameter, total_height, plant_year, location, wkb_geometry))
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
