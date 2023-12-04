#!./venv/bin/python

import re
import csv
import click
import json

from pathlib import Path
from geojson import FeatureCollection, Feature, Point



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


def make_geojson(file_path, object_id, tree_type, tree_species, trunk_diameter, crown_diameter, total_height, plant_year, location, json_data):
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
        print(tree_species_string)

        properties = {
            'object_id': o['properties'][object_id] if object_id in o['properties'] else idx,
            'tree_type': o['properties'][tree_type] if tree_type in o['properties'] else '',
            'tree_species': tree_species_string,
            'trunk_diameter': o['properties'][trunk_diameter] if trunk_diameter in o['properties'] else '',
            'crown_diameter': o['properties'][crown_diameter] if crown_diameter in o['properties'] else '',
            'total_height': o['properties'][total_height] if total_height in o['properties'] else '',
            'plant_year': o['properties'][plant_year] if plant_year in o['properties'] else '',
            'location': o['properties'][location] if location in o['properties'] else ''
        }

        fc.append(Feature(geometry=point, properties=properties))

    c = FeatureCollection(fc, name=file_name.replace('_', '-'), crs=crs)

    with open(dst, 'w') as f:
        json.dump(c, f, ensure_ascii=False)


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
                detected.append(feature)

    print(len(detected))


if __name__ == '__main__':
    main()
