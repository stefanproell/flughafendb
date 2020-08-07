-- MySQL dump 10.16  Distrib 10.1.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: flughafendb_original_gross
-- ------------------------------------------------------
-- Server version	5.6.48-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `buchung`
--

DROP TABLE IF EXISTS `buchung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buchung` (
  `buchung_id` int(11) NOT NULL AUTO_INCREMENT,
  `flug_id` int(11) NOT NULL,
  `sitzplatz` char(4) DEFAULT NULL,
  `passagier_id` int(11) NOT NULL,
  `preis` decimal(10,2) NOT NULL,
  PRIMARY KEY (`buchung_id`),
  UNIQUE KEY `sitzplan_unq` (`flug_id`,`sitzplatz`),
  KEY `flug_idx` (`flug_id`),
  KEY `passagier_idx` (`passagier_id`),
  CONSTRAINT `buchung_ibfk_1` FOREIGN KEY (`flug_id`) REFERENCES `flug` (`flug_id`),
  CONSTRAINT `buchung_ibfk_2` FOREIGN KEY (`passagier_id`) REFERENCES `passagier` (`passagier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55099799 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flug`
--

DROP TABLE IF EXISTS `flug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flug` (
  `flug_id` int(11) NOT NULL AUTO_INCREMENT,
  `flugnr` char(8) NOT NULL,
  `von` smallint(6) NOT NULL,
  `nach` smallint(6) NOT NULL,
  `abflug` datetime NOT NULL,
  `ankunft` datetime NOT NULL,
  `fluglinie_id` smallint(6) NOT NULL,
  `flugzeug_id` int(11) NOT NULL,
  PRIMARY KEY (`flug_id`),
  KEY `von_idx` (`von`),
  KEY `nach_idx` (`nach`),
  KEY `abflug_idx` (`abflug`),
  KEY `ankunft_idx` (`ankunft`),
  KEY `fluglinie_idx` (`fluglinie_id`),
  KEY `flugzeug_idx` (`flugzeug_id`),
  KEY `ziel_flugzeug_idx` (`nach`,`flugzeug_id`),
  CONSTRAINT `flug_ibfk_1` FOREIGN KEY (`von`) REFERENCES `flughafen` (`flughafen_id`),
  CONSTRAINT `flug_ibfk_2` FOREIGN KEY (`nach`) REFERENCES `flughafen` (`flughafen_id`),
  CONSTRAINT `flug_ibfk_3` FOREIGN KEY (`fluglinie_id`) REFERENCES `fluglinie` (`fluglinie_id`),
  CONSTRAINT `flug_ibfk_4` FOREIGN KEY (`flugzeug_id`) REFERENCES `flugzeug` (`flugzeug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=758658 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flug_log`
--

DROP TABLE IF EXISTS `flug_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flug_log` (
  `datum` datetime NOT NULL,
  `benutzer` varchar(100) NOT NULL,
  `flug_id` int(11) NOT NULL,
  `flugnr_alt` char(8) NOT NULL,
  `flugnr_neu` char(8) NOT NULL,
  `von_alt` smallint(6) NOT NULL,
  `nach_alt` smallint(6) NOT NULL,
  `von_neu` smallint(6) NOT NULL,
  `nach_neu` smallint(6) NOT NULL,
  `abflug_alt` datetime NOT NULL,
  `ankunft_alt` datetime NOT NULL,
  `abflug_neu` datetime NOT NULL,
  `ankunft_neu` datetime NOT NULL,
  `flugzeug_id_alt` int(11) NOT NULL,
  `flugzeug_id_neu` int(11) NOT NULL,
  `fluglinie_id_alt` smallint(6) NOT NULL,
  `fluglinie_id_neu` smallint(6) NOT NULL,
  `kommentar` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flughafen`
--

DROP TABLE IF EXISTS `flughafen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flughafen` (
  `flughafen_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `iata` char(3) DEFAULT NULL,
  `icao` char(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`flughafen_id`),
  UNIQUE KEY `icao_unq` (`icao`),
  KEY `name_idx` (`name`),
  KEY `iata_idx` (`iata`)
) ENGINE=InnoDB AUTO_INCREMENT=13598 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flughafen_erreichbar`
--

DROP TABLE IF EXISTS `flughafen_erreichbar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flughafen_erreichbar` (
  `flughafen_id` int(11) NOT NULL,
  `hops` int(11) DEFAULT NULL,
  PRIMARY KEY (`flughafen_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flughafen_geo`
--

DROP TABLE IF EXISTS `flughafen_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flughafen_geo` (
  `flughafen_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `stadt` varchar(50) DEFAULT NULL,
  `land` varchar(50) DEFAULT NULL,
  `breite` decimal(11,8) NOT NULL,
  `laenge` decimal(11,8) NOT NULL,
  `geolokation` point NOT NULL,
  KEY `flughafen_idx` (`flughafen_id`),
  SPATIAL KEY `geolokation_spt` (`geolokation`),
  SPATIAL KEY `geolokation` (`geolokation`)
) ENGINE=MyISAM AUTO_INCREMENT=13598 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fluglinie`
--

DROP TABLE IF EXISTS `fluglinie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fluglinie` (
  `fluglinie_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `iata` char(2) NOT NULL,
  `firmenname` varchar(30) DEFAULT NULL,
  `heimat_flughafen` smallint(6) NOT NULL,
  PRIMARY KEY (`fluglinie_id`),
  UNIQUE KEY `iata_unq` (`iata`),
  KEY `heimat_idx` (`heimat_flughafen`),
  CONSTRAINT `fluglinie_ibfk_1` FOREIGN KEY (`heimat_flughafen`) REFERENCES `flughafen` (`flughafen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flugplan`
--

DROP TABLE IF EXISTS `flugplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flugplan` (
  `flugnr` char(8) NOT NULL,
  `von` smallint(6) NOT NULL,
  `nach` smallint(6) NOT NULL,
  `abflug` time NOT NULL,
  `ankunft` time NOT NULL,
  `fluglinie_id` smallint(6) NOT NULL,
  `montag` tinyint(1) DEFAULT '0',
  `dienstag` tinyint(1) DEFAULT '0',
  `mittwoch` tinyint(1) DEFAULT '0',
  `donnerstag` tinyint(1) DEFAULT '0',
  `freitag` tinyint(1) DEFAULT '0',
  `samstag` tinyint(1) DEFAULT '0',
  `sonntag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`flugnr`),
  KEY `von_idx` (`von`),
  KEY `nach_idx` (`nach`),
  KEY `fluglinie_idx` (`fluglinie_id`),
  CONSTRAINT `flugplan_ibfk_1` FOREIGN KEY (`von`) REFERENCES `flughafen` (`flughafen_id`),
  CONSTRAINT `flugplan_ibfk_2` FOREIGN KEY (`nach`) REFERENCES `flughafen` (`flughafen_id`),
  CONSTRAINT `flugplan_ibfk_3` FOREIGN KEY (`fluglinie_id`) REFERENCES `fluglinie` (`fluglinie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flugzeug`
--

DROP TABLE IF EXISTS `flugzeug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flugzeug` (
  `flugzeug_id` int(11) NOT NULL AUTO_INCREMENT,
  `kapazitaet` mediumint(8) unsigned NOT NULL,
  `typ_id` int(11) NOT NULL,
  `fluglinie_id` int(11) NOT NULL,
  PRIMARY KEY (`flugzeug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5584 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flugzeug_typ`
--

DROP TABLE IF EXISTS `flugzeug_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flugzeug_typ` (
  `typ_id` int(11) NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(50) DEFAULT NULL,
  `beschreibung` text,
  PRIMARY KEY (`typ_id`),
  FULLTEXT KEY `idx_fulltext` (`bezeichnung`,`beschreibung`)
) ENGINE=MyISAM AUTO_INCREMENT=343 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mitarbeiter`
--

DROP TABLE IF EXISTS `mitarbeiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mitarbeiter` (
  `mitarbeiter_id` int(11) NOT NULL AUTO_INCREMENT,
  `vorname` varchar(100) NOT NULL,
  `nachname` varchar(100) NOT NULL,
  `geburtsdatum` date NOT NULL,
  `geschlecht` char(1) DEFAULT NULL,
  `strasse` varchar(100) NOT NULL,
  `ort` varchar(100) NOT NULL,
  `plz` smallint(6) NOT NULL,
  `land` varchar(100) NOT NULL,
  `emailadresse` varchar(120) DEFAULT NULL,
  `telefonnummer` varchar(30) DEFAULT NULL,
  `gehalt` decimal(8,2) DEFAULT NULL,
  `abteilung` enum('Marketing','Buchhaltung','Management','Logistik','Flugfeld') DEFAULT NULL,
  `benutzername` varchar(20) DEFAULT NULL,
  `passwort` char(32) DEFAULT NULL,
  PRIMARY KEY (`mitarbeiter_id`),
  UNIQUE KEY `benutzer_unq` (`benutzername`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passagier`
--

DROP TABLE IF EXISTS `passagier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passagier` (
  `passagier_id` int(11) NOT NULL AUTO_INCREMENT,
  `passnummer` char(9) NOT NULL,
  `vorname` varchar(100) NOT NULL,
  `nachname` varchar(100) NOT NULL,
  PRIMARY KEY (`passagier_id`),
  UNIQUE KEY `pass_unq` (`passnummer`)
) ENGINE=InnoDB AUTO_INCREMENT=36100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passagierdetails`
--

DROP TABLE IF EXISTS `passagierdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passagierdetails` (
  `passagier_id` int(11) NOT NULL,
  `geburtsdatum` date NOT NULL,
  `geschlecht` char(1) DEFAULT NULL,
  `strasse` varchar(100) NOT NULL,
  `ort` varchar(100) NOT NULL,
  `plz` smallint(6) NOT NULL,
  `land` varchar(100) NOT NULL,
  `emailadresse` varchar(120) DEFAULT NULL,
  `telefonnummer` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`passagier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wetterdaten`
--

DROP TABLE IF EXISTS `wetterdaten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wetterdaten` (
  `datum` date NOT NULL,
  `zeit` time NOT NULL,
  `station` int(11) NOT NULL,
  `temp` decimal(3,1) NOT NULL,
  `feuchtigkeit` decimal(4,1) NOT NULL,
  `luftdruck` decimal(10,2) NOT NULL,
  `wind` decimal(5,2) NOT NULL,
  `wetter` enum('Nebel-Schneefall','Schneefall','Regen','Regen-Schneefall','Nebel-Regen','Nebel-Regen-Gewitter','Gewitter','Nebel','Regen-Gewitter') DEFAULT NULL,
  `windrichtung` smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-07  7:52:21
