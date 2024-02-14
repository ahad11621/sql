/*
Problem link:
https://leetcode.com/problems/average-selling-price/
*/

--Solution-1:
WITH CTE AS
(
    SELECT p.product_id, p.price,
    CASE
        WHEN u.purchase_date BETWEEN p.start_date AND p.end_date THEN u.units
        ELSE 0
    END AS units
    FROM Prices p
    LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id 
),
CTE2 AS
(
    SELECT product_id, units, (price * units) AS rev
    FROM CTE
)

SELECT product_id, 
CASE
    WHEN SUM(units) = 0 THEN 0
    ELSE ROUND((SUM(rev) * 1.0) / SUM(units), 2)
END AS average_price
FROM CTE2
GROUP BY product_id


--Solution-2:
SELECT p.product_id, 
    CASE
        WHEN ROUND(SUM(p.price * u.units) * 1.00 / SUM(u.units), 2) IS NULL THEN 0
        ELSE ROUND(SUM(p.price * u.units) * 1.00 / SUM(u.units), 2)
    END AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id