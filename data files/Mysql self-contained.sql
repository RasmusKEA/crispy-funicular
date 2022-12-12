-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: rategame
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUser` int NOT NULL,
  `idReview` int NOT NULL,
  `userComment` varchar(200) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idcomment_UNIQUE` (`id`),
  KEY `userId_idx` (`idUser`),
  KEY `commentIdReview_idx` (`idReview`),
  CONSTRAINT `reviewId` FOREIGN KEY (`idReview`) REFERENCES `reviews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userId` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `featured`
--

DROP TABLE IF EXISTS `featured`;
/*!50001 DROP VIEW IF EXISTS `featured`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `featured` AS SELECT 
 1 AS `title`,
 1 AS `rating`,
 1 AS `image`,
 1 AS `review`,
 1 AS `featured`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `fullreview`
--

DROP TABLE IF EXISTS `fullreview`;
/*!50001 DROP VIEW IF EXISTS `fullreview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fullreview` AS SELECT 
 1 AS `id`,
 1 AS `title`,
 1 AS `review`,
 1 AS `date`,
 1 AS `platform`,
 1 AS `rating`,
 1 AS `image`,
 1 AS `ratingReasoning`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `miniature`
--

DROP TABLE IF EXISTS `miniature`;
/*!50001 DROP VIEW IF EXISTS `miniature`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `miniature` AS SELECT 
 1 AS `Title`,
 1 AS `rating`,
 1 AS `date`,
 1 AS `platform`,
 1 AS `image`,
 1 AS `comments`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `review_audit_log`
--

DROP TABLE IF EXISTS `review_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_audit_log` (
  `review_id` int DEFAULT NULL,
  `dml_type` enum('insert','update','delete') DEFAULT NULL,
  `dml_timestamp` datetime DEFAULT NULL,
  `old_row_data` json DEFAULT NULL,
  `new_row_data` json DEFAULT NULL,
  `dml_created_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_audit_log`
--

LOCK TABLES `review_audit_log` WRITE;
/*!40000 ALTER TABLE `review_audit_log` DISABLE KEYS */;
INSERT INTO `review_audit_log` VALUES (15,'insert','2022-11-24 02:33:34',NULL,'{\"image\": \"test\", \"title\": \"test\", \"idUser\": 5, \"rating\": 10, \"review\": \"test\", \"featured\": 0, \"platform\": \"pc\", \"createdAt\": \"2022-11-24 02:33:34.000000\", \"updatedAt\": \"2022-11-24 02:33:34.000000\", \"ratingReasoning\": \"test\"}','5'),(9,'update','2022-11-24 02:48:36','{\"image\": \"review.image\", \"title\": \"review.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review.review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-10 15:41:15.000000\", \"ratingReasoning\": \"blabla\"}','{\"image\": \"review.image\", \"title\": \"review.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-24 02:48:36.000000\", \"ratingReasoning\": \"blabla\"}','5'),(15,'delete','2022-11-24 02:49:40','{\"image\": \"test\", \"title\": \"test\", \"idUser\": 5, \"rating\": 10, \"review\": \"test\", \"featured\": 0, \"platform\": \"pc\", \"createdAt\": \"2022-11-24 02:33:34.000000\", \"updatedAt\": \"2022-11-24 02:33:34.000000\", \"ratingReasoning\": \"test\"}',NULL,'5'),(16,'insert','2022-11-24 04:22:07',NULL,'{\"image\": \"auth test\", \"title\": \"auth test\", \"idUser\": 11, \"rating\": 10, \"review\": \"auth test\", \"featured\": 0, \"platform\": \"auth test\", \"createdAt\": \"2022-11-24 04:22:07.000000\", \"updatedAt\": \"2022-11-24 04:22:07.000000\", \"ratingReasoning\": \"auth test\"}','11'),(17,'insert','2022-11-25 10:00:18',NULL,'{\"image\": \"demo test\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-25 10:00:18.000000\", \"updatedAt\": \"2022-11-25 10:00:18.000000\", \"ratingReasoning\": \"demo test\"}','11'),(9,'update','2022-11-30 14:59:01','{\"image\": \"review.image\", \"title\": \"review.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-24 02:48:36.000000\", \"ratingReasoning\": \"blabla\"}','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"review.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"blabla\"}','5'),(10,'update','2022-11-30 14:59:01','{\"image\": \"review.image\", \"title\": \"reviewdasdasdas.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review.review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-10 15:41:15.000000\", \"ratingReasoning\": \"review.ratingReasoning\"}','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"reviewdasdasdas.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review.review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"review.ratingReasoning\"}','5'),(11,'update','2022-11-30 14:59:01','{\"image\": \"opdateret\", \"title\": \"opdateret\", \"idUser\": 5, \"rating\": 1, \"review\": \"opdateret\", \"featured\": 0, \"platform\": \"opdateret\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-10 15:41:15.000000\", \"ratingReasoning\": \"opdateret\"}','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"opdateret\", \"idUser\": 5, \"rating\": 1, \"review\": \"opdateret\", \"featured\": 0, \"platform\": \"opdateret\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"opdateret\"}','5'),(13,'update','2022-11-30 14:59:01','{\"image\": \"review.image\", \"title\": \"reviewdasdasdas.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review.review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-10 15:41:15.000000\", \"ratingReasoning\": \"review.ratingReasoning\"}','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"reviewdasdasdas.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review.review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"review.ratingReasoning\"}','5'),(14,'update','2022-11-30 14:59:01','{\"image\": \"picsum\", \"title\": \"test\", \"idUser\": 5, \"rating\": 1, \"review\": \"test\", \"featured\": 0, \"platform\": \"test\", \"createdAt\": \"2022-11-13 17:40:24.000000\", \"updatedAt\": \"2022-11-13 16:40:24.000000\", \"ratingReasoning\": \"test\"}','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"test\", \"idUser\": 5, \"rating\": 1, \"review\": \"test\", \"featured\": 0, \"platform\": \"test\", \"createdAt\": \"2022-11-13 17:40:24.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"test\"}','5'),(16,'update','2022-11-30 14:59:01','{\"image\": \"auth test\", \"title\": \"auth test\", \"idUser\": 11, \"rating\": 10, \"review\": \"auth test\", \"featured\": 0, \"platform\": \"auth test\", \"createdAt\": \"2022-11-24 05:22:07.000000\", \"updatedAt\": \"2022-11-24 04:22:07.000000\", \"ratingReasoning\": \"auth test\"}','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"auth test\", \"idUser\": 11, \"rating\": 10, \"review\": \"auth test\", \"featured\": 0, \"platform\": \"auth test\", \"createdAt\": \"2022-11-24 05:22:07.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"auth test\"}','11'),(17,'update','2022-11-30 14:59:01','{\"image\": \"demo test\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-25 11:00:18.000000\", \"updatedAt\": \"2022-11-25 10:00:18.000000\", \"ratingReasoning\": \"demo test\"}','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-25 11:00:18.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"demo test\"}','11'),(18,'insert','2022-11-30 16:13:24',NULL,'{\"image\": \"demo test\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-30 16:13:24.000000\", \"updatedAt\": \"2022-11-30 16:13:24.000000\", \"ratingReasoning\": \"demo test\"}','11'),(19,'insert','2022-11-30 18:34:54',NULL,'{\"image\": \"demo test\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-30 18:34:54.000000\", \"updatedAt\": \"2022-11-30 18:34:54.000000\", \"ratingReasoning\": \"demo test\"}','11'),(20,'insert','2022-11-30 18:50:06',NULL,'{\"image\": \"1\", \"title\": \"1\", \"idUser\": 11, \"rating\": 1, \"review\": \"1\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 18:50:06.000000\", \"updatedAt\": \"2022-11-30 18:50:06.000000\", \"ratingReasoning\": \"1\"}','11'),(21,'insert','2022-11-30 19:48:51',NULL,'{\"image\": \"1\", \"title\": \"test ny auth\", \"idUser\": 11, \"rating\": 1, \"review\": \"1\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 19:48:51.000000\", \"updatedAt\": \"2022-11-30 19:48:51.000000\", \"ratingReasoning\": \"1\"}','11'),(22,'insert','2022-11-30 19:51:05',NULL,'{\"image\": \"1\", \"title\": \"1\", \"idUser\": 11, \"rating\": 1, \"review\": \"1\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 19:51:05.000000\", \"updatedAt\": \"2022-11-30 19:51:05.000000\", \"ratingReasoning\": \"1\"}','11'),(23,'insert','2022-11-30 22:57:23',NULL,'{\"image\": \"das\", \"title\": \"This is test\", \"idUser\": 11, \"rating\": 10, \"review\": \"test text area\", \"featured\": 0, \"platform\": \"pc\", \"createdAt\": \"2022-11-30 22:57:23.000000\", \"updatedAt\": \"2022-11-30 22:57:23.000000\", \"ratingReasoning\": \"very good\"}','11'),(24,'insert','2022-11-30 23:00:35',NULL,'{\"image\": \"dsa\", \"title\": \"dsa\", \"idUser\": 12, \"rating\": 10, \"review\": \"dsa\", \"featured\": 0, \"platform\": \"da\", \"createdAt\": \"2022-11-30 23:00:35.000000\", \"updatedAt\": \"2022-11-30 23:00:35.000000\", \"ratingReasoning\": \"das\"}','12'),(25,'insert','2022-11-30 23:02:30',NULL,'{\"image\": \"sa\", \"title\": \"da\", \"idUser\": 12, \"rating\": 10, \"review\": \"dsa\", \"featured\": 0, \"platform\": \"dsa\", \"createdAt\": \"2022-11-30 23:02:30.000000\", \"updatedAt\": \"2022-11-30 23:02:30.000000\", \"ratingReasoning\": \"dsa\"}','12'),(26,'insert','2022-11-30 23:03:21',NULL,'{\"image\": \"das\", \"title\": \"da\", \"idUser\": 12, \"rating\": 1, \"review\": \"dsa\", \"featured\": 0, \"platform\": \"dsa\", \"createdAt\": \"2022-11-30 23:03:21.000000\", \"updatedAt\": \"2022-11-30 23:03:21.000000\", \"ratingReasoning\": \"dsa\"}','12'),(7,'update','2022-12-01 00:42:31','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"Activisions golden baby\", \"idUser\": 5, \"rating\": 10, \"review\": \"In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills.\", \"featured\": 0, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-10 15:41:15.000000\", \"ratingReasoning\": \"An overall great product from Activision. Activision have listened to their users for once. We appreciate that.\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"Activisions golden baby\", \"idUser\": 5, \"rating\": 10, \"review\": \"In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills.\", \"featured\": 0, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"An overall great product from Activision. Activision have listened to their users for once. We appreciate that.\"}','5'),(8,'update','2022-12-01 00:42:31','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"Test featured Review\", \"idUser\": 5, \"rating\": 5, \"review\": \"New review super cool featured\", \"featured\": 1, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-10 15:41:15.000000\", \"ratingReasoning\": \"mediocre\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"Test featured Review\", \"idUser\": 5, \"rating\": 5, \"review\": \"New review super cool featured\", \"featured\": 1, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"mediocre\"}','5'),(9,'update','2022-12-01 00:42:31','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"review.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"blabla\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"review.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"blabla\"}','5'),(10,'update','2022-12-01 00:42:31','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"reviewdasdasdas.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review.review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"review.ratingReasoning\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"reviewdasdasdas.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review.review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"review.ratingReasoning\"}','5'),(11,'update','2022-12-01 00:42:31','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"opdateret\", \"idUser\": 5, \"rating\": 1, \"review\": \"opdateret\", \"featured\": 0, \"platform\": \"opdateret\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"opdateret\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"opdateret\", \"idUser\": 5, \"rating\": 1, \"review\": \"opdateret\", \"featured\": 0, \"platform\": \"opdateret\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"opdateret\"}','5'),(13,'update','2022-12-01 00:42:31','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"reviewdasdasdas.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review.review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"review.ratingReasoning\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"reviewdasdasdas.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review.review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"review.ratingReasoning\"}','5'),(14,'update','2022-12-01 00:42:31','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"test\", \"idUser\": 5, \"rating\": 1, \"review\": \"test\", \"featured\": 0, \"platform\": \"test\", \"createdAt\": \"2022-11-13 17:40:24.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"test\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"test\", \"idUser\": 5, \"rating\": 1, \"review\": \"test\", \"featured\": 0, \"platform\": \"test\", \"createdAt\": \"2022-11-13 17:40:24.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"test\"}','5'),(16,'update','2022-12-01 00:42:31','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"auth test\", \"idUser\": 11, \"rating\": 10, \"review\": \"auth test\", \"featured\": 0, \"platform\": \"auth test\", \"createdAt\": \"2022-11-24 05:22:07.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"auth test\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"auth test\", \"idUser\": 11, \"rating\": 10, \"review\": \"auth test\", \"featured\": 0, \"platform\": \"auth test\", \"createdAt\": \"2022-11-24 05:22:07.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"auth test\"}','11'),(17,'update','2022-12-01 00:42:31','{\"image\": \"https://picsum.photos/150/100\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-25 11:00:18.000000\", \"updatedAt\": \"2022-11-30 14:59:01.000000\", \"ratingReasoning\": \"demo test\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-25 11:00:18.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"demo test\"}','11'),(18,'update','2022-12-01 00:42:31','{\"image\": \"demo test\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-30 17:13:24.000000\", \"updatedAt\": \"2022-11-30 16:13:24.000000\", \"ratingReasoning\": \"demo test\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-30 17:13:24.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"demo test\"}','11'),(19,'update','2022-12-01 00:42:31','{\"image\": \"demo test\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-30 19:34:54.000000\", \"updatedAt\": \"2022-11-30 18:34:54.000000\", \"ratingReasoning\": \"demo test\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-30 19:34:54.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"demo test\"}','11'),(20,'update','2022-12-01 00:42:31','{\"image\": \"1\", \"title\": \"1\", \"idUser\": 11, \"rating\": 1, \"review\": \"1\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 19:50:06.000000\", \"updatedAt\": \"2022-11-30 18:50:06.000000\", \"ratingReasoning\": \"1\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"1\", \"idUser\": 11, \"rating\": 1, \"review\": \"1\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 19:50:06.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"1\"}','11'),(21,'update','2022-12-01 00:42:31','{\"image\": \"1\", \"title\": \"test ny auth\", \"idUser\": 11, \"rating\": 1, \"review\": \"1\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 20:48:51.000000\", \"updatedAt\": \"2022-11-30 19:48:51.000000\", \"ratingReasoning\": \"1\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"test ny auth\", \"idUser\": 11, \"rating\": 1, \"review\": \"1\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 20:48:51.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"1\"}','11'),(22,'update','2022-12-01 00:42:31','{\"image\": \"1\", \"title\": \"1\", \"idUser\": 11, \"rating\": 1, \"review\": \"1\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 20:51:05.000000\", \"updatedAt\": \"2022-11-30 19:51:05.000000\", \"ratingReasoning\": \"1\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"1\", \"idUser\": 11, \"rating\": 1, \"review\": \"1\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 20:51:05.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"1\"}','11'),(23,'update','2022-12-01 00:42:31','{\"image\": \"das\", \"title\": \"This is test\", \"idUser\": 11, \"rating\": 10, \"review\": \"test text area\", \"featured\": 0, \"platform\": \"pc\", \"createdAt\": \"2022-11-30 23:57:23.000000\", \"updatedAt\": \"2022-11-30 22:57:23.000000\", \"ratingReasoning\": \"very good\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"This is test\", \"idUser\": 11, \"rating\": 10, \"review\": \"test text area\", \"featured\": 0, \"platform\": \"pc\", \"createdAt\": \"2022-11-30 23:57:23.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"very good\"}','11'),(24,'update','2022-12-01 00:42:31','{\"image\": \"dsa\", \"title\": \"dsa\", \"idUser\": 12, \"rating\": 10, \"review\": \"dsa\", \"featured\": 0, \"platform\": \"da\", \"createdAt\": \"2022-12-01 00:00:35.000000\", \"updatedAt\": \"2022-11-30 23:00:35.000000\", \"ratingReasoning\": \"das\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"dsa\", \"idUser\": 12, \"rating\": 10, \"review\": \"dsa\", \"featured\": 0, \"platform\": \"da\", \"createdAt\": \"2022-12-01 00:00:35.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"das\"}','12'),(25,'update','2022-12-01 00:43:55','{\"image\": \"sa\", \"title\": \"da\", \"idUser\": 12, \"rating\": 10, \"review\": \"dsa\", \"featured\": 0, \"platform\": \"dsa\", \"createdAt\": \"2022-12-01 00:02:30.000000\", \"updatedAt\": \"2022-11-30 23:02:30.000000\", \"ratingReasoning\": \"dsa\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"da\", \"idUser\": 12, \"rating\": 10, \"review\": \"dsa\", \"featured\": 0, \"platform\": \"dsa\", \"createdAt\": \"2022-12-01 00:02:30.000000\", \"updatedAt\": \"2022-12-01 00:43:55.000000\", \"ratingReasoning\": \"dsa\"}','12'),(26,'update','2022-12-01 00:43:55','{\"image\": \"das\", \"title\": \"da\", \"idUser\": 12, \"rating\": 1, \"review\": \"dsa\", \"featured\": 0, \"platform\": \"dsa\", \"createdAt\": \"2022-12-01 00:03:21.000000\", \"updatedAt\": \"2022-11-30 23:03:21.000000\", \"ratingReasoning\": \"dsa\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"da\", \"idUser\": 12, \"rating\": 1, \"review\": \"dsa\", \"featured\": 0, \"platform\": \"dsa\", \"createdAt\": \"2022-12-01 00:03:21.000000\", \"updatedAt\": \"2022-12-01 00:43:55.000000\", \"ratingReasoning\": \"dsa\"}','12'),(7,'update','2022-12-01 00:49:42','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"Activisions golden baby\", \"idUser\": 5, \"rating\": 10, \"review\": \"In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills.\", \"featured\": 0, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"An overall great product from Activision. Activision have listened to their users for once. We appreciate that.\"}','{\"image\": \"https://picsum.photos/800/400\", \"title\": \"Activisions golden baby\", \"idUser\": 5, \"rating\": 10, \"review\": \"In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills.\", \"featured\": 0, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 00:49:42.000000\", \"ratingReasoning\": \"An overall great product from Activision. Activision have listened to their users for once. We appreciate that.\"}','5'),(8,'update','2022-12-01 00:49:42','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"Test featured Review\", \"idUser\": 5, \"rating\": 5, \"review\": \"New review super cool featured\", \"featured\": 1, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"mediocre\"}','{\"image\": \"https://picsum.photos/800/400\", \"title\": \"Test featured Review\", \"idUser\": 5, \"rating\": 5, \"review\": \"New review super cool featured\", \"featured\": 1, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 00:49:42.000000\", \"ratingReasoning\": \"mediocre\"}','5'),(9,'update','2022-12-01 01:15:44','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"review.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"blabla\"}','{\"image\": \"https://picsum.photos/800/400\", \"title\": \"review.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 01:15:44.000000\", \"ratingReasoning\": \"blabla\"}','5'),(27,'insert','2022-12-01 01:15:44',NULL,'{\"image\": \"https://picsum.photos/800/400\", \"title\": \"Activisions golden babyActivisions golden baby\", \"idUser\": 12, \"rating\": 10, \"review\": \"In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills.In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills.\", \"featured\": 0, \"platform\": \"PC\", \"createdAt\": \"2022-12-01 01:15:44.000000\", \"updatedAt\": \"2022-12-01 01:15:44.000000\", \"ratingReasoning\": \"An overall great product from Activision. Activision have listened to their users for once. We appreciate that.An overall great product from Activision. Activision have listened to their users for once. We appreciate that.\"}','12'),(27,'delete','2022-12-01 01:03:39','{\"image\": \"https://picsum.photos/800/400\", \"title\": \"Activisions golden babyActivisions golden baby\", \"idUser\": 12, \"rating\": 10, \"review\": \"In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills.In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills.\", \"featured\": 0, \"platform\": \"PC\", \"createdAt\": \"2022-12-01 00:15:44.000000\", \"updatedAt\": \"2022-12-01 01:15:44.000000\", \"ratingReasoning\": \"An overall great product from Activision. Activision have listened to their users for once. We appreciate that.An overall great product from Activision. Activision have listened to their users for once. We appreciate that.\"}',NULL,'12'),(9,'delete','2022-12-01 01:10:07','{\"image\": \"https://picsum.photos/800/400\", \"title\": \"review.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 14:41:15.000000\", \"updatedAt\": \"2022-12-01 01:15:44.000000\", \"ratingReasoning\": \"blabla\"}',NULL,'5'),(10,'delete','2022-12-01 01:10:22','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"reviewdasdasdas.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review.review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 14:41:15.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"review.ratingReasoning\"}',NULL,'5'),(8,'delete','2022-12-01 01:11:24','{\"image\": \"https://picsum.photos/800/400\", \"title\": \"Test featured Review\", \"idUser\": 5, \"rating\": 5, \"review\": \"New review super cool featured\", \"featured\": 1, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 14:41:15.000000\", \"updatedAt\": \"2022-12-01 00:49:42.000000\", \"ratingReasoning\": \"mediocre\"}',NULL,'5'),(11,'delete','2022-12-01 01:12:39','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"opdateret\", \"idUser\": 5, \"rating\": 1, \"review\": \"opdateret\", \"featured\": 0, \"platform\": \"opdateret\", \"createdAt\": \"2022-11-10 14:41:15.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"opdateret\"}',NULL,'5'),(14,'delete','2022-12-01 01:13:01','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"test\", \"idUser\": 5, \"rating\": 1, \"review\": \"test\", \"featured\": 0, \"platform\": \"test\", \"createdAt\": \"2022-11-13 16:40:24.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"test\"}',NULL,'5'),(13,'delete','2022-12-01 01:13:05','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"reviewdasdasdas.title\", \"idUser\": 5, \"rating\": 1, \"review\": \"review.review\", \"featured\": 0, \"platform\": \"review.platform\", \"createdAt\": \"2022-11-10 14:41:15.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"review.ratingReasoning\"}',NULL,'5'),(16,'delete','2022-12-01 01:13:08','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"auth test\", \"idUser\": 11, \"rating\": 10, \"review\": \"auth test\", \"featured\": 0, \"platform\": \"auth test\", \"createdAt\": \"2022-11-24 04:22:07.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"auth test\"}',NULL,'11'),(17,'delete','2022-12-01 01:13:11','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-25 10:00:18.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"demo test\"}',NULL,'11'),(18,'delete','2022-12-01 01:13:14','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-30 16:13:24.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"demo test\"}',NULL,'11'),(19,'delete','2022-12-01 01:13:17','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"demo test\", \"idUser\": 11, \"rating\": 10, \"review\": \"demo test\", \"featured\": 0, \"platform\": \"demo test\", \"createdAt\": \"2022-11-30 18:34:54.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"demo test\"}',NULL,'11'),(7,'update','2022-12-01 03:14:05','{\"image\": \"https://picsum.photos/800/400\", \"title\": \"Activisions golden baby\", \"idUser\": 5, \"rating\": 10, \"review\": \"In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills.\", \"featured\": 0, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 00:49:42.000000\", \"ratingReasoning\": \"An overall great product from Activision. Activision have listened to their users for once. We appreciate that.\"}','{\"image\": \"https://picsum.photos/800/400\", \"title\": \"Activisions golden baby\", \"idUser\": 5, \"rating\": 10, \"review\": \"In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills.\", \"featured\": 1, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 15:41:15.000000\", \"updatedAt\": \"2022-12-01 03:14:05.000000\", \"ratingReasoning\": \"An overall great product from Activision. Activision have listened to their users for once. We appreciate that.\"}','5'),(20,'update','2022-12-01 02:20:48','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"1\", \"idUser\": 11, \"rating\": 1, \"review\": \"1\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 18:50:06.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"1\"}','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"1\", \"idUser\": 11, \"rating\": 1, \"review\": \"1dsadsda\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 18:50:06.000000\", \"updatedAt\": \"2022-12-01 02:20:48.000000\", \"ratingReasoning\": \"1\"}','11'),(7,'update','2022-12-01 02:21:15','{\"image\": \"https://picsum.photos/800/400\", \"title\": \"Activisions golden baby\", \"idUser\": 5, \"rating\": 10, \"review\": \"In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills.\", \"featured\": 1, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 14:41:15.000000\", \"updatedAt\": \"2022-12-01 03:14:05.000000\", \"ratingReasoning\": \"An overall great product from Activision. Activision have listened to their users for once. We appreciate that.\"}','{\"image\": \"https://picsum.photos/800/400\", \"title\": \"Activisions golden baby\", \"idUser\": 11, \"rating\": 10, \"review\": \"In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills. I got 20 \", \"featured\": 1, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 14:41:15.000000\", \"updatedAt\": \"2022-12-01 02:21:15.000000\", \"ratingReasoning\": \"An overall great product from Activision. Activision have listened to their users for once. We appreciate that.\"}','11'),(23,'delete','2022-12-01 02:28:49','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"This is test\", \"idUser\": 11, \"rating\": 10, \"review\": \"test text area\", \"featured\": 0, \"platform\": \"pc\", \"createdAt\": \"2022-11-30 22:57:23.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"very good\"}',NULL,'11'),(26,'delete','2022-12-01 02:28:53','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"da\", \"idUser\": 12, \"rating\": 1, \"review\": \"dsa\", \"featured\": 0, \"platform\": \"dsa\", \"createdAt\": \"2022-11-30 23:03:21.000000\", \"updatedAt\": \"2022-12-01 00:43:55.000000\", \"ratingReasoning\": \"dsa\"}',NULL,'12'),(25,'delete','2022-12-01 02:28:58','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"da\", \"idUser\": 12, \"rating\": 10, \"review\": \"dsa\", \"featured\": 0, \"platform\": \"dsa\", \"createdAt\": \"2022-11-30 23:02:30.000000\", \"updatedAt\": \"2022-12-01 00:43:55.000000\", \"ratingReasoning\": \"dsa\"}',NULL,'12'),(24,'delete','2022-12-01 02:29:04','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"dsa\", \"idUser\": 12, \"rating\": 10, \"review\": \"dsa\", \"featured\": 0, \"platform\": \"da\", \"createdAt\": \"2022-11-30 23:00:35.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"das\"}',NULL,'12'),(21,'delete','2022-12-01 02:29:07','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"test ny auth\", \"idUser\": 11, \"rating\": 1, \"review\": \"1\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 19:48:51.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"1\"}',NULL,'11'),(22,'delete','2022-12-01 02:29:10','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"1\", \"idUser\": 11, \"rating\": 1, \"review\": \"1\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 19:51:05.000000\", \"updatedAt\": \"2022-12-01 00:42:31.000000\", \"ratingReasoning\": \"1\"}',NULL,'11'),(20,'delete','2022-12-01 02:29:12','{\"image\": \"https://picsum.photos/200/100\", \"title\": \"1\", \"idUser\": 11, \"rating\": 1, \"review\": \"1dsadsda\", \"featured\": 0, \"platform\": \"1\", \"createdAt\": \"2022-11-30 18:50:06.000000\", \"updatedAt\": \"2022-12-01 02:20:48.000000\", \"ratingReasoning\": \"1\"}',NULL,'11'),(28,'insert','2022-12-01 02:33:05',NULL,'{\"image\": \"https://www.gamespot.com/a/uploads/original/1575/15759911/3756717-review_spidermanmilesmorales_20201106.00_01_19_26.still007.png\", \"title\": \"Marvel\'s Spider-Man: Miles Morales sticks a bit too close to its predecessor in terms of mechanics, but manages to stand on its own through its story and characters.\", \"idUser\": 11, \"rating\": 7, \"review\": \"Marvel\'s Spider-Man: Miles Morales feels like the second half to The City That Never Sleeps, a three-part follow-up expansion to 2018\'s Marvel\'s Spider-Man--the game even begins with the option to watch a short recap of the first game and its DLC in order to bring you up to speed on Miles\' origins, reinforcing the notion that this is an extension of what\'s come before.\", \"featured\": 0, \"platform\": \"PC\", \"createdAt\": \"2022-12-01 02:33:05.000000\", \"updatedAt\": \"2022-12-01 02:33:05.000000\", \"ratingReasoning\": \"Genuine care has been put into the depiction of Miles\' culture as a half-Black, half-Puerto Rican resident of Harlem, especially in how it\'s used to inform the type of hero he wants to be\"}','11'),(28,'update','2022-12-01 02:33:53','{\"image\": \"https://www.gamespot.com/a/uploads/original/1575/15759911/3756717-review_spidermanmilesmorales_20201106.00_01_19_26.still007.png\", \"title\": \"Marvel\'s Spider-Man: Miles Morales sticks a bit too close to its predecessor in terms of mechanics, but manages to stand on its own through its story and characters.\", \"idUser\": 11, \"rating\": 7, \"review\": \"Marvel\'s Spider-Man: Miles Morales feels like the second half to The City That Never Sleeps, a three-part follow-up expansion to 2018\'s Marvel\'s Spider-Man--the game even begins with the option to watch a short recap of the first game and its DLC in order to bring you up to speed on Miles\' origins, reinforcing the notion that this is an extension of what\'s come before.\", \"featured\": 0, \"platform\": \"PC\", \"createdAt\": \"2022-12-01 02:33:05.000000\", \"updatedAt\": \"2022-12-01 02:33:05.000000\", \"ratingReasoning\": \"Genuine care has been put into the depiction of Miles\' culture as a half-Black, half-Puerto Rican resident of Harlem, especially in how it\'s used to inform the type of hero he wants to be\"}','{\"image\": \"https://www.gamespot.com/a/uploads/original/1575/15759911/3756717-review_spidermanmilesmorales_20201106.00_01_19_26.still007.png\", \"title\": \"Marvel\'s Spider-Man\", \"idUser\": 11, \"rating\": 7, \"review\": \"Marvel\'s Spider-Man: Miles Morales feels like the second half to The City That Never Sleeps, a three-part follow-up expansion to 2018\'s Marvel\'s Spider-Man--the game even begins with the option to watch a short recap of the first game and its DLC in order to bring you up to speed on Miles\' origins, reinforcing the notion that this is an extension of what\'s come before.\", \"featured\": 0, \"platform\": \"PC\", \"createdAt\": \"2022-12-01 02:33:05.000000\", \"updatedAt\": \"2022-12-01 02:33:53.000000\", \"ratingReasoning\": \"Genuine care has been put into the depiction of Miles\' culture as a half-Black, half-Puerto Rican resident of Harlem, especially in how it\'s used to inform the type of hero he wants to be\"}','11'),(29,'insert','2022-12-01 02:36:02',NULL,'{\"image\": \"https://www.gamespot.com/a/uploads/original/43/434805/4061118-screenshot01.jpg\", \"title\": \"Tactics Ogre Reborn Review - 4D Chess\", \"idUser\": 11, \"rating\": 8, \"review\": \"Tactics Ogre is a landmark game in the evolution of the strategy-RPG genre, yet it\'s never quite received the appreciation it deserves outside of Japan. Part of this has to do with the long shadow cast by its directly-inspired and much-beloved younger sibling, Final Fantasy Tactics.\", \"featured\": 0, \"platform\": \"NS\", \"createdAt\": \"2022-12-01 02:36:02.000000\", \"updatedAt\": \"2022-12-01 02:36:02.000000\", \"ratingReasoning\": \"Great narrative with a stellar localization and challenging moral dilemmas\"}','11'),(7,'update','2022-12-01 02:36:51','{\"image\": \"https://picsum.photos/800/400\", \"title\": \"Activisions golden baby\", \"idUser\": 11, \"rating\": 10, \"review\": \"In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills. I got 20 \", \"featured\": 1, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 14:41:15.000000\", \"updatedAt\": \"2022-12-01 02:21:15.000000\", \"ratingReasoning\": \"An overall great product from Activision. Activision have listened to their users for once. We appreciate that.\"}','{\"image\": \"https://i.ytimg.com/vi/Ldi4QXeZkVI/maxresdefault.jpg\", \"title\": \"Activisions golden baby\", \"idUser\": 11, \"rating\": 10, \"review\": \"In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills. I got 20 \", \"featured\": 1, \"platform\": \"PC\", \"createdAt\": \"2022-11-10 14:41:15.000000\", \"updatedAt\": \"2022-12-01 02:36:51.000000\", \"ratingReasoning\": \"An overall great product from Activision. Activision have listened to their users for once. We appreciate that.\"}','11'),(30,'insert','2022-12-11 20:45:24',NULL,'{\"image\": \"https://www.gamespot.com/a/uploads/original/1632/16320660/4069572-sknve8j8.png\", \"title\": \"Warhammer 40K Darktide Review - Left To Shred\", \"idUser\": 11, \"rating\": 7, \"review\": \"When I spoke to several teams making games in the Left 4 Dead lineage, they each had some unique thoughts on why the game, and its resulting genre, works. But they also each echoed one similar thought: Pacing reigns supreme. Horde shooters, like Warhammer 40K Darktide, can live or die on the flow of its co-op missions. Aided by an AI director, missions must be tuned to reliably challenge, but not necessarily overwhelm the player. Impressively, Darktide gets this aspect of its grimdark missions exactly right, though the ways in which the game adds new layers don\'t work quite as well.\\n\\nDarktide is not just a Left 4 Dead-like, it\'s also the spiritual successor to Fatshark\'s previous series in the genre, Vermintide. Moving the experience out of the base Warhammer world and into the far-flung and grimdark future of Warhammer 40K comes with a major makeover both cosmetically and mechanically. The biggest new addition comes in the form of an arsenal of firearms that have no place in the hard fantasy of traditional Warhammer. But in the 40K era, things like hand cannons, assault rifles, and electricity-infused projectiles not only fit right in, but also dramatically alter the flow of combat by adding more range-based considerations.\", \"featured\": 0, \"platform\": \"PC\", \"createdAt\": \"2022-12-11 20:45:24.000000\", \"updatedAt\": \"2022-12-11 20:45:24.000000\", \"ratingReasoning\": \"Excellent depth found in its character build options\"}','11');
/*!40000 ALTER TABLE `review_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUser` int NOT NULL,
  `review` text NOT NULL,
  `title` text NOT NULL,
  `rating` int NOT NULL,
  `ratingReasoning` text NOT NULL,
  `platform` varchar(45) NOT NULL,
  `image` text NOT NULL,
  `featured` tinyint NOT NULL DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idReview_UNIQUE` (`id`),
  KEY `reviewUserId_idx` (`idUser`),
  KEY `review_idx` (`review`(25)),
  CONSTRAINT `reviewUserId` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (7,11,'In past versions of Ground War I was put off because it always felt too disparate and chaotic – and the chaos wasn\'t the good kind, either. It felt to me like the maps were designed one chunk at a time and then assembled without too much thought to the flow as a whole. Capturing objectives always felt like an afterthought as a result, and matches played out more like a big team deathmatch. But this year, because the layouts of the maps are so tight and smart, it\'s just as much fun to defend an objective as it is to run around racking up kills. I got 20 ','Activisions golden baby',10,'An overall great product from Activision. Activision have listened to their users for once. We appreciate that.','PC','https://i.ytimg.com/vi/Ldi4QXeZkVI/maxresdefault.jpg',1,'2022-11-10 14:41:15','2022-12-01 02:36:51'),(28,11,'Marvel\'s Spider-Man: Miles Morales feels like the second half to The City That Never Sleeps, a three-part follow-up expansion to 2018\'s Marvel\'s Spider-Man--the game even begins with the option to watch a short recap of the first game and its DLC in order to bring you up to speed on Miles\' origins, reinforcing the notion that this is an extension of what\'s come before.','Marvel\'s Spider-Man',7,'Genuine care has been put into the depiction of Miles\' culture as a half-Black, half-Puerto Rican resident of Harlem, especially in how it\'s used to inform the type of hero he wants to be','PC','https://www.gamespot.com/a/uploads/original/1575/15759911/3756717-review_spidermanmilesmorales_20201106.00_01_19_26.still007.png',0,'2022-12-01 02:33:05','2022-12-01 02:33:53'),(29,11,'Tactics Ogre is a landmark game in the evolution of the strategy-RPG genre, yet it\'s never quite received the appreciation it deserves outside of Japan. Part of this has to do with the long shadow cast by its directly-inspired and much-beloved younger sibling, Final Fantasy Tactics.','Tactics Ogre Reborn Review - 4D Chess',8,'Great narrative with a stellar localization and challenging moral dilemmas','NS','https://www.gamespot.com/a/uploads/original/43/434805/4061118-screenshot01.jpg',0,'2022-12-01 02:36:02','2022-12-01 02:36:02'),(30,11,'When I spoke to several teams making games in the Left 4 Dead lineage, they each had some unique thoughts on why the game, and its resulting genre, works. But they also each echoed one similar thought: Pacing reigns supreme. Horde shooters, like Warhammer 40K Darktide, can live or die on the flow of its co-op missions. Aided by an AI director, missions must be tuned to reliably challenge, but not necessarily overwhelm the player. Impressively, Darktide gets this aspect of its grimdark missions exactly right, though the ways in which the game adds new layers don\'t work quite as well.\n\nDarktide is not just a Left 4 Dead-like, it\'s also the spiritual successor to Fatshark\'s previous series in the genre, Vermintide. Moving the experience out of the base Warhammer world and into the far-flung and grimdark future of Warhammer 40K comes with a major makeover both cosmetically and mechanically. The biggest new addition comes in the form of an arsenal of firearms that have no place in the hard fantasy of traditional Warhammer. But in the 40K era, things like hand cannons, assault rifles, and electricity-infused projectiles not only fit right in, but also dramatically alter the flow of combat by adding more range-based considerations.','Warhammer 40K Darktide Review - Left To Shred',7,'Excellent depth found in its character build options','PC','https://www.gamespot.com/a/uploads/original/1632/16320660/4069572-sknve8j8.png',0,'2022-12-11 19:45:24','2022-12-11 20:45:24');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'user','2022-11-17 15:14:07','2022-11-17 16:14:07'),(2,'staff','2022-11-17 15:14:07','2022-11-17 16:14:07'),(3,'admin','2022-11-17 15:14:07','2022-11-17 16:14:07');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reviewsMade` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES (1,7,'2022-11-17 16:41:19'),(2,7,'2022-11-17 16:43:51'),(3,0,'2022-11-17 16:44:05'),(4,0,'2022-11-17 16:44:14'),(5,1,'2022-11-17 16:44:34'),(6,1,'2022-11-17 16:44:58'),(7,1,'2022-11-17 16:52:21'),(8,2,'2022-12-03 02:03:17');
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`roleId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES ('2022-11-30 19:50:49','2022-11-30 19:50:49',1,14),('2022-11-25 09:58:57','2022-11-25 09:58:57',2,12),('2022-11-24 04:11:25','2022-11-24 04:11:25',3,11);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `Avatar` varchar(45) DEFAULT NULL,
  `Bio` varchar(45) DEFAULT NULL,
  `Birthday` datetime DEFAULT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  `FavoritePublisher` varchar(45) DEFAULT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'user',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idUser_UNIQUE` (`id`),
  UNIQUE KEY `Username_UNIQUE` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11,'admin','$2a$08$StgSM4VP7SVdzs10B7K39uCOXweg6.AnGC2YAxIvSP8PO5vEApDCy',NULL,NULL,NULL,0,NULL,'admin','2022-11-24 04:11:25','2022-11-24 05:17:07','admin@admin.dk'),(12,'demo','$2a$08$HP5/uZ0fMlxjeEmOwgoXHOqWYbdarip/sjCjJ1thTgd2GQBRxBHTa',NULL,NULL,NULL,0,NULL,'staff','2022-11-25 09:58:57','2022-11-30 23:48:28','demo@demo.com'),(14,'bruger','$2a$08$LND2r8JDu372VGUYJQIxV.dsveDrJJEw8H8DztBX//MXXCEB0wk..',NULL,NULL,NULL,0,NULL,'user','2022-11-30 19:50:49','2022-11-30 19:50:49','bruger@bruger.dk');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `featured`
--

/*!50001 DROP VIEW IF EXISTS `featured`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `featured` AS select `reviews`.`title` AS `title`,`reviews`.`rating` AS `rating`,`reviews`.`image` AS `image`,`reviews`.`review` AS `review`,`reviews`.`featured` AS `featured` from `reviews` where (`reviews`.`featured` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fullreview`
--

/*!50001 DROP VIEW IF EXISTS `fullreview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fullreview` AS select `reviews`.`id` AS `id`,`reviews`.`title` AS `title`,`reviews`.`review` AS `review`,`reviews`.`createdAt` AS `date`,`reviews`.`platform` AS `platform`,`reviews`.`rating` AS `rating`,`reviews`.`image` AS `image`,`reviews`.`ratingReasoning` AS `ratingReasoning`,`users`.`Username` AS `username` from (`reviews` join `users` on((`reviews`.`id` = `users`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `miniature`
--

/*!50001 DROP VIEW IF EXISTS `miniature`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `miniature` AS select `reviews`.`title` AS `Title`,`reviews`.`rating` AS `rating`,`reviews`.`createdAt` AS `date`,`reviews`.`platform` AS `platform`,`reviews`.`image` AS `image`,count(`comments`.`userComment`) AS `comments` from (`reviews` join `comments`) where (`reviews`.`id` = 7) */;
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

-- Dump completed on 2022-12-12 19:39:34
