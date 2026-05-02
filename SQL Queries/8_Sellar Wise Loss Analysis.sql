use Olist_Project

-- sellar wise revenue losses 

WITH item_count AS (
    SELECT 
        order_id,
        COUNT(*) AS item_cnt
    FROM order_items
    GROUP BY order_id
)

SELECT 
    oi.seller_id,

    COUNT(DISTINCT ct.order_id) AS total_orders,

    -- Unavailable / Canceled Orders
    COUNT(DISTINCT CASE 
        WHEN ct.order_status IN ('canceled', 'unavailable') 
        THEN ct.order_id 
    END) AS problematic_orders,

    -- Problem Rate %
    ROUND(
        100.0 * COUNT(DISTINCT CASE 
            WHEN ct.order_status IN ('canceled', 'unavailable') 
            THEN ct.order_id 
        END) 
        / COUNT(DISTINCT ct.order_id), 
    2) AS problem_rate_pct,

    -- Total Revenue (distributed)
    ROUND(SUM(ct.payment_value / ic.item_cnt), 2) AS total_revenue,

    -- Lost Revenue
    ROUND(SUM(CASE 
        WHEN ct.order_status IN ('canceled', 'unavailable') 
        THEN ct.payment_value / ic.item_cnt 
        ELSE 0 
    END), 2) AS lost_revenue,

    -- Lost Revenue %
    ROUND(
        100.0 * SUM(CASE 
            WHEN ct.order_status IN ('canceled', 'unavailable') 
            THEN ct.payment_value / ic.item_cnt 
            ELSE 0 
        END) 
        / SUM(ct.payment_value / ic.item_cnt), 
    2) AS lost_revenue_pct

FROM common_table ct
LEFT JOIN order_items oi 
    ON ct.order_id = oi.order_id
LEFT JOIN item_count ic 
    ON ct.order_id = ic.order_id
GROUP BY oi.seller_id
having total_orders > 100
ORDER BY lost_revenue DESC
LIMIT 10;