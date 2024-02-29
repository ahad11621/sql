/*
Problem link:
https://leetcode.com/problems/group-sold-products-by-the-date/
*/

--Solution:
SELECT sell_date, COUNT(DISTINCT product) AS num_sold, STRING_AGG(product, ',') AS products
FROM (
    SELECT DISTINCT sell_date, product 
    FROM Activities
)
GROUP BY sell_date
ORDER BY sell_date
