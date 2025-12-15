Assignment- SQL Basics 
Name- Md Mashuk Ali

-- Q1. Create a New Database and Table for Employees
CREATE DATABASE IF NOT EXISTS company_db;

USE company_db;

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

-- Q2. Insert Data into Employees Table
INSERT INTO employees (employee_id, first_name, last_name, department, salary, hire_date)
VALUES 
(101, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
(102, 'Riya', 'Kapoor', 'Sales', 75000, '2019-03-22'),
(103, 'Raj', 'Mehta', 'IT', 90000, '2018-07-11'),
(104, 'Neha', 'Verma', 'IT', 85000, '2021-09-01'),
(105, 'Arjun', 'Singh', 'Finance', 60000, '2022-02-10');

-- Q3. Display All Employee Records Sorted by Salary (Lowest to Highest)
SELECT * FROM employees 
ORDER BY salary ASC;

-- Q4. Show Employees Sorted by Department (A-Z) and Salary (High to Low)
SELECT * FROM employees 
ORDER BY department ASC, salary DESC;

-- Q5. List All Employees in the IT Department, Ordered by Hire Date (Newest First)
SELECT * FROM employees 
WHERE department = 'IT' 
ORDER BY hire_date DESC;

-- Q6. Create and Populate a Sales Table
CREATE TABLE IF NOT EXISTS sales (
    sale_id INT,
    amount INT,
    customer_name VARCHAR(50),
    sale_date DATE
);

INSERT INTO sales (sale_id, amount, customer_name, sale_date)
VALUES 
(1, 1500, 'Aditi', '2024-08-01'),
(2, 2200, 'Rohan', '2024-08-03'),
(3, 3500, 'Aditi', '2024-09-05'),
(4, 2700, 'Meena', '2024-09-15'),
(5, 4500, 'Rohan', '2024-09-25');

-- Q7. Display All Sales Records Sorted by Amount (Highest to Lowest)
SELECT * FROM sales 
ORDER BY amount DESC;

-- Q8. Show All Sales Made by Customer "Aditi"
SELECT * FROM sales 
WHERE customer_name = 'Aditi';

/*
Q9. What is the Difference Between a Primary Key and a Foreign Key?

- Primary Key: A unique identifier for a specific row in a table. It cannot be NULL and must be unique.
- Foreign Key: A field that links to the Primary Key of another table, creating a relationship between the two.
*/

/*
Q10. What Are Constraints in SQL and Why Are They Used?

Constraints are rules applied to columns to ensure data integrity and reliability.
- PRIMARY KEY: Uniquely identifies rows.
- NOT NULL: Prevents null values.
- UNIQUE: Ensures all values in a column are distinct.
- CHECK: Ensures values meet specific conditions.
*/