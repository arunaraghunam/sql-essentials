-- Find companies who have atleast 2 users who 
--speaks English and German 

select * from company_users

--who speaks both languages
select company_id, count(1) from
(
select 
company_id, user_id
from company_users
where language IN('English', 'German')
GROUP BY company_id, user_id
HAVING count(1)=2) a  -- users who speak 2 languages
GROUP BY company_id
HAVING count(1)>=2


