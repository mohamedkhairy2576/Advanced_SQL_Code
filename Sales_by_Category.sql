-- File: Sales_by_Category.sql
-- Purpose: Calculate total sales and quantity by product category
-- Author: [Your Name]
-- Date: April 2025

SELECT 
    product_category,
    SUM(Total_sales_Including_Discount) as total_sales,
    SUM(quantity) as total_quantity
FROM new_orders
GROUP BY product_category
ORDER BY total_sales DESC;