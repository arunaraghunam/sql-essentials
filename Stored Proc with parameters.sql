-- Stored procedure with parameter

CREATE PROCEDURE GetProductDesc_withparameters
(@pid int)
AS
BEGIN
SET NOCOUNT ON

SELECT p.ProductID, p.ProductName, pd.ProductDescription
FROM Product p
INNER JOIN ProductDescription pd
ON p.ProductID=pd.ProductID
WHERE P.ProductID = @pid

END

EXEC GetProductDesc_withparameters 706