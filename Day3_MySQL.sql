CREATE DATABASE University_db;
USE University_db;
SELECT DATABASE();

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    amount DECIMAL(10, 2),
    status VARCHAR(20)
);

INSERT INTO Orders (order_id, customer_id, order_date, amount, status) VALUES
(1, 101, '2024-01-15 10:30:00', 150.00, 'Completed'),
(2, 102, '2024-02-10 14:20:00', 300.00, 'Completed'),
(3, 101, '2024-01-20 09:00:00', 50.00, 'Completed'),
(4, 103, '2024-03-05 16:45:00', 600.00, 'Pending'),
(5, 101, '2024-04-12 11:15:00', 200.00, 'Completed'),
(6, 102, '2024-04-20 13:00:00', 250.00, 'Cancelled'),
(7, 104, '2024-01-05 08:30:00', 550.00, 'Completed'),
(8, 101, '2024-05-01 10:00:00', 100.00, 'Completed');

SELECT *
FROM Orders
WHERE status = 'Completed'
ORDER BY order_date DESC, amount DESC;

SELECT
    SUM(amount) AS total_revenue,
    AVG(amount) AS average_order_value,
    COUNT(*) AS total_orders
FROM Orders
WHERE customer_id = 101;

SELECT
    customer_id,
    SUM(amount) AS total_spent
FROM Orders
GROUP BY customer_id
HAVING SUM(amount) > 500
ORDER BY total_spent DESC;

SELECT
    customer_id,
    MIN(order_date) AS first_order,
    MAX(order_date) AS last_order,
    TIMESTAMPDIFF(DAY, MIN(order_date), MAX(order_date)) AS days_between
FROM Orders
GROUP BY customer_id;
