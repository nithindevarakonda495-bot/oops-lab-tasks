CREATE DATABASE student_db;
USE student_db;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);

--  Sample Data
INSERT INTO Students VALUES
(1, 'Ravi', 'CSE', 85),
(2, 'Priya', 'ECE', 92),
(3, 'Kumar', 'CSE', 78),
(4, 'Anu', 'EEE', 88),
(5, 'Divya', 'ECE', 95),
(6, 'Ramesh', 'CSE', 65),
(7, 'Sneha', 'EEE', 72),
(8, 'Vijay', 'MECH', 80),
(9, 'Meena', 'CSE', 90),
(10, 'Karthik', 'ECE', 69);

SELECT * FROM Students;

-- queries--
-- 31. Find the average marks scored by students in each department.
SELECT department, AVG(marks) AS avg_marks
FROM Students
GROUP BY department;

-- 32. Find departments whose average marks are above 75.
SELECT department, AVG(marks) AS avg_marks
FROM Students
GROUP BY department
HAVING AVG(marks) > 75;

-- 33. Find the highest mark scored in each department.
SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department;

-- 34. Find the total number of students in each department.
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department;

-- 35. Find departments having more than 5 students.
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
HAVING COUNT(*) > 5;

-- 36. Display departments sorted by average marks in descending order.
SELECT department, AVG(marks) AS avg_marks
FROM Students
GROUP BY department
ORDER BY avg_marks DESC;

-- 37. Find the top 3 departments based on average marks.
SELECT department, AVG(marks) AS avg_marks
FROM Students
GROUP BY department
ORDER BY avg_marks DESC
LIMIT 3;

-- 38. Find departments whose average marks are between 70 and 90.
SELECT department, AVG(marks) AS avg_marks
FROM Students
GROUP BY department
HAVING AVG(marks) BETWEEN 70 AND 90;

-- 39. Find the total marks scored by students in each department.
SELECT department, SUM(marks) AS total_marks
FROM Students
GROUP BY department;

-- 40. Display departments sorted by the total number of students.
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
ORDER BY total_students DESC;

-- 41. Find the lowest mark scored in each department.
SELECT department, MIN(marks) AS lowest_marks
FROM Students
GROUP BY department;

-- 42. Find departments where the highest mark is greater than 90.
SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department
HAVING MAX(marks) > 90;

-- 43. Find the number of students scoring above 80 in each department.
SELECT department, COUNT(*) AS count_above_80
FROM Students
WHERE marks > 80
GROUP BY department;

-- 44. Find departments where more than 3 students scored above 75.
SELECT department, COUNT(*) AS count_above_75
FROM Students
WHERE marks > 75
GROUP BY department
HAVING COUNT(*) > 3;

-- 45. Display departments ordered by highest mark in descending order.
SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department
ORDER BY highest_marks DESC;