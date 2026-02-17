-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

checked all crime scenes...
SELECT * FROM crime_scene;

find the crime at the Blue Note Lounge..
SELECT * FROM crime_scene
WHERE location = 'Blue Note Lounge';

A briefcase containing sensitive documents vanished.
 A witness reported a man in a trench coat with a scar on his left cheek fleeing the scene.

 find suspect matching decription....
 SELECT * FROM suspects
WHERE attire Like '%trench%'
AND scar LIKE '%left cheek%';
suspects= Frankie Lombardi and Vincent Malone

need more info...verify interviews...
check Frankie Lombardi interview..
SELECT * FROM interviews
WHERE suspect_id = 3;
came back NULL>>

check Vincent Malone interview
SELECT * FROM interviews
WHERE suspect_id = 183;
came back.... I wasn’t going to steal it, but I did.

SUSPECTS IS Vincent Malone!!!!!