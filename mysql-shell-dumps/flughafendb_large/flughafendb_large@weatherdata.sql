-- MySQLShell dump 1.0.0  Distrib Ver 8.0.21 for Linux on x86_64 - for MySQL 8.0.21 (MySQL Community Server (GPL)), for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: flughafendb_large    Table: weatherdata
-- ------------------------------------------------------
-- Server version	8.0.21

--
-- Table structure for table `weatherdata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `weatherdata` (
  `log_date` date NOT NULL,
  `time` time NOT NULL,
  `station` int NOT NULL,
  `temp` decimal(3,1) NOT NULL,
  `humidity` decimal(4,1) NOT NULL,
  `airpressure` decimal(10,2) NOT NULL,
  `wind` decimal(5,2) NOT NULL,
  `weather` enum('Nebel-Schneefall','Schneefall','Regen','Regen-Schneefall','Nebel-Regen','Nebel-Regen-Gewitter','Gewitter','Nebel','Regen-Gewitter') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `winddirection` smallint NOT NULL,
  PRIMARY KEY (`log_date`,`time`,`station`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;
