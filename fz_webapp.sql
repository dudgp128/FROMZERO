-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fz_webapp
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `memid` varchar(50) NOT NULL,
  `passwd` varchar(40) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`memid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('5','7','8','9','4'),('ã','s','ã','ã·ã','ã'),('khhong','1111','홍기형','충남','02-920-7525');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_product`
--

DROP TABLE IF EXISTS `offline_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_product` (
  `idoffline_product` int NOT NULL AUTO_INCREMENT,
  `offlineproduct_name` varchar(45) DEFAULT NULL,
  `offlineproduct_num` int DEFAULT NULL,
  `offline_product_price` int DEFAULT NULL,
  `storeid` int DEFAULT NULL,
  PRIMARY KEY (`idoffline_product`),
  KEY `storeid_idx` (`storeid`),
  CONSTRAINT `storeid` FOREIGN KEY (`storeid`) REFERENCES `offlinestore` (`storeid`)
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_product`
--

LOCK TABLES `offline_product` WRITE;
/*!40000 ALTER TABLE `offline_product` DISABLE KEYS */;
INSERT INTO `offline_product` VALUES (100,'소프넛',NULL,11000,1),(101,'플레이니스트(빨래, 설거지)',NULL,9000,1),(102,'에코띠크 세탁세제',NULL,3500,1),(103,'에코띠크 섬유유연제',NULL,3500,1),(104,'구연산',NULL,2000,1),(105,'탄산수소나트륨(베이킹소다)',NULL,2000,1),(106,'과탄산소다(빨래)',NULL,2500,1),(107,'생활공작소(주방세제)',NULL,2500,1),(108,'바이오 크린콜',NULL,3500,1),(200,'설거지 비누',NULL,6500,2),(201,'천연수세미3개입',NULL,9900,2),(202,'브라질넛',NULL,50,2),(203,'헤이즐넛',NULL,35,2),(204,'캐슈넛',NULL,35,2),(205,'통밀쿠키(비건)',NULL,400,2),(206,'초코호두(비건)',NULL,600,2),(300,'자연분해 일회용 접시',NULL,1500,3),(301,'재사용 소창 화장지',NULL,25000,3),(302,'재사용 휴대용 소창와압스',NULL,10000,3),(303,'소창 바게트 주머니',NULL,7000,3),(304,'천연 실크 치실',NULL,7000,3),(305,'A5 크라프트 무지노트',NULL,1500,3),(306,'병아리콩',NULL,4000,3),(307,'유기농 국산 햇귀리',NULL,7500,3),(308,'쌀 파스타(펜네)',NULL,8500,3),(309,'브라운 렌틸콩',NULL,3000,3),(400,'친환경 노트',NULL,1000,4),(401,'삼베수세미',NULL,10000,4),(402,'손수건',NULL,3500,4),(403,'밀랍초',NULL,5000,4),(404,'소프넛',NULL,11000,4),(405,'천 마스크',NULL,5000,4),(406,'빨대키트',NULL,10000,4),(408,'대나무 칫솔',NULL,2000,4),(500,'칫솔 파우치',NULL,3000,5),(501,'혀클리너',NULL,7000,5),(502,'닥터노아 어린이 칫솔',NULL,3700,5),(503,'수세미 병솔(납작형)',NULL,7000,5),(504,'설거지 수세미 S',NULL,4000,5),(505,'다용도 집게',NULL,1000,5),(506,'고체치약',NULL,14000,5),(600,'삼베 주머니',NULL,2400,6),(601,'고체치약(120정)',NULL,13900,6),(602,'팜프리 비누',NULL,6800,6),(603,'비즈왁스랩(밀랍랩)',NULL,4500,6),(604,'다회용 소창 티백',NULL,3500,6),(605,'유기농 우엉(80g)',NULL,11400,6),(606,'유기농 작두콩(80g)',NULL,9500,6);
/*!40000 ALTER TABLE `offline_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offlinestore`
--

DROP TABLE IF EXISTS `offlinestore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offlinestore` (
  `storeid` int NOT NULL,
  `storename` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`storeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offlinestore`
--

LOCK TABLES `offlinestore` WRITE;
/*!40000 ALTER TABLE `offlinestore` DISABLE KEYS */;
INSERT INTO `offlinestore` VALUES (1,'알맹상점','서울 마포구 합정동 월드컵로 49 한우마을 2층','010-2229-1027'),(2,'지구샵','서울 동작구 상도동 성대로1길 16','070-7640-4940'),(3,'더피커','서울 성동구 왕십리로 115 헤이그라운드 9층','070-4118-0710'),(4,'라마홈','서울 종로구 자하문로 48 1층 ',NULL),(5,'송포어스','서울 강동구 풍성로35길 34 1층','070-8095-3534'),(6,'디어얼스','서울 서대문구 수색로 43 104호',NULL);
/*!40000 ALTER TABLE `offlinestore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_product`
--

DROP TABLE IF EXISTS `online_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_product` (
  `productid` int NOT NULL,
  `productname` varchar(45) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `big_category` varchar(45) DEFAULT NULL,
  `small_category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_product`
--

LOCK TABLES `online_product` WRITE;
/*!40000 ALTER TABLE `online_product` DISABLE KEYS */;
INSERT INTO `online_product` VALUES (1,'\'제로웨이스트 입문 키트\n\'','\'더피커\'',12000,'kit',NULL),(2,'\'스텐 고리집게(5p.)\n\'','\'더피커\'',4000,'living','집게'),(3,'\'소창 2겹 행주 (손수건 대용)\n\'','\'더피커\'',4000,'bathroom','타월'),(4,'\'비누 틴케이스\n\'','\'더피커\'',4500,'etc',NULL),(5,'\'유기농 메쉬 파우치(S)\n\'','\'더피커\'',3000,'living','주머니/가방'),(6,'\'휴대용 소창와입스(4매입)\n\'','\'더피커\'',11000,'bathroom','타월'),(7,'\'스텐 미니집게(10pcs.)\n\'','\'더피커\'',4000,'living','집게'),(8,'\'유기농 메쉬 프로듀스백(S/M/L)\n\'','\'더피커\'',4000,'living','주머니/가방'),(9,'\'광목 빨대 주머니\n\'','\'더피커\'',3000,'living','주머니/가방'),(10,'\'신문지연필(5ea)\n\'','\'더피커\'',2000,'etc',NULL),(11,'\'[도서] 오늘을 조금 바꿉니다\n\'','\'더피커\'',13410,'living','책/노트'),(12,'\'팔로산토 우드스틱\n\'','\'더피커\'',10000,'etc',NULL),(13,'\'[도서] 채식연습\n\'','\'더피커\'',15120,'living','책/노트'),(14,'\'유기농면 프로듀스백(S/M/L)\n\'','\'더피커\'',4500,'living','주머니/가방'),(15,'\'그랩 리페어 밀랍블록\n\'','\'더피커\'',1500,'kitchen','밀랍/시트'),(16,'\'유기농 순면생리대 누르Nur.\n\'','\'더피커\'',6500,'etc',NULL),(17,'\'네츄럴 린넨 손수건\n\'','\'더피커\'',4000,'bathroom','타월'),(18,'\'크라프트 무지 만년 위클리\n\'','\'더피커\'',2000,'living','책/노트'),(19,'\'재생종이 볼펜\n\'','\'더피커\'',1500,'etc',NULL),(20,'\'소락 유기농 튤립백(도시락가방)\n\'','\'더피커\'',6000,'living','주머니/가방'),(21,'\'[도서] 지구생활안내서 바질[BASIL]\n\'','\'더피커\'',13000,'living','책/노트'),(22,'\'유기농 하프메쉬 에코백\n\'','\'더피커\'',12000,'living','주머니/가방'),(23,'\'[도서] 그건 쓰레기가 아니라고요\n\'','\'더피커\'',14400,'living','책/노트'),(24,'\'재활용 페트병 마켓백\n\'','\'더피커\'',13000,'living','주머니/가방'),(25,'\'에코백\n\'','\'더피커\'',8000,'living','주머니/가방'),(26,'\'A5 크라프트 무지노트\n\'','\'더피커\'',2000,'living','책/노트'),(27,'\'대나무 연필깎이\n\'','\'더피커\'',2000,'etc',NULL),(28,'\'스테인리스 빨대(일자형)\n\'','\'더피커\'',3000,'living','빨대'),(29,'\'프로듀스백 (M)\n\'','\'더피커\'',6000,'living','주머니/가방'),(30,'\'재활용면 텀블러 가방\n\'','\'더피커\'',13000,'living','주머니/가방'),(31,'\'[도서] 매거진쓸[SSSSL]\n\'','\'더피커\'',13000,'living','책/노트'),(32,'\'유기농 스트링 에코백\n\'','\'더피커\'',10000,'living','주머니/가방'),(33,'\'하누만 요가매트\n\'','\'더피커\'',149000,'etc',NULL),(34,'\'소창 프로듀스백(M)\n\'','\'더피커\'',5500,'living','주머니/가방'),(37,'\'유기농 설거지 비누(100g/400g)\n\'','\'더피커\'',8000,'kitchen','설거지'),(38,'\'유기농 재사용 커피필터\n\'','\'더피커\'',4000,'kitchen','밀랍/시트'),(39,'\'SCHOTT 쇼트 유리빨대(단품/세트)\n\'','\'더피커\'',5000,'living','빨대'),(40,'\'다회용 밀랍 주방랩(M/L)\n\'','\'더피커\'',4500,'kitchen','밀랍/시트'),(41,'\'사이잘 빨대 세척솔\n\'','\'더피커\'',2000,'living','빨대'),(45,'\'설거지용 팟 브러쉬\n\'','\'더피커\'',6000,'kitchen','설거지'),(47,'\'소창 3겹 핸드타월\n\'','\'더피커\'',8000,'bathroom','타월'),(48,'\'설거지용 롱핸들 브러쉬\n\'','\'더피커\'',6500,'kitchen','설거지'),(53,'\'스테인리스 빨대(ㄱ자형)\n\'','\'더피커\'',3500,'living','빨대'),(56,'\'천연 설거지 수세미 (S/L)\n\'','\'더피커\'',4000,'kitchen','설거지'),(57,'\'다회용 밀랍 푸드백(S/L)\n\'','\'더피커\'',5000,'living','주머니/가방'),(61,'\'생분해 천연 치실/리필\n\'','\'더피커\'',7000,'bathroom','샤워'),(63,'\'친환경 대나무 칫솔\n\'','\'더피커\'',5500,'bathroom','샤워'),(64,'\'유기농 햄프코튼 재사용 화장솜\n\'','\'더피커\'',12000,'bathroom','타월'),(65,'\'비누 틴케이스\'','\'더피커\'',4500,'bathroom','비누'),(67,'\'스테인리스 혀클리너\n\'','\'더피커\'',7000,'bathroom','샤워'),(68,'\'천연 목욕수세미(어린수세미)\n\'','\'더피커\'',4000,'bathroom','샤워'),(69,'\'천연 비누주머니\n\'','\'더피커\'',5000,'bathroom','비누'),(70,'\'유기농 온몸비누 제주\n\'','\'더피커\'',8000,'bathroom','비누'),(73,'\'소창 2겹 세안수건\n\'','\'더피커\'',7000,'bathroom','타월'),(74,'\'천연 수세미 목욕장갑\n\'','\'더피커\'',10000,'bathroom','샤워'),(75,'\'플랑드비 올라이트 바디솝\n\'','\'더피커\'',17000,'bathroom','비누'),(76,'\'재사용 화장지(10매입)\n\'','\'더피커\'',25000,'bathroom','샤워'),(77,'\'제로웨이스트 구강위생 키트\n\'','\'더피커\'',22000,'kit',NULL),(78,'\'[예고은] 삼베수세미(3개입)\n\'','\'지구샵\'',8500,'kitchen','설거지'),(79,'\'주방비누\n\'','\'지구샵\'',5200,'kitchen','설거지'),(80,'\'[소렉스] 과일채소 세척솔\n\'','\'지구샵\'',6000,'kitchen','설거지'),(81,'\'[예고은] 삼베행주\n\'','\'지구샵\'',7900,'bathroom','타월'),(82,'\'[손끋비] 밀랍랩 비기너세트(3매입)\n\'','\'지구샵\'',10000,'kitchen','밀랍/시트'),(83,'\'[소렉스] 보틀 세척솔\n\'','\'지구샵\'',10000,'kitchen','설거지'),(84,'\'[소렉스] 구리수세미 3pcs\n\'','\'지구샵\'',10000,'kitchen','설거지'),(85,'\'[손끋비] 밀랍랩(Large)\n\'','\'지구샵\'',7000,'kitchen','밀랍/시트'),(86,'\'[예고은] 삼베찜시트\n\'','\'지구샵\'',6200,'kitchen','밀랍/시트'),(87,'\'[소렉스] 팬용 세척솔\n\'','\'지구샵\'',7000,'kitchen','설거지'),(88,'\'[손끋비] 밀랍랩(Small)\n\'','\'지구샵\'',5000,'kitchen','밀랍/시트'),(89,'\'[손끋비] 밀랍랩 DIY세트(교육/체험용)\n\'','\'지구샵\'',9900,'kitchen','밀랍/시트'),(90,'\'[레데커] 스크럽 세척솔\n\'','\'지구샵\'',6000,'kitchen','설거지'),(91,'\'천연 물방울수세미\n\'','\'지구샵\'',3500,'kitchen','설거지'),(92,'\'천연 통수세미\n\'','\'지구샵\'',3500,'kitchen','설거지'),(93,'\'천연물방울수세미(3개입)\n\'','\'지구샵\'',9900,'kitchen','설거지'),(94,'\'고체치약\n\'','\'지구샵\'',5900,'bathroom','샤워'),(95,'\'대나무칫솔(성인/어린이용)\n\'','\'지구샵\'',3500,'bathroom','샤워'),(96,'\'[소락] 면화장솜 4pcs\n\'','\'지구샵\'',10000,'bathroom','타월'),(97,'\'[예고은] 삼베샤워타월\n\'','\'지구샵\'',11900,'bathroom','샤워'),(98,'\'칫솔 파우치\n\'','\'지구샵\'',3500,'bathroom','주머니/가방'),(99,'\'[더비건글로우] 오리지널 샴푸바\n\'','\'지구샵\'',15000,'bathroom','비누'),(100,'\'유기농 핸드타월 (3매)\n\'','\'지구샵\'',12000,'bathroom','타월'),(101,'\'[솝퓨리]안티로쓰 샴푸바(탈모방지)\n\'','\'지구샵\'',18000,'bathroom','비누'),(102,'\'[솝퓨리]네버드라이 페이셜바\n\'','\'지구샵\'',15000,'bathroom','비누'),(103,'\'유기농 수건 (3매)\n\'','\'지구샵\'',19500,'bathroom','타월'),(104,'\'[솝퓨리]리치리치 샴푸바(건성용)\n\'','\'지구샵\'',18000,'bathroom','비누'),(105,'\'[솝퓨리]오오클렌징바(여성청결제)\n\'','\'지구샵\'',24000,'bathroom','비누'),(106,'\'[솝퓨리]노세범 샴푸바(지성용)\n\'','\'지구샵\'',16000,'bathroom','비누'),(107,'\'스테인레스 칫솔걸이\n\'','\'지구샵\'',4000,'bathroom','샤워'),(108,'\'면비누망\n\'','\'지구샵\'',2500,'bathroom','비누'),(109,'\'[소락] 유기농 면마스크\n\'','\'지구샵\'',6000,'etc',NULL),(110,'\'[소락] 휴대용 와입스(4매입)\n\'','\'지구샵\'',11000,'bathroom','타월'),(112,'\'메쉬백\n\'','\'지구샵\'',8000,'living','주머니/가방'),(113,'\'프로듀스백\n\'','\'지구샵\'',4000,'living','주머니/가방'),(114,'\'[프리다]플로우 밀랍초\n\'','\'지구샵\'',10000,'etc',NULL),(115,'\'[프리다]생일초\n\'','\'지구샵\'',1000,'etc',NULL),(116,'\'[프리다]꽈배기 생일초\n\'','\'지구샵\'',1100,'etc',NULL),(117,'\'[프리다]노랑성냥\n\'','\'지구샵\'',4000,'etc',NULL),(118,'\'[루디아의베틀] 미니크로스백\n\'','\'지구샵\'',45600,'living','주머니/가방'),(119,'\'[바잇미] 미니에코백\n\'','\'지구샵\'',8900,'living','주머니/가방'),(120,'\'[프리다]담금초 세트\n\'','\'지구샵\'',52000,'kit',NULL),(121,'\'[프리다]흐르는 작은 초\n\'','\'지구샵\'',22000,'etc',NULL),(122,'\'[바잇미] 데일리 산책가방\n\'','\'지구샵\'',30900,'living','주머니/가방'),(123,'\'[프리다]코르크 밀랍초\n\'','\'지구샵\'',20000,'etc',NULL),(124,'\'[루디아의베틀] 루디아백\n\'','\'지구샵\'',40000,'living','주머니/가방'),(125,'\'[루디아의베틀] 코스타백\n\'','\'지구샵\'',74600,'living','주머니/가방'),(126,'\'친환경 제로웨이스트 주방용 다용도 천연 수세미\n\'','\'제로웨이스트샵\'',800,'kitchen','설거지'),(127,'\'친환경 제로웨이스트 내열 유리빨대 4종 세트\n\'','\'제로웨이스트샵\'',6600,'living','빨대'),(128,'\'유리빨대 파우치 세트\n\'','\'제로웨이스트샵\'',9900,'living','주머니/가방'),(129,'\'내열 유리빨대 스무디용 12mm\n\'','\'제로웨이스트샵\'',2000,'living','빨대'),(130,'\'내열 유리빨대 일반용 8mm\n\'','\'제로웨이스트샵\'',1500,'living','빨대'),(131,'\'친환경 제로웨이스트 미세모 대나무 칫솔\n\'','\'제로웨이스트샵\'',980,'bathroom','샤워'),(132,'\'[E,art] 천연 루파 수세미 열매\'','\'지구살림e\'',3790,'kitchen','설거지'),(133,'\'[e,art] 먼지없는 강화 소창 2겹 행주 (면100%)\'','\'지구살림e\'',2100,'bathroom','타월'),(134,'\'[E,art] 프리미엄 강화 소창 와입스\'','\'지구살림e\'',1350,'bathroom','타월'),(135,'\'[E,art] 친환경 스테인리스 빨대\'','\'지구살림e\'',500,'living','빨대'),(136,'\'[e,art] 스텐 훅 집게\'','\'지구살림e\'',500,'living','집게'),(137,'\'E,art 디쉬바 옐루칼립투스\'','\'지구살림e\'',5000,'kitchen','설거지'),(138,'\'[E,art] 프리미엄 강화 소창 원단 2겹 3겹\'','\'지구살림e\'',2900,'kitchen','타월'),(139,'\'[E,art] 광목 주머니\'','\'지구살림e\'',1800,'living','주머니/가방'),(140,'\'[E,art] 삼베 수세미\'','\'지구살림e\'',3790,'kitchen','설거지'),(141,'\'E,art 친환경 대나무 빨대\'','\'지구살림e\'',1300,'living','빨대'),(143,'\'[E,art] 천연 루파 텀블러 세척솔\'','\'지구살림e\'',4790,'kitchen','설거지'),(144,'\'[E,art] 먼지없는 강화 소창 2겹 행주 5장 세트\'','\'지구살림e\'',12000,'kit',NULL),(145,'\'E,art 린넨 롱 앞치마\'','\'지구살림e\'',35800,'etc',NULL),(146,'\'E,art 골드 머그 1P\'','\'지구살림e\'',12500,'etc',NULL),(147,'\'E,art 포켓 장바구니\'','\'지구살림e\'',17800,'kitchen','주머니/가방'),(148,'\'제로웨이스트 네트백\'','\'지구살림e\'',4000,'living','주머니/가방'),(149,'\'[E,art] 심플리 하프 에이프런 2종\'','\'지구살림e\'',18000,'etc',NULL),(150,'\'E,art 프리미엄 집들이 선물 세트\'','\'지구살림e\'',21300,'kit',NULL),(152,'\'과탄산소다 1kg 소창행주 정련 세제\'','\'지구살림e\'',3900,'bathroom','타월'),(153,'\'100% 천연 밀랍초 비즈왁스 밀랍 캔들 3개 세트\'','\'지구살림e\'',11000,'kit',NULL),(154,'\'[E,art] 제로웨이스트 대나무 칫솔\'','\'지구살림e\'',1250,'bathroom','샤워'),(157,'\'저자극 오이가지 바디 비누\'','\'지구살림e\'',6000,'bathroom','비누'),(158,'\'[E,art] 프리미엄 소창 목욕수건\'','\'지구살림e\'',8300,'bathroom','타월'),(159,'\'[E,art] 삼베 샤워타월\'','\'지구살림e\'',8300,'bathroom','샤워'),(160,'\'규조토 비누 받침 심플 사각 트레이 1개\'','\'지구살림e\'',2000,'bathroom','비누'),(161,'\'[e,art] 먼지없는 강화 소창 3겹 수건 (면100%)\'','\'지구살림e\'',5200,'bathroom','타월'),(162,'\'저자극 바질 클렌징 비누\'','\'지구살림e\'',5000,'bathroom','비누'),(163,'\'[e,art] 재사용 화장솜\'','\'지구살림e\'',8990,'bathroom','타월');
/*!40000 ALTER TABLE `online_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-18 17:13:42
