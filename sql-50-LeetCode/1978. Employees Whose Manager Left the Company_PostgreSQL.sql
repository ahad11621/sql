/*
Problem link:
https://leetcode.com/problems/employees-whose-manager-left-the-company/
*/

--Solution-1:
SELECT employee_id 
FROM Employees 
WHERE salary < 30000 AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id


--Solution-2:
WITH CTE AS
(
    SELECT *
    FROM Employees
    WHERE salary < 30000
),
CTE_2 AS
(
    SELECT manager_id
    FROM CTE
    WHERE manager_id NOT IN (SELECT employee_id FROM Employees)
)
SELECT employee_id
FROM CTE
WHERE manager_id IN (SELECT manager_id FROM CTE_2)
ORDER BY employee_id