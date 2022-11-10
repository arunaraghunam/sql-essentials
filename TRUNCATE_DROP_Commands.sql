-- What does TRUNCATE do?
-- When should we use it?
--How is it diff to DROP?

-- Create 2 basic tables

-- department table
CREATE TABLE department(
deptID int not null identity(1,1) CONSTRAINT PK_Department PRIMARY KEY
, DeptName nvarchar(20))

INSERT INTO department(DeptName)
VALUES('IT'),
('Marketing'),
('Research'),
('HR');

-- second table with FK constraint

CREATE TABLE employee_department_info(
eID int not null identity(1,1) primary key,
firstname nvarchar(25),
lastname nvarchar(25),
manager nvarchar(25),
deptID int FOREIGN KEY REFERENCES department(deptID)
)

-- insert 3-4 lines of data

INSERT INTO employee_department_info(firstname, lastname, manager, deptID)
values('John', 'London', 'Frank', 1),
('Karen', 'Silvester', 'Bector', 2),
('Joe', 'Milan', 'Pope', 3),
('Rob', 'Hingis', 'Paris',4)

-- Query both tables

select * from department

select * from employee_department_info

-- what does TRUNCATE mean
-- use TRUNCATE to delete data from table while retaining table structure

-- TRUNCATE department table

TRUNCATE table department

-- gives below error message
-- Msg 4712, Level 16, State 1, Line 47
--Cannot truncate table 'department' because it is being referenced by a FOREIGN KEY constraint.

/* We need to DROP constraint then we can TRUNCATE table */

ALTER TABLE employee_department_info

-- DROP constraint FK name
DROP CONSTRAINT FK__employee___deptI__3A81B327

TRUNCATE TABLE department

SELECT * FROM department

-- How to drop columns

ALTER TABLE employee_departmental_info
DROP Column manager

SELECT * from employee_department_info

-- DROP - deletes the tble structure along with data from the database
DROP table employee_department_info

DROP table department
