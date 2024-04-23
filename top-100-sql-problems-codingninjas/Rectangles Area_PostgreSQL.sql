/*
Problem link:
https://www.naukri.com/code360/problems/rectangles-area_2122061
*/

--Solution:
WITH CTE AS
(
    SELECT p1.id AS p1, p2.id AS p2
    FROM Points p1, Points p2
    WHERE p1.id<p2.id AND p2.id-p1.id=1
),
CTE_table AS
(
    SELECT s.p1, s.p2, s.p1x, s.p1y, p.x_value AS p2x, p.y_value AS p2y
    FROM Points p
    JOIN (
        SELECT c.p1, c.p2, p.x_value AS p1x, p.y_value AS p1y
        FROM CTE c
        JOIN Points p
        ON c.p1 = p.id) AS s
    ON p.id = s.p2
)
SELECT p1, p2, ABS(p1x-p2x)*ABS(p1y-p2y) AS area
FROM CTE_table
ORDER BY area DESC, p1, p2