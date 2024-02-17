/*
Problem link:
https://leetcode.com/problems/game-play-analysis-iv/
*/

--Solution-1:
SELECT ROUND(COUNT(player_id)*1.00 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM (SELECT player_id, event_date, MIN(event_date) OVER(PARTITION BY player_id) AS first_logged_in FROM Activity)
WHERE event_date - first_logged_in = 1


--Solution-2:
WITH CTE AS
(
    SELECT player_id, MIN(event_date) AS first_day
    FROM Activity
    GROUP BY player_id
)
SELECT ROUND(COUNT(*)*1.00 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity a, CTE c
WHERE a.player_id = c.player_id AND a.event_date - c.first_day = 1


--Solution-3:
SELECT ROUND(COUNT(DISTINCT player_id)*1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity 
WHERE (player_id, event_date - 1) IN (SELECT player_id, MIN(event_date) FROM Activity GROUP BY player_id)



