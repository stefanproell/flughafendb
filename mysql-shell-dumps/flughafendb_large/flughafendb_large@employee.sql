-- MySQLShell dump 1.0.0  Distrib Ver 8.0.21 for Linux on x86_64 - for MySQL 8.0.21 (MySQL Community Server (GPL)), for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: flughafendb_large    Table: employee
-- ------------------------------------------------------
-- Server version	8.0.21

--
-- Table structure for table `employee`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `sex` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` smallint NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailaddress` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephoneno` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `department` enum('Marketing','Buchhaltung','Management','Logistik','Flugfeld') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `benutzer_unq` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;
