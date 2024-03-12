/*
Problem link:
https://www.codingninjas.com/studio/problems/customer-placing-the-largest-number-of-orders_2111951
*/

--Solution:
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1