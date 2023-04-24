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