USE employees;
SHOW TABLES;
--  4. current_dept_emp, departments, dept_emp, dept_emp_latest_date, dept_manager, employees, salaries, titles are the names of the tables in the employees database
DESCRIBE employees;
-- emp_no, birth_date, first_name, last_name, gender, hire_date are the fields in the employees table
-- 5. int(11), date, varchar(14), varchar(16), enum('M','F'), date are the types of values
-- 6. numeric type: emp_no
-- 7. string type: first_name, last_name, gender
-- 8. date type: birth_date, hire_date
DESCRIBE departments;
-- 9. They contain different fields.
SHOW CREATE TABLE dept_manager; -- 10.
-- CREATE TABLE `dept_manager` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1