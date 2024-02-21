/*
Problem link:
https://leetcode.com/problems/product-price-at-a-given-date
*/

--Solution:
WITH CTE AS
(
    SELECT product_id, MAX(change_date) AS max_date
    FROM Products
    WHERE change_date < '2019-08-17'
    GROUP BY product_id
)
SELECT p.product_id, p.new_price AS price
FROM Products p
JOIN CTE c
ON p.product_id = c.product_id AND p.change_date = c.max_date
UNION
SELECT product_id, 10 AS price
FROM Products
GROUP BY product_id
HAVING product_id NOT IN (SELECT product_id FROM CTE)