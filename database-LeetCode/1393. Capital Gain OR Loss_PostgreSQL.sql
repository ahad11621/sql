/*
Problem link:
https://leetcode.com/problems/capital-gainloss/
*/

--Solution-1:
SELECT stock_name, SUM(price) FILTER(WHERE operation = 'Sell') - SUM(price) FILTER(WHERE operation = 'Buy') AS capital_gain_loss
FROM Stocks
GROUP BY stock_name


--Solution-2:
SELECT stock_name, SUM(CASE WHEN operation = 'Buy' THEN -price ELSE price END) AS capital_gain_loss 
FROM stocks GROUP BY stock_name



--Solution-3:
WITH CTE AS
(
    SELECT stock_name, operation, SUM(price) AS tprice
    FROM Stocks
    GROUP BY stock_name, operation
    ORDER BY stock_name ASC, operation ASC
)
SELECT c1.stock_name, (c1.tprice - c2.tprice) AS capital_gain_loss
FROM CTE c1, CTE c2
WHERE c1.stock_name = c2.stock_name AND c1.operation <> c2.operation AND c1.operation = 'Sell'