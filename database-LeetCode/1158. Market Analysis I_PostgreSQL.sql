/*
Problem link:
https://leetcode.com/problems/market-analysis-i/
*/

--Solution:
SELECT user_id AS buyer_id, join_date, 
CASE
    WHEN s.orders_in_2019 IS NULL THEN 0
    ELSE s.orders_in_2019
END AS orders_in_2019
FROM Users u
LEFT JOIN (
    SELECT buyer_id AS user_id, COUNT(item_id) AS orders_in_2019
    FROM Orders
    WHERE EXTRACT(YEAR FROM order_date) = 2019
    GROUP BY buyer_id
) AS s
USING(user_id)