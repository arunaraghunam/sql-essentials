--Example 4: SQL VIEW to fetch records from multiple tables

--We can use VIEW to have a select statement with Join condition between multiple tables. 
--It is one of the frequent uses of a VIEW in SQL Server.

CREATE VIEW [Sales].[vStoreWithContacts1]
AS
SELECT s.[BusinessEntityID], 
            s.[Name], 
            c.[Name] AS [ContactType], 
            p.[Title], 
            p.[FirstName], 
            p.[MiddleName], 
            p.[LastName], 
            p.[Suffix], 
            pp.[PhoneNumber], 
            e.[EmailAddress], 
            p.[EmailPromotion]

FROM [Sales].[Store] s
INNER JOIN [Person].[BusinessEntityContact] b ON b.BusinessEntityID=s.BusinessEntityID
INNER JOIN [Person].[ContactType] c ON c.ContactTypeID=b.ContactTypeID
INNER JOIN [Person].[Person] p ON p.BusinessEntityID=b.PersonID
INNER JOIN Person.EmailAddress e ON e.BusinessEntityID=p.BusinessEntityID
INNER JOIN [Person].[PersonPhone] pp ON pp.BusinessEntityID=p.BusinessEntityID;

GO

--Suppose you need to execute this query very frequently. Using a VIEW, we can simply get the data with a single line of code.

SELECT * FROM [Sales].[vStoreWithContacts1]