USE ada_669;
SHOW tables;

SELECT *
FROM employees.employees
LIMIT 100;

-- Re-create the employees_with_departments table.

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

-- Update the table so that full name column contains the correct data

SELECT LENGTH(MAX(first_name)), LENGTH(MAX(last_name))
FROM employees_with_departments;

-- Add a column named full_name to this table. It should be a VARCHAR whose length is 
-- the sum of the lengths of the first name and last name columns

ALTER TABLE employees_with_departments ADD full_name VARCHAR(25);

UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

-- Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP COLUMN first_name;

ALTER TABLE employees_with_departments DROP COLUMN last_name;

SELECT *
FROM employees_with_departments;

-- Create a temporary table based on the payments table from the sakila database.

CREATE TEMPORARY TABLE sakila_payments AS
SELECT *
FROM sakila.payment
LIMIT 100;

ALTER TABLE sakila_payments ADD cents INT(10);

UPDATE sakila_payments SET cents = amount * 100;

ALTER TABLE sakila_payments MODIFY COLUMN amount INT(10);

UPDATE sakila_payments SET amount = cents;

ALTER TABLE sakila_payments DROP COLUMN cents;

CREATE TEMPORARY TABLE sakila_payments2 AS
SELECT *
FROM sakila.payment
LIMIT 100;



SELECT *
FROM sakila_payments;

DESCRIBE sakila_payments;

-- Find out how the average pay in each department compares to the overall average pay. 
-- In order to make the comparison easier, you should use the Z-score for salaries. 
-- In terms of salary, what is the best department to work for? 
-- The worst?

CREATE TEMPORARY TABLE z_salary_employees
SELECT de.emp_no, d.dept_no, d.dept_name, s.salary
FROM employees.dept_emp AS de
JOIN employees.salaries AS s USING(emp_no)
JOIN employees.departments AS d USING(dept_no)
WHERE s.to_date > NOW();

SELECT *
FROM z_salary_employees
LIMIT 100;

ALTER TABLE z_salary_employees ADD salary_z_score2 DEC(45, 25);

ALTER TABLE z_salary_employees ADD average_salary DEC(15, 8);

ALTER TABLE z_salary_employees ADD stddev_z_score DEC(25, 16);

ALTER TABLE z_salary_employees DROP COLUMN salary_z_score1;

UPDATE z_salary_employees SET average_salary = (72007.9421);

UPDATE z_salary_employees SET stddev_z_score = (17302.389746965822);

UPDATE z_salary_employees SET salary_z_score2 = ((salary - average_salary) / stddev_z_score);

UPDATE z_salary_employees SET salary_z_score2 = (17302.389746965822);

SELECT STDDEV(salary)
FROM z_salary_employees;

SELECT AVG(salary)
FROM z_salary_employees;

SELECT dept_name, AVG(salary_z_score2)
FROM z_salary_employees
GROUP BY dept_name
ORDER BY dept_name;

-- What is the average salary for an employee based on the number of years they have been 
-- with the company? Express your answer in terms of the Z-score of salary.
-- Since this data is a little older, scale the years of experience by subtracting 
-- the minumum from every row.

SELECT emp_no, salary, from_date, (SELECT UNIX_TIMESTAMP(from_date)/31557600 
	FROM employees.salaries WHERE to_date > NOW()) AS yrs_worked 
FROM employees.salaries
WHERE to_date > NOW()
LIMIT 1000;

SELECT emp_no, salary, from_date, (SELECT UNIX_TIMESTAMP(from_date) FROM employees.salaries) AS yrs_worked 
FROM employees.salaries
WHERE to_date > NOW()
LIMIT 1000;

SELECT emp_no, salary, from_date
FROM employees.salaries
WHERE to_date > NOW()
LIMIT 1000;

SELECT emp_no, UNIX_TIMESTAMP(from_date)/31557600 AS yrs_worked
FROM employees.salaries
WHERE to_date > NOW()
LIMIT 100;

-- Error Code: 1242. Subquery returns more than 1 row



