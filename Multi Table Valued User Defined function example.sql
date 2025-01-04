-- Multi Table Valued User Defined functions

Create function fn_GetEmp()
returns @table table(Id int, [name] varchar(50), DOB date)
as 
begin
insert into @table 
select ID,[Name],DOB from  [dbo].[EmployeeTbl]
return
end

-- Table data can be retrieved using Multi table valued function
select * from fn_GetEmp()

-- Data cannot be modified using this functions
--Object 'fn_GetEmp' cannot be modified.
update fn_GetEmp()
set [Name] = 'Harika' where Id=2

-- Create function with encryption

Create function CalculateAge1(@DOB date)
returns int
with Encryption -- o/p script will be encrypted
as
begin

declare @Age int
set @Age = DATEDIFF(year, @DOB, GETDATE())-
case 
when (MONTH(@DOB) > MONTH(GetDate())) OR
(MONTH(@DOB) = MONTH(GetDate()) and DAY(@DOB)>DAY(GetDate()))
then 1
else 0
end
return @Age
end

-- Create function with schema binding
-- Cannot DROP TABLE 'dbo.EmployeeTbl' because it is being referenced by object 'fn_Employeedept'.
-- if we use without schemabinding then table can be dropped

Create function fn_Employeedept(@Dept int)
returns table
with schemabinding
as
return(select [Name] from [dbo].[EmployeeTbl] where DeptID=@Dept)

drop table [dbo].[EmployeeTbl] 