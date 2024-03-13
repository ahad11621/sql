/*
Problem link:
https://www.codingninjas.com/studio/problems/spotify-sessions_2246918
*/

--Solution:
SELECT DISTINCT session_id
FROM (
    SELECT p.session_id, p.start_time, p.end_time, a.timestamp,
    CASE
        WHEN timestamp >= start_time AND timestamp <= end_time THEN 'Yes'
        ELSE 'No' 
    END AS ads
    FROM Playback p
    LEFT JOIN Ads a
    ON p.customer_id = a.customer_id
) AS s 
WHERE s.ads = 'No'