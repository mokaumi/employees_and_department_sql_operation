USE students_record_sql;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);


CREATE TABLE grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    grade CHAR(2),

    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    date DATE,
    status ENUM('Present', 'Absent'),

    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


INSERT INTO students (student_id, name, email) VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com');

INSERT INTO courses (course_id, course_name) VALUES
(101, 'Mathematics'),
(102, 'English');

SELECT *
FROM COURSES;

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 'A'),
(1, 102, 'B'),
(2, 101, 'C');

ALTER TABLE courses 
ADD COLUMN instructor_id INT,
ADD FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id);

INSERT INTO instructors (instructor_id, name, email) VALUES
(1, 'Dr. Adams', 'adams@school.edu'),
(2, 'Prof. Grace', 'grace@school.edu');

UPDATE courses SET instructor_id = 1 WHERE course_id = 101;
UPDATE courses SET instructor_id = 2 WHERE course_id = 102;

INSERT INTO attendance (student_id, course_id, date, status) VALUES
(1, 101, '2025-05-01', 'Present'),
(2, 101, '2025-05-01', 'Absent'),
(1, 102, '2025-05-02', 'Present');

SELECT *
FROM instructors;

SELECT 
    s.name AS student_name,
    c.course_name,
    g.grade
FROM 
    grades g
JOIN 
    students s ON g.student_id = s.student_id
JOIN 
    courses c ON g.course_id = c.course_id;

