CREATE DATABASE IF NOT EXISTS salesdb;
# CREATE SCHEMA IF NOT EXISTS salesdb; equivalent

USE salesdb;

CREATE TABLE sales(
    purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,

    PRIMARY KEY(purchase_number),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
#                   usuwamy customera to tutaj sie tez usunie
#   usuniecie parenta (customer) usunie dziecko, czyli sale
);

CREATE TABLE customers(
  customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  email_address varchar(50),
  number_of_complaints INT
);

CREATE TABLE items(
    item_code varchar(255) primary key,
    item varchar(255),
    unit_price numeric(10,2)
);

CREATE TABLE companies(
    company_id varchar(255) primary key,
    company_name varchar(255),
    headquaters_phone_number int(12)
);