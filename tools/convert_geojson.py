#!./venv/bin/python

import re
import click
import json

from pathlib import Path
from datetime import datetime
from geojson import FeatureCollection, Feature, Point


@click.command()
@click.argument('file_path')
@click.argument('object_id')
@click.argument('tree_type')
@click.argument('tree_species')
@click.argument('trunk_diameter')
@click.argument('crown_diameter')
@click.argument('total_height')
@click.argument('plant_year')
@click.argument('place')
def read_dataset(file_path, object_id, tree_type, tree_species, trunk_diameter, crown_diameter, total_height, plant_year, place):
    with open(Path(file_path), 'r') as f:
        json_data = json.loads(f.read())

    make_geojson(file_path, object_id, tree_type, tree_species, trunk_diameter, crown_diameter, total_height, plant_year, place, json_data)


def make_geojson(file_path, object_id, tree_type, tree_species, trunk_diameter, crown_diameter, total_height, plant_year, place, json_data):
    file_name = Path(file_path).stem
    parent_path = Path(file_path).parent
    dst = f'{parent_path}/{file_name}.updated.geojson'

    fc = []

    crs = {
        'type': 'name',
        'properties': {
            'name': 'urn:ogc:def:crs:OGC:1.3:CRS84'
        }
    }

    for idx, o in enumerate(json_data['features']):
        point = Point((float(o['geometry']['coordinates'][0]), float(o['geometry']['coordinates'][1])))
        tree_species_cleaned = o['properties'][tree_species].split(',')[0] if tree_species in o['properties'] else ''
        tree_species_string = re.sub(r'\s+', ' ', tree_species_cleaned.strip())

        properties = {
            'object_id': o['properties'][object_id] if object_id in o['properties'] else idx,
            'tree_species': tree_species_string,
        }

        if 'district_id' in o['properties']:
            properties['district_id'] = o['properties']['district_id']

        if trunk_diameter in o['properties']:
            properties['trunk_diameter'] = o['properties'][trunk_diameter]

        if crown_diameter in o['properties']:
            properties['crown_diameter'] = o['properties'][crown_diameter]

        if total_height in o['properties']:
            properties['total_height'] = o['properties'][total_height]

        if plant_year in o['properties']:
            properties['plant_year'] = o['properties'][plant_year]

        if place in o['properties']:
            properties['place'] = o['properties'][place]

        if tree_type in o['properties']:
            properties['tree_type'] = o['properties'][tree_type]

        if 'felling_date' in o['properties']:
            isodate = datetime.fromisoformat(o['properties']['felling_date'])
            properties['felling_year'] = int(isodate.strftime('%Y'))

        fc.append(Feature(geometry=point, properties=properties))

    c = FeatureCollection(fc, name=file_name.replace('_', '-'), crs=crs)

    with open(dst, 'w') as f:
        json.dump(c, f, ensure_ascii=False)


def main():
    read_dataset()


if __name__ == '__main__':
    main()
