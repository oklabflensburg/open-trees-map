#!./venv/bin/python

import os
import csv
import psycopg2
import click

from pathlib import Path
from datetime import datetime
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


def update_inventory(cur, felling_year, inventory_id):
    sql = 'UPDATE tree_inventory SET felling_year = %s WHERE id = %s'
    
    try:
        cur.execute(sql, (felling_year, inventory_id))
    except (Exception, psycopg2.DatabaseError) as e:
        print(e)


def read_csv(src):
    rows = []

    with open(Path(src), newline='') as csvfile:
        reader = csv.reader(csvfile, quotechar='"', delimiter=',')

        try:
            next(reader)
        except StopIteration as e:
            pass

        for row in reader:
            x = float(row[0].replace(',', '.'))
            y = float(row[1].replace(',', '.'))
            c = [x, y]

            rows.append(c)

    return rows


@click.command()
@click.argument('src')
def main(src):
    fellings = read_csv(src)
    cur = conn.cursor()

    cur.execute('SELECT id, hochwert, rechtswert FROM tree_inventory')

    rows = cur.fetchall()

    for row in rows:
        for felling in fellings:
            if abs(float(row[2]) - felling[0]) < 0.1 and abs(float(row[1]) - felling[1]) < 0.1:
                year = datetime.now().year
                update_inventory(cur, row[0], year)
                print(row[0])


if __name__ == '__main__':
    main()
