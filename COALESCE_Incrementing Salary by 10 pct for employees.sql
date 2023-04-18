create table employee_salary
(ID int identity(1,1) PRIMARY KEY,
firstname nvarchar(20),
lastname nvarchar(20),
country nvarchar(20),
startingsalary int null,
currentsalary int null
)
--TASK
-- Have 2 ses of employees (new hires with only starting salary
--and veteran hires with starting salary and current salary

--USE COALESCE function to give employees with current salary less
-- than or equal to 35000 a 10% raise(new salary)

-- Employees with no current salary new hires - their starting salary
-- should be their new salary

INSERT INTO employee_salary(firstname, lastname, country, startingsalary, currentsalary)
values
-- veterans
('Ben', 'Candiman', 'Poland', '31000', '100000'),
('Wasima', 'Fatehi', 'Nigeria', '20000', '50000'),
('Asiya', 'Sultana', 'Pakistan', '31000', '75000'),
('Mary', 'Godluck', 'UK', '45000', '65000'),
('Siva', 'Swaminathan', 'India', '32000', '70000'),
('Ben', 'Candiman', 'Poland', '55000', '120000')

-- new hires (have only starting salary)
INSERT INTO employee_salary(firstname, lastname, country, startingsalary)
values ('John', 'Freeman', 'USA', '35000'),
('Tina','Fang', 'China', '26000'),
('Milan','Jazani','Egypt','30000'),
('Tom', 'Frank','UK','35000')

-- query table

select * from employee_salary

--USE COALESCE function to give employees with current salary less
-- than or equal to 35000 a 10% raise(new salary)

SELECT firstname, lastname, startingsalary, currentsalary, COALESCE(1.1*currentsalary, startingsalary) as newsalary
FROM employee_salary
WHERE startingsalary <= '35000'

-- COALESCE breakdown --  if there is currentsalary not null increase it by 10% and name as 
-- new salary else if current salary is null then use starting salary as new salary