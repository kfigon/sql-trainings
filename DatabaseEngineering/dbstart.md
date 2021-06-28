`docker run --name=mysql1 -p 3306:3306 -e MYSQL_DATABASE=mytestdb -e MYSQL_ROOT_PASSWORD=root123 -d mysql:5.7`

`docker exec -it mysql1 mysql -u root -p`

```
SHOW DATABASES;
CREATE DATABASE somedb;
USE somedb;

SHOW TABLES;
CREATE TABLE pet (
    name VARCHAR(20), 
    age int
);

DESCRIBE pet;
insert into pet (name,age) values ('fafik',5);
```

mass populate table (postgres):
```
insert into temperatures(t) select random()*100 from generate_series(0,100000);
```
