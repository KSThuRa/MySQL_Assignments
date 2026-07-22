-- ==========================================
-- 1. DATA DEFINITION LANGUAGE (DDL)
-- ==========================================

-- A. Create Database
CREATE DATABASE UniversityDB;

-- Use the database
USE UniversityDB;

-- B. Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL UNIQUE,
    Credits INT CHECK (Credits > 0)
);

-- C. Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- D. Add BirthDate Column
ALTER TABLE Students
ADD BirthDate DATE;

-- ==========================================
-- 2. DATA MANIPULATION LANGUAGE (DML)
-- ==========================================

-- A. Insert 3 Rows into Courses
INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES
(101, 'Computer Science', 4),
(102, 'Business Administration', 3),
(103, 'Electrical Engineering', 4);

-- B. Insert 5 Rows into Students
INSERT INTO Students
(StudentID, FirstName, LastName, Email, CourseID, BirthDate)
VALUES
(1, 'John', 'Smith', 'john.smith@email.com', 101, '2003-01-15'),
(2, 'Emma', 'Johnson', 'emma.johnson@email.com', 102, '2002-07-20'),
(3, 'Michael', 'Brown', 'michael.brown@email.com', 101, '2003-05-10'),
(4, 'Sophia', 'Williams', 'sophia.williams@email.com', 103, '2002-11-08'),
(5, 'David', 'Miller', 'david.miller@email.com', 102, '2003-03-25');

-- C. Update Email Address of One Student
UPDATE Students
SET Email = 'john.new@email.com'
WHERE StudentID = 1;

-- D. Delete a Student by StudentID
DELETE FROM Students
WHERE StudentID = 5;

-- E. Display Students Enrolled in a Specific Course
SELECT *
FROM Students
WHERE CourseID = 101;