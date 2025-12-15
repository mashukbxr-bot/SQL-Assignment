Assignment- SubQueries
Name- Md Mashuk Ali

-- 1. DATABASE AND TABLE SETUP

CREATE DATABASE IF NOT EXISTS dpp_subqueries;
USE dpp_subqueries;

-- Drop tables if they exist
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

-- Create Department Table
CREATE TABLE Department (
    department_id VARCHAR(3) PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL
);

-- Create Employee Table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department_id VARCHAR(3),
    salary INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    sale_amount INT NOT NULL,
    sale_date DATE NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

-- Insert data into Department
INSERT INTO Department (department_id, department_name, location) VALUES
('D01', 'Sales', 'Mumbai'),
('D02', 'Marketing', 'Delhi'),
('D03', 'Finance', 'Pune'),
('D04', 'HR', 'Bengaluru'),
('D05', 'IT', 'Hyderabad');

-- Insert data into Employee
INSERT INTO Employee (emp_id, name, department_id, salary) VALUES
(101, 'Abhishek', 'D01', 62000),
(102, 'Shubham', 'D01', 58000),
(103, 'Priya', 'D02', 67000),
(104, 'Rohit', 'D02', 64000),
(105, 'Neha', 'D03', 72000),
(106, 'Aman', 'D03', 55000),
(107, 'Ravi', 'D04', 60000),
(108, 'Sneha', 'D04', 75000),
(109, 'Kiran', 'D05', 70000),
(110, 'Tanuja', 'D05', 65000);

-- Insert data into Sales
INSERT INTO Sales (sale_id, emp_id, sale_amount, sale_date) VALUES
(201, 101, 4500, '2025-01-05'),
(202, 102, 7800, '2025-01-10'),
(203, 103, 6700, '2025-01-14'),
(204, 104, 12000, '2025-01-20'),
(205, 105, 9800, '2025-02-02'),
(206, 106, 10500, '2025-02-05'),
(207, 107, 3200, '2025-02-09'),
(208, 108, 5100, '2025-02-15'),
(209, 109, 3900, '2025-02-20'),
(210, 110, 7200, '2025-03-01');


-- 2. BASIC LEVEL SOLUTIONS

-- 1. Employees earning more than average salary
SELECT
    name
FROM
    Employee
WHERE
    salary > (
        SELECT AVG(salary) FROM Employee
    );

-- 2. Employees in the department with the highest average salary
SELECT
    E.name
FROM
    Employee E
WHERE
    E.department_id = (
        SELECT
            department_id
        FROM
            Employee
        GROUP BY
            department_id
        ORDER BY
            AVG(salary) DESC
        LIMIT 1
    );

-- 3. Employees who have made at least one sale
SELECT
    name
FROM
    Employee
WHERE
    emp_id IN (
        SELECT DISTINCT emp_id FROM Sales
    );

-- 4. Employee with the highest sale amount
SELECT
    E.name
FROM
    Employee E
JOIN
    Sales S ON E.emp_id = S.emp_id
WHERE
    S.sale_amount = (
        SELECT MAX(sale_amount) FROM Sales
    );

-- 5. Employees with salary higher than Shubham's
SELECT
    name
FROM
    Employee
WHERE
    salary > (
        SELECT salary FROM Employee WHERE name = 'Shubham'
    );


-- 3. INTERMEDIATE LEVEL SOLUTIONS

-- 1. Employees in the same department as Abhishek (excluding him)
SELECT
    name
FROM
    Employee
WHERE
    department_id = (
        SELECT department_id FROM Employee WHERE name = 'Abhishek'
    )
    AND name != 'Abhishek';

-- 2. Departments with at least one employee earning more than 60,000
SELECT
    department_name
FROM
    Department
WHERE
    department_id IN (
        SELECT DISTINCT department_id FROM Employee WHERE salary > 60000
    );

-- 3. Department name of the employee who made the highest sale
SELECT
    D.department_name
FROM
    Department D
JOIN
    Employee E ON D.department_id = E.department_id
WHERE
    E.emp_id = (
        SELECT emp_id FROM Sales ORDER BY sale_amount DESC LIMIT 1
    );

-- 4. Employees who made sales greater than the average sale amount
SELECT DISTINCT
    E.name,
    S.sale_amount
FROM
    Employee E
JOIN
    Sales S ON E.emp_id = S.emp_id
WHERE
    S.sale_amount > (
        SELECT AVG(sale_amount) FROM Sales
    );

-- 5. Total sales made by employees who earn more than the average salary
SELECT
    SUM(sale_amount) AS total_sales_by_high_earners
FROM
    Sales
WHERE
    emp_id IN (
        SELECT
            emp_id
        FROM
            Employee
        WHERE
            salary > (SELECT AVG(salary) FROM Employee)
    );


-- 4. ADVANCED LEVEL SOLUTIONS

-- 1. Employees who have not made any sales
SELECT
    name
FROM
    Employee
WHERE
    emp_id NOT IN (
        SELECT DISTINCT emp_id FROM Sales
    );

-- 2. Departments where the average salary is above ₹55,000
SELECT
    D.department_name,
    AvgSalary.avg_dept_salary
FROM
    Department D
JOIN
    (
        SELECT
            department_id,
            AVG(salary) AS avg_dept_salary
        FROM
            Employee
        GROUP BY
            department_id
        HAVING
            AVG(salary) > 55000
    ) AS AvgSalary ON D.department_id = AvgSalary.department_id;

-- 3. Retrieve department names where the total sales exceed ₹10,000
SELECT
    D.department_name,
    DeptSales.total_sales
FROM
    Department D
JOIN
    (
        SELECT
            E.department_id,
            SUM(S.sale_amount) AS total_sales
        FROM
            Employee E
        JOIN
            Sales S ON E.emp_id = S.emp_id
        GROUP BY
            E.department_id
        HAVING
            SUM(S.sale_amount) > 10000
    ) AS DeptSales ON D.department_id = DeptSales.department_id;

-- 4. Find the employee who has made the second-highest sale
SELECT
    E.name
FROM
    Employee E
JOIN
    Sales S ON E.emp_id = S.emp_id
WHERE
    S.sale_amount = (
        SELECT
            MAX(sale_amount)
        FROM
            Sales
        WHERE
            sale_amount < (
                SELECT MAX(sale_amount) FROM Sales
            )
    );

-- 5. Retrieve the names of employees whose salary is greater than the highest sale amount recorded
SELECT
    name
FROM
    Employee
WHERE
    salary > (
        SELECT MAX(sale_amount) FROM Sales
    );