# TrendyThreads E-commerce Analysis

## Project Overview

TrendyThreads is an e-commerce analytics project focused on understanding sales performance, customer behavior, product performance, and business activity.

The project uses MySQL for data analysis and Power BI for data visualization and dashboard development.

The goal is to answer important business questions and turn raw e-commerce data into useful insights that can support business decision-making.

## Business Objectives

This project focuses on answering questions such as:

- What is the company's total revenue and order performance?
- Which customers generate the most revenue?
- Which products and categories generate the most sales?
- Which products are selling in the highest quantities?
- Which customers have never placed an order?
- How does Average Order Value vary across countries?
- How long does it take customers to make their first purchase?
- How is monthly revenue changing over time?
- Which product categories are most popular in each country?
- Which products have low inventory levels?

## Tools Used

- MySQL
- SQL
- Power BI
- DAX

## Database Structure

The TrendyThreads database contains four main tables:

### Customers

Contains customer information including:

- customer_id
- first_name
- last_name
- email
- signup_date
- country

### Products

Contains product information including:

- product_id
- product_name
- category
- price
- stock_quantity

### Orders

Contains transaction information including:

- order_id
- customer_id
- order_date
- total_amount
- status

### Order Items

Contains information about products purchased in each order including:

- order_item_id
- order_id
- product_id
- quantity
- unit_price

## SQL Analysis

The SQL analysis was divided into three phases.

### Phase 1: Basic Analysis

1. Customer Base
2. Inventory Check
3. Total Revenue
4. Recent Signups

### Phase 2: Sales and Product Analysis

5. Top Spenders
6. Category Performance
7. Inactive Customers
8. Popular Products

### Phase 3: Advanced Analysis

9. Average Order Value by Country
10. First Purchase Analysis
11. Monthly Revenue Growth
12. Most Popular Category per Country

The complete SQL scripts are available in the SQL folder.

## Power BI Dashboards

### Executive Sales Dashboard

The Executive Sales Dashboard provides an overview of:

- Total Revenue
- Completed Orders
- Total Customers
- Average Order Value
- Revenue trends
- Revenue by category
- Revenue by country
- Customer revenue
- Units sold by product

![Executive Sales Dashboard](Images/executive-sales-dashboard.png)

### Customers & Operations Dashboard

The Customers & Operations Dashboard focuses on:

- Low Stock Products
- First Purchase Analysis
- Customer Signup Trends
- Most Popular Category by Country
- Order Fulfillment Status

![Customers & Operations Dashboard](Images/customers-operations-dashboard.png)

## Key Insights

The analysis provides insights into:

- The company's highest-value customers.
- Products and categories generating the most revenue.
- Products with low inventory levels.
- Customer signup and acquisition activity.
- Customers who registered but never placed an order.
- Customer first-purchase behavior.
- Revenue performance across countries.
- Popular product categories across countries.

## Skills Demonstrated

This project demonstrates practical skills in:

- SQL
- Data Analysis
- MySQL
- JOINs
- GROUP BY
- HAVING
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- LAG()
- KPI Analysis
- Customer Analysis
- Product Analysis
- Revenue Analysis
- Power BI
- DAX
- Data Visualization
- Data Storytelling
- Business Analysis

## Repository Structure

```text
trendythreads-ecommerce-analysis/
│
├── README.md
│
├── SQL/
│   ├── README.md
│   ├── trendythreads create table script.sql
│   └── trendythreads sql analysis.sql
│
└── Images/
    ├── executive-sales-dashboard.png
    └── customers-operations-dashboard.png
