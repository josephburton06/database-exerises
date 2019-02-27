USE employees;
-- Q2 Below
SELECT DISTINCT(title)
FROM titles;
-- Q3 Below
SELECT DISTINCT(last_name)
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e';
-- Q4 BELOW
SELECT DISTINCT(last_name), first_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e';
-- Q5 Below
SELECT DISTINCT(last_name)
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';
-- Q6 Below
SELECT COUNT(DISTINCT(last_name), first_name)
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e';
-- Updated Q6 Most common last_name

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

-- Updated Q6 Most common by first_name

SELECT first_name, COUNT(first_name)
FROM employees
GROUP BY first_name
ORDER BY COUNT(first_name) DESC;

-- Updated Q6 Least Common first_name

SELECT first_name, COUNT(first_name)
FROM employees
GROUP BY first_name
ORDER BY COUNT(first_name);

-- Updated Q6 Least Common first_name

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name);

-- Updated Q6 Least Common first and last name combo

SELECT CONCAT(first_name, '_', last_name) AS full_name, COUNT(CONCAT(first_name, '_', last_name))
FROM employees
GROUP BY CONCAT(first_name, '_', last_name)
ORDER BY COUNT(CONCAT(first_name, '_', last_name));

-- Updated Q6 Most Common first and last name combo

SELECT CONCAT(first_name, '_', last_name) AS full_name, COUNT(CONCAT(first_name, '_', last_name))
FROM employees
GROUP BY CONCAT(first_name, '_', last_name)
ORDER BY COUNT(CONCAT(first_name, '_', last_name)) DESC;

-- Q7 Below
SELECT COUNT(first_name)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY(gender);
-- Q8 Below at Bottom
-- LEAVE ALONE, COPY AND PASTE
SELECT CONCAT(LOWER(SUBSTR(first_name, 1, 1)), 
LOWER(LEFT(last_name,4)), 
'_', SUBSTR(birth_date, 6, 2), 
SUBSTR(birth_date, 3, 2)) AS user_name
FROM employees
GROUP BY user_name;
-- TEST FUNCTION
SELECT CONCAT(LOWER(SUBSTR(first_name, 1, 1)), 
LOWER(LEFT(last_name,4)), 
'_', SUBSTR(birth_date, 6, 2), 
SUBSTR(birth_date, 3, 2)) AS user_name
FROM employees
GROUP BY user_name;
-- SHOWS user-name IN ASCENDING ORDER, YOU CAN SEE DUPLICATES RIGHT AWAY
SELECT CONCAT(LOWER(SUBSTR(first_name, 1, 1)), LOWER(LEFT(last_name,4)), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)) AS user_name
FROM employees
ORDER BY user_name;
-- Not quite for real, for real final Q8, but will group by user_name and then show the groups in descending order so you can see which groups had the most similar names.
SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), 
LEFT(last_name,4), 
'_', SUBSTR(birth_date, 6, 2), 
SUBSTR(birth_date, 3, 2))) AS user_name, COUNT(*)
FROM employees
GROUP BY user_name
ORDER BY COUNT(user_name) DESC;

-- For real, for real final Q8 not using an alias for group by or order by.

SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), 
LEFT(last_name,4), 
'_', SUBSTR(birth_date, 6, 2), 
SUBSTR(birth_date, 3, 2))) AS user_name, COUNT(*)
FROM employees
GROUP BY (LOWER(CONCAT(SUBSTR(first_name, 1, 1), 
LEFT(last_name,4), 
'_', SUBSTR(birth_date, 6, 2), 
SUBSTR(birth_date, 3, 2))))
ORDER BY COUNT(LOWER(CONCAT(SUBSTR(first_name, 1, 1), 
LEFT(last_name,4), 
'_', SUBSTR(birth_date, 6, 2), 
SUBSTR(birth_date, 3, 2)))) DESC;

-- Trying to get duplicate count in one query.  This creates another column to show the count of repeats (count of each minus one since that' the original).

SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), 
LEFT(last_name,4), 
'_', SUBSTR(birth_date, 6, 2), 
SUBSTR(birth_date, 3, 2))) AS user_name, COUNT(*), (COUNT(*) - 1) AS repeat_count
FROM employees
GROUP BY (LOWER(CONCAT(SUBSTR(first_name, 1, 1), 
LEFT(last_name,4), 
'_', SUBSTR(birth_date, 6, 2), 
SUBSTR(birth_date, 3, 2))))
ORDER BY COUNT(LOWER(CONCAT(SUBSTR(first_name, 1, 1), 
LEFT(last_name,4), 
'_', SUBSTR(birth_date, 6, 2), 
SUBSTR(birth_date, 3, 2)))) DESC;

