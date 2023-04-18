-- SAVEPOINT - save to point in time that we need to rollback to 
--COMMIT - no longer making changes and we are commiting transactions 

-- Mini Challenge
-- part 1: begin a transaction
--delete a group of people using where clause
--save transaction uniqueName
--select all from table

BEGIN TRANSACTION
DELETE FROM employee_salary
WHERE lastname like '%[ng]%'
SAVE TRANSACTION sp1
SELECT * FROM employee_salary
ROLLBACK;
--WHERE lastname like '[ng]%'

-- PART2
-- this time modify some other data of your choosing
-- dont commit
BEGIN TRANSACTION
DELETE FROM employee_salary
WHERE country = 'Poland' or lastname like '%man%'
save TRANSACTION sp2
select * from employee_salary

-- part 3: 
BEGIN TRANSACTION
DELETE FROM employee_salary
WHERE currentsalary <= 50000
SAVE TRANSACTION sp3;
SELECT * FROM employee_salary

-- rollback to second transaction
-- query table
BEGIN TRANSACTION
ROLLBACK TRANSACTION sp2;

SELECT * FROM employee_salary

COMMIT;

-- Rollback to savepoint 3

ROLLBACK TRANSACTION sp3;
SELECT * FROM employee_salary

-- here we lost ability to undo prior changes