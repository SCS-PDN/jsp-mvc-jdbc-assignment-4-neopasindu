CREATE DATABASE IF NOT EXISTS university_db;
USE university_db;

CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    password   VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS courses (
    course_id  INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(200) NOT NULL,
    instructor VARCHAR(100) NOT NULL,
    credits    INT          NOT NULL
);

CREATE TABLE IF NOT EXISTS registrations (
    reg_id     INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT  NOT NULL,
    course_id  INT  NOT NULL,
    date       DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id)  REFERENCES courses(course_id)
);

-- Sample students (2)
INSERT INTO students (name, email, password) VALUES
    ('Alice Johnson', 'alice@university.edu', 'alice123'),
    ('Bob Smith',     'bob@university.edu',   'bob456');

-- Sample courses (3)
INSERT INTO courses (name, instructor, credits) VALUES
    ('Introduction to Programming', 'Dr. Brown', 3),
    ('Database Systems',            'Dr. Green', 4),
    ('Web Development',             'Dr. White', 3);
