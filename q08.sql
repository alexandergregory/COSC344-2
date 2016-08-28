--Get the child’s name, volunteer ID who teaches & special needs name
SELECT child.lname, volunteer.vid, special_need.sn_name FROM child,volunteer,special_need WHERE child.vid = volunteer.vid AND special_need.child_id =child.cid;

