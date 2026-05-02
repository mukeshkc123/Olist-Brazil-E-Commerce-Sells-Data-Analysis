use Olist_Project

-- Delivery Bucket

SELECT 
    CASE 
        WHEN DATEDIFF(ct.order_delivered_customer_date, ct.order_purchase_timestamp) <= 3 
            THEN 'Very Fast (0-3 days)'
            
        WHEN DATEDIFF(ct.order_delivered_customer_date, ct.order_purchase_timestamp) <= 7 
            THEN 'Fast (4-7 days)'
            
        WHEN DATEDIFF(ct.order_delivered_customer_date, ct.order_purchase_timestamp) <= 10 
            THEN 'Moderate (8-10 days)'
            
        WHEN DATEDIFF(ct.order_delivered_customer_date, ct.order_purchase_timestamp) <= 15 
            THEN 'Slow (11-15 days)'
            
        ELSE 'Very Late (16+ days)'
    END AS delivery_bucket,

    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    COUNT(*) AS total_orders

FROM common_table ct

LEFT JOIN order_reviews r
    ON ct.order_id = r.order_id

WHERE ct.order_status = 'delivered'
AND r.review_score IS NOT NULL

GROUP BY delivery_bucket

-- ensures logical order instead of alphabetical
ORDER BY MIN(
    DATEDIFF(ct.order_delivered_customer_date, ct.order_purchase_timestamp)
);
