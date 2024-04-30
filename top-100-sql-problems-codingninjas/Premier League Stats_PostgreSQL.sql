/*
Problem link:
https://www.naukri.com/code360/problems/league-statistics_2181143
*/

--Solution:
WITH matches_played  AS
(
    SELECT s.id , COUNT(s.id) AS matches_played
    FROM (
        SELECT home_team_id AS id, home_team_goals AS goals
        FROM Matches
        UNION ALL
        SELECT away_team_id AS id , away_team_goals AS goals
        FROM Matches) AS s
    GROUP BY s.id
),
points AS
(
    WITH points AS
    (
        SELECT home_team_id, away_team_id, 
        CASE
            WHEN home_team_goals > away_team_goals THEN 3
            WHEN home_team_goals < away_team_goals THEN 0
            ELSE 1
        END AS home_team_points,
        CASE
            WHEN home_team_goals < away_team_goals THEN 3
            WHEN home_team_goals > away_team_goals THEN 0
            ELSE 1
        END AS away_team_points
        FROM Matches
    )
    SELECT s.id, SUM(s.point) AS points
    FROM(
        SELECT home_team_id AS id, home_team_points AS point
        FROM points
        UNION ALL
        SELECT away_team_id AS id, away_team_points AS point
        FROM points) AS s
    GROUP BY s.id
),
goals_for_against AS
(
    SELECT s.id, SUM(s.goal_for) AS goal_for, SUM(s.goal_against) AS goal_against
    FROM(
        SELECT home_team_id AS id, home_team_goals  AS goal_for, away_team_goals AS goal_against
        FROM Matches
        UNION ALL 
        SELECT away_team_id AS id, away_team_goals  AS goal_for, home_team_goals AS goal_against
        FROM Matches) AS s
    GROUP BY s.id
)
SELECT t.team_name, mp.matches_played, p.points, ga.goal_for, ga.goal_against, (ga.goal_for-ga.goal_against) AS goal_diff
FROM Teams t
JOIN matches_played mp ON t.team_id = mp.id
JOIN points p ON mp.id = p.id
JOIN goals_for_against ga ON p.id = ga.id
ORDER BY p.points DESC, (ga.goal_for-ga.goal_against) DESC, t.team_name

