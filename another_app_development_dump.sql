-- MySQL dump 10.13  Distrib 8.0.18, for osx10.14 (x86_64)
--
-- Host: localhost    Database: another_app_development
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2019-11-25 12:38:36','2019-11-25 12:38:36');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audio_tagmaps`
--

DROP TABLE IF EXISTS `audio_tagmaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audio_tagmaps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `audio_id` bigint(20) DEFAULT NULL,
  `audio_tag_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_audio_tagmaps_on_audio_id` (`audio_id`),
  KEY `index_audio_tagmaps_on_audio_tag_id` (`audio_tag_id`),
  CONSTRAINT `fk_rails_2b4d2368ca` FOREIGN KEY (`audio_id`) REFERENCES `audios` (`id`),
  CONSTRAINT `fk_rails_a2d31fe7bd` FOREIGN KEY (`audio_tag_id`) REFERENCES `audio_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio_tagmaps`
--

LOCK TABLES `audio_tagmaps` WRITE;
/*!40000 ALTER TABLE `audio_tagmaps` DISABLE KEYS */;
/*!40000 ALTER TABLE `audio_tagmaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audio_tags`
--

DROP TABLE IF EXISTS `audio_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audio_tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `genre` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio_tags`
--

LOCK TABLES `audio_tags` WRITE;
/*!40000 ALTER TABLE `audio_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `audio_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audios`
--

DROP TABLE IF EXISTS `audios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_audios_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_124d1fac7e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audios`
--

LOCK TABLES `audios` WRITE;
/*!40000 ALTER TABLE `audios` DISABLE KEYS */;
/*!40000 ALTER TABLE `audios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_general_ci,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `follow_id` int(11) DEFAULT NULL,
  `follower_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (3,2,NULL,1,'2019-11-28 09:29:49','2019-11-28 09:29:49'),(4,NULL,1,2,'2019-11-28 09:29:49','2019-11-28 09:29:49'),(7,1,NULL,2,'2020-01-27 06:11:51','2020-01-27 06:11:51'),(8,NULL,2,1,'2020-01-27 06:11:51','2020-01-27 06:11:51'),(9,1,NULL,4,'2020-01-28 10:27:32','2020-01-28 10:27:32'),(10,NULL,4,1,'2020-01-28 10:27:32','2020-01-28 10:27:32'),(11,2,NULL,4,'2020-01-28 10:42:03','2020-01-28 10:42:03'),(12,NULL,4,2,'2020-01-28 10:42:03','2020-01-28 10:42:03'),(13,17,NULL,10,'2020-01-31 06:25:32','2020-01-31 06:25:32'),(14,NULL,10,17,'2020-01-31 06:25:33','2020-01-31 06:25:33'),(15,29,NULL,17,'2020-01-31 06:29:00','2020-01-31 06:29:00'),(16,NULL,17,29,'2020-01-31 06:29:00','2020-01-31 06:29:00'),(17,10,NULL,17,'2020-01-31 06:29:12','2020-01-31 06:29:12'),(18,NULL,17,10,'2020-01-31 06:29:12','2020-01-31 06:29:12'),(19,6,NULL,17,'2020-02-01 03:38:48','2020-02-01 03:38:48'),(20,NULL,17,6,'2020-02-01 03:38:48','2020-02-01 03:38:48'),(21,7,NULL,17,'2020-02-01 03:38:51','2020-02-01 03:38:51'),(22,NULL,17,7,'2020-02-01 03:38:51','2020-02-01 03:38:51'),(23,8,NULL,17,'2020-02-01 03:38:54','2020-02-01 03:38:54'),(24,NULL,17,8,'2020-02-01 03:38:54','2020-02-01 03:38:54'),(25,9,NULL,17,'2020-02-01 03:38:58','2020-02-01 03:38:58'),(26,NULL,17,9,'2020-02-01 03:38:58','2020-02-01 03:38:58'),(27,11,NULL,17,'2020-02-01 03:39:01','2020-02-01 03:39:01'),(28,NULL,17,11,'2020-02-01 03:39:01','2020-02-01 03:39:01'),(29,12,NULL,17,'2020-02-01 03:39:04','2020-02-01 03:39:04'),(30,NULL,17,12,'2020-02-01 03:39:04','2020-02-01 03:39:04'),(31,13,NULL,17,'2020-02-01 03:39:07','2020-02-01 03:39:07'),(32,NULL,17,13,'2020-02-01 03:39:07','2020-02-01 03:39:07'),(33,14,NULL,17,'2020-02-01 03:39:10','2020-02-01 03:39:10'),(34,NULL,17,14,'2020-02-01 03:39:10','2020-02-01 03:39:10');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendlists`
--

DROP TABLE IF EXISTS `friendlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendlists` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendlists`
--

LOCK TABLES `friendlists` WRITE;
/*!40000 ALTER TABLE `friendlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_genders_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_f6ca031af5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genders`
--

LOCK TABLES `genders` WRITE;
/*!40000 ALTER TABLE `genders` DISABLE KEYS */;
INSERT INTO `genders` VALUES (5,5,'2020-01-30 07:11:00','2020-01-30 07:11:00',NULL),(6,6,'2020-01-30 08:58:47','2020-01-30 08:59:01','man'),(7,7,'2020-01-30 09:43:17','2020-01-30 09:43:24','man'),(8,8,'2020-01-30 10:02:38','2020-01-30 10:02:44','man'),(9,9,'2020-01-30 10:17:40','2020-01-30 10:17:46','man'),(10,10,'2020-01-30 10:49:51','2020-01-30 10:50:07','woman'),(11,11,'2020-01-30 10:55:38','2020-01-30 10:55:56','man'),(12,12,'2020-01-30 11:18:21','2020-01-30 11:18:37','woman'),(13,13,'2020-01-30 11:49:37','2020-01-30 11:49:43','woman'),(14,14,'2020-01-30 12:11:51','2020-01-30 12:12:04','seacret'),(15,15,'2020-01-30 12:26:17','2020-01-30 12:26:17',NULL),(16,16,'2020-01-30 12:29:45','2020-01-30 12:33:12','seacret'),(17,17,'2020-01-30 12:55:25','2020-01-30 12:55:25',NULL),(18,18,'2020-01-30 14:00:10','2020-01-30 14:00:10',NULL),(19,19,'2020-01-31 03:35:59','2020-01-31 03:36:24','woman'),(20,20,'2020-01-31 03:50:11','2020-01-31 03:50:53','woman'),(21,21,'2020-01-31 04:07:51','2020-01-31 04:08:10','man'),(22,22,'2020-01-31 04:15:32','2020-01-31 04:20:07','man'),(23,23,'2020-01-31 04:28:04','2020-01-31 04:28:29','woman'),(24,24,'2020-01-31 04:59:01','2020-01-31 04:59:13','woman'),(25,25,'2020-01-31 05:04:39','2020-01-31 05:04:46','man'),(26,26,'2020-01-31 05:07:02','2020-01-31 05:07:09','seacret'),(27,27,'2020-01-31 05:14:41','2020-01-31 05:14:53','man'),(28,28,'2020-01-31 05:19:21','2020-01-31 05:19:33','woman'),(29,29,'2020-01-31 05:27:26','2020-01-31 05:27:51','seacret'),(30,30,'2020-01-31 05:30:53','2020-01-31 05:31:02','woman'),(31,31,'2020-01-31 05:35:00','2020-01-31 05:35:07','seacret'),(32,32,'2020-01-31 05:38:35','2020-01-31 05:38:43','woman'),(33,33,'2020-01-31 05:48:47','2020-01-31 05:49:25','man'),(34,34,'2020-01-31 05:52:49','2020-01-31 05:53:35','man'),(35,35,'2020-01-31 06:00:40','2020-01-31 06:02:19','man'),(36,36,'2020-01-31 06:14:35','2020-01-31 06:14:45','seacret'),(37,37,'2020-01-31 06:20:06','2020-01-31 06:21:51','seacret'),(38,38,'2020-02-01 01:19:05','2020-02-01 01:19:28','seacret'),(39,39,'2020-02-01 02:53:22','2020-02-01 02:53:41','man'),(40,40,'2020-02-01 02:57:13','2020-02-01 02:57:22','woman'),(41,41,'2020-02-01 03:03:00','2020-02-01 03:07:56','man'),(42,42,'2020-02-01 03:08:19','2020-02-01 03:08:27','seacret'),(43,43,'2020-02-01 03:11:38','2020-02-01 03:11:49','man'),(44,44,'2020-02-01 03:18:20','2020-02-01 03:18:28','seacret'),(45,45,'2020-02-01 03:28:09','2020-02-01 03:28:20','seacret'),(46,46,'2020-02-01 03:30:41','2020-02-01 03:30:50','woman'),(47,47,'2020-02-01 03:35:42','2020-02-01 03:35:52','man'),(48,48,'2020-02-01 07:31:22','2020-02-01 07:32:31','seacret'),(49,49,'2020-02-01 08:16:53','2020-02-01 08:17:36','man'),(50,50,'2020-02-01 08:24:49','2020-02-01 08:24:59','woman'),(51,51,'2020-02-01 08:32:13','2020-02-01 08:33:42','man'),(52,52,'2020-02-01 08:38:08','2020-02-01 08:38:33','man'),(53,53,'2020-02-01 08:41:47','2020-02-01 08:42:00','man'),(54,54,'2020-02-01 08:45:50','2020-02-01 08:48:06','seacret'),(55,55,'2020-02-01 08:50:42','2020-02-01 08:50:52','woman'),(56,56,'2020-02-01 08:54:40','2020-02-01 08:54:55','woman');
/*!40000 ALTER TABLE `genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `rock` tinyint(1) NOT NULL DEFAULT '0',
  `punk` tinyint(1) NOT NULL DEFAULT '0',
  `pop` tinyint(1) NOT NULL DEFAULT '0',
  `ambient` tinyint(1) NOT NULL DEFAULT '0',
  `alternative` tinyint(1) NOT NULL DEFAULT '0',
  `classic` tinyint(1) NOT NULL DEFAULT '0',
  `jazz` tinyint(1) NOT NULL DEFAULT '0',
  `hard_rock` tinyint(1) NOT NULL DEFAULT '0',
  `progressive` tinyint(1) NOT NULL DEFAULT '0',
  `pop_punk` tinyint(1) NOT NULL DEFAULT '0',
  `heavy_metal` tinyint(1) NOT NULL DEFAULT '0',
  `metalcore` tinyint(1) NOT NULL DEFAULT '0',
  `merocore` tinyint(1) NOT NULL DEFAULT '0',
  `hiphop` tinyint(1) NOT NULL DEFAULT '0',
  `instrument` tinyint(1) NOT NULL DEFAULT '0',
  `western` tinyint(1) NOT NULL DEFAULT '0',
  `japanese` tinyint(1) NOT NULL DEFAULT '0',
  `acoustic` tinyint(1) NOT NULL DEFAULT '0',
  `other1` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `other2` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `other3` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `other4` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `other5` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `emo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_genres_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_d3b5eaa516` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (5,5,'2020-01-30 07:11:00','2020-01-30 07:11:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','','','',0),(6,6,'2020-01-30 08:58:47','2020-01-30 08:59:50',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','','','',0),(7,7,'2020-01-30 09:43:17','2020-01-30 10:01:23',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,'','','','','',0),(8,8,'2020-01-30 10:02:38','2020-01-30 10:03:02',1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,'','','','','',0),(9,9,'2020-01-30 10:17:40','2020-01-30 10:18:09',0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,'','','','','',0),(10,10,'2020-01-30 10:49:51','2020-01-30 10:50:54',1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,'','','','','',0),(11,11,'2020-01-30 10:55:38','2020-01-30 10:56:48',1,0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,1,0,'','','','','',0),(12,12,'2020-01-30 11:18:21','2020-01-30 11:20:02',1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,0,0,'','','','','',0),(13,13,'2020-01-30 11:49:37','2020-01-30 11:51:17',0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,'','','','','',0),(14,14,'2020-01-30 12:11:51','2020-01-30 12:13:10',0,1,0,0,0,0,0,0,1,0,1,1,0,0,0,1,1,0,'','','','','',0),(15,15,'2020-01-30 12:26:17','2020-01-30 12:27:11',1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,'','','','','',0),(16,16,'2020-01-30 12:29:45','2020-01-30 12:33:43',1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,'','','','','',0),(17,17,'2020-01-30 12:55:25','2020-01-30 12:55:25',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','','','',0),(18,18,'2020-01-30 14:00:10','2020-01-30 14:00:10',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','','','',0),(19,19,'2020-01-31 03:35:59','2020-01-31 03:38:57',1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,0,'','','','','',1),(20,20,'2020-01-31 03:50:11','2020-01-31 03:51:59',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,'','','','','',0),(21,21,'2020-01-31 04:07:51','2020-01-31 04:09:04',1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,'','','','','',0),(22,22,'2020-01-31 04:15:32','2020-01-31 04:21:51',1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,'','','','','',0),(23,23,'2020-01-31 04:28:04','2020-01-31 04:30:11',0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,'','','','','',0),(24,24,'2020-01-31 04:59:01','2020-01-31 05:00:12',0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,'','','','','',0),(25,25,'2020-01-31 05:04:39','2020-01-31 05:05:19',1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,'','','','','',0),(26,26,'2020-01-31 05:07:02','2020-01-31 05:08:03',1,1,1,0,1,0,0,1,1,1,1,1,1,0,0,1,1,0,'シャウト系','','','','',1),(27,27,'2020-01-31 05:14:41','2020-01-31 05:16:29',1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,'','','','','',0),(28,28,'2020-01-31 05:19:21','2020-01-31 05:24:13',1,1,0,0,0,0,0,1,0,0,1,0,1,0,0,1,1,0,'','','','','',1),(29,29,'2020-01-31 05:27:26','2020-01-31 05:28:30',0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,'','','','','',0),(30,30,'2020-01-31 05:30:53','2020-01-31 05:32:57',1,0,0,1,1,1,0,0,0,0,1,1,0,0,0,1,1,0,'','','','','',0),(31,31,'2020-01-31 05:35:00','2020-01-31 05:35:50',1,0,1,0,0,1,0,1,1,0,0,0,1,0,0,1,1,0,'','','','','',1),(32,32,'2020-01-31 05:38:35','2020-01-31 05:43:05',0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,'アニソン','ボーカロイド','','','',0),(33,33,'2020-01-31 05:48:47','2020-01-31 05:50:29',0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,'EDM','','','','',0),(34,34,'2020-01-31 05:52:49','2020-01-31 05:56:02',0,0,0,0,0,0,1,0,0,0,1,1,0,1,1,1,1,1,'','','','','',1),(35,35,'2020-01-31 06:00:41','2020-01-31 06:12:10',0,1,0,1,0,0,1,0,0,1,1,1,0,0,0,1,1,0,'','','','','',0),(36,36,'2020-01-31 06:14:35','2020-01-31 06:17:02',1,1,0,0,1,0,1,0,0,1,0,0,1,0,0,1,1,1,'','','','','',0),(37,37,'2020-01-31 06:20:06','2020-01-31 06:22:44',1,1,1,0,0,0,0,1,1,1,1,1,1,0,0,1,1,0,'','','','','',1),(38,38,'2020-02-01 01:19:06','2020-02-01 02:51:52',1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,'アニソン','ボーカロイド','','','',0),(39,39,'2020-02-01 02:53:22','2020-02-01 02:55:53',1,1,1,0,0,0,0,1,0,0,0,0,1,0,0,1,1,1,'','','','','',0),(40,40,'2020-02-01 02:57:13','2020-02-01 02:59:38',1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,1,1,'','','','','',0),(41,41,'2020-02-01 03:03:00','2020-02-01 03:04:35',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,'','','','','',1),(42,42,'2020-02-01 03:08:19','2020-02-01 03:09:14',1,1,0,0,0,0,0,1,0,1,0,0,1,1,0,1,1,1,'','','','','',0),(43,43,'2020-02-01 03:11:38','2020-02-01 03:12:40',0,0,0,1,0,0,1,1,0,0,0,0,0,1,0,1,1,1,'EDM','','','','',0),(44,44,'2020-02-01 03:18:20','2020-02-01 03:23:25',0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,1,1,1,'','','','','',1),(45,45,'2020-02-01 03:28:09','2020-02-01 03:30:23',0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,'EDM','クラブミュージック','','','',0),(46,46,'2020-02-01 03:30:41','2020-02-01 03:31:27',1,1,1,0,1,0,0,0,1,1,1,1,0,0,1,1,1,1,'','','','','',1),(47,47,'2020-02-01 03:35:42','2020-02-01 03:36:52',1,1,0,0,1,0,0,1,1,1,1,1,1,0,0,1,1,0,'','','','','',1),(48,48,'2020-02-01 07:31:22','2020-02-01 08:02:09',0,0,0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,'','','','','',0),(49,49,'2020-02-01 08:16:53','2020-02-01 08:18:29',1,0,1,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0,'','','','','',0),(50,50,'2020-02-01 08:24:49','2020-02-01 08:26:00',0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,1,'','','','','',0),(51,51,'2020-02-01 08:32:13','2020-02-01 08:34:23',0,0,1,1,0,0,1,1,0,0,0,0,0,0,0,1,1,0,'','','','','',0),(52,52,'2020-02-01 08:38:08','2020-02-01 08:39:47',1,1,0,0,0,0,0,0,0,1,0,0,1,0,0,1,1,0,'','','','','',0),(53,53,'2020-02-01 08:41:47','2020-02-01 08:42:34',1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,'','','','','',1),(54,54,'2020-02-01 08:45:50','2020-02-01 08:48:50',1,1,0,0,0,0,0,0,1,0,1,1,0,0,0,1,1,0,'','','','','',1),(55,55,'2020-02-01 08:50:42','2020-02-01 08:52:57',1,1,1,0,0,0,0,0,1,1,1,1,0,1,0,1,1,1,'','','','','',1),(56,56,'2020-02-01 08:54:40','2020-02-01 08:55:54',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,'','','','','',1);
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `vocal` tinyint(1) NOT NULL DEFAULT '0',
  `guiter` tinyint(1) NOT NULL DEFAULT '0',
  `bass` tinyint(1) NOT NULL DEFAULT '0',
  `drum` tinyint(1) NOT NULL DEFAULT '0',
  `key` tinyint(1) NOT NULL DEFAULT '0',
  `dj` tinyint(1) NOT NULL DEFAULT '0',
  `sax` tinyint(1) NOT NULL DEFAULT '0',
  `violin` tinyint(1) NOT NULL DEFAULT '0',
  `other` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_instruments_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_607dc78dbe` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments`
--

LOCK TABLES `instruments` WRITE;
/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;
INSERT INTO `instruments` VALUES (5,5,'2020-01-30 07:11:00','2020-01-30 07:11:00',0,0,0,0,0,0,0,0,''),(6,6,'2020-01-30 08:58:47','2020-01-30 08:59:44',1,0,0,0,0,0,0,0,''),(7,7,'2020-01-30 09:43:17','2020-01-30 09:43:34',0,1,0,0,0,0,0,0,''),(8,8,'2020-01-30 10:02:38','2020-01-30 10:02:55',0,0,0,1,0,0,0,0,''),(9,9,'2020-01-30 10:17:40','2020-01-30 10:17:57',0,0,0,0,1,0,0,0,''),(10,10,'2020-01-30 10:49:51','2020-01-30 10:50:31',1,1,0,0,0,0,0,0,''),(11,11,'2020-01-30 10:55:38','2020-01-30 10:56:17',0,0,0,0,0,1,0,0,''),(12,12,'2020-01-30 11:18:21','2020-01-30 11:19:48',0,0,0,0,0,0,0,1,''),(13,13,'2020-01-30 11:49:37','2020-01-30 11:50:36',0,0,0,0,0,0,1,0,''),(14,14,'2020-01-30 12:11:51','2020-01-30 12:12:19',0,1,0,0,0,0,0,0,''),(15,15,'2020-01-30 12:26:17','2020-01-30 12:26:17',0,0,0,0,0,0,0,0,''),(16,16,'2020-01-30 12:29:45','2020-01-30 12:33:26',1,1,0,0,0,0,0,0,''),(17,17,'2020-01-30 12:55:25','2020-01-30 12:55:25',0,0,0,0,0,0,0,0,''),(18,18,'2020-01-30 14:00:10','2020-01-30 14:00:10',0,0,0,0,0,0,0,0,''),(19,19,'2020-01-31 03:35:59','2020-01-31 03:37:19',0,0,0,1,0,0,0,0,''),(20,20,'2020-01-31 03:50:11','2020-01-31 03:51:35',0,0,0,0,1,0,0,1,''),(21,21,'2020-01-31 04:07:51','2020-01-31 04:08:34',0,0,1,0,0,0,0,0,''),(22,22,'2020-01-31 04:15:32','2020-01-31 04:21:28',0,1,0,0,0,0,0,0,''),(23,23,'2020-01-31 04:28:04','2020-01-31 04:29:58',0,0,0,0,0,1,0,0,''),(24,24,'2020-01-31 04:59:01','2020-01-31 04:59:31',0,0,0,0,0,0,1,0,''),(25,25,'2020-01-31 05:04:39','2020-01-31 05:05:09',1,1,0,0,0,0,0,0,''),(26,26,'2020-01-31 05:07:02','2020-01-31 05:07:26',1,0,0,0,0,0,0,0,''),(27,27,'2020-01-31 05:14:41','2020-01-31 05:15:48',0,0,0,1,0,0,0,0,'カスタネット'),(28,28,'2020-01-31 05:19:21','2020-01-31 05:19:53',0,0,1,0,0,0,0,0,''),(29,29,'2020-01-31 05:27:26','2020-01-31 05:28:15',0,0,0,1,0,0,0,0,''),(30,30,'2020-01-31 05:30:53','2020-01-31 05:31:22',0,0,0,0,1,0,0,0,''),(31,31,'2020-01-31 05:35:00','2020-01-31 05:35:24',0,0,1,0,0,0,0,0,''),(32,32,'2020-01-31 05:38:35','2020-01-31 05:40:14',0,0,0,0,0,0,0,1,''),(33,33,'2020-01-31 05:48:47','2020-01-31 05:49:37',0,0,0,0,0,1,1,0,''),(34,34,'2020-01-31 05:52:49','2020-01-31 05:55:44',0,0,0,1,0,1,1,0,''),(35,35,'2020-01-31 06:00:40','2020-01-31 06:10:38',0,0,1,0,1,0,0,0,''),(36,36,'2020-01-31 06:14:35','2020-01-31 06:15:47',0,0,0,1,0,0,0,0,''),(37,37,'2020-01-31 06:20:06','2020-01-31 06:22:24',0,0,1,0,0,0,0,0,''),(38,38,'2020-02-01 01:19:06','2020-02-01 02:51:20',0,0,0,0,0,0,0,1,'タンバリン'),(39,39,'2020-02-01 02:53:22','2020-02-01 02:55:06',1,1,0,0,0,0,0,1,''),(40,40,'2020-02-01 02:57:13','2020-02-01 02:59:20',0,0,0,0,1,0,0,1,''),(41,41,'2020-02-01 03:03:00','2020-02-01 03:03:53',1,1,1,1,1,1,1,1,''),(42,42,'2020-02-01 03:08:19','2020-02-01 03:08:57',1,1,1,0,0,0,0,0,''),(43,43,'2020-02-01 03:11:38','2020-02-01 03:12:20',0,0,0,0,1,1,1,0,''),(44,44,'2020-02-01 03:18:20','2020-02-01 03:22:09',1,1,0,0,0,0,0,1,''),(45,45,'2020-02-01 03:28:09','2020-02-01 03:28:44',0,0,0,1,0,1,0,0,''),(46,46,'2020-02-01 03:30:41','2020-02-01 03:31:06',1,1,1,0,1,0,0,0,''),(47,47,'2020-02-01 03:35:42','2020-02-01 03:36:34',0,1,0,0,0,0,0,1,''),(48,48,'2020-02-01 07:31:22','2020-02-01 07:59:03',0,0,1,0,1,0,1,1,''),(49,49,'2020-02-01 08:16:53','2020-02-01 08:18:06',1,1,1,0,0,0,0,0,''),(50,50,'2020-02-01 08:24:49','2020-02-01 08:25:19',0,0,0,0,0,0,1,1,''),(51,51,'2020-02-01 08:32:13','2020-02-01 08:33:33',0,0,1,0,1,0,0,0,''),(52,52,'2020-02-01 08:38:08','2020-02-01 08:39:27',1,1,0,0,0,0,0,0,''),(53,53,'2020-02-01 08:41:47','2020-02-01 08:42:13',0,0,0,1,0,0,0,0,''),(54,54,'2020-02-01 08:45:50','2020-02-01 08:48:24',1,0,0,0,0,0,0,1,''),(55,55,'2020-02-01 08:50:42','2020-02-01 08:52:39',0,0,0,1,0,0,0,0,''),(56,56,'2020-02-01 08:54:40','2020-02-01 08:55:28',0,0,1,1,1,1,1,1,'');
/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (3,2,2,'2020-01-28 05:36:10','2020-01-28 05:36:10'),(4,18,4,'2020-01-28 12:08:39','2020-01-28 12:08:39'),(6,5,4,'2020-01-29 02:21:49','2020-01-29 02:21:49'),(7,25,2,'2020-01-29 04:44:18','2020-01-29 04:44:18'),(8,15,1,'2020-01-30 03:39:30','2020-01-30 03:39:30'),(9,46,10,'2020-01-31 06:25:29','2020-01-31 06:25:29'),(10,46,29,'2020-01-31 06:28:33','2020-01-31 06:28:33'),(11,47,17,'2020-01-31 06:29:43','2020-01-31 06:29:43'),(12,33,17,'2020-01-31 06:29:52','2020-01-31 06:29:52');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `send_id` int(11) DEFAULT NULL,
  `visited_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `like_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `friended_id` int(11) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `follower_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` VALUES (2,1,2,NULL,NULL,'2019-11-28 09:29:49','2019-11-28 11:01:04',NULL,NULL,1,1),(4,2,1,4,NULL,'2019-11-29 14:08:25','2019-12-02 04:04:39',NULL,NULL,1,NULL),(7,2,1,NULL,NULL,'2020-01-27 06:11:51','2020-01-28 12:48:35',NULL,NULL,1,2),(8,2,1,19,NULL,'2020-01-28 01:10:22','2020-01-28 12:48:35',NULL,NULL,1,NULL),(9,2,1,20,NULL,'2020-01-28 02:26:52','2020-01-28 12:48:35',NULL,NULL,1,NULL),(10,2,1,NULL,2,'2020-01-28 05:36:10','2020-01-28 12:48:35',NULL,NULL,1,NULL),(11,4,1,NULL,NULL,'2020-01-28 10:27:32','2020-01-28 12:48:35',NULL,NULL,1,4),(12,4,2,NULL,NULL,'2020-01-28 10:42:03','2020-01-29 01:21:31',NULL,NULL,1,4),(13,4,2,NULL,18,'2020-01-28 12:08:39','2020-01-29 01:21:31',NULL,NULL,1,NULL),(15,4,2,NULL,5,'2020-01-29 02:21:49','2020-01-29 02:22:01',NULL,NULL,1,NULL),(16,1,2,26,NULL,'2020-01-29 02:46:24','2020-01-29 02:46:41',NULL,NULL,1,NULL),(17,2,4,NULL,25,'2020-01-29 04:44:18','2020-01-29 04:44:28',NULL,NULL,1,NULL),(18,1,1,NULL,15,'2020-01-30 03:39:30','2020-01-30 03:39:30',NULL,NULL,0,NULL),(19,10,17,NULL,46,'2020-01-31 06:25:29','2020-01-31 06:25:42',NULL,NULL,1,NULL),(20,10,17,NULL,NULL,'2020-01-31 06:25:32','2020-01-31 06:25:42',NULL,NULL,1,10),(21,29,17,47,NULL,'2020-01-31 06:28:21','2020-01-31 06:28:45',NULL,NULL,1,NULL),(22,29,17,NULL,46,'2020-01-31 06:28:33','2020-01-31 06:28:45',NULL,NULL,1,NULL),(23,17,29,NULL,NULL,'2020-01-31 06:29:00','2020-01-31 06:29:00',NULL,NULL,0,17),(24,17,10,NULL,NULL,'2020-01-31 06:29:12','2020-01-31 06:29:12',NULL,NULL,0,17),(25,17,29,NULL,47,'2020-01-31 06:29:43','2020-01-31 06:29:43',NULL,NULL,0,NULL),(26,17,10,NULL,33,'2020-01-31 06:29:52','2020-01-31 06:29:52',NULL,NULL,0,NULL),(27,17,6,NULL,NULL,'2020-02-01 03:38:48','2020-02-01 03:38:48',NULL,NULL,0,17),(28,17,7,NULL,NULL,'2020-02-01 03:38:51','2020-02-01 03:38:51',NULL,NULL,0,17),(29,17,8,NULL,NULL,'2020-02-01 03:38:54','2020-02-01 03:38:54',NULL,NULL,0,17),(30,17,9,NULL,NULL,'2020-02-01 03:38:58','2020-02-01 03:38:58',NULL,NULL,0,17),(31,17,11,NULL,NULL,'2020-02-01 03:39:01','2020-02-01 03:39:01',NULL,NULL,0,17),(32,17,12,NULL,NULL,'2020-02-01 03:39:04','2020-02-01 03:39:04',NULL,NULL,0,17),(33,17,13,NULL,NULL,'2020-02-01 03:39:07','2020-02-01 03:39:07',NULL,NULL,0,17),(34,17,14,NULL,NULL,'2020-02-01 03:39:10','2020-02-01 03:39:10',NULL,NULL,0,17);
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_general_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `image1` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `images` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (29,'はじめまして、せいじと申します。邦楽ロック(特にバンプ、エルレなど)が好きです。歌を歌うことが好きなのでボーカルとしてバンドを組みたいです。よろしくお願いします。','2020-01-30 09:06:03','2020-01-30 09:06:03',NULL,NULL,6,NULL,NULL),(30,'ロックやパンクが好きです！邦楽・洋楽どちらも聴きます。ギタリストとしてバンドを組みたいです！ちなみにギターはテレキャスターを弾きます。よろしくお願いします。','2020-01-30 09:45:26','2020-01-30 09:45:26',NULL,NULL,7,NULL,'[\"2a10ab5256af34ea7363931dd066f208_s.jpg\"]'),(31,'サラリーマンしつつたまにドラムの練習をしてます。ロックとポップスと邦楽が好きです。ドラムを趣味としてる人や邦楽好きと繋がりたいです。バンドとかも組んでみたいと思ってます。よろしくお願いします。','2020-01-30 10:07:39','2020-01-30 10:07:39',NULL,NULL,8,NULL,'[\"drums-2708199_1920.jpg\", \"drums-2089829_1920.jpg\", \"music-691012_1920.jpg\"]'),(32,'はじめまして！\r\nピアノやキーボードを弾きます。邦楽、洋楽問わずアンビエントやオルタネイティブなどのジャンルの曲が好きです。\r\nバンドとかも興味があり価値観が合いそうな人がいれば組んでみたいと思ってます。\r\nよろしくお願いします。','2020-01-30 10:21:56','2020-01-30 10:21:56',NULL,NULL,9,NULL,NULL),(33,'ミカと申します。邦ロック全般が好きです。趣味は弾き語りです。趣味でバンド活動もしてます。ポジションはボーカルギターです。よろしくお願いします。','2020-01-30 10:53:14','2020-01-30 10:53:14',NULL,NULL,10,NULL,NULL),(34,'DJ演奏します。ヒップホップやプログレ、エモなどのジャンルが好きです。ヒップホップやプログレ、エモなどのジャンルが好きな人とバンド組んでみたいです。よろしくお願いします。','2020-01-30 11:17:13','2020-01-30 11:17:13',NULL,NULL,11,NULL,'[\"459754.jpg\"]'),(35,'音楽を聴くことが好きです。好きなジャンルは邦楽全般とクラシックが好きです。ヴァイオリン弾きます。よろしくお願いします。','2020-01-30 11:44:41','2020-01-30 11:44:41',NULL,NULL,12,NULL,NULL),(36,'ジャズを聴くのが好きです。趣味でサックスを演奏します。よろしくお願いします。','2020-01-30 12:10:37','2020-01-30 12:10:37',NULL,NULL,13,NULL,NULL),(37,'ギターを弾くことが好きです。ギター弾くことが好きな人と繋がりたいです。メタルコアとかヘヴィメタ好きな人仲良くしてください！','2020-01-30 12:24:31','2020-01-30 12:24:31',NULL,NULL,14,NULL,NULL),(38,'音楽を聴くのが好きです。好きなジャンルは邦ロックやオルタネイティブ！','2020-01-30 12:28:09','2020-01-30 12:28:09',NULL,NULL,15,NULL,NULL),(39,'アコギで弾き語りをするのが趣味です。邦ロックが好きなので邦ロックが好きな人仲良くしてください。','2020-01-30 12:40:26','2020-01-30 12:40:26',NULL,NULL,16,NULL,'[\"b49ca5d66e345b4fa50412e93bf22d9f_s.jpg\", \"music-691012_1920.jpg\", \"drums-2089829_1920.jpg\", \"e647cf6a472b62ebb925e5dac4fb426b_s.jpg\"]'),(40,'音楽を聴くのが好きで特にエモい曲が好きです。あと、趣味でドラムを叩きます。女性バンド組みたい。良かったら仲良くしてください。','2020-01-31 03:42:52','2020-01-31 03:42:52',NULL,NULL,19,NULL,NULL),(42,'ポップスや邦ロックなどの音楽が好きです。趣味でキーボードやヴァイオリンを演奏します！キーボードやヴァイオリンとしてバンドを組んでみたいです＾＾','2020-01-31 04:03:41','2020-01-31 04:03:41',NULL,NULL,20,NULL,'[\"KAZUHIRO171013186_TP_V4.jpg\", \"MOM151117291480_TP_V4.jpg\"]'),(43,'ツトムと申します。スピード感がある激しい音楽が好きです。ロック、パンクロック、メロコアなどのジャンルをよく聴きます！ロック、パンクロック、メロコア好きと繋がりたい！よろしくお願いします！','2020-01-31 04:13:05','2020-01-31 04:13:05',NULL,NULL,21,NULL,NULL),(44,'音楽で好きなジャンルは、ロックとギターインストルメントです！邦楽・洋楽どちらも聴きます。ギタリストとしてバンドを組みたいです！よろしくお願いします。','2020-01-31 04:25:53','2020-01-31 04:25:53',NULL,NULL,22,NULL,NULL),(45,'ライブに行ってきました！','2020-01-31 04:41:15','2020-01-31 04:41:15',NULL,NULL,23,NULL,'[\"046e737903eba3f2875160055ed9282d_s.jpg\", \"813ee92043fc5058e8b827120b16ce92_s.jpg\"]'),(46,'はじめまして。よろしくお願いします。','2020-01-31 06:24:50','2020-01-31 06:24:50',NULL,NULL,17,NULL,NULL),(47,'こちらこそよろしくお願いします。','2020-01-31 06:28:21','2020-01-31 06:28:21',46,NULL,29,NULL,'[\"message_yoroshiku.jpg\"]');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prefectures`
--

DROP TABLE IF EXISTS `prefectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prefectures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `area` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_prefectures_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_fde4f919b7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prefectures`
--

LOCK TABLES `prefectures` WRITE;
/*!40000 ALTER TABLE `prefectures` DISABLE KEYS */;
INSERT INTO `prefectures` VALUES (5,5,NULL,'2020-01-30 07:11:00','2020-01-30 07:11:00'),(6,6,'北海道','2020-01-30 08:58:47','2020-01-30 08:59:38'),(7,7,'青森県','2020-01-30 09:43:17','2020-01-30 09:43:28'),(8,8,'岩手県','2020-01-30 10:02:38','2020-01-30 10:02:50'),(9,9,'秋田県','2020-01-30 10:17:40','2020-01-30 10:17:52'),(10,10,'宮城県','2020-01-30 10:49:51','2020-01-30 10:50:15'),(11,11,'福島県','2020-01-30 10:55:38','2020-01-30 11:48:12'),(12,12,'山形県','2020-01-30 11:18:21','2020-01-30 11:18:54'),(13,13,'東京都','2020-01-30 11:49:37','2020-01-30 11:49:50'),(14,14,'神奈川県','2020-01-30 12:11:51','2020-01-30 12:12:11'),(15,15,NULL,'2020-01-30 12:26:17','2020-01-30 12:26:17'),(16,16,'埼玉県','2020-01-30 12:29:45','2020-01-30 12:33:21'),(17,17,NULL,'2020-01-30 12:55:25','2020-01-30 12:55:25'),(18,18,NULL,'2020-01-30 14:00:10','2020-01-30 14:00:10'),(19,19,'千葉県','2020-01-31 03:35:59','2020-01-31 03:37:01'),(20,20,'茨城県','2020-01-31 03:50:11','2020-01-31 03:51:19'),(21,21,'栃木県','2020-01-31 04:07:50','2020-01-31 04:08:24'),(22,22,'群馬県','2020-01-31 04:15:32','2020-01-31 04:20:22'),(23,23,'山梨県','2020-01-31 04:28:04','2020-01-31 04:28:54'),(24,24,'新潟県','2020-01-31 04:59:01','2020-01-31 04:59:22'),(25,25,'長野県','2020-01-31 05:04:39','2020-01-31 05:05:03'),(26,26,'富山県','2020-01-31 05:07:02','2020-01-31 05:07:20'),(27,27,'石川県','2020-01-31 05:14:41','2020-01-31 05:15:27'),(28,28,'福井県','2020-01-31 05:19:21','2020-01-31 05:19:45'),(29,29,'愛知県','2020-01-31 05:27:26','2020-01-31 05:28:03'),(30,30,'岐阜県','2020-01-31 05:30:53','2020-01-31 05:31:12'),(31,31,'静岡県','2020-01-31 05:35:00','2020-01-31 05:35:15'),(32,32,'兵庫県','2020-01-31 05:38:35','2020-01-31 05:39:01'),(33,33,'大阪府','2020-01-31 05:48:47','2020-01-31 05:49:17'),(34,34,'京都府','2020-01-31 05:52:49','2020-01-31 05:53:45'),(35,35,'奈良県','2020-01-31 06:00:40','2020-01-31 06:02:43'),(36,36,'滋賀県','2020-01-31 06:14:35','2020-01-31 06:14:57'),(37,37,'三重県','2020-01-31 06:20:06','2020-01-31 06:22:04'),(38,38,'和歌山県','2020-02-01 01:19:05','2020-02-01 01:19:38'),(39,39,'鳥取県','2020-02-01 02:53:22','2020-02-01 02:54:54'),(40,40,'島根県','2020-02-01 02:57:13','2020-02-01 02:57:34'),(41,41,'非公開','2020-02-01 03:03:00','2020-02-01 03:07:41'),(42,42,'広島県','2020-02-01 03:08:19','2020-02-01 03:08:36'),(43,43,'山口県','2020-02-01 03:11:38','2020-02-01 03:12:03'),(44,44,'香川県','2020-02-01 03:18:20','2020-02-01 03:19:14'),(45,45,'愛媛県','2020-02-01 03:28:09','2020-02-01 03:28:28'),(46,46,'徳島県','2020-02-01 03:30:41','2020-02-01 03:30:57'),(47,47,'高知県','2020-02-01 03:35:42','2020-02-01 08:02:55'),(48,48,'福岡県','2020-02-01 07:31:22','2020-02-01 07:33:01'),(49,49,'佐賀県','2020-02-01 08:16:53','2020-02-01 08:17:55'),(50,50,'長崎県','2020-02-01 08:24:49','2020-02-01 08:25:12'),(51,51,'熊本県','2020-02-01 08:32:13','2020-02-01 08:33:00'),(52,52,'大分県','2020-02-01 08:38:08','2020-02-01 08:39:33'),(53,53,'宮崎県','2020-02-01 08:41:47','2020-02-01 08:42:08'),(54,54,'鹿児島県','2020-02-01 08:45:50','2020-02-01 08:48:14'),(55,55,'沖縄県','2020-02-01 08:50:42','2020-02-01 08:52:33'),(56,56,'東京都','2020-02-01 08:54:40','2020-02-01 08:55:05');
/*!40000 ALTER TABLE `prefectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20190728131006'),('20190728144852'),('20190728145004'),('20190730021230'),('20190811022334'),('20190817024351'),('20190817083355'),('20190817084243'),('20190817084541'),('20190817094823'),('20190817142618'),('20190817142847'),('20190820122932'),('20190820133748'),('20190822112939'),('20190823062320'),('20190823164542'),('20190926013208'),('20190926013546'),('20190926065226'),('20191008012749'),('20191008012855'),('20191008090143'),('20191008090211'),('20191008090644'),('20191008090722'),('20191009063835'),('20191014101847'),('20191014102145'),('20191025074251'),('20191025100925'),('20191026031052'),('20191026045627'),('20191027044416'),('20191027051921'),('20191027052017'),('20191029054902'),('20191031063111'),('20191126120039');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serches`
--

DROP TABLE IF EXISTS `serches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serches` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vocal` tinyint(1) NOT NULL DEFAULT '0',
  `guiter` tinyint(1) NOT NULL DEFAULT '0',
  `bass` tinyint(1) NOT NULL DEFAULT '0',
  `drum` tinyint(1) NOT NULL DEFAULT '0',
  `key` tinyint(1) NOT NULL DEFAULT '0',
  `dj` tinyint(1) NOT NULL DEFAULT '0',
  `sax` tinyint(1) NOT NULL DEFAULT '0',
  `violin` tinyint(1) NOT NULL DEFAULT '0',
  `other_instrument` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `emo` tinyint(1) NOT NULL DEFAULT '0',
  `rock` tinyint(1) NOT NULL DEFAULT '0',
  `punk` tinyint(1) NOT NULL DEFAULT '0',
  `pop` tinyint(1) NOT NULL DEFAULT '0',
  `ambient` tinyint(1) NOT NULL DEFAULT '0',
  `alternative` tinyint(1) NOT NULL DEFAULT '0',
  `classic` tinyint(1) NOT NULL DEFAULT '0',
  `jazz` tinyint(1) NOT NULL DEFAULT '0',
  `hard_rock` tinyint(1) NOT NULL DEFAULT '0',
  `progressive` tinyint(1) NOT NULL DEFAULT '0',
  `pop_punk` tinyint(1) NOT NULL DEFAULT '0',
  `heavy_metal` tinyint(1) NOT NULL DEFAULT '0',
  `metalcore` tinyint(1) NOT NULL DEFAULT '0',
  `merocore` tinyint(1) NOT NULL DEFAULT '0',
  `hiphop` tinyint(1) NOT NULL DEFAULT '0',
  `instrument` tinyint(1) NOT NULL DEFAULT '0',
  `western` tinyint(1) NOT NULL DEFAULT '0',
  `japanese` tinyint(1) NOT NULL DEFAULT '0',
  `acoustic` tinyint(1) NOT NULL DEFAULT '0',
  `other_genre` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `word` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `area` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serches`
--

LOCK TABLES `serches` WRITE;
/*!40000 ALTER TABLE `serches` DISABLE KEYS */;
INSERT INTO `serches` VALUES (28,1,'2020-01-25 04:19:29','2020-01-25 04:19:29','man',0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,'','',''),(53,4,'2020-01-28 12:14:34','2020-01-28 12:14:34','man',1,0,0,0,0,0,0,0,'',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',''),(55,2,'2020-01-30 02:55:12','2020-01-30 02:55:12',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,'','',''),(63,7,'2020-01-30 09:55:45','2020-01-30 09:55:45',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','青森県'),(69,14,'2020-01-30 12:25:49','2020-01-30 12:25:49','woman',0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',''),(73,22,'2020-01-31 04:22:59','2020-01-31 04:22:59',NULL,0,1,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',''),(76,23,'2020-01-31 04:42:14','2020-01-31 04:42:14',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','エモ',''),(78,27,'2020-01-31 05:15:18','2020-01-31 05:15:18',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','富山県'),(84,30,'2020-01-31 05:32:16','2020-01-31 05:32:16',NULL,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',''),(91,32,'2020-01-31 05:45:39','2020-01-31 05:45:39','man',0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','福島県'),(93,33,'2020-01-31 05:49:05','2020-01-31 05:49:05',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','兵庫県'),(100,34,'2020-01-31 05:58:31','2020-01-31 05:58:31',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','大阪府'),(101,36,'2020-01-31 06:15:09','2020-01-31 06:15:09',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','奈良県'),(102,10,'2020-01-31 06:25:21','2020-01-31 06:25:21',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','ゲスト',''),(103,29,'2020-01-31 06:26:19','2020-01-31 06:26:19',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','ゲスト',''),(108,38,'2020-02-01 02:51:09','2020-02-01 02:51:09',NULL,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',''),(110,43,'2020-02-01 03:16:11','2020-02-01 03:16:11',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','広島県'),(118,44,'2020-02-01 03:26:43','2020-02-01 03:26:43',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','あ',''),(121,48,'2020-02-01 07:33:39','2020-02-01 07:33:39',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','徳島県'),(122,51,'2020-02-01 08:33:07','2020-02-01 08:33:07',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','長崎県'),(124,52,'2020-02-01 08:39:15','2020-02-01 08:39:15',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','熊本県'),(125,54,'2020-02-01 08:45:59','2020-02-01 08:45:59',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','カツ丼',''),(127,56,'2020-02-01 08:58:29','2020-02-01 08:58:29',NULL,0,0,1,0,0,0,0,0,'',0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',''),(172,17,'2020-02-02 05:35:12','2020-02-02 05:35:12',NULL,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','青森県');
/*!40000 ALTER TABLE `serches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `failed_attempts` int(11) NOT NULL DEFAULT '0',
  `unlock_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `background` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `public_uid` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  UNIQUE KEY `index_users_on_unlock_token` (`unlock_token`),
  UNIQUE KEY `index_users_on_public_uid` (`public_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'1120995541775577088-twitter@example.com','$2a$11$IQdoUPhhL1Gl/a14sY8BFemwNORXfi3vujnA0MnYYtpbDrDxHu7u.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 07:11:00','2020-01-30 07:11:00','1120995541775577088','twitter','コバン','neko2kobandanya',NULL,NULL,NULL,NULL,'1174f10b'),(6,'1@1','$2a$11$iBha4FzOpH40clxyZK19j.pJBJI5W76XS4Q.CSi14sx1dRxx2df5O',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 08:58:46','2020-01-30 09:25:15',NULL,NULL,'せいじ',NULL,NULL,'8236.jpg','邦楽ロック(特にバンプ、エルレなど)が好きです。歌を歌うことが好きで弾き語りをします。ボーカルとしてバンドを組みたいです。よろしくお願いします。','fa6a7524cd79eadd13eef721564ee672_s.jpg','8e4fe655'),(7,'2@2','$2a$11$umNeR13pngE5YlDnonrR8OicZGxirvBjhkCCTT01FiVe9yGLQavRW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 09:43:17','2020-01-30 09:44:55',NULL,NULL,'あつし',NULL,NULL,'businessman_dekiru.jpg','ロックやパンクが好きです！邦楽・洋楽どちらも聴きます。ギタリストとしてバンドを組みたいです！よろしくお願いします。','2a10ab5256af34ea7363931dd066f208_s.jpg','57ed267a'),(8,'3@3','$2a$11$hTowijFpSH2QyQLGngz0pOM.6ZK0oyid0ggHKgQkvf7iXp2eY5zLC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 10:02:38','2020-01-30 10:05:10',NULL,NULL,'ひさし',NULL,NULL,'syorui_yomu_man.jpg','サラリーマンしつつたまにドラムの練習をしてます。ロックとポップスと邦楽が好きです。ドラムを趣味としてる人や邦楽好きと繋がりたいです。','instruments-801271_1920.jpg','7efdd09b'),(9,'4@4','$2a$11$OPNVepOhUaQxjT4jq2in8OIEehd.heeHdfPEiKCS98USnb.NZmrqC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 10:17:40','2020-01-30 10:21:14',NULL,NULL,'アキラ',NULL,NULL,'megane_wareru_man.jpg','ピアノやキーボードを弾きます。邦楽、洋楽問わずアンビエントやオルタネイティブなどのジャンルの曲が好きです。よろしくお願いします。','PAKPIANO9V9A7324_TP_V4.jpg','353e03a4'),(10,'5@5','$2a$11$VvvH8IEWASlZYNMjoLAj.uO0756xmsFokMFr4vwx4Z8DqYreh2nCy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 10:49:51','2020-01-30 10:53:03',NULL,NULL,'ミカ',NULL,NULL,'ok_woman.jpg','ミカと申します。邦ロック全般が好きです。趣味は弾き語りです。趣味でバンド活動もしてます。ポジションはボーカルギターです。よろしくお願いします。','30f62c5d2d810e08193584db04e9e821_s.jpg','df9eb866'),(11,'6@6','$2a$11$q08jRY9o.25sTblc1ZEIgOfhHNqoXI4MPsNdRWuUv074kvjNxNvAa',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 10:55:38','2020-01-30 11:15:21',NULL,NULL,'ケイイチ',NULL,NULL,'598936.jpg','DJ演奏します。ヒップホップやプログレ、エモなどのジャンルが好きです。ヒップホップやプログレ、エモなどのジャンルが好きな人とバンド組んでみたいです。','b49ca5d66e345b4fa50412e93bf22d9f_s.jpg','d2d9f0ae'),(12,'7@7','$2a$11$4AWFTKYplV0V32XMZ3NUpOwO8pT.MbVASbczeOYTlT5JB7tRFVjgC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 11:18:21','2020-01-30 11:43:21',NULL,NULL,'谷口麻里',NULL,NULL,'musician_violin_usagi.jpg','音楽を聴くのも演奏するのも好きです。ヴァイオリン弾きます。好きなジャンルは邦楽全般とクラシックが好きです。','MOM151117291480_TP_V4.jpg','5e52aa25'),(13,'8@8','$2a$11$BAqYcoIbDSpV//LGUpVcNen.6rGoEvDRccV2CUy1ZHToQ6IduCAoW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 11:49:37','2020-01-30 12:11:00',NULL,NULL,'マホ',NULL,NULL,'579854.jpg','ジャズを聴くのが好きです。ジャズバンドを組んでみたいです。','1428591.jpg','0f892ab1'),(14,'9@9','$2a$11$3G9uuKZDmhbhUTErYtezXuhRzcQOxwGTb1yWFVQpG1p580gKckWBe',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 12:11:51','2020-01-30 12:24:39',NULL,NULL,'ギター好き',NULL,NULL,'OOK0I9A1982_TP_V4.jpg','ギターを弾くことが好きです。ギター弾くことが好きな人と繋がりたいです。メタルコアとかヘヴィメタ好きな人仲良くしてください！','c9c90826b04c498e3c1ddc398df12ba9_s.jpg','2a94e933'),(15,'10@10','$2a$11$yZWvoolbtP0oDFPAwbrZJexW8.hFBpLBpekYm0PNXUAKTPJh8pdYW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 12:26:17','2020-01-30 12:27:54',NULL,NULL,'下田春秋',NULL,NULL,NULL,'音楽を聴くのが好きです。好きなジャンルは邦ロックやオルタネイティブ！',NULL,'bbd8e99e'),(16,'11@11','$2a$11$sJWjA6eipkpM05j.63DuXe9qm5vHcpYARUaDtuFC1izfb1QIwtl9e',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 12:29:45','2020-01-30 12:34:31',NULL,NULL,'かな',NULL,NULL,'012ELFA191116_TP_V4.jpg','アコギを弾くことと歌うことが好きです。','fa6a7524cd79eadd13eef721564ee672_s.jpg','301fdc14'),(17,'test@test','$2a$11$iQkUzjBa0gW2LBwW0BMkkuXWPgNqTHTyEjQ3Ma6MuxO/8m5VLKzz6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 12:55:25','2020-01-30 12:55:25',NULL,NULL,'ゲスト',NULL,NULL,NULL,NULL,NULL,'bee01c21'),(18,'156051975587538-facebook@example.com','$2a$11$vjKwZtFXXZ9jJDbtgf8g8u4uDnMAML9rxZDLSdqho7rfZ9qvXCJbK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-30 14:00:10','2020-01-30 14:00:10','156051975587538','facebook','長谷川直人',NULL,NULL,NULL,NULL,NULL,'6c00b6ec'),(19,'13@13','$2a$11$s.HOgrAPvmPSyG1R/cSWh.h2FQ1xaywdXdoagRJer6Loot3t0trqm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 03:35:58','2020-01-31 03:41:07',NULL,NULL,'はるみ',NULL,NULL,'drums-2708199_1920.jpg','趣味でドラムを叩きます。女性バンド組みたい。','kumakichi923_51_TP_V4.jpg','67027e16'),(20,'12@12','$2a$11$M9R8wbnQRgSgfwAL5rQo2ODO983dz0vqSlPhjFirJepR0hgxUScUq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 03:50:11','2020-01-31 03:59:54',NULL,NULL,'カオリ',NULL,NULL,'pose_kiri_woman.jpg','ポップスや邦ロックなどの音楽が好きです。趣味でキーボードやヴァイオリンを演奏します！キーボードやヴァイオリンとしてバンドを組んでみたいです＾＾','music_piano.jpg','c3047143'),(21,'14@14','$2a$11$sVXDJemlutWw09nVdz2lHubR4nF/g7TEYqp7xUHiYDD7oQ4rh7rhG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 04:07:50','2020-01-31 04:12:42',NULL,NULL,'ツトム',NULL,NULL,'bass-guitar-1841186_1920.jpg','ツトムと申します。スピード感がある激しい音楽が好きです。ロック、パンクロック、メロコアなどのジャンルをよく聴きます！ロック、パンクロック、メロコア好きと繋がりたい！','maeda3gou1230073_TP_V4.jpg','dd57fb41'),(22,'15@15','$2a$11$IEZUoUn88FxRDmhS9714GulCPyIkzaRQELPsbA2ipc.ACbxp9HE3e',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 04:15:32','2020-01-31 04:25:34',NULL,NULL,'西片辰雄',NULL,NULL,'c9c90826b04c498e3c1ddc398df12ba9_s.jpg','音楽で好きなジャンルは、ロックとギターインストルメントです！邦楽・洋楽どちらも聴きます。ギタリストとしてバンドを組みたいです！よろしくお願いします。','c4ecabdcc71e5bad7779d585ba6720b9_s.jpg','3c4c71b8'),(23,'16@16','$2a$11$OJmXBfxX9JJ7kxIowb3T0uK5XMbsd34Ja4luIcec4aL4L37MuZhVS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 04:28:04','2020-01-31 04:40:24',NULL,NULL,'酒井聡美',NULL,NULL,'813ee92043fc5058e8b827120b16ce92_s.jpg','ヒップホップが好き。たまにクラブに行ってDJを演奏します。','3aa4686842f627da8aea70f6f9fbd88d_s.jpg','e90e79c6'),(24,'17@17','$2a$11$OIWnjkOl1aRUsdqfzwVwGuWkWmGWcrqEkU.FDpBhlkuUIMLckK1n.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 04:59:01','2020-01-31 05:03:38',NULL,NULL,'奥谷千佳',NULL,NULL,'music_saxphone.jpg','ジャズを聴きます。ときどきセッションでサックスを演奏します。','012ELFA191116_TP_V4.jpg','ff4f1372'),(25,'18@18','$2a$11$EFBr7055mkQWqH20pM56sOc9Fnwx7V8QMlv6PNblqs1sgEKRSR7ru',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 05:04:39','2020-01-31 05:06:40',NULL,NULL,'ススム',NULL,NULL,'music_hikigatari_stand_man.png.jpg','歌を歌います。ロック、パンク、メロコアを中心にロックンロールな音楽が好きです！','cc8d043beb07f06fc397b0b3160c2533_s.jpg','95cad388'),(26,'19@19','$2a$11$qmiQujXV2cLzWE8WyR2uuuMkkGGCJwgf.fuJHLiqIP639y2Lwn45.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 05:07:01','2020-01-31 05:10:47',NULL,NULL,'歌好き',NULL,NULL,'microphone2_man-2.jpg','とにかく歌を歌うことが好き。バンドを組んで歌いたい。どんなジャンルでもおkです！誰かバンド組みませんか？','animal_music_band.jpg','e179e144'),(27,'20@20','$2a$11$ASzN0XXfqnnPAYrFyXbH2eM7J8afG0YONHFRerTcUKTXNwSOYBgSu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 05:14:41','2020-01-31 05:18:51',NULL,NULL,'まさのぶ',NULL,NULL,'business_man2_4_think.jpg','石川在住。サラリーマンしつつ趣味でドラムを叩きます。ロックが好きです。','drums-2708199_1920.jpg','c8d5b00a'),(28,'21@21','$2a$11$wOwHhyj4wcoO9HNfj2PCwOvhli.pnKWCGw6BFQvGGzNbmFtgqF8YS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 05:19:21','2020-01-31 05:26:58',NULL,NULL,'アーモンド',NULL,NULL,'chocolate_almond.jpg','ベース弾きます。邦ロックやパンク、ヘヴィメタルなど割と激しい曲が好きです。','AMEMAN1222029_TP_V4.jpg','1b9a125d'),(29,'22@22','$2a$11$tXICiW8pkn8yoFzrq068ZOYO8KrZNmVOCz8HEjGQMxlu7OP.Ep5OS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 05:27:26','2020-01-31 05:29:55',NULL,NULL,'アイスクリーム',NULL,NULL,'sweets_icecream.jpg','最近ドラムをはじめました。メタルコアとヘヴィーメタルが好きです。ドラム上手くなりたい。','bde6676c3326c10b16edb9f8066cc832_s.jpg','c66be4e2'),(30,'23@23','$2a$11$x3wNNge8XT9iYU0jcyOHl.MzVtCH7r.Sm3SVbeOYzdPKW/imWDSlu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 05:30:53','2020-01-31 05:34:28',NULL,NULL,'りんご',NULL,NULL,'fruit_apple.jpg','はじめまして！プロフィールを見に来ていただきありがとうございます。こちらキーボードを弾きます。アンビエントや邦ロックのコピーバンドを組みたいです！','017RED1124B_TP_V4.jpg','6fa86661'),(31,'24@24','$2a$11$5eLRb72Y/uMZVJ7Q7qv7nuUhg/KwBzYPeD1Cn.kWfk.s2sv0uUYRi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 05:35:00','2020-01-31 05:38:04',NULL,NULL,'ケーキ',NULL,NULL,'sweets_shortcake.jpg','静岡県在住のベーシストです。担当ジャンルは邦ロック全般、メロコア、プログレ、エモなど。あと、ケーキが好きです。','guitar-2275020_1920.jpg','fb4db272'),(32,'25@25','$2a$11$BSKViWVEtfaNMiNKRZsJ7.7GXnVtLfiozdoCHnyALleVvVrEnLHI.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 05:38:35','2020-01-31 05:42:47',NULL,NULL,'みかん',NULL,NULL,'fruit_orange.jpg','ヴァイオリンを弾きます。アニソンとクラシック、インストルメントが好き。ヴァイオリンとしてバンド組んでみたいです。','AME20181123B003_TP_V4.jpg','50b1f8ea'),(33,'26@26','$2a$11$Pd5g8H3bQ37IP3VMG4I5GuSWLYqDCPHBCLdQV94chPFSoICCVShim',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 05:48:47','2020-01-31 05:52:17',NULL,NULL,'クッキー',NULL,NULL,'sweets_cookie.jpg','ヒップホップ、ジャズ、EDMが好き。DJとサックスを演奏します。バンドとかで力を貸せそうでしたら是非お誘いください。よろしくお願いします。','813ee92043fc5058e8b827120b16ce92_s.jpg','69e37358'),(34,'27@27','$2a$11$10XjOBXCvdgdnM0Iqyp9NeeyJvOUm5OHkI6oRpUNe/2CD3naMTkmK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 05:52:49','2020-01-31 05:57:53',NULL,NULL,'クレープ',NULL,NULL,'sweets_crape.jpg','ジャズ、ヒップホップ、メタルなどのジャンルを聴きます。学生時代から10年ほどDJとサックスを演奏してきました。最近はドラムも練習してます。','046e737903eba3f2875160055ed9282d_s.jpg','7b0c4429'),(35,'28@28','$2a$11$2g7Rb8uEJD7ixLQBgCkNjeZPgZpICeoqkhKO8Qqv0kfUPiD6zss/K',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 06:00:40','2020-01-31 06:13:02',NULL,NULL,'チョコレート',NULL,NULL,'valentinesday_itachoco2.jpg','ベーシストです。たまにキーボードも弾きます。パンクとメタルとアンビエントが好きです。ベーシストとしてバンド組みたいです。','MS251_baseushirosugata_TP_V4.jpg','644ce5da'),(36,'29@29','$2a$11$k2zE7hnqTSS7HzTR2UzIuOY19nttAOzF7TJbj.kkUQ6lOPF5BgpMq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 06:14:35','2020-01-31 06:19:34',NULL,NULL,'ティラミス',NULL,NULL,'sweets_tiramisu.jpg','ドラムを叩きます。ロック、パンク、オルタネイティブ、ジャズなど嗜む音楽ジャンルは多岐に渡ります。いろんな人と繋がりたい。','drumset.jpg','68aec8b0'),(37,'30@30','$2a$11$boNlKEaR59VZgUdBX78RjugjGZLgkHsjEzOTbAKU462mtdizEV/UK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-01-31 06:20:06','2020-01-31 06:23:43',NULL,NULL,'バウムクーヘン',NULL,NULL,'character_baumkuchen.jpg','ベーシストです。音楽は色々なジャンルを程よく聴きます。バンドはどんな曲でも対応できます。バンドのお誘い募集してます。','KMA19730016_TP_V4.jpg','f297315a'),(38,'31@31','$2a$11$yhR39741OKAegWDJOD9ZDuOJEc6sKo4Fh9FznjpJ76Xm7c8fjHcqS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 01:19:05','2020-02-01 02:52:59',NULL,NULL,'虹',NULL,NULL,'lgbt_rainbow_flag.jpg','虹と申します。ヴァイオリンを10年以上弾いていますのでヴァイオリンとしてバンドを組んでみたいです。好きなジャンルはボカロとアニソンと邦ロック全般、ときどきハードロックです。あと、タンバリンも叩けます。','hawaii_rainbow.jpg','f09eacb6'),(39,'32@32','$2a$11$Y43xYlG58xSyR3B4RyBXTOYa01l/mdZ.fd1cq1dPcGo6kCYuzQgp6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 02:53:22','2020-02-01 02:56:24',NULL,NULL,'空',NULL,NULL,'kumo_bg.jpg','ギターとヴァイオリン弾きます。同じジャンルの音楽が好きな人と繋がりたい。','bg_ocean_suiheisen.jpg','d90d1bcd'),(40,'33@33','$2a$11$B/Q7uxOJr1ph7rl0U0Este2Lc95GNme0taZXHxSx9qLc8e.BPL65q',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 02:57:13','2020-02-01 03:02:40',NULL,NULL,'風',NULL,NULL,'saigai_tatsumaki.jpg','風と申します。バイオリンとピアノを6年以上弾いています。ピアノの方が得意なのでキーボードとしてバンドを組みたいです。好きなジャンルは邦ロック、アンビエント、ポップパンクなど。','arashi.jpg','ad209185'),(41,'34@34','$2a$11$ZYqIujIoPpPxayR7lKYS6OnBST/4RNq/EDHBeg4l5ZcVnWYjKPEWG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 03:03:00','2020-02-01 03:05:54',NULL,NULL,'雨リーマン',NULL,NULL,'sotomawari_ame_man.jpg','担当パートはありません。一応、全部そこそこ演奏できます。ジャンルは、なんでもいいのでバンド組んでみたいです。','bg_rain_natural_mori.jpg','54bc76dd'),(42,'35@35','$2a$11$gk5mo1kOtZflhigTZFC59.g/cQns8lAIvWYzafK3i2AXInoChpmyG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 03:08:19','2020-02-01 03:11:17',NULL,NULL,'飛行機',NULL,NULL,'hikouki_gumo.jpg','飛行機と申します。いろんなジャンルの音楽を聴きますが特に好きなジャンルはパンク。パンク好きと繋がりたい。担当パートはギターボーカルとベース。','2a10ab5256af34ea7363931dd066f208_s.jpg','63f16723'),(43,'36@36','$2a$11$7Nk74gl9BxvcBgkTOc7qFevcntSSdYCjgfCqjmQcBPEzayXUXmGIq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 03:11:38','2020-02-01 03:17:58',NULL,NULL,'睡眠不足',NULL,NULL,'pet_cat_omoi_sleep_man.jpg','キーボードとDJとサックスを趣味で演奏します。眠い。音楽はジャズとヒップホップとEDMが特に好き。ときどきハードロックも聴きます。','nebusoku.jpg','ddffaae6'),(44,'37@37','$2a$11$YeHuIYZFMagx7.AjfbypF.GqBKcLFoaltQXYicnt7QmKlu1TUU/6.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 03:18:20','2020-02-01 03:26:38',NULL,NULL,'太陽',NULL,NULL,'taiyou.jpg','学生時代にギターボーカルとしてバンドを組んでました。ハードロックとエモとメロコアが好き。ヴァイオリンも弾きます。','space01_sun.jpg','4fb0d355'),(45,'38@38','$2a$11$8xcgkcNyPZg0cmDg7P6.cuUAM4mUgfVUXYnIwlh3kL8s5GBDkOpm.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 03:28:09','2020-02-01 03:30:07',NULL,NULL,'月',NULL,NULL,'space04_moon.jpg','ドラムを叩いたりDJを演奏するのが趣味です。たまにクラブに出没します。好きなジャンルはEDMとヒップホップとクラブミュージック！','tsukimi_jugoya.jpg','2a9c4a52'),(46,'39@39','$2a$11$7yhs9vYr6vA/PqJO07mHp.ixzgyGQtU4iYy31Ra2L4FM13bdnwNa2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 03:30:41','2020-02-01 03:35:25',NULL,NULL,'光',NULL,NULL,'question_head_girl.jpg','学生時代にベーシストとしてバンドを組んでました。次に組むならボーカルギターとしてバンドを組んでみたい。ジャンルは特に定まっていません。なんでも聴きます。','046e737903eba3f2875160055ed9282d_s.jpg','089dfb0f'),(47,'40@40','$2a$11$o3J2NYJWu7RpKH9x8UWxAuaP5eR6rG2XsmosN2bs9U0Qg5elw7AVW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 03:35:42','2020-02-01 03:38:25',NULL,NULL,'夜',NULL,NULL,'7a4d12a8b124df976cca94c611e53ddc_s.jpg','ボーカルギターとしてプロを目指してバンド活動をしています。趣味でもバンドを組みたい。趣味バンドを組むならヴァイオリンとしてバンドを組みたいです。音楽はいろんなジャンルを聴きますが、中でもパンクやメタルの中のエモい曲が好きです。','30f62c5d2d810e08193584db04e9e821_s.jpg','bf5d83dc'),(48,'41@41','$2a$11$yJISyisc35ECtBv2gc2.ROzWkciEJYmwQywf5lCH3cdeBaDHxRQVO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 07:31:21','2020-02-01 08:02:18',NULL,NULL,'おにぎり',NULL,NULL,'onigiri_maru.jpg','ピアノ歴:10年、ヴァイオリン&ベース歴: 5年です。音楽はジャズやクラシック、オルタネイティブロック、プログレをよく聴きます。','food_onigiri.jpg','c5af2023'),(49,'42@42','$2a$11$qjT9GEcVaI8U.5I/Y8vYCeCCyKMtyAtCIbjxJPSTbB0Ep5BxQTZL2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 08:16:53','2020-02-01 08:24:18',NULL,NULL,'からあげ',NULL,NULL,'karaage.jpg','佐賀在住。唐揚げが好き。ロック、ポップス、ジャズ、ハードロックが好き。ポジションは、ボーカルギターとベース。','building_karaage.jpg','15c56fdf'),(50,'43@43','$2a$11$y89ac9xKZFPdR8HgALhBeep8IdeaREoJfArZUNiWCSNCHEna2OiZa',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 08:24:49','2020-02-01 08:30:13',NULL,NULL,'プリン',NULL,NULL,'sweets_purin_normal.jpg','ヴァイオリンとサックス演奏します。アンビエントやジャズ、クラシックが好き。デザートはプリンが好き。','food_okosama_lunch.jpg','ed3d7b57'),(51,'44@44','$2a$11$qUmabBwKGKH./7Hqf.SGlOUIZNp78lsiQ3DC7atwIZLyJuL4vpfXK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 08:32:13','2020-02-01 08:37:43',NULL,NULL,'オムライス',NULL,NULL,'food_omurice.jpg','好きな音楽は、ポップス、アンビエント、ジャズ、ハードロック。担当パートはベースとキーボード！誰かバンド組みましょう〜！','KAZUHIRO171013186_TP_V4.jpg','946f9944'),(52,'45@45','$2a$11$ZQvMwjzR8pBI6AvIXqvG..kDC8LY7KsMScY9LPfHNmU2kpW.r0GPm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 08:38:08','2020-02-01 08:41:27',NULL,NULL,'カレー',NULL,NULL,'syokuji_curry_man.jpg','ボーカルギターとしてバンドを組みたいです！音楽で好きなジャンルはロックやパンクです！邦楽・洋楽どちらも聴きます。よろしくお願いします。','vegetable_curry.jpg','36b32dbb'),(53,'46@46','$2a$11$W9Bhw6vWUHoiN8jIqQc/GOucno6zpRb.WaGH/TuDJvtPxfu2tTQL6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 08:41:47','2020-02-01 08:45:20',NULL,NULL,'チーズドッグ好き',NULL,NULL,'frankfurt_boy2.jpg','ドラム叩きます。音楽を聴くのも演奏するのも好きです。好きなジャンルはロック全般で特にエモい曲が好きです。','americandog.jpg','a3d75eaf'),(54,'47@47','$2a$11$0pvpVX/1foycCqw.g39wIODM1dlzDhfk4rJFp8i33PpqXtyJ91JX.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 08:45:50','2020-02-01 08:50:18',NULL,NULL,'カツ丼',NULL,NULL,'food_katsudon.jpg','佐賀在住。ロック、メタルなどの中で特にエモい曲が好き。ポジションは、ボーカルとヴァイオリン。あとカツ丼も好き。','8347a129b5e2b1ca5daf267930d53818_s__1_.jpg','6b7e62d0'),(55,'48@48','$2a$11$hwR9x3FCYYG9GDlSY14Eeu8EUnfYEvq5bNaWXfqilDLZCNEGM1u7S',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 08:50:42','2020-02-01 08:54:18',NULL,NULL,'くま',NULL,NULL,'animal_music_band_drum.jpg','くまと申します。趣味はドラムを叩くこと。バンド活動してみたい。ロックとメタル全般が好きです。よろしくお願いします！','animal_chara_smartphone_kuma.jpg','cd96e9b3'),(56,'49@49','$2a$11$VGfGeNd0sVHctWKHf7tZ6OHcjghsdlB.B6BMIGewQbCKlcMC6z6S2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2020-02-01 08:54:40','2020-02-01 08:58:09',NULL,NULL,'犬',NULL,NULL,'yukuefumei_pet_dog.jpg','楽器はボーカルとギター以外でしたらなんでもできます。ジャンルはオールジャンル好きです！いろんな曲のコピーバンドを組みたい。','inugoya_dog.jpg','261a5276');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-02 17:33:51
