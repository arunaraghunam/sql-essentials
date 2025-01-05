-- Stored Porcedure - execute group of SQL statements.
-- They can be reused, better maintenance and bug correction

Create procedure Sample1
as
begin
select * from [dbo].[EmployeeTbl]
end

exec Sample1
execute Sample1

-- give name apart from sp_

-- with encryption cannot see the text 
create procedure Sample2
with encryption
as
begin 
select * from [dbo].[EmployeeTbl]
end

execute Sample2

drop procedure sp_Sample1

drop procedure Sample2
