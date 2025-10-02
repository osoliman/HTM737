--Joins 
select a.*, b.Mortality_date from PATIENT a join MORT b
on a.Pid = b.Pid;


select a.*, b.Mortality_date from PATIENT a LEFT join MORT b
on a.Pid = b.Pid;

--Case when

select *, 
case when pri_dx_icd = 'I50.9' or sec_dx_icd = ‘I50.9' THEN 1 ELSE 0 end as Heart_failure
from VISIT

--Count
--Count(*)
select count(*) from MEDICATION;

--Count(distinct)
select count(DISTINCT rx_name) from MEDICATIONS;

--Group by (and order by)
select pid, count(DISTINCT rx_name) from MEDICATIONS GROUP by pid
order by 2 desc;
