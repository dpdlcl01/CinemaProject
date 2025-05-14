CREATE DATABASE  IF NOT EXISTS `cinema_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cinema_db`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 180.71.29.2    Database: cinema_db
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `watchedMovie`
--

DROP TABLE IF EXISTS `watchedMovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchedMovie` (
  `watchedIdx` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '관람한 영화 목록 고유 ID',
  `userIdx` bigint(20) NOT NULL COMMENT '사용자 ID',
  `movieIdx` bigint(20) NOT NULL COMMENT '영화 ID',
  `reservationIdx` bigint(20) NOT NULL COMMENT '예매 ID',
  `screenIdx` bigint(20) NOT NULL COMMENT '상영관 ID',
  `watchedDate` datetime NOT NULL COMMENT '영화 시청 날짜',
  PRIMARY KEY (`watchedIdx`),
  KEY `userIdx` (`userIdx`),
  KEY `movieIdx` (`movieIdx`),
  KEY `reservationIdx` (`reservationIdx`),
  KEY `screenIdx` (`screenIdx`),
  CONSTRAINT `watchedMovie_ibfk_1` FOREIGN KEY (`userIdx`) REFERENCES `user` (`userIdx`) ON DELETE CASCADE,
  CONSTRAINT `watchedMovie_ibfk_2` FOREIGN KEY (`movieIdx`) REFERENCES `movie` (`movieIdx`) ON DELETE CASCADE,
  CONSTRAINT `watchedMovie_ibfk_3` FOREIGN KEY (`reservationIdx`) REFERENCES `reservation` (`reservationIdx`) ON DELETE CASCADE,
  CONSTRAINT `watchedMovie_ibfk_4` FOREIGN KEY (`screenIdx`) REFERENCES `screen` (`screenIdx`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='사용자가 관람한 영화의 정보를 저장하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchedMovie`
--

LOCK TABLES `watchedMovie` WRITE;
/*!40000 ALTER TABLE `watchedMovie` DISABLE KEYS */;
INSERT INTO `watchedMovie` VALUES (41,191,2,30,3,'2025-02-17 11:30:00'),(42,191,3,31,34,'2025-02-17 11:30:00'),(43,191,206,32,15,'2025-02-17 14:00:00'),(44,191,206,33,25,'2025-02-14 14:00:00'),(45,191,206,34,5,'2025-02-17 11:30:00'),(46,161,206,35,5,'2025-02-12 09:00:00'),(47,236,198,36,3,'2025-02-16 16:30:00');
/*!40000 ALTER TABLE `watchedMovie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-16 19:51:07
