CREATE DATABASE shop_db;
USE shop_db;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Customers 
INSERT INTO Customers VALUES
(1, 'Ravi', 'Chennai'),
(2, 'Priya', 'Madurai'),
(3, 'Kumar', 'Salem'),
(4, 'Anu', 'Chennai'),
(5, 'Divya', 'Coimbatore'),
(6, 'Ramesh', 'Trichy'),
(7, 'Sneha', 'Chennai'),
(8, 'Vijay', 'Madurai'),
(9, 'Meena', 'Salem'),
(10, 'Karthik', 'Bangalore');

-- Orders 
INSERT INTO Orders VALUES
(201, 1, 5000, '2024-01-10'),
(202, 2, 7500, '2024-01-12'),
(203, 1, 3000, '2024-01-15'),
(204, 3, 12000, '2024-02-01'),
(205, 4, 4500, '2024-02-05'),
(206, 5, 9000, '2024-02-10'),
(207, 2, 6500, '2024-02-15'),
(208, 6, 15000, '2024-03-01'),
(209, 7, 2500, '2024-03-05'),
(210, 8, 8000, '2024-03-10');

SELECT * FROM Customers;
SELECT * FROM Orders;
-- queries--
-- 16. Find the total order amount for each customer.
SELECT customer_id, SUM(amount) AS total_amount
FROM Orders
GROUP BY customer_id;

-- 17. Find customers who have placed more than 3 orders.
SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 3;

-- 18. Find the average order amount for each customer.
SELECT customer_id, AVG(amount) AS avg_amount
FROM Orders
GROUP BY customer_id;

-- 19. Find the highest order amount placed by each customer.
SELECT customer_id, MAX(amount) AS highest_amount
FROM Orders
GROUP BY customer_id;

-- 20. Display customers sorted by their total purchase amount.
SELECT customer_id, SUM(amount) AS total_amount
FROM Orders
GROUP BY customer_id
ORDER BY total_amount DESC;

-- 21. Find customers whose total purchase amount exceeds 10,000.
SELECT customer_id, SUM(amount) AS total_amount
FROM Orders
GROUP BY customer_id
HAVING SUM(amount) > 10000;

-- 22. Display customer names along with the total number of orders placed.
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 23. Find the customer who spent the highest amount.
SELECT customer_id, SUM(amount) AS total_amount
FROM Orders
GROUP BY customer_id
ORDER BY total_amount DESC
LIMIT 1;

-- 24. Find the customer who placed the maximum number of orders.
SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 1;

-- 25. Find customers whose average order amount is greater than 2,000.
SELECT customer_id, AVG(amount) AS avg_amount
FROM Orders
GROUP BY customer_id
HAVING AVG(amount) > 2000;

-- 26. Display the top 5 customers based on total purchase amount.
SELECT customer_id, SUM(amount) AS total_amount
FROM Orders
GROUP BY customer_id
ORDER BY total_amount DESC
LIMIT 5;

-- 27. Find the minimum order amount for each customer.
SELECT customer_id, MIN(amount) AS min_amount
FROM Orders
GROUP BY customer_id;

-- 28. Find customers who have placed orders worth more than 5,000 in total.
SELECT customer_id, SUM(amount) AS total_amount
FROM Orders
GROUP BY customer_id
HAVING SUM(amount) > 5000;

-- 29. Display customer-wise total orders and total purchase amount.
SELECT customer_id, COUNT(*) AS total_orders, SUM(amount) AS total_amount
FROM Orders
GROUP BY customer_id;

-- 30. Find customers who placed more than 2 orders and spent more than 8,000.
SELECT customer_id, COUNT(*) AS total_orders, SUM(amount) AS total_amount
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 2 AND SUM(amount) > 8000;