/*
Problem link:
https://www.codingninjas.com/studio/problems/imdb_1755910
*/

--Solution:
SELECT i.title, i.rating
FROM imdb i
JOIN earning e
ON i.movie_id = e.movie_id
WHERE LEFT(RIGHT(i.title, 5), 4) = '2012'
AND i.metacritic > 60
AND e.domestic > 100000000