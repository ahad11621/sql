/*
Problem link:
https://www.naukri.com/code360/problems/shortest-distance-in-a-plane_2119335
*/

--Solution:
SELECT MIN(SQRT(POWER(t2.x-t1.x, 2)+POWER(t2.y-t1.y, 2))) AS shortest 
FROM point_2d t1
CROSS JOIN point_2d t2
WHERE t1 <> t2