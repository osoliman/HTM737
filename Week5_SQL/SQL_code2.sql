--Joins 
select a.*, b.Mortality_date 
from PATIENT a join MORT b
on a.Pid = b.Pid;


select a.*, b.Mortality_date 
from PATIENT a LEFT join MORT b
on a.Pid = b.Pid;

--Case when

select *, 
case when pri_dx_icd = 'I50.9' or sec_dx_icd = 'I50.9' THEN 1 ELSE 0 end as Heart_failure
from VISIT;

--Count
--Count(*)
select count(*) from MEDICATION;

-- Count(distinct)
select count(DISTINCT rx_name) from MEDICATIONS;

--Group by (and order by)
select pid, count(DISTINCT rx_name) from MEDICATIONS GROUP by pid
order by 2 desc;

--Date calculations
select a.*, ROUND((julianday(Visit_date) - julianday(Bdate)) / 365.25,2) as AGE_YEAR
FROM VISIT a join PATIENT b
on a.Pid = b.Pid;



--The activity in the class
--This is one way to answer it using Common Table Expression (CTE), basically creating temp tables in the session
WITH visits_N AS (
  SELECT Attending_md, COUNT(*) AS N_visits
  FROM VISIT
  GROUP BY Attending_md
),
Medications_N AS (
  SELECT prescribing_md, COUNT(*) AS N_drugs
  FROM MEDICATIONS
  GROUP BY prescribing_md
),
Labs_N AS (
  SELECT ordering_md, COUNT(*) AS N_labs
  FROM LABS
  GROUP BY ordering_md
)
SELECT a.Attending_md, a.N_visits, b.N_drugs, c.N_labs
FROM Visits_N a 
JOIN Medications_N b ON a.Attending_md = b.Prescribing_md
JOIN Labs_N c ON a.Attending_md = c.Ordering_md;
