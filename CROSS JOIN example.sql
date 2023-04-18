-- CROSS JOIN 

SELECT Department.Name as DepartmentName, 
AddressType.Name as AddressName
FROM [HumanResources].[Department] CROSS JOIN  [Person].[AddressType];

SELECT A.Name, B.Name
FROM [HumanResources].[Department] as A CROSS JOIN HumanResources.Department B
WHERE A.Name <>B.Name

SELECT AddressType.Name FROM [Person].[AddressType]



