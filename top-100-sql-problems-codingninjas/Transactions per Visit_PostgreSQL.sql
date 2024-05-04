/*
Problem link:
https://www.naukri.com/code360/problems/number-of-transactions-per-visit_2196169
*/

--Solution:
WITH CTE AS
(
    SELECT v.user_id, v.visit_date, COUNT(t.amount)
    FROM Visits v
    LEFT JOIN Transactions t
    ON v.user_id = t.user_id AND v.visit_date = t.transaction_date
    GROUP BY v.user_id, v.visit_date
),
gs AS
(
    SELECT generate_series(0, MAX(count)) AS transactions_count
    FROM CTE
)
SELECT g.transactions_count, COUNT(c.count) AS visits_count
FROM gs g
LEFT JOIN CTE c
ON g.transactions_count = c.count
GROUP BY g.transactions_count
ORDER BY g.transactions_count