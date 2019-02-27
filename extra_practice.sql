SELECT *
FROM mysql.help_topic;
USE employees;
SELECT *
from salaries; -- emp_no, salary, start date, and end date (or currently employed)
USE sakila;
SHOW TABLES;
DESCRIBE category;
SELECT *
FROM actor;
SELECT last_name
FROM actor;
SELECT *
FROM film;
SELECT title, description, rating, length
FROM film
WHERE length > 180;
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date > '2005/05/27 00:00:01';
DESCRIBE payment;
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date BETWEEN '2005/05/27 00:00:01' AND '2005/05/27 23:59:59';