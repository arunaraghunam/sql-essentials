-- create a table with shirt firstnames, shirt sizes and favourite colors

CREATE TABLE company_shirts(
id int not null identity(1,1) primary key,
firstname nvarchar(100),
shirt_size nvarchar(50),
favourite_color nvarchar(25)
)

-- input 2 or 3 rows of data

INSERT INTO company_shirts(firstname, shirt_size, favourite_color)
values('Bobby', 'L', 'black'),
('Mark', '3XL', 'white'),
('Arif', 'XXL', 'green')

select * from company_shirts

-- add a new employee that has not supplied a favourite color or shirt size

INSERT INTO company_shirts (firstname, favourite_color)
values('Jenny', 'purple')

select  * from company_shirts

-- Email Reminder we have to order shirts
-- use COALESCE function - returns first non-null value
-- or failing that a specified value

-- Start a transaction

BEGIN TRANSACTION

-- for each employee in thetable if they have not supplied shirt size then input 4xl

select firstname, favourite_color, COALESCE(shirt_size, 'XXXXL') from 
company_shirts

ROLLBACK;

select * from company_shirts

-- same function could ne accomplished with CASE statement

BEGIN TRANSACTION;
-- for each employee in table if they have not supplied shirt size then input 4xl

select firstname, favourite_color, CASE WHEN shirt_size is null then 'XXXXL'
ELSE shirt_size
END AS shirtsize
FROM company_shirts

ROLLBACK;
select * from company_shirts

drop table company_shirts