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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `boardIdx` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '게시판 고유 ID',
  `adminIdx` bigint(20) NOT NULL COMMENT '관리자 ID',
  `theaterIdx` bigint(20) DEFAULT NULL COMMENT '극장 고유 ID (전체 극장 대상인 경우 NULL)',
  `boardType` varchar(30) NOT NULL COMMENT '게시판 종류 (NOTICE: 공지사항, EVENT: 이벤트)',
  `boardTitle` varchar(70) NOT NULL COMMENT '게시판 제목',
  `boardContent` text NOT NULL COMMENT '게시판 내용 (이벤트 내용은 이미지 태그로 입력)',
  `boardRegDate` datetime NOT NULL COMMENT '게시 시작일',
  `boardExpDate` datetime DEFAULT NULL COMMENT '게시 종료일 (NULL 가능)',
  `boardStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '게시 상태 (0: 게시 중, 1: 게시 예정, 2: 게시 종료)',
  PRIMARY KEY (`boardIdx`),
  KEY `adminIdx` (`adminIdx`),
  KEY `theaterIdx` (`theaterIdx`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`adminIdx`) REFERENCES `admin` (`adminIdx`) ON DELETE CASCADE,
  CONSTRAINT `board_ibfk_2` FOREIGN KEY (`theaterIdx`) REFERENCES `theater` (`theaterIdx`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='게시판 정보를 저장하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,2,NULL,'NOTICE','2025년 2월 상영작 안내','2025년 2월의 최신 상영작 안내입니다. 영화 시간표를 확인해주세요.','2025-01-15 10:00:00',NULL,0),(2,3,NULL,'NOTICE','2025년 설날 연휴 극장 운영 안내','설날 연휴 기간 동안 모든 극장은 정상 운영됩니다.','2025-01-18 12:00:00','2025-02-01 23:59:59',0),(3,4,NULL,'NOTICE','좌석 업그레이드 안내','전 상영관 리클라이너 좌석 업그레이드가 완료되었습니다.','2025-01-10 09:00:00',NULL,0),(4,5,1,'EVENT','강남 특별관 할인 이벤트','강남 극장에서 모든 조조 상영 티켓 30% 할인 이벤트 진행 중!','2025-01-12 08:00:00','2025-01-31 23:59:59',0),(5,6,5,'EVENT','고양스타필드 가족 패키지','고양스타필드 극장에서 가족 영화 패키지를 구매하면 팝콘 세트를 무료로 제공합니다.','2025-01-10 10:30:00','2025-01-31 23:59:59',0),(6,7,12,'EVENT','부산 IMAX 관람 이벤트','부산 IMAX 특별 상영을 예매하신 분들께 추첨을 통해 영화 굿즈를 드립니다.','2025-01-20 15:00:00','2025-02-15 23:59:59',0),(7,3,NULL,'NOTICE','2025년 3월 상영작 사전 안내','3월의 상영작 정보를 미리 확인하세요. 곧 게시됩니다.','2025-02-01 00:00:00','2025-03-01 23:59:59',1),(8,2,8,'EVENT','인천논현 신년 이벤트','인천논현 극장에서 신년을 맞아 무료 시사회 이벤트가 진행되었습니다.','2025-01-01 08:00:00','2025-01-15 23:59:59',2),(9,2,NULL,'NOTICE','2025년 상반기 개봉 예정작 안내','2025년 상반기 개봉 예정작을 미리 만나보세요.','2025-01-01 10:00:00',NULL,0),(10,3,NULL,'NOTICE','2025년 영화제 관련 안내','국내 최대 영화제가 열립니다. 자세한 내용을 확인하세요.','2025-01-15 09:30:00','2025-02-20 23:59:59',0),(11,4,1,'NOTICE','강남 특별 상영회 공지','강남 극장에서 감독과의 대화가 포함된 특별 상영회가 열립니다.','2025-01-20 14:00:00','2025-02-05 23:59:59',0),(12,5,5,'NOTICE','고양스타필드 리클라이너 상영관 안내','고양스타필드의 모든 상영관이 리클라이너로 업그레이드되었습니다.','2025-01-10 11:00:00',NULL,0),(13,6,12,'NOTICE','부산 IMAX 특별 할인 안내','부산 IMAX 관람 시 20% 할인을 제공합니다.','2025-01-18 10:00:00','2025-02-10 23:59:59',0),(14,2,8,'NOTICE','인천논현 무료 시사회','인천논현 극장에서 무료 시사회가 열립니다.','2025-01-10 13:00:00','2025-01-30 23:59:59',0),(15,3,NULL,'NOTICE','모든 극장 안전 점검 완료 안내','전국 모든 극장의 시설 안전 점검이 완료되었습니다.','2025-01-05 08:00:00',NULL,0),(16,4,3,'NOTICE','코엑스 특별 이벤트 안내','코엑스 극장에서 참여할 수 있는 특별 이벤트가 준비되어 있습니다.','2025-01-12 09:00:00','2025-02-05 23:59:59',0),(17,5,7,'NOTICE','송도 극장 추가 상영관 안내','송도 극장에 새로운 상영관이 추가되었습니다.','2025-01-08 09:00:00',NULL,0),(18,6,NULL,'NOTICE','겨울철 난방 시설 점검 완료 안내','모든 극장의 난방 시설이 점검되었습니다.','2025-01-05 12:00:00',NULL,0),(19,2,NULL,'NOTICE','2025년 설 연휴 특별 프로그램','설 연휴 기간 특별 프로그램이 진행됩니다.','2025-01-15 09:30:00','2025-02-01 23:59:59',0),(20,3,NULL,'NOTICE','2025년 회원 혜택 개편 안내','새로운 회원 등급 및 혜택이 적용됩니다.','2025-01-10 11:30:00','2025-01-31 23:59:59',0),(21,4,NULL,'NOTICE','새로운 영화 할인 쿠폰 제공','회원들에게 영화 할인 쿠폰이 제공됩니다.','2025-01-12 09:30:00','2025-01-31 23:59:59',0),(22,5,10,'NOTICE','대구신세계 영화제 개최 안내','대구신세계에서 영화제가 열립니다.','2025-01-10 14:30:00','2025-01-30 23:59:59',0),(23,6,NULL,'NOTICE','모든 극장 Wi-Fi 업그레이드 안내','전국 모든 극장의 Wi-Fi가 업그레이드되었습니다.','2025-01-15 11:00:00',NULL,0),(24,2,NULL,'NOTICE','회원 가입 이벤트 진행 중','지금 회원 가입하면 추가 포인트를 받을 수 있습니다.','2025-01-05 09:00:00','2025-01-31 23:59:59',0),(25,3,NULL,'NOTICE','겨울철 감기 예방 안내','영화관 방문 시 감기 예방을 위한 안내 사항입니다.','2025-01-10 10:00:00',NULL,2),(26,4,NULL,'NOTICE','봄 시즌 추천 영화 목록','봄 시즌에 추천하는 영화 목록을 확인하세요.','2025-01-20 10:30:00',NULL,0),(27,5,6,'NOTICE','안성스타필드 신규 상영관 안내','안성스타필드에 신규 상영관이 추가되었습니다.','2025-01-10 12:00:00','2025-01-31 23:59:59',2),(28,6,2,'EVENT','강남 VIP 상영관 할인 이벤트','강남 VIP 상영관에서 할인 이벤트를 제공합니다.','2025-01-08 12:00:00','2025-02-15 23:59:59',0),(29,2,3,'EVENT','코엑스 IMAX 추첨 이벤트','코엑스 IMAX에서 추첨을 통해 경품을 드립니다.','2025-01-12 10:00:00','2025-02-10 23:59:59',0),(30,3,NULL,'EVENT','전국 극장 신년 할인 이벤트','전국 모든 극장에서 신년 특별 할인이 진행됩니다.','2025-01-01 09:00:00','2025-01-31 23:59:59',0),(31,4,10,'EVENT','대구신세계 조조 할인 이벤트','대구신세계에서 조조 상영 시 특별 할인을 제공합니다.','2025-01-10 10:00:00','2025-02-01 23:59:59',0),(32,5,7,'EVENT','송도 극장 리클라이너 체험 이벤트','송도 극장에서 리클라이너 좌석 체험 이벤트가 진행됩니다.','2025-01-15 11:00:00','2025-02-15 23:59:59',0),(33,6,4,'EVENT','홍대 Dolby 특별 이벤트','홍대 Dolby 상영관에서 특별 상영이 진행됩니다.','2025-01-20 14:00:00','2025-02-15 23:59:59',0),(34,2,9,'EVENT','골드바 매일매일 1g 증정 이벤트','https://www.megabox.co.kr/SharedImg/editorImg/2024/05/29/EucpmqrOdZChtW5zfXCdNg0cdo31BAZ2.jpg','2025-01-12 13:00:00','2025-02-10 23:59:59',0),(35,3,11,'EVENT','전주혁신 상영관 새해 이벤트','전주혁신에서 새해 맞이 무료 시사회가 열립니다.','2025-01-10 09:30:00','2025-01-31 23:59:59',0),(36,4,NULL,'EVENT','회원 전용 무료 영화 상영 이벤트','회원 전용 무료 상영 이벤트가 전국 극장에서 진행됩니다.','2025-01-05 08:00:00','2025-01-31 23:59:59',0),(37,5,15,'EVENT','애니메이션 영화랑 매점 콜라보!','https://www.megabox.co.kr/SharedImg/editorImg/2025/01/08/sfq3yhWi2HzIUqDo42jRCVKwrPLBOF56.jpg','2025-02-03 12:30:00','2025-02-28 23:59:59',0),(38,2,NULL,'EVENT','2025 다이어리','https://www.megabox.co.kr/SharedImg/editorImg/2024/10/25/pxz9ysATRmR2HZEB90P341XHFk8q9eb1.jpg','2025-02-01 00:00:00','2025-02-28 23:59:59',0),(39,2,NULL,'EVENT','오리지널 티켓 No. 130 <검은 수녀들>','https://www.megabox.co.kr/SharedImg/editorImg/2025/01/22/tpDl6KbjbMUTVgNxpJxZjIVcEtUsRQB3.jpg','2025-01-24 00:00:00','2025-02-24 23:59:59',0),(41,3,16,'EVENT','포대팝콘 2포 2만 2천원 행사','https://www.megabox.co.kr/SharedImg/editorImg/2025/01/24/ZScHMBTjp25Xqxja35AwjbI75J6TTMjZ.jpg','2025-02-02 00:00:00','2025-02-23 23:59:59',0),(42,4,14,'EVENT','겨울 맞이 붕어빵 할인!','https://www.megabox.co.kr/SharedImg/editorImg/2024/12/27/KFkZeehhewoorGgu7IBi9RPG6ojOAtki.jpg','2025-01-15 00:00:00','2025-01-23 00:00:00',0),(43,6,13,'EVENT','미리 메리 크리스마스!','https://www.megabox.co.kr/SharedImg/editorImg/2024/11/20/wHyXpYeNmHbCeOnab8KmybxOEMQ5uI54.jpg','2024-12-15 00:00:00','2024-12-25 00:00:00',0),(44,2,NULL,'EVENT','다시 돌아온 영화 같은 새해 이벤트','https://www.megabox.co.kr/SharedImg/editorImg/2025/01/17/j9p2Eidu2xrLGViLyLBNMABb1641NaTj.jpg','2025-01-20 09:30:00','2025-02-28 23:59:59',0),(45,3,6,'EVENT','단골모집합니다','https://www.megabox.co.kr/SharedImg/editorImg/2025/01/24/GIdFLXvDamgVYly1lTactgyitffVmUQV.jpg','2025-02-01 09:30:00','2025-02-28 23:59:59',0),(81,1,16,'NOTICE','임시 공지','임시 공지 내용 수정','2025-02-09 10:38:48','2025-03-01 00:00:00',0),(82,1,NULL,'NOTICE','공지사항 작성','공지사항 테스트임','2025-02-09 12:10:31','2025-02-11 00:00:00',0);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
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
