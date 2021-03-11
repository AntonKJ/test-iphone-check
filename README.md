# Test-Iphone-check

Для запуска нужно выполнить docker-compose up --build в папке

Тогда проект откроется на   http://localhost/
А БД PHPMyadmin тут         http://localhost:8765

Для установки db нужно выполнить 

cat promotion.sql | docker exec -i mariadb /usr/bin/mysql -u root --password=rootpwd6421

По нажатию на кнопку заказа в консоли появится сообщение с пользователями и сколько они напокупали

Если возникнет ошибка PDO Exception (у когото возникает у когото нет)

то нужно войти в контейнер php и выполнить 

docker exec -it php su &&
apt update &&
yes|apt install libpq-dev

docker-php-ext-install pdo pgsql pdo_mysql pdo_pgsql zip exif \
	&& docker-php-ext-configure gd \
	&& docker-php-ext-install gd 
  
после выполнить docker-compose restart

Все файлы проекта находятся в /src/promotion/ 
