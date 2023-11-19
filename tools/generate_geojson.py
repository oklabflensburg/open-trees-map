#!./venv/bin/python

import csv
import json
import click

from geojson import FeatureCollection, Feature, Point
from pyproj import Transformer


def convert_projection(x, y):
    transformer = Transformer.from_crs('EPSG:25832', 'EPSG:4326')

    n = transformer.transform(x, y)

    return n


@click.command()
@click.argument('file')
def read_dataset(file):
    with open(file, newline='') as csvfile:
        reader = csv.reader(csvfile, delimiter=';')
        next(reader)

        data = list(reader)
        
    make_geojson(file, data)


def make_geojson(file, d):
    fc = []

    crs = {
        'type': 'name',
        'properties': {
            'name': 'urn:ogc:def:crs:OGC:1.3:CRS84'
        }
    }

    for o in d:
        x = float(o[3].replace(',', '.'))
        y = float(o[4].replace(',', '.'))
        c = convert_projection(x, y)

        point = Point((float(c[1]), float(c[0])))
            
        properties = {
            'id': o[0],
            'place': o[1],
            'type': o[5],
            'model': o[6],
            'tribs': o[7],
            'crown': o[11],
            'plant': o[10],
            'scope': o[8],
            'scopes': o[9],
            'height': o[12]
        }

        fc.append(Feature(geometry=point, properties=properties))

    c = FeatureCollection(fc, crs=crs)

    with open(f'{file.split(".")[0]}.geojson', 'w') as f:
        json.dump(c, f, ensure_ascii=False)



def main():
    read_dataset()


if __name__ == '__main__':
    main()
