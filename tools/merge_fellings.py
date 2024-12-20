#!./venv/bin/python

import os
import re
import csv
import psycopg2
import click
import json

from dotenv import load_dotenv
from geojson import FeatureCollection, Feature, Point
from datetime import datetime
from pathlib import Path


dotenv_path = Path('../.env')
load_dotenv(dotenv_path)  

    
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


def read_json(src):
    with open(Path(src), 'r') as f:
        data = json.loads(f.read())

        return data


def write_json(dst, data):
    with open(Path(dst), 'w') as f:
        json.dump(data, f, ensure_ascii=False)


@click.command()
@click.argument('src')
def main(src):
    inventory = read_json(src)
    cur = conn.cursor()

    detected = []

    cur.execute('SELECT id, felling_year FROM tree_inventory WHERE felling_year IS NOT NULL')

    rows = cur.fetchall()

    for row in rows:
        inventory['features'][row[0] - 1]['properties']['felling_year'] = row[1]

    write_json(src, inventory)


if __name__ == '__main__':
    main()
