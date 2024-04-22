/*
Problem link:
https://www.naukri.com/code360/problems/bank-account-summary_2122063
*/

--Solution:
WITH CTE_trans AS
(
    SELECT paid_by AS user_id, (amount*-1) AS amount
    FROM Transactions
    UNION ALL
    SELECT paid_to AS user_id, amount
    FROM Transactions
    UNION ALL
    SELECT user_id, credit AS amount
    FROM Users
)
SELECT u.user_id, u.user_name, s.balance AS credit, CASE WHEN s.balance < 0 THEN 'Yes' ELSE 'No' END AS credit_limit_breached
FROM Users u
JOIN (
    SELECT user_id, SUM(amount) AS balance
    FROM CTE_trans
    GROUP BY user_id) AS s
ON u.user_id = s.user_id