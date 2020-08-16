-- MySQLShell dump 1.0.0  Distrib Ver 8.0.21 for Linux on x86_64 - for MySQL 8.0.21 (MySQL Community Server (GPL)), for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: flughafendb_small    Table: booking
-- ------------------------------------------------------
-- Server version	8.0.21

--
-- Table structure for table `booking`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `flight_id` int NOT NULL,
  `seat` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passenger_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `sitzplan_unq` (`flight_id`,`seat`),
  KEY `flug_idx` (`flight_id`),
  KEY `passagier_idx` (`passenger_id`),
  CONSTRAINT `buchung_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`),
  CONSTRAINT `buchung_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55099781 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;
