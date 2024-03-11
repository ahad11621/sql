/*
Problem link:
https://www.codingninjas.com/studio/problems/director-s-actor_2246916
*/

--Solution:
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(timestamp) > 2