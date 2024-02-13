/*
Problem link:
https://leetcode.com/problems/not-boring-movies/
*/

--Solution:
SELECT *
FROM Cinema c
WHERE description <> 'boring' AND id % 2 = 1
ORDER BY rating DESC