
use Olist_Project
-- state wsie performance 

-- top 10 states by revenue

with Revenue as (SELECT 
    customer_state,

    ROUND(SUM(payment_value), 2) AS total_revenue,

    ROUND(SUM(CASE 
        WHEN order_status = 'delivered' THEN payment_value 
        ELSE 0 
    END), 2) AS realized_revenue

FROM common_table

GROUP BY customer_state
ORDER BY realized_revenue DESC)
select *, 
round(100.0*realized_revenue/(select sum(realized_revenue) from revenue), 2) as revnue_pct
from revenue
ORDER BY realized_revenue DESC
LIMIT 10;





-- conversion rate and drop off rates


SELECT 
    customer_state,

    COUNT(order_id) AS total_orders,

    -- Delivered Orders
    SUM(CASE 
        WHEN order_status = 'delivered' THEN 1 ELSE 0 
    END) AS delivered_orders,

    -- Delivery Rate %
    ROUND(
        100.0 * SUM(CASE 
            WHEN order_status = 'delivered' THEN 1 ELSE 0 
        END) / COUNT(order_id), 
    2) AS delivery_rate,

    -- Drop-off Orders (not delivered)
    SUM(CASE 
        WHEN order_status != 'delivered' THEN 1 ELSE 0 
    END) AS dropped_orders,

    -- Drop-off %
    ROUND(
        100.0 * SUM(CASE 
            WHEN order_status != 'delivered' THEN 1 ELSE 0 
        END) / COUNT(order_id), 
    2) AS drop_off_pct,

    -- Total Revenue
    ROUND(SUM(payment_value), 2) AS total_revenue,

    -- Realized Revenue (Delivered)
    ROUND(SUM(CASE 
        WHEN order_status = 'delivered' THEN payment_value 
        ELSE 0 
    END), 2) AS realized_revenue,

    -- Lost Revenue (Canceled + Unavailable)
    ROUND(SUM(CASE 
        WHEN order_status IN ('canceled', 'unavailable') 
        THEN payment_value ELSE 0 
    END), 2) AS lost_revenue,

    -- Lost Revenue %
    ROUND(
        100.0 * SUM(CASE 
            WHEN order_status IN ('canceled', 'unavailable') 
            THEN payment_value ELSE 0 
        END) / SUM(payment_value), 
    2) AS lost_revenue_pct

FROM common_table
GROUP BY customer_state
ORDER BY lost_revenue DESC
limit 5;





-- state wise delivery rate

SELECT 
    customer_state,

    COUNT(order_id) AS total_orders,

    SUM(CASE 
        WHEN order_status = 'delivered' THEN 1 ELSE 0 
    END) AS delivered_orders,

    ROUND(
        100.0 * SUM(CASE 
            WHEN order_status = 'delivered' THEN 1 ELSE 0 
        END) / COUNT(order_id), 
    2
    ) AS delivery_success_rate

FROM common_table
GROUP BY customer_state
having delivered_orders > 100
ORDER BY delivery_success_rate ASC
limit 10;

