up:
	docker-compose up -d

down:
	docker-compose down

frontend-bash:
	docker-compose exec frontend-nodejs bash

frontend-install:
	docker-compose exec frontend-nodejs npm install

frontend-build:
	docker-compose exec frontend-nodejs npm run build

frontend-watch:
	docker-compose exec frontend-nodejs npm run watch

perm:
	sudo chown ${USER}:${USER} api/bootstrap/cache -R
	sudo chown ${USER}:${USER} api/storage -R
	sudo chown ${USER}:${USER} api/storage/logs -R
	sudo chown ${USER}:${USER} api/app/ -R
	sudo chown ${USER}:${USER} api/config/ -R
	sudo chown ${USER}:${USER} api/database/ -R
	sudo chown ${USER}:${USER} api/tests/ -R
	sudo chown ${USER}:${USER} api/resources/ -R
	sudo chown ${USER}:${USER} api/public/ -R

test:
	docker-compose exec api-php-fpm vendor/bin/phpunit --colors=always

bash:
	docker-compose exec api-php-fpm bash

ci:
	docker-compose exec api-php-fpm composer install

diff:
	docker-compose exec api-php-fpm php artisan doctrine:migrations:diff

migrate:
	docker-compose exec api-php-fpm php artisan doctrine:migrations:migrate

rollback:
	docker-compose exec api-php-fpm php artisan doctrine:migrations:rollback

stan:
	docker-compose exec api-php-fpm php artisan code:analyse --level=4

migrate-diff: diff perm

start: up frontend-watch