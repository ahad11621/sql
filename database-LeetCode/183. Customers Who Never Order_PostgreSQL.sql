/*
Problem link:
https://leetcode.com/problems/customers-who-never-order/description/
*/

--Solution:
SELECT name AS Customers
FROM Customers
WHERE id NOT IN (SELECT customerId FROM Orders)