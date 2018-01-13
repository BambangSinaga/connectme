-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 03, 2018 at 04:21 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

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
  `content` text NOT NULL,
  `article_category_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 1, 'test', '2017-12-27', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>', '2017-12-28 06:10:17', '2017-12-29 06:32:25'),
(2, 1, 'next generation', '2017-12-14', 'http://connectme.local/gii/model', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.best</p>', '2017-12-28 07:32:28', '2017-12-29 06:32:25'),
(3, 2, 'test', '2017-12-06', '', 'haha', '2017-12-29 07:15:34', '2017-12-29 07:15:34');

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
('m150828_085134_init_user_tables', 1513837312),
('m161109_112016_rename_user_table', 1513837312),
('m170608_141511_rename_columns', 1513837313);

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
  `is_active` tinyint(4) DEFAULT '0',
  `contact_number` varchar(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seeker_profile`
--

INSERT INTO `seeker_profile` (`id`, `user_id`, `seeker_name`, `short_bio`, `grade`, `degree`, `field_of_study`, `from_year`, `to_year`, `profile_image`, `gender`, `is_active`, `contact_number`, `created_at`, `updated_at`) VALUES
(1, 1, 'bambang sinaga', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure do', NULL, 'Associate\'s degree', 'Computer Sciences', '2011', '2014', 'eYqg3TNjypGien9nBv6C829Uh8BCld8D.jpg', 'Male', 0, '082369253486', '2017-12-27 04:55:42', '2017-12-29 06:32:25'),
(2, 2, 'lungguk parulian', 'good luck :)', NULL, 'Bachelor Computer science', 'Engineering', '2011', '2014', 'DFcSAPtFkci4LezYTwyDZtqunug9x_Zu.jpg', 'Male', 0, '', '2017-12-29 07:15:34', '2017-12-29 07:28:47');

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
(1, 1, '2017-12-29 06:32:25', '2017-12-29 06:32:25'),
(1, 4, '2017-12-29 06:32:25', '2017-12-29 06:32:25');

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
(1, 'bambang', 'oA6Ub2eXGU46MoEyKd7WCFBDMWlCFoir', '$2y$13$0Wg/mWU709yjVHGRt5IAgu8ZsVFI33OtAAAUGWpuQ5wRareGFlRZS', NULL, 'mejbambang@gmail.com', 1, 1513841441, 1513841441, 1514536219),
(2, 'lungguk', 'pHvW8MIzevbf-7xcDzdpzTj1sbIvonMy', '$2y$13$WZK3ae0ztbyKurOR4nBxc.66XsRTk9dyvphLIPHltTtRNsTDH5pJG', NULL, 'andi12p@gmail.com', 1, 1514527042, 1514527042, 1514530004),
(3, 'derangga', 'OdQDdWRYS5AkKKBX8afawTLDAUlXJku9', '$2y$13$p1ViBbBKgASMg5EvDJxlVemh3YddhFohqa0vHl92a54ADs.TvCAOK', NULL, 'derangga1011@gmail.com', 1, 1514719403, 1514719403, 1514944535);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_article_category_FK` (`article_category_id`),
  ADD KEY `article_user_FK` (`user_id`);

--
-- Indexes for table `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `seeker_profile_user_FK` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article_category`
--
ALTER TABLE `article_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award`
--
ALTER TABLE `award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seeker_profile`
--
ALTER TABLE `seeker_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `skill_set`
--
ALTER TABLE `skill_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
