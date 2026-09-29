CREATE DATABASE COUP;
USE COUP;

DROP TABLE IF EXISTS Deleted_Employee_Log;
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hire_date DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE Deleted_Employee_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER before_employee_delete
BEFORE DELETE ON Employee
FOR EACH ROW
BEGIN
    IF OLD.department = 'Management' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Employees in the Management department cannot be deleted.';
    END IF;
END //

CREATE TRIGGER after_employee_delete
AFTER DELETE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Deleted_Employee_Log (employee_id, first_name, last_name, department)
    VALUES (OLD.employee_id, OLD.first_name, OLD.last_name, OLD.department);
END //

DELIMITER ;
