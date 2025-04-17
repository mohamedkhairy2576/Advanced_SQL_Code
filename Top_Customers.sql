WITH CustomerSales AS (
    SELECT 
        email,
        SUM(Total_sales_Including_Discount) as total_spent,
        COUNT(DISTINCT order_id) as order_count
    FROM new_orders
    GROUP BY email
)
SELECT 
    email,
    total_spent,
    order_count,
    RANK() OVER (ORDER BY total_spent DESC) as customer_rank
FROM CustomerSales
WHERE total_spent > 0
ORDER BY total_spent DESC
LIMIT 10;