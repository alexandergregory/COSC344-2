--Retrieve all the ID numbers of courses which have larger than 10 students and have fees greater than $20. Group the returned courses by their id numbers.

SELECT course_id FROM course WHERE numstudents > 10 GROUP BY course_id HAVING avg(fee) > 20;
