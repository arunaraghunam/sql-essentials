CREATE TABLE Product
(ProductID INT, ProductName varchar(100))
GO

CREATE TABLE ProductDescription
(ProductID INT, ProductDescription varchar(800))
GO

INSERT INTO Product VALUES (680,'HL Road Frame - Black, 58')
,(706,'HL Road Frame - Red, 58')
,(707,'Sport-100 Helmet, Red')
GO
 
INSERT INTO ProductDescription VALUES (680,'Replacement mountain wheel for entry-level rider.')
,(706,'Sturdy alloy features a quick-release hub.')
,(707,'Aerodynamic rims for smooth riding.')
GO

-- Create stored procedure

CREATE PROCEDURE GetProductDesc
AS
BEGIN
SET NOCOUNT ON


SELECT p.ProductID, p.ProductName, pd.ProductDescription
FROM Product p
INNER JOIN ProductDescription pd
ON p.ProductID=pd.ProductID

END

--Execute stored proc

EXEC GetProductDesc

