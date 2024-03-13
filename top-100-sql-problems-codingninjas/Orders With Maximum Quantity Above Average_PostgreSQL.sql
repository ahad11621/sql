/*
Problem link:
https://www.codingninjas.com/studio/problems/orders-with-maximum-quantity-above-average_2188776
*/

--Solution:
WITH CTE AS (
    SELECT order_id, AVG(quantity) AS avg
    FROM OrdersDetails
    GROUP BY order_id)
SELECT order_id
FROM OrdersDetails
GROUP BY order_id
HAVING MAX(quantity) > (SELECT MAX(avg) FROM CTE)
