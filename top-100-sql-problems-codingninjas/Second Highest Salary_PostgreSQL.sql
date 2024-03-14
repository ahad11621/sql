/*
Problem link:
https://www.codingninjas.com/studio/problems/second-highest-salary_2110760
*/

--Solution:
SELECT MAX(salary) AS salary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee)