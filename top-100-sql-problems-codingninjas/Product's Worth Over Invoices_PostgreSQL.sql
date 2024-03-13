/*
Problem link:
https://www.codingninjas.com/studio/problems/product-s-worth-over-invoices_2188792
*/

--Solution:
SELECT p.name, rest, paid, canceled, refunded
FROM Product p
JOIN (
    SELECT product_id, SUM(rest) AS rest, SUM(paid) AS paid, SUM(canceled) AS canceled, SUM(refunded) AS refunded
    FROM Invoice
    GROUP BY product_id) AS s
ON p.product_id = s.product_id
ORDER BY p.name