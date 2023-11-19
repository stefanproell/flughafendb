-- Fix Issue https://github.com/stefanproell/flughafendb/issues/13
-- Fix base airport for Central African Rep
UPDATE fluglinie SET heimat_flughafen =8330 WHERE fluglinie_id =15;
-- Insert base airport for Jamaica Airlines
INSERT INTO flughafen (flughafen_id, iata, icao, name) VALUES(1418, 'I4', 'IOU', 'International Air Link');
-- Insert base airport for Puerto Rico Airlines
INSERT INTO flughafen (flughafen_id, iata, icao, name) VALUES(452, 'F4', 'WAF', 'Air Flamenco');

