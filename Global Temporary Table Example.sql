-- Global temporary table: visitble to all connections
-- but will be closed when last connection is closed

create table ##Employee1(ID int, Name varchar(50))

insert into ##Employee1 values(1, 'Kapil')
insert into ##Employee1 values(2, 'Raju')

select * from ##Employee1