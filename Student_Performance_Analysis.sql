-- Students Table
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

INSERT INTO students VALUES
(1, 'Akhil', 20),
(2, 'Sravani', 21),
(3, 'Karthik', 22),
(4, 'Niharika', 20),
(5, 'Lavanya', 21),
(6, 'Varsha',20),
(7, 'Tarun',21),
(8, 'Ravi',22),
(9, 'Sunny',21);

-- Courses Table
CREATE TABLE courses (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO courses VALUES
(101, 'SQL'),
(102, 'Python'),
(103, 'Data Analytics');

-- Enrollments Table
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    grade INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO enrollments VALUES
(1,101,85),
(2,102,78),
(3,101,35),
(4,103,60),
(5,102,92),
(6,103,88),
(7,101,45),
(8,102,55),
(9,103,30);

-- Query 1: List all students enrolled in each course
SELECT
    c.name AS course_name,
    s.name AS student_name,
    e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.id
JOIN courses c ON e.course_id = c.id
ORDER BY c.name;

-- Query 2: Average grade per course
SELECT
    c.name AS course_name,
    AVG(e.grade) AS average_grade
FROM enrollments e
JOIN courses c ON e.course_id = c.id
GROUP BY c.name;

-- Query 3: Top 3 students overall
SELECT
    s.name,
   AVG(e.grade) AS avg_grade
FROM students s
JOIN enrollments e ON s.id = e.student_id
GROUP BY s.id, s.name
ORDER BY avg_grade DESC
LIMIT 3;

-- Query 4: Count failed students
SELECT COUNT(DISTINCT student_id) AS failed_students
FROM enrollments
WHERE grade < 40;
