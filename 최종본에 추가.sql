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
INSERT INTO `eco_tip` VALUES ('shampoo', 10, '샴푸를 어떻게 버리셨나요?');