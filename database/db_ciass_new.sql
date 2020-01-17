-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 17, 2020 at 09:51 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ciass`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `contactId` int(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `note` varchar(200) NOT NULL DEFAULT '-',
  `userId` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`contactId`, `name`, `email`, `mobile`, `note`, `userId`) VALUES
(1, 'Tester', 'tester@cias.com', '1234567890', 'tester with uid', 3),
(2, 'Tester 2', 'te2@cias.com', '1234567890', 'hapus aja', 3),
(3, 'Jhon Bon Jovi', 'jhon@jovi.com', '0976543212', 'vokalis', 10),
(4, 'Richie Sambora', 'r.sambora@jovi.com', '0912893487', 'Guitarist', 10),
(5, 'David Bryan', 'david@jovi.com', '0962638746', 'keyboard', 10),
(6, 'Tico Torres', 'tico@jovi.com', '8364827548', 'drummer', 10),
(7, 'Gun N Roses', 'gnr@cias.com', '9883648923', 'band', 11),
(8, 'Slash', 'slash@cias.com', '8374928798', 'guitarist', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contacts`
--

CREATE TABLE `tbl_contacts` (
  `id_contact` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contacts`
--

INSERT INTO `tbl_contacts` (`id_contact`, `name`, `email`, `mobile`, `note`) VALUES
(2, 'Dika', 'dika@cias.com', '0811256742', 'Bukan Raditya Dika'),
(3, 'Sayaka', 'sayaka@cias.com', '0813738263', 'Katanya turunan Jepang'),
(9, 'Kemal Pahlevi', 'kemal@cias.com', '0987654321', 'artis');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_last_login`
--

CREATE TABLE `tbl_last_login` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `sessionData` varchar(2048) NOT NULL,
  `machineIp` varchar(1024) NOT NULL,
  `userAgent` varchar(128) NOT NULL,
  `agentString` varchar(1024) NOT NULL,
  `platform` varchar(128) NOT NULL,
  `createdDtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_last_login`
--

INSERT INTO `tbl_last_login` (`id`, `userId`, `sessionData`, `machineIp`, `userAgent`, `agentString`, `platform`, `createdDtm`) VALUES
(1, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 79.0.3945.88', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'Mac OS X', '2020-01-06 14:25:04'),
(2, 2, '{\"role\":\"2\",\"roleText\":\"Manager\",\"name\":\"Manager\"}', '::1', 'Chrome 79.0.3945.88', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'Mac OS X', '2020-01-06 14:30:47'),
(3, 3, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Employee\"}', '::1', 'Chrome 79.0.3945.88', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'Mac OS X', '2020-01-06 14:31:15'),
(4, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-09 11:50:56'),
(5, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-09 11:53:17'),
(6, 3, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Employee\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-09 11:57:55'),
(7, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-09 18:27:54'),
(8, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 00:00:21'),
(9, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 08:18:33'),
(10, 3, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Employee\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 08:22:10'),
(11, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 08:26:35'),
(12, 2, '{\"role\":\"2\",\"roleText\":\"Manager\",\"name\":\"Manager\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 08:28:06'),
(13, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 08:39:08'),
(14, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 08:54:00'),
(15, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 09:06:46'),
(16, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 09:10:12'),
(17, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 13:52:16'),
(18, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 14:51:54'),
(19, 3, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Employee\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 15:09:24'),
(20, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 15:12:02'),
(21, 3, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Employee\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 15:17:19'),
(22, 2, '{\"role\":\"2\",\"roleText\":\"Manager\",\"name\":\"Manager\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 15:17:37'),
(23, 3, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Employee\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 15:17:52'),
(24, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-10 15:36:03'),
(25, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-13 10:31:07'),
(26, 3, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Employee\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-14 09:08:49'),
(27, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-14 09:29:18'),
(28, 3, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Employee\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-14 09:29:30'),
(29, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-14 11:05:43'),
(30, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-14 11:07:16'),
(31, 11, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Axl Rose\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-14 11:10:27'),
(32, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-14 11:56:57'),
(33, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-14 14:29:14'),
(34, 11, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Axl Rose\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-14 15:16:32'),
(35, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-14 22:50:52'),
(36, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-14 23:08:19'),
(37, 11, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Axl Rose\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-14 23:53:06'),
(38, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-14 23:56:33'),
(39, 11, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Axl Rose\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 00:00:27'),
(40, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 00:00:53'),
(41, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 08:11:19'),
(42, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 08:25:55'),
(43, 2, '{\"role\":\"2\",\"roleText\":\"Manager\",\"name\":\"Manager\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 08:36:56'),
(44, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 08:37:21'),
(45, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 09:38:28'),
(46, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 11:29:04'),
(47, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 11:29:26'),
(48, 11, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Axl Rose\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 11:52:35'),
(49, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 11:54:11'),
(50, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 13:18:44'),
(51, 11, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Axl Rose\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 13:20:14'),
(52, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 14:37:39'),
(53, 11, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Axl Rose\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 15:06:46'),
(54, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 15:07:43'),
(55, 11, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Axl Rose\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-15 15:21:04'),
(56, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-16 11:41:48'),
(57, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-17 15:13:33'),
(58, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-17 15:15:17'),
(59, 10, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Bon Jovi\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-17 15:16:20'),
(60, 11, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Axl Rose\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-17 15:18:39'),
(61, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Administrator\"}', '::1', 'Chrome 79.0.3945.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 'Mac OS X', '2020-01-17 15:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reset_password`
--

CREATE TABLE `tbl_reset_password` (
  `id` bigint(20) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activation_id` varchar(32) NOT NULL,
  `agent` varchar(512) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` bigint(20) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `roleId` tinyint(4) NOT NULL COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`roleId`, `role`) VALUES
(1, 'System Administrator'),
(2, 'Manager'),
(3, 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saldo`
--

CREATE TABLE `tbl_saldo` (
  `saldoId` int(20) NOT NULL,
  `userId` int(20) NOT NULL,
  `saldo` int(200) NOT NULL DEFAULT '0',
  `updateDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_saldo`
--

INSERT INTO `tbl_saldo` (`saldoId`, `userId`, `saldo`, `updateDate`) VALUES
(1, 10, 950000, '2020-01-17 09:18:12'),
(2, 11, 1400000, '2020-01-17 09:18:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `transaksiId` int(20) NOT NULL,
  `userId` int(20) NOT NULL,
  `sellerId` int(20) NOT NULL,
  `jenisId` enum('topup','transfer') NOT NULL DEFAULT 'topup',
  `note` varchar(200) NOT NULL,
  `nominal` int(20) NOT NULL,
  `updateDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`transaksiId`, `userId`, `sellerId`, `jenisId`, `note`, `nominal`, `updateDate`) VALUES
(2, 11, 1, 'topup', 'Normal', 150000, '2020-01-15 07:24:48'),
(3, 10, 11, 'transfer', 'Normal', 150000, '2020-01-15 09:08:20'),
(4, 11, 10, 'transfer', 'Normal', 50000, '2020-01-15 09:24:54'),
(5, 11, 10, 'transfer', 'Normal', 50000, '2020-01-15 09:25:45'),
(6, 10, 11, 'transfer', 'Normal', 150000, '2020-01-16 05:43:25'),
(7, 10, 1, 'topup', 'Normal', 50000, '2020-01-17 09:17:25'),
(8, 10, 11, 'transfer', 'Normal', 200000, '2020-01-17 09:18:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `userId` int(11) NOT NULL,
  `email` varchar(128) NOT NULL COMMENT 'login email',
  `password` varchar(128) NOT NULL COMMENT 'hashed login password',
  `name` varchar(128) DEFAULT NULL COMMENT 'full name of user',
  `mobile` varchar(20) DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES
(1, 'admin@cias.com', '$2y$10$nCYIhg0aXsV2/QPJVGKZ1uItxFjE5MRXPiCLZZS3JvcFCIi7IrVD2', 'Administrator', '0812223344', 1, 0, 0, '2015-07-01 18:56:49', 1, '2018-01-05 05:56:34'),
(2, 'manager@cias.com', '$2y$10$nCYIhg0aXsV2/QPJVGKZ1uItxFjE5MRXPiCLZZS3JvcFCIi7IrVD2', 'Manager', '0813334455', 2, 0, 1, '2016-12-09 17:49:56', 1, '2018-01-12 07:22:11'),
(10, 'bonjovi@cias.com', '$2y$10$SPaWQe1fO6fvCXfBJuGl3eVCAVZepXI8Z6vA12xNFHUudKwakUR0G', 'Bon Jovi', '0987654321', 3, 0, 1, '2020-01-14 05:06:28', NULL, NULL),
(11, 'axl@cias.com', '$2y$10$ODJzwGKWyFZ.7JuWTiq2cuyqoh5jCbVa/v.x6JFDKCttF5XA0Mk9O', 'Axl Rose', '0812345467', 3, 0, 1, '2020-01-14 05:06:54', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_voucher`
--

CREATE TABLE `tbl_voucher` (
  `voucherId` int(20) NOT NULL,
  `code` varchar(12) NOT NULL,
  `nominal` int(20) NOT NULL,
  `note` varchar(100) NOT NULL,
  `isUsed` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_voucher`
--

INSERT INTO `tbl_voucher` (`voucherId`, `code`, `nominal`, `note`, `isUsed`) VALUES
(1, '123456789012', 100000, 'Promo', 0),
(2, '098765432112', 50000, 'Normal', 0),
(4, '222222222222', 200000, 'normal', 1),
(5, '121212121212', 150000, 'promo', 1),
(6, '212121212121', 50000, 'normal', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `tbl_contacts`
--
ALTER TABLE `tbl_contacts`
  ADD PRIMARY KEY (`id_contact`);

--
-- Indexes for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `tbl_saldo`
--
ALTER TABLE `tbl_saldo`
  ADD PRIMARY KEY (`saldoId`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`transaksiId`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `tbl_voucher`
--
ALTER TABLE `tbl_voucher`
  ADD PRIMARY KEY (`voucherId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `contactId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_contacts`
--
ALTER TABLE `tbl_contacts`
  MODIFY `id_contact` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_saldo`
--
ALTER TABLE `tbl_saldo`
  MODIFY `saldoId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `transaksiId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_voucher`
--
ALTER TABLE `tbl_voucher`
  MODIFY `voucherId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
