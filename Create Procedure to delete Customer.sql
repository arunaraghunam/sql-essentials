CREATE PROCEDURE deleteCustomer(@customerID int)

AS

BEGIN

DELETE FROM [dbo].[Customer]
WHERE id=@customerID;

END;

EXEC deleteCustomer 2;

SELECT id, name, is_active
FROM [dbo].[Customer]