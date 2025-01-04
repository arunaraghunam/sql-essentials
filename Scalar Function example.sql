-- scalar functions will return only one value
create function CalculateAge(@DOB date)
returns int
as begin
declare @Age int
set @Age=DATEDIFF(YEAR,@DOB,GETDATE())
return @Age
end

--execute function
select dbo.CalculateAge('3/8/1983')

select * from [dbo].[EmployeeTbl]

select ID, [Name], DOB, 
dbo.CalculateAge(DOB) as Age from [dbo].[EmployeeTbl] WHERE 
dbo.CalculateAge(DOB)>=30