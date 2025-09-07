

USE sales;

-- Rename table
sp_rename 'Orders###$' , 'New_Orders' , 'object';

-- Preview data
SELECT * 
FROM new_orders
ORDER BY [order_id];

-- Rename column [Order ID] to [Order_Id]
sp_rename 'new_orders.Order ID' , 'Order_id' , 'column';

-- Get column details for all tables
SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE table_name = 'new_orders';

-- Change order_id column from float to int
ALTER TABLE new_orders 
ALTER COLUMN order_id INT;

-- Replace values in Email column and convert to lowercase
UPDATE new_orders 
SET email = REPLACE(email, '@', '@g');

UPDATE new_orders 
SET email = LOWER(email);

-- Add new column (Total_sales_excluding_discount)
ALTER TABLE new_orders 
ADD Total_sales_Excluding_Discount AS (quantity * [unit price]);

-- Replace NULL values in discount column with 0
UPDATE new_orders 
SET Discount = 0
WHERE discount IS NULL;

-- Add new column (Total_sales_Including_discount)
ALTER TABLE new_orders 
ADD Total_sales_Including_Discount AS ((quantity * [unit price]) - discount);

-- Final preview
SELECT *
FROM new_orders;
