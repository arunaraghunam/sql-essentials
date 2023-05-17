--Using DECLARE
--The following example uses a local variable named @find to retrieve contact information for all last names beginning with Walt.

DECLARE @find varchar(30)

SET @find = 'Walt%';

SELECT LastName, FirstName, Phone
FROM DimEmployee
WHERE LastName LIKE @find;

 --Using DECLARE with two variables
--The following example retrieves uses variables to specify the first and last names of employees in the DimEmployee table.
-- Uses AdventureWorks

DECLARE @lastName VARCHAR(30), @firstName VARCHAR(30);

SET @lastName = 'Walt%';
SET @firstName = 'Bryan';

SELECT LastName, FirstName, Phone
FROM DimEmployee
WHERE LastName LIKE @lastName AND FirstName LIKE @firstName;