# Explanation of dbt Models and Transformations

## 1. Staging Models
## stg_products

Purpose: To extract and prepare the raw product data by including necessary joins to get the English names of product categories. This model helps standardize and enrich the product category information.

## stg_orders

Purpose: To gather raw order data and enrich it by joining with customer, order_items and product table. This model provides a comprehensive view of each order, including customer location and product details, which is essential for further analysis.

## 2. Intermediate Models
## int_orders_by_state

Purpose: To aggregate and count the number of orders for each state. This model helps in understanding the distribution of orders across different states, providing insights into regional sales performance.

## int_sales_by_category

Purpose: To aggregate sales data by product category, calculating metrics such as total orders, total sales, and average sales per order. This model provides insights into which product categories are performing best in terms of sales.

## int_avg_delivery_time

Purpose: To calculate the delivery time in days for each order. This model is used to measure delivery efficiency and assess the time taken from purchase to delivery for each order.

## 3. Final Models

## fct_sales_by_category

Purpose: To consolidate and present the final sales metrics by product category, including total orders, total sales, and average sales. This model provides a summarized view of sales performance by category, ready for reporting and analysis.

## fct_avg_delivery_time

Purpose: To calculate the average delivery time across all orders, rounded to the nearest whole number. This model provides a final, rounded measure of overall delivery performance.

## fct_orders_by_state

Purpose: To present the final count of orders by state, consolidating the intermediate results. This model gives a clear view of order distribution by state, useful for regional performance analysis.
