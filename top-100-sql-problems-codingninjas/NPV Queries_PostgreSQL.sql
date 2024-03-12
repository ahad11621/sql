/*
Problem link:
https://www.codingninjas.com/studio/problems/npv-queries_2181286
*/

--Solution:
SELECT id, year, CASE WHEN n.npv IS NULL THEN 0 ELSE n.npv END AS npv
FROM Queries q
LEFT JOIN NPV n
USING(id, year)