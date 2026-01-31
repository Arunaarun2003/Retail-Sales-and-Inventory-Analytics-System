CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    gender VARCHAR(10),
    city VARCHAR(50),
    registration_date DATE
);
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    stock_quantity INT,
    last_updated DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers (customer_name, gender, city, registration_date) VALUES
('Arun', 'Male', 'Chennai', '2023-01-10'),
('Divya', 'Female', 'Bangalore', '2023-02-15'),
('Rahul', 'Male', 'Mumbai', '2023-03-20'),
('Sneha', 'Female', 'Chennai', '2023-04-05');
INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 55000),
('Mobile', 'Electronics', 25000),
('Headphones', 'Accessories', 3000),
('Keyboard', 'Accessories', 1500);
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-01-05', 58000),
(2, '2024-01-15', 25000),
(1, '2024-02-10', 3000),
(3, '2024-02-18', 55000),
(4, '2024-03-01', 1500);
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 2, 1),
(3, 3, 1),
(4, 1, 1),
(5, 4, 1);
INSERT INTO inventory (product_id, stock_quantity, last_updated) VALUES
(1, 15, '2024-03-01'),
(2, 40, '2024-03-01'),
(3, 10, '2024-03-01'),
(4, 60, '2024-03-01');


SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

SELECT 
    p.category,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sold DESC;

SELECT 
    c.customer_name,
    SUM(o.total_amount) AS lifetime_value
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY lifetime_value DESC;

SELECT 
    p.product_name,
    i.stock_quantity
FROM inventory i
JOIN products p 
    ON i.product_id = p.product_id
WHERE i.stock_quantity < 20;

SELECT 
    p.product_name,
    i.stock_quantity
FROM inventory i
JOIN products p 
    ON i.product_id = p.product_id
WHERE i.stock_quantity > 50;

SELECT 
    c.city,
    SUM(o.total_amount) AS total_revenue
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;

SELECT 
    CASE 
        WHEN COUNT(o.order_id) = 1 THEN 'New Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

SELECT 
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders;

