/*
Problem link:
https://leetcode.com/problems/bank-account-summary-ii/
*/

--Solution-1:
SELECT u.name, SUM(t.amount) AS balance
FROM Users u
JOIN Transactions t
ON u.account = t.account
GROUP BY u.name
HAVING SUM(t.amount) > 10000


--Solution-2:
SELECT u.name, t.balance
FROM (
    SELECT account, SUM(amount) AS balance
    FROM Transactions
    GROUP BY account
) AS t
LEFT JOIN Users u
ON t.account = u.account
WHERE t.balance > 10000