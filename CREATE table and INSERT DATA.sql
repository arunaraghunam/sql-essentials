-- Creating an employee info table
-- Keywords
-- CREATE TABLE table_name

CREATE Table employee_info(
--employeeID int NOT NULL, 
ID int not null identity(1,1) primary key, -- starts with 1 and increments by 1 
firstname nvarchar(20), 
lastname nvarchar(20),
email nvarchar(25))
-- table_name(col_names?, null values allowed?, constraints?(PK?), datatypes?)

-- INSERT INTO Tablename
-- VALUES()

INSERT INTO employee_info(firstname, lastname, email)
VALUES('John', 'Arthur', '123gh@gmail.com'),
('Addison', 'Barclay', '345@gmail.com'),
('Betty', 'Barclay', '456@gmail.com'),
('Maggie', 'Sheffield', '567@gmail.com'),
('April', 'James', '678@gmail.com')

-- ALTER command:
-- Changes the structure of the table:
   -- Datatypes
   -- Column names (exception: stored proc for MSSQL Server)
   -- ADD/DROP columns

   select * from employee_info

   ALTER TABLE employee_info
   DROP Column email

   SELECT * FROM employee_info

   -- Alter table 
   ALTER TABLE employee_info
   ADD country int
   -- Add country column int datatype
   -- query table
   SELECT * from employee_info

   -- ALter column

   ALTER TABLE employee_info
   ALTER column country nvarchar(155)

   SELECT * FROM employee_info

   ALTER TABLE employee_info
   ADD city nvarchar(20),
   department nvarchar(20),
   [state] nvarchar(20)


