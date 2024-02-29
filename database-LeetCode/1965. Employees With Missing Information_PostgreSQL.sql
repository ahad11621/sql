/*
Problem link:
https://leetcode.com/problems/employees-with-missing-information/
*/

--Solution-1:
SELECT employee_id
FROM Employees
FULL JOIN Salaries USING (employee_id)
WHERE name IS NULL OR salary IS NULL


--Solution-2:
WITH CTE AS
(
    SELECT employee_id
    FROM Employees
    WHERE employee_id NOT IN (SELECT employee_id FROM Salaries)
),
CTE_1 AS
(
    SELECT employee_id
    FROM Salaries
    WHERE employee_id NOT IN (SELECT employee_id FROM Employees)
),
CTE_3 AS
(
    SELECT * FROM CTE
    UNION
    SELECT * FROM CTE_1
)
SELECT *
FROM CTE_3
ORDER BY employee_id