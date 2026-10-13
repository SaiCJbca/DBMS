USE uni_db;

SELECT * FROM students;
SELECT * FROM courses;

SELECT *
FROM courses
WHERE credits BETWEEN 2 AND 4;

SELECT *
FROM students
WHERE major IN ('Computer Science', 'Mathematics');

SELECT *
FROM students
WHERE student_name LIKE 'A%';

SELECT *
FROM courses
WHERE student_id IS NULL;

SELECT *
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM courses c
    WHERE c.student_id = s.student_id
);

-- Set Operators

SELECT student_name AS name
FROM students

UNION

SELECT course_name AS name
FROM courses;

SELECT student_name AS result
FROM students
WHERE major = 'Computer Science'

UNION

SELECT course_name AS result
FROM courses
WHERE credits = 4;

SELECT student_id AS id
FROM students

UNION ALL

SELECT student_id AS id
FROM courses;

