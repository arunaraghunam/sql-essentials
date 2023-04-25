--SQL script to find the total row count of tables in a Database of SQL Server
/*Just imagine that your table has more than 10000000 rows and you need row count of this table, 
so SELECT COUNT(1) is not always the best solution for getting the row count.

Now one more case, If you need to compare all row count of tables between two servers or databases and the total number of tables is 500; 
you must not use the SELECT COUNT(1).

Is this the best way to write individual COUNT query for each table?
No: Because all tables have one default primary partition and you can find this partition information in sys.partitions table.
*/

SELECT
      QUOTENAME(SCHEMA_NAME(SO.schema_id)) + '.' + QUOTENAME(SO.name) AS TableName
      , SUM(SP.Rows) AS TotalRowCount
FROM sys.objects AS SO
INNER JOIN sys.partitions AS SP
	ON SO.object_id = SP.object_id
WHERE SO.type = 'U'
      AND SO.is_ms_shipped = 0x0
      AND index_id < 2 
GROUP BY 
      SO.schema_id
      ,SO.name
ORDER BY 1