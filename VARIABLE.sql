-- Create and use variables in a query 
-- Varaibles are placeholders can be used to perform routines and looping statements
-- Variable is placeholder placed inside query and used at a later point

DECLARE @MyFirstVariable INT; -- declare variable

SET @MyFirstVariable = 5; -- assign value to variable

SELECT @MyFirstVariable AS MyValue
,@MyFirstVariable * 5 AS Multiplication
,@MyFirstVariable + 10 AS Addition;

-- Local Variable - variable an its value exists only in single batch of function

-- All Products of specific color (colour mentioned in variable)

DECLARE @VarColor VARCHAR(20)='Blue'; -- variable declaration

SELECT ProductID, Name, ProductNumber, Color, ListPrice
FROM Production.Product
WHERE Color = @VarColor

-- change colour change variable color to Red. customize - useful in long query. several deff variables