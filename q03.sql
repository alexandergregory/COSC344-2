--Retrieve all the ID numbers of courses which have less than 10 students. Then group the returned courses by their id numbers and select only those courses with a fee greater than $20. 

SELECT course_id FROM course WHERE numstudents < 10 GROUP BY course_id HAVING avg(fee) > 20;
