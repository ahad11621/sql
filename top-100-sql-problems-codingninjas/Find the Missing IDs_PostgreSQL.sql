/*
Problem link:
https://www.naukri.com/code360/problems/find-the-missing-ids_2181134
*/

--Solution:
WITH CTE AS
(
    SELECT generate_series AS ids
    FROM generate_series(1, (SELECT MAX(customer_id) FROM Customers))
    WHERE generate_series <= 100
)
SELECT *
FROM CTE
WHERE ids NOT IN (
    SELECT customer_id
    FROM Customers)