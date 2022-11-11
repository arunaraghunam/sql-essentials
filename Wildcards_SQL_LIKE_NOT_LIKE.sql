-- Keyword Comparison Operators and what do they do?
/*
BETWEEN -- returns data that are in a range of values
IN - returns data within a list of values
LIKE - returns data that is similar to a given pattern. The use of wildcards is common
IS NULL/IS NOT NULL - returns values that are or are not null depending on which key word is used
EXISTS- this is used to determine if a subquery returns values or not
*/

-- Wildcards

-- Percent % sign



-- Underscore
-- returns one char per underscore within a specified string

-- Where
--to match one char or other withn string

--Create a simple yet substantial table
--include full name, email, country, city and phone number

CREATE Table people_info(
id int not null identity(1,1) primary key,
firstname nvarchar(100),
lastname nvarchar(100),
email nvarchar(25),
city nvarchar(35),
country nvarchar(55),
phone nvarchar(25)
)

--seed with 6-9 rows of data
INSERT INTO people_info(firstname, lastname, email, city, country, phone)
VALUES('addison','wills','123@gmail.com','austin','USA','2165789897'),
('ashley','wilson','456@gmail.com','austin','USA','2125789797'),
('brooke','boothe','786@gmail.com','duluth','USA','2165099897'),
('brody','tuttle','56487@gmail.com','cleveland','USA','2134789897'),
('bill','yuba','564382@gmail.com','boston','USA','3035789872'),
('willam','tacoma','456456@gmail.com','boston','USA','2165780504'),
('martha','yosef','3527256@gmail.com','columbus','USA','2165789897'),
('mary','alavarez','2612836@gmail.com','dayton','USA','2163249897'),
('maryanna','yusef','234@gmail.com','new york','USA','2025789897')

select firstname, email from people_info
where email like '%6@gmail.com'

select * from people_info
select firstname, lastname from people_info
where firstname not like '_ar%'

-- query showing firstname city where fname starts with b and followed by ir and o
-- city does not have 'ul' in between any no of chars
select * from people_info
select firstname, city
from people_info
where firstname like 'b[iro]%' 
AND city not like '%ul%'