/*
Problem link:
https://www.naukri.com/code360/problems/suspicious-bank-accounts_2188775
*/

--Solution:

WITH CTE AS
(
    SELECT a.max_income, s.*, CASE WHEN s.amount>a.max_income THEN 1 ELSE 0 END AS suspicious 
    FROM Accounts a
    JOIN (
        SELECT CAST(CONCAT(EXTRACT(YEAR FROM day), EXTRACT(MONTH FROM day)) AS INT) AS ym, account_id, SUM(amount) AS amount
        FROM Transactions
        WHERE type_pro = 'Creditor'
        GROUP BY CONCAT(EXTRACT(YEAR FROM day), EXTRACT(MONTH FROM day)), account_id
    ) s
    ON a.account_id = s.account_id
)
SELECT c1.account_id
FROM CTE c1, CTE c2
WHERE c1.ym-c2.ym = 1 AND c1.suspicious + c2.suspicious = 2 AND c1.account_id = c2.account_id
