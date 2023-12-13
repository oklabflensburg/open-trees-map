#!./venv/bin/python

import os
import click
import psycopg2
import csv

from pathlib import Path
from dotenv import load_dotenv


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


def update_inventory(cur, inventory_id, topology):
    sql = 'UPDATE tree_inventory SET topology = %s WHERE id = %s'
    
    try:
        cur.execute(sql, (topology, inventory_id))
    except (Exception, psycopg2.DatabaseError) as e:
        print(e)


@click.command()
@click.argument('src')
def main(src):
    cur = conn.cursor()

    with open(src, newline='') as f:
        reader = csv.reader(f, delimiter=',')

        for idx, row in enumerate(reader):
            print(idx + 1)
            update_inventory(cur, idx + 1, round(float(row[0]), 2))


if __name__ == '__main__':
    main()
