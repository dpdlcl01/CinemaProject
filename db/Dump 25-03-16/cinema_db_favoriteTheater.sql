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
-- Table structure for table `favoriteTheater`
--

DROP TABLE IF EXISTS `favoriteTheater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoriteTheater` (
  `favoriteTheaterIdx` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '선호 극장 고유 ID',
  `userIdx` bigint(20) NOT NULL COMMENT '사용자 고유 ID',
  `theaterIdx` bigint(20) NOT NULL COMMENT '극장 고유 ID',
  PRIMARY KEY (`favoriteTheaterIdx`),
  KEY `userIdx` (`userIdx`),
  KEY `theaterIdx` (`theaterIdx`),
  CONSTRAINT `favoriteTheater_ibfk_1` FOREIGN KEY (`userIdx`) REFERENCES `user` (`userIdx`) ON DELETE CASCADE,
  CONSTRAINT `favoriteTheater_ibfk_2` FOREIGN KEY (`theaterIdx`) REFERENCES `theater` (`theaterIdx`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='사용자의 선호 극장 목록을 저장하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoriteTheater`
--

LOCK TABLES `favoriteTheater` WRITE;
/*!40000 ALTER TABLE `favoriteTheater` DISABLE KEYS */;
INSERT INTO `favoriteTheater` VALUES (3,2,3),(4,2,4),(5,3,1),(6,3,5),(7,4,6),(8,4,7),(9,5,1),(10,5,3),(11,6,2),(12,6,4),(13,7,5),(14,7,6),(42,1,1),(43,1,13),(44,1,2),(45,161,1),(48,159,1),(49,179,1),(52,191,5),(53,191,11),(54,191,1);
/*!40000 ALTER TABLE `favoriteTheater` ENABLE KEYS */;
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
