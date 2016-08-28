--Find all the children who have a special need

SELECT fname, lname
FROM child outer
WHERE EXISTS
      (SELECT *
        FROM special_need inner
        WHERE inner.child_id=outer.cid);
