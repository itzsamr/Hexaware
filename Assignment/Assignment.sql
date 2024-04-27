-- Task 1. Database Design:

-- Create the database named "SISDB"
CREATE DATABASE SISDB;

-- Use the SISDB database
USE SISDB;

-- Create the Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create the Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

-- Create the Enrollments table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Create the Teacher table
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Create the Payments table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Insert data into the Students table
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
    (1, 'Raj', 'Patel', '2000-01-01', 'raj.patel@example.com', '1234567890'),
    (2, 'Emily', 'Johnson', '2000-02-02', 'emily.johnson@example.com', '9876543210'),
    (3, 'Aarav', 'Sharma', '2000-03-03', 'aarav.sharma@example.com', '1231231234'),
    (4, 'Sophia', 'Williams', '2000-04-04', 'sophia.williams@example.com', '4567890123'),
    (5, 'Aaradhya', 'Brown', '2000-05-05', 'aaradhya.brown@example.com', '7890123456'),
    (6, 'James', 'Patel', '2000-06-06', 'james.patel@example.com', '2345678901'),
    (7, 'Olivia', 'Smith', '2000-07-07', 'olivia.smith@example.com', '6789012345'),
    (8, 'Arjun', 'Johnson', '2000-08-08', 'arjun.johnson@example.com', '3456789012'),
    (9, 'Emma', 'Gupta', '2000-09-09', 'emma.gupta@example.com', '8901234567'),
    (10, 'Ayaan', 'Miller', '2000-10-10', 'ayaan.miller@example.com', '5678901234'),
    (11, 'Liam', 'Kumar', '2000-11-11', 'liam.kumar@example.com', '9012345678'),
    (12, 'Aria', 'Jones', '2000-12-12', 'aria.jones@example.com', '4321098765'),
    (13, 'Ishaan', 'Anderson', '2001-01-01', 'ishaan.anderson@example.com', '2109876543'),
    (14, 'Ella', 'Singh', '2001-02-02', 'ella.singh@example.com', '6543210987'),
    (15, 'Aryan', 'Wilson', '2001-03-03', 'aryan.wilson@example.com', '8765432109'),
    (16, 'Mia', 'Patel', '2001-04-04', 'mia.patel@example.com', '3210987654'),
    (17, 'Aaliyah', 'Thompson', '2001-05-05', 'aaliyah.thompson@example.com', '7654321098'),
    (18, 'Aadvik', 'Brown', '2001-06-06', 'aadvik.brown@example.com', '5432109876'),
    (19, 'Ethan', 'Sharma', '2001-07-07', 'ethan.sharma@example.com', '9876543210'),
    (20, 'Amelia', 'Lee', '2001-08-08', 'amelia.lee@example.com', '6789012345');

-- Insert data into the Courses table
INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
    (1, 'Mathematics', 3, 1),
    (2, 'English Literature', 3, 2),
    (3, 'Computer Science', 4, 3),
    (4, 'History', 3, 4),
    (5, 'Physics', 4, 5),
    (6, 'Chemistry', 4, 6),
    (7, 'Biology', 4, 7),
    (8, 'Economics', 3, 8),
    (9, 'Psychology', 3, 9),
    (10, 'Sociology', 3, 10),
    (11, 'Political Science', 3, 11),
    (12, 'Art History', 3, 12),
    (13, 'Geography', 3, 13),
    (14, 'Literary Theory', 3, 14),
    (15, 'Philosophy', 3, 15),
    (16, 'Music Theory', 3, 16),
    (17, 'Statistics', 4, 17),
    (18, 'Data Science', 4, 18),
    (19, 'Engineering', 4, 19),
    (20, 'Business Management', 4, 20);

-- Insert data into the Enrollments table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
    (1, 1, 1, '2024-01-01'),
    (2, 2, 2, '2024-01-15'),
    (3, 3, 3, '2024-01-20'),
    (4, 4, 4, '2024-02-05'),
    (5, 5, 5, '2024-02-10'),
    (6, 6, 6, '2024-02-15'),
    (7, 7, 7, '2024-02-20'),
    (8, 8, 8, '2024-03-01'),
    (9, 9, 9, '2024-03-05'),
    (10, 10, 10, '2024-03-10'),
    (11, 11, 11, '2024-03-15'),
    (12, 12, 12, '2024-03-20'),
    (13, 13, 13, '2024-04-01'),
    (14, 14, 14, '2024-04-05'),
    (15, 15, 15, '2024-04-10'),
    (16, 16, 16, '2024-04-15'),
    (17, 17, 17, '2024-04-20'),
    (18, 18, 18, '2024-05-01'),
    (19, 19, 19, '2024-05-05'),
    (20, 20, 20, '2024-05-10');

-- Insert data into the Teacher table
INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
    (1, 'Professor', 'Patel', 'prof.patel@example.com'),
    (2, 'Professor', 'Johnson', 'prof.johnson@example.com'),
    (3, 'Professor', 'Sharma', 'prof.sharma@example.com'),
    (4, 'Professor', 'Williams', 'prof.williams@example.com'),
    (5, 'Professor', 'Brown', 'prof.brown@example.com'),
    (6, 'Professor', 'Miller', 'prof.miller@example.com'),
    (7, 'Professor', 'Gupta', 'prof.gupta@example.com'),
    (8, 'Professor', 'Lee', 'prof.lee@example.com'),
    (9, 'Professor', 'Anderson', 'prof.anderson@example.com'),
    (10, 'Professor', 'Thompson', 'prof.thompson@example.com'),
    (11, 'Professor', 'Jones', 'prof.jones@example.com'),
    (12, 'Professor', 'Kumar', 'prof.kumar@example.com'),
    (13, 'Professor', 'Wilson', 'prof.wilson@example.com'),
    (14, 'Professor', 'Singh', 'prof.singh@example.com'),
    (15, 'Professor', 'Smith', 'prof.smith@example.com'),
    (16, 'Professor', 'Brown', 'prof.brown@example.com'),
    (17, 'Professor', 'Williams', 'prof.williams@example.com'),
    (18, 'Professor', 'Sharma', 'prof.sharma@example.com'),
    (19, 'Professor', 'Anderson', 'prof.anderson@example.com'),
    (20, 'Professor', 'Johnson', 'prof.johnson@example.com');

-- Insert data into the Payments table
INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
    (1, 1, 500.00, '2024-02-01'),
    (2, 2, 600.00, '2024-02-15'),
    (3, 3, 700.00, '2024-03-01'),
    (4, 4, 800.00, '2024-03-15'),
    (5, 5, 900.00, '2024-04-01'),
    (6, 6, 1000.00, '2024-04-15'),
    (7, 7, 1100.00, '2024-05-01'),
    (8, 8, 1200.00, '2024-05-15'),
    (9, 9, 1300.00, '2024-06-01'),
    (10, 10, 1400.00, '2024-06-15'),
    (11, 11, 1500.00, '2024-07-01'),
    (12, 12, 1600.00, '2024-07-15'),
    (13, 13, 1700.00, '2024-08-01'),
    (14, 14, 1800.00, '2024-08-15'),
    (15, 15, 1900.00, '2024-09-01'),
    (16, 16, 2000.00, '2024-09-15'),
    (17, 17, 2100.00, '2024-10-01'),
    (18, 18, 2200.00, '2024-10-15'),
    (19, 19, 2300.00, '2024-11-01'),
    (20, 20, 2400.00, '2024-11-15');


SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Teacher;
SELECT * FROM Enrollments;
SELECT * FROM Payments;

-- Tasks 2: Select, Where, Between, AND, LIKE: 
-- 1. Write an SQL query to insert a new student into the "Students" table with the following details:
		-- a. First Name: John
		-- b. Last Name: Doe
		-- c. Date of Birth: 1995-08-15
		-- d. Email: john.doe@example.com
		-- e. Phone Number: 1234567890

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES (21,'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

SELECT * FROM Students;

-- 2. Write an SQL query to enroll a student in a course. Choose an existing student and course and 
-- insert a record into the "Enrollments" table with the enrollment date.

INSERT INTO Enrollments(enrollment_id, student_id, course_id, enrollment_date)
VALUES(21,21,20,'2023-06-01');

SELECT * FROM Enrollments;

-- 3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and 
-- modify their email address.UPDATE TeacherSET email = 'professor.jones@gmail.com'WHERE teacher_id = 11;SELECT * FROM Teacher;-- 4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select 
-- an enrollment record based on the student and course.
DELETE FROM Enrollments
WHERE student_id = 12 AND course_id = 12;

SELECT * FROM Enrollments;

-- 5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and 
-- teacher from the respective tables.
UPDATE Courses
SET teacher_id = 4
WHERE course_id = 4;

SELECT * FROM Courses;

-- 6. Delete a specific student from the "Students" table and remove all their enrollment records 
-- from the "Enrollments" table. Be sure to maintain referential integrity

DELETE FROM Enrollments
WHERE student_id = 21;

DELETE FROM Students
WHERE student_id = 21;

SELECT * FROM Enrollments;
SELECT * FROM Students;
-- 7. Update the payment amount for a specific payment record in the "Payments" table. Choose any 
-- payment record and modify the payment amount.

UPDATE Payments
SET amount = 25000.00
WHERE student_id = 16;

SELECT * FROM Payments;





