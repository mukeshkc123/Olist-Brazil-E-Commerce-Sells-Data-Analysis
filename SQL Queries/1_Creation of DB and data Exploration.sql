create database Olist_Project

use Olist_Project

-- To see what are the tables which has been imnported into this database

SHOW TABLES;

# To check if all the rows has been imported succesfully in the DBMS


SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM order_payments;s
SELECT COUNT(*) FROM order_reviews;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM sellers;
SELECT COUNT(*) FROM geolocation;
SELECT COUNT(*) FROM product_category_name_translation;

-- to Get an overview of the dataset

SELECT * FROM customers limit 10;
SELECT * FROM orders;
SELECT * FROM order_items limit 10;
SELECT * FROM order_payments limit 10;
SELECT * FROM order_reviews limit 10;
SELECT * FROM products limit 10;
SELECT * FROM sellers limit 10;
SELECT * FROM geolocation limit 10;
SELECT * FROM product_category_name_translation limit 10;


-- To see different schema and format of each columns in each table.

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customers';

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'orders';

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'order_items';

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'order_payments';

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'order_reviews';

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'products';

SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sellers'


SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'geolocation'


SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'product_category_name_translation'


