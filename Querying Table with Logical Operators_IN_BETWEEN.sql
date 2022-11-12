CREATE Table friends_details(
id int not null identity(1,1) primary key,
firstname nvarchar(100),
birthdate date,
shirt_size nvarchar(50),
pant_size nvarchar(50),
dress_size_numerical nvarchar(25),
favorite_color nvarchar(20))

INSERT INTO [dbo].[friends_details]([firstname],[birthdate],[shirt_size]
,[pant_size],[dress_size_numerical],[favorite_color])
     VALUES('Jenny', '1985-10-1', 'L', 'L', '16', 'blue'),
('Bobby', '1981-10-1', 'L', 'L', '18', 'black'),
('Mark', '1982-01-01', 'XXL', '3XL', '22', 'white'),
('Arf', '1985-12-12', 'XL', 'XXL', '16', 'green'),
('Sales', '1982-06-12', 'M', 'L', '14', 'peach'),
('Tanya', '1983-10-01', 'M', 'M', '12', 'purple'),
('Tina', '1980-11-10', 'S', 'XS', '2', 'maroon'),
('Maryam', '1986-10-09', 'XXS', 'S', '4', 'apricot'),
('Jenny', '1987-04-07', '2XL', 'S', '8', 'pink')

select * from friends_details

--1) return first name and shirt size
--where shirt size is in range M,L,XL,XXL
--Order by shirt_size alphabetically

select firstname, shirt_size
from friends_details
WHERE shirt_size IN('M','L','XL','XXL')
ORDER BY shirt_size ASC

-- 2) query entire table
-- select birth month (non-numeric) only from our friends table
-- where dress size between 2 and 16
--pants size has large in it
--order by birth month alphabetically

select * from friends_details

-- datename function will convert date into interval you are choosing(eg: month, day, year, weekday)
select firstname, pant_size, DATENAME(MONTH, birthdate) as birth_month from friends_details
WHERE dress_size_numerical between 2 AND 16
AND
pant_size LIKE '%L'
ORDER BY birth_month asc

-- query table if you need to 
-- select firstname and birthyear of your freinds born between 1980 and 1982
-- sort from youngest to oldest

select firstname, datename(year,birthdate) as birthyear
FROM friends_details
WHERE birthdate BETWEEN '1980' and '1982'
ORDER BY birthdate DESC


