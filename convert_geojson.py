#!./venv/bin/python

import json
import click

from geojson import FeatureCollection, Feature, Point


@click.command()
@click.argument('file')
def read_dataset(file):
    with open(file, 'r') as jsonfile:
        data = json.loads(jsonfile.read())

    make_geojson(file, data)


def make_geojson(file, d):
    f = f'{file.split(".")[0]}'
    fc = []

    crs = {
        'type': 'name',
        'properties': {
            'name': 'urn:ogc:def:crs:OGC:1.3:CRS84'
        }
    }

    for o in d['features']:
        point = Point((float(o['geometry']['coordinates'][0]), float(o['geometry']['coordinates'][1])))

        properties = {
            'id': o['properties']['id'],
            'place': o['properties']['place'],
            'type': o['properties']['type'],
            'model': '',
            'tribs': '',
            'crown': '',
            'plant': 2020 - int(o['properties']['age']),
            'scope': '',
            'scopes': '',
            'height': ''
        }

        fc.append(Feature(geometry=point, properties=properties))

    c = FeatureCollection(fc, name=f'{f.split("/")[1]}', crs=crs)

    with open(f'{f}.updated.geojson', 'w') as f:
        json.dump(c, f, ensure_ascii=False)


def main():
    read_dataset()


if __name__ == '__main__':
    main()
