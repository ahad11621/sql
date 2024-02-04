/*
Problem link:
https://leetcode.com/problems/recyclable-and-low-fat-products/description/
*/

--Solution:
SELECT product_id
FROM products
WHERE low_fats = 'Y' AND recyclable = 'Y'