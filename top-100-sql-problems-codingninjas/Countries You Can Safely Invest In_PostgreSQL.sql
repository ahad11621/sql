/*
Problem link:
https://www.naukri.com/code360/problems/countries-you-can-safely-invest-in_2188774
*/

--Solution:
WITH CTE AS
(
    SELECT p.id, c.name
    FROM Country c
    JOIN ( 
        SELECT *, LEFT(phone_number, 3) AS cc
        FROM Person) p
    ON p.cc = c.country_code
),
CTE_caller AS
(
    SELECT c2.name, c1.duration
    FROM Calls c1
    JOIN CTE c2
    ON c1.caller_id = c2.id
),
CTE_callee AS
(
    SELECT c2.name, c1.duration
    FROM Calls c1
    JOIN CTE c2
    ON c1.callee_id = c2.id
),
CTE_com AS
(
    SELECT * FROM CTE_caller
    UNION ALL
    SELECT * FROM CTE_callee
)
SELECT name AS country
FROM CTE_com
GROUP BY name
HAVING AVG(duration) > (SELECT AVG(duration) FROM CTE_com)