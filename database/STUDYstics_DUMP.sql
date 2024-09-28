-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: studystics
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `applicationterms`
--
Create Schema studystics;
use studystics;

DROP TABLE IF EXISTS `applicationterms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicationterms` (
  `application_id` int NOT NULL AUTO_INCREMENT,
  `deadline` date DEFAULT NULL,
  `price` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicationterms`
--

LOCK TABLES `applicationterms` WRITE;
/*!40000 ALTER TABLE `applicationterms` DISABLE KEYS */;
INSERT INTO `applicationterms` VALUES (1,'2024-02-15',100),(2,'2024-03-15',100),(3,'2024-04-17',0),(4,'2024-12-15',150),(5,'2024-12-31',120);
/*!40000 ALTER TABLE `applicationterms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobopportunity`
--

DROP TABLE IF EXISTS `jobopportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobopportunity` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `junior_salary` decimal(12,0) DEFAULT NULL,
  `scientific_field` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobopportunity`
--

LOCK TABLES `jobopportunity` WRITE;
/*!40000 ALTER TABLE `jobopportunity` DISABLE KEYS */;
INSERT INTO `jobopportunity` VALUES (1,'Accountant',56000,'Economics '),(2,'Teacher',49000,'Education'),(3,'Architect',60000,'Architecture '),(4,'Logician ',50000,'Economics'),(5,'Lawyer',100000,'Law'),(6,'Consultant ',110000,'Papatzilikia');
/*!40000 ALTER TABLE `jobopportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `lesson_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`lesson_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,'High Voltage'),(2,'Linear Programming'),(3,'American History X'),(4,'Macroeconomics'),(5,'Microeconomics'),(6,'Calculus');
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `masters_info`
--

DROP TABLE IF EXISTS `masters_info`;
/*!50001 DROP VIEW IF EXISTS `masters_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `masters_info` AS SELECT 
 1 AS `Program Name`,
 1 AS `University`,
 1 AS `duration`,
 1 AS `price`,
 1 AS `city`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mastersprogram`
--

DROP TABLE IF EXISTS `mastersprogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mastersprogram` (
  `master_id` int NOT NULL AUTO_INCREMENT,
  `duration` double NOT NULL,
  `name` varchar(50) NOT NULL,
  `thesis` tinyint DEFAULT NULL,
  `internship` tinyint DEFAULT NULL,
  `delivered` enum('Online','On Campus','Hybrid') DEFAULT NULL,
  `price` decimal(12,0) NOT NULL,
  `university_code` varchar(10) NOT NULL,
  `requirement_id` int NOT NULL,
  `application_id` int NOT NULL,
  PRIMARY KEY (`master_id`),
  KEY `fk_university_code_masters` (`university_code`),
  KEY `requirement_id` (`requirement_id`),
  KEY `application_id` (`application_id`),
  CONSTRAINT `application_id` FOREIGN KEY (`application_id`) REFERENCES `applicationterms` (`application_id`),
  CONSTRAINT `fk_university_code_masters` FOREIGN KEY (`university_code`) REFERENCES `university` (`university_code`),
  CONSTRAINT `requirement_id` FOREIGN KEY (`requirement_id`) REFERENCES `requirements` (`requirements_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mastersprogram`
--

LOCK TABLES `mastersprogram` WRITE;
/*!40000 ALTER TABLE `mastersprogram` DISABLE KEYS */;
INSERT INTO `mastersprogram` VALUES (1,2,'Supply Chain Engineering',1,0,'On Campus',2500,'WUV',2,1),(2,2,'Management Engineering',0,1,'Hybrid',5000,'POLIMI',3,1),(3,2,'Energy Science and Technology',1,1,'On Campus',3100,'ETH',3,2),(4,2,'Management, Technology and Entrepreneurship',1,1,'On Campus',3200,'EPFL',1,3),(5,2,'Financial Engineering',1,0,'On Campus',3000,'EPFL',4,4),(6,2,' Sustainable Managment and Technology',1,1,'On Campus',10000,'MIT',5,5);
/*!40000 ALTER TABLE `mastersprogram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mastersprogram_brings_jobopportunity`
--

DROP TABLE IF EXISTS `mastersprogram_brings_jobopportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mastersprogram_brings_jobopportunity` (
  `master_id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL,
  PRIMARY KEY (`master_id`,`job_id`),
  KEY `job_id_idx` (`job_id`),
  CONSTRAINT `job_id` FOREIGN KEY (`job_id`) REFERENCES `jobopportunity` (`job_id`),
  CONSTRAINT `master_id_fk` FOREIGN KEY (`master_id`) REFERENCES `mastersprogram` (`master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mastersprogram_brings_jobopportunity`
--

LOCK TABLES `mastersprogram_brings_jobopportunity` WRITE;
/*!40000 ALTER TABLE `mastersprogram_brings_jobopportunity` DISABLE KEYS */;
INSERT INTO `mastersprogram_brings_jobopportunity` VALUES (2,1),(5,1),(6,1),(4,2),(5,2),(6,2),(1,4),(3,4),(4,4),(1,5),(2,6),(4,6);
/*!40000 ALTER TABLE `mastersprogram_brings_jobopportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mastersprogram_contains_lesson`
--

DROP TABLE IF EXISTS `mastersprogram_contains_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mastersprogram_contains_lesson` (
  `master_id` int NOT NULL AUTO_INCREMENT,
  `lesson_id` int NOT NULL,
  `is_core` tinyint DEFAULT NULL,
  PRIMARY KEY (`master_id`,`lesson_id`),
  KEY `lesson_id_idx` (`lesson_id`),
  CONSTRAINT `lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`),
  CONSTRAINT `master_id` FOREIGN KEY (`master_id`) REFERENCES `mastersprogram` (`master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mastersprogram_contains_lesson`
--

LOCK TABLES `mastersprogram_contains_lesson` WRITE;
/*!40000 ALTER TABLE `mastersprogram_contains_lesson` DISABLE KEYS */;
INSERT INTO `mastersprogram_contains_lesson` VALUES (1,2,1),(1,3,1),(1,4,0),(1,5,1),(2,1,1),(2,2,1),(2,4,1),(3,4,1),(3,5,0),(3,6,0),(4,1,1),(4,2,1),(4,3,1),(4,4,0),(5,1,1),(5,6,1),(6,3,1),(6,4,0);
/*!40000 ALTER TABLE `mastersprogram_contains_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `professor_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `university_code` varchar(10) NOT NULL,
  PRIMARY KEY (`professor_id`),
  KEY `university_code_professor_fk` (`university_code`),
  CONSTRAINT `university_code_professor_fk` FOREIGN KEY (`university_code`) REFERENCES `university` (`university_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Konstantinos','Daskalakis','MIT'),(2,'Themistoklis','Diamantopoulos','AUTH'),(3,'Jack','Sparrow','NTUA'),(4,'Stavros','Dokouzyannis','AUTH'),(5,'John','Cena','ETH');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_teaches_lesson`
--

DROP TABLE IF EXISTS `professor_teaches_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_teaches_lesson` (
  `lesson_id` int NOT NULL AUTO_INCREMENT,
  `professor_id` int NOT NULL,
  PRIMARY KEY (`lesson_id`,`professor_id`),
  KEY `professor_id` (`professor_id`),
  CONSTRAINT `lesson_id_fk` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`),
  CONSTRAINT `professor_id` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_teaches_lesson`
--

LOCK TABLES `professor_teaches_lesson` WRITE;
/*!40000 ALTER TABLE `professor_teaches_lesson` DISABLE KEYS */;
INSERT INTO `professor_teaches_lesson` VALUES (6,1),(2,2),(3,3),(1,4),(4,5);
/*!40000 ALTER TABLE `professor_teaches_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirements` (
  `requirements_id` int NOT NULL AUTO_INCREMENT,
  `word_experience` double DEFAULT NULL,
  `english_degree` double DEFAULT NULL,
  `standarised_tests_score` double DEFAULT NULL,
  `recomendation_letters` int DEFAULT NULL,
  `lowest_bachelor_score` double DEFAULT NULL,
  PRIMARY KEY (`requirements_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
INSERT INTO `requirements` VALUES (1,0,6,NULL,1,5),(2,0,7,NULL,1,5),(3,1,7,6,2,8),(4,2,7,NULL,3,6),(5,4,6,NULL,NULL,5);
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `year` int NOT NULL AUTO_INCREMENT,
  `university_code` varchar(10) NOT NULL,
  `total_participants` int DEFAULT NULL,
  `total_males` int DEFAULT NULL,
  `total_females` int DEFAULT NULL,
  `others` int DEFAULT NULL,
  PRIMARY KEY (`year`,`university_code`),
  KEY `university_code` (`university_code`),
  CONSTRAINT `university_code` FOREIGN KEY (`university_code`) REFERENCES `university` (`university_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2024 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES (2018,'MIT',11000,8000,2900,100),(2019,'ETH',10500,7500,2900,100),(2019,'MIT ',10000,7000,2900,100),(2020,'MIT',12000,9000,2900,100),(2020,'NTUA',10000,7000,2900,100),(2021,'MIT',43000,31339,11161,400),(2022,'MIT',45000,33000,11500,500),(2023,'AUTH',NULL,NULL,NULL,NULL),(2023,'EPFL',NULL,NULL,NULL,NULL),(2023,'ETH',20000,11000,8000,1000),(2023,'MIT',45000,30000,14000,1000),(2023,'NTUA',NULL,NULL,NULL,NULL),(2023,'POLIMI',NULL,NULL,NULL,NULL),(2023,'WUV',15000,8000,7500,500);
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `universities_stats`
--

DROP TABLE IF EXISTS `universities_stats`;
/*!50001 DROP VIEW IF EXISTS `universities_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `universities_stats` AS SELECT 
 1 AS `name`,
 1 AS `university_code`,
 1 AS `total_participants`,
 1 AS `total_males`,
 1 AS `total_females`,
 1 AS `others`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university` (
  `university_code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `rank` int DEFAULT NULL,
  PRIMARY KEY (`university_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES ('AUTH','Aristotle university of Thessaloniki','Greece','Thessaloniki',530),('EPFL','Ecole Polytechnique Federale de Lausanne','Switzerland','Lausanne',36),('ETH','ETH Zurich','Switzerland','Zurich',7),('MIT','Massachussets Institue Of Technology ','USA','Boston ',1),('NTUA','National Technical University of Athens ','Greece','Athens',347),('POLIMI','Politecnico di Milano','Italy','Milan',47),('WUV','University of Vienna','Austria','Vienna',130);
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `masters_info`
--

/*!50001 DROP VIEW IF EXISTS `masters_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `masters_info` AS select `mastersprogram`.`name` AS `Program Name`,`university`.`name` AS `University`,`mastersprogram`.`duration` AS `duration`,`mastersprogram`.`price` AS `price`,`university`.`city` AS `city` from (`mastersprogram` join `university` on((`mastersprogram`.`university_code` = `university`.`university_code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `universities_stats`
--

/*!50001 DROP VIEW IF EXISTS `universities_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `universities_stats` AS select `university`.`name` AS `name`,`university`.`university_code` AS `university_code`,`statistics`.`total_participants` AS `total_participants`,`statistics`.`total_males` AS `total_males`,`statistics`.`total_females` AS `total_females`,`statistics`.`others` AS `others` from (`university` join `statistics` on((`university`.`university_code` = `statistics`.`university_code`))) where ((`statistics`.`year` = 2023) and (`statistics`.`total_participants` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-20 22:04:34
