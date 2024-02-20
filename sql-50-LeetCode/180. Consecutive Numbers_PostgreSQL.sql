/*
Problem link:
https://leetcode.com/problems/consecutive-numbers/
*/

--Solution-1:
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT id, num, LAG(num, 1) OVER() AS num_1, LAG(num, 2) OVER() AS num_2
    FROM Logs
    ORDER BY id
)
WHERE num = num_1 AND num_1 = num_2


--Solution-2:
SELECT DISTINCT(l1.num) AS ConsecutiveNums
FROM Logs l1, logs l2, logs l3
WHERE l1.id = l2.id + 1 AND l2.id = l3.id + 1 AND l1.num = l2.num AND l2.num = l3.num