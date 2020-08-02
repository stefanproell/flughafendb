-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 22. Nov 2011 um 12:06
-- Server Version: 5.5.16
-- PHP-Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `AirportDB`
--
drop database `AirportDB`;
CREATE DATABASE `AirportDB` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `AirportDB`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `flight_id` int(11) NOT NULL,
  `seat` char(4) DEFAULT NULL,
  `passenger_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `sitzplan_unq` (`flight_id`,`seat`),
  KEY `flug_idx` (`flight_id`),
  KEY `passagier_idx` (`passenger_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flight`
--

CREATE TABLE IF NOT EXISTS `flight` (
  `flight_id` int(11) NOT NULL AUTO_INCREMENT,
  `flightno` char(8) NOT NULL,
  `from` smallint(6) NOT NULL,
  `to` smallint(6) NOT NULL,
  `departure` datetime NOT NULL,
  `arrival` datetime NOT NULL,
  `airline_id` smallint(6) NOT NULL,
  `airplane_id` int(11) NOT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `von_idx` (`from`),
  KEY `nach_idx` (`to`),
  KEY `abflug_idx` (`departure`),
  KEY `ankunft_idx` (`arrival`),
  KEY `fluglinie_idx` (`airline_id`),
  KEY `flugzeug_idx` (`airplane_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flight_log`
--

CREATE TABLE IF NOT EXISTS `flight_log` (
  `log_date` datetime NOT NULL,
  `user` varchar(100) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `flightno_old` char(8) NOT NULL,
  `flightno_new` char(8) NOT NULL,
  `from_old` smallint(6) NOT NULL,
  `to_old` smallint(6) NOT NULL,
  `from_new` smallint(6) NOT NULL,
  `to_new` smallint(6) NOT NULL,
  `departure_old` datetime NOT NULL,
  `arrival_old` datetime NOT NULL,
  `departure_new` datetime NOT NULL,
  `arrival_new` datetime NOT NULL,
  `airplane_id_old` int(11) NOT NULL,
  `airplane_id_new` int(11) NOT NULL,
  `airline_id_old` smallint(6) NOT NULL,
  `airline_id_new` smallint(6) NOT NULL,
  `comment` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airport`
--

CREATE TABLE IF NOT EXISTS `airport` (
  `airport_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `iata` char(3) DEFAULT NULL,
  `icao` char(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`airport_id`),
  UNIQUE KEY `icao_unq` (`icao`),
  KEY `name_idx` (`name`),
  KEY `iata_idx` (`iata`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airport_geo`
--

CREATE TABLE IF NOT EXISTS `airport_geo` (
  `airport_id` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` decimal(11,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `geolocation` point NOT NULL,
  KEY `flughafen_idx` (`airport_id`),
  SPATIAL KEY `geolokation_spt` (`geolocation`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airline`
--

CREATE TABLE IF NOT EXISTS `airline` (
  `airline_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `iata` char(2) NOT NULL,
  `airlinename` varchar(30) DEFAULT NULL,
  `base_airport` smallint(6) NOT NULL,
  PRIMARY KEY (`airline_id`),
  UNIQUE KEY `iata_unq` (`iata`),
  KEY `heimat_idx` (`base_airport`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flightschedule`
--

CREATE TABLE IF NOT EXISTS `flightschedule` (
  `flightno` char(8) NOT NULL,
  `from` smallint(6) NOT NULL,
  `to` smallint(6) NOT NULL,
  `departure` time NOT NULL,
  `arrival` time NOT NULL,
  `airline_id` smallint(6) NOT NULL,
  `monday` tinyint(1) DEFAULT '0',
  `tuesday` tinyint(1) DEFAULT '0',
  `wednesday` tinyint(1) DEFAULT '0',
  `thursday` tinyint(1) DEFAULT '0',
  `friday` tinyint(1) DEFAULT '0',
  `saturday` tinyint(1) DEFAULT '0',
  `sunday` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`flightno`),
  KEY `von_idx` (`from`),
  KEY `nach_idx` (`to`),
  KEY `fluglinie_idx` (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airplane`
--

CREATE TABLE IF NOT EXISTS `airplane` (
  `airplane_id` int(11) NOT NULL AUTO_INCREMENT,
  `capacity` mediumint(8) unsigned NOT NULL,
  `type_id` int(11) NOT NULL,
  `airline_id` int(11) NOT NULL,
  PRIMARY KEY (`airplane_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airplane_type`
--

CREATE TABLE IF NOT EXISTS `airplane_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`type_id`),
  FULLTEXT KEY `bezeichnung_full` (`identifier`,`description`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` smallint(6) NOT NULL,
  `country` varchar(100) NOT NULL,
  `emailaddress` varchar(120) DEFAULT NULL,
  `telephoneno` varchar(30) DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `department` enum('Marketing','Buchhaltung','Management','Logistik','Flugfeld') DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `benutzer_unq` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `passenger`
--

CREATE TABLE IF NOT EXISTS `passenger` (
  `passenger_id` int(11) NOT NULL AUTO_INCREMENT,
  `passportno` char(9) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  PRIMARY KEY (`passenger_id`),
  UNIQUE KEY `pass_unq` (`passportno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `passengerdetails`
--

CREATE TABLE IF NOT EXISTS `passengerdetails` (
  `passenger_id` int(11) NOT NULL,
  `birthdate` date NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` smallint(6) NOT NULL,
  `country` varchar(100) NOT NULL,
  `emailaddress` varchar(120) DEFAULT NULL,
  `telephoneno` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `weatherdata`
--

CREATE TABLE IF NOT EXISTS `weatherdata` (
  `log_date` date NOT NULL,
  `time` time NOT NULL,
  `station` int(11) NOT NULL,
  `temp` decimal(3,1) NOT NULL,
  `humidity` decimal(4,1) NOT NULL,
  `airpressure` decimal(10,2) NOT NULL,
  `wind` decimal(5,2) NOT NULL,
  `weather`  ENUM('Nebel-Schneefall','Schneefall','Regen','Regen-Schneefall','Nebel-Regen','Nebel-Regen-Gewitter','Gewitter','Nebel','Regen-Gewitter') DEFAULT NULL,
  `winddirection` smallint(6) NOT NULL,
  PRIMARY KEY (`log_date`,`time`,`station`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;




--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `buchung_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`),
  ADD CONSTRAINT `buchung_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`);

--
-- Constraints der Tabelle `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flug_ibfk_4` FOREIGN KEY (`airplane_id`) REFERENCES `airplane` (`airplane_id`),
  ADD CONSTRAINT `flug_ibfk_1` FOREIGN KEY (`from`) REFERENCES `airport` (`airport_id`),
  ADD CONSTRAINT `flug_ibfk_2` FOREIGN KEY (`to`) REFERENCES `airport` (`airport_id`),
  ADD CONSTRAINT `flug_ibfk_3` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`airline_id`);

--
-- Constraints der Tabelle `airline`
--
ALTER TABLE `airline`
  ADD CONSTRAINT `fluglinie_ibfk_1` FOREIGN KEY (`base_airport`) REFERENCES `airport` (`airport_id`);

--
-- Constraints der Tabelle `flightschedule`
--
ALTER TABLE `flightschedule`
  ADD CONSTRAINT `flugplan_ibfk_3` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`airline_id`),
  ADD CONSTRAINT `flugplan_ibfk_1` FOREIGN KEY (`from`) REFERENCES `airport` (`airport_id`),
  ADD CONSTRAINT `flugplan_ibfk_2` FOREIGN KEY (`to`) REFERENCES `airport` (`airport_id`);

--
-- Constraints der Tabelle `passengerdetails`
--
ALTER TABLE `passengerdetails`
  ADD CONSTRAINT `passagierdetails_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`) ON DELETE CASCADE;

SET FOREIGN_KEY_CHECKS = 0;
insert ignore into AirportDB.airport (select * from FlughafenDB.flughafen);
insert ignore into AirportDB.airport_geo (select * from FlughafenDB.flughafen_geo);
insert ignore into AirportDB.airline (select * from FlughafenDB.fluglinie);
insert ignore into AirportDB.flightschedule (select * from FlughafenDB.flugplan);

insert ignore into AirportDB.airplane_type (select * from FlughafenDB.flugzeug_typ);
insert ignore into AirportDB.airplane (select * from FlughafenDB.flugzeug);
insert ignore into AirportDB.flight (select * from FlughafenDB.flug);
insert ignore into AirportDB.booking (select * from FlughafenDB.buchung);

insert ignore into AirportDB.employee (select * from FlughafenDB.mitarbeiter);
insert ignore into AirportDB.passenger (select * from FlughafenDB.passagier);
insert ignore into AirportDB.passengerdetails (select * from FlughafenDB.passagierdetails);
insert ignore into AirportDB.weatherdata (select * from FlughafenDB.wetterdaten);
SET FOREIGN_KEY_CHECKS = 1;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;