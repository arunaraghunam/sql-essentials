CREATE PROCEDURE selectCustomer 
AS
BEGIN

SELECT id, name, is_active FROM [dbo].[Customer]

END;