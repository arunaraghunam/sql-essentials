-- How many times execution plan is re-used

/*if the execution plan is not reused, we will have performance issues. After fine-tuning the queries,
we need to make sure that the execution plan may be re-used when necessary.*/

SELECT [ecp].[refcounts]
, [ecp].[usecounts]
, [ecp].[objtype]
, DB_NAME([est].[dbid]) AS [db_name]
, [est].[objectid]
, [est].[text] as [query_ext]
, [eqp].[query_plan]
FROM sys.dm_exec_cached_plans ecp
CROSS APPLY sys.dm_exec_sql_text ( ecp.plan_handle ) est
CROSS APPLY sys.dm_exec_query_plan ( ecp.plan_handle ) eqp