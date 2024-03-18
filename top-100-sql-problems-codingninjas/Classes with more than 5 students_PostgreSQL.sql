/*
Problem link:
https://www.codingninjas.com/studio/problems/classes-more-than-5-students_2105464
*/

--Solution:
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) > 4