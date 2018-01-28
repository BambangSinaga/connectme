-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 28, 2018 at 02:42 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `connectme`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `preview_image` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `article_category_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `user_id`, `title`, `slug`, `preview_image`, `content`, `article_category_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'test', 'test', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 1, 1, '2018-01-09 17:45:50', '2018-01-09 17:45:50'),
(3, 1, 'Mari Berusaha', 'mari-berusaha', 'ZO1L_9Ife6tTG9DO373JM8o8qjjqHvwC.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p><img src=\"/file/image?filename=%2Fphoto%2F1/5a47893c27e8b.jpg\" alt=\"5a47893c27e8b.jpg\" data-id=\"5a47893c27e8b.jpg\"></p>', 2, 1, '2018-01-13 11:54:56', '2018-01-13 11:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `article_category`
--

CREATE TABLE `article_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `article_category`
--

INSERT INTO `article_category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Kehidupan Kampus', '2017-12-30 08:51:27', '2017-12-30 08:51:27'),
(2, 'Internet of Things', '2017-12-31 15:56:33', '2017-12-31 15:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('updateArticle', '4', 1516191285),
('updateCompany', '4', 1516191286),
('updateOwnArticle', '2', 1515488827),
('updateOwnCompany', '4', 1516195122),
('updateOwnJob', '4', 1516191299),
('updateProfile', '4', 1516194980),
('user', '1', 1515495605),
('user', '2', 1515489396),
('user', '4', 1516195191),
('user', '5', 1517117113),
('user', '8', 1517117531);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, NULL, NULL, NULL, 1515487775, 1515487775),
('/article-category/*', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/article-category/create', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/article-category/delete', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/article-category/index', 2, NULL, NULL, NULL, 1515487771, 1515487771),
('/article-category/update', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/article-category/view', 2, NULL, NULL, NULL, 1515487771, 1515487771),
('/article/*', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/article/category', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/article/create', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/article/delete', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/article/index', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/article/my-article', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/article/update', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/article/view', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/company/*', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/company/create', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/company/delete', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/company/index', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/company/update', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/company/view', 2, NULL, NULL, NULL, 1515487772, 1515487772),
('/default/*', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/default/file-delete', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/default/image-upload', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/default/images-get', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/file/*', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/file/download', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/file/image', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/jobs/*', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/jobs/create', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/jobs/delete', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/jobs/index', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/jobs/update', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/jobs/view', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/seeker-profile/*', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/seeker-profile/delete', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/seeker-profile/get-department', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/seeker-profile/index', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/seeker-profile/update', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/seeker-profile/view', 2, NULL, NULL, NULL, 1515487773, 1515487773),
('/site/*', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/site/about', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/site/captcha', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/site/contact', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/site/error', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/site/index', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/site/login', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/site/logout', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/site/password-reset', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/site/request-password-reset', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/site/signup', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/skill-set/*', 2, NULL, NULL, NULL, 1515487775, 1515487775),
('/skill-set/create', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/skill-set/delete', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/skill-set/index', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/skill-set/update', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('/skill-set/view', 2, NULL, NULL, NULL, 1515487774, 1515487774),
('administrator', 1, NULL, NULL, NULL, 1515477303, 1515477303),
('updateArticle', 2, NULL, NULL, NULL, 1515489943, 1515489943),
('updateCompany', 2, NULL, NULL, NULL, 1515842836, 1515842836),
('updateJob', 2, NULL, NULL, NULL, 1515842800, 1515842800),
('updateOwnArticle', 2, NULL, 'author_rule', NULL, 1515487700, 1515489260),
('updateOwnCompany', 2, NULL, 'author_rule', NULL, 1515842854, 1515842854),
('updateOwnJob', 2, NULL, 'author_rule', NULL, 1515842824, 1515842824),
('updateOwnProfile', 2, NULL, 'author_rule', NULL, 1515845884, 1515845884),
('updateProfile', 2, NULL, NULL, NULL, 1515845869, 1515845869),
('user', 1, NULL, NULL, NULL, 1515489352, 1515489352);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('administrator', '/article/*'),
('administrator', '/file/*'),
('updateArticle', 'updateCompany'),
('updateArticle', 'updateJob'),
('updateArticle', 'updateProfile'),
('updateOwnArticle', 'updateArticle'),
('updateOwnCompany', 'updateCompany'),
('updateOwnJob', 'updateJob'),
('updateOwnProfile', 'updateProfile'),
('user', '/article-category/*'),
('user', '/article/*'),
('user', '/company/*'),
('user', '/default/*'),
('user', '/file/*'),
('user', '/jobs/*'),
('user', '/seeker-profile/*'),
('user', 'updateOwnArticle'),
('user', 'updateOwnCompany'),
('user', 'updateOwnJob'),
('user', 'updateOwnProfile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('author_rule', 0x4f3a31393a226170705c726261635c417574686f7252756c65223a333a7b733a343a226e616d65223b733a31313a22617574686f725f72756c65223b733a393a22637265617465644174223b693a313531353437363435313b733a393a22757064617465644174223b693a313531353437363435313b7d, 1515476451, 1515476451);

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

CREATE TABLE `award` (
  `id` int(11) NOT NULL,
  `seeker_profile_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `held_date` date NOT NULL,
  `news_url` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `award`
--

INSERT INTO `award` (`id`, `seeker_profile_id`, `title`, `held_date`, `news_url`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'test', '2017-12-27', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n<ol><li>dfeifjiejf</li></ol>', '2017-12-28 06:10:17', '2017-12-31 15:58:00'),
(2, 1, 'next generation', '2017-12-14', 'http://connectme.local/gii/model', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.best', '2017-12-28 07:32:28', '2017-12-31 15:58:00'),
(3, 2, 'test', '2017-12-06', '', 'haha', '2017-12-29 07:15:34', '2017-12-29 07:15:34'),
(4, 3, 'Juara Kontes Robot Indonesia', '2018-01-28', 'https://kontesrobotindonesia.id/index.html', 'Menjuarai kontes robot indonesia', '2018-01-28 06:39:39', '2018-01-28 06:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `profile_description` varchar(1000) NOT NULL,
  `establishment_date` date NOT NULL,
  `company_website_url` varchar(500) DEFAULT NULL,
  `company_image` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `user_id`, `company_name`, `profile_description`, `establishment_date`, `company_website_url`, `company_image`, `created_at`, `updated_at`) VALUES
(1, 1, 'PT Cipta Jaya', '<p>test</p>', '2018-01-06', 'facebook.com', 'bridestory.png', '2018-01-06 06:03:49', '2018-01-13 07:31:52'),
(2, 1, 'PT Cerita Bahagia', '<p>sds</p>', '2018-01-13', 'bridestory.com', 'bridestory.png', '2018-01-13 07:49:37', '2018-01-13 07:49:37'),
(3, 4, 'PT. Eltrindo', '<p>Perusahaan Elektronik<br></p>', '2018-01-18', 'https://eltrindo.com', 'Building-20-512.png', '2018-01-17 18:35:10', '2018-01-17 18:35:10'),
(4, 8, 'Google', '<p>tws</p>', '2018-01-28', 'https://www.google.com', 'google.jpg', '2018-01-28 06:43:50', '2018-01-28 06:43:50');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department_name`, `created_at`, `updated_at`) VALUES
(1, 'Teknik Informatika', '2018-01-09 17:45:50', '2018-01-09 17:45:50'),
(2, 'Teknik Mesin', '2018-01-28 00:00:00', '2018-01-28 00:00:00'),
(3, 'Teknik Elektronika', '2018-01-28 00:00:00', '2018-01-28 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
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
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `company_id`, `title`, `qualification`, `requirements`, `oppotunity`, `location`, `date_created`, `date_closed`, `show_salary`, `start_salary`, `end_salary`, `created_at`, `updated_at`) VALUES
(1, 1, 'Backend Engineer', '<p>bla</p>', '<p>bla</p>', '<p>bla</p>', 'Jakarta, Indonesia', '2018-01-06', '2018-02-07', 1, '5000000.00', '8000000.00', '2018-01-06 10:38:21', '2018-01-06 10:38:21'),
(2, 3, 'Electrical', '<p>bla bla</p>', '<p>test</p>', '<p>test</p>', 'Jakarta, Indonesia', '2018-01-06', '2018-01-31', 1, '3000.00', '600000.00', '2018-01-06 10:48:22', '2018-01-06 10:48:22'),
(3, 4, 'Google Traveler', '<p>Memiliki kondisi fisik yang sehat<br></p>', '<p \"=\"\">S1 / D4<br></p>', '<p>------------------</p>', 'Indonesia', '2018-01-28', '2018-01-31', 1, '5000000.00', '6000000.00', '2018-01-28 06:45:31', '2018-01-28 06:45:31'),
(4, 4, 'C Programmer', '<p>this qualification<br></p>', '<p>this requirements</p>', '<p>this opportunity</p>', 'Jakarta, Indonesia', '2018-01-21', '2018-02-22', 1, '2500001.00', '35000000.00', '2018-01-28 08:55:57', '2018-01-28 08:55:57');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1513837310),
('m140506_102106_rbac_init', 1515474252),
('m150828_085134_init_user_tables', 1513837312),
('m161109_112016_rename_user_table', 1513837312),
('m170608_141511_rename_columns', 1513837313),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1515474253);

-- --------------------------------------------------------

--
-- Table structure for table `seeker_profile`
--

CREATE TABLE `seeker_profile` (
  `id` int(11) NOT NULL,
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
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seeker_profile`
--

INSERT INTO `seeker_profile` (`id`, `user_id`, `seeker_name`, `short_bio`, `grade`, `degree`, `field_of_study`, `from_year`, `to_year`, `profile_image`, `gender`, `is_active`, `department_id`, `contact_number`, `created_at`, `updated_at`) VALUES
(1, 1, 'bambang sinaga', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure do', NULL, 'Associate\'s degree', 'Computer Sciences', '2011', '2014', 'eYqg3TNjypGien9nBv6C829Uh8BCld8D.jpg', 'Male', 0, 1, '082369253486', '2017-12-27 04:55:42', '2018-01-10 15:11:39'),
(2, 2, 'lungguk parulian', 'good luck :)', NULL, 'Bachelor Computer science', 'Engineering', '2011', '2014', 'DFcSAPtFkci4LezYTwyDZtqunug9x_Zu.jpg', 'Male', 0, 1, '', '2017-12-29 07:15:34', '2018-01-13 13:20:37'),
(3, 8, 'user4', 'tes tes', '3.00', 'D4', 'Electrical', '2013', '2017', 'uP0E24S7N6593LqhD54nIrdcirTx7uOD.jpg', 'Male', 0, 3, '08765445654245', '2018-01-28 06:39:39', '2018-01-28 06:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `seeker_skill_set`
--

CREATE TABLE `seeker_skill_set` (
  `seeker_profile_id` int(11) NOT NULL,
  `skill_set_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seeker_skill_set`
--

INSERT INTO `seeker_skill_set` (`seeker_profile_id`, `skill_set_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-01-10 15:11:40', '2018-01-10 15:11:40'),
(1, 4, '2018-01-10 15:11:40', '2018-01-10 15:11:40'),
(2, 4, '2018-01-13 13:20:37', '2018-01-13 13:20:37'),
(3, 2, '2018-01-28 06:39:39', '2018-01-28 06:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `skill_set`
--

CREATE TABLE `skill_set` (
  `id` int(11) NOT NULL,
  `skill_set_name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skill_set`
--

INSERT INTO `skill_set` (`id`, `skill_set_name`, `created_at`, `updated_at`) VALUES
(1, 'PHP', '2017-12-28 09:18:07', '2017-12-28 09:18:07'),
(2, '.NET', '2017-12-28 09:23:05', '2017-12-28 09:23:05'),
(4, 'Design Pattern', '2017-12-29 03:41:28', '2017-12-29 03:41:28');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `last_login` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `last_login`) VALUES
(1, 'bambang', 'oA6Ub2eXGU46MoEyKd7WCFBDMWlCFoir', '$2y$13$0Wg/mWU709yjVHGRt5IAgu8ZsVFI33OtAAAUGWpuQ5wRareGFlRZS', 'DOOSBeTp9vpNJG2uKhguI9g_p5CZENBZ_1515842179', 'mejbambang@gmail.com', 1, 1513841441, 1515842179, 1517127955),
(2, 'lungguk', 'pHvW8MIzevbf-7xcDzdpzTj1sbIvonMy', '$2y$13$WZK3ae0ztbyKurOR4nBxc.66XsRTk9dyvphLIPHltTtRNsTDH5pJG', NULL, 'andi12p@gmail.com', 1, 1514527042, 1514527042, 1515846956),
(3, 'test', 'QJ2SW4K5lymQftFWvsfDtt0Bt_836K2t', '$2y$13$QBaJpcIU0FYWzIIdFUj6w.uBRVNRgHAg68NWQGfXb3LzzOpW6idM2', NULL, 'test@mail.com', 1, 1515299954, 1515299954, 1515299954),
(4, 'derangga', 'yjuIJbnoV6NAND7ka-qC58yRYnja1pg0', '$2y$13$QflsQ1jZKBPAw.SyH89GJujtFJtCsWxIO6ZhT.juwtoR2wYK4oMwq', NULL, 'rangga@gmail.com', 1, 1516189885, 1516189885, 1517034390),
(5, 'user1', 'P7HZJMCvwobYFjmcxjzbAhrXdtruZKbV', '$2y$13$wlUJElfIyWoCuaHFnSGQ/OOaluUmVGev8NB04/mRSRptpyU20sSHi', NULL, 'user1@gmail.com', 1, 1517116956, 1517116956, 1517116956),
(6, 'user2', 'V13pdqGfnTC35-ovTZAHiZdNWL_wNJ7X', '$2y$13$j8RCduKTdz3k0pv4hHk9zuSkrDP0bB0Ju2.QhLCvStZvPMQW1U0m2', NULL, 'user2@gmail.com', 1, 1517117309, 1517117309, 1517117310),
(7, 'user3', 'Te_GFbleCnoE9jmUcuSZBOFL0M84Dv6_', '$2y$13$6ajHFQekXOAR9rfywbXJ.ezPP4.3aiikxCfNy5q8EROCRbnd5.pKK', NULL, 'user3@gmail.com', 1, 1517117348, 1517117348, 1517117349),
(8, 'user4', 'v4YgLU8G_lAKz-_KghcsFhKVTAWWENMz', '$2y$13$noo0jhDZ93gbSdeJu3VVJOXLeUAwVrA1urYf8R4Jypu2n0crHJd4e', NULL, 'user4@gmail.com', 1, 1517117531, 1517117531, 1517127883);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_article_category_FK` (`article_category_id`),
  ADD KEY `article_user_FK` (`user_id`),
  ADD KEY `article_slug_IDX` (`slug`) USING BTREE;

--
-- Indexes for table `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awards_seeker_profile_FK` (`seeker_profile_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_user_FK` (`user_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_company_FK` (`company_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `seeker_profile`
--
ALTER TABLE `seeker_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seeker_profile_user_FK` (`user_id`),
  ADD KEY `seeker_profile_department_FK` (`department_id`);

--
-- Indexes for table `seeker_skill_set`
--
ALTER TABLE `seeker_skill_set`
  ADD PRIMARY KEY (`seeker_profile_id`,`skill_set_id`),
  ADD KEY `seeker_skill_set_skill_set_FK` (`skill_set_id`);

--
-- Indexes for table `skill_set`
--
ALTER TABLE `skill_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `passwordResetToken` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `article_category`
--
ALTER TABLE `article_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `award`
--
ALTER TABLE `award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seeker_profile`
--
ALTER TABLE `seeker_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `skill_set`
--
ALTER TABLE `skill_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_article_category_FK` FOREIGN KEY (`article_category_id`) REFERENCES `article_category` (`id`),
  ADD CONSTRAINT `article_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `award`
--
ALTER TABLE `award`
  ADD CONSTRAINT `awards_seeker_profile_FK` FOREIGN KEY (`seeker_profile_id`) REFERENCES `seeker_profile` (`id`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_company_FK` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `seeker_profile`
--
ALTER TABLE `seeker_profile`
  ADD CONSTRAINT `seeker_profile_department_FK` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `seeker_profile_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `seeker_skill_set`
--
ALTER TABLE `seeker_skill_set`
  ADD CONSTRAINT `seeker_skill_set_seeker_profile_FK` FOREIGN KEY (`seeker_profile_id`) REFERENCES `seeker_profile` (`id`),
  ADD CONSTRAINT `seeker_skill_set_skill_set_FK` FOREIGN KEY (`skill_set_id`) REFERENCES `skill_set` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
