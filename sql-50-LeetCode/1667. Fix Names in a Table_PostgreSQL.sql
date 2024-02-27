/*
Problem link:
https://leetcode.com/problems/fix-names-in-a-table/
*/

--Solution:
SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name from 2))) AS name
FROM Users
ORDER BY user_id