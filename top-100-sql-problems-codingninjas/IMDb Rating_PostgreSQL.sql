/*
Problem link:
https://www.codingninjas.com/studio/problems/testingg-sql_1755903
*/

--Solution:
SELECT i.title, i.rating
FROM imdb i
JOIN genre g
ON i.movie_id = g.movie_id
WHERE LEFT(g.genre, 1) = 'C' 
AND LEFT(RIGHT(i.title, 5), 4) = '2014' 
AND i.budget > 40000000