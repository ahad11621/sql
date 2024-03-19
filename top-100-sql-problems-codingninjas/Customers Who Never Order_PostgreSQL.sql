/*
Problem link:
https://www.codingninjas.com/studio/problems/customers-who-never-order_2111946
*/

--Solution:
SELECT namecust AS "Customers"
FROM Customers
WHERE id NOT IN (
    SELECT DISTINCT customerid
    FROM Orders
)