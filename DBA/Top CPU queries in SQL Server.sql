--find TOP CPU queries in SQL Server database with following query

SELECT TOP 50
    ObjectName          = OBJECT_SCHEMA_NAME(qt.objectid,dbid) + '.' + OBJECT_NAME(qt.objectid, qt.dbid)
    ,TextData           = qt.text
    ,DiskReads          = qs.total_physical_reads   -- The worst reads, disk reads
    ,MemoryReads        = qs.total_logical_reads    --Logical Reads are memory reads
    ,Executions         = qs.execution_count
    ,TotalCPUTime       = qs.total_worker_time
    ,AverageCPUTime     = qs.total_worker_time/qs.execution_count
    ,DiskWaitAndCPUTime = qs.total_elapsed_time
    ,MemoryWrites       = qs.max_logical_writes
    ,DateCached         = qs.creation_time
    ,DatabaseName       = DB_Name(qt.dbid)
    ,LastExecutionTime  = qs.last_execution_time
 FROM sys.dm_exec_query_stats AS qs
 CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt
 ORDER BY qs.total_worker_time DESC;

 select top 50
query_stats.query_hash,
SUM(query_stats.total_worker_time) / SUM(query_stats.execution_count) as avgCPU_USAGE,
min(query_stats.statement_text) as QUERY
from (
select qs.*,
SUBSTRING(st.text,(qs.statement_start_offset/2)+1,
((case statement_end_offset
when -1 then DATALENGTH(st.text)
else qs.statement_end_offset end
- qs.statement_start_offset)/2) +1) as statement_text
from sys.dm_exec_query_stats as qs
cross apply sys.dm_exec_sql_text(qs.sql_handle) as st 
) as query_stats
group by query_stats.query_hash
order by 2 desc;