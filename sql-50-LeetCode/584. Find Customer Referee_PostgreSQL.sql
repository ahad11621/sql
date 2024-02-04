/*
Problem link:
https://leetcode.com/problems/find-customer-referee/
*/

--Solution:
SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id <> 2