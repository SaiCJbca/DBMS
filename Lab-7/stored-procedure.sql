
DROP DATABASE collegedb;
CREATE DATABASE clgdb;
USE clgdb;

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name  VARCHAR(50),
    Email      VARCHAR(100)
);

INSERT INTO Student VALUES (101, 'Alice', 'Smith', 'alice@email.com');
INSERT INTO Student VALUES (102, 'Bob', 'Jones', 'bob@email.com');

DELIMITER //

CREATE PROCEDURE Get_Student_Details(IN p_student_id INT)
BEGIN
    SELECT Student_ID, First_Name, Last_Name, Email 
    FROM Student 
    WHERE Student_ID = p_student_id;
END //

DELIMITER ;

CALL Get_Student_Details(101);
