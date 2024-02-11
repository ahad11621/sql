/*
Problem link:
https://leetcode.com/problems/confirmation-rate/
*/

--Solution:
WITH CTE AS
(
    SELECT user_id, COUNT(user_id)
    FROM Confirmations c
    GROUP BY user_id
),
CTE_ AS
(
    SELECT user_id, COUNT(action) AS confirmed
    FROM Confirmations c
    WHERE action = 'confirmed'
    GROUP BY user_id  
),
CTE__ AS
(
    SELECT CTE_.user_id, ROUND((CTE_.confirmed * 1.00/CTE.count), 2) AS confirmation_rate
    FROM CTE_
    LEFT JOIN CTE
    ON CTE.user_id = CTE_.user_id
)

SELECT s.user_id, 
    CASE
        WHEN c.confirmation_rate > 0 THEN c.confirmation_rate
        ELSE 0
    END AS confirmation_rate
FROM Signups s
LEFT JOIN CTE__ c
ON s.user_id = c.user_id