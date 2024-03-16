/*
Problem link:
https://www.codingninjas.com/studio/problems/recyclable-and-low-fat-products_2181186
*/

--Solution:
SELECT  product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y'