-- Create stored proc to select all records from customers table

CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM [Sales].[Customer]
GO;

EXEC SelectAllCustomers;