/* UPDATE data and ALTER structure*/

-- Query employee salary table

-- TASK 1

-- UPDATE table
-- SET salary equal to salary plus 1k
-- WHERE country equals chosen country

select * from employee_salary

UPDATE employee_salary
SET startingsalary = startingsalary+1000
WHERE country = 'USA'

select * from employee_salary

-- TASK 2
-- UPDATE table
-- SET country = 'United Kingdom'
-- WHERE country equals 'UK'

UPDATE employee_salary
SET country = 'United Kingdom'
WHERE country = 'UK'

select * from employee_salary

TASK 3: 

-- add a new column called retirement_contribution
-- populate it with datatype money

ALTER TABLE employee_salary
ADD retirement_contribution money

select * from employee_salary

-- drop column from table

ALTER TABLE employee_salary
DROP column retirement_contribution

select * from employee_salary