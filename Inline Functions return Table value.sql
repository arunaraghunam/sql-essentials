--Step 1: Create Student table
CREATE TABLE student 
( Id INT IDENTITY(1,1) PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Marks INT NOT NULL
  )

--Step 2: Create a Inline table valued Function GetNamesbyMarks which takes input parameter @mark
-- and give table as output
/*Inline Table Valued Function can be used to encapsulate complex queries and make them 
easier to use and reuse in different parts of your code. By returning a result set that can be used 
just like a table, an Inline Function can simplify your SQL code and make it more modular and maintainable.  */

CREATE FUNCTION dbo.GetNamesbyMarks(@mark int)
RETURNS TABLE
AS
RETURN
(
    SELECT Id, Name, Marks
	FROM Student
	WHERE Marks>=@mark
	)

--Step 3: Pass value for input parameter @mark as 40

select * from dbo.GetNamesbyMarks(40)