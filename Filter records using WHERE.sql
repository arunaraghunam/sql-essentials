-- WHERE clause uses filtering condition called predicate

SELECT * FROM [HumanResources].[Department]
WHERE GroupName = 'Research and Development';

--Multiple Predicates can be included using AND, OR NOT logical operator
-- Each predicate included comparison =, !=, operator > than, < than 
--GroupName Not equal to Research and Development and Dept ID < 10
SELECT * FROM [HumanResources].[Department]
WHERE (GroupName <> 'Research and Development')
AND (DepartmentID <10);

-- Using IN
SELECT * FROM [HumanResources].[Department]
WHERE (GroupName <> 'Research and Development') OR
(GroupName <> 'Quality Assurance')

SELECT * 
FROM [HumanResources].[Department]
WHERE [GroupName] IN('Research and Development','Quality Assurance')


