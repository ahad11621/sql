/*
Problem link:
https://www.naukri.com/code360/problems/investments-in-2016_2119333
*/

--Solution:
WITH CTE AS
(
    SELECT *
    FROM insurance
    WHERE CONCAT(lat, lon) IN (
        SELECT CONCAT(Lat, lon)
        FROM insurance
        GROUP BY CONCAT(Lat, lon)
        HAVING COUNT(CONCAT(Lat, lon)) = 1)
)
SELECT SUM(tiv_2016) AS tiv_2016
FROM CTE
GROUP BY tiv_2015
HAVING COUNT(tiv_2015) > 1