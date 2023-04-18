SELECT FirstName
, [LastName]
, CONCAT([FirstName], ' ',[MiddleName], ' ', [LastName]) AS fULLnAME
, CONCAT_WS(' ',FirstName, MiddleName, LastName) AS WithSeparators
FROM [Person].[Person]