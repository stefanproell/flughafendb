-- MySQLShell dump 1.0.0  Distrib Ver 8.0.21 for Linux on x86_64 - for MySQL 8.0.21 (MySQL Community Server (GPL)), for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: flughafendb_small    Table: flightschedule
-- ------------------------------------------------------
-- Server version	8.0.21

--
-- Table structure for table `flightschedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `flightschedule` (
  `flightno` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` smallint NOT NULL,
  `to` smallint NOT NULL,
  `departure` time NOT NULL,
  `arrival` time NOT NULL,
  `airline_id` smallint NOT NULL,
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
  KEY `fluglinie_idx` (`airline_id`),
  CONSTRAINT `flugplan_ibfk_1` FOREIGN KEY (`from`) REFERENCES `airport` (`airport_id`),
  CONSTRAINT `flugplan_ibfk_2` FOREIGN KEY (`to`) REFERENCES `airport` (`airport_id`),
  CONSTRAINT `flugplan_ibfk_3` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;
