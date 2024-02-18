/*
Problem link:
https://leetcode.com/problems/product-sales-analysis-iii/
*/

--Solution-1:
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (SELECT product_id, MIN(year) FROM Sales GROUP BY product_id)


--Solution-2:
WITH CTE AS
(
    SELECT product_id, MIN(year) AS year
    FROM Sales
    GROUP BY product_id
)
SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales s 
JOIN CTE c
ON s.product_id = c.product_id AND s.year = c.year