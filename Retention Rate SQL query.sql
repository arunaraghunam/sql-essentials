/*The retention rate is calculated by counting the number of users who return on a regular basis, 
such as every week or month, and grouping them by the week they signed up.
Suppose the user, who is a student of X School needs to login to the portal every day in order to access 
the study materials teachers put up and each user details such as login timing, user ID, and date is updated 
on the portal’s server every time they log in.
Now we have a table that stores user_id, login_time, and date of each user’s visit.*/

/*Step 1: Create a table login having 3 columns ‘login_date, user_id, id’ and use IDENTITY keyword to perform auto_increment on ‘id’
which is set as Primary Key it defines that the column will auto-increment by 1 each time a new record is inserted. */

CREATE TABLE login(login_date DATE, user_id INT,
id INT not null IDENTITY, PRIMARY KEY(id));

/*Step 2: Insert values for each row in the login table using the SQL Query,*/

INSERT INTO login(login_date,user_id)
VALUES('2022-01-01',10),('2022-01-02',12),('2022-01-03',15),
('2022-01-04',11),('2022-01-05',13),('2022-01-06',9),
('2022-01-07',21),('2022-01-08',10),('2022-01-09',10),
('2022-01-10',2),('2022-01-11',16),('2022-01-12',12),
('2022-01-13',10),('2022-01-14',18),('2022-01-15',15),
('2022-01-16',12),('2022-01-17',10),('2022-01-18',18),
('2022-01-19',14),('2022-01-20',16),('2022-01-21',12),
('2022-01-22',21),('2022-01-23',13),('2022-01-24',15),
('2022-01-25',20),('2022-01-26',14),('2022-01-27',16),
('2022-01-28',15),('2022-01-29',10),('2022-01-30',18);

/*Step 3: View the login table after inserting values into the rows for every column*/

SELECT * FROM login;

SELECT user_id,DATEPART(week, login_date) AS login_week 
FROM login GROUP BY user_id, 
DATEPART(week, login_date);

SELECT user_id, min(DATEPART(week, login_date)) AS first FROM 
login GROUP BY user_id;

/*To calculate the retention rate we’ll group each visit by a week of login. 
Microsoft SQL Server has a function DATEPART(), which returns a specified part (year, quarter, month, week, hour, minute, etc.) 
of a specified date.DATEPART() has two arguments that return week data, week login_date */

SELECT user_id,DATEPART(week, login_date) 
AS login_week FROM login GROUP BY user_id, 
DATEPART(week, login_date);

/*Now, we’ll calculate the first week of login for every user using the MIN function and GROUP BY to return the first login week of every user.*/

SELECT user_id, min(DATEPART
(week, login_date)) AS first FROM 
login GROUP BY user_id;

/*Using the INNER JOIN group both the results ‘login_week and first’ to calculate retention rate*/

Select m.user_id,m.login_week,n.first as first  from    
(SELECT user_id,DATEPART(week,login_date) AS login_week
FROM login GROUP BY user_id,DATEPART(week,login_date)) m,
(SELECT user_id,min(DATEPART(week,login_date)) AS first
FROM login GROUP BY user_id) n where m.user_id = n.user_id;

/*Here we will get the difference between login_week and first to calculate the number of the week (week number).*/

Select m.user_id,m.login_week,n.first as first,
m.login_week-first as week_number from    
(SELECT user_id, DATEPART(week,login_date) 
AS login_week FROM login GROUP BY user_id,
DATEPART(week,login_date)) m, (SELECT user_id,
min (DATEPART(week,login_date)) AS first FROM login
GROUP BY user_id) n where m.user_id=n.user_id;

/*After this combine the result to a cohort table which has one row for every first week and one column for every week number that has a 
number of users retained after ‘n’ weeks to login to the portal. 
Use the following query to calculate the retention rate in SQL. For Cohort Table Analysis make use of the Data Visualization Tool.*/

Select first,
SUM(CASE WHEN week_number = 0 THEN 1 ELSE 0 END) AS week_0,
SUM(CASE WHEN week_number = 1 THEN 1 ELSE 0 END) AS week_1,
SUM(CASE WHEN week_number = 2 THEN 1 ELSE 0 END) AS week_2,
SUM(CASE WHEN week_number = 3 THEN 1 ELSE 0 END) AS week_3,
SUM(CASE WHEN week_number = 4 THEN 1 ELSE 0 END) AS week_4,
SUM(CASE WHEN week_number = 5 THEN 1 ELSE 0 END) AS week_5,
SUM(CASE WHEN week_number = 6 THEN 1 ELSE 0 END) AS week_6,
SUM(CASE WHEN week_number = 7 THEN 1 ELSE 0 END) AS week_7,
SUM(CASE WHEN week_number = 8 THEN 1 ELSE 0 END) AS week_8,
SUM(CASE WHEN week_number = 9 THEN 1 ELSE 0 END) AS week_9 
from (select m.user_id,m.login_week,n.first as first,
m.login_week-first as week_number  from   (SELECT
user_id, DATEPART(week,login_date) AS login_week FROM login 
GROUP BY user_id,DATEPART(week,login_date)) m,(SELECT user_id, 
min(DATEPART(week,login_date)) AS first FROM login GROUP BY user_id) 
n where m.user_id = n.user_id) as with_week_number
group by first order by first;





