/*
Problem link:
https://www.codingninjas.com/studio/problems/article_2181187
*/

--Solution:
WITH CTE AS
(
    SELECT DISTINCT * FROM Views
)
SELECT viewer_id AS id
FROM CTE
GROUP BY viewer_id
HAVING COUNT(DISTINCT article_id) > 1
ORDER BY viewer_id