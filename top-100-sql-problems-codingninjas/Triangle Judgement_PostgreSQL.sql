/*
Problem link:
https://www.codingninjas.com/studio/problems/triangle-judgement_2111954
*/

--Solution:
SELECT *, 
CASE
    WHEN x+y>z AND y+z>x AND z+x>y THEN 'Yes'
    ELSE 'No'
END AS triangle
FROM triangle