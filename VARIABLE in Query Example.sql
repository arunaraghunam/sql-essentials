-- we can use this construct to query multiple queries in database and change parameters ech time
-- we can also use IF ELSE or Try catch instead of WHILE loop

DECLARE @Counter INT = 1;
DECLARE @Product INT = 710;

WHILE @Counter <=3
BEGIN
     SELECT ProductID, Name, ProductNumber, Color, ListPrice
	 FROM Production.Product
	 WHERE ProductID = @Product
	 SET @counter = @Counter+1
	 SET @Product = @Product+10
END