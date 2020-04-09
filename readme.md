`docker run --name=mysql1 -p 3306:3306 -e MYSQL_DATABASE=mytestdb -e MYSQL_ROOT_PASSWORD=root123 -d mysql:5.7`

`docker exec -it mysql1 mysql -u root -p`

## main components of sql syntax
* ddl - data definition language. Creation of data
    * create statement: `CREATE TABLE name (colname type);`
    * alter 
    ```sql
    ALTER TABLE name
    ADD COLUMN column_name DATE;
    ``` 
    * drop `DROP TABLE customers`
    * rename `RENAME TABLE customer TO client`
    * truncate - remove contents of table, but table exists
    `TRUNCATE TABLE customers`
* dml - data manipulation. Manipulation
    * select `select * FROM sales;`
    * insert `INSERT INTO sales (col1, col2) VALUES (1, 'asd');`
    
        `INSERT INTO SALES VALUES (1, 'asd')` - if all columns
    * update
    ```sql
  UPDATE sales
  SET surname = 'ASD'
  WHERE age = 18 
  ```
    * delete - remove certain row (or all) `DELETE FROM sales` == `TRUNCATE TABLE sales`
    ```sql
    DELETE FROM sales
  WHERE purchase_number = 1;
    ```
* dcl - data control - manage rights (permissions) of users of DB
    * GRANT - give permission 
    ```sql
    GRANT type_of_persmission ON database.table_name TO 
  'username@localhost'
    ```
  ```sql
    GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';
    CREATE USER 'kamil'@'localhost' IDENTIFIED WITH mysql_native_password BY 'kamil';
    GRANT ALL PRIVILEGES ON *.* TO 'kamil'@'localhost';
    ```
    * REVOKE - remove permissions
* tcl - transaction control. Saving/restoring changes to DB
    * COMMIT - persystuje zmiany INSERT, DELETE, UPDATE. Zmiany dostepne dla innych userow
    * ROLLBACK - undo to previously commited state
    
    
## Having vs where
* where daje warunki na pojedyncze wiersze. Warunki sa nadane przed grupowaniem
* having - where dla grup. mozna robic warunki dla funkcji agregujacych, czego where nie potrafi
* having robi sie na grupach, reorganizuje on dane po przeprocesowaniu przez joiny i where

kolejnosc wykonywania insturkcji:
* where
* group
* having
* order