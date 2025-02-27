CREATE PROCEDURE sp_UpdateName 
@FirstName varchar(50)

AS

UPDATE dbo.Test
SET FirstName = @FirstName
WHERE FirstName = 'KTTPRO'

GO

