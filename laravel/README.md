# pwd open-trees-map/

# step 1 (from /laravel) 
composer install

# step 2
npm install

# step 3 : link storage 
php artisan storage:link

# step 4 : from root create these symbolic link
ln -s ../../../../static/marker-* ./laravel/storage/app/public/
ln -s ../../../../data/*.geojson ./laravel/storage/app/public/

# step 5 : copy/rename .env file
cp .env.example .env

# step 6 : create artisan key
php artisan key:generate

# step 7 (from /laravel)
npm run build

# step 8 : start artisan
php artisan serve

