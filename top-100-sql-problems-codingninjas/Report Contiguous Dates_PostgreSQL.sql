/*
Problem link:
https://www.naukri.com/code360/problems/report-contiguous-dates_2196168
*/

--Solution:
WITH CTE AS 
(
    SELECT fail_date AS date, 'failed' AS type
    FROM Failed
    WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
    UNION ALL
    SELECT success_date AS date, 'succeeded' AS type
    FROM Succeeded
    WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31'
),
succeeded AS
(
    SELECT *, 
    ROW_NUMBER() OVER(ORDER BY date),
    EXTRACT(DAY FROM date)-ROW_NUMBER() OVER(ORDER BY date) AS flag
    FROM CTE
    WHERE type = 'succeeded'
),
failed AS
(
    SELECT *, 
    ROW_NUMBER() OVER(ORDER BY date),
    EXTRACT(DAY FROM date)-ROW_NUMBER() OVER(ORDER BY date) AS flag
    FROM CTE
    WHERE type = 'failed'
),
result AS
(
    SELECT type AS period_state, MIN(date) AS start_date, MAX(date) AS end_date
    FROM succeeded
    GROUP BY type, flag
    UNION ALL
    SELECT type AS period_state, MIN(date) AS start_date, MAX(date) AS end_date
    FROM failed
    GROUP BY type, flag
)
SELECT *
FROM result
ORDER BY start_date

