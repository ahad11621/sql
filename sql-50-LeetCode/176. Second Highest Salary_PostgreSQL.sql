/*
Problem link:
https://leetcode.com/problems/second-highest-salary/
*/

--Solution-1:
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
)


--Solution-2:
WITH CTE AS
(
    SELECT salary, RANK() OVER(ORDER BY salary DESC)
    FROM Employee
    GROUP BY salary
)
SELECT CASE 
            WHEN MAX(rank) < 2 THEN NULL
            ELSE (SELECT salary FROM CTE WHERE rank = 2)
        END AS SecondHighestSalary
FROM CTE