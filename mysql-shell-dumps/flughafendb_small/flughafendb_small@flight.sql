-- MySQLShell dump 1.0.0  Distrib Ver 8.0.21 for Linux on x86_64 - for MySQL 8.0.21 (MySQL Community Server (GPL)), for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: flughafendb_small    Table: flight
-- ------------------------------------------------------
-- Server version	8.0.21

--
-- Table structure for table `flight`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `flight` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `flightno` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` smallint NOT NULL,
  `to` smallint NOT NULL,
  `departure` datetime NOT NULL,
  `arrival` datetime NOT NULL,
  `airline_id` smallint NOT NULL,
  `airplane_id` int NOT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `von_idx` (`from`),
  KEY `nach_idx` (`to`),
  KEY `abflug_idx` (`departure`),
  KEY `ankunft_idx` (`arrival`),
  KEY `fluglinie_idx` (`airline_id`),
  KEY `flugzeug_idx` (`airplane_id`),
  CONSTRAINT `flug_ibfk_1` FOREIGN KEY (`from`) REFERENCES `airport` (`airport_id`),
  CONSTRAINT `flug_ibfk_2` FOREIGN KEY (`to`) REFERENCES `airport` (`airport_id`),
  CONSTRAINT `flug_ibfk_3` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`airline_id`),
  CONSTRAINT `flug_ibfk_4` FOREIGN KEY (`airplane_id`) REFERENCES `airplane` (`airplane_id`)
) ENGINE=InnoDB AUTO_INCREMENT=503856 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;
