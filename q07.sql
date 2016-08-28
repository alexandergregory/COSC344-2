--Remove children older than 11 from the volunteer school database (no longer attend).
DELETE FROM child WHERE bdate > TO_DATE('01-01-2006', 'DD-MM-YYYY');
