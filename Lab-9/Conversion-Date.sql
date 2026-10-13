USE uni_db;

SELECT * FROM students;
SELECT * FROM courses;

-- Conversion
SELECT course_id,
       CAST(course_id AS CHAR) AS course_id_string
FROM courses;

SELECT course_name,
       CAST(credits AS DECIMAL(5,2)) AS decimal_credits
FROM courses;

SELECT CAST('250' AS UNSIGNED) AS converted_number;

SELECT course_name,
       CONVERT(credits, CHAR) AS credits_string
FROM courses;

-- Date Functions
SELECT CURDATE() AS current_date;
SELECT NOW() AS current_datetime;

SELECT
    YEAR(CURDATE()) AS current_year,
    MONTH(CURDATE()) AS current_month,
    DAY(CURDATE()) AS current_day;
    
SELECT DATE_FORMAT(CURDATE(), '%d-%m-%Y')
       AS formatted_date;