-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?
first gonna search the crime scene...

SELECT * FROM crime_scene
WHERE date = 19860814
AND location LIKE '%Coral Bay Marina%';
gonna give the scene id and description...
-The body of an unidentified man was found near the docks. 
Two people were seen nearby: one who lives on 300ish "Ocean Drive" 
and another whose first name ends with "ul" and his last name ends with "ez".

now need to find the 2 suspects...

find the one on 300ish ocean drive..
SELECT * FROM person
WHERE address Like '3__%Ocean Drive%';

find the person whose name ends with ul and last name ez...
SELECT * FROM person
WHERE name LIKE '%ul %ez';

sooo Suspect #1 is Carlos Mendez... his adrress is in the 300's
Suspect # 2 is Raul Gutierrez...1st name ends in ul and last ends ez...

NOW need to check the interviews...
SELECT * FROM interviews
JOIN person
ON interviews.person_id = person.id
WHERE person.name IN ('Carlos Mendez', 'Raul Gutierrez');

after interviews, might be someone else....

now check hotel check ins on aug 13...
SELECT person.name, hotel_checkins.hotel_name, hotel_checkins.check_in_date
FROM hotel_checkins
JOIN person
ON hotel_checkins.person_id = person.id
WHERE hotel_checkins.hotel_name LIKE '%Sunset%'
AND hotel_checkins.check_in_date = 19860813;

now check surveillance records...
SELECT person.name, hotel_checkins.hotel_name, surveillance_records.suspicious_activity
FROM surveillance_records
JOIN hotel_checkins
ON surveillance_records.hotel_checkin_id = hotel_checkins.id
JOIN person
ON surveillance_records.person_id = person.id
WHERE hotel_checkins.hotel_name LIKE '%Sunset%'
And hotel_checkins.check_in_date = 19860813;

after all the evidence, clues and interviews.... 
SUNSET HOTEL
AUG 13
Suspicious behavior.. left suddenly at 3am...
THOMAS BROWN is the suspect!!
CASE CLOSED!!!