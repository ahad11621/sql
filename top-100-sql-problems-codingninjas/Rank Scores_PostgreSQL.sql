/*
Problem link:
https://www.codingninjas.com/studio/problems/rank-scores_2117771
*/

--Solution:
SELECT score, DENSE_RANK() OVER(ORDER BY score DESC) AS "RANK"
FROM Scores