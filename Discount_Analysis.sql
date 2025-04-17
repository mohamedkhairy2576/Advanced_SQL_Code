SELECT 
    CASE 
        WHEN discount > 0 THEN 'With Discount'
        ELSE 'No Discount'
    END as discount_status,
    COUNT(DISTINCT order_id) as order_count,
    SUM(Total_sales_Including_Discount) as total_sales,
    AVG(Total_sales_Including_Discount) as avg_order_value
FROM new_orders
GROUP BY 
    CASE 
        WHEN discount > 0 THEN 'With Discount'
        ELSE 'No Discount'
    END;