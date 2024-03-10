/*
Problem link:
https://www.codingninjas.com/studio/problems/big-country_2105461
*/

--Solution:
SELECT name, population, area
FROM World
WHERE area > 3000000 OR population > 25000000