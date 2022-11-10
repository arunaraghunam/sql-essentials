-- Mini challenge!

-- ALTER 2 columns at the same time phonenum, email or country,city etc

ALTER TABLE employee_info
ADD City nvarchar(20),
department nvarchar(20),
[state] nvarchar(20)

-- query table
select * from employee_info




