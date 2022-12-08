/* GROUP BY clause 
- Follows the FROM clause in SELECT statement
- Lists the columns that hold the values to consolidate on
- Groups records together into "buckets"
- Uses aggregate functions to perform calculations on a group - COUNT, SUM,MIN,MAX,AVG*/

SELECT * FROM Person.Address;

--No of addresses in each city
SELECT City, StateProvinceID, COUNT(*) CountofAddresses
FROM Person.Address
GROUP BY City, StateProvinceID
ORDER BY CountofAddresses DESC;

