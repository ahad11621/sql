/*
Problem link:
https://www.codingninjas.com/studio/problems/biggest-single-number_2111955
*/

--Solution:
SELECT num
FROM my_numbers
GROUP BY num
HAVING COUNT(num) = 1
ORDER BY num DESC
LIMIT 1