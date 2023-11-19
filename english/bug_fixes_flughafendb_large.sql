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

-- Fix Issue https://github.com/stefanproell/flughafendb/issues/5

ALTER TABLE
    weatherdata
    MODIFY COLUMN
        weather ENUM (
        'Nebel-Schneefall', 'Schneefall', 'Regen', 'Regen-Schneefall', 'Nebel-Regen', 'Nebel-Regen-Gewitter', 'Gewitter', 'Nebel', 'Regen-Gewitter',
        'fog-snowfall',
        'snowfall',
        'rain',
        'rain-snowfall',
        'fog-rain',
        'fog-rain-thunderstorm',
        'thunderstorm',
        'fog',
        'rain-thunderstorm'
        );

UPDATE weatherdata SET weather='snowfall' WHERE weather = 'Schneefall';
UPDATE weatherdata SET weather='rain-snowfall' WHERE weather = 'Regen-Schneefall';
UPDATE weatherdata SET weather='rain' WHERE weather = 'Regen';
UPDATE weatherdata SET weather='fog' WHERE weather = 'Nebel';
UPDATE weatherdata SET weather='rain-thunderstorm' WHERE weather = 'Regen-Gewitter';
UPDATE weatherdata SET weather='fog-rain' WHERE weather = 'Nebel-Regen';
UPDATE weatherdata SET weather='thunderstorm' WHERE weather = 'Gewitter';
UPDATE weatherdata SET weather='fog-snowfall' WHERE weather = 'Nebel-Schneefall';
UPDATE weatherdata SET weather='fog-rain-thunderstorm' WHERE weather = 'Nebel-Regen-Gewitter';

ALTER TABLE
    weatherdata
    MODIFY COLUMN
        weather ENUM (
        'fog-snowfall',
        'snowfall',
        'rain',
        'rain-snowfall',
        'fog-rain',
        'fog-rain-thunderstorm',
        'thunderstorm',
        'fog',
        'rain-thunderstorm'
        );
