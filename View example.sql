-- Views: virtual table. stored queryand saved as view
-- data can be restricted to specific user using rowwise selection

--select * from [dbo].[EmployeeTbl]

create view vw_EmpDetails
as
select ID, [Name], DOB from [dbo].[EmployeeTbl]

select * from vw_EmpDetails

create view vw_EmpDetails1
as
select ID, [Name], DOB from [dbo].[EmployeeTbl]
where ID>3

select * from vw_EmpDetails1

create view vw_EmpDetails2
as
select ID, [Name] from [dbo].[EmployeeTbl]

select * from vw_EmpDetails2

-- Views can be updated,inserted and deleted. Main base table will get affected 

Update vw_EmpDetails set [Name]='Kalyani' where ID=1

select * from vw_EmpDetails

insert into vw_EmpDetails values (8, 'Anil', '03-11-2010')

delete from vw_EmpDetails where ID=8

drop view vw_EmpDetails

sp_helptext vw_EmpDetails
