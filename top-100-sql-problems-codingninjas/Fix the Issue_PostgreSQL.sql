/*
Problem link:
https://www.codingninjas.com/studio/problems/fix-product-name-format_2196164
*/

--Solution:
SELECT lower(product_name) AS product_name, LEFT(CAST(sale_date AS TEXT), 7) AS sale_date, COUNT(sale_id) AS total
FROM Sales
GROUP BY lower(product_name), LEFT(CAST(sale_date AS TEXT), 7)
ORDER BY lower(product_name), LEFT(CAST(sale_date AS TEXT), 7)