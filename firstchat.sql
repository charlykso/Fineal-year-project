-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2021 at 10:32 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `firstchat`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_friendrequest`
--

CREATE TABLE `accounts_friendrequest` (
  `id` int(11) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_friendrequest`
--

INSERT INTO `accounts_friendrequest` (`id`, `timestamp`, `from_user_id`, `to_user_id`) VALUES
(2, '2020-09-01 22:41:14.161002', 1, 3),
(7, '2021-01-09 21:54:03.234747', 9, 6),
(8, '2021-01-22 22:10:26.396999', 1, 9),
(9, '2021-04-08 16:22:43.781964', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_profile`
--

CREATE TABLE `accounts_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_created` datetime(6),
  `email` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `profile_pic` varchar(100),
  `slug` varchar(50) DEFAULT NULL,
  `updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_profile`
--

INSERT INTO `accounts_profile` (`id`, `user_id`, `date_created`, `email`, `name`, `phone`, `profile_pic`, `slug`, `updated`) VALUES
(1, 1, '2020-08-18 12:12:00.147775', 'charlykso141@gmail.com', 'Ikenna', '07062682820', 'IMG_20180818_104013.jpg', NULL, '2021-04-28 01:46:32.242621'),
(2, 2, '2020-08-18 12:25:19.736882', 'lampardinho@gmail.com', 'nnaemeka ezeanyaeji', '09065435752', 'IMG_20200329_074108.jpg', NULL, '2021-01-11 15:01:52.083521'),
(3, 3, '2020-08-26 09:27:06.554327', 'handsomechux@yahoo.com', 'Chukwuenye Kingsley', '08035704920', 'Crude-Oil-Exploration.jpg', NULL, '2020-08-29 01:41:03.919453'),
(4, 4, '2020-08-26 09:36:32.845420', 'dugsgyij@gmail.com', 'target', '08162320323', 'co.png', NULL, '2020-08-30 23:44:21.881239'),
(5, 5, '2020-08-28 14:40:06.747720', NULL, NULL, NULL, 'co.png', NULL, '2020-08-28 14:40:27.800118'),
(6, 6, '2021-01-09 21:21:03.398172', 'ezehchidex@yahoo.com', 'EzehChidex', '08037862620', 'IMG_20210106_184056_954.jpg', NULL, '2021-01-09 21:26:51.613202'),
(7, 7, '2021-01-09 21:21:38.771090', 'muokac8@gmail.com', 'Muoka Charles', '+2348109674032', '-mb2bh0.jpg', NULL, '2021-01-09 21:27:27.943339'),
(8, 8, '2021-01-09 21:22:51.485195', 'okpalamaxwill37185466@yahoo.com', 'Okpala maxwell', '08145766275', 'FB_IMG_16091097864618156_ppKQ9CZ.jpg', NULL, '2021-01-09 21:35:15.194467'),
(9, 9, '2021-01-09 21:48:01.806039', 'charlykso141@gmail.com', 'ikenna', '07062682820', 'IMG_20201023_092658.jpg', NULL, '2021-01-09 21:51:23.308635'),
(10, 10, '2021-04-09 08:46:23.858727', 'righteousness@hotmail.com', 'Chisimdi', '08110332221', 'IMG_20201023_092658_NhYKe0g.jpg', NULL, '2021-04-25 21:02:39.825266');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_profile_friends`
--

CREATE TABLE `accounts_profile_friends` (
  `id` int(11) NOT NULL,
  `from_profile_id` int(11) NOT NULL,
  `to_profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_profile_friends`
--

INSERT INTO `accounts_profile_friends` (`id`, `from_profile_id`, `to_profile_id`) VALUES
(9, 1, 2),
(17, 1, 10),
(2, 2, 1),
(15, 2, 8),
(4, 3, 1),
(5, 3, 4),
(7, 4, 1),
(6, 4, 3),
(10, 6, 7),
(14, 6, 8),
(11, 7, 6),
(12, 7, 8),
(16, 8, 2),
(18, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_touse`
--

CREATE TABLE `accounts_touse` (
  `id` int(11) NOT NULL,
  `timestp` datetime(6) NOT NULL,
  `first_person_id` int(11) NOT NULL,
  `second_person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_touse`
--

INSERT INTO `accounts_touse` (`id`, `timestp`, `first_person_id`, `second_person_id`) VALUES
(1, '2020-08-18 12:28:23.495968', 2, 1),
(2, '2020-08-26 09:32:22.501350', 3, 1),
(3, '2020-08-26 09:40:01.789607', 4, 3),
(4, '2020-09-01 22:40:02.961404', 1, 2),
(5, '2020-09-01 22:41:14.555975', 1, 3),
(6, '2021-01-09 21:25:37.519214', 7, 6),
(7, '2021-01-09 21:25:55.813116', 8, 7),
(8, '2021-01-09 21:26:12.305733', 8, 6),
(9, '2021-01-09 21:26:27.068445', 8, 2),
(10, '2021-01-09 21:54:03.418740', 9, 6),
(11, '2021-01-22 22:10:26.646983', 1, 9),
(12, '2021-04-08 16:22:49.108562', 1, 8),
(13, '2021-04-09 08:55:16.971086', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add message', 1, 'add_messagemodel'),
(2, 'Can change message', 1, 'change_messagemodel'),
(3, 'Can delete message', 1, 'delete_messagemodel'),
(4, 'Can view message', 1, 'view_messagemodel'),
(5, 'Can add profile', 2, 'add_profile'),
(6, 'Can change profile', 2, 'change_profile'),
(7, 'Can delete profile', 2, 'delete_profile'),
(8, 'Can view profile', 2, 'view_profile'),
(9, 'Can add friend request', 3, 'add_friendrequest'),
(10, 'Can change friend request', 3, 'change_friendrequest'),
(11, 'Can delete friend request', 3, 'delete_friendrequest'),
(12, 'Can view friend request', 3, 'view_friendrequest'),
(13, 'Can add to use', 4, 'add_touse'),
(14, 'Can change to use', 4, 'change_touse'),
(15, 'Can delete to use', 4, 'delete_touse'),
(16, 'Can view to use', 4, 'view_touse'),
(17, 'Can add log entry', 5, 'add_logentry'),
(18, 'Can change log entry', 5, 'change_logentry'),
(19, 'Can delete log entry', 5, 'delete_logentry'),
(20, 'Can view log entry', 5, 'view_logentry'),
(21, 'Can add permission', 6, 'add_permission'),
(22, 'Can change permission', 6, 'change_permission'),
(23, 'Can delete permission', 6, 'delete_permission'),
(24, 'Can view permission', 6, 'view_permission'),
(25, 'Can add group', 7, 'add_group'),
(26, 'Can change group', 7, 'change_group'),
(27, 'Can delete group', 7, 'delete_group'),
(28, 'Can view group', 7, 'view_group'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add content type', 9, 'add_contenttype'),
(34, 'Can change content type', 9, 'change_contenttype'),
(35, 'Can delete content type', 9, 'delete_contenttype'),
(36, 'Can view content type', 9, 'view_contenttype'),
(37, 'Can add session', 10, 'add_session'),
(38, 'Can change session', 10, 'change_session'),
(39, 'Can delete session', 10, 'delete_session'),
(40, 'Can view session', 10, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$SSwTxBReh7Dy$MeDqjMtgdgJ5SntkN36hIWvu6OcEcNxq0caBZmxbR5U=', '2021-04-28 01:46:32.058756', 1, 'ikennaremigius', 'ikenna', 'Eze', 'ikenna@gmail.com', 1, 1, '2020-08-18 12:11:59.000000'),
(2, 'pbkdf2_sha256$216000$v8qEWSR4i2RP$2zsf9JDMEoz4x0Dmc4RsrBzqqa6MZYRwF7Orqo6G2W0=', '2021-01-11 15:01:51.732542', 0, 'lampar', 'nnaemeka', 'ezeanyaeji', 'lampardinho@gmail.com', 0, 1, '2020-08-18 12:25:18.276795'),
(3, 'pbkdf2_sha256$180000$moCam9l23nTj$477U8IQRAP63F9PLERD86S4PUcaUXUh30Y/yDGNDZ6c=', '2020-08-26 09:27:28.482863', 0, 'Kingsley', 'Kingsley', 'Chukwunenye', 'handsomechux@yahoo.com', 0, 1, '2020-08-26 09:27:04.523174'),
(4, 'pbkdf2_sha256$180000$PWCrXvkaMHkD$vDHv8NjlbAcLYw7XrT7NHpV00t9nx7wuEO7Sa6goUKQ=', '2020-08-26 09:37:05.106592', 0, 'targety2j', 'CHIMBI', 'ASO BUMS', 'dugsgyij@gmail.com', 0, 1, '2020-08-26 09:36:31.499659'),
(5, 'pbkdf2_sha256$180000$0WJXfwmGiUNg$wQiVsT1wyMn47yeeUIgkifAAXBXaCA2IDB8ZWmxuZWU=', '2020-08-28 14:40:27.698702', 0, 'Goody', 'Goodnews', 'Etim', 'g.makerstech@gmail.com', 0, 1, '2020-08-28 14:40:04.969764'),
(6, 'pbkdf2_sha256$216000$YCWmoz3UXO88$Cp5yMrXLkwDJIhgE50hj64F21dBAbI6l/uoLxjr2yvo=', '2021-01-09 21:21:25.087639', 0, 'Chidex', 'Chidi', 'Ezeanyaeji', 'ezehchidex@yahoo.com', 0, 1, '2021-01-09 21:21:01.164597'),
(7, 'pbkdf2_sha256$216000$SqLwBCEi15EP$69Ur0H6Ss8+pDOvBtVJ1Q/81OvrCBwjSDhgerAQO8os=', '2021-01-09 21:21:52.421659', 0, 'Nwokeoma', 'Charles', 'Muoka', 'muokac8@gmail.com', 0, 1, '2021-01-09 21:21:37.520909'),
(8, 'pbkdf2_sha256$216000$FpCjA39WdJMK$weOItHWPibPW2x4yqGlEhBKRn9lEX6VMTAwnr2XpP+w=', '2021-01-09 21:23:06.417496', 0, 'Carpastor', 'Okpala', 'Maxwell', 'okpalamaxwill37185466@yahoo.com', 0, 1, '2021-01-09 21:22:49.981805'),
(9, 'pbkdf2_sha256$216000$w1gSW39tONwu$f2FceLJat5CoEDqqOlfv/UatXqWtMOwRF99lP0FsiNQ=', '2021-01-09 21:48:17.126106', 0, 'charlykso', 'ikenna', 'Eze', 'charlykso141@gmail.com', 0, 1, '2021-01-09 21:48:00.598616'),
(10, 'pbkdf2_sha256$216000$lGGtATQJYowA$PqnOfIWLe5ovpzCm6ic0BR98meAPiH04x2lEz0Gop+c=', '2021-04-25 21:02:39.648324', 0, 'pacman', 'Righteous', 'Osuah', 'righteousness@hotmail.com', 0, 1, '2021-04-09 08:46:22.259756');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40);

-- --------------------------------------------------------

--
-- Table structure for table `chat_messagemodel`
--

CREATE TABLE `chat_messagemodel` (
  `id` int(11) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `body` longtext NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `classifier` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_messagemodel`
--

INSERT INTO `chat_messagemodel` (`id`, `timestamp`, `body`, `recipient_id`, `user_id`, `classifier`) VALUES
(1, '2020-08-26 09:36:36.918757', 'Oga, how far nah?', 1, 3, NULL),
(2, '2020-08-26 09:37:11.582583', 'am fine sir and you?', 3, 1, NULL),
(3, '2020-08-26 09:37:34.735375', 'Nice work, my dear', 1, 3, NULL),
(4, '2020-08-26 09:41:05.046632', 'hello sir how are you', 3, 4, NULL),
(5, '2020-08-26 09:41:06.193228', 'Chigozie, how far nah', 4, 3, NULL),
(6, '2020-08-26 09:41:16.115461', 'i de oo boss', 3, 4, NULL),
(7, '2020-08-26 09:41:28.796263', 'You are welcome', 4, 3, NULL),
(8, '2020-08-26 09:42:00.720634', 'thank you sir', 3, 4, NULL),
(9, '2020-08-27 09:10:30.896090', 'hi', 2, 1, NULL),
(10, '2020-08-27 19:59:31.841782', 'how are you', 2, 1, NULL),
(11, '2020-08-29 22:31:11.151511', 'am fine and you', 1, 2, NULL),
(12, '2020-08-29 22:32:20.877412', 'can you hear me', 1, 2, NULL),
(13, '2020-08-29 22:34:03.503082', 'thanks', 3, 1, NULL),
(14, '2020-08-29 22:35:09.629621', 'yeah', 3, 1, NULL),
(15, '2020-08-30 00:52:21.382490', 'yeah loud and clear', 2, 1, NULL),
(16, '2020-08-30 01:00:26.410456', 'hi', 3, 1, NULL),
(17, '2020-09-13 01:27:20.646046', 'hello', 2, 1, NULL),
(18, '2021-01-09 21:34:46.072269', 'Nchi', 7, 6, NULL),
(19, '2021-01-09 21:35:32.220614', 'Oga take time', 6, 7, NULL),
(29, '2021-03-08 11:55:36.011275', 'how are you doing', 2, 1, 0),
(44, '2021-03-08 17:30:37.852940', 'what''s up', 2, 1, 0),
(45, '2021-03-08 17:31:25.832010', 'fuck you and your mum', 2, 1, 1),
(46, '2021-03-08 20:49:04.820916', 'how are you doing', 2, 1, 0),
(47, '2021-03-08 20:49:34.582968', 'shut up and fuck you', 2, 1, 1),
(48, '2021-04-09 11:03:30.300688', 'hello', 10, 1, 0),
(49, '2021-04-09 13:34:13.695957', 'fuck you bicth', 10, 1, 1),
(50, '2021-04-09 18:35:29.721435', 'please don''t say that again', 1, 10, 0),
(51, '2021-04-09 18:36:04.610011', 'don''t tell me fuck you again', 1, 10, 1),
(52, '2021-04-09 18:36:49.965362', 'please don''t tell me fuck you again', 1, 10, 0),
(53, '2021-04-13 13:46:37.384327', 'how are you doing', 10, 1, 0),
(54, '2021-04-13 13:47:17.267611', 'you idiot', 10, 1, 0),
(55, '2021-04-13 13:48:37.105855', 'come let''s initiate you into our cult', 10, 1, 1),
(56, '2021-04-13 13:48:51.160805', 'you bitch you ass', 10, 1, 1),
(57, '2021-04-25 21:03:56.435924', 'what is wrong with you?', 1, 10, 0),
(59, '2021-04-25 21:12:12.677362', 'why is this thing doing this way?', 1, 10, 0),
(62, '2021-04-25 21:26:20.198966', 'i don''t like what am seeing', 1, 10, 0),
(63, '2021-04-25 21:26:42.011007', 'lol', 10, 1, 0),
(64, '2021-04-25 21:27:09.257484', 'it''s none of my business', 10, 1, 0),
(65, '2021-04-25 21:27:29.523624', 'am just testing my app', 10, 1, 0),
(69, '2021-04-25 21:43:28.868331', 'are you out of your mind?', 1, 10, 0),
(71, '2021-04-25 21:44:05.182585', 'you are insane', 1, 10, 1),
(72, '2021-04-25 21:44:26.044478', 'you arogant bitch', 1, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-08-29 01:41:04.228434', '3', 'Kingsley', 2, '[{"changed": {"fields": ["Profile pic"]}}]', 2, 1),
(2, '2020-08-30 23:44:21.991232', '4', 'targety2j', 2, '[{"changed": {"fields": ["Friends"]}}]', 2, 1),
(3, '2020-08-30 23:55:01.931320', '4', 'from ikennaremigius, To targety2j', 3, '', 4, 1),
(4, '2020-08-31 00:26:13.320932', '1', 'ikennaremigius', 2, '[{"changed": {"fields": ["First name", "Last name", "User permissions"]}}]', 8, 1),
(5, '2021-03-07 20:21:14.913036', '55', '55', 3, '', 1, 1),
(6, '2021-03-07 20:21:47.031442', '54', '54', 3, '', 1, 1),
(7, '2021-03-07 20:22:10.122163', '44', '44', 3, '', 1, 1),
(8, '2021-03-07 20:22:38.238845', '46', '46', 3, '', 1, 1),
(9, '2021-03-07 20:22:59.877088', '50', '50', 3, '', 1, 1),
(10, '2021-03-07 20:23:21.313046', '51', '51', 3, '', 1, 1),
(11, '2021-03-07 20:23:33.587681', '52', '52', 3, '', 1, 1),
(12, '2021-03-07 20:23:45.829543', '45', '45', 3, '', 1, 1),
(13, '2021-03-07 20:23:54.760594', '47', '47', 3, '', 1, 1),
(14, '2021-03-07 20:24:05.545431', '48', '48', 3, '', 1, 1),
(15, '2021-03-07 20:24:18.274960', '40', '40', 3, '', 1, 1),
(16, '2021-03-07 20:24:33.257811', '41', '41', 3, '', 1, 1),
(17, '2021-03-07 20:24:45.322180', '42', '42', 3, '', 1, 1),
(18, '2021-03-07 20:24:54.598562', '43', '43', 3, '', 1, 1),
(19, '2021-03-07 20:25:04.868316', '49', '49', 3, '', 1, 1),
(20, '2021-03-07 20:25:16.503021', '53', '53', 3, '', 1, 1),
(21, '2021-03-07 20:25:27.309050', '56', '56', 3, '', 1, 1),
(22, '2021-03-07 20:25:44.919373', '57', '57', 3, '', 1, 1),
(23, '2021-03-07 20:26:05.848641', '58', '58', 3, '', 1, 1),
(24, '2021-03-07 20:26:21.206581', '28', '28', 3, '', 1, 1),
(25, '2021-03-07 20:26:37.838887', '20', '20', 3, '', 1, 1),
(26, '2021-03-07 20:26:51.456816', '21', '21', 3, '', 1, 1),
(27, '2021-03-07 20:27:07.680267', '22', '22', 3, '', 1, 1),
(28, '2021-03-07 20:27:22.113568', '23', '23', 3, '', 1, 1),
(29, '2021-03-07 20:27:35.315168', '24', '24', 3, '', 1, 1),
(30, '2021-03-07 20:27:47.404322', '25', '25', 3, '', 1, 1),
(31, '2021-03-07 20:27:58.755253', '26', '26', 3, '', 1, 1),
(32, '2021-03-07 20:28:09.828391', '27', '27', 3, '', 1, 1),
(33, '2021-03-07 20:28:21.702152', '29', '29', 3, '', 1, 1),
(34, '2021-03-07 20:28:40.506242', '30', '30', 3, '', 1, 1),
(35, '2021-03-07 20:28:54.112066', '31', '31', 3, '', 1, 1),
(36, '2021-03-07 20:29:06.418092', '32', '32', 3, '', 1, 1),
(37, '2021-03-07 20:29:19.350088', '33', '33', 3, '', 1, 1),
(38, '2021-03-07 20:29:31.715393', '34', '34', 3, '', 1, 1),
(39, '2021-03-07 20:29:45.800022', '35', '35', 3, '', 1, 1),
(40, '2021-03-07 20:29:57.279281', '36', '36', 3, '', 1, 1),
(41, '2021-03-07 20:30:07.504824', '37', '37', 3, '', 1, 1),
(42, '2021-03-07 20:30:19.183970', '38', '38', 3, '', 1, 1),
(43, '2021-03-07 20:30:30.899161', '39', '39', 3, '', 1, 1),
(44, '2021-03-08 12:01:45.515932', '20', '20', 3, '', 1, 1),
(45, '2021-03-08 12:01:54.659602', '21', '21', 3, '', 1, 1),
(46, '2021-03-08 12:02:04.695415', '22', '22', 3, '', 1, 1),
(47, '2021-03-08 12:02:15.670596', '23', '23', 3, '', 1, 1),
(48, '2021-03-08 12:02:26.080964', '24', '24', 3, '', 1, 1),
(49, '2021-03-08 12:02:34.502696', '25', '25', 3, '', 1, 1),
(50, '2021-03-08 12:02:44.293487', '26', '26', 3, '', 1, 1),
(51, '2021-03-08 12:02:54.907358', '27', '27', 3, '', 1, 1),
(52, '2021-03-08 12:03:03.924369', '28', '28', 3, '', 1, 1),
(53, '2021-03-08 15:10:12.911115', '36', '36', 3, '', 1, 1),
(54, '2021-03-08 15:10:21.995213', '35', '35', 3, '', 1, 1),
(55, '2021-03-08 15:10:32.937740', '34', '34', 3, '', 1, 1),
(56, '2021-03-08 15:10:44.291094', '33', '33', 3, '', 1, 1),
(57, '2021-03-08 15:10:52.747494', '32', '32', 3, '', 1, 1),
(58, '2021-03-08 15:11:02.012440', '31', '31', 3, '', 1, 1),
(59, '2021-03-08 15:19:03.307631', '38', '38', 3, '', 1, 1),
(60, '2021-03-08 15:31:28.486881', '40', '40', 3, '', 1, 1),
(61, '2021-03-08 15:32:31.576900', '39', '39', 3, '', 1, 1),
(62, '2021-03-08 15:33:32.556219', '37', '37', 3, '', 1, 1),
(63, '2021-03-08 16:15:19.866015', '33', '33', 3, '', 1, 1),
(64, '2021-03-08 16:15:30.716356', '32', '32', 3, '', 1, 1),
(65, '2021-03-08 16:15:39.196592', '31', '31', 3, '', 1, 1),
(66, '2021-03-08 16:15:56.378416', '30', '30', 3, '', 1, 1),
(67, '2021-03-08 16:20:42.828311', '34', '34', 3, '', 1, 1),
(68, '2021-03-08 16:21:42.458524', '35', '35', 3, '', 1, 1),
(69, '2021-03-08 16:41:28.106053', '37', '37', 3, '', 1, 1),
(70, '2021-03-08 16:41:37.538198', '36', '36', 3, '', 1, 1),
(71, '2021-03-08 16:47:17.938473', '38', '38', 3, '', 1, 1),
(72, '2021-03-08 16:50:32.965068', '39', '39', 3, '', 1, 1),
(73, '2021-03-08 17:23:38.462872', '41', '41', 3, '', 1, 1),
(74, '2021-03-08 17:23:49.545579', '40', '40', 3, '', 1, 1),
(75, '2021-03-08 17:28:11.888595', '43', '43', 3, '', 1, 1),
(76, '2021-03-08 17:28:29.904686', '42', '42', 3, '', 1, 1),
(77, '2021-04-25 21:32:44.555482', '66', '66', 2, '[{"changed": {"fields": ["Classifier"]}}]', 1, 1),
(78, '2021-04-25 21:33:02.942277', '67', '67', 2, '[{"changed": {"fields": ["Classifier"]}}]', 1, 1),
(79, '2021-04-25 21:35:53.456731', '67', '67', 2, '[{"changed": {"fields": ["Classifier"]}}]', 1, 1),
(80, '2021-04-25 21:36:32.719358', '67', '67', 2, '[{"changed": {"fields": ["Classifier"]}}]', 1, 1),
(81, '2021-04-25 21:37:04.583884', '66', '66', 3, '', 1, 1),
(82, '2021-04-25 21:37:17.804370', '67', '67', 3, '', 1, 1),
(83, '2021-04-25 21:40:05.434463', '60', '60', 3, '', 1, 1),
(84, '2021-04-25 21:40:21.212813', '61', '61', 3, '', 1, 1),
(85, '2021-04-25 21:41:16.551811', '58', '58', 3, '', 1, 1),
(86, '2021-04-25 21:42:27.281419', '68', '68', 3, '', 1, 1),
(87, '2021-04-25 21:46:19.352220', '70', '70', 3, '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(3, 'accounts', 'friendrequest'),
(2, 'accounts', 'profile'),
(4, 'accounts', 'touse'),
(5, 'admin', 'logentry'),
(7, 'auth', 'group'),
(6, 'auth', 'permission'),
(8, 'auth', 'user'),
(1, 'chat', 'messagemodel'),
(9, 'contenttypes', 'contenttype'),
(10, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-08-18 12:09:20.509773'),
(2, 'auth', '0001_initial', '2020-08-18 12:09:31.213637'),
(3, 'accounts', '0001_initial', '2020-08-18 12:09:58.124763'),
(4, 'accounts', '0002_auto_20200708_0315', '2020-08-18 12:10:12.241086'),
(5, 'accounts', '0003_auto_20200708_1501', '2020-08-18 12:10:13.600888'),
(6, 'accounts', '0004_auto_20200708_1655', '2020-08-18 12:10:13.727243'),
(7, 'accounts', '0005_auto_20200710_0120', '2020-08-18 12:10:16.181388'),
(8, 'accounts', '0006_auto_20200711_1341', '2020-08-18 12:10:23.438663'),
(9, 'accounts', '0007_profile_updated', '2020-08-18 12:10:24.957534'),
(10, 'accounts', '0008_touse', '2020-08-18 12:10:25.700946'),
(11, 'admin', '0001_initial', '2020-08-18 12:10:29.301180'),
(12, 'admin', '0002_logentry_remove_auto_add', '2020-08-18 12:10:31.847493'),
(13, 'admin', '0003_logentry_add_action_flag_choices', '2020-08-18 12:10:32.005053'),
(14, 'contenttypes', '0002_remove_content_type_name', '2020-08-18 12:10:34.486576'),
(15, 'auth', '0002_alter_permission_name_max_length', '2020-08-18 12:10:35.978397'),
(16, 'auth', '0003_alter_user_email_max_length', '2020-08-18 12:10:37.373297'),
(17, 'auth', '0004_alter_user_username_opts', '2020-08-18 12:10:37.830251'),
(18, 'auth', '0005_alter_user_last_login_null', '2020-08-18 12:10:39.974615'),
(19, 'auth', '0006_require_contenttypes_0002', '2020-08-18 12:10:40.115219'),
(20, 'auth', '0007_alter_validators_add_error_messages', '2020-08-18 12:10:40.219185'),
(21, 'auth', '0008_alter_user_username_max_length', '2020-08-18 12:10:41.456475'),
(22, 'auth', '0009_alter_user_last_name_max_length', '2020-08-18 12:10:42.935759'),
(23, 'auth', '0010_alter_group_name_max_length', '2020-08-18 12:10:44.472395'),
(24, 'auth', '0011_update_proxy_permissions', '2020-08-18 12:10:44.619092'),
(25, 'chat', '0001_initial', '2020-08-18 12:10:45.177660'),
(26, 'sessions', '0001_initial', '2020-08-18 12:10:49.851032'),
(27, 'auth', '0012_alter_user_first_name_max_length', '2020-09-13 01:23:22.346050'),
(28, 'chat', '0002_messagemodel_classifier', '2021-03-08 11:24:58.806430');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3hgweijyj1pdqjfj3cl7rdkdvmgmmmj9', '.eJxVjMsOwiAUBf-FtSEg5eXSvd9A7gOkamhS2pXx322TLnR7Zua8RYJ1qWnteU4ji4s4i9PvhkDP3HbAD2j3SdLUlnlEuSvyoF3eJs6v6-H-HVTodaudGrzBGIwnRq8Vsg6OvYtkCpYSjAuIOWa0LoItBIY46A3EwWgVrfh8AefAOCU:1kSq2F:TN0XrCYKQBVL8Y54iZudNLe_xij8V644kzovp_BO6fM', '2020-10-28 23:18:19.323000'),
('4v8n47122y4j2s8gsidlno7crduvk76z', '.eJxVjDsOwjAQBe_iGlmO499S0nMGy-v14gBypDipEHeHSCmgfTPzXiKmba1x62WJE4mzGMTpd8OUH6XtgO6p3WaZ57YuE8pdkQft8jpTeV4O9--gpl6_NVqyPGL2BGMG7X2mEMAyGZcYtQEEh9argZ3VOrBKpDwbxQChmFLE-wPzTzgr:1l34FF:zO__Hj_BBxEk6Jo4d8_upYffLJdmrJvFb5InY2cZr6o', '2021-02-05 21:45:29.714492'),
('4yafx5bxytcgzcxansmyttcd6dlvumx4', 'NGVhNDIwOTIyODliOGRjZmJlZTk2ZTgwOTEyODM4YTBlNTc2MmY0Mjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MDBmMWE1MmE2YmFlYTMxOWYwYTFmZGU2OTI0MDQ5OWUwMTdiOTY1In0=', '2020-09-11 14:40:27.885142'),
('63s766aoi05moxu067ftnrc8bfi9q72f', '.eJxVjDsOwjAQBe_iGlmO499S0nMGy-v14gBypDipEHeHSCmgfTPzXiKmba1x62WJE4mzGMTpd8OUH6XtgO6p3WaZ57YuE8pdkQft8jpTeV4O9--gpl6_NVqyPGL2BGMG7X2mEMAyGZcYtQEEh9argZ3VOrBKpDwbxQChmFLE-wPzTzgr:1lbUNJ:2N8G6n5BnfhYvEhSuT059c7CAaHoD48Z-DiLWrkd-68', '2021-05-11 20:32:05.706953'),
('6ubslsqxyb8s2n5ha8cs89cd2tuqahot', '.eJxVjDsOwjAQRO_iGln4z1LS5wzWer3GAeRIcVIh7k4ipYBuNO_NvEXEdalx7TzHMYurCOL02yWkJ7cd5Ae2-yRpass8Jrkr8qBdDlPm1-1w_w4q9rqtQRdjlAZKgFtU4HRxIVyIyCFB0AWDNwTs-WzJYjJOOautQg6ZvBWfL9qBN64:1kyLgG:jaS1o9m-dSMgH5qe8a0xBA9Jl50mhuBG1mFL1HFs0Ck', '2021-01-23 21:21:52.687269'),
('au7ek9hyinb37a98t5g9ionscyvl95eu', 'MTc5MGUxZDBkMGFiYjc1MWM4NThmN2I5ODBmYjMzMzE1MTZmZDBmOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZGE4ZDNkMGFiMTI5MmI0MTY4NDc4NWQzNzU1MDBiMTJhYjc4YTAyIn0=', '2020-09-09 09:35:33.499959'),
('bcrcuk4wfjvz24mr0ezryy1fca2jijmo', '.eJxVjDsOwjAQBe_iGlmO499S0nMGy-v14gBypDipEHeHSCmgfTPzXiKmba1x62WJE4mzGMTpd8OUH6XtgO6p3WaZ57YuE8pdkQft8jpTeV4O9--gpl6_NVqyPGL2BGMG7X2mEMAyGZcYtQEEh9argZ3VOrBKpDwbxQChmFLE-wPzTzgr:1kHGmC:lY0DA1aZu4TYn0AfEVuheTO72mWg1-CoBW7uaeUOvF0', '2020-09-27 01:25:56.640783'),
('ce8z0knzi87gcc1u34wuctnv5mmaix34', '.eJxVjDsOwjAQBe_iGlmxd_0JJT1nsNbeDQ6gRIqTCnF3iJQC2jcz76USbWtNW5MljazOqlen3y1Teci0A77TdJt1mad1GbPeFX3Qpq8zy_NyuH8HlVr91giC1jugiIUYABxjRGv6HAfnrSXTQQYMwRUzAMcSOltEvAB79Nyr9we92TcZ:1kyM5p:hfeipnnDvVBv8ddnrVoeEuAV1WM9rripECehaif_p8c', '2021-01-23 21:48:17.226101'),
('iyna0ymnimi0y0d5jm9izyr9hvm4vcjh', '.eJxVjEEOgjAQRe_StWnKFMrUpXvPQGamU0ENTSisjHdXEha6_e-9_zIDbes4bFWXYUrmbBpnTr8jkzx03km603wrVsq8LhPbXbEHrfZakj4vh_t3MFIdv3VEJxycijQtJe4IQbNC7APnzsfoPGB2gTlA9KiYUyJB6AUC9uJa8_4AF_k4RA:1laltn:iStYf2Cq8Riy87soY22XxTu1Wc4Ipv1MZDxDqJ75mpk', '2021-05-09 21:02:39.910258'),
('k6u87uhzlawu05opnjl85clbpxr6prb1', '.eJxVjDsOwjAQBe_iGlmO499S0nMGy-v14gBypDipEHeHSCmgfTPzXiKmba1x62WJE4mzGMTpd8OUH6XtgO6p3WaZ57YuE8pdkQft8jpTeV4O9--gpl6_NVqyPGL2BGMG7X2mEMAyGZcYtQEEh9argZ3VOrBKpDwbxQChmFLE-wPzTzgr:1kSolj:x14mrpZ_4fWyj1QWPnuBwMIMTBg5omtqdNCrbt9HJMI', '2020-10-28 21:57:11.974789'),
('lhp5nwggp05r0n338001g00394tcmu74', '.eJxVjDsOwjAQBe_iGlmO499S0nMGy-v14gBypDipEHeHSCmgfTPzXiKmba1x62WJE4mzGMTpd8OUH6XtgO6p3WaZ57YuE8pdkQft8jpTeV4O9--gpl6_NVqyPGL2BGMG7X2mEMAyGZcYtQEEh9argZ3VOrBKpDwbxQChmFLE-wPzTzgr:1lbZHc:6v-fJA-SZ1DjXyuxums_KgojiQAvkTXn5afAJNuMbh4', '2021-05-12 01:46:32.322616'),
('n8h3oum2u2fevjr6dbd5425rz7tyxkjt', 'YTA0ZjhmMGQxZWI4YzRmOWMyMzBlNjI2YmNhN2MxMTY3ZDJhZWM1NDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNGQ2N2FjZDgxMGI1MmM5Y2VjNjcwMWMwNTMwZGJhYzMyOGYzODdmIn0=', '2020-09-09 09:27:28.599260'),
('ne843997at8zsd2wq72dga2yysw1qi8y', '.eJxVjDsOwjAQBe_iGlmO499S0nMGy-v14gBypDipEHeHSCmgfTPzXiKmba1x62WJE4mzGMTpd8OUH6XtgO6p3WaZ57YuE8pdkQft8jpTeV4O9--gpl6_NVqyPGL2BGMG7X2mEMAyGZcYtQEEh9argZ3VOrBKpDwbxQChmFLE-wPzTzgr:1lWJMA:K6yTD1CR4UjS7fZ5VUvCVuiKz2clSxE7KEcLtOqx6Vg', '2021-04-27 13:45:30.946660'),
('oiqke60ab33s8nfjwe3n0grtisyq3rnb', '.eJxVjDsOwjAQBe_iGlmO499S0nMGy-v14gBypDipEHeHSCmgfTPzXiKmba1x62WJE4mzGMTpd8OUH6XtgO6p3WaZ57YuE8pdkQft8jpTeV4O9--gpl6_NVqyPGL2BGMG7X2mEMAyGZcYtQEEh9argZ3VOrBKpDwbxQChmFLE-wPzTzgr:1lChvf:0vhOHy_trCWKzexwKnel1eavvAYHyoWB0gOudQkUAgQ', '2021-03-04 11:57:07.879932'),
('olyq30pboaj0nszlvepppff6f6oxfcv0', 'MTc5MGUxZDBkMGFiYjc1MWM4NThmN2I5ODBmYjMzMzE1MTZmZDBmOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZGE4ZDNkMGFiMTI5MmI0MTY4NDc4NWQzNzU1MDBiMTJhYjc4YTAyIn0=', '2020-09-11 15:04:34.297077'),
('olzs3m1zfnjhmu9fovfds7h4ehfaem2w', '.eJxVjEEOgjAQRe_StWnKFMrUpXvPQGamU0ENTSisjHdXEha6_e-9_zIDbes4bFWXYUrmbBpnTr8jkzx03km603wrVsq8LhPbXbEHrfZakj4vh_t3MFIdv3VEJxycijQtJe4IQbNC7APnzsfoPGB2gTlA9KiYUyJB6AUC9uJa8_4AF_k4RA:1lUvwl:aRPZnkvZ9w1rR6OQDuLLfv3sE4zDU4N0hfB9DlDDCG4', '2021-04-23 18:33:35.391965'),
('p9yygrwooq1s1hcvd4z9c41pcy8mxtcv', '.eJxVjDsOwjAQBe_iGlmO499S0nMGy-v14gBypDipEHeHSCmgfTPzXiKmba1x62WJE4mzGMTpd8OUH6XtgO6p3WaZ57YuE8pdkQft8jpTeV4O9--gpl6_NVqyPGL2BGMG7X2mEMAyGZcYtQEEh9argZ3VOrBKpDwbxQChmFLE-wPzTzgr:1l35YQ:YYWgaWC1tQq644RArLiTcxKAY7G_Sw7JF60ABeI7ZJk', '2021-02-05 23:09:22.928078'),
('qcccj0sxyrvjm14i1asafpgrja8c6xox', '.eJxVjDsOwjAQBe_iGlmO499S0nMGy-v14gBypDipEHeHSCmgfTPzXiKmba1x62WJE4mzGMTpd8OUH6XtgO6p3WaZ57YuE8pdkQft8jpTeV4O9--gpl6_NVqyPGL2BGMG7X2mEMAyGZcYtQEEh9argZ3VOrBKpDwbxQChmFLE-wPzTzgr:1lVoPO:dzzUzmvHrokTORB8MOcNF6ckH8jPWLK5itM15IB_Ppo', '2021-04-26 04:42:46.247030'),
('sy147o99tzvwqc5wtkga3hvrc1jb74qn', '.eJxVjDsOwjAQBe_iGlmO499S0nMGy-v14gBypDipEHeHSCmgfTPzXiKmba1x62WJE4mzGMTpd8OUH6XtgO6p3WaZ57YuE8pdkQft8jpTeV4O9--gpl6_NVqyPGL2BGMG7X2mEMAyGZcYtQEEh9argZ3VOrBKpDwbxQChmFLE-wPzTzgr:1lChfx:4dZvLsZUAjvXiQywM7fr0gwZv-h0oCBL9lLYSwZqVIs', '2021-03-04 11:40:53.337170'),
('ty2c3vu2xpd50wj0u42uf84a27bll3x2', '.eJxVjDsOwjAQBe_iGlmO499S0nMGy-v14gBypDipEHeHSCmgfTPzXiKmba1x62WJE4mzGMTpd8OUH6XtgO6p3WaZ57YuE8pdkQft8jpTeV4O9--gpl6_NVqyPGL2BGMG7X2mEMAyGZcYtQEEh9argZ3VOrBKpDwbxQChmFLE-wPzTzgr:1lChla:mNlDL7BmK0g0SGsB6TTsAjRMKSWk5KzIT1ZYXSPpPGE', '2021-03-04 11:46:42.280470'),
('uq9fq6j85qtt8vvyj2znmklf61n0ry3o', 'MTc5MGUxZDBkMGFiYjc1MWM4NThmN2I5ODBmYjMzMzE1MTZmZDBmOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZGE4ZDNkMGFiMTI5MmI0MTY4NDc4NWQzNzU1MDBiMTJhYjc4YTAyIn0=', '2020-09-07 15:47:53.356355'),
('v9t2tnwvdjwrgjpxb7ucvpdc4jaaqa3s', '.eJxVjEEOwiAQRe_C2hCgAxaX7nsGMjNQqRpISrsy3l1JutDte-__lwi4bznsLa1hieIinDj9MkJ-pNJFvGO5Vcm1bOtCsifysE1ONabn9Wj_DjK2_F0zkePR-gGIeQBlkkYVmWcajE_OdcQAszpbTg6NN1op0DR68mCZxPsD8SM3vA:1kyLfp:xRvfVmB2gg8f6E_IMQGzvbLoFRCU1t-9g1Y0wAg3JSg', '2021-01-23 21:21:25.311468'),
('vrkmje1l3m9bakkgcyou78v2jxbubjn9', '.eJxVjDsOwjAQBe_iGlmO499S0nMGy-v14gBypDipEHeHSCmgfTPzXiKmba1x62WJE4mzGMTpd8OUH6XtgO6p3WaZ57YuE8pdkQft8jpTeV4O9--gpl6_NVqyPGL2BGMG7X2mEMAyGZcYtQEEh9argZ3VOrBKpDwbxQChmFLE-wPzTzgr:1lItgY:aejy8GIQeh6BcrYeDs5JdR_FrSoxCWb9veo7W9aR8A4', '2021-03-21 13:43:06.017407'),
('x850uh0g9iols89hnfbmwqph11njm265', 'MjJkZTI1ZDU4YmQ1NDI4YTdmOTg0OTcyNDQyMmQxMGMwZWI0ODQ2ZDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZDI4N2U4MzBiYzI2ZmY2Y2I2Nzc2Zjg3MjJkOTg0NDg0NWNkYTJlIn0=', '2020-09-09 09:37:05.262844'),
('ymwruig77wi8thj5ub7divacs3btm2lk', '.eJxVjMEOwiAQRP-FsyEVtoX16N1vICy7laqBpLQn47_bJj3ocea9mbcKcV1yWJvMYWJ1UV6dfjuK6SllB_yI5V51qmWZJ9K7og_a9K2yvK6H-3eQY8vb2nYDsPUkJAzYoXfkBJIkk1AMbmm0PQJGNzL2FpHMcE7GQ7RivID6fAHshTfT:1kyLhS:sZ7EX4ZARHSxCjc6R5RH4yFfH3EEoW-Dhs8rlpsKHhs', '2021-01-23 21:23:06.793793');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_friendrequest`
--
ALTER TABLE `accounts_friendrequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_friendrequest_from_user_id_f74e1070_fk_auth_user_id` (`from_user_id`),
  ADD KEY `accounts_friendrequest_to_user_id_cfa35a29_fk_auth_user_id` (`to_user_id`);

--
-- Indexes for table `accounts_profile`
--
ALTER TABLE `accounts_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `accounts_profile_slug_8a7a322e` (`slug`);

--
-- Indexes for table `accounts_profile_friends`
--
ALTER TABLE `accounts_profile_friends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_profile_friends_from_profile_id_to_profi_7d7fe1cc_uniq` (`from_profile_id`,`to_profile_id`),
  ADD KEY `accounts_profile_fri_to_profile_id_391683d5_fk_accounts_` (`to_profile_id`);

--
-- Indexes for table `accounts_touse`
--
ALTER TABLE `accounts_touse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_touse_first_person_id_f410ae07_fk_auth_user_id` (`first_person_id`),
  ADD KEY `accounts_touse_second_person_id_b9eb3c7b_fk_auth_user_id` (`second_person_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `chat_messagemodel`
--
ALTER TABLE `chat_messagemodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_messagemodel_recipient_id_839a3fcb_fk_auth_user_id` (`recipient_id`),
  ADD KEY `chat_messagemodel_user_id_427cf688_fk_auth_user_id` (`user_id`),
  ADD KEY `chat_messagemodel_timestamp_d2167d74` (`timestamp`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_friendrequest`
--
ALTER TABLE `accounts_friendrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `accounts_profile`
--
ALTER TABLE `accounts_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `accounts_profile_friends`
--
ALTER TABLE `accounts_profile_friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `accounts_touse`
--
ALTER TABLE `accounts_touse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `chat_messagemodel`
--
ALTER TABLE `chat_messagemodel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_friendrequest`
--
ALTER TABLE `accounts_friendrequest`
  ADD CONSTRAINT `accounts_friendrequest_from_user_id_f74e1070_fk_auth_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `accounts_friendrequest_to_user_id_cfa35a29_fk_auth_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_profile`
--
ALTER TABLE `accounts_profile`
  ADD CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_profile_friends`
--
ALTER TABLE `accounts_profile_friends`
  ADD CONSTRAINT `accounts_profile_fri_from_profile_id_e70b0886_fk_accounts_` FOREIGN KEY (`from_profile_id`) REFERENCES `accounts_profile` (`id`),
  ADD CONSTRAINT `accounts_profile_fri_to_profile_id_391683d5_fk_accounts_` FOREIGN KEY (`to_profile_id`) REFERENCES `accounts_profile` (`id`);

--
-- Constraints for table `accounts_touse`
--
ALTER TABLE `accounts_touse`
  ADD CONSTRAINT `accounts_touse_first_person_id_f410ae07_fk_auth_user_id` FOREIGN KEY (`first_person_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `accounts_touse_second_person_id_b9eb3c7b_fk_auth_user_id` FOREIGN KEY (`second_person_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `chat_messagemodel`
--
ALTER TABLE `chat_messagemodel`
  ADD CONSTRAINT `chat_messagemodel_recipient_id_839a3fcb_fk_auth_user_id` FOREIGN KEY (`recipient_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `chat_messagemodel_user_id_427cf688_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
