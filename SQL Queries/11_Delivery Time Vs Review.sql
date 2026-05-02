

-- Delivery Time + Review

SELECT 
    ct.order_id,
    ct.customer_state,
    r.review_score,

    DATEDIFF(
        ct.order_delivered_customer_date, 
        ct.order_purchase_timestamp
    ) AS delivery_days

FROM common_table ct

LEFT JOIN order_reviews r
    ON ct.order_id = r.order_id

WHERE ct.order_status = 'delivered'
AND r.review_score IS NOT NULL;

-- corelation between review score and delivery time

SELECT 
    review_score,

    ROUND(AVG(
        DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)
    ), 2) AS avg_delivery_days,

    COUNT(ct.order_id) AS total_orders

FROM common_table ct

LEFT JOIN order_reviews r
    ON ct.order_id = r.order_id

WHERE ct.order_status = 'delivered'
AND r.review_score IS NOT NULL

GROUP BY review_score
ORDER BY review_score;