Use olist_project;

-- Conversion rate calcaculation

SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    
    COUNT(DISTINCT CASE 
        WHEN payment_value > 0 THEN order_id 
    END) AS paid_orders,
    
    COUNT(DISTINCT CASE 
        WHEN order_status = 'delivered' THEN order_id 
    END) AS delivered_orders,

    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN payment_value > 0 THEN order_id END) 
        / COUNT(DISTINCT order_id), 2
    ) AS payment_conversion_rate,

    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN order_status = 'delivered' THEN order_id END) 
        / COUNT(DISTINCT order_id), 2
    ) AS delivery_conversion_rate

FROM common_table;


-- drop off rate calculation
SELECT 
    COUNT(DISTINCT order_id) AS total_orders,

    COUNT(DISTINCT CASE 
        WHEN payment_value > 0 THEN order_id 
    END) AS paid_orders,

    COUNT(DISTINCT CASE 
        WHEN order_status = 'delivered' THEN order_id 
    END) AS delivered_orders,

    ROUND(
        100.0 * (COUNT(DISTINCT order_id) - 
        COUNT(DISTINCT CASE WHEN payment_value > 0 THEN order_id END)) 
        / COUNT(DISTINCT order_id), 2
    ) AS drop_off_before_payment,

    ROUND(
        100.0 * (COUNT(DISTINCT CASE WHEN payment_value > 0 THEN order_id END) - 
        COUNT(DISTINCT CASE WHEN order_status = 'delivered' THEN order_id END)) 
        / COUNT(DISTINCT CASE WHEN payment_value > 0 THEN order_id END), 2
    ) AS drop_off_after_payment

FROM common_table;


