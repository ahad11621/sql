/*
Problem link:
https://leetcode.com/problems/the-latest-login-in-2020/
*/

--Solution-1:
SELECT user_id, MAX(time_stamp) AS last_stamp
FROM Logins
WHERE EXTRACT('Year' FROM time_stamp) = 2020
GROUP BY user_id


--Solution-2:
SELECT user_id, MAX(time_stamp) AS last_stamp
FROM Logins
WHERE LEFT(CAST(time_stamp AS TEXT), 4) = '2020'
GROUP BY user_id