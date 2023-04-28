#!./venv/bin/python

import csv
import click

from pyproj import Transformer


def convert_projection(x, y):
    transformer = Transformer.from_crs('EPSG:25832', 'EPSG:4326')

    n = transformer.transform(x, y)

    print(n)


def write_dataset(file, row):
    with open(f'{file.split(".")[0]}.parsed.csv', 'a', newline='') as csvfile:
        writer = csv.writer(csvfile, delimiter=';', quotechar='"', quoting=csv.QUOTE_ALL)
        writer.writerow(row)


@click.command()
@click.argument('file')
def read_dataset(file):
    with open(file, newline='') as csvfile:
        reader = csv.reader(csvfile, delimiter=';')
        next(reader)
        
        counter = 1
        
        for row in reader:
            x = float(row[3].replace(',', '.'))
            y = float(row[4].replace(',', '.'))
            # convert_projection(x, y)

            if len(row) == 0:
                counter = counter + 1
            else:
                row.append(str(f'{counter:02}'))
                write_dataset(file, row)


if __name__ == '__main__':
    read_dataset()
