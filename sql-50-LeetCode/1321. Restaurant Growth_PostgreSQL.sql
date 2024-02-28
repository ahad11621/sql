/*
Problem link:
https://leetcode.com/problems/restaurant-growth/
*/

--Solution:
WITH CTE AS
(
    SELECT visited_on, SUM(amount) AS amount, RANK() OVER(ORDER BY visited_on) AS rank
    FROM Customer
    GROUP BY visited_on
),
CTE_1 AS
(
    SELECT visited_on, SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN '6 day' PRECEDING AND CURRENT ROW) AS sum
    FROM CTE
),
CTE_2 AS
(
    SELECT visited_on
    FROM CTE
    WHERE rank/7 >= 1
)
SELECT CTE_2.visited_on, CTE_1.sum AS amount, ROUND(CTE_1.sum/7.00, 2) AS average_amount 
FROM CTE_2
LEFT JOIN CTE_1
ON CTE_2.visited_on = CTE_1.visited_on