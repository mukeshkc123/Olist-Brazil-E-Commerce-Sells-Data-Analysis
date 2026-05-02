-- Applying the data integrity principle to the data set(Whereevr required)

-- For order table

SELECT order_id
FROM orders
group by order_id 
having count(*) >1 --- 0 values, all order_id is unique

SELECT order_id
FROM orders
where order_id is null
group by order_id 
having count(*) >1  -- No null value as well

-- For customer_table

SELECT customer_id
FROM customers
group by customer_id
having count(*) >1 -- 0 values, all order_id is unique

SELECT customer_id
FROM customers
where customer_id is not null
group by customer_id
having count(*) >1   -- No null value as well


-- Finding the orders and deleting them  which has been ordered but do not ahve delivery date.

select *
from orders 
where order_status  = 'delivered' and order_delivered_customer_date is null

SELECT *
FROM orders
WHERE order_delivered_customer_date IS NULL;

-- DELETE FROM orders
-- WHERE order_status = 'delivered'
-- AND order_delivered_customer_date IS NULL; -- all the null dleivered date  been deleated

-- rollback;

-- review column has date fields which are imported as varchar, so correcting it:

SELECT 
  review_creation_date,
  STR_TO_DATE(review_creation_date, '%Y-%m-%d %H:%i:%s') AS review_creation_date,
  review_answer_timestamp ,
  str_to_date(review_answer_timestamp , '%Y-%m-%d %H:%i:%s') as review_answer_timestamp
FROM order_reviews;

UPDATE order_reviews
SET review_creation_date = 
STR_TO_DATE(review_creation_date, '%Y-%m-%d %H:%i:%s');

UPDATE order_reviews
SET review_answer_timestamp = 
STR_TO_DATE(review_answer_timestamp, '%Y-%m-%d %H:%i:%s');


# Data Modaling - Creation of the common data table.