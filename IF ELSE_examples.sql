-- IF ELSE 

-- Using simple Boolean expression

IF 1=1 PRINT 'Boolean_expression is true'
ELSE PRINT 'Boolean_expression is false.';

IF 1=2 PRINT 'Boolean_expression is true'
ELSE PRINT 'Boolean_expression is false.'
GO

--B. Using a query as part of Boolean expression

USE AdventureWorks2012
GO

-- C. Using statement block

USE AdventureWorks2012;  
GO  
DECLARE @AvgWeight DECIMAL(8,2), @BikeCount INT  
IF   
(SELECT COUNT(*) FROM Production.Product WHERE Name LIKE 'Touring-3000%' ) > 5  
BEGIN  
   SET @BikeCount =   
        (SELECT COUNT(*)   
         FROM Production.Product   
         WHERE Name LIKE 'Touring-3000%');  
   SET @AvgWeight =   
        (SELECT AVG(Weight)   
         FROM Production.Product   
         WHERE Name LIKE 'Touring-3000%');  
   PRINT 'There are ' + CAST(@BikeCount AS VARCHAR(3)) + ' Touring-3000 bikes.'  
   PRINT 'The average weight of the top 5 Touring-3000 bikes is ' + CAST(@AvgWeight AS VARCHAR(8)) + '.';  
END  
ELSE   
BEGIN  
SET @AvgWeight =   
        (SELECT AVG(Weight)  
         FROM Production.Product   
         WHERE Name LIKE 'Touring-3000%' );  
   PRINT 'Average weight of the Touring-3000 bikes is ' + CAST(@AvgWeight AS VARCHAR(8)) + '.' ;  
END ;  
GO 

IF
(SELECT COUNT(*) FROM [Production].[Product] WHERE 
Name LIKE 'Touring-3000%')>5
PRINT 'There are more than 5 Touring-3000 bicycles.'
ELSE PRINT 'There are 5 or less Touring-3000 bicycles.';
GO

-- D. Using nested IF..ELSE statements

DECLARE @Number INT;
SET @Number = 50;
IF @Number > 100
        PRINT 'The number is large.';
  ELSE
     BEGIN
        IF @Number < 10
        PRINT 'The number is small.';
  ELSE
        PRINT 'The number is medium.';
  END;
  GO
