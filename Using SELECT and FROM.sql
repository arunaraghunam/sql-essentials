-- Return records with SELECT lists attribute columns interested in 
--an FROM - which table to find them in
-- Query commands in upper case 
SELECT 1;

--literal text must be in single quotes
SELECT 'Adam';

-- multiple values must be followed by commas
SELECT 'Adam', 1;

-- Query Department Table
SELECT Name, GroupName FROM [HumanResources].[Department];

SELECT GroupName, Name, DepartmentID,ModifiedDate  FROM [HumanResources].[Department];

-- * should not be used in applications as it will expose 
--columns from table which should be private
SELECT * FROM [HumanResources].[Department];
