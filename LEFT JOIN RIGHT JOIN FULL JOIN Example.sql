-- Left Outer Join - all records from left table and matching records from right
SELECT [BusinessEntityID], [PersonType], [FirstName],[LastName] 
FROM [Person].[Person]

SELECT [BusinessEntityID], [JobTitle]
FROM [HumanResources].[Employee]

SELECT Person.BusinessEntityID
, Person.PersonType
, Person.FirstName
, Person.LastName
, Employee.JobTitle
FROM [Person].[Person] JOIN [HumanResources].[Employee]
ON Person.BusinessEntityID = Employee.BusinessEntityID;

-- All persons from People table + Job Titles of all People who are Employees - change to LEFT JOIN

SELECT Person.BusinessEntityID
, Person.PersonType
, Person.FirstName
, Person.LastName
, Employee.JobTitle
FROM [Person].[Person] LEFT OUTER JOIN [HumanResources].[Employee]
ON Person.BusinessEntityID = Employee.BusinessEntityID;


-- Right Outer Join -- all records from right and matching records from left
--All Employees+ Any information present in Persons Table

SELECT Person.BusinessEntityID
, Person.PersonType
, Person.FirstName
, Person.LastName
, Employee.JobTitle
FROM [Person].[Person] RIGHT OUTER JOIN [HumanResources].[Employee]
ON Person.BusinessEntityID = Employee.BusinessEntityID;

-- Full Outer Join -- all records from both tables regardlss of match

SELECT Person.BusinessEntityID
, Person.PersonType
, Person.FirstName
, Person.LastName
, Employee.JobTitle
FROM [Person].[Person] FULL OUTER JOIN [HumanResources].[Employee]
ON Person.BusinessEntityID = Employee.BusinessEntityID;