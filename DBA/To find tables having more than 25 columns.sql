--Below is a script to find tables which are having more than 25 columns:
/*As per the MSDN, we can create 1024 columns in a single table, 
but here immediately next questions should be,
What is the default size of one single page?
It is only 8KB so if we create more columns and it exceeds 8KB size, 
it creates internal page fragmentation.
*/

DECLARE @threshold INT;
SET @threshold = 25;
 
;WITH cte([object_id], [column count]) AS
(
	SELECT [object_id], COUNT(*)
	FROM sys.columns
	GROUP BY [object_id]
	HAVING COUNT(*) > @threshold
)
SELECT 
	[s].[name] + '.' + [t].[name] AS TableName
    ,[cte].[column count]
FROM cte
INNER JOIN sys.tables AS t
	ON [cte].[object_id] = [t].[object_id]
INNER JOIN sys.schemas AS s
	ON [t].[schema_id] = [s].[schema_id]
ORDER BY [cte].[column count] DESC
GO