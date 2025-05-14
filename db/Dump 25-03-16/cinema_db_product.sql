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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productIdx` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '상품 고유 ID',
  `productCategory` tinyint(1) NOT NULL COMMENT '상품 카테고리 (1: 굿즈, 2: 스낵)',
  `productName` varchar(50) NOT NULL COMMENT '상품명',
  `productInfo` text COMMENT '상품 설명',
  `productPrice` int(7) NOT NULL COMMENT '상품 가격',
  `productStock` int(5) DEFAULT NULL COMMENT '상품 재고 수량',
  `productImg` varchar(255) DEFAULT NULL COMMENT '상품 이미지 파일명',
  `productRegDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '상품 등록일',
  `productStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '상품 상태 (0: 판매 중, 1: 품절, 2: 종료)',
  PRIMARY KEY (`productIdx`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='상품 정보를 저장하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'아바타 영화의 한정판 오리지널 포스터','아바타 영화의 한정판 오리지널 포스터입니다.',2000,89,'avatar_poster.jpg','2024-01-05 10:00:00',0),(2,1,'해리포터 공식 마법 지팡이','해리포터 팬들을 위한 공식 마법 지팡이 굿즈.',30000,0,'harry_wand.jpg','2024-01-08 14:00:00',1),(3,1,'마블 캐릭터 키체인 세트','마블 영화의 인기 캐릭터로 구성된 키체인 세트.',15000,199,'marvel_keychain.jpg','2024-01-10 09:30:00',1),(4,1,'겨울왕국 한정판 노트','겨울왕국 테마의 예쁜 노트입니다.',12000,149,'frozen_notebook.jpg','2024-01-12 11:00:00',1),(5,1,'쥬라기 공원 공룡 피규어','쥬라기 공원 영화의 공룡 피규어 한정판.',25000,79,'jurassic_figure.jpg','2024-01-15 15:00:00',1),(6,1,'스타워즈 한정판 텀블러','스타워즈 테마의 한정판 텀블러입니다.',20000,93,'starwars_tumbler.jpg','2024-01-18 12:00:00',0),(7,1,'디즈니 캐릭터 배지 세트','디즈니 인기 캐릭터가 포함된 배지 세트.',15000,119,'disney_badge.jpg','2024-01-20 13:00:00',0),(8,1,'반지의 제왕 오리지널 포스터','반지의 제왕 시리즈의 한정판 포스터입니다.',9998,64,'lotr_poster.jpg','2024-01-22 16:00:00',0),(9,1,'미니언즈 캐릭터 머그컵','미니언즈 캐릭터가 프린트된 머그컵.',18000,100,'minions_mug.jpg','2024-01-25 10:30:00',0),(10,1,'배트맨 한정판 노트','배트맨 테마로 제작된 한정판 노트입니다.',12000,60,'batman_notebook.jpg','2024-01-28 14:30:00',0),(11,2,'달콤한 카라멜 팝콘 (R)','중간 사이즈의 달콤한 카라멜 팝콘입니다.',6000,498,'caramel_popcorn.jpg','2024-01-05 10:00:00',0),(12,2,'고소한 버터 팝콘 (R)','대형 사이즈의 고소한 버터 팝콘입니다.',8000,500,'butter_popcorn.jpg','2024-01-08 14:00:00',0),(13,2,'코카콜라 음료 (R)','중간 사이즈의 시원한 코카콜라입니다.',3000,499,'coke_medium.jpg','2024-01-10 09:30:00',1),(14,2,'스프라이트 음료 (R)','대형 사이즈의 상쾌한 스프라이트입니다.',4000,497,'sprite_large.jpg','2024-01-12 11:00:00',0),(15,2,'치즈 소스와 나쵸 세트','따뜻한 치즈 소스와 함께 제공되는 나쵸.',7000,300,'nacho_set.jpg','2024-01-15 15:00:00',0),(16,2,'러브콤보(R)','팝콘과 콜라가 포함된 콤보 세트.',9000,289,'combo1.jpg','2024-01-18 12:00:00',0),(17,2,'더블콤보(L)','팝콘과 콜라가 포함된 대형 콤보 세트.',12000,298,'combo2.jpg','2024-01-20 13:00:00',1),(18,2,'바닐라 아이스크림','시원하고 부드러운 바닐라 아이스크림.',5000,300,'ice_cream.jpg','2024-01-22 16:00:00',0),(19,2,'핫도그 (치즈 추가 가능)','치즈를 추가할 수 있는 따뜻한 핫도그.',4500,300,'hot_dog.jpg','2024-01-25 10:30:00',0),(20,2,'프레첼 (소금, 치즈 소스)','소금과 치즈 소스를 곁들인 프레첼.',5500,300,'pretzel.jpg','2024-01-28 14:30:00',0),(24,1,'아바타 영화 오리지널11','상품추가테스트입니다',500,105,'avatar_poster.jpg','2025-02-03 23:19:32',0),(25,2,'상품추가테스트입니다11','상품추가테스트입니다11',1000,10,'frozen_notebook.jpg','2025-02-03 23:30:04',0),(28,1,'상품추가테스트입니다','구구',100,100,'marvel_keychain.jpg','2025-02-03 23:53:38',0),(29,2,'아바타 영화 오리지널','아바타 영화의 한정판 오리지널 포스터.',333,333,'pretzel.jpg','2025-02-04 18:12:36',0),(30,2,'팝콘입니다','맛있는 팝콘',5000,400,'combo2.jpg','2025-02-04 18:16:45',0),(32,2,'약과','야생의 나현이가 좋아하는 약과',5000,30,'pretzel.jpg','2025-02-06 18:10:54',0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
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
