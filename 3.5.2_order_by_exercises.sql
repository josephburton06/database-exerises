USE employees;
SELECT first_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- Q2 Below
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
-- Q3 Below
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;
-- Q4 Below
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;
-- Q5 Below
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no;
-- Q6A Below
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no DESC;
-- Q6B Below
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
-- Q7 Below
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
SELECT last_name
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
SELECT *
FROM employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%';
SELECT COUNT(*)
FROM employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%';