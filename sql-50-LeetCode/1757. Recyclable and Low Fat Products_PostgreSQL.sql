/*
Problem link:
https://leetcode.com/problems/recyclable-and-low-fat-products/
*/

--Solution:
SELECT product_id
FROM products
WHERE low_fats = 'Y' AND recyclable = 'Y'