-- Create stored procedure with default parameter values

CREATE PROCEDURE GetProductDesc_withDefaultParameters
(@pid int =706)
AS
BEGIN
SET NOCOUNT ON

SELECT p.ProductID, p.ProductName, pd.ProductDescription
FROM Product p
INNER JOIN ProductDescription pd
ON p.ProductID = pd.ProductID
WHERE p.ProductID = @pid
END

/*When we execute the above procedure without passing the parameter value, the default value 706 will be used. But when executed passing the value, 
the default value will be ignored and the passed value will be considered as a parameter.
EXEC GetProductDesc_withDefaultParameters */

EXEC GetProductDesc_withDefaultParameters 680