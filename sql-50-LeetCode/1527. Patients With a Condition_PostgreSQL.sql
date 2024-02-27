/*
Problem link:
https://leetcode.com/problems/patients-with-a-condition/
*/

--Solution-1:
SELECT *
FROM patients
WHERE conditions LIKE '% DIAB1%' OR conditions LIKE 'DIAB1%'


--Solution-2:
WITH CTE AS
(
    SELECT *,
    CASE 
        WHEN STRPOS(conditions, 'DIAB1') = 1 OR (STRPOS(conditions, 'DIAB1') > 1 AND SUBSTRING(conditions from (STRPOS(conditions, 'DIAB1')-1) for 1) = ' ') THEN 1 
    END AS flag
    FROM Patients
)
SELECT patient_id, patient_name, conditions
FROM CTE
WHERE flag = 1