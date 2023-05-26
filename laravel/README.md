# pwd open-trees-map/
composer install/update
npm install
npm run dev/prod
ln -s static/marker-* ./laravel/storage/app/public/
ln -s data/*.geojson ./laravel/storage/app/public/
