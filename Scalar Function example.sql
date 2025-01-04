-- scalar functions will return only one value
create function CalculateAge(@DOB date)
returns int
as begin
declare @Age int
set @Age=DATEDIFF(YEAR,@DOB,GETDATE())
return @Age
end


