/*
Problem link:
https://leetcode.com/problems/top-travellers/
*/

--Solution:
WITH CTE AS
(
    SELECT user_id, SUM(distance) AS travelled_distance
    FROM Rides
    GROUP BY user_id
),
CTE_1 AS
(
    SELECT u.name, c.travelled_distance
    FROM Users u
    JOIN CTE c
    ON u.id = c.user_id
)
SELECT *
FROM CTE_1
UNION
SELECT name, 0 travelled_distance 
FROM Users
WHERE id NOT IN (SELECT user_id FROM CTE)
ORDER BY travelled_distance DESC,name ASC