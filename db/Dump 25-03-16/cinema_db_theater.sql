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
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater` (
  `theaterIdx` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '극장 고유 ID',
  `theaterName` varchar(30) NOT NULL COMMENT '극장 이름',
  `theaterRegion` varchar(20) NOT NULL COMMENT '극장 지역',
  `theaterAddress` varchar(100) NOT NULL COMMENT '극장 주소',
  `theaterInfo` varchar(255) DEFAULT NULL COMMENT '극장 설명 (간단한 소개 문구)',
  `theaterImageUrl` varchar(255) DEFAULT NULL COMMENT '극장 설명 이미지 URL (보유 시설, 층별 안내 등의 시설안내 이미지)',
  `theaterScreenCount` int(2) NOT NULL COMMENT '총 상영관 수',
  `theaterRegDate` datetime NOT NULL COMMENT '극장 등록일 (관리자 입력)',
  `theaterStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '극장 상태 (0: 운영 중, 1: 점검, 2: 폐쇄)',
  PRIMARY KEY (`theaterIdx`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='극장 정보를 저장하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES (1,'강남','서울','서울특별시 서초구 서초대로 77길 3 (서초동) 아라타워 8층','강남역 9번출구와 연결된 편리한 접근성과 위치! 강남을 한 눈에 볼 수 있는 최상의 VIEW','gangnamtheater.png',10,'2023-01-01 00:00:00',0),(2,'센트럴','서울','서울특별시 서초구 신반포로 176, (반포동) 센트럴시티 빌딩 지하1층','편안하게 즐기는 부티크 호텔 감성의 아늑한 라운지와 상영관','centraltheater.png',10,'2023-01-01 00:00:00',0),(3,'코엑스','서울','서울특별시 강남구 봉은사로524, (삼성동) 코엑스몰 지하2층','명실상부 국내 최대 영화관, ALL IN MEGA! 메가박스의 모든 특별관이 이곳에','coextheater.png',10,'2023-01-01 00:00:00',0),(4,'홍대','서울','서울특별시 마포구 양화로 147, (동교동) 아일렉스 7층','홍대입구역 도보 1분, 20대들의 놀이터! 전 관 레이저 영사기로 선명하게','hongdaetheater.png',10,'2023-01-01 00:00:00',0),(5,'고양스타필드','경기','경기도 고양시 덕양구 고양대로 1955 (동산동) 스타필드고양 4층','스타필드고양 필수 코스! 사운드 특별관 DOLBY ATMOS관, 가족을 위한 KIDS관','goyangtheater.png',10,'2023-01-02 00:00:00',0),(6,'수원스타필드','경기','경기도 수원시 장안구 정자동 111-14','Dolby 사운드의 생생한 감동이 영화의 감동으로, 사운드 특별관 DOLBY ATMOS관','suwontheater.png',10,'2023-01-02 00:00:00',0),(7,'안성스타필드','경기','경기도 안성시 공도읍 서동대로 3930-39, (진사리) 스타필드 안성 3층','완벽한 영화 관람을 완성하는 하이엔드 DOLBY CINEMA','ansungtheater.png',10,'2023-01-02 00:00:00',0),(8,'송도','인천','인천광역시 연수구 송도과학로 16번길 33-4, (송도동) 트리플 스트리트 D동 2층','인천 유일, 완벽한 영화 관람을 완성하는 하이엔드 DOLBY CINEMA','songdotheater.png',10,'2023-01-03 00:00:00',0),(9,'인천논현','인천','인천광역시 남동구 논현동 논고개로 61 라피에스타','TRINNOV SOUND SYSTEM으로 압도하는 사운드','nonhyeontheater.png',10,'2023-01-03 00:00:00',0),(10,'대전중앙로','대전/충청/세종','대전광역시 중구 중앙로 126, (대흥동) 4층','대전 빵세권의 중심! 대전중앙로역 도보 2분, 성심당 도보 5분','jungangrotheater.png',10,'2023-01-04 00:00:00',0),(11,'세종나성','대전/충청/세종','세종특별자치시 나성로 38, (나성동) 세종 가로수길 건물 5층 A동','나성동 번화가, BRT 라인! 여유로운 무료 주차에 전 관 위생적인 가죽시트까지','nasungtheater.png',10,'2023-01-04 00:00:00',0),(12,'대구신세계','부산/대구/경상','대구광역시 동구 동부로 149, (신천동) 신세계백화점 8층','대구경북 유일, 완벽한 영화 관람을 완성하는 하이엔드 DOLBY CINEMA','ssgtheater.png',10,'2023-01-05 00:00:00',0),(13,'해운대','부산/대구/경상','부산광역시 해운대구 해운대로 813 (좌동, NC백화점 8층) 메가박스 해운대장산지점','영화의 감동을 넘어 편안함의 감동까지, 전 관 리클라이너로 프리미엄하게','haeundaetheater.png',10,'2023-01-05 00:00:00',0),(14,'광주하남','광주/전라','광주광역시 광산구 우산동 풍영철길로 15 콜럼버스월드','영화의 감동을 넘어 편안함의 감동까지, 전 좌석 리클라이너로 프리미엄하게','hanamtheater.png',10,'2023-01-06 00:00:00',0),(15,'전주혁신','광주/전라','전북특별자치도 전주시 덕진구 기지로 77 (장동, 전북혁신도시 디엠시티) 2층','사운드 특별관 DOLBY ATMOS관, 전 관 레이저 영사기로 선명하게','hyeoksintheater.png',10,'2023-01-06 00:00:00',0),(16,'원주혁신','강원','강원특별자치도 원주시 황금로 2, 센트럴파크 7층 / 강원특별자치도 원주시 양지로 80, (반곡동, 센트럴파크 7층)','Dolby 사운드의 생생한 감동과 전 좌석 리클라이너로 프리미엄하게','wonjuhyeoksintheater.png',10,'2023-01-07 00:00:00',0);
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
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
