/*
Problem link:
https://leetcode.com/problems/list-the-products-ordered-in-a-period/
*/

--Solution:
WITH CTE AS
(
    SELECT product_id, SUM(unit) AS unit
    FROM Orders
    WHERE LEFT(CAST(order_date AS TEXT), 7) = '2020-02'
    GROUP BY product_id
    HAVING SUM(unit) > 99
)
SELECT p.product_name, c.unit
FROM CTE c
LEFT JOIN Products p
ON c.product_id = p.product_id