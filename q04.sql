-- Finds the names of all the children who attend a robotics course.

SELECT c.cid, c.fname, c.lname
FROM  child c, attends a
WHERE c.cid = a.attends_child_id AND a.attends_course_id =
	(SELECT course_id
	 FROM course
     	 WHERE course_name='Robotics');

