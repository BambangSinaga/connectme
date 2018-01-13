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
  `preview_image` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `article_category_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_article_category_FK` (`article_category_id`),
  KEY `article_user_FK` (`user_id`),
  KEY `article_slug_IDX` (`slug`) USING BTREE,
  CONSTRAINT `article_article_category_FK` FOREIGN KEY (`article_category_id`) REFERENCES `article_category` (`id`),
  CONSTRAINT `article_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (2,1,'test','test',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',1,1,'2018-01-09 17:45:50','2018-01-09 17:45:50'),(3,1,'Mari Berusaha','mari-berusaha','ZO1L_9Ife6tTG9DO373JM8o8qjjqHvwC.jpg','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p><img src=\"/file/image?filename=%2Fphoto%2F1/5a47893c27e8b.jpg\" alt=\"5a47893c27e8b.jpg\" data-id=\"5a47893c27e8b.jpg\"></p>',2,1,'2018-01-13 11:54:56','2018-01-13 11:55:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--

LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
INSERT INTO `article_category` VALUES (1,'Kehidupan Kampus','2017-12-30 08:51:27','2017-12-30 08:51:27'),(2,'Internet of Things','2017-12-31 15:56:33','2017-12-31 15:56:33');
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('updateOwnArticle','2',1515488827),('user','1',1515495605),('user','2',1515489396);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/*',2,NULL,NULL,NULL,1515487775,1515487775),('/article-category/*',2,NULL,NULL,NULL,1515487772,1515487772),('/article-category/create',2,NULL,NULL,NULL,1515487772,1515487772),('/article-category/delete',2,NULL,NULL,NULL,1515487772,1515487772),('/article-category/index',2,NULL,NULL,NULL,1515487771,1515487771),('/article-category/update',2,NULL,NULL,NULL,1515487772,1515487772),('/article-category/view',2,NULL,NULL,NULL,1515487771,1515487771),('/article/*',2,NULL,NULL,NULL,1515487772,1515487772),('/article/category',2,NULL,NULL,NULL,1515487772,1515487772),('/article/create',2,NULL,NULL,NULL,1515487772,1515487772),('/article/delete',2,NULL,NULL,NULL,1515487772,1515487772),('/article/index',2,NULL,NULL,NULL,1515487772,1515487772),('/article/my-article',2,NULL,NULL,NULL,1515487772,1515487772),('/article/update',2,NULL,NULL,NULL,1515487772,1515487772),('/article/view',2,NULL,NULL,NULL,1515487772,1515487772),('/company/*',2,NULL,NULL,NULL,1515487773,1515487773),('/company/create',2,NULL,NULL,NULL,1515487772,1515487772),('/company/delete',2,NULL,NULL,NULL,1515487773,1515487773),('/company/index',2,NULL,NULL,NULL,1515487772,1515487772),('/company/update',2,NULL,NULL,NULL,1515487772,1515487772),('/company/view',2,NULL,NULL,NULL,1515487772,1515487772),('/default/*',2,NULL,NULL,NULL,1515487773,1515487773),('/default/file-delete',2,NULL,NULL,NULL,1515487773,1515487773),('/default/image-upload',2,NULL,NULL,NULL,1515487773,1515487773),('/default/images-get',2,NULL,NULL,NULL,1515487773,1515487773),('/file/*',2,NULL,NULL,NULL,1515487773,1515487773),('/file/download',2,NULL,NULL,NULL,1515487773,1515487773),('/file/image',2,NULL,NULL,NULL,1515487773,1515487773),('/jobs/*',2,NULL,NULL,NULL,1515487773,1515487773),('/jobs/create',2,NULL,NULL,NULL,1515487773,1515487773),('/jobs/delete',2,NULL,NULL,NULL,1515487773,1515487773),('/jobs/index',2,NULL,NULL,NULL,1515487773,1515487773),('/jobs/update',2,NULL,NULL,NULL,1515487773,1515487773),('/jobs/view',2,NULL,NULL,NULL,1515487773,1515487773),('/seeker-profile/*',2,NULL,NULL,NULL,1515487774,1515487774),('/seeker-profile/delete',2,NULL,NULL,NULL,1515487774,1515487774),('/seeker-profile/get-department',2,NULL,NULL,NULL,1515487773,1515487773),('/seeker-profile/index',2,NULL,NULL,NULL,1515487773,1515487773),('/seeker-profile/update',2,NULL,NULL,NULL,1515487773,1515487773),('/seeker-profile/view',2,NULL,NULL,NULL,1515487773,1515487773),('/site/*',2,NULL,NULL,NULL,1515487774,1515487774),('/site/about',2,NULL,NULL,NULL,1515487774,1515487774),('/site/captcha',2,NULL,NULL,NULL,1515487774,1515487774),('/site/contact',2,NULL,NULL,NULL,1515487774,1515487774),('/site/error',2,NULL,NULL,NULL,1515487774,1515487774),('/site/index',2,NULL,NULL,NULL,1515487774,1515487774),('/site/login',2,NULL,NULL,NULL,1515487774,1515487774),('/site/logout',2,NULL,NULL,NULL,1515487774,1515487774),('/site/password-reset',2,NULL,NULL,NULL,1515487774,1515487774),('/site/request-password-reset',2,NULL,NULL,NULL,1515487774,1515487774),('/site/signup',2,NULL,NULL,NULL,1515487774,1515487774),('/skill-set/*',2,NULL,NULL,NULL,1515487775,1515487775),('/skill-set/create',2,NULL,NULL,NULL,1515487774,1515487774),('/skill-set/delete',2,NULL,NULL,NULL,1515487774,1515487774),('/skill-set/index',2,NULL,NULL,NULL,1515487774,1515487774),('/skill-set/update',2,NULL,NULL,NULL,1515487774,1515487774),('/skill-set/view',2,NULL,NULL,NULL,1515487774,1515487774),('administrator',1,NULL,NULL,NULL,1515477303,1515477303),('updateArticle',2,NULL,NULL,NULL,1515489943,1515489943),('updateCompany',2,NULL,NULL,NULL,1515842836,1515842836),('updateJob',2,NULL,NULL,NULL,1515842800,1515842800),('updateOwnArticle',2,NULL,'author_rule',NULL,1515487700,1515489260),('updateOwnCompany',2,NULL,'author_rule',NULL,1515842854,1515842854),('updateOwnJob',2,NULL,'author_rule',NULL,1515842824,1515842824),('updateOwnProfile',2,NULL,'author_rule',NULL,1515845884,1515845884),('updateProfile',2,NULL,NULL,NULL,1515845869,1515845869),('user',1,NULL,NULL,NULL,1515489352,1515489352);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('user','/article-category/*'),('administrator','/article/*'),('user','/article/*'),('user','/company/*'),('user','/default/*'),('administrator','/file/*'),('user','/file/*'),('user','/jobs/*'),('user','/seeker-profile/*'),('updateOwnArticle','updateArticle'),('updateOwnCompany','updateCompany'),('updateOwnJob','updateJob'),('user','updateOwnArticle'),('user','updateOwnCompany'),('user','updateOwnJob'),('user','updateOwnProfile'),('updateOwnProfile','updateProfile');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
INSERT INTO `auth_rule` VALUES ('author_rule','O:19:\"app\\rbac\\AuthorRule\":3:{s:4:\"name\";s:11:\"author_rule\";s:9:\"createdAt\";i:1515476451;s:9:\"updatedAt\";i:1515476451;}',1515476451,1515476451);
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award`
--

LOCK TABLES `award` WRITE;
/*!40000 ALTER TABLE `award` DISABLE KEYS */;
INSERT INTO `award` VALUES (1,1,'test','2017-12-27','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n<ol><li>dfeifjiejf</li></ol>','2017-12-28 06:10:17','2017-12-31 15:58:00'),(2,1,'next generation','2017-12-14','http://connectme.local/gii/model','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.best','2017-12-28 07:32:28','2017-12-31 15:58:00'),(3,2,'test','2017-12-06','','haha','2017-12-29 07:15:34','2017-12-29 07:15:34');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,1,'PT Cipta Jaya','<p>test</p>','2018-01-06','facebook.com','bridestory.png','2018-01-06 06:03:49','2018-01-13 07:31:52'),(2,1,'PT Cerita Bahagia','<p>sds</p>','2018-01-13','bridestory.com','bridestory.png','2018-01-13 07:49:37','2018-01-13 07:49:37');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Teknik Informatika','2018-01-09 17:45:50','2018-01-09 17:45:50');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,1,'Backend Engineer','<p>bla</p>','<p>bla</p>','<p>bla</p>','Jakarta, Indonesia','2018-01-06','2018-01-19',1,5000000.00,8000000.00,'2018-01-06 10:38:21','2018-01-06 10:38:21'),(2,1,'Data Engineer','<p>bla bla</p>','<p>test</p>','<p>test</p>','Jakarta, Indonesia','2018-01-06','2018-01-24',1,3000.00,600000.00,'2018-01-06 10:48:22','2018-01-06 10:48:22');
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
INSERT INTO `migration` VALUES ('m000000_000000_base',1513837310),('m140506_102106_rbac_init',1515474252),('m150828_085134_init_user_tables',1513837312),('m161109_112016_rename_user_table',1513837312),('m170608_141511_rename_columns',1513837313),('m170907_052038_rbac_add_index_on_auth_assignment_user_id',1515474253);
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
  `is_active` tinyint(4) DEFAULT '1',
  `department_id` int(11) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seeker_profile_user_FK` (`user_id`),
  KEY `seeker_profile_department_FK` (`department_id`),
  CONSTRAINT `seeker_profile_department_FK` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `seeker_profile_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seeker_profile`
--

LOCK TABLES `seeker_profile` WRITE;
/*!40000 ALTER TABLE `seeker_profile` DISABLE KEYS */;
INSERT INTO `seeker_profile` VALUES (1,1,'bambang sinaga','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure do',NULL,'Associate\'s degree','Computer Sciences','2011','2014','eYqg3TNjypGien9nBv6C829Uh8BCld8D.jpg','Male',0,1,'082369253486','2017-12-27 04:55:42','2018-01-10 15:11:39'),(2,2,'lungguk parulian','good luck :)',NULL,'Bachelor Computer science','Engineering','2011','2014','DFcSAPtFkci4LezYTwyDZtqunug9x_Zu.jpg','Male',0,1,'','2017-12-29 07:15:34','2018-01-13 13:20:37');
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
INSERT INTO `seeker_skill_set` VALUES (1,1,'2018-01-10 15:11:40','2018-01-10 15:11:40'),(1,4,'2018-01-10 15:11:40','2018-01-10 15:11:40'),(2,4,'2018-01-13 13:20:37','2018-01-13 13:20:37');
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
INSERT INTO `skill_set` VALUES (1,'PHP','2017-12-28 09:18:07','2017-12-28 09:18:07'),(2,'.NET','2017-12-28 09:23:05','2017-12-28 09:23:05'),(4,'Design Pattern','2017-12-29 03:41:28','2017-12-29 03:41:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'bambang','oA6Ub2eXGU46MoEyKd7WCFBDMWlCFoir','$2y$13$0Wg/mWU709yjVHGRt5IAgu8ZsVFI33OtAAAUGWpuQ5wRareGFlRZS','DOOSBeTp9vpNJG2uKhguI9g_p5CZENBZ_1515842179','mejbambang@gmail.com',1,1513841441,1515842179,1515847346),(2,'lungguk','pHvW8MIzevbf-7xcDzdpzTj1sbIvonMy','$2y$13$WZK3ae0ztbyKurOR4nBxc.66XsRTk9dyvphLIPHltTtRNsTDH5pJG',NULL,'andi12p@gmail.com',1,1514527042,1514527042,1515846956),(3,'test','QJ2SW4K5lymQftFWvsfDtt0Bt_836K2t','$2y$13$QBaJpcIU0FYWzIIdFUj6w.uBRVNRgHAg68NWQGfXb3LzzOpW6idM2',NULL,'test@mail.com',1,1515299954,1515299954,1515299954);
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

-- Dump completed on 2018-01-13 20:06:06
