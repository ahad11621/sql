/*
Problem link:
https://leetcode.com/problems/delete-duplicate-emails/
*/

--Solution-1:
DELETE FROM Person p1
USING Person p2
WHERE p1.id > p2.id
AND p1.email = p2.email


--Solution-2:
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id) FROM Person GROUP BY email
)