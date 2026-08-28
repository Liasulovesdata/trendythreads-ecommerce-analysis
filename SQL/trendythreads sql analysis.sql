--- TASK 1
--- BUSINESS QUESTION 1
--- 
SELECT 
first_name,
last_name,
email,
country
FROM customers
WHERE country = 'USA' OR country = 'canada'
;
--- BUSINESS QUESTION 2

SELECT
 product_name,
 stock_quantity 
FROM products
WHERE stock_quantity < 20
;
 
--- BUSINESS QUESTION 3
SELECT 
sum(total_amount) AS total_revenue
FROM orders
WHERE status = 'Completed'
;

--- BUSINESS QUESTION 4
SELECT 
COUNT(customer_id) AS total_customers
FROM customers
WHERE YEAR(signup_date) = 2025
;


--- TASK 2
--- BUSINESS QUESTION 5
SELECT 
first_name,
last_name,
status,
SUM(total_amount) AS total_spent
FROM customers AS c
JOIN orders AS o
	ON c.customer_id = o.customer_id
WHERE status = "Completed"
GROUP BY first_name,last_name,status
ORDER BY total_spent DESC
LIMIT 10
;

--- BUSINESS QUESTION 6
SELECT 
category,
 ROUND(SUM(price*quantity)) AS total_revenue
fROM order_items AS oi
JOIN products AS p
	ON oi.product_id = p.product_id
GROUP BY category
ORDER BY total_revenue DESC
;

--- BUSINESS QUESTION 7
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
	ON c.customer_id = o.customer_id
WHERE order_date IS NULL
;

--- BUSINESS QUESTION 8
SELECT 
product_name,
SUM(quantity) AS total_quantity_sold
FROM products AS p
JOIN order_items AS oi
	ON p.product_id = oi.product_id
GROUP BY product_name
ORDER BY total_quantity_sold DESC
LIMIT 5
;

---- TASK 3
--- BUSINESS QUESTION 9
--- Completed orders first
SELECT 
country,
status,
total_orders,
AOV
FROM
(SELECT
 country,
 AVG(total_amount) AS AOV,
 status,
 COUNT(DISTINCT o.order_id) AS total_orders
FROM orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id
WHERE status = "Completed"
GROUP BY country, status
HAVING COUNT(DISTINCT o.order_id) >=50
) AS average_order_value
ORDER BY AOV DESC
;

--- BUSINESS QUESTION 10
SELECT  customer_id, signup_date, order_date, status, time_of_first_order
FROM
(SELECT c.customer_id,
 signup_date,
 order_date,
 status,
DATEDIFF(order_date,signup_date) AS time_of_first_order
FROM customers AS c
JOIN orders AS o
	ON c.customer_id = o.customer_id
GROUP BY customer_id, signup_date, order_date,status) AS customers_first_purchase
;


--- BUSINESS QUESTION 11
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY month
)

SELECT
    month,
    ROUND(total_revenue, 2) AS total_revenue,
	LAG(total_revenue) OVER (ORDER BY month) AS previous_month_revenue,
    ROUND(
        (
            total_revenue - LAG(total_revenue) OVER (ORDER BY month)
        ) / LAG(total_revenue) OVER (ORDER BY month) * 100,
        2
    ) AS revenue_growth_percentage
FROM monthly_revenue
ORDER BY month;

--- BUSINESS QUESTION 12
-- Rank categories within each country by quantity sold

SELECT
    country,
    category,
    total_quantity
FROM (
    SELECT
        c.country,
        p.category,
        SUM(oi.quantity) AS total_quantity,
        ROW_NUMBER() OVER (
            PARTITION BY c.country
            ORDER BY SUM(oi.quantity) DESC
        ) AS category_rank
    FROM customers AS c
    JOIN orders AS o
        ON c.customer_id = o.customer_id
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    JOIN products AS p
        ON oi.product_id = p.product_id
    WHERE o.status = 'Completed'
    GROUP BY
        c.country,
        p.category
) AS ranked_categories
WHERE category_rank = 1
ORDER BY total_quantity DESC;
