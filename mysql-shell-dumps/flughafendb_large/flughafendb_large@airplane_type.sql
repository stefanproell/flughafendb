-- MySQLShell dump 1.0.0  Distrib Ver 8.0.21 for Linux on x86_64 - for MySQL 8.0.21 (MySQL Community Server (GPL)), for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: flughafendb_large    Table: airplane_type
-- ------------------------------------------------------
-- Server version	8.0.21

--
-- Table structure for table `airplane_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `airplane_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`type_id`),
  FULLTEXT KEY `bezeichnung_full` (`identifier`,`description`)
) ENGINE=MyISAM AUTO_INCREMENT=343 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;
