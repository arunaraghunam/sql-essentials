-- Modifying the Stored Procedure

ALTER PROCEDURE GetProductDesc
AS
BEGIN
SET NOCOUNT ON

SELECT p.ProductID, p.ProductName, pd.ProductDescription
FROM Product p
INNER JOIN ProductDescription pd
ON
p.ProductID = pd.ProductID

END