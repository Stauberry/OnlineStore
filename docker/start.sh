# shellcheck disable=SC1046
# shellcheck disable=SC1073
# shellcheck disable=SC1035
# shellcheck disable=SC1019
# shellcheck disable=SC1072
# shellcheck disable=SC1020
# shellcheck disable=SC1009


if [ ! -f .env ]; then
  composer install
  composer create-project --prefer-dist laravel/laravel ./
  cp ../.env ./
  cp ../.gitignore ./
  php artisan key:generate
  chown -R www-data:www-data storage
  chown -R www-data:www-data bootstrap/cache
  chmod -R 775 storage
  chmod -R 755 bootstrap/cache
  php artisan migrate
fi

php artisan optimize //скидывает любой кэш, конфиги. все подчищает
php artisan migrate:fresh --seed //перед выполнением каждой задачи выполнять эту команду, удаляет все остальные миграции, делает дроп дб, чистит локальную дб, закатывает все миграции заново и устанавливает все сиды что есть как итог у нас чистая бд с наполненными данными
php artisan route:cache // когда добавляем новые роуты
php artisan route:clear // когда добавляем новые роуты?
php artisan make:model UserInfo -m //создали и модель и маграция автоматически
php artisan make:model UserInfo -m -c //создали и модель и маграция и контроллер автоматически
php artisan make:controller HomeController //создаем контроллер
php artisan make:migration create_name_name // создаем миграцию
php artisan migrate
php artisan migrate:rollback //откатываем последнюю миграцию, но если уже в проде то уже все\(
php artisan make:migration add_user_info //миграция на добавление столбца

//через терминал смотрим database и там все таблицы
show databases;
use laravel;
show TABLES;

composer update
php-fpm
