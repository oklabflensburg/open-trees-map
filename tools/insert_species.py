#!./venv/bin/python

import os
import json
import click
import httpx
import psycopg2
import csv

from psycopg2 import ProgrammingError
from psycopg2.errors import UniqueViolation, NotNullViolation
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


def insert_object(cur, species_latin, species_german, wikipedia_url):
    sql = 'INSERT INTO tree_species (species_latin, species_german, wikipedia_url) VALUES (%s, %s, %s)'

    try:
        cur.execute(sql, (species_latin, species_german, wikipedia_url))
    except UniqueViolation as e:
        print(e)


def request_content(url):
    r = httpx.get(url, timeout=2)

    if r.status_code != 200:
        return None

    return r.text


def query_wikipedia(species):
    url = f'https://de.wikipedia.org/w/api.php?action=query&format=json&prop=info&redirects&inprop=url&titles={species}'

    r = request_content(url)
    c = json.loads(r)

    return c



@click.command()
@click.argument('src')
def main(src):
    cur = conn.cursor()

    with open(src, newline='') as f:
        reader = csv.reader(f, delimiter=',')
        next(reader)
    
        for row in reader:
            c = query_wikipedia(row[0])
            page_id = int(next(iter(c['query']['pages'])))

            if not page_id > 0:
                wikipedia_url = None
            else:
                wikipedia_url = c['query']['pages'][str(page_id)]['fullurl']

            insert_object(cur, row[0], row[1], wikipedia_url)


if __name__ == '__main__':
    main()
