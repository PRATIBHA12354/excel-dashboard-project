CREATE DATABASE amazon_project;
USE amazon_project;
CREATE TABLE amazon_sales (
    transaction_id VARCHAR(20) PRIMARY KEY,
    product_category VARCHAR(50),
    units_sold INT,
    unit_price DECIMAL(10,2),
    customer_region VARCHAR(20)
);
select*from amazon_sales;

#Total Revenue of Company
SELECT SUM(units_sold * unit_price) AS total_revenue
FROM amazon_sales;

#Total Units Sold
SELECT SUM(units_sold) AS total_units
FROM amazon_sales;

##top selling product category
select Product_Category, sum(Units_Sold)as Total_Units
FROM amazon_sales
group by Product_Category
order by Total_Units Desc
 LIMIT 1 ;

#Units Sold by Region 
SELECT customer_region,
       SUM(units_sold) AS total_units
FROM amazon_sales
GROUP BY customer_region;

#Highest Revenue Transaction
SELECT product_category,
       units_sold * unit_price AS revenue
FROM amazon_sales
ORDER BY revenue DESC
LIMIT 1;

#Lowest Revenue Transaction
SELECT product_category,
       units_sold * unit_price AS revenue
FROM amazon_sales
ORDER BY revenue ASC
LIMIT 1;

#Category with Highest Units Sold
SELECT product_category,
       SUM(units_sold) AS total_units
FROM amazon_sales
GROUP BY product_category
ORDER BY total_units DESC
LIMIT 1;

#Count of Transactions per Category
SELECT product_category,
       COUNT(*) AS total_transactions
FROM amazon_sales
GROUP BY product_category;

#Top 5 Revenue Transactions
SELECT transaction_id,
       product_category,
       units_sold * unit_price AS revenue
FROM amazon_sales
ORDER BY revenue DESC
LIMIT 5;

#Find Second Highest Revenue Transaction
SELECT *FROM (
    SELECT product_category,
           units_sold * unit_price AS revenue,
           DENSE_RANK() OVER (ORDER BY units_sold * unit_price DESC) AS rnk
    FROM amazon_sales) ranked
WHERE rnk = 2;

#average units sold per transaction
 select avg(Units_Sold) as AVG_uNITS
 FROM amazon_sales;
 
# Transactions with Revenue > 5000
SELECT *,
       units_sold * unit_price AS revenue
FROM amazon_sales
WHERE units_sold * unit_price > 5000;

#Region with Highest Revenue
SELECT customer_region,
       SUM(units_sold * unit_price) AS revenue
FROM amazon_sales
GROUP BY customer_region
ORDER BY revenue DESC
LIMIT 1;