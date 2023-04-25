--size of Database Files and Log Files in SQL Server.
/*I am calculating the size using sys.master_files and performing the required division to get size in MB and GB 
because it is returning 8 KB pages.

The Database Administrator can use this script to get the quick size of Database Files and Log Files of a SQL Server.
SQL Server Management Studio also provides GUI tools for this exercise, but still, I always use a different script to
do my DBA task.
*/
SELECT 
    db_name(database_id) AS DatabaseName
    ,type_desc AS TypeDesc
    ,(size * 8) /1024 AS SizeInMB
    ,(size * 8) /1024/1024 AS SizeInGB
FROM sys.master_files 
ORDER BY name