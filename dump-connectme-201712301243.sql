-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: connectme
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `article_category_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_article_category_FK` (`article_category_id`),
  KEY `article_user_FK` (`user_id`),
  CONSTRAINT `article_article_category_FK` FOREIGN KEY (`article_category_id`) REFERENCES `article_category` (`id`),
  CONSTRAINT `article_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--

LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award`
--

DROP TABLE IF EXISTS `award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seeker_profile_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `held_date` date NOT NULL,
  `news_url` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `awards_seeker_profile_FK` (`seeker_profile_id`),
  CONSTRAINT `awards_seeker_profile_FK` FOREIGN KEY (`seeker_profile_id`) REFERENCES `seeker_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award`
--

LOCK TABLES `award` WRITE;
/*!40000 ALTER TABLE `award` DISABLE KEYS */;
INSERT INTO `award` VALUES (1,1,'test','2017-12-27','','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>','2017-12-28 06:10:17','2017-12-29 06:32:25');
INSERT INTO `award` VALUES (2,1,'next generation','2017-12-14','http://connectme.local/gii/model','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.best</p>','2017-12-28 07:32:28','2017-12-29 06:32:25');
INSERT INTO `award` VALUES (3,2,'test','2017-12-06','','haha','2017-12-29 07:15:34','2017-12-29 07:15:34');
/*!40000 ALTER TABLE `award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `profile_description` varchar(1000) NOT NULL,
  `establishment_date` date NOT NULL,
  `company_website_url` varchar(500) DEFAULT NULL,
  `company_image` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_user_FK` (`user_id`),
  CONSTRAINT `company_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `qualification` text NOT NULL,
  `requirements` text NOT NULL,
  `oppotunity` text,
  `location` varchar(255) DEFAULT NULL,
  `date_created` date NOT NULL,
  `date_closed` date DEFAULT NULL,
  `show_salary` tinyint(4) DEFAULT '0',
  `start_salary` decimal(10,2) NOT NULL,
  `end_salary` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_company_FK` (`company_id`),
  CONSTRAINT `jobs_company_FK` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1513837310);
INSERT INTO `migration` VALUES ('m150828_085134_init_user_tables',1513837312);
INSERT INTO `migration` VALUES ('m161109_112016_rename_user_table',1513837312);
INSERT INTO `migration` VALUES ('m170608_141511_rename_columns',1513837313);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seeker_profile`
--

DROP TABLE IF EXISTS `seeker_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seeker_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `seeker_name` varchar(255) NOT NULL,
  `short_bio` varchar(250) DEFAULT NULL,
  `grade` decimal(4,2) DEFAULT NULL,
  `degree` varchar(100) NOT NULL,
  `field_of_study` varchar(100) NOT NULL,
  `from_year` varchar(4) NOT NULL,
  `to_year` varchar(4) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `gender` varchar(100) NOT NULL,
  `is_active` tinyint(4) DEFAULT '0',
  `contact_number` varchar(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seeker_profile_user_FK` (`user_id`),
  CONSTRAINT `seeker_profile_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seeker_profile`
--

LOCK TABLES `seeker_profile` WRITE;
/*!40000 ALTER TABLE `seeker_profile` DISABLE KEYS */;
INSERT INTO `seeker_profile` VALUES (1,1,'bambang sinaga','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure do',NULL,'Associate\'s degree','Computer Sciences','2011','2014','eYqg3TNjypGien9nBv6C829Uh8BCld8D.jpg','Male',0,'082369253486','2017-12-27 04:55:42','2017-12-29 06:32:25');
INSERT INTO `seeker_profile` VALUES (2,2,'lungguk parulian','good luck :)',NULL,'Bachelor Computer science','Engineering','2011','2014','DFcSAPtFkci4LezYTwyDZtqunug9x_Zu.jpg','Male',0,'','2017-12-29 07:15:34','2017-12-29 07:28:47');
/*!40000 ALTER TABLE `seeker_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seeker_skill_set`
--

DROP TABLE IF EXISTS `seeker_skill_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seeker_skill_set` (
  `seeker_profile_id` int(11) NOT NULL,
  `skill_set_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`seeker_profile_id`,`skill_set_id`),
  KEY `seeker_skill_set_skill_set_FK` (`skill_set_id`),
  CONSTRAINT `seeker_skill_set_seeker_profile_FK` FOREIGN KEY (`seeker_profile_id`) REFERENCES `seeker_profile` (`id`),
  CONSTRAINT `seeker_skill_set_skill_set_FK` FOREIGN KEY (`skill_set_id`) REFERENCES `skill_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seeker_skill_set`
--

LOCK TABLES `seeker_skill_set` WRITE;
/*!40000 ALTER TABLE `seeker_skill_set` DISABLE KEYS */;
INSERT INTO `seeker_skill_set` VALUES (1,1,'2017-12-29 06:32:25','2017-12-29 06:32:25');
INSERT INTO `seeker_skill_set` VALUES (1,4,'2017-12-29 06:32:25','2017-12-29 06:32:25');
/*!40000 ALTER TABLE `seeker_skill_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_set`
--

DROP TABLE IF EXISTS `skill_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_set_name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_set`
--

LOCK TABLES `skill_set` WRITE;
/*!40000 ALTER TABLE `skill_set` DISABLE KEYS */;
INSERT INTO `skill_set` VALUES (1,'PHP','2017-12-28 09:18:07','2017-12-28 09:18:07');
INSERT INTO `skill_set` VALUES (2,'.NET','2017-12-28 09:23:05','2017-12-28 09:23:05');
INSERT INTO `skill_set` VALUES (4,'Design Pattern','2017-12-29 03:41:28','2017-12-29 03:41:28');
/*!40000 ALTER TABLE `skill_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `last_login` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `passwordResetToken` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'bambang','oA6Ub2eXGU46MoEyKd7WCFBDMWlCFoir','$2y$13$0Wg/mWU709yjVHGRt5IAgu8ZsVFI33OtAAAUGWpuQ5wRareGFlRZS',NULL,'mejbambang@gmail.com',1,1513841441,1513841441,1514536219);
INSERT INTO `user` VALUES (2,'lungguk','pHvW8MIzevbf-7xcDzdpzTj1sbIvonMy','$2y$13$WZK3ae0ztbyKurOR4nBxc.66XsRTk9dyvphLIPHltTtRNsTDH5pJG',NULL,'andi12p@gmail.com',1,1514527042,1514527042,1514530004);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'connectme'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-30 12:43:34
