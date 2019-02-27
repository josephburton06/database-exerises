USE join_example_db;
-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson.
-- Left join
SELECT * 
FROM users u
LEFT JOIN roles r
ON u.id = r.id;
-- Right join
SELECT * 
FROM users u
RIGHT JOIN roles r
ON u.id = r.id;
-- Join
SELECT * 
FROM users u
JOIN roles r
ON u.id = r.id;
-- NOT FINISHED * Q3 Count of each role
SELECT r.name, COUNT(*)
FROM users u
JOIN roles r
ON u.role_id = r.id
GROUP BY r.name;

USE employees;

SELECT *
FROM dept_manager
LIMIT 50;

DESCRIBE employees;

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM departments AS d
JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no
WHERE dm.to_date LIKE '9999-%'
ORDER BY d.dept_name;

-- Find the name of all departments currently managed by women.

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM departments AS d
JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no
WHERE dm.to_date LIKE '9999-%'
AND e.gender = 'F'
ORDER BY d.dept_name;

-- Find the current titles of employees currently working in the Customer Service department.
SELECT t.title AS 'Title', COUNT(*)
FROM departments AS d
JOIN dept_emp AS de
ON d.dept_no = de.dept_no
JOIN titles AS t
ON de.emp_no = t.emp_no
WHERE d.dept_name = 'Customer Service'
AND de.to_date LIKE '9999-%'
AND t.to_date LIKE '9999-%'
GROUP BY t.title;

-- Find the current salary of all current managers.

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager', s.salary
FROM departments AS d
JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no
JOIN salaries AS s
ON dm.emp_no = s.emp_no
WHERE dm.to_date LIKE '9999-%'
AND s.to_date LIKE '9999-%'
ORDER BY d.dept_name;

-- Find the number of employees in each department.

SELECT d.dept_no, d.dept_name, COUNT(*)
FROM departments as d
JOIN dept_emp as de
ON d.dept_no = de.dept_no
WHERE de.to_date LIKE '9999-%'
GROUP BY d.dept_no;

-- Which department has the highest average salary?

SELECT d.dept_name AS dept_name, AVG(s.salary) AS average_salary
FROM departments AS d
JOIN dept_emp as de
ON d.dept_no = de.dept_no
JOIN salaries as s
ON de.emp_no = s.emp_no
WHERE s.to_date LIKE '9999-%'
AND de.to_date LIKE '9999-%'
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC
LIMIT 1;

-- Who is the highest paid employee in the Marketing department?

SELECT e.first_name, e.last_name
FROM departments AS d
JOIN dept_emp AS de
ON d.dept_no = de.dept_no
JOIN salaries AS s
ON de.emp_no = s.emp_no
JOIN employees AS e
ON e.emp_no = s.emp_no
WHERE d.dept_no LIKE 'd001'
AND s.to_date LIKE '9999-%'
AND de.to_date LIKE '9999-%'
ORDER BY s.salary DESC
LIMIT 1;

-- Which current department manager has the highest salary?

SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM departments AS d
JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no
JOIN salaries AS s
ON dm.emp_no = s.emp_no
WHERE dm.to_date LIKE '9999-%'
AND s.to_date LIKE '9999-%'
ORDER BY s.salary DESC
LIMIT 1;

-- Bonus Find the names of all current employees, their department name, and their current manager's name.

SELECT CONCAT(e.first_name,' ', e.last_name) AS emp_name, d.dept_name, CONCAT(em.first_name, ' ', em.last_name) AS 'Manager'
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
JOIN dept_manager AS dm
ON dm.dept_no = d.dept_no
JOIN employees AS em
ON em.emp_no = dm.emp_no
JOIN salaries AS s
ON s.emp_no = e.emp_no
WHERE s.to_date LIKE '9999-%'
AND de.to_date LIKE '9999-%'
AND dm.to_date LIKE '9999-%';

