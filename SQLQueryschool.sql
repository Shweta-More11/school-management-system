CREATE DATABASE SchoolManagement;
USE SchoolManagement;

1.--Students Table--

   CREATE TABLE Students (
       StudentID INT PRIMARY KEY,
       FirstName VARCHAR(50),
       LastName VARCHAR(50),
       DateOfBirth DATE,
       GradeLevel INT,
       EnrollmentDate DATE,
       ParentContact VARCHAR(100)
   );
   


2. --Teachers Table--

   CREATE TABLE Teachers (
       TeacherID INT PRIMARY KEY,
       FirstName VARCHAR(50),
       LastName VARCHAR(50),
       Subject VARCHAR(50),
       ContactInfo VARCHAR(100),
       HireDate DATE
   );
   


3. --Courses Table--

   CREATE TABLE Courses (
       CourseID INT PRIMARY KEY,
       CourseName VARCHAR(100),
       TeacherID INT,
       Credits INT,
       FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
   );
   

4. --Enrollments Table--

   CREATE TABLE Enrollments (
       EnrollmentID INT PRIMARY KEY,
       StudentID INT,
       CourseID INT,
       EnrollmentDate DATE,
       Status VARCHAR(20),
       FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
       FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
   );
   


5. --Grades Table--

   CREATE TABLE Grades (
       GradeID INT PRIMARY KEY,
       StudentID INT,
       CourseID INT,
       Grade CHAR(2),
       FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
       FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
   );


1. --Insert Students--

   INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, GradeLevel, EnrollmentDate, ParentContact) VALUES
   (1, 'John', 'Doe', '2005-05-15', 10, '2020-08-01', 'john.parent@example.com'),
   (2, 'Jane', 'Smith', '2006-11-23', 9, '2021-09-01', 'jane.parent@example.com');
   


2. --Insert Teachers--

   INSERT INTO Teachers (TeacherID, FirstName, LastName, Subject, ContactInfo, HireDate) VALUES
   (1, 'Alice', 'Johnson', 'Mathematics', 'alice.johnson@example.com', '2019-07-15'),
   (2, 'Bob', 'Williams', 'History', 'bob.williams@example.com', '2018-08-01');
   

3. --Insert Courses--

   INSERT INTO Courses (CourseID, CourseName, TeacherID, Credits) VALUES
   (101, 'Algebra', 1, 4),
   (102, 'World History', 2, 3);
   

4. --Insert Enrollments--

   INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate, Status) VALUES
   (1, 1, 101, '2021-09-01', 'Active'),
   (2, 2, 102, '2021-09-01', 'Active');
   

5. --Insert Grades--

   INSERT INTO Grades (GradeID, StudentID, CourseID, Grade) VALUES
   (1, 1, 101, 'A'),
   (2, 2, 102, 'B');


SELECT * FROM  Grades;
SELECT * FROM  Enrollments;
SELECT * FROM  Courses;
SELECT * FROM  Teachers;
SELECT * FROM  Students;


Q1. --Retrieve All Students' Names and Grade Levels--
   
     SELECT FirstName, LastName, GradeLevel FROM Students;
    

Q2. --Get Unique List of Courses--
  
     SELECT DISTINCT CourseName FROM Courses;
     

Q3.--Find All Teachers Hired Before 2020--
   

     SELECT FirstName, LastName FROM Teachers WHERE HireDate < '2020-01-01';
     


Q4. --Retrieve All Students Enrolled in a Specific Course (e.g., 'Algebra')--
   
     SELECT s.FirstName, s.LastName
     FROM Students s
     JOIN Enrollments e ON s.StudentID = e.StudentID
     JOIN Courses c ON e.CourseID = c.CourseID
     WHERE c.CourseName = 'Algebra';

Q5. --Count the Number of Students Enrolled in Each Course--
   
     SELECT c.CourseName, COUNT(e.StudentID) AS StudentCount
     FROM Courses c
     LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
     GROUP BY c.CourseName;

Q6.--Find All Students with Grades 'A' or 'B'--
   
     SELECT s.FirstName, s.LastName, g.Grade
     FROM Students s
     JOIN Grades g ON s.StudentID = g.StudentID
     WHERE g.Grade IN ('A', 'B');

Q7. --Modify the `Status` of a Student’s Enrollment to 'Completed' for a Specific Course--
  
     UPDATE Enrollments
     SET Status = 'Completed'
     WHERE StudentID = 1 AND CourseID = 101;

	 SELECT * FROM Enrollments;

Q8. --Add a Constraint to Ensure Only Grades 'A' to 'D' Can Be Inserted in the `Grades` Table--
    
      ALTER TABLE Grades
      ADD CONSTRAINT chk_grade CHECK (Grade IN ('A', 'B', 'C', 'D'));

	  SELECT * FROM Grades;


Q9. --Find Students Who Are in Grade 10 and Enrolled After 2020--
   
     SELECT FirstName, LastName, GradeLevel, EnrollmentDate
     FROM Students
     WHERE GradeLevel = 10 AND EnrollmentDate > '2020-01-01';
     


Q10. --Retrieve Courses with More Than 3 Credits--
     
     SELECT CourseName, Credits
     FROM Courses
     WHERE Credits > 3;
     


Q11. --Search for Teachers Whose First Name Starts with 'A'--
  

     SELECT FirstName, LastName, Subject
     FROM Teachers
     WHERE FirstName LIKE 'A%';
     


Q12. --Find Students with Email IDs Containing 'example'--
   
     SELECT FirstName, LastName, ParentContact
     FROM Students
     WHERE ParentContact LIKE '%example%';
     


Q13. --Count the Number of Students Enrolled in Each Course (Using HAVING Clause)--
   

     SELECT c.CourseName, COUNT(e.StudentID) AS StudentCount
     FROM Courses c
     JOIN Enrollments e ON c.CourseID = e.CourseID
     GROUP BY c.CourseName
     HAVING COUNT(e.StudentID) > 1;
     

Q14. --Retrieve Students Enrolled in 'Algebra' Using a Join--
   
     SELECT s.FirstName, s.LastName
     FROM Students s
     JOIN Enrollments e ON s.StudentID = e.StudentID
     JOIN Courses c ON e.CourseID = c.CourseID
     WHERE c.CourseName = 'Algebra';

