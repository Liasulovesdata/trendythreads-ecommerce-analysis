CREATE TABLE customers (
   customer_id INT PRIMARY KEY,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   email VARCHAR(100),
   signup_date DATE,
   country VARCHAR(50)
);
INSERT INTO customers (customer_id, first_name, last_name, email, signup_date, country) VALUES
(1, 'Alice', 'Smith', 'alice.smith@email.com', '2024-11-15', 'USA'),
(2, 'Bob', 'Johnson', 'bjohnson@email.com', '2024-12-01', 'Canada'),
(3, 'Charlie', 'Brown', 'charlie.b@email.com', '2025-01-10', 'UK'),
(4, 'Diana', 'Prince', 'dprince@email.com', '2025-02-22', 'USA'),
(5, 'Evan', 'Wright', 'ewright@email.com', '2025-03-05', 'Australia'),
(6, 'Fiona', 'Gallagher', 'fiona.g@email.com', '2025-03-12', 'Ireland'),
(7, 'George', 'Miller', 'gmiller@email.com', '2025-04-01', 'USA'),
(8, 'Hannah', 'Abbott', 'hannah.a@email.com', '2024-08-19', 'Canada'),
(9, 'Ian', 'Malcolm', 'ian.m@email.com', '2025-01-05', 'UK'),
(10, 'Julia', 'Roberts', 'julia.r@email.com', '2025-05-20', 'USA');

CREATE TABLE products (
   product_id INT PRIMARY KEY,
   product_name VARCHAR(100),
   category VARCHAR(50),
   price DECIMAL(10, 2),
   stock_quantity INT
);
INSERT INTO products (product_id, product_name, category, price, stock_quantity) VALUES
(101, 'Classic White Tee', 'Tops', 19.99, 150),
(102, 'Vintage Denim Jacket', 'Tops', 59.99, 12),
(103, 'High-Waisted Jeans', 'Bottoms', 49.99, 85),
(104, 'Yoga Leggings', 'Bottoms', 29.99, 200),
(105, 'Leather Crossbody Bag', 'Accessories', 89.99, 8),
(106, 'Silver Hoop Earrings', 'Accessories', 14.99, 300),
(107, 'Running Sneakers', 'Footwear', 119.99, 45),
(108, 'Canvas Slip-ons', 'Footwear', 39.99, 15),
(109, 'Graphic Hoodie', 'Tops', 45.00, 60),
(110, 'Wool Scarf', 'Accessories', 25.00, 5);

CREATE TABLE orders (
   order_id INT PRIMARY KEY,
   customer_id INT,
   order_date TIMESTAMP,
   total_amount DECIMAL(10, 2),
   status VARCHAR(20),
   FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO orders (order_id, customer_id, order_date, total_amount, status) VALUES
(1001, 1, '2025-01-15 10:30:00', 79.98, 'Completed'),
(1002, 2, '2025-01-18 14:45:00', 89.99, 'Completed'),
(1003, 3, '2025-01-22 09:15:00', 119.99, 'Completed'),
(1004, 4, '2025-02-05 16:20:00', 34.98, 'Completed'),
(1005, 1, '2025-02-10 11:10:00', 49.99, 'Processing'),
(1006, 5, '2025-02-15 18:05:00', 164.99, 'Completed'),
(1007, 6, '2025-03-01 08:30:00', 59.99, 'Cancelled'),
(1008, 8, '2025-03-10 13:25:00', 159.98, 'Completed'),
(1009, 2, '2025-03-15 15:50:00', 25.00, 'Completed'),
(1010, 7, '2025-04-05 10:00:00', 45.00, 'Completed'),
(1011, 4, '2025-04-12 14:15:00', 104.98, 'Completed'),
(1012, 9, '2025-04-20 09:45:00', 39.99, 'Completed'),
(1013, 1, '2025-04-25 11:30:00', 119.99, 'Completed'),
(1014, 3, '2025-05-02 16:40:00', 19.99, 'Processing'),
(1015, 5, '2025-05-10 12:20:00', 89.99, 'Completed');

CREATE TABLE order_items (
   order_item_id INT PRIMARY KEY,
   order_id INT,
   product_id INT,
   quantity INT,
   unit_price DECIMAL(10, 2),
   FOREIGN KEY (order_id) REFERENCES orders(order_id),
   FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(5001, 1001, 103, 1, 49.99),
(5002, 1001, 104, 1, 29.99),
(5003, 1002, 105, 1, 89.99),
(5004, 1003, 107, 1, 119.99),
(5005, 1004, 101, 1, 19.99),
(5006, 1004, 106, 1, 14.99),
(5007, 1005, 103, 1, 49.99),
(5008, 1006, 109, 1, 45.00),
(5009, 1006, 107, 1, 119.99),
(5010, 1007, 102, 1, 59.99),
(5011, 1008, 107, 1, 119.99),
(5012, 1008, 108, 1, 39.99),
(5013, 1009, 110, 1, 25.00),
(5014, 1010, 109, 1, 45.00),
(5015, 1011, 102, 1, 59.99),
(5016, 1011, 109, 1, 45.00),
(5017, 1012, 108, 1, 39.99),
(5018, 1013, 107, 1, 119.99),
(5019, 1014, 101, 1, 19.99),
(5020, 1015, 105, 1, 89.99);

SELECT *
FROM customers;

SELECT *
FROM products;

SELECT *
FROM orders;

SELECT *
FROM order_items;
