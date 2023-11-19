-- Fix Issue https://github.com/stefanproell/flughafendb/issues/11
UPDATE passengerdetails SET sex='f' WHERE sex='w';
UPDATE employee SET sex='f' WHERE sex='w';

-- Fix Issue https://github.com/stefanproell/flughafendb/issues/13
-- Fix base airport for Central African Rep
UPDATE airline SET base_airport =8330 WHERE airline_id =15;
-- Insert base airport for Jamaica Airlines
INSERT INTO airport (airport_id, iata, icao, name) VALUES(1418, 'I4', 'IOU', 'International Air Link');
-- Insert base airport for Puerto Rico Airlines
INSERT INTO airport (airport_id, iata, icao, name) VALUES(452, 'F4', 'WAF', 'Air Flamenco');