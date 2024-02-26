/*
Problem link:
https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
*/

--Solution:
WITH CTE AS
(
    SELECT requester_id, COUNT(requester_id) AS count_requester_id
    FROM RequestAccepted
    GROUP BY requester_id
),
CTE_1 AS
(
    SELECT accepter_id, COUNT(accepter_id) AS count_accepter_id
    FROM RequestAccepted
    GROUP BY accepter_id
),
CTE_2 AS
(
    SELECT requester_id AS id, count_requester_id AS num
    FROM CTE
    UNION ALL
    SELECT accepter_id AS id, count_accepter_id AS num
    FROM CTE_1
)
SELECT id, SUM(num) AS num
FROM CTE_2
GROUP BY id
ORDER BY SUM(num) DESC
LIMIT 1
