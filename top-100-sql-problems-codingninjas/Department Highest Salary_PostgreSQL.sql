/*
Problem link:
https://www.naukri.com/code360/problems/department-highest-salary_2119329
*/

--Solution:
SELECT Department AS "Department", Employee AS "Employee", Salary AS "salary"
FROM(
        SELECT d.Name AS Department, e.Name AS Employee, e.Salary, DENSE_RANK() OVER(PARTITION BY d.Name ORDER BY e.Salary DESC) AS rank
        FROM  Employee e 
        JOIN Department d 
        ON e.DepartmentId=d.Id
) AS s
WHERE  rank=1
ORDER BY 2 DESC