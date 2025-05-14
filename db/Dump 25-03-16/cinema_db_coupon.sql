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
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `couponIdx` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '쿠폰 고유 ID',
  `couponName` varchar(50) NOT NULL COMMENT '쿠폰 이름',
  `couponCategory` tinyint(1) DEFAULT NULL,
  `couponInfo` text COMMENT '쿠폰 설명',
  `couponType` tinyint(1) NOT NULL COMMENT '할인 유형 (1: 금액, 2: 추가 제공)',
  `couponValue` int(11) DEFAULT NULL COMMENT '할인 값 (금액일 경우 할인 금액, 추가 제공일 경우 NULL)',
  `couponRegDate` datetime DEFAULT NULL COMMENT '쿠폰 사용 시작일',
  `couponExpDate` datetime DEFAULT NULL COMMENT '쿠폰 만료일',
  `couponStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '쿠폰 상태 (0: 활성, 1: 만료)',
  PRIMARY KEY (`couponIdx`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='쿠폰 정보를 저장하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,'신규 가입 첫 영화 할인',NULL,'가입 후 1개월 동안 사용 가능한 8000원 할인 쿠폰',1,8000,'2025-01-01 00:00:00','2025-01-31 23:59:59',0),(2,'선착순 빵원티켓',NULL,'공지사항 이벤트 버튼 클릭 시 제공, 영화 예매 무료 쿠폰',1,0,'2025-01-15 00:00:00','2025-01-20 23:59:59',1),(4,'영화 4000원 할인 쿠폰',NULL,'모든 영화 예매 시 4000원 할인 쿠폰',1,4000,'2025-01-01 00:00:00','2025-01-31 23:59:59',0),(5,'팝콘 콤보 할인 쿠폰',NULL,'팝콘 콤보 구매 시 4000원 할인 쿠폰',2,4000,'2025-01-01 00:00:00','2025-01-31 23:59:59',0),(6,'팝콘R 교환권',NULL,'팝콘R 무료 교환권',2,NULL,'2025-01-01 00:00:00','2025-03-31 23:59:59',0),(7,'음료R 교환권',NULL,'음료R 무료 교환권',2,NULL,'2025-01-01 00:00:00','2025-03-31 23:59:59',0),(8,'이루치 안마 쿠폰',NULL,'이루치가 호현이형 안마해주는 쿠폰',1,0,'2025-01-01 00:00:00','2025-12-01 00:00:00',1),(10,'테트리스쿠폰',NULL,'테트리스 1판 해주기',2,0,'2025-02-13 00:00:00','2025-02-28 23:59:59',0),(11,'쿠폰',NULL,'1',1,1,'2025-02-04 00:00:00','2025-02-13 23:59:59',1),(12,'안녕하세요',NULL,'스위트걸이에요',1,0,'2025-02-04 00:00:00','2025-02-27 23:59:59',1),(13,'안녕하세요',NULL,'스위트걸이에요',1,0,'2025-02-04 00:00:00','2025-02-27 23:59:59',1),(14,'쿠폰ew',NULL,'q1',1,1,'2025-02-11 00:00:00','2025-02-14 23:59:59',1),(15,'23',NULL,'23',2,1,'2025-02-05 00:00:00','2025-02-20 23:59:59',1),(16,'22',NULL,'323',1,0,'2025-02-03 00:00:00','2025-02-20 23:59:59',1),(17,'544',NULL,'1',1,1,'2025-02-03 00:00:00','2025-02-21 23:59:59',1),(18,'3',NULL,'1',1,1,'2025-02-10 00:00:00','2025-02-19 23:59:59',1),(19,'2322',NULL,'1',1,0,'2025-02-11 00:00:00','2025-02-26 23:59:59',1),(20,'로그야 찍혀라',NULL,'1',1,0,'2025-02-11 00:00:00','2025-02-14 23:59:59',1);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
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
