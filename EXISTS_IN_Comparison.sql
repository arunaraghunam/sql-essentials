-- Using EXISTS : to test existence of any record in subquery
-- Syntax
/*SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);
*/

--Usecase1 : Using NULL in a subquery to still return a  result set

SELECT  [DepartmentID], [Name]
FROM [HumanResources].[Department]
WHERE EXISTS (SELECT NULL)
ORDER BY [Name] ASC

-- Comparing queries using EXISTS and IN
SELECT a.FirstName, a.LastName
FROM [Person].[Person] AS a
WHERE EXISTS
(SELECT *
FROM [HumanResources].[Employee] AS b
WHERE a.BusinessEntityID=b.BusinessEntityID
AND a.LastName='Johnson');
GO

-- Using IN

SELECT a.FirstName, a.LastName
FROM [Person].[Person] AS a
WHERE a.LastName IN
(SELECT a.LastName
FROM HumanResources.Employee as b
WHERE a.BusinessEntityID = b.BusinessEntityID
AND a.LastName = 'Johnson');
GO