-- Record your SQL detective process here!  Write down: 
--   1. The SQL queries you ran
--   2. Any notes or insights as SQL comments
--   3. Your final conclusion: who did it?

-- Using these SQL clauses will help you solve the mystery: 
--    SELECT, FROM, WHERE, AND, OR, ORDER BY, LIMIT, LIKE, DISTINCT, BETWEEN, AS

-- writing a comment like this

-- selecting all columns to find the crime scene report
SELECT * FROM crime_scene_report;

SELECT * FROM crime_scene_report WHERE date = '20180115';

SELECT * FROM crime_scene_report WHERE date = '20180115'
AND city = 'SQL City';

SELECT * FROM crime_scene_report WHERE date = '20180115'
AND city = 'SQL City'
AND type = 'murder';

-- find witness....
SELECT * FROM person;

SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC;

-- Found 1st witness... Morty Schapiro...

-- find Mortys interview to help find a suspect or a 2nd witness,,
SELECT * FROM interview
WHERE person_id = 14887;

-- using the lead info...lead to a main suspect... finding info on a get fit now member..
-- membership number starts with 48Z and 
-- clue only gold members have a bag...
SELECT * FROM get_fit_now_member
WHERE id LIKE '48Z%';
-- suspects left.. Joe Germuska and Jeremy Bowers
-- need to check license info cause plate contained H42W..

-- running plate info..
SELECT * FROM drivers_license
WHERE id IN (
  SELECT license_id
  FROM person
  WHERE id IN (28819, 67318)
  );

--   this lead to main suspect...Killer now identified..
-- Jeremy BOwers is the killer..
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;
--YAAAY found the Killer!! 
