--You can find all indexes usage statistic with following script.

 

select objname = OBJECT_NAME(s.object_id),
s.object_id,
index_name= i.name,
index_id = i.index_id,
user_seeks, user_scans, user_lookups
from sys.dm_db_index_usage_stats as s
join sys.indexes i on i.object_id = s.object_id and i.index_id = s.index_id
where database_id = DB_ID('DEVECI')
and OBJECTPROPERTY(s.object_id,'IsUserTable')=1
order by (user_seeks + user_scans + user_lookups) desc;
