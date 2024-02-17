/*
Problem link:
https://leetcode.com/problems/immediate-food-delivery-ii/
*/

--Solution:
WITH CTE AS
(
    SELECT customer_id, order_date
    FROM Delivery
    WHERE order_date = customer_pref_delivery_date 
),
CTE2 AS
(
    SELECT customer_id, MIN(order_date) AS min_order_date
    FROM Delivery
    GROUP BY customer_id
)

SELECT ROUND(COUNT(CTE.customer_id)*100.00 / (SELECT COUNT(DISTINCT customer_id) FROM Delivery), 2) AS immediate_percentage 
FROM CTE
JOIN CTE2
ON CTE.customer_id = CTE2.customer_id AND CTE.order_date = CTE2.min_order_date