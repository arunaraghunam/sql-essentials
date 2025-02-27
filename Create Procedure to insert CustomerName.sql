CREATE PROCEDURE insertCustomer(@customername varchar(100))

AS

BEGIN
 INSERT INTO Customer(id, name, is_active)
 VALUES (4, @customername, 1)

END;

EXEC insertCustomer 'DLP Shipping';