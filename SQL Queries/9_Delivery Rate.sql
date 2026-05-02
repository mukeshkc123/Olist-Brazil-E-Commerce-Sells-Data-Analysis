

-- Average delivery rate 

SELECT 
    COUNT(order_id) AS total_delivered_orders,

    ROUND(
        AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)), 
    2) AS avg_delivery_days,

    MIN(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS fastest_delivery,

    MAX(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS slowest_delivery

FROM common_table
WHERE order_status = 'delivered';