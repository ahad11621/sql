/*
Problem link:
https://www.codingninjas.com/studio/problems/delete-duplicate-emails_2111947
*/

--Solution:
DELETE FROM Person
WHERE id NOT IN(
    SELECT MIN(id) AS id
    FROM Person
    GROUP BY email
);
SELECT * FROM Person;