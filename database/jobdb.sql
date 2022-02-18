-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: jobdb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `id` int NOT NULL AUTO_INCREMENT,
  `applied_date` date DEFAULT NULL,
  `id_seeker` int DEFAULT NULL,
  `id_job` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_appl_seeker_idx` (`id_seeker`),
  KEY `fk_appl_job_idx` (`id_job`),
  CONSTRAINT `fk_appl_job` FOREIGN KEY (`id_job`) REFERENCES `job` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_appl_seeker` FOREIGN KEY (`id_seeker`) REFERENCES `seeker` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (11,'2022-02-18',9,2);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `career`
--

DROP TABLE IF EXISTS `career`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `career` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `career`
--

LOCK TABLES `career` WRITE;
/*!40000 ALTER TABLE `career` DISABLE KEYS */;
INSERT INTO `career` VALUES (1,'C#'),(2,'C++'),(3,'Machine Learning'),(4,'NodeJS'),(5,'JAVA'),(6,'.NET'),(7,'React Native'),(8,'ReactJS'),(9,'Tester'),(10,'Web'),(11,'UI/UX'),(12,'Designer'),(13,'Python'),(14,'Data Analyst'),(15,'Cloud'),(16,'ASP.NET'),(17,'Lararel'),(18,'Other');
/*!40000 ALTER TABLE `career` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comp_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comp_user_idx` (`id_user`),
  CONSTRAINT `fk_comp_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Công ty TNHH Việt Tiến','www.l.ex','https://res.cloudinary.com/bh1208jobportal/image/upload/v1644589878/mh99ajutpb38w7rkzobi.png','123','Hồ Chí Minh',2),(2,'Công ty bảo hiểm','www','https://res.cloudinary.com/bh1208jobportal/image/upload/v1644828693/sfccxrnyqfxkeextlok3.jpg','12344234','256/1/4 Dương  Quảng Hàm',4),(3,'Công ty TNHH Việt Tiến','www.l.ex','https://res.cloudinary.com/bh1208jobportal/image/upload/v1644830858/subicfutyvysof7t296u.jpg','123','Hồ Chí Minh',5),(5,'Vinaled Company','www.vinaled.com','https://res.cloudinary.com/bh1208jobportal/image/upload/v1645171188/zmcpzbxifx4bfhjupqos.jpg','000000000','256/1/3 Duong Quan Ham Street',8),(6,'Global Care','www.globalcare.com','https://res.cloudinary.com/bh1208jobportal/image/upload/v1645197112/xceutwxqzfecpmk503gn.jpg','000000000','Ho Chi Minh',9);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv`
--

DROP TABLE IF EXISTS `cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_seeker` int DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_salary` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_salary` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_career` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cv_seeker_idx` (`id_seeker`),
  KEY `fk_cv_career_idx` (`id_career`),
  CONSTRAINT `fk_cv_career` FOREIGN KEY (`id_career`) REFERENCES `career` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cv_seeker` FOREIGN KEY (`id_seeker`) REFERENCES `seeker` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv`
--

LOCK TABLES `cv` WRITE;
/*!40000 ALTER TABLE `cv` DISABLE KEYS */;
INSERT INTO `cv` VALUES (6,9,'UX/UI','300','1000','ABC',11);
/*!40000 ALTER TABLE `cv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education` (
  `id` int NOT NULL AUTO_INCREMENT,
  `degree` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `schoolname` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `id_seeker` int DEFAULT NULL,
  `industry` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_edu_seeker_idx` (`id_seeker`),
  CONSTRAINT `fk_edu_seeker` FOREIGN KEY (`id_seeker`) REFERENCES `seeker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,'Master','Open Univercity',9,'Information Technology');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_seeker` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_exp_seeker_idx` (`id_seeker`),
  CONSTRAINT `fk_exp_seeker` FOREIGN KEY (`id_seeker`) REFERENCES `seeker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (2,'Designer','Global Care','Less than 1 year',9);
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `salary` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exp` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_comp` int NOT NULL,
  `id_career` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_job_comp_idx` (`id_comp`),
  KEY `fk_job_career_idx` (`id_career`),
  CONSTRAINT `fk_job_career` FOREIGN KEY (`id_career`) REFERENCES `career` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_job_comp` FOREIGN KEY (`id_comp`) REFERENCES `company` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (2,'Tech Lead','Full-time','ABC','Ho Chi Minh','2022-02-17','1233','EXXC',1,NULL),(3,'Tech Lead','Part-time','ABC','Ho Chi Minh','2022-02-17','11223344','EXXC',1,NULL),(5,'Technical Product Manager','Part-time','We\'re looking for an expert, curious, relentless, product enthusiast to join us at Faraday as Technical Product Manager.\r\n\r\nWhat Youâll Do:\r\n\r\nProduct Managers at Faraday have a defined area of ownership: a âdev teamâ representing a thematic slice of our offering with distinct OKRs. You are responsible for every aspect of your product area; we organize these duties into three categories.\r\n\r\nStrategic\r\n\r\nSolicit input and gather feedback from internal stakeholders to inform product direction\r\nSolicit and gather feedback from clients on product satisfaction and priorities (VOC)\r\nMonitor product analytics to ascertain real-world usage\r\nAssess product opportunities for TAM and revenue potential\r\nMaintain forward-looking roadmap incorporating all of the above\r\nIdentify and propose opportunities to sunset product features\r\nTechnical\r\n\r\nProduct zealotry: fierce, constructive criticism defending us from mediocrity\r\nParticipate in iteration grooming to proactively identify high leverage opportunities and provide an independent assessment of technology possibilities and challenges\r\nProvide initial technical assessments of requested work and suggested implementation outline\r\nWork with engineering to determine effort and complexity of requested work\r\nDefine and document product âboundariesâ: supported versus unsupported functionality\r\nTrain affected staff on all product change/new featuresâor delegate to the appropriate SME\r\nOperational\r\n\r\nSolicit product priorities from internal stakeholders\r\nSynthesize stakeholder priorities to organize roadmap into iterations, seeking an appropriate demand balance\r\nFacilitate grooming efforts to capture estimates, implementation details, etc.\r\nManage and maintain a predictable, reliable iteration calendar\r\nStructure and launch iterations in project management software\r\nReport on iteration progress and completion\r\nEnsure downstream stakeholders receive adequate notification and communication on upcoming releases, including training as appropriate','Ho Chi Minh','2022-02-18','5000','Faraday is prediction infrastructure for the consumer economy. Located in the historic Maltex Building in beautiful Burlington, Vermont, we\'re a fast-growing venture-backed startup founded in 2012. We believe in privacy and are committed to ending the widespread proliferation of consumer data. We believe in science and the power of statistically significant conclusions. We believe in equity and reject all forms of algorithmic prejudice. We believe in health and fun and encourage a positive work/life balance.',2,6),(6,'ServiceNow Consultant','Intership','We\'re looking for an expert, curious, relentless, product enthusiast to join us at Faraday as Technical Product Manager.\r\n \r\n What YouÃ¢ÂÂll Do:\r\n \r\n Product Managers at Faraday have a defined area of ownership: a Ã¢ÂÂdev teamÃ¢ÂÂ representing a thematic slice of our offering with distinct OKRs. You are responsible for every aspect of your product area; we organize these duties into three categories.\r\n \r\n Strategic\r\n \r\n Solicit input and gather feedback from internal stakeholders to inform product direction\r\n Solicit and gather feedback from clients on product satisfaction and priorities (VOC)\r\n Monitor product analytics to ascertain real-world usage\r\n Assess product opportunities for TAM and revenue potential\r\n Maintain forward-looking roadmap incorporating all of the above\r\n Identify and propose opportunities to sunset product features\r\n Technical\r\n \r\n Product zealotry: fierce, constructive criticism defending us from mediocrity\r\n Participate in iteration grooming to proactively identify high leverage opportunities and provide an independent assessment of technology possibilities and challenges\r\n Provide initial technical assessments of requested work and suggested implementation outline\r\n Work with engineering to determine effort and complexity of requested work\r\n Define and document product Ã¢ÂÂboundariesÃ¢ÂÂ: supported versus unsupported functionality\r\n Train affected staff on all product change/new featuresÃ¢ÂÂor delegate to the appropriate SME\r\n Operational\r\n \r\n Solicit product priorities from internal stakeholders\r\n Synthesize stakeholder priorities to organize roadmap into iterations, seeking an appropriate demand balance\r\n Facilitate grooming efforts to capture estimates, implementation details, etc.\r\n Manage and maintain a predictable, reliable iteration calendar\r\n Structure and launch iterations in project management software\r\n Report on iteration progress and completion\r\n Ensure downstream stakeholders receive adequate notification and communication on upcoming releases, including training as appropriate','Ho Chi Minh','2022-02-18','3000','Faraday is prediction infrastructure for the consumer economy. Located in the historic Maltex Building in beautiful Burlington, Vermont, we\'re a fast-growing venture-backed startup founded in 2012. We believe in privacy and are committed to ending the widespread proliferation of consumer data. We believe in science and the power of statistically significant conclusions. We believe in equity and reject all forms of algorithmic prejudice. We believe in health and fun and encourage a positive work/life balance.',1,13),(7,'Data Analyst','Part-time','We\'re looking for an expert, curious, relentless, product enthusiast to join us at Faraday as Technical Product Manager.\r\n \r\n What YouÃ¢ÂÂll Do:\r\n \r\n Product Managers at Faraday have a defined area of ownership: a Ã¢ÂÂdev teamÃ¢ÂÂ representing a thematic slice of our offering with distinct OKRs. You are responsible for every aspect of your product area; we organize these duties into three categories.\r\n \r\n Strategic\r\n \r\n Solicit input and gather feedback from internal stakeholders to inform product direction\r\n Solicit and gather feedback from clients on product satisfaction and priorities (VOC)\r\n Monitor product analytics to ascertain real-world usage\r\n Assess product opportunities for TAM and revenue potential\r\n Maintain forward-looking roadmap incorporating all of the above\r\n Identify and propose opportunities to sunset product features\r\n Technical\r\n \r\n Product zealotry: fierce, constructive criticism defending us from mediocrity\r\n Participate in iteration grooming to proactively identify high leverage opportunities and provide an independent assessment of technology possibilities and challenges\r\n Provide initial technical assessments of requested work and suggested implementation outline\r\n Work with engineering to determine effort and complexity of requested work\r\n Define and document product Ã¢ÂÂboundariesÃ¢ÂÂ: supported versus unsupported functionality\r\n Train affected staff on all product change/new featuresÃ¢ÂÂor delegate to the appropriate SME\r\n Operational\r\n \r\n Solicit product priorities from internal stakeholders\r\n Synthesize stakeholder priorities to organize roadmap into iterations, seeking an appropriate demand balance\r\n Facilitate grooming efforts to capture estimates, implementation details, etc.\r\n Manage and maintain a predictable, reliable iteration calendar\r\n Structure and launch iterations in project management software\r\n Report on iteration progress and completion\r\n Ensure downstream stakeholders receive adequate notification and communication on upcoming releases, including training as appropriate','Ho Chi Minh','2022-02-18','1000','Faraday is prediction infrastructure for the consumer economy. Located in the historic Maltex Building in beautiful Burlington, Vermont, we\'re a fast-growing venture-backed startup founded in 2012. We believe in privacy and are committed to ending the widespread proliferation of consumer data. We believe in science and the power of statistically significant conclusions. We believe in equity and reject all forms of algorithmic prejudice. We believe in health and fun and encourage a positive work/life balance.',1,14),(8,'UX/UI','Part-time','We\'re looking for an expert, curious, relentless, product enthusiast to join us at Faraday as Technical Product Manager.\r\n \r\n What YouÃ¢ÂÂll Do:\r\n \r\n Product Managers at Faraday have a defined area of ownership: a Ã¢ÂÂdev teamÃ¢ÂÂ representing a thematic slice of our offering with distinct OKRs. You are responsible for every aspect of your product area; we organize these duties into three categories.\r\n \r\n Strategic\r\n \r\n Solicit input and gather feedback from internal stakeholders to inform product direction\r\n Solicit and gather feedback from clients on product satisfaction and priorities (VOC)\r\n Monitor product analytics to ascertain real-world usage\r\n Assess product opportunities for TAM and revenue potential\r\n Maintain forward-looking roadmap incorporating all of the above\r\n Identify and propose opportunities to sunset product features\r\n Technical\r\n \r\n Product zealotry: fierce, constructive criticism defending us from mediocrity\r\n Participate in iteration grooming to proactively identify high leverage opportunities and provide an independent assessment of technology possibilities and challenges\r\n Provide initial technical assessments of requested work and suggested implementation outline\r\n Work with engineering to determine effort and complexity of requested work\r\n Define and document product Ã¢ÂÂboundariesÃ¢ÂÂ: supported versus unsupported functionality\r\n Train affected staff on all product change/new featuresÃ¢ÂÂor delegate to the appropriate SME\r\n Operational\r\n \r\n Solicit product priorities from internal stakeholders\r\n Synthesize stakeholder priorities to organize roadmap into iterations, seeking an appropriate demand balance\r\n Facilitate grooming efforts to capture estimates, implementation details, etc.\r\n Manage and maintain a predictable, reliable iteration calendar\r\n Structure and launch iterations in project management software\r\n Report on iteration progress and completion\r\n Ensure downstream stakeholders receive adequate notification and communication on upcoming releases, including training as appropriate','Ho Chi Minh','2022-02-18','3000','Faraday is prediction infrastructure for the consumer economy. Located in the historic Maltex Building in beautiful Burlington, Vermont, we\'re a fast-growing venture-backed startup founded in 2012. We believe in privacy and are committed to ending the widespread proliferation of consumer data. We believe in science and the power of statistically significant conclusions. We believe in equity and reject all forms of algorithmic prejudice. We believe in health and fun and encourage a positive work/life balance.',6,11);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` int unsigned NOT NULL,
  `id_seeker` int DEFAULT NULL,
  `id_comp` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rate_comp_idx` (`id_comp`),
  KEY `fk_rate_seeker_idx` (`id_seeker`),
  CONSTRAINT `fk_rate_comp` FOREIGN KEY (`id_comp`) REFERENCES `company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rate_seeker` FOREIGN KEY (`id_seeker`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit`
--

DROP TABLE IF EXISTS `recruit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cv` int DEFAULT NULL,
  `id_comp` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rec_comp_idx` (`id_comp`),
  KEY `fk_rec_cv_idx` (`id_cv`),
  CONSTRAINT `fk_rec_comp` FOREIGN KEY (`id_comp`) REFERENCES `company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rec_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit`
--

LOCK TABLES `recruit` WRITE;
/*!40000 ALTER TABLE `recruit` DISABLE KEYS */;
INSERT INTO `recruit` VALUES (1,6,1),(2,6,2),(3,6,3);
/*!40000 ALTER TABLE `recruit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seeker`
--

DROP TABLE IF EXISTS `seeker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seeker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seeker_user_idx` (`id_user`),
  CONSTRAINT `fk_seeker_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seeker`
--

LOCK TABLES `seeker` WRITE;
/*!40000 ALTER TABLE `seeker` DISABLE KEYS */;
INSERT INTO `seeker` VALUES (3,'Báº£o','Huá»³nh','123421','256/1/4 DÆ°Æ¡ng  Quáº£ng HÃ m',NULL,6),(4,'Báº£o','Huá»³nh','123421','256/1/4 DÆ°Æ¡ng  Quáº£ng HÃ m',NULL,6),(9,'Bao','Huynh The','0394872925','256/1/4 Duong Quang Ham',NULL,1);
/*!40000 ALTER TABLE `seeker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_seeker` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_skill_seeker_idx` (`id_seeker`),
  CONSTRAINT `fk_skill_seeker` FOREIGN KEY (`id_seeker`) REFERENCES `seeker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (4,'Communication',9);
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_img` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'seeker1','1@gmail.com','$2a$10$4WWd0JdiaUMwlmaZYx.hUONUIfUIUkvxyuvJ3KjuCEabvOUbxhXcW','https://res.cloudinary.com/bh1208jobportal/image/upload/v1644831122/z6kmilafowzikf4azmwf.jpg','ROLE_SEEKER'),(2,'company1','1@gmail.com','$2a$10$HuzMYvcsfV.II2IAwEejT.qbGMLGpZrC9Qdx.O0XtwWu.H8f/Aigm',NULL,'ROLE_COMPANY'),(4,'company2','kid03789125@gmail.com','$2a$10$n3THcxradJbhWNbPbsfI3Os9hTpAn6M3gIo7GqTqb/C5BajvxBkyu',NULL,'ROLE_COMPANY'),(5,'company3','1@gmail.com','$2a$10$pYZ89/d5F99uuihjG4QRLeS.vblinVcfF3KE6Tyyctcoh9OuBwEkC',NULL,'ROLE_COMPANY'),(6,'sktest1','a@gmail.com','$2a$10$/nz5oCLZOCt9gRtRG2F8f.UviPnagkhhfCYfjddwjJpV3SYeJijoi','https://res.cloudinary.com/bh1208jobportal/image/upload/v1644831122/z6kmilafowzikf4azmwf.jpg','ROLE_SEEKER'),(7,'seeker2','1@gmail.com','$2a$10$nAvY/rueje8xnkYB5JLhmOkTUNQnpJjQ1usl2IYCXneRQzRGXysJa','https://res.cloudinary.com/bh1208jobportal/image/upload/v1645023659/szp72jahyc6enqaxedso.jpg','ROLE_SEEKER'),(8,'company4','1@gmail.com','$2a$10$PnQsraVsESfNjpaGYE0ZwOXWkMTE2ZZbcoBe8qhHXOpq/C2KEjSSu',NULL,'ROLE_COMPANY'),(9,'company5','1@gmail.com','$2a$10$7nFsya.MQgS88151L//7POjCE8jJ5WlW55W0Ts1194EVVwxZk79fO',NULL,'ROLE_COMPANY'),(10,'admin1','a@gmail.com','$2a$10$3HZhMjpc7O7xflIFBZSl4eynslAl.79izXbajmB8HPRpDT49DPuAe',NULL,'ROLE_ADMIN');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-18 22:13:54
