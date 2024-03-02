/*
Problem link:
https://leetcode.com/problems/swap-salary/
*/

--Solution:
UPDATE Salary SET sex = (CASE WHEN sex = 'm' THEN 'f' ELSE 'm' END)