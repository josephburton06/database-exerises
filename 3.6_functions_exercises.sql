USE employees;
SELECT first_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no;
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no DESC;
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name DESC, first_name DESC;
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
SELECT COUNT(first_name)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%';
SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE 'E%';
DESCRIBE employees;
SELECT *
FROM employees;
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
SELECT COUNT(*)
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '____-12-25%'
ORDER BY birth_date, hire_date DESC;
SELECT *
FROM employees 
WHERE birth_date LIKE '____-12-25%';
SELECT COUNT(*)
FROM employees 
WHERE birth_date LIKE '____-12-25%';
SELECT *
FROM employees
WHERE last_name LIKE '%q%';
SELECT COUNT(*)
FROM employees
WHERE last_name LIKE '%q%';
SELECT first_name
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
SELECT COUNT(first_name)
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%e';
SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%e';
-- Q2 Below
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e';
-- Q3 Below
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e';
SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e';
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '____-12-25';
SELECT COUNT(*)
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '____-12-25';
-- Q4 Below
SELECT DATEDIFF(CURDATE(), hire_date) AS days_worked, hire_date, first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '____-12-25';
SELECT *
FROM employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%';
SELECT COUNT(*)
FROM employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%';
-- Q5A Below
SELECT MIN(salary) AS min_salary
FROM salaries;
-- Q5B Below
SELECT MAX(salary) AS max_salary
FROM salaries;
-- Q6 Next 2 Below
SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), 
LEFT(last_name,4), 
'_', SUBSTR(birth_date, 6, 2), 
SUBSTR(birth_date, 3, 2)))
FROM employees
LIMIT 20;
SELECT CONCAT(LOWER(LEFT(first_name, 1)), LOWER(LEFT(last_name,4)), '_', MID(birth_date, 6, 2), MID(birth_date, 3, 2)) AS user_name
FROM employees
LIMIT 20;