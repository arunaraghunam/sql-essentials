-- Correlated Subquery

SELECT [BusinessEntityID], [FirstName], [LastName]
FROM [Person].[Person]

-- jOB TITLE of person who is an employee
SELECT [BusinessEntityID],[JobTitle] 
FROM [HumanResources].[Employee]

-- People who are employees using Inner Join
SELECT p.BusinessEntityID, 
p.FirstName
, p.LastName
, e.JobTitle
FROM Person.Person p INNER JOIN [HumanResources].[Employee] e
on p.BusinessEntityID=e.BusinessEntityID

-- Using Subquery All people wheather they are employee or not - LEFT JOIN - all 
-- rows from people table and matching records from employee table
SELECT BusinessEntityID
, FirstName
, LastName
, (SELECT JobTitle
FROM HumanResources.Employee
WHERE BusinessEntityID = MyPeople.BusinessEntityID) AS JobTitle
FROM Person.Person AS MyPeople
WHERE (SELECT JobTitle
FROM HumanResources.Employee
WHERE BusinessEntityID = MyPeople.BusinessEntityID) IS NOT NULL;

-- Using EXISTS in Subquery

SELECT BusinessEntityID
, FirstName
, LastName
, (SELECT JobTitle
FROM HumanResources.Employee
WHERE BusinessEntityID = MyPeople.BusinessEntityID) AS JobTitle
FROM Person.Person AS MyPeople
WHERE EXISTS (SELECT JobTitle
FROM HumanResources.Employee
WHERE BusinessEntityID = MyPeople.BusinessEntityID);