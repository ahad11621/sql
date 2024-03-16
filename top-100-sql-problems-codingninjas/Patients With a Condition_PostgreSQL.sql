
/*
Problem link:
https://www.codingninjas.com/studio/problems/patients-with-a-condition_2196163
*/

--Solution:
SELECT *
FROM patients
WHERE conditions LIKE '% DIAB1%' OR conditions LIKE 'DIAB1%'