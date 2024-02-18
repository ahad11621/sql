/*
Problem link:
https://leetcode.com/problems/classes-more-than-5-students/
*/

--Solution:
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) > 4