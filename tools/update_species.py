#!./venv/bin/python

import os
import psycopg2

from pathlib import Path
from dotenv import load_dotenv


dotenv_path = Path('../rest/.env')
load_dotenv(dotenv_path)  

                                                                                
conn = psycopg2.connect(                                                  
    database = os.getenv('DB_NAME'),
    password = os.getenv('DB_PASS'),
    user = os.getenv('DB_USER'),
    host = os.getenv('DB_HOST'),
    port = os.getenv('DB_PORT')
)


def update_species(cur, skey, tspecies):
    sql = 'UPDATE tree_inventory AS ti SET skey = %s WHERE ti.tree_species = %s'
    
    updated_rows = 0
    
    try:
        cur.execute(sql, (skey, tspecies))
        updated_rows = cur.rowcount
        conn.commit()
        # cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)

    print(f'updated: {updated_rows}\n')


def main():
    cur = conn.cursor()

    cur.execute('''
        SELECT ts.pkey, ts.species_latin
        FROM tree_inventory AS ti
        JOIN tree_species AS ts
        ON ts.species_german = ti.tree_species
    ''')

    rows = cur.fetchall()

    for row in rows:
        print(row)

        update_species(cur, row[0], row[1])


if __name__ == '__main__':
    main()
