-- Find size of all tables in database using SP_SPACEUSED procedure

Create TABLE #TableSize (TableName VARCHAR(200),Rows VARCHAR(20),      
       Reserved VARCHAR(20),Data VARCHAR(20),index_size VARCHAR(20), 
       Unused VARCHAR(20))
exec sp_MSForEachTable 'Insert Into #TableSize Exec sp_spaceused [?]'
Select
    TableName, CAST(Rows AS bigint) As Rows, 
    CONVERT(bigint,left(Reserved,len(reserved)-3)) As Size_In_KB 
    from #TableSize order by 3 desc
Drop Table #TableSize

-- Using SYS.TABLES & SYS.Allocation_UNITS system tables

SELECT
    t.NAME AS TableName,
    SUM(a.total_pages) * 8 AS TotalSpaceKB, 
    SUM(a.used_pages) * 8 AS UsedSpaceKB, 
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB
FROM
    sys.tables t
INNER JOIN
    sys.partitions p ON t.object_id = p.OBJECT_ID
INNER JOIN
    sys.allocation_units a ON p.partition_id = a.container_id
GROUP BY
    t.Name
ORDER BY
    TotalSpaceKB Desc