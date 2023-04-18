-- Common SQL string functions

SELECT LEFT(FirstName,3) as First3,
RIGHT(FirstName,3) as Last3,
FirstName
FROM Person.Person

SELECT LOWER(FirstName) as LFirstName,
UPPER(FirstName) as UFirstName,
FirstName
FROM Person.Person

-- REPLACE

SELECT REPLACE(FirstName,'a','*') as AReplaced, FirstName
FROM Person.Person

-- REPLICATE

SELECT REPLICATE('A',5) AS FiveA,
REPLICATE(FirstName,3) as ReplName
FROM Person.Person

--LENGTH

SELECT LEN(FirstName) as LengthOfName, FirstName
FROM Person.Person

