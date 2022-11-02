-- Student Attendance query--

select studentid, min(date), max(date)
from (select a.*,
             row_number() over (partition by studentid order by date) as seqnum,
             row_number() over (partition by studentid, attendance order by date) as seqnum_a
      from attendance a
     ) a
where attendance = 'A'
group by studentid, (seqnum - seqnum_a)
having count(*) >= 3;