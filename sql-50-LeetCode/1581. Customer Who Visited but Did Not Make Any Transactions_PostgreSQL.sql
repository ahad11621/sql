/*
Problem link:
https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
*/

--Solution:
SELECT v.customer_id, COUNT(customer_id) AS count_no_trans
FROM Transactions t
RIGHT JOIN Visits v
ON t.visit_id = v.visit_id
WHERE transaction_id IS NULL
GROUP BY v.customer_id