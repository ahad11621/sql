/*
Problem link:
https://www.naukri.com/code360/problems/tree-node_2119334
*/

--Solution:
SELECT id, 
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id IN (SELECT DISTINCT p_id FROM tree) THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM tree