/*
Problem link:
https://www.codingninjas.com/studio/problems/sales-person_2105462
*/

--Solution:
SELECT name
FROM Salesperson
WHERE sales_id NOT IN (
    SELECT o.sales_id
    FROM Orders o
    JOIN Company c
    ON o.com_id = c.com_id
    WHERE c.name = 'RED'
)