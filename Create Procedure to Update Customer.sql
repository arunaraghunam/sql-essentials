CREATE PROCEDURE updateCustomer(
@newCustomerName varchar(100),
@customerID int
)

AS

BEGIN

UPDATE Customer
SET name = @newCustomerName
WHERE id= @customerID;

END;

EXEC updateCustomer 'ABCExports', 2

