
use Olist_Project

-- 1.Revenue wise analsysis on the basis of order status

SELECT 
    order_status,
    ROUND(SUM(payment_value), 0) as total_revenue,
    Round(100.0*ROUND(SUM(payment_value), 2) /(select sum(payment_value) from common_table),2) AS total_revenue_percent
FROM common_table
group by order_status

-- 2. revenue wise analysis on teh basis of  order status


SELECT 
    ROUND(SUM(payment_value), 0) AS total_revenue,

    ROUND(SUM(CASE 
        WHEN order_status IN ('canceled', 'unavailable') 
        THEN payment_value ELSE 0 END), 2) AS lost_revenue,

    ROUND(
        SUM(CASE 
            WHEN order_status IN ('canceled', 'unavailable') 
            THEN payment_value ELSE 0 END
        ) * 100.0 / SUM(payment_value),
    2) AS loss_percentage

FROM common_table;
