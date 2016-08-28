-- Retrieves the data of all the children who live in dunedin
SELECT * FROM child WHERE address LIKE '%Dunedin%';
-- Finds the name of the children who was born on the 9th of June 2005.
SELECT fname, lname FROM child WHERE bdate=TO_DATE('09-06-2005', 'DD-MM-YYYY');
--Retrieve all the ID numbers of courses which have larger than 10 students and have fees greater than $20. Group the returned courses by their id numbers.

SELECT course_id FROM course WHERE numstudents > 10 GROUP BY course_id HAVING avg(fee) > 20;
-- Finds the names of all the children who attend a robotics course.

SELECT c.cid, c.fname, c.lname
FROM  child c, attends a
WHERE c.cid = a.attends_child_id AND a.attends_course_id =
	(SELECT course_id
	 FROM course
     	 WHERE course_name='Robotics');

--Find all the children who have a special need

SELECT fname, lname
FROM child outer
WHERE EXISTS
      (SELECT *
        FROM special_need inner
        WHERE inner.child_id=outer.cid);
--How many male students are there?
SELECT COUNT(*) FROM child WHERE gender = 'M';
--Remove volunteer Jate Li as he has moved to another city
DELETE FROM volunteer WHERE vid =(140394987);
--Get the child’s name, volunteer ID who teaches & special needs name
SELECT child.lname, volunteer.vid, special_need.sn_name FROM child,volunteer,special_need WHERE child.vid = volunteer.vid AND special_need.child_id =child.cid;

