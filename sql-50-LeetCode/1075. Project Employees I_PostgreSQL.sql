/*
Problem link:
https://leetcode.com/problems/project-employees-i/
*/

--Solution-1:
SELECT p.project_id, ROUND(AVG(experience_years), 2) AS average_years
FROM Project p
JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id


-- Solution-2:
WITH CTE AS
(
    SELECT p.project_id, e.experience_years
    FROM Project p
    JOIN Employee e
    ON p.employee_id = e.employee_id
)
SELECT project_id, ROUND(AVG(experience_years), 2) AS average_years
FROM CTE
GROUP BY project_id