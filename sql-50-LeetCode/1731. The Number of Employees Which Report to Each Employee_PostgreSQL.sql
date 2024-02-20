/*
Problem link:
https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
*/

--Solution:
WITH CTE AS
(
    SELECT reports_to, COUNT(age) AS reports_count, ROUND(AVG(age)) AS average_age
    FROM Employees
    GROUP BY reports_to
)
SELECT e.employee_id, e.name, c.reports_count, c.average_age
FROM Employees e
JOIN CTE c
ON e.employee_id = c.reports_to
ORDER BY e.employee_id