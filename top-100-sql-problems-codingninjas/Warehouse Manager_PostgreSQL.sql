/*
Problem link:
https://www.codingninjas.com/studio/problems/warehouse-manager_2181185
*/

--Solution:
SELECT w.name AS warehouse_name, SUM(w.units*p.volume) AS volume
FROM Warehouse w
JOIN (
    SELECT product_id, (width*length*height) AS volume
    FROM Products
) AS p
ON w.product_id = p.product_id
GROUP BY w.name