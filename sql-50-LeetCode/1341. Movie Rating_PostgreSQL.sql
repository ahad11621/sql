/*
Problem link:
https://leetcode.com/problems/movie-rating/
*/

--Solution:
WITH CTE AS
(
    SELECT u.name AS results
    FROM Users u
    JOIN (
        SELECT user_id, COUNT(movie_id) AS count
        FROM MovieRating
        GROUP BY user_id
    ) AS m
    ON u.user_id = m.user_id
    ORDER BY m.count DESC, u.name ASC
    LIMIT 1
),
CTE_1 AS
(
    SELECT title AS results
    FROM Movies m
    JOIN (
        SELECT movie_id, AVG(rating) AS avg
        FROM MovieRating
        WHERE LEFT(CAST(created_at AS TEXT), 7) = '2020-02'
        GROUP BY movie_id
    ) AS j
    ON m.movie_id = j.movie_id
    ORDER BY j.avg DESC, m.title ASC
    LIMIT 1
)
SELECT * FROM CTE
UNION ALL
SELECT * FROM CTE_1