CREATE TABLE truncate_table (
Gender varchar(255),
Age int);

INSERT INTO truncate_table (Gender, Age) VALUES ('Seun', 32), ('Tolu', 54), ('Ada', 53), ('Timi', 21);

SELECT * FROM truncate_table;

TRUNCATE TABLE truncate_table;

CREATE TABLE table_check (
Gender varchar(255),
Salary float,
Age int,
CHECK (Salary >= 10000)
);

DESC table_check;

USE new_schema;
SELECT * FROM courses_data;

ALTER TABLE courses_data
ADD course_code int;

ALTER TABLE courses_data
MODIFY COLUMN course_code varchar(255);

DESC courses_data;

ALTER TABLE courses_data
RENAME COLUMN `Course ID` TO course_id,
RENAME COLUMN `Course Name` TO course_name,
RENAME COLUMN `Course Level` TO course_level;

ALTER TABLE courses_data
DROP COLUMN course_code;

DESC enrollments_data;
DESC student_information;
ALTER TABLE enrollments_data
ADD CONSTRAINT `Enrollment ID` PRIMARY KEY (`Enrollment ID`);

ALTER TABLE enrollments_data
ADD CONSTRAINT `Course ID` FOREIGN KEY (`Course ID`) REFERENCES courses_data (course_id);

ALTER TABLE enrollments_data
ADD CONSTRAINT `Student ID` FOREIGN KEY (`Student ID`) REFERENCES student_information (`Student ID`);



CREATE TABLE table_fk ( 
CourseID integer, CourseNames varchar(255),
PRIMARY KEY (CourseID)
);
INSERT INTO table_fk (CourseID, CourseNames) VALUES (11, "English"), (12, "Math"), (13, "Language");
DESC table_fk;

CREATE TABLE table_k (
StudentID integer, 
CourseID integer, 
StudentNames varchar(255), 
Age integer,
PRIMARY KEY (StudentID));

INSERT INTO table_k (StudentID, CourseID, StudentNames, Age) VALUES (1, 11, "Alex", 18.43), 
(2, 12, "Akash", 27.56),(3, 13, "Ramisha", 21.45);


DESC table_k;

ALTER TABLE table_k
ADD CONSTRAINT CourseID FOREIGN KEY (CourseID) REFERENCES table_fk(CourseID);

ALTER TABLE enrollments_data
DROP PRIMARY KEY;

DESC enrollments_data;

SELECT * FROM student_information;

CREATE INDEX idx_names 
ON student_information (Department(255));

DESC student_information;

CREATE UNIQUE INDEX idx_unique
ON student_information (`Student ID`);

ALTER TABLE student_information
DROP INDEX idx_unique;

SELECT *
FROM student_information
WHERE GPA > 2 AND Age < 25;

SELECT *
FROM student_information
WHERE NOT 'Science';

SELECT *
FROM student_information
WHERE `First Name` LIKE 'j%';

SELECT *
FROM student_information
WHERE Department IN ('Medicine', 'Business', 'Arts');

SELECT *
FROM student_information
WHERE GPA > 3.5
LIMIT 6;

SELECT char_length("How old are you?") AS length;

SELECT char_length(`First Name`) AS lengthofname
FROM student_information;

SELECT CONCAT (`First Name`, ' ', `Last Name`) AS Full_name
FROM student_information;

SELECT LOWER (Gender) AS lowergender
FROM student_information;

SELECT COUNT(Department) AS Count_student
FROM student_information
WHERE Department ='Medicine';

SELECT AVG(GPA) AS medicine_average
FROM student_information
WHERE Department ='Medicine';

SELECT GPA DIV 2
FROM student_information;

SELECT MIN(GPA)
FROM student_information;

SELECT MAX(GPA)
FROM student_information;

SELECT ROUND(GPA, 0) AS roundedgpa
FROM student_information;

SELECT ROUND(LOG(GPA), 2) AS logtransformation
FROM student_information;

SELECT *
FROM student_information
ORDER BY GPA ASC;

SELECT *
FROM student_information
ORDER BY AGE DESC;

SELECT COUNT(`Student ID`) AS Studs, ROUND(AVG(GPA), 2) AS avg_gpa, GENDER 
FROM student_information
GROUP BY GENDER
ORDER BY AVG(GPA);

SELECT *
FROM student_information
INNER JOIN enrollments_data ON student_information.`Student ID` = enrollments_data.`Student ID`;


SELECT *
FROM student_information
LEFT JOIN enrollments_data ON student_information.`Student ID` = enrollments_data.`Student ID`;

SELECT *
FROM student_information
RIGHT JOIN enrollments_data ON student_information.`Student ID` = enrollments_data.`Student ID`;

SELECT *
FROM student_information
CROSS JOIN enrollments_data ON student_information.`Student ID` = enrollments_data.`Student ID`;

SELECT AVG(GPA), Department
FROM student_information
GROUP BY Department
HAVING AVG(GPA) > 3;

SELECT *
FROM student_information
WHERE EXISTS (SELECT * FROM enrollments_data WHERE student_information.`Student ID` = enrollments_data.`Student ID` AND GRADE = 'A');

SELECT `Student ID`
FROM student_information
WHERE `Student ID` = ANY(SELECT `Student ID` FROM enrollments_data WHERE Grade = 'A');

SELECT *,
CASE
WHEN GPA > 3 THEN "Passed"
WHEN GPA BETWEEN 2.5 AND 3 THEN "Hold"
ELSE "FAILED"
END Outcome
FROM student_information;