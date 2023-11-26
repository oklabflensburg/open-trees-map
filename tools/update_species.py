#!./venv/bin/python

import os
import psycopg2

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


def update_inventory(cur, skey, inventory_id):
    sql = 'UPDATE tree_inventory SET skey = %s WHERE id = %s'
    
    try:
        cur.execute(sql, (skey, inventory_id))
    except (Exception, psycopg2.DatabaseError) as e:
        print(e)


def main():
    cur = conn.cursor()

    cur.execute('''
        SELECT ts.id, ti.id
        FROM tree_inventory AS ti
        JOIN tree_species AS ts
        ON LOWER(ts.species_latin) = LOWER(ti.tree_species)
    ''')

    rows = cur.fetchall()

    for row in rows:
        update_inventory(cur, row[0], row[1])
        print(row)


if __name__ == '__main__':
    main()
