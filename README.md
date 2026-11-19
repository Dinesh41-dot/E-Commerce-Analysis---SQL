# E-Commerce Data Analysis Using MySQL

## Project Overview
This project focuses on analyzing e-commerce business data using MySQL. It involves creating a relational database, managing structured datasets, and writing SQL queries to extract meaningful business insights related to sales, customers, products, payments, inventory, and deliveries.

## Project Objectives
- Analyze customer information and purchasing behavior.
- Identify top-selling products and revenue-generating categories.
- Evaluate monthly sales performance and order statuses.
- Analyze payment methods and transaction statuses.
- Monitor shipment performance and delivery timelines.
- Evaluate product ratings, customer reviews, and discount campaigns.
- Examine inventory availability across warehouses.

## Database Structure

The project uses a relational database named `EcommerceAnalytics`, consisting of 11 tables:

| Table Name | Description |
|---|---|
| Customers | Customer information and registration details |
| Addresses | Customer location details |
| Categories | Product categories |
| Suppliers | Supplier information |
| Products | Product details, prices, and ratings |
| Inventory | Stock availability and warehouse details |
| Orders | Customer orders and order status |
| OrderItems | Product quantities, discounts, GST, and prices |
| Payments | Payment modes and transaction statuses |
| Shipments | Courier and delivery information |
| ProductReviews | Customer ratings and feedback |
| Discounts | Product discount campaigns |

## SQL Concepts Used

- Database Creation and Table Management (DDL)
- Data Insertion and Retrieval (DML)
- Primary Keys and Foreign Keys
- INNER JOIN and Multiple Table Joins
- Aggregate Functions (SUM, COUNT, AVG)
- GROUP BY and HAVING
- WHERE and ORDER BY
- CASE WHEN Statements
- String Functions (CONCAT)
- Date Functions (MONTH, DATEDIFF, CURRENT_DATE)
- Aliases and Conditional Filtering

## Key Business Questions

1. What is the total revenue generated from delivered orders?
2. How many orders fall under each order status?
3. What is the monthly revenue trend?
4. Who are the highest-spending customers?
5. Which products have the highest sales quantities?
6. Which product categories generate the most revenue?
7. Which payment method processes the highest number of transactions?
8. What is the average delivery time for successful shipments?
9. Which products receive the highest customer ratings?
10. Which products have discounts greater than 20%?

## Query Outputs and Analytical Insights

The SQL queries generate results that help analyze:

- Sales Performance: Revenue trends, order distribution, and customer spending patterns.
- Product Analysis: Best-selling products, category-wise revenue, and average selling prices.
- Payment Analysis: Transaction distribution by payment mode and payment status.
- Delivery Analysis: Courier performance, successful deliveries, and average delivery duration.
- Customer Feedback: Product ratings, review distribution, and customer feedback.
- Discount Analysis: Active discount campaigns, discount percentages, and discounted product prices.
- Inventory Analysis: Product stock availability across different warehouses.

## Tools & Technologies
- Database: MySQL
- Query Language: SQL
- Environment: MySQL Server

## Project Repository
Explore the complete SQL scripts and queries in this repository.

**Author:** Dinesh Bainapalli
