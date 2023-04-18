-- Stored proc with One parameter

CREATE PROCEDURE SelectAllPersons @City nvarchar(30)
AS
SELECT * FROM [Person].[Address] WHERE City = @City
GO

-- Execute Stored Procedure

EXEC SelectAllPersons @City = 'London'