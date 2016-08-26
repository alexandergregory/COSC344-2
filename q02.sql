-- Finds the name of the children who was born on the 9th of June 2005.
SELECT fname, lname FROM child WHERE bdate=TO_DATE('09-06-2005', 'DD-MM-YYYY');
