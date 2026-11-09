-- Database Setup Script
-- Run this script in MySQL to create the required
-- database and table for the project.
CREATE DATABASE IF NOT EXISTS student_db;
USE student_db;
CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    marks DOUBLE NOT NULL
);
INSERT INTO students (name, marks) VALUES ('Rahul Sharma', 85.5);
INSERT INTO students (name, marks) VALUES ('Priya Patel', 92.0);
INSERT INTO students (name, marks) VALUES ('Amit Kumar', 78.3);
INSERT INTO students (name, marks) VALUES ('Sneha Gupta', 88.7);
INSERT INTO students (name, marks) VALUES ('Vikram Singh', 91.2);
SELECT * FROM students;
