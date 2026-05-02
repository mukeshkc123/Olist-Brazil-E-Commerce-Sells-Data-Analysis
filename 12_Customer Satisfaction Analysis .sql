

use Olist_Project

--  Customer Disatisfcation analysis:

 -- 1. Most Dissatisfied by Region

SELECT 
    customer_state,

    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    
    COUNT(*) AS total_orders

FROM common_table ct

LEFT JOIN order_reviews r
    ON ct.order_id = r.order_id

WHERE r.review_score IS NOT NULL

GROUP BY customer_state

HAVING COUNT(*) > 50   -- remove noise
ORDER BY avg_review_score ASC
limit 10;


-- Repeat Vs NeW customer;

WITH customer_orders AS (
    SELECT 
        customer_unique_id,
        COUNT(order_id) AS order_count
    FROM common_table
    GROUP BY customer_unique_id
)

SELECT 
    CASE 
        WHEN co.order_count = 1 THEN 'New Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,

    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    COUNT(*) AS total_orders

FROM common_table ct

JOIN customer_orders co
    ON ct.customer_unique_id = co.customer_unique_id
LEFT JOIN order_reviews r
    ON ct.order_id = r.order_id

WHERE r.review_score IS NOT NULL

GROUP BY customer_type;



#repeat customer% 

SELECT 
    COUNT(DISTINCT CASE 
        WHEN order_count > 1 THEN customer_unique_id 
    END) AS repeat_customers,

    COUNT(DISTINCT customer_unique_id) AS total_customers,

    ROUND(
        100.0 * COUNT(DISTINCT CASE 
            WHEN order_count > 1 THEN customer_unique_id 
        END) 
        / COUNT(DISTINCT customer_unique_id), 
    2) AS repeat_customer_pct

FROM (
    SELECT 
        customer_unique_id,
        COUNT(order_id) AS order_count
    FROM common_table
    GROUP BY customer_unique_id
) t;


-- High Verses low value customers

SELECT 
    CASE 
        WHEN payment_value < 100 THEN 'Low Value'
        WHEN payment_value < 500 THEN 'Medium Value'
        ELSE 'High Value'
    END AS customer_segment,

    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    COUNT(*) AS total_orders

FROM common_table ct

LEFT JOIN order_reviews r
    ON ct.order_id = r.order_id

WHERE r.review_score IS NOT NULL

GROUP BY customer_segment
ORDER BY avg_review_score ASC;

