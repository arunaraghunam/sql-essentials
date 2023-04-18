-- Pass percentage calculation --

Select Pass = round(avg(case when Result='Pass' then 100.0 else 0.0 end),2)
      ,Fail = round(avg(case when Result='Fail' then 100.0 else 0.0 end),2)
 From  YourTable