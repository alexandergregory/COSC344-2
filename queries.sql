-- Retrieves the data of all the children who live in dunedin
SELECT * FROM child WHERE address LIKE '%Dunedin';
-- Finds the name of the children who was born on the 9th of June 2005.
SELECT fname, lname FROM child WHERE bdate=TO_DATE('09-06-2005', 'DD-MM-YYYY');
--Retrieve all the ID numbers of courses which have larger than 10 students. Then group the returned courses by their id numbers and select only those courses with a fee greater than $20. 

SELECT course_id FROM course WHERE numstudents > 10 GROUP BY course_id HAVING avg(fee) > 20;
-- Find the names of all children who attend the same course.

SELECT c.cid, c.fname, c.lname
FROM  child c, attends a
WHERE c.cid = a.attends_child_id AND a.attends_course_id =
	(SELECT course_id
	 FROM course
     	 WHERE course_name='Robotics');

--Find all the children who have a special need

--How many male students are there?
SELECT COUNT(*) FROM child WHERE gender = 'M';
--Remove children younger than 12 from the volunteer school database (no longer attend).
DELETE FROM child WHERE bdate > TO_DATE('01-01-2006', 'DD-MM-YYYY');
--Get the child’s name, volunteer ID who teaches & special needs name
SELECT child.lname, volunteer.vid, special_need.sn_name FROM child,volunteer,special_need WHERE child.vid = volunteer.vid AND special_need.child_id =child.cid;

