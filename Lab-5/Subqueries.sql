DROP DATABASE company;
CREATE DATABASE company;
USE company;

CREATE TABLE employees (
    name VARCHAR(50),
    salary INT,
    dept VARCHAR(50)
);

INSERT INTO employees VALUES 
('Alice', 70000, 'IT'),
('Bob', 90000, 'IT'),
('Charlie', 50000, 'HR'),
('Diana', 80000, 'Sales');

SELECT name, salary 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT name, salary 
FROM employees 
WHERE dept IN (SELECT dept FROM employees WHERE name = 'Alice');
