#!./venv/bin/python

import csv
import click

from pathlib import Path
from osgeo import osr



def transform_projection(x, y, in_epsg, out_epsg):
    in_proj = osr.SpatialReference()
    in_proj.ImportFromEPSG(in_epsg)

    out_proj = osr.SpatialReference()
    out_proj.ImportFromEPSG(out_epsg)

    transformation = osr.CoordinateTransformation(in_proj, out_proj)
    n = transformation.TransformPoint(x, y)

    return n


def write_dataset(file, row):
    with open(f'{file.split(".")[0]}.parsed.csv', 'a', newline='') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)
        writer.writerow(row)


@click.command()
@click.argument('src')
@click.argument('in_epsg', type=int)
@click.argument('out_epsg', type=int)
def main(src, in_epsg, out_epsg):
    with open(Path(src), newline='') as csvfile:
        reader = csv.reader(csvfile, quotechar='"', delimiter=',')
        next(reader)
        
        for row in reader:
            x = float(row[3].replace(',', '.'))
            y = float(row[4].replace(',', '.'))
            
            n = transform_projection(x, y, in_epsg, out_epsg)
            c = [n[0], n[1]]

            print(c)


if __name__ == '__main__':
    main()
