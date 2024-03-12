/*
Problem link:
https://www.codingninjas.com/studio/problems/duplicate-emails_2105465
*/

--Solution:
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(id) > 1