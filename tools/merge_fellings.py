#!./venv/bin/python

import re
import csv
import click
import json

from geojson import FeatureCollection, Feature, Point
from datetime import datetime
from pathlib import Path



def read_csv(src):
    rows = []

    with open(Path(src), newline='') as csvfile:
        reader = csv.reader(csvfile, quotechar='"', delimiter=',')

        try:
            next(reader)
        except StopIteration as e:
            pass

        for row in reader:
            x = float(row[3].replace(',', '.'))
            y = float(row[4].replace(',', '.'))
            c = [x, y]

            rows.append(c)

    return rows


def read_json(src):
    with open(Path(src), 'r') as f:
        data = json.loads(f.read())

        return data


def write_json(dst, data):
    with open(Path(dst), 'w') as f:
        json.dump(data, f, ensure_ascii=False)


@click.command()
@click.argument('src_fellings')
@click.argument('src_inventory')
def main(src_fellings, src_inventory):
    fellings = read_csv(src_fellings)
    inventory = read_json(src_inventory)

    detected = []

    for feature in inventory['features']:
        hochwert = feature['properties']['hochwert']
        rechtswert = feature['properties']['rechtswert']

        for row in fellings:
            if hochwert == row[0] and rechtswert == row[1]:
                iso_date = datetime.now().replace(microsecond=0).isoformat()
                feature['properties']['felling_date'] = iso_date
                detected.append(feature)

    write_json(src_inventory, inventory)


if __name__ == '__main__':
    main()
