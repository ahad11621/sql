/*
Problem link:
https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
*/

--Solution:
SELECT e2.unique_id, e1.name
FROM Employees e1
LEFT JOIN EmployeeUNI e2
ON e1.id = e2.id