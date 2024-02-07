/*
Problem link:
https://leetcode.com/problems/rising-temperature/
*/

--Solution:
--With JOIN and CTE__Runtime: 1541 ms
WITH CTE AS
(
    SELECT w1.id AS Id, w1.recordDate AS rd1, w2.recordDate AS rd2, w1.temperature AS t1, w2.temperature AS t2
    FROM Weather w1
    CROSS JOIN Weather w2
    WHERE w1.id <> w2.id
    ORDER BY w1.recordDate DESC
)
SELECT Id
FROM CTE
WHERE rd1-rd2 = 1 AND t1 > t2

--Without JOIN__Runtime: 554 ms
SELECT w1.id AS Id
FROM Weather w1, Weather w2
WHERE w1.temperature > w2.temperature AND w1.recordDate - w2.recordDate = 1

--Without JOIN and CTE__Runtime: 361 ms
WITH CTE AS
(
    SELECT *, LAG(recordDate, 1) OVER(ORDER BY recordDate) AS lag_rD, LAG(temperature, 1) OVER() AS lag_temp
    FROM Weather w
)
SELECT id
FROM CTE
WHERE temperature > lag_temp AND recordDate - lag_rd = 1