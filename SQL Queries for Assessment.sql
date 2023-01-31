/**SQL Exercise 1.Write an SQL statement that lists school names, student names, and their cities only 
if the school and the student are in the same city and the 
student is not from New York.*/

SELECT s.school_name, st.student_name, st.city
FROM school s
JOIN student st
ON s.school_id=st.school_id AND s.city=st.city
WHERE st.city <> 'New York'

/**SQL Exercise 2 Write an SQL statement that lists student names, subject names, 
subject lecturers, and the max amount of points for all 
subjects except Computer Science and any subjects with a 
max score between 100 and 200.*/

SELECT st.student_name, s.subject_name, s.lecturer, s.max_score
FROM student st
JOIN [subject] s 
ON st.subject_id = s.subject_id
WHERE subject_name <> 'Compter Science'
AND max_score BETWEEN 100 AND 200

/*
*SQL Exercise 3
What is wrong with this SQL query?*/

SELECT Id, name, YEAR(BillingDate) AS Year
FROM Records
WHERE Year >= 2010

--Right:

SELECT Id, name, YEAR(BillingDate) AS BillingYear
FROM Records
WHERE Year >= 2010

--Wrong:
SELECT id, name
FROM students
WHERE grades =
             (SELECT MAX(grades)
              FROM students
              GROUP BY subject_id;);
--Right:
			  SELECT id, name
FROM students
WHERE grades =
             (SELECT MAX(grades)
              FROM students
              GROUP BY subject_id);

/*SQL Exercise 4
*What will be the result of the query below?*/
SELECT [name], id
FROM worker
WHERE id NOT IN (SELECT manager_id FROM departments)

/**SQL Exercise 5
Write a query that shows the highest salary in each department.*/

SELECT dept_id, MAX(Salary) as 'Highest Salary'
FROM Employee
GROUP BY dept_id

/*SQL Exercise 6 – Write a Date Query
Write an SQL query that displays the current date.*/

SELECT CAST(GETDATE() AS DATE) 'Current Date'

--GETDATE() that returns the current date and time. To get the current date, 
--you use the CAST() function with the GETDATE() function as shown in the following statement

/*SQL Exercise 7 Write an SQL query that checks whether a date (1/04/12) passed to the query is in a given format (MM/YY/DD).*/

SELECT ISDATE('1/04/12') AS "MM/DD/YY";

-- SQL has IsDate() function which is used to check passed date value is of specified
-- format or not returns 1(true) or 0(false)

/*SQL Exercise 8 Write an SQL query to find duplicate rows in two tables (EMPLOYEE and WORKERS), 
and then write a query to delete the duplicates.*/

SELECT id, COUNT(id)
FROM worker
GROUP BY id
HAVING COUNT(id)>1

-- Following CTE partitions data using PARTITION BY
-- clause for Name, Dept_id, Salary and generates a row number for each row

WITH CTE ([Name],
Dept_id,
Salary,
duplicatecount)
AS (SELECT [Name],
Dept_id,
Salary,
ROW_NUMBER() OVER(PARTITION BY [Name],
Dept_id,
Salary
ORDER BY Dept_id) AS DuplicateCount
FROM [dbo].[Employee])

SELECT * FROM CTE;
			
-- query to delete duplicates
WITH CTE ([Name],
Dept_id,
Salary,
duplicatecount)
AS (SELECT [Name],
Dept_id,
Salary,
ROW_NUMBER() OVER(PARTITION BY [Name],
Dept_id,
Salary
ORDER BY Dept_id) AS DuplicateCount
FROM [dbo].[Employee])

DELETE FROM CTE
WHERE duplicatecount >1

-- RANK function to delete duplicate rows

SELECT 
e.[Name],
e.Dept_id,
e.Salary,
T.rank
FROM Employee e
INNER JOIN 
(
SELECT *,
RANK() OVER(PARTITION BY Name,
Dept_id,
Salary
ORDER BY Dept_id) rank
FROM [dbo].[Employee]
) T on e.Dept_id = T.Dept_id;

-- we need to remove row having a RaNK greater than 1
SELECT 
e.[Name],
e.Dept_id,
e.Salary,
T.rank
FROM Employee e
INNER JOIN 
(
SELECT *,
RANK() OVER(PARTITION BY Name,
Dept_id,
Salary
ORDER BY Dept_id) rank
FROM [dbo].[Employee]
) T on e.Dept_id = T.Dept_id
WHERE rank>1


/*Write a query that lists courses’ subject names and 
the number of students taking the course only if the 
course has three or more students enrolled.*/

SELECT  s.[subject_name], COUNT(st.[student_id]) as StudentCount
FROM [dbo].[student] st
JOIN [dbo].[subject] s
ON st.subject_id=s.subject_id
GROUP BY st.student_id, s.[subject_name]
HAVING COUNT(st.[student_id])>=3

/*Write a query that displays the average age of workers in each company. 
The result should show the name of the company and the age of the company’s 
youngest worker.*/

SELECT c.ID, c.Name, avg(w.age) as avgage, MIN(w.age) as youngestworker
FROM company c
JOIN workers w
ON c.ID = w.Company_id
GROUP BY c.ID, c.[Name]




