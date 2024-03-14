/*
Problem link:
https://www.codingninjas.com/studio/problems/number-of-calls-between-two-persons_2181135
*/

--Solution:
WITH CTE AS(
    SELECT *,
    CASE
        WHEN from_id < to_id THEN CONCAT(from_id, to_id)
        ELSE CONCAT(to_id, from_id)
    END AS pair
    FROM Calls)
SELECT LEFT(pair, 1) AS person1, RIGHT(pair, 1) AS person2, COUNT(pair) AS call_count, SUM(duration) AS total_duration
FROM CTE
GROUP BY pair