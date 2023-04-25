-- Top 50 IO queries in SQL Server db

select 
    q.[text],
SUBSTRING(q.text, (highest_cpu_queries.statement_start_offset/2)+1, 
        ((CASE highest_cpu_queries.statement_end_offset
          WHEN -1 THEN DATALENGTH(q.text)
         ELSE highest_cpu_queries.statement_end_offset
         END - highest_cpu_queries.statement_start_offset)/2) + 1) AS statement_text,    
    
    highest_cpu_queries.total_worker_time,
    highest_cpu_queries.total_logical_reads,
	highest_cpu_queries.last_execution_time,
    highest_cpu_queries.execution_count,
    q.dbid,
    q.objectid,
    q.number,
    q.encrypted,
     highest_cpu_queries.plan_handle
from 
    (select top 50 
          qs.last_execution_time,
          qs.execution_count,
        qs.plan_handle, 
        qs.total_worker_time,
        qs.statement_start_offset,
        qs.statement_end_offset,
        qs.total_logical_reads
    from 
        sys.dm_exec_query_stats qs
    order by qs.total_worker_time desc) as highest_cpu_queries
    cross apply sys.dm_exec_sql_text(plan_handle) as q
order by highest_cpu_queries.total_logical_reads desc;

--You can find TOP IO queries in SQL Server database with following query.

   select 
       SUBSTRING(st.text,(qs.statement_start_offset/2)+1,
       ((case statement_end_offset
          when -1 then DATALENGTH(st.text)
          else qs.statement_end_offset end
          - qs.statement_start_offset)/2) +1) as statement_text,
          qs.total_logical_reads,
          qs.total_physical_reads,
          qs.execution_count
      from sys.dm_exec_query_stats as qs
   cross apply sys.dm_exec_sql_text(qs.sql_handle) as st 
order by qs.total_logical_reads desc, qs.execution_count desc;