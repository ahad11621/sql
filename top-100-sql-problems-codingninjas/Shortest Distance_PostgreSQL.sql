/*
Problem link:
https://www.codingninjas.com/studio/problems/shortest-distence-in-a-line_2105463
*/

--Solution:
SELECT MIN(s.diff) AS shortest
FROM (
    SELECT ABS(p1.x - p2.x) AS diff
    FROM point p1
    CROSS JOIN point p2
    WHERE p1.x <> p2.x) AS s