/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (500) [DepartmentID]
      ,[Name]
      ,[GroupName]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[HumanResources].[Department]