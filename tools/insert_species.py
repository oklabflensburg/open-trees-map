#!./venv/bin/python

import os
import click
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


def insert_object(cur, species_latin, species_german):
    sql = 'INSERT INTO tree_species (species_latin, species_german) VALUES (%s, %s)'

    try:
        cur.execute(sql, (species_latin, species_german))
    except UniqueViolation as e:
        print(e)


@click.command()
@click.argument('file')
def main(file):
    cur = conn.cursor()

    with open(file, newline='') as csvfile:
        reader = csv.reader(csvfile, delimiter=',')
        next(reader)
    
        for row in reader:
            insert_object(cur, row[0], row[1])


if __name__ == '__main__':
    main()
