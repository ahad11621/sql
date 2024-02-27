/*
Problem link:
https://leetcode.com/problems/find-users-with-valid-e-mails/
*/

--Solution:
SELECT user_id, name, mail
FROM Users
WHERE LEFT(mail, 1) ~ '^[A-Za-z]' 
    AND RIGHT(mail, 13) = '@leetcode.com'
    AND user_id NOT IN (
        SELECT user_id
        FROM Users
        WHERE LEFT(mail, LENGTH(mail)-13) ~ '[^0-9A-Za-z_.-]'
)
