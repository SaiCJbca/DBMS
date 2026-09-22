DROP DATABASE uni_db;
CREATE DATABASE uni_db;
USE uni_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    major VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    credits INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (student_id, student_name, major) VALUES
(101, 'Alice Johnson', 'Computer Science'),
(102, 'Bob Smith', 'Mathematics'),
(103, 'Charlie Brown', 'History');

INSERT INTO courses (course_id, student_id, course_name, credits) VALUES
(5001, 101, 'Database Systems', 4),
(5002, 102, 'Calculus I', 4),
(5003, 101, 'Algorithms', 3),
(5004, NULL, 'Orientation 101', 1);

SELECT *
FROM students s
INNER JOIN courses c 
ON s.student_id = c.student_id;

SELECT *
FROM students s
LEFT JOIN courses c 
ON s.student_id = c.student_id;

SELECT *
FROM students s
RIGHT JOIN courses c 
ON s.student_id = c.student_id;
