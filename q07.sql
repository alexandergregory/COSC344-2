--Remove children older than 12 from the volunteer school database (no longer attend).
DELETE FROM child WHERE bdate < TO_DATE('01-01-2004', 'DD-MM-YYYY');
