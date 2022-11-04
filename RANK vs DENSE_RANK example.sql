--DENSE_RANK functions

-- It assigns rank to each row within a partition of result set

CREATE TABLE dense_rank_demo(
v VARCHAR(10));

INSERT INTO dense_rank_demo
VALUES('A'),('B'),('B'),('C'),('C'),('D'),('E');

-- Dense_Rank returns consective rank values. 
--Rows in each partition recieve same ranks if they have same values

SELECT v, DENSE_RANK() OVER(ORDER BY v)my_dense_rank,
RANK() OVER (ORDER BY v)my_rank
FROM dense_rank_demo
