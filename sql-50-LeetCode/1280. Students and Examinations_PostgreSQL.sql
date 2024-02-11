/*
Problem link:
https://leetcode.com/problems/students-and-examinations/
*/

--Solution:
WITH CTE_Exam AS
(
    SELECT *, COUNT(subject_name) AS attended_exams
    FROM Examinations e
    GROUP BY student_id, subject_name
),
CTE_ST_SUB AS
(
    SELECT *
    FROM Students stu
    CROSS JOIN Subjects sub
)

SELECT c1.student_id, c1.student_name, c1.subject_name, 
    CASE
        WHEN c2.attended_exams > 0 THEN c2.attended_exams
        ELSE 0
    END AS attended_exams
FROM CTE_ST_SUB c1
LEFT JOIN CTE_Exam c2
ON c1.student_id = c2.student_id AND c1.subject_name = c2.subject_name
ORDER BY student_id, subject_name