# test-iphone-check

Для запуска нужно выполнить docker-compose up --build в папке

Тогда проект откроется на   http://localhost/
А БД PHPMyadmin тут         http://localhost:8765

Для установки db нужно выполнить 

cat promotion.sql | docker exec -i mariadb /usr/bin/mysql -u root --password=rootpwd6421


