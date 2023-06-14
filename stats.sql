-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: stats
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE stats IF NOT EXISTS;

--
-- Table structure for table `athletes`
--

DROP TABLE IF EXISTS `athletes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `athletes` (
  `championships` int DEFAULT NULL,
  `country` varchar(60) NOT NULL,
  `gender` varchar(60) NOT NULL,
  `salary` varchar(60) DEFAULT NULL,
  `sport_id` varchar(60) NOT NULL,
  `team_id` varchar(60) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `genesis` date NOT NULL,
  `id` varchar(60) NOT NULL,
  `name` varchar(120) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sport_id` (`sport_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `athletes_ibfk_1` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`id`),
  CONSTRAINT `athletes_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athletes`
--

LOCK TABLES `athletes` WRITE;
/*!40000 ALTER TABLE `athletes` DISABLE KEYS */;
INSERT INTO `athletes` VALUES (0,'Spain','Male','$8M','69b67839-4f86-40d0-a513-e56205b52563','b345f5c3-d103-4c03-9a67-640ce9d66bf5','F1Driver','2023-06-11 22:26:03','1994-09-01','0afbc4b8-457e-4e30-9dac-f27bb79a62f7','Carlos Sainz','2023-06-11 22:26:03'),(2,'Netherlands','Male','$60M','69b67839-4f86-40d0-a513-e56205b52563','3cfc227b-c61f-48ef-9fc6-15ee22502d18','F1Driver','2023-06-05 23:07:41','1997-09-30','3cfc227b-c61f-48ef-9fc6-15ee22502d18','Max Verstappen','2023-06-05 23:07:41'),(7,'Britain','Male','$55M','69b67839-4f86-40d0-a513-e56205b52563','69b67839-4f86-40d0-a513-e56205b52563','F1Driver','2023-06-05 12:11:36','1985-01-07','69b67839-4f86-40d0-a513-e56205b52563','Lewis Hamilton','2023-06-05 12:11:36'),(2,'Spain','Male','$20M','69b67839-4f86-40d0-a513-e56205b52563','4716b244-64f7-4c2d-ab1c-2636b3922f69','F1Driver','2023-06-11 22:53:48','1981-07-29','886e4c59-f50e-43db-9b59-d748131be041','Fernando Alonso','2023-06-11 22:53:48'),(0,'Mexico','Male','$10M','69b67839-4f86-40d0-a513-e56205b52563','3cfc227b-c61f-48ef-9fc6-15ee22502d18','F1Driver','2023-06-08 12:53:31','1990-01-26','8edc6186-5d37-4e13-8d37-bf40ce071368','Sergio Perez','2023-06-08 12:53:31'),(0,'Australia','Male','$22M','69b67839-4f86-40d0-a513-e56205b52563','3cfc227b-c61f-48ef-9fc6-15ee22502d18','F1Driver','2023-06-08 14:27:29','1989-07-01','ab4fc363-ff4b-4715-9577-800597bfb60b','Daniel Ricciardo','2023-06-08 14:27:29'),(0,'Monaco','Male','$10M','69b67839-4f86-40d0-a513-e56205b52563','b345f5c3-d103-4c03-9a67-640ce9d66bf5','F1Driver','2023-06-11 22:11:58','1997-10-16','b345f5c3-d103-4c03-9a67-640ce9d66bf5','Charles Leclerc','2023-06-11 22:11:58'),(0,'Britain','Male','$6M','69b67839-4f86-40d0-a513-e56205b52563','69b67839-4f86-40d0-a513-e56205b52563','F1Driver','2023-06-08 12:33:32','1998-02-15','bfcb19a6-be21-4140-8731-bbebf0968dbd','George Russel','2023-06-08 12:33:32'),(0,'Germany','Male','$1M','69b67839-4f86-40d0-a513-e56205b52563','69b67839-4f86-40d0-a513-e56205b52563','F1Driver','2023-06-08 14:26:13','1999-03-22','d99db81b-c860-430e-abb4-e0b7a0cd094d','Mick Schumacher','2023-06-08 14:26:13'),(0,'Canada','Male','$2M','69b67839-4f86-40d0-a513-e56205b52563','4716b244-64f7-4c2d-ab1c-2636b3922f69','F1Driver','2023-06-11 22:58:31','1998-10-29','e15162ef-46fc-4322-a8cf-005ef8678f6f','Lance Stroll','2023-06-11 22:58:31');
/*!40000 ALTER TABLE `athletes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f1_drivers`
--

DROP TABLE IF EXISTS `f1_drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `f1_drivers` (
  `id` varchar(60) NOT NULL,
  `podiums` int DEFAULT NULL,
  `poles` int DEFAULT NULL,
  `race_entries` int DEFAULT NULL,
  `races_won` int DEFAULT NULL,
  `racing_number` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `f1_drivers_ibfk_1` FOREIGN KEY (`id`) REFERENCES `athletes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f1_drivers`
--

LOCK TABLES `f1_drivers` WRITE;
/*!40000 ALTER TABLE `f1_drivers` DISABLE KEYS */;
INSERT INTO `f1_drivers` VALUES ('0afbc4b8-457e-4e30-9dac-f27bb79a62f7',15,3,170,1,55),('3cfc227b-c61f-48ef-9fc6-15ee22502d18',84,24,170,40,33),('69b67839-4f86-40d0-a513-e56205b52563',193,103,317,103,44),('886e4c59-f50e-43db-9b59-d748131be041',103,22,365,32,14),('8edc6186-5d37-4e13-8d37-bf40ce071368',30,3,246,6,11),('ab4fc363-ff4b-4715-9577-800597bfb60b',32,3,232,8,3),('b345f5c3-d103-4c03-9a67-640ce9d66bf5',25,19,110,5,16),('bfcb19a6-be21-4140-8731-bbebf0968dbd',10,1,89,1,63),('d99db81b-c860-430e-abb4-e0b7a0cd094d',0,0,44,0,47),('e15162ef-46fc-4322-a8cf-005ef8678f6f',3,0,130,0,18);
/*!40000 ALTER TABLE `f1_drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports` (
  `created_at` datetime NOT NULL,
  `genesis` date NOT NULL,
  `id` varchar(60) NOT NULL,
  `name` varchar(120) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports`
--

LOCK TABLES `sports` WRITE;
/*!40000 ALTER TABLE `sports` DISABLE KEYS */;
INSERT INTO `sports` VALUES ('2023-06-05 12:11:36','1950-05-13','69b67839-4f86-40d0-a513-e56205b52563','Formula 1','2023-06-05 12:11:36'),('2023-06-07 19:21:51','1863-10-26','fca2993b-3e27-4cc7-9ffe-d0ba80c1571a','Football','2023-06-07 19:21:51');
/*!40000 ALTER TABLE `sports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `championships` int DEFAULT NULL,
  `country` varchar(60) NOT NULL,
  `sport_id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `genesis` date NOT NULL,
  `id` varchar(60) NOT NULL,
  `name` varchar(120) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sport_id` (`sport_id`),
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (8,'Britain','69b67839-4f86-40d0-a513-e56205b52563','2023-06-11 22:26:03','1963-09-02','0afbc4b8-457e-4e30-9dac-f27bb79a62f7','McLaren','2023-06-11 22:26:03'),(5,'Austria','69b67839-4f86-40d0-a513-e56205b52563','2023-06-05 23:07:41','2004-02-06','3cfc227b-c61f-48ef-9fc6-15ee22502d18','Oracle Red Bull Racing','2023-06-05 23:07:41'),(0,'Britain','69b67839-4f86-40d0-a513-e56205b52563','2023-06-11 22:49:37','2021-01-01','4716b244-64f7-4c2d-ab1c-2636b3922f69','Aston Martin Aramco','2023-06-11 22:49:37'),(8,'Germany','69b67839-4f86-40d0-a513-e56205b52563','2023-06-05 12:11:36','2009-12-08','69b67839-4f86-40d0-a513-e56205b52563','Mercedes-AMG Petronas','2023-06-05 12:11:36'),(16,'Italy','69b67839-4f86-40d0-a513-e56205b52563','2023-06-11 22:11:58','1950-05-22','b345f5c3-d103-4c03-9a67-640ce9d66bf5','Scuderia Ferrari','2023-06-11 22:11:58');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14 19:20:12
