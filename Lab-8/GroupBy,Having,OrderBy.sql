USE uni_db;

SELECT * FROM students;
SELECT * FROM courses;

-- GROUP BY
SELECT student_id, COUNT(*) AS total_courses
FROM courses
GROUP BY student_id;

SELECT student_id, SUM(credits) AS total_credits
FROM courses
GROUP BY student_id;

-- HAVING
SELECT student_id, COUNT(*) AS total_courses
FROM courses
GROUP BY student_id
HAVING COUNT(*) > 1;

-- ORDER BY
SELECT * FROM courses
ORDER BY credits ASC;

SELECT * FROM courses
ORDER BY credits DESC;



