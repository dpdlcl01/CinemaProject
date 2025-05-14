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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminIdx` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '관리자 고유 ID',
  `adminId` varchar(20) NOT NULL COMMENT '관리자 로그인 ID',
  `adminPassword` varchar(50) NOT NULL COMMENT '관리자 비밀번호',
  `adminLevel` varchar(20) NOT NULL COMMENT '관리자 등급 (SUPER, MANAGER)',
  `adminStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '관리자 상태 (0: 활성, 1: 삭제)',
  PRIMARY KEY (`adminIdx`),
  UNIQUE KEY `adminId` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='관리자 정보를 저장하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'superadmin','super','SUPER',0),(2,'manager111','manager_secure_password1','MANAGER',0),(3,'manager','manager_secure_password2','MANAGER',0),(4,'manager3','manager_secure_password3','MANAGER',0),(5,'manager4','manager_secure_password4','MANAGER',0),(6,'manager5','manager_secure_password5','MANAGER',0),(7,'inactive_manager','inactive_password','MANAGER',1),(8,'manager123','12341234','MANAGER',0),(9,'manager123456','12341234','MANAGER',0),(10,'manager999','12341234','MANAGER',0),(11,'manager888','12341234','MANAGER',0),(12,'manager777','12341234','MANAGER',0),(13,'manager000','manager000','MANAGER',0);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-16 19:51:06
