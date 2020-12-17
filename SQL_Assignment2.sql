CREATE DATABASE db_Circus_School;
USE db_Circus_School;

CREATE TABLE tbl_Classes (
	Class_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Class_Name VARCHAR(100) NOT NULL);

CREATE TABLE tbl_Students (
	Student_ID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	Student_Name VARCHAR(50) NOT NULL);

CREATE TABLE tbl_Instructors (
	Instructor_ID INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	Instructor_Name VARCHAR(50) NOT NULL);

USE db_Circus_School;

ALTER TABLE tbl_Students
ADD Instructor_ID INT;
ADD Class_ID INT;

ALTER TABLE tbl_Students
ADD FOREIGN KEY (Class_ID) REFERENCES tbl_Classes(Class_ID);


ALTER TABLE tbl_Students
ADD CONSTRAINT fk_Instructor_ID
FOREIGN KEY (Instructor_ID) REFERENCES tbl_Instructors(Instructor_ID);

INSERT INTO tbl_Classes (Class_Name)
	VALUES
	('Software Developer Boot Camp'),
	('Data Science Boot Camp');

INSERT INTO tbl_Students (Student_Name, Class_ID, Instructor_ID)
	VALUES
	('Shawna Peterson', 2, 1000),
	('Jasmine Greenough', 1, 1000),
	('Jarred Trantham', 1, 1001),
	('Phillip Watson', 2, 1001),
	('Lucille Ball', 2, 1001),
	('Daniel Reedy', 1, 1000);

INSERT INTO tbl_Instructors (Instructor_Name)
	VALUES
	('Ryan Balch'),
	('Danielle Himmerman');

SELECT * FROM tbl_Classes;
SELECT * FROM tbl_Students;
SELECT * FROM tbl_Instructors;

DELETE FROM tbl_Students;

SELECT Instructor_Name
FROM tbl_Instructors;

SELECT Student_Name
FROM tbl_Students
ORDER BY Student_Name;

SELECT tbl_Classes.Class_Name, tbl_Students.Student_Name, tbl_Instructors.Instructor_Name
FROM tbl_Students
INNER JOIN tbl_Classes ON tbl_Classes.Class_ID = tbl_Students.Class_ID
INNER JOIN tbl_Instructors ON tbl_Instructors.Instructor_ID = tbl_Students.Instructor_ID;



