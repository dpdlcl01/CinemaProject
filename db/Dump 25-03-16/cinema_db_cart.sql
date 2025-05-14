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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartIdx` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '장바구니 고유 ID',
  `userIdx` bigint(20) NOT NULL COMMENT '사용자 고유 ID',
  `productIdx` bigint(20) NOT NULL COMMENT '상품 고유 ID',
  `quantity` int(11) DEFAULT NULL COMMENT '상품 수량',
  PRIMARY KEY (`cartIdx`),
  KEY `userIdx` (`userIdx`),
  KEY `productIdx` (`productIdx`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userIdx`) REFERENCES `user` (`userIdx`) ON DELETE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`productIdx`) REFERENCES `product` (`productIdx`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='사용자별 장바구니 정보를 저장하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (14,3,2,1),(15,1,1,1),(16,1,2,1),(17,1,2,1),(18,1,1,1),(19,1,1,1),(20,1,1,1),(21,1,1,1),(22,1,1,1),(23,1,2,1),(24,1,4,1),(25,1,3,1),(26,159,2,1),(27,159,3,1),(28,159,2,2),(29,161,2,3),(30,161,3,2),(35,183,2,1),(36,236,6,1),(37,236,9,1),(38,236,9,1),(43,179,1,1),(47,191,1,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
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
