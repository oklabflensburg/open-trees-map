#!./venv/bin/python

import os
import psycopg2

from os.path import join, dirname
from dotenv import load_dotenv


dotenv_path = join(f'{dirname(__file__)}/rest', '.env')
load_dotenv(dotenv_path)  

                                                                                
conn = psycopg2.connect(                                                  
    database = os.getenv('DB_NAME'),
    password = os.getenv('DB_PASS'),
    user = os.getenv('DB_USER'),
    host = os.getenv('DB_HOST'),
    port = os.getenv('DB_PORT')
)


def update_species(cur, tkey, tspecies):
    sql = 'UPDATE baumkataster_gelsenkirchen AS t SET tkey = %s WHERE t.type = %s'''
    
    updated_rows = 0
    
    try:
        cur.execute(sql, (tkey, tspecies))
        updated_rows = cur.rowcount
        conn.commit()
        # cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)

    print(f'updated: {updated_rows}\n')


def main():
    cur = conn.cursor()

    cur.execute('''
                SELECT t.type, s.skey FROM baumkataster_gelsenkirchen AS t
                JOIN tree_species AS s
                ON s.species_latin = t.type
                GROUP BY t.type, s.skey
    ''')

    rows = cur.fetchall()

    for row in rows:
        print(row)

        update_species(cur, row[1], row[0])

if __name__ == '__main__':
    main()
