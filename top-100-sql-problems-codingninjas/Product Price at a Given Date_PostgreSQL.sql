/*
Problem link:
https://www.naukri.com/code360/problems/product-price-at-a-given-date_2122057
*/

--Solution:
SELECT product_id, MAX(CASE WHEN EXTRACT(day FROM change_date)<= 16 THEN new_price ELSE '10' END) AS price
FROM Products
GROUP BY product_id
ORDER BY 2 ASC