/*
Problem link:
https://www.codingninjas.com/studio/problems/imdb_1755913
*/

--Solution:
SELECT g.genre, MAX((i.rating+i.metacritic/10.0)/2) AS weighted_rating
FROM imdb i
JOIN genre g
ON i.movie_id = g.movie_id
WHERE LEFT(RIGHT(i.title, 5), 4) = '2014'AND g.genre IS NOT NULL
GROUP BY g.genre
ORDER BY g.genre