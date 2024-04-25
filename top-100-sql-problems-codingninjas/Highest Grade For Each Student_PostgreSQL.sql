/*
Problem link:
https://www.naukri.com/code360/problems/highest-grade-for-each-student_2122055
*/

--Solution:
SELECT s.student_id, s.course_id, s.grade
FROM (
    SELECT *, RANK() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id)
    FROM Enrollments) AS s
WHERE s.rank = 1