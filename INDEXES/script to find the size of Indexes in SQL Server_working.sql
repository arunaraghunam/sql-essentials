-- script to find the size of Indexes in SQL Server.
SELECT
	OBJECT_SCHEMA_NAME(i.OBJECT_ID) AS SchemaName
	,OBJECT_NAME(i.OBJECT_ID) AS TableName
	,i.name AS IndexName
	,8 * SUM(au.used_pages) AS IndexSizeInKB
FROM sys.indexes AS i
JOIN sys.partitions AS p 
	ON p.OBJECT_ID = i.OBJECT_ID 
		AND p.index_id = i.index_id
JOIN sys.allocation_units AS au 
	ON au.container_id = p.partition_id
GROUP BY 
	i.OBJECT_ID
	,i.index_id
	,i.name
ORDER BY OBJECT_NAME(i.OBJECT_ID),i.index_id