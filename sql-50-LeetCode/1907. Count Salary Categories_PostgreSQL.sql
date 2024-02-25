/*
Problem link:
https://leetcode.com/problems/count-salary-categories/
*/

--Solution-1:
SELECT 'Low Salary' AS category, COUNT(income) AS accounts_count 
FROM Accounts 
WHERE income < 20000 
UNION 
SELECT 'Average Salary' AS category, COUNT(income) AS accounts_count 
FROM Accounts 
WHERE income >= 20000 AND income <= 50000 
UNION 
SELECT 'High Salary' AS category, COUNT(income) AS accounts_count 
FROM Accounts 
WHERE income > 50000


--Solution-2:
SELECT 'Low Salary' AS category, SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts   
UNION
SELECT 'Average Salary' category, SUM(CASE WHEN income >= 20000 AND income <= 50000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts
UNION
SELECT 'High Salary' category, SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts


--Solution-3:
WITH CTE AS
(
    SELECT 'Low Salary' AS category, 0 AS accounts_count
    UNION
    SELECT 'Average Salary' AS category, 0 AS accounts_count
    UNION
    SELECT 'High Salary' AS category, 0 AS accounts_count
),
CTE_1 AS
(
    SELECT account_id, 
    CASE
        WHEN income < 20000 THEN 'Low Salary'
        WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
        WHEN income > 50000 THEN 'High Salary'
    END AS category
    FROM Accounts
),
CTE_2 AS
(
    SELECT category, COUNT(account_id) AS accounts_count
    FROM CTE_1
    GROUP BY category
)
SELECT CTE.category,
    CASE
        WHEN (CTE.accounts_count + CTE_2.accounts_count) IS NULL THEN 0
        ELSE (CTE.accounts_count + CTE_2.accounts_count)
    END AS accounts_count
FROM CTE
LEFT JOIN CTE_2
ON CTE.category = CTE_2.category