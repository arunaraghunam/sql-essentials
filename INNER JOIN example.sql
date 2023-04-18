/* Retrieve records from Multiple Tables
INNER JOIN - most commonly used
LEFT OUTER JOIN - used occassionally
RIGHT OUTER JOIN
FULL OUTER JOIN
*/

-- Inner join - matching value in both tables

SELECT [BusinessEntityID], FirstName, LastName
FROM [Person].[Person]

SELECT [BusinessEntityID], [PhoneNumber]
FROM [Person].[PersonPhone]
WHERE BusinessEntityID = 283

-- Instead use this

SELECT p.[BusinessEntityID], p.FirstName, p.LastName, pp.PhoneNumber
FROM [Person].[Person] p
INNER JOIN [Person].[PersonPhone] pp ON p.BusinessEntityID=pp.BusinessEntityID



