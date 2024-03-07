/*
Problem link:
https://leetcode.com/problems/department-highest-salary/
*/

--Solution:
WITH CTE AS
(
    SELECT d.name AS Department, e.name AS Employee, e.Salary, RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC)
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
)
SELECT department, employee, salary
FROM CTE
WHERE rank = 1