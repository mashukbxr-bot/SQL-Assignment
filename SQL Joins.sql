Assignment- SQL Joins
Name- Md Mashuk Ali	


-- Create and use the database
CREATE DATABASE IF NOT EXISTS PWSkills_Joins_Assignment;
USE PWSkills_Joins_Assignment;

-- 1. Create Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName, City) VALUES
(1, 'John Smith', 'New York'),
(2, 'Mary Johnson', 'Chicago'),
(3, 'Peter Adams', 'Los Angeles'),
(4, 'Nancy Miller', 'Houston'),
(5, 'Robert White', 'Miami');

-- 2. Create Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount INT
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount) VALUES
(101, 1, '2024-10-01', 250),
(102, 2, '2024-10-05', 300),
(103, 1, '2024-10-07', 150),
(104, 3, '2024-10-10', 450),
(105, 6, '2024-10-12', 400);

-- 3. Create Payments Table
CREATE TABLE IF NOT EXISTS Payments (
    PaymentID VARCHAR(10),
    CustomerID INT,
    PaymentDate DATE,
    Amount INT
);

INSERT INTO Payments (PaymentID, CustomerID, PaymentDate, Amount) VALUES
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200);

-- 4. Create Employees Table
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    ManagerID INT
);

INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES
(1, 'Alex Green', NULL),
(2, 'Brian Lee', 1),
(3, 'Carol Ray', 1),
(4, 'David Kim', 2),
(5, 'Eva Smith', 2);


-- Assignment Solutions

-- Q1: Retrieve all customers who have placed at least one order.
SELECT DISTINCT c.CustomerName, c.City
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Q2: Retrieve all customers and their orders, including customers who have not placed any orders.
SELECT c.CustomerName, o.OrderID, o.OrderDate, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Q3: Retrieve all orders and their corresponding customers, including orders placed by unknown customers.
SELECT c.CustomerName, o.OrderID, o.Amount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Q4: Display all customers and orders, whether matched or not.
SELECT c.CustomerName, o.OrderID, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerName, o.OrderID, o.Amount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Q5: Find customers who have not placed any orders.
SELECT c.CustomerName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- Q6: Retrieve customers who made payments but did not place any orders.
SELECT c.CustomerName
FROM Customers c
JOIN Payments p ON c.CustomerID = p.CustomerID
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- Q7: Generate a list of all possible combinations between Customers and Orders.
SELECT c.CustomerName, o.OrderID
FROM Customers c
CROSS JOIN Orders o;

-- Q8: Show all customers along with order and payment amounts in one table.
SELECT c.CustomerName, o.Amount AS OrderAmount, p.Amount AS PaymentAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID;

-- Q9: Retrieve all customers who have both placed orders and made payments.
SELECT DISTINCT c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Payments p ON c.CustomerID = p.CustomerID;
