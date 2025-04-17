SELECT 
    YEAR(order_date) as sale_year,
    MONTH(order_date) as sale_month,
    SUM(Total_sales_Including_Discount) as total_sales
FROM new_orders
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY sale_year, sale_month;