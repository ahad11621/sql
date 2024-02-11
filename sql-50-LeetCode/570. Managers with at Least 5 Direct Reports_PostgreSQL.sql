/*
Problem link:
https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
*/

--Solution:
--Using CTE
WITH CTE AS
(
    SELECT managerID, COUNT(managerID)
    FROM Employee e
    GROUP BY managerID
)

SELECT e.name
FROM Employee e
JOIN CTE c
ON c.managerid = e.id
WHERE c.count > 4

--Using Subquery
SELECT name
FROM Employee
WHERE id IN (
    SELECT managerID
    FROM Employee e
    GROUP BY managerID
    HAVING COUNT(managerID) > 4
)