#!../venv/bin/python

from fastapi import FastAPI
from pydantic import BaseSettings
from psycopg2.extras import RealDictCursor

import psycopg2


class Settings(BaseSettings):
    app_name: str = 'Open trees map'
    admin_email: str
    db_host: str
    db_user: str
    db_name: str
    db_port: int
    db_pass: str

    class Config:
        env_file = '.env'

app = FastAPI()
setting = Settings()


conn = psycopg2.connect(
    host = setting.db_host,
    port = setting.db_port,
    dbname = setting.db_name,
    password = setting.db_pass,
    user = setting.db_user
)

conn.set_session(readonly = True)
cur = conn.cursor(cursor_factory=RealDictCursor)


@app.get('/v1/query/{query_string}')
async def tree_species_results(query_string: str = None):
    # Note: for testing purposes f-strings or string concatenation are fine but never to be used in production!
    # Always use parametrized queries instead!


    db_query = '''
    SELECT *
    FROM tree_species AS s
    JOIN baumkataster_gelsenkirchen AS k
    ON k.tkey = s.skey
    WHERE LOWER(s.species_latin) = %(query_string)s
    OR LOWER(s.species_german) = %(query_string)s
    '''

    cur.execute(db_query, {'query_string': query_string.lower()})

    results = cur.fetchall()

    if len(results) > 0:
        return results[0]
    else:
        return {}
