/*
Problem link:
https://leetcode.com/problems/customers-who-bought-all-products/
*/

--Solution-1:
SELECT customer_id
FROM (
    SELECT CASE 
        WHEN COUNT(DISTINCT product_key) / (SELECT COUNT(*) FROM Product) = 1 THEN customer_id 
    END AS customer_id
    FROM Customer
    GROUP BY customer_id
    WHERE customer_id IS NOT NULL
)
WHERE customer_id IS NOT NULL


--Solution-2:
SELECT customer_id 
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product)