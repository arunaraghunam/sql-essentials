-- Return distinct rows with EXCEPT

SELECT *
FROM Person.Person

SELECT *
FROM Sales.PersonCreditCard

-- All people who dont have a credit card

SELECT BusinessEntityID
FROM Person.Person
WHERE PersonType <> 'EM'
EXCEPT
SELECT BusinessEntityID
FROM Sales.PersonCreditCard

-- Compare the results using JOINS

SELECT Person.BusinessEntityID
FROM Person.Person LEFT JOIN Sales.PersonCreditCard
ON Person.BusinessEntityID = PersonCreditCard.BusinessEntityID
WHERE Person.PersonType <> 'EM' AND PersonCreditCard.CreditCardID IS NULL