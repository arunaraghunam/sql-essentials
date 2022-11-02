declare @t table (sid int, d date, att char(1))
insert @t (sid,d, att) values
(178234, '1/1/2017','P'),
(178234, '5/1/2017','A'),
(178234, '6/1/2017','A'),
(178234, '11/1/2017','A'),
(178432, '1/1/2017','P'),
(178432, '5/1/2017','A'),
(178432, '6/1/2017','P'),
(178432, '11/1/2017','A')

Select s.sid, Min(s.d) startDt, Max(e.d) endDt, s.att, e.att, count(*)
from @t s join @t e on e.d <=  
   (select max(d) from @t m
    Where sid = s.sid
       and d > s.d
       and att = 'A'
       and not exists 
          (Select * from @t
           where sid = s.sid
              and d between s.d and m.d
              and att = 'P'))
Where s.att = 'A' 
   and s.d = (Select Min(d) from @t
              Where sid = s.sid
                and d < e.d
                and att = 'A')
group by s.sid, s.d, s.att, e.att