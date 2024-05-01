/*
Problem link:
https://www.naukri.com/code360/problems/human-traffic-of-stadium_2181183
*/

--Solution:
WITH CTE AS
(
    SELECT *, ROW_NUMBER() OVER(ORDER BY id) AS rn, id-ROW_NUMBER() OVER(ORDER BY id) AS diff
    FROM Stadium
    WHERE people >= 100
)
SELECT id, visit_date, people
FROM CTE
WHERE diff IN (
    SELECT diff
    FROM CTE
    GROUP BY diff
    HAVING COUNT(diff) > 2)
ORDER By visit_date
