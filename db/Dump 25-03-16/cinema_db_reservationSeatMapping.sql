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
-- Table structure for table `reservationSeatMapping`
--

DROP TABLE IF EXISTS `reservationSeatMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservationSeatMapping` (
  `reservationSeatIdx` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '매핑 고유 ID',
  `reservationIdx` bigint(20) NOT NULL COMMENT '예매 ID',
  `priceIdx` bigint(20) NOT NULL COMMENT '가격 설정 고유 ID',
  `seatStatusIdx` bigint(20) NOT NULL,
  PRIMARY KEY (`reservationSeatIdx`),
  KEY `reservationIdx` (`reservationIdx`),
  KEY `priceIdx` (`priceIdx`),
  CONSTRAINT `reservationSeatMapping_ibfk_1` FOREIGN KEY (`reservationIdx`) REFERENCES `reservation` (`reservationIdx`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='예매-좌석 매핑 정보를 저장하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationSeatMapping`
--

LOCK TABLES `reservationSeatMapping` WRITE;
/*!40000 ALTER TABLE `reservationSeatMapping` DISABLE KEYS */;
INSERT INTO `reservationSeatMapping` VALUES (138,30,18,365),(139,30,18,366),(140,30,22,367),(141,31,30,368),(142,31,30,369),(143,32,34,370),(144,32,34,371),(145,32,38,372),(146,33,34,373),(147,33,34,374),(148,33,38,375),(149,33,38,376),(150,34,34,377),(151,34,34,378),(152,34,38,379),(153,35,33,381),(154,35,33,382),(155,36,20,383),(156,36,24,384);
/*!40000 ALTER TABLE `reservationSeatMapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-16 19:51:08
