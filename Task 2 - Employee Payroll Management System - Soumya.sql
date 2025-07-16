-- Task 2
-- Project: Employee Payroll Management System

-- Database Setup:
CREATE DATABASE payroll_database;
USE payroll_database;

CREATE TABLE employees (
EMPLOYEE_ID INT PRIMARY KEY,
NAME VARCHAR (50),
DEPARTMENT VARCHAR (100),
EMAIL VARCHAR (100), 
PHONE_NO BIGINT, 
JOINING_DATE DATE, 
SALARY DECIMAL(10,2), 
BONUS DECIMAL(10,2), 
TAX_PERCENTAGE DECIMAL(5,2)
);

-- Data Entry:
INSERT INTO employees (EMPLOYEE_ID, NAME, DEPARTMENT, EMAIL, PHONE_NO, JOINING_DATE, SALARY, BONUS, TAX_PERCENTAGE) VALUES
(1, 'Ananya Rao', 'Sales', 'ananya.rao@example.com', 9876512340, '2025-03-12', 88000.00, 15000.00, 10.00),
(2, 'Vikram Singh', 'IT', 'vikram.singh@example.com', 9876512341, '2023-10-01', 95000.00, 8000.00, 12.00),
(3, 'Meera Nair', 'HR', 'meera.nair@example.com', 9876512342, '2022-05-18', 60000.00, 3000.00, 8.00),
(4, 'Ravi Desai', 'Sales', 'ravi.desai@example.com', 9876512343, '2024-12-20', 72000.00, 10000.00, 9.00),
(5, 'Sneha Pillai', 'Marketing', 'sneha.pillai@example.com', 9876512344, '2021-08-09', 85000.00, 9500.00, 11.00),
(6, 'Karan Mehta', 'Finance', 'karan.mehta@example.com', 9876512345, '2020-02-15', 105000.00, 10000.00, 15.00),
(7, 'Tanya Joshi', 'IT', 'tanya.joshi@example.com', 9876512346, '2024-05-05', 95000.00, 7000.00, 10.00),
(8, 'Arjun Verma', 'Finance', 'arjun.verma@example.com', 9876512347, '2023-12-25', 105000.00, 12000.00, 13.00),
(9, 'Nisha Kumar', 'HR', 'nisha.kumar@example.com', 9876512348, '2025-05-10', 60000.00, 5000.00, 7.50),
(10, 'Rohit Das', 'IT', 'rohit.das@example.com', 9876512349, '2024-11-11', 95000.00, 8500.00, 10.00);

-- Payroll Queries:
-- a) Retrieve the list of employees sorted by salary in descending order.
SELECT EMPLOYEE_ID, NAME, SALARY
FROM employees
ORDER BY SALARY DESC;

-- b) Find employees with a total compensation (SALARY + BONUS) greater than $100,000.
SELECT EMPLOYEE_ID, NAME, SALARY, BONUS, (SALARY+BONUS) AS TOTAL_COMPENSATION
FROM employees
WHERE (SALARY + BONUS) > 100000;

-- c) Update the bonus for employees in the ‘Sales’ department by 10%.
UPDATE employees
SET BONUS = BONUS * 1.10
WHERE EMPLOYEE_ID IN (1, 4);

-- d) Calculate the net salary after deducting tax for all employees.
SELECT EMPLOYEE_ID, NAME, SALARY, TAX_PERCENTAGE, (SALARY - (SALARY * TAX_PERCENTAGE / 100)) AS NET_SALARY
FROM employees;

-- e) Retrieve the average, minimum, and maximum salary per department.
SELECT DEPARTMENT, AVG(SALARY) AS AVG_SALARY, MIN(SALARY) AS MIN_SALARY,MAX(SALARY) AS MAX_SALARY
FROM employees
GROUP BY DEPARTMENT;

-- Advanced Queries:
-- a) Retrieve employees who joined in the last 6 months.
SELECT EMPLOYEE_ID, NAME, JOINING_DATE
FROM employees
WHERE JOINING_DATE >= CURDATE() - INTERVAL 6 MONTH;

-- b) Group employees by department and count how many employees each has.
SELECT DEPARTMENT, COUNT(EMPLOYEE_ID) AS TOTAL_EMPLOYEES
FROM employees
GROUP BY DEPARTMENT;

-- c) Find the department with the highest average salary.
SELECT DEPARTMENT, AVG(SALARY) AS AVERAGE_SALARY
FROM employees
GROUP BY DEPARTMENT
ORDER BY AVERAGE_SALARY DESC
LIMIT 1; 

-- d) Identify employees who have the same salary as at least one other employee.
SELECT EMPLOYEE_ID, NAME, SALARY
FROM employees
WHERE SALARY IN (
    SELECT SALARY
    FROM employees
    GROUP BY SALARY
    HAVING COUNT(*) > 1
);



