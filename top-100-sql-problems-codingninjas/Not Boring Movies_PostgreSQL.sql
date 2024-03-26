/*
Problem link:
https://www.codingninjas.com/studio/problems/not-boring-movies_2117047
*/

--Solution:
SELECT *
FROM Cinema
WHERE id%2=1 AND description <> 'boring'
ORDER BY rating DESC