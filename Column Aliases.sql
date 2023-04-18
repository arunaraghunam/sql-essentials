-- Column aliases using single quotes - better and understandable names
-- to avoid confusion in end users

SELECT [Name] AS 'Department Name', GroupName as 'Management Group'
FROM [HumanResources].[Department];