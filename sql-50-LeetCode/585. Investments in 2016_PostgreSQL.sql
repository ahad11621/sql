/*
Problem link:
https://leetcode.com/problems/investments-in-2016
*/

--Solution:
WITH CTE AS
(
    SELECT *, CONCAT(CAST(lat AS TEXT), CAST(lon AS TEXT)) AS latlon
    FROM Insurance
),
CTE_1 AS
(
    SELECT tiv_2016
    FROM CTE
    WHERE latlon IN (
        SELECT latlon
        FROM CTE
        GROUP BY latlon
        HAVING COUNT(latlon) = 1
    )
    AND tiv_2015 IN(
        SELECT tiv_2015
        FROM Insurance
        GROUP BY tiv_2015
        HAVING COUNT(tiv_2015) > 1
    )
)
SELECT ROUND(CAST(SUM(tiv_2016) AS NUMERIC), 2) AS tiv_2016
FROM CTE_1