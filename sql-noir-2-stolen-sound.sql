-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

search the crime scene...
SELECT * FROM crime_scene
WHERE date = 19830715
AND location LIKE '%West Hollywood%';

results...A prized vinyl record was stolen from the store during a busy evening.

now need witness clues....
SELECT * FROM witnesses
WHERE crime_scene_id = 65;
results...list of suspects...
28	65	I saw a man wearing a red bandana rushing out of the store.
75	65	The main thing I remember is that he had a distinctive gold watch on his wrist.

time to search suspects
SELECT * FROM suspects
WHERE bandana_color = 'red'
AND accessory LIKE '%gold watch%';

3suspects...#35-Tony Ramirez, #44-Mickey Rivera, or #97-Rico Delgado

now check interviews for confession...
SELECT * FROM interviews
WHERE suspect_id IN (35, 44, 97);

results.... #97	I couldn't help it. I snapped and took the record. 

SOOOOO... THE OFFICIAL SUSPECT IS RICO DELGADO!!!!