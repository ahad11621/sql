/*
Problem link:
https://www.codingninjas.com/studio/problems/consecutive-available-seats_2111953
*/

--Solution:
SELECT c1.seat_id
FROM cinema c1
CROSS JOIN cinema c2
WHERE ABS(c2.seat_id - c1.seat_id) = 1 AND c1.free = c2.free