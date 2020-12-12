-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fz_webapp
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `bottle`
--

DROP TABLE IF EXISTS `bottle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bottle` (
  `custid` varchar(50) NOT NULL,
  `soju` int DEFAULT NULL,
  `beer` int DEFAULT NULL,
  `milk` int DEFAULT NULL,
  `water` int DEFAULT NULL,
  `point` int DEFAULT NULL,
  PRIMARY KEY (`custid`),
  CONSTRAINT `bottle_ibfk_1` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottle`
--

LOCK TABLES `bottle` WRITE;
/*!40000 ALTER TABLE `bottle` DISABLE KEYS */;
INSERT INTO `bottle` VALUES ('khhong',4,2,1,4,1280);
/*!40000 ALTER TABLE `bottle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `custid` varchar(50) NOT NULL,
  `productid` int NOT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`custid`,`productid`),
  KEY `cart_items_ibfk_2` (`productid`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `online_product` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `custid` varchar(50) NOT NULL,
  `passwd` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `level` varchar(40) DEFAULT NULL,
  `admin` int DEFAULT NULL,
  PRIMARY KEY (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('admin','1234','관리자','얏호','01082828282',NULL,NULL,1),('khhong','1111','홍기형','충남','02-920-7525',NULL,NULL,0),('offlineadmin','1234','관리자','이얏호','01082821818',NULL,NULL,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `board_id` int NOT NULL,
  `custid` varchar(50) NOT NULL,
  `board_title` varchar(100) NOT NULL,
  `board_content` varchar(1000) NOT NULL,
  `board_date` date NOT NULL,
  PRIMARY KEY (`board_id`),
  KEY `fk_faq_customer1_idx` (`custid`),
  CONSTRAINT `fk_faq_customer1` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,'admin','대량 주문하고 싶어요.','대량 주문을 희망하실 경우 \' QnA\' 게시판을 통해 문의해주시면 확인 후 담당자가 연락을 드리도록 하겠습니다.','2020-12-06'),(2,'admin','상품을 포장 없이 구매하고 싶어요.','Fromzero 내 제품은 가급적 포장없이 제공하고 있습니다.\r다만, 제조사 측의 요청이나 제품 위생상 포장이 반드시 필요한 경우,\r제품의 안전한 배송을 위해 포장이 필요한 경우 등 포장된 제품도 있으니 구매에 참고 부탁드립니다.\r포장이 필요한 경우, 자원의 낭비를 최소화 하기위해 다중포장 되지 않도록 노력하고 있습니다.','2020-12-06'),(3,'admin','상품을 주문했는데 아직 배송을 받지 못 했어요.','지구샵은 주문일로부터 약 1~3일 내에 제품을 출고하고 있습니다. 따라서 고객님께서 제품을 수령하시기까지 약 3~5일가량 소요될 수 있습니다. 주문일로부터 5일 이상이 지난 후에도 별도의 연락을 받지 못하셨거나 배송이 되지 않았을 경우 고객센터를 통해 문의주시면 친절히 안내해드리도록 하겠습니다.','2020-12-06'),(4,'admin','불량/오배송의 경우 택배비를 부담해야 하나요?','불량/오배송 등 판매자 귀책사유로 인한 반품/교환의 경우 택배비를 모두 부담하고 있습니다.','2020-12-06'),(5,'admin','비닐이나 플라스틱 없이 어떻게 안전하게 배송되는지 궁금해요.','Fromzero의 모든 배송은 원칙적으로 플라스틱 없이 제공되고 있습니다. 상품의 안전한 배송을 위해 종이완충재를 사용하여 배송되며, 그 외 모든 택배 부자재 또한 종이를 사용합니다. 다만, 장마 기간 혹은 우천이 예상되는 경우, 제품의 안전을 위해 재사용 비닐 혹은 생분해성 비닐이 사용될 수도 있는 점 양해 부탁드립니다.','2020-12-06');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `board_id` int NOT NULL,
  `custid` varchar(50) NOT NULL,
  `board_title` varchar(100) NOT NULL,
  `board_content` varchar(1000) NOT NULL,
  `board_date` date NOT NULL,
  PRIMARY KEY (`board_id`),
  KEY `fk_notice_customer1_idx` (`custid`),
  CONSTRAINT `fk_notice_customer1` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_order`
--

DROP TABLE IF EXISTS `offline_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_order` (
  `orderid` int NOT NULL,
  `custid` varchar(50) DEFAULT NULL,
  `storeid` int DEFAULT NULL,
  `allprice` int DEFAULT NULL,
  `orderdate` date DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `custid` (`custid`),
  CONSTRAINT `offline_order_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `offline_order_items` (`orderid`),
  CONSTRAINT `offline_order_ibfk_2` FOREIGN KEY (`custid`) REFERENCES `offline_order_items` (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_order`
--

LOCK TABLES `offline_order` WRITE;
/*!40000 ALTER TABLE `offline_order` DISABLE KEYS */;
INSERT INTO `offline_order` VALUES (1,'admin',1,22000,'2020-12-06');
/*!40000 ALTER TABLE `offline_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_order_items`
--

DROP TABLE IF EXISTS `offline_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_order_items` (
  `orderid` int NOT NULL,
  `productid` int NOT NULL,
  `custid` varchar(50) DEFAULT NULL,
  `storeid` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`orderid`,`productid`),
  KEY `custid` (`custid`),
  CONSTRAINT `offline_order_items_ibfk_1` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_order_items`
--

LOCK TABLES `offline_order_items` WRITE;
/*!40000 ALTER TABLE `offline_order_items` DISABLE KEYS */;
INSERT INTO `offline_order_items` VALUES (1,100,'admin',1,2);
/*!40000 ALTER TABLE `offline_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_product`
--

DROP TABLE IF EXISTS `offline_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_product` (
  `offlineproduct_id` int NOT NULL AUTO_INCREMENT,
  `storeid` int DEFAULT NULL,
  `offlineproduct_name` varchar(45) DEFAULT NULL,
  `offlineproduct_num` int DEFAULT NULL,
  `offlineproduct_price` int DEFAULT NULL,
  `orderdate` int DEFAULT NULL,
  PRIMARY KEY (`offlineproduct_id`),
  KEY `storeid_idx` (`storeid`)
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_product`
--

LOCK TABLES `offline_product` WRITE;
/*!40000 ALTER TABLE `offline_product` DISABLE KEYS */;
INSERT INTO `offline_product` VALUES (100,1,'소프넛',NULL,11000,NULL),(101,1,'플레이니스트(빨래, 설거지)',NULL,9000,NULL),(102,1,'에코띠크 세탁세제',NULL,3500,NULL),(103,1,'에코띠크 섬유유연제',NULL,3500,NULL),(104,1,'구연산',NULL,2000,NULL),(105,1,'탄산수소나트륨(베이킹소다)',NULL,2000,NULL),(106,1,'과탄산소다(빨래)',NULL,2500,NULL),(107,1,'생활공작소(주방세제)',NULL,2500,NULL),(108,1,'바이오 크린콜',NULL,3500,NULL),(200,2,'설거지 비누',NULL,6500,NULL),(201,2,'천연수세미3개입',NULL,9900,NULL),(202,2,'브라질넛',NULL,50,NULL),(203,2,'헤이즐넛',NULL,35,NULL),(204,2,'캐슈넛',NULL,35,NULL),(205,2,'통밀쿠키(비건)',NULL,400,NULL),(206,2,'초코호두(비건)',NULL,600,NULL),(300,3,'자연분해 일회용 접시',NULL,1500,NULL),(301,3,'재사용 소창 화장지',NULL,25000,NULL),(302,3,'재사용 휴대용 소창와압스',NULL,10000,NULL),(303,3,'소창 바게트 주머니',NULL,7000,NULL),(304,3,'천연 실크 치실',NULL,7000,NULL),(305,3,'A5 크라프트 무지노트',NULL,1500,NULL),(306,3,'병아리콩',NULL,4000,NULL),(307,3,'유기농 국산 햇귀리',NULL,7500,NULL),(308,3,'쌀 파스타(펜네)',NULL,8500,NULL),(309,3,'브라운 렌틸콩',NULL,3000,NULL),(400,4,'친환경 노트',NULL,1000,NULL),(401,4,'삼베수세미',NULL,10000,NULL),(402,4,'손수건',NULL,3500,NULL),(403,4,'밀랍초',NULL,5000,NULL),(404,4,'소프넛',NULL,11000,NULL),(405,4,'천 마스크',NULL,5000,NULL),(406,4,'빨대키트',NULL,10000,NULL),(407,4,'대나무 칫솔',NULL,2000,NULL),(500,5,'칫솔 파우치',NULL,3000,NULL),(501,5,'혀클리너',NULL,7000,NULL),(502,5,'닥터노아 어린이 칫솔',NULL,3700,NULL),(503,5,'수세미 병솔(납작형)',NULL,7000,NULL),(504,5,'설거지 수세미 S',NULL,4000,NULL),(505,5,'다용도 집게',NULL,1000,NULL),(506,5,'고체치약',NULL,14000,NULL),(600,6,'삼베 주머니',NULL,2400,NULL),(601,6,'고체치약(120정)',NULL,13900,NULL),(602,6,'팜프리 비누',NULL,6800,NULL),(603,6,'비즈왁스랩(밀랍랩)',NULL,4500,NULL),(604,6,'다회용 소창 티백',NULL,3500,NULL);
/*!40000 ALTER TABLE `offline_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_store`
--

DROP TABLE IF EXISTS `offline_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_store` (
  `storeid` int NOT NULL,
  `storename` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`storeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_store`
--

LOCK TABLES `offline_store` WRITE;
/*!40000 ALTER TABLE `offline_store` DISABLE KEYS */;
INSERT INTO `offline_store` VALUES (1,'알맹상점','서울 마포구 합정동 월드컵로 49 한우마을 2층','0507-1393-8913'),(2,'지구샵','서울 동작구 상도동 성대로1길 16','070-7640-4940'),(3,'더피커','서울 성동구 왕십리로 115 헤이그라운드 9층','070-4118-0710'),(4,'라마홈','서울 종로구 자하문로 48 1층 ','0507-1300-3042'),(5,'송포어스','서울 강동구 풍성로35길 34 1층','070-8095-3534'),(6,'디어얼스','서울 서대문구 수색로 43 104호','0507-1300-3388');
/*!40000 ALTER TABLE `offline_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_order`
--

DROP TABLE IF EXISTS `online_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_order` (
  `orderid` int NOT NULL,
  `custid` varchar(50) NOT NULL,
  `allprice` int NOT NULL,
  `orderdate` date NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `online_order_ibfk_2` (`custid`),
  CONSTRAINT `online_order_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `order_items` (`orderid`),
  CONSTRAINT `online_order_ibfk_2` FOREIGN KEY (`custid`) REFERENCES `order_items` (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_order`
--

LOCK TABLES `online_order` WRITE;
/*!40000 ALTER TABLE `online_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `online_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_product`
--

DROP TABLE IF EXISTS `online_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_product` (
  `productid` int NOT NULL,
  `productname` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `big_category` varchar(45) DEFAULT NULL,
  `small_category` varchar(45) DEFAULT NULL,
  `img` int NOT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_product`
--

LOCK TABLES `online_product` WRITE;
/*!40000 ALTER TABLE `online_product` DISABLE KEYS */;
INSERT INTO `online_product` VALUES (1,'제로웨이스트 입문 키트','더피커',12000,'kit',NULL,1),(2,'스텐 고리집게(5p.)','더피커',4000,'living','집게',8),(3,'소창 2겹 행주','더피커',4000,'bathroom','타월',1),(4,'비누 틴케이스','더피커',4500,'etc',NULL,4),(5,'유기농 메쉬 파우치(S)','더피커',3000,'living','주머니/가방',4),(6,'휴대용 소창와입스(4매입)','더피커',11000,'bathroom','타월',12),(7,'스텐 미니집게(10pcs.)','더피커',4000,'living','집게',9),(8,'유기농 메쉬 프로듀스백','더피커',4000,'living','주머니/가방',10),(9,'광목 빨대 주머니','더피커',3000,'living','주머니/가방',5),(10,'신문지연필(5ea)','더피커',2000,'etc',NULL,2),(11,'[책] 오늘을 조금 바꿉니다','더피커',13410,'living','책/노트',24),(12,'팔로산토 우드스틱','더피커',10000,'etc',NULL,6),(13,'[책] 채식연습','더피커',15120,'living','책/노트',26),(14,'유기농면 프로듀스백','더피커',4500,'living','주머니/가방',11),(15,'그랩 리페어 밀랍블록','더피커',1500,'kitchen','밀랍/시트',1),(16,'유기농 순면생리대 누르Nur.','더피커',6500,'etc',NULL,5),(17,'네츄럴 린넨 손수건','더피커',4000,'bathroom','타월',2),(18,'크라프트 무지 만년 위클리','더피커',2000,'living','책/노트',1),(19,'재생종이 볼펜','더피커',1500,'etc',NULL,1),(20,'소락 유기농 튤립백','더피커',6000,'living','주머니/가방',15),(21,'[책]지구생활안내서 바질','더피커',13000,'living','책/노트',20),(22,'유기농 하프메쉬 에코백','더피커',12000,'living','주머니/가방',19),(23,'[책]그건 쓰레기가 아니라고요','더피커',14400,'living','책/노트',25),(24,'재활용 페트병 마켓백','더피커',13000,'living','주머니/가방',21),(25,'에코백','더피커',8000,'living','주머니/가방',17),(26,'A5 크라프트 무지노트','더피커',2000,'living','책/노트',2),(27,'대나무 연필깎이','더피커',2000,'etc',NULL,3),(28,'스테인리스 빨대(일자형)','더피커',3000,'living','빨대',6),(29,'프로듀스백 (M)','더피커',6000,'living','주머니/가방',16),(30,'재활용면 텀블러 가방','더피커',13000,'living','주머니/가방',22),(31,'[책] 매거진쓸[SSSSL]','더피커',13000,'living','책/노트',23),(32,'유기농 스트링 에코백','더피커',10000,'living','주머니/가방',18),(33,'하누만 요가매트','더피커',149000,'etc',NULL,7),(34,'소창 프로듀스백(M)','더피커',5500,'living','주머니/가방',14),(35,'유기농 설거지 비누','더피커',8000,'kitchen','설거지',7),(36,'유기농 재사용 커피필터','더피커',4000,'kitchen','밀랍/시트',2),(37,'쇼트 유리빨대(단품/세트)','더피커',5000,'living','빨대',12),(38,'다회용 밀랍 주방랩(M/L)','더피커',4500,'kitchen','밀랍/시트',4),(39,'사이잘 빨대 세척솔','더피커',2000,'living','빨대',3),(40,'설거지용 팟 브러쉬','더피커',6000,'kitchen','설거지',5),(41,'소창 3겹 핸드타월','더피커',8000,'bathroom','타월',9),(42,'설거지용 롱핸들 브러쉬','더피커',6500,'kitchen','설거지',6),(43,'스테인리스 빨대(ㄱ자형)','더피커',3500,'living','빨대',7),(44,'천연 설거지 수세미 (S/L)','더피커',4000,'kitchen','설거지',3),(45,'다회용 밀랍 푸드백(S/L)','더피커',5000,'living','주머니/가방',13),(46,'생분해 천연 치실/리필','더피커',7000,'bathroom','샤워',6),(47,'친환경 대나무 칫솔','더피커',5500,'bathroom','샤워',5),(48,'유기농 햄프코튼 재사용 화장솜','더피커',12000,'bathroom','타월',13),(50,'스테인리스 혀클리너','더피커',7000,'bathroom','샤워',7),(51,'천연 목욕수세미(어린수세미)','더피커',4000,'bathroom','샤워',3),(52,'천연 비누주머니','더피커',5000,'bathroom','비누',4),(53,'유기농 온몸비누 제주','더피커',8000,'bathroom','비누',10),(54,'소창 2겹 세안수건','더피커',7000,'bathroom','타월',8),(55,'천연 수세미 목욕장갑','더피커',10000,'bathroom','샤워',11),(56,'플랑드비 올라이트 바디솝','더피커',17000,'bathroom','비누',14),(57,'재사용 화장지(10매입)','더피커',25000,'bathroom','샤워',15),(58,'제로웨이스트 구강위생 키트','더피커',22000,'kit',NULL,2),(59,'[예고은] 삼베수세미(3개입)','지구샵',8500,'kitchen','설거지',22),(60,'주방비누','지구샵',5200,'kitchen','설거지',16),(61,'[소렉스] 과일채소 세척솔','지구샵',6000,'kitchen','설거지',17),(62,'[예고은] 삼베행주','지구샵',7900,'bathroom','타월',32),(63,'밀랍랩 비기너세트(3매입)','지구샵',10000,'kitchen','밀랍/시트',25),(64,'[소렉스] 보틀 세척솔','지구샵',10000,'kitchen','설거지',26),(65,'[소렉스] 구리수세미 3pcs','지구샵',10000,'kitchen','설거지',27),(66,'[손끋비] 밀랍랩(Large)','지구샵',7000,'kitchen','밀랍/시트',20),(67,'[예고은] 삼베찜시트','지구샵',6200,'kitchen','밀랍/시트',19),(68,'[소렉스] 팬용 세척솔','지구샵',7000,'kitchen','설거지',21),(69,'[손끋비] 밀랍랩(Small)','지구샵',5000,'kitchen','밀랍/시트',15),(70,'밀랍랩 DIY세트','지구샵',9900,'kitchen','밀랍/시트',23),(71,'[레데커] 스크럽 세척솔','지구샵',6000,'kitchen','설거지',18),(72,'천연 물방울수세미','지구샵',3500,'kitchen','설거지',13),(73,'천연 통수세미','지구샵',3500,'kitchen','설거지',14),(74,'천연물방울수세미(3개입)','지구샵',9900,'kitchen','설거지',24),(75,'고체치약','지구샵',5900,'bathroom','샤워',31),(76,'대나무칫솔(성인/어린이용)','지구샵',3500,'bathroom','샤워',29),(77,'[소락] 면화장솜 4pcs','지구샵',10000,'bathroom','타월',33),(78,'[예고은] 삼베샤워타월','지구샵',11900,'bathroom','샤워',35),(79,'칫솔 파우치','지구샵',3500,'living','주머니/가방',38),(80,'오리지널 샴푸바','지구샵',15000,'bathroom','비누',37),(81,'유기농 핸드타월 (3매)','지구샵',12000,'bathroom','타월',36),(82,'안티로쓰 샴푸바(탈모방지)','지구샵',18000,'bathroom','비누',40),(83,'[솝퓨리]네버드라이 페이셜바','지구샵',15000,'bathroom','비누',38),(84,'유기농 수건 (3매)','지구샵',19500,'bathroom','타월',42),(85,'리치리치 샴푸바(건성용)','지구샵',18000,'bathroom','비누',41),(86,'오오클렌징바(여성청결제)','지구샵',24000,'bathroom','비누',43),(87,'노세범 샴푸바(지성용)','지구샵',16000,'bathroom','비누',39),(88,'스테인레스 칫솔걸이','지구샵',4000,'bathroom','샤워',30),(89,'면비누망','지구샵',2500,'bathroom','비누',28),(90,'[소락] 유기농 면마스크','지구샵',6000,'etc',NULL,14),(91,'휴대용 와입스(4매입)','지구샵',11000,'bathroom','타월',34),(92,'메쉬백','지구샵',8000,'living','주머니/가방',40),(93,'프로듀스백','지구샵',4000,'living','주머니/가방',39),(94,'[프리다]플로우 밀랍초','지구샵',10000,'etc',NULL,15),(95,'[프리다]생일초','지구샵',1000,'etc',NULL,11),(96,'[프리다]꽈배기 생일초','지구샵',1100,'etc',NULL,12),(97,'[프리다]노랑성냥','지구샵',4000,'etc',NULL,13),(98,'[루디아의베틀] 미니크로스백','지구샵',45600,'living','주머니/가방',44),(99,'[바잇미] 미니에코백','지구샵',8900,'living','주머니/가방',41),(100,'[프리다]담금초 세트','지구샵',52000,'kit',NULL,6),(101,'[프리다]흐르는 작은 초','지구샵',22000,'etc',NULL,17),(102,'[바잇미] 데일리 산책가방','지구샵',30900,'living','주머니/가방',42),(103,'[프리다]코르크 밀랍초','지구샵',20000,'etc',NULL,16),(104,'[루디아의베틀] 루디아백','지구샵',40000,'living','주머니/가방',43),(105,'[루디아의베틀] 코스타백','지구샵',74600,'living','주머니/가방',45),(106,'주방용 다용도 천연 수세미','제로웨이스트샵',800,'kitchen','설거지',8),(107,'내열 유리빨대 4종 세트','제로웨이스트샵',6600,'living','빨대',29),(108,'유리빨대 파우치 세트','제로웨이스트샵',9900,'living','주머니/가방',30),(109,'내열 유리빨대 스무디용','제로웨이스트샵',2000,'living','빨대',28),(110,'내열 유리빨대 일반용 8mm','제로웨이스트샵',1500,'living','빨대',27),(111,'미세모 대나무 칫솔','제로웨이스트샵',980,'bathroom','샤워',16),(112,'천연 루파 수세미 열매','지구살림e',3790,'kitchen','설거지',9),(113,'강화 소창 2겹 행주','지구살림e',2100,'bathroom','타월',20),(114,'프리미엄 강화 소창 와입스','지구살림e',1350,'bathroom','타월',18),(115,'친환경 스테인리스 빨대','지구살림e',500,'living','빨대',31),(116,'[e,art] 스텐 훅 집게','지구살림e',500,'living','집게',32),(117,'E,art 디쉬바 옐루칼립투스','지구살림e',5000,'kitchen','설거지',12),(118,'프리미엄 강화 소창 원단','지구살림e',2900,'living','타월',35),(119,'[E,art] 광목 주머니','지구살림e',1800,'living','주머니/가방',34),(120,'[E,art] 삼베 수세미','지구살림e',3790,'kitchen','설거지',10),(121,'E,art 친환경 대나무 빨대','지구살림e',1300,'living','빨대',33),(122,'천연 루파 텀블러 세척솔','지구살림e',4790,'kitchen','설거지',11),(123,'강화 소창 2겹 행주 5장 세트','지구살림e',12000,'kit',NULL,4),(124,'E,art 린넨 롱 앞치마','지구살림e',35800,'etc',NULL,10),(125,'E,art 골드 머그 1P','지구살림e',12500,'etc',NULL,8),(126,'E,art 포켓 장바구니','지구살림e',17800,'living','주머니/가방',37),(127,'제로웨이스트 네트백','지구살림e',4000,'living','주머니/가방',36),(128,'심플리 하프 에이프런 2종','지구살림e',18000,'etc',NULL,9),(129,'프리미엄 집들이 선물 세트','지구살림e',21300,'kit',NULL,5),(130,'과탄산소다 소창행주 정련 세제','지구살림e',3900,'bathroom','타월',21),(131,'밀랍초 비즈왁스 세트','지구살림e',11000,'kit',NULL,3),(132,'대나무 칫솔','지구살림e',1250,'bathroom','샤워',17),(133,'저자극 오이가지 바디 비누','지구살림e',6000,'bathroom','비누',24),(134,'프리미엄 소창 목욕수건','지구살림e',8300,'bathroom','타월',25),(135,'[E,art] 삼베 샤워타월','지구살림e',8300,'bathroom','샤워',26),(136,'규조토 비누 받침 사각 트레이','지구살림e',2000,'bathroom','비누',19),(137,'강화 소창 3겹 수건','지구살림e',5200,'bathroom','타월',23),(138,'저자극 바질 클렌징 비누','지구살림e',5000,'bathroom','비누',22),(139,'[e,art] 재사용 화장솜','지구살림e',8990,'bathroom','타월',27);
/*!40000 ALTER TABLE `online_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `orderid` int NOT NULL,
  `productid` int NOT NULL,
  `custid` varchar(50) NOT NULL,
  `count` int NOT NULL,
  PRIMARY KEY (`orderid`,`productid`),
  KEY `custid` (`custid`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `board_id` int NOT NULL,
  `custid` varchar(50) NOT NULL,
  `board_title` varchar(100) NOT NULL,
  `board_content` varchar(1000) NOT NULL,
  `board_date` date NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`board_id`),
  UNIQUE KEY `customer_custid_UNIQUE` (`custid`),
  KEY `fk_qna_customer1_idx` (`custid`),
  CONSTRAINT `fk_qna_customer1` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna_comment`
--

DROP TABLE IF EXISTS `qna_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna_comment` (
  `comment_id` int NOT NULL,
  `custid` varchar(50) DEFAULT NULL,
  `board_id` int DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `custid` (`custid`),
  KEY `board_id` (`board_id`),
  CONSTRAINT `qna_comment_ibfk_1` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`),
  CONSTRAINT `qna_comment_ibfk_2` FOREIGN KEY (`board_id`) REFERENCES `qna` (`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna_comment`
--

LOCK TABLES `qna_comment` WRITE;
/*!40000 ALTER TABLE `qna_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fz_webapp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-11  2:09:38
DROP TABLE IF EXISTS `eco_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eco_tip` (
  `name` varchar(50)  NOT NULL,
  `count` int NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `eco_tip` VALUES ('food', 5, '미세먼지에 좋은 음식');
INSERT INTO `eco_tip` VALUES ('plant', 4, '미세먼지 잡는 반려식물');
INSERT INTO `eco_tip` VALUES ('hand_washing', 5, '깨끗한 손씻기');
INSERT INTO `eco_tip` VALUES ('mask', 6, '우리를 지켜줄 미세먼지 마스크');
INSERT INTO `eco_tip` VALUES ('recycle', 6, '똑! 소리나는 분리수거 방법');
INSERT INTO `eco_tip` VALUES ('bangle', 10, '테니스 선수 팔에 채워진 팔찌?');
INSERT INTO `eco_tip` VALUES ('cotton_pad', 10, '화장솜 아직도 일회용 쓰니?');
INSERT INTO `eco_tip` VALUES ('no_plastic', 9, '플라스틱 쓰레기 없는 손 세정제?');
INSERT INTO `eco_tip` VALUES ('photo', 10, '버리는 종이컵으로 사진 뽑기?');
INSERT INTO `eco_tip` VALUES ('santa', 10, '친환경 산타의 선물?');
INSERT INTO `eco_tip` VALUES ('shampoo', 7, '샴푸를 어떻게 버리셨나요?');