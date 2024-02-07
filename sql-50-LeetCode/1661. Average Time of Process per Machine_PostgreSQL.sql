/*
Problem link:
https://leetcode.com/problems/average-time-of-process-per-machine/
*/

--Solution:
--WITH WINDOW FUNCTION __Runtime: 750 ms
WITH CTE AS
(
    SELECT *, LEAD(timestamp, 1) OVER(ORDER BY machine_id, process_id, activity_type) AS ts
    FROM Activity
)
 SELECT machine_id, ROUND(CAST(AVG(timestamp - ts)AS NUMERIC),3) AS processing_time
 FROM CTE
 WHERE activity_type = 'end'
 GROUP BY machine_id




--Runtime: 252 ms
WITH CTE1 AS
(
    SELECT *
    FROM Activity
    WHERE activity_type = 'end'
),
CTE2 AS
(
    SELECT *
    FROM Activity
    WHERE activity_type = 'start'
)
SELECT c1.machine_id, ROUND(CAST(AVG(c1.timestamp-c2.timestamp) AS NUMERIC),3) AS processing_time
FROM CTE1 c1, CTE2 c2
WHERE c1.machine_id = c2.machine_id AND c1.process_id = c2.process_id
GROUP BY c1.machine_id