/*
Problem link:
https://leetcode.com/problems/consecutive-numbers/
*/

--Solution:
WITH CTE AS
(
    SELECT e.name AS employee, e.salary AS salary, d.name AS department
    FROM Employee e
    LEFT JOIN Department d
    ON e.departmentId = d.id
),
CTE_1 AS
(
    SELECT *, DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank
    FROM CTE
)
SELECT department, employee, salary
FROM CTE_1
WHERE rank < 4