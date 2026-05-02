
use Olist_Project


-- Category level revenue  and losses:

with cte as (SELECT 
    pn.product_category_name_english,

    ROUND(SUM(oi.price), 0) AS total_revenue

FROM order_items oi

LEFT JOIN products pr 
    ON oi.product_id = pr.product_id

LEFT JOIN product_category_name_translation pn
    ON pr.product_category_name = pn.product_category_name

GROUP BY pn.product_category_name_english
ORDER BY total_revenue DESC)
select * , round(100.0*total_revenue/ (select sum(total_revenue) from cte), 2) total_revenue_pct
from cte 
limit 5




SELECT 
    pn.product_category_name_english,

    COUNT(DISTINCT ct.order_id) AS total_orders,

    -- Unavailable / Canceled Orders
    COUNT(DISTINCT CASE 
        WHEN ct.order_status IN ('canceled', 'unavailable') 
        THEN ct.order_id 
    END) AS unavailable_orders,

    -- Unavailability %
    ROUND(
        100.0 * COUNT(DISTINCT CASE 
            WHEN ct.order_status IN ('canceled', 'unavailable') 
            THEN ct.order_id 
        END) 
        / COUNT(DISTINCT ct.order_id), 
    2) AS unavailability_pct,

    -- Total Revenue
    ROUND(SUM(ct.payment_value), 2) AS total_revenue,

    -- Lost Revenue
    ROUND(SUM(CASE 
        WHEN ct.order_status IN ('canceled', 'unavailable') 
        THEN ct.payment_value 
        ELSE 0 
    END), 2) AS lost_revenue,

    -- Lost Revenue %
    ROUND(
        100.0 * SUM(CASE 
            WHEN ct.order_status IN ('canceled', 'unavailable') 
            THEN ct.payment_value 
            ELSE 0 
        END) / SUM(ct.payment_value), 
    2) AS lost_revenue_pct

FROM common_table ct
LEFT JOIN order_items oi 
    ON ct.order_id = oi.order_id
LEFT JOIN products pr 
    ON oi.product_id = pr.product_id
LEFT Join product_category_name_translation pn
on pr.product_category_name = pn.product_category_name
where pr.product_category_name is not null
GROUP BY pn.product_category_name_english
ORDER BY lost_revenue DESC
limit 5

