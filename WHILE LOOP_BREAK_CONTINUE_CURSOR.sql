-- WHILE - sets a condition for repeated execution of an statement or statement block
-- the statements are executed repeatedly as long as specified condition is true
/*
WHILE Boolean_expression
     {sql_statement | statement_block | BREAK | CONTINUE}*/

-- Using BREAK and CONTINUE with nested IF..ELSE and WHILE

USE AdventureWorks2012;
GO
WHILE ( SELECT AVG(ListPrice) FROM Production.Product)<$300
BEGIN
   UPDATE Production.Product
   SET ListPrice = ListPrice * 2
   SELECT MAX(ListPrice) FROM Production.Product
   IF (SELECT MAX(ListPrice) FROM Production.Product)> $500
   BREAK
   ELSE
   CONTINUE
   END
   PRINT 'Too much for the market to bear';

   -- B. Using WHILE in a cursor

   DECLARE @EmployeeID as NVARCHAR(256)
   DECLARE @Title as NVARCHAR(50)

   DECLARE Employee_Cursor CURSOR FOR
   SELECT [LoginID],[JobTitle]
   FROM [HumanResources].[Employee]
   WHERE JobTitle = 'Marketing Specialist';
   OPEN Employee_Cursor;
   FETCH NEXT FROM Employee_Cursor INTO @EmployeeID, @Title;
   WHILE @@FETCH_STATUS = 0
   BEGIN
   Print ' '+ @EmployeeID + '   '+@Title
   FETCH NEXT FROM Employee_Cursor INTO @EmployeeID, @Title;
   END;
   CLOSE Employee_Cursor;
   DEALLOCATE Employee_Cursor;
   GO