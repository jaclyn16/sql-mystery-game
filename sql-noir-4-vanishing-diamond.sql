-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

First check the crime scene...
SELECT * FROM crime_scene;

narrow down the crime scene..
SELECT * FROM crime_scene
WHERE location LIKE '%Fontainebleau%';
description....
The Heart of Atlantis necklace disappeared. 
Many guests were questioned but only two of them gave valuable clues.
 One of them is a really famous actor.
  The other one is a woman who works as a consultant for a big company and her first name ends with "an".

find famous actor..
SELECT * FROM guest
WHERE occupation LIKE '%actor%';
looking for REALLY famous actor...
43- Ruby Baker	
129- Clint Eastwood	
164- River Bowers	
189- Sage Dillon	
192- Phoenix Pitts
"Clint Eastwood"

get his witness statement...
SELECT guest.name, witness_statements.clue
FROM guest 
JOIN witness_statements 
ON guest.id = witness_statements.guest_id
WHERE guest.name = 'Clint Eastwood';
clue... 	I overheard someone say, "Meet me at the marina, dock 3.

now check marina rentals...
SELECT * FROM marina_rentals
WHERE dock_number = 3
AND rental_date = 19870520;

join marina rentals with a guest...
SELECT guest.id, guest.name, guest.occupation, marina_rentals.boat_name
FROM marina_rentals 
JOIN guest 
ON marina_rentals.renter_guest_id = guest.id
WHERE marina_rentals.dock_number = 3
AND marina_rentals.rental_date = 19870520;

2nd said a first name that ends in "an" and a consultant, soo..
looking for a 1st names that ends in "an" and a consultant..
SELECT * FROM guest
WHERE occupation Like '%Consultant%'
AND name LIKE '%an%';

116	Vivian Nair....
now need to check to see was at the dock
SELECT guest.name, marina_rentals.dock_number, marina_rentals.rental_date, marina_rentals.boat_name
FROM guest 
JOIN marina_rentals 
ON guest.id = marina_rentals.renter_guest_id
WHERE guest.name = 'Vivian Nair';

nothing found..

back to actor clue... see which actor gave a clue...
only show clint eastwood so going back to list of rentles for dock 3 for that date 

SELECT guest.name, guest.occupation
FROM guest 
JOIN marina_rentals m
ON guest.id = marins-rentals.renter_guest_id
WHERE marina-rentals.dock_number = 3
AND marina-rentals.rental_date = 19870520;

OK now this is getting tricky... after all clues, a famous actor and 1st name ends
with a an...the actor clue was just a witness and thief might be the consultant..
ran the info but the VIVIAN NAIR who is a consultant didt rent a boat(under her name)
so maybe some one else rented it???  a person rented one an apperears
multiple times..PHOENIX MASON, 3 times???

this might be a setup... Vivian planned it and Phoenix handled the boat

run final interview..
SELECT * FROM final_interviews;

#97... I ordered the hit. it was me you caught me
-105 I was the one who took the crystsl, i guess i need a lawyer now?

WELLLLLL the case is called vanishing daiamond soooo 105 is very speciefic..

find who 105 belongs too...
SELECT guest.name, guest.occupation, final_interviews.confession
FROM guest 
JOIN final_interviews 
ON guest.id = final_interviews.guest_id;

THE SUSPECT IS MIKE MANNING!!!! CASE SOLVED...

