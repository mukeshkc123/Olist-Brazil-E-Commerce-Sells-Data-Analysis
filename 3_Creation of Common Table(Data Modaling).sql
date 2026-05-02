Use olist_project

# Data Modaling - Creation of the common data table.

CREATE VIEW common_table AS

WITH item_agg AS (
    SELECT 
        order_id,
        SUM(price) AS order_value
    FROM order_items
    GROUP BY order_id
),

payment_agg AS (
    SELECT 
        order_id,
        SUM(payment_value) AS payment_value
    FROM order_payments
    GROUP BY order_id
)

SELECT 
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    c.customer_state,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    ia.order_value,
    pa.payment_value

FROM orders o
LEFT JOIN customers c 
    ON o.customer_id = c.customer_id
LEFT JOIN item_agg ia 
    ON o.order_id = ia.order_id
LEFT JOIN payment_agg pa 
    ON o.order_id = pa.order_id;