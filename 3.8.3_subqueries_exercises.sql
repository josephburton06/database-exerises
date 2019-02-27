USE employees;
-- Find all the employees with the same hire date as employee 101010 using a sub-query.
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date = (
	SELECT hire_date
    FROM employees
    WHERE emp_no = 101010)
ORDER BY emp_no;

-- Find all the titles held by all employees with the first name Aamod.

SELECT title, emp_no
FROM titles
WHERE emp_no IN (
	SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod');
    
-- How many people in the employees table are no longer working for the company?

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no NOT IN(
	SELECT emp_no
    FROM salaries
    WHERE to_date > NOW()
);

SELECT COUNT(*)
FROM employees
WHERE emp_no NOT IN(
	SELECT emp_no
	FROM salaries
    WHERE to_date > NOW()
);
    
SELECT *
FROM salaries
LIMIT 100;

-- Find all the current department managers that are female.
SELECT first_name, last_name
FROM employees
WHERE emp_no IN(
	SELECT emp_no
	FROM dept_manager
    WHERE to_date > NOW())
AND gender = 'F';

-- Find all the employees that currently have a higher than average salary.

SELECT e.first_name, e.last_name, s.salary
FROM employees AS e
JOIN salaries as s
ON e.emp_no = s.emp_no
WHERE s.salary > (SELECT AVG(salary)
					FROM salaries
                    )
AND s.to_date LIKE '9999-%';   
	
SELECT e.first_name, e.last_name, s.salary
FROM employees AS e
JOIN salaries as s
ON e.emp_no = s.emp_no
WHERE s.salary > (SELECT AVG(salary)
					FROM salaries
                    WHERE to_date > NOW()
                    )
AND s.to_date LIKE '9999-%';   
                    
-- How many current salaries are within 1 standard deviation of the highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) 
-- What percentage of all salaries is this?

SELECT COUNT(*)
FROM salaries
WHERE salary >=
	(SELECT MAX(salary) - STDDEV(salary)
    FROM salaries)
AND to_date > NOW();    

SELECT (COUNT(*) / (SELECT COUNT(*) FROM salaries WHERE to_date > NOW())) * 100
FROM salaries
WHERE salary >=
	(SELECT MAX(salary) - STDDEV(salary)
    FROM salaries)
AND to_date > NOW();

-- Find all the department names that currently have female managers.

SELECT dept_name
FROM departments as d
JOIN dept_manager as dm
ON d.dept_no = dm.dept_no
WHERE emp_no IN (
	SELECT emp_no
    FROM employees
    WHERE gender = 'F')
AND dm.to_date LIKE '9999-%'
ORDER BY dept_name;

SELECT dept_name
FROM departments
WHERE dept_no IN (
	SELECT dept_no
    FROM dept_manager
	WHERE emp_no IN (
		SELECT emp_no
		FROM employees
		WHERE gender = 'F')
	AND to_date LIKE '9999-%')
ORDER BY dept_name;

-- Find the first and last name of the employee with the highest salary.

SELECT first_name, last_name
FROM employees
WHERE emp_no = (
	SELECT emp_no
	FROM salaries
	WHERE salary = (
		SELECT MAX(salary)
		FROM salaries
        WHERE to_date > NOW()
        )
);

-- Find the department name that the employee with the highest salary works in.
SELECT dept_name
FROM departments
WHERE dept_no = (
	SELECT dept_no
	FROM dept_emp
	WHERE emp_no = (
		SELECT emp_no
		FROM employees
		WHERE emp_no = (
			SELECT emp_no
			FROM salaries
			ORDER BY salary DESC
			LIMIT 1
			)
		)
	);

  