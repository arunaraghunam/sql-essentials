/*Firstnames start with A - using Wildcards : finding people based on initials
% - String of 0 or more chars
_ Any single character
[ABCDEF] any sigle character in a set
[A-F] any single character in a range*/



SELECT FirstName
FROM Person.Person
WHERE FirstName LIKE 'A%'

-- FirstNames end with A
SELECT FirstName
FROM Person.Person
WHERE FirstName LIKE '%A'

SELECT FirstName
FROM Person.Person
WHERE FirstName LIKE '%A%'

--Starts with A and 3 chars

SELECT FirstName
FROM Person.Person
WHERE FirstName LIKE 'A___'

-- Firstname starts A B or C
SELECT FirstName
FROM Person.Person
WHERE FirstName LIKE '[ABC]%'

-- Firstname Starts with A and have LMN as 2nd letter and 3 more letters after that

SELECT FirstName
FROM Person.Person
WHERE FirstName LIKE 'A[LMN]___'

SELECT FirstName
FROM Person.Person
WHERE FirstName LIKE 'A[L-N]___'
