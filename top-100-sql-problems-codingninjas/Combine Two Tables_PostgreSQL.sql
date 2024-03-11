/*
Problem link:
https://www.codingninjas.com/studio/problems/combine-two-tables_2110759
*/

--Solution:
SELECT p.FirstName, p.LastName, a.City, a.State
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId