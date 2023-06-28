
# Installation
apt install postgresql

## Version prüfen
## X = postgresql Version
apt search postgresql-X | grep postgis

sudo apt install postgresql-X-postgis-3


# Mit Datenbank verbinden
sudo -i -u postgres
psql

# DB anlegen und postgis aktivieren
CREATE DATABASE laravel;
\connect laravel;
CREATE EXTENSION postgis;
exit

