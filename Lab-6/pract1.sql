CREATE DATABASE uniDB;
USE uniDB;

-- Main table
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Course VARCHAR(50)
);

-- Table to maintain total student count
CREATE TABLE Student_Count (
    Total_Students INT
);

-- Initial value
INSERT INTO Student_Count VALUES (0);


-- Trigger
DELIMITER //

CREATE TRIGGER after_student_insert
AFTER INSERT ON Student
FOR EACH ROW
BEGIN
    UPDATE Student_Count
    SET Total_Students = Total_Students + 1;
END //

DELIMITER ;


-- Insert students
INSERT INTO Student VALUES
(101, 'Rahul', 'BCA');

INSERT INTO Student VALUES
(102, 'Priya', 'BCA');

INSERT INTO Student VALUES
(103, 'Aman', 'BCA');


-- Check result
SELECT * FROM Student;

SELECT * FROM Student_Count;
