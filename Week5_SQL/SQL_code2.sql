--Joins 
select a.*, b.Mortality_date from PATIENT a join MORT b
on a.Pid = b.Pid;


select a.*, b.Mortality_date from PATIENT a LEFT join MORT b
on a.Pid = b.Pid;

--Case when

select *, 
case when pri_dx_icd = 'I50.9' or sec_dx_icd = ‘I50.9' THEN 1 ELSE 0 end as Heart_failure
from VISIT

--Mathematical operation: Addition 

--"With" acts like creating a new table but that’s temporary, it’s also called CTE (Common Table Expression)
With test_table as(
select *, 
case when pri_dx_icd = 'I50.9' or sec_dx_icd = 'I50.9' then 1 else 0 end as Heart_failure,
case when pri_dx_icd = 'I10' or sec_dx_icd = 'I10' then 1 else 0 end as Hypertension,
case when pri_dx_icd = 'I20.9' or sec_dx_icd = 'I20.9' then 1 else 0 end as Angina
from VISIT
  )
select *, Heart_failure + Hypertension + Angina as N_Cardiac_diagnoses from test_table;

