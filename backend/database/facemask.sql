-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2020 at 11:59 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facemask`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `auto_id` int(11) NOT NULL,
  `_date` varchar(60) NOT NULL,
  `_time` varchar(60) NOT NULL,
  `image_path` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`auto_id`, `_date`, `_time`, `image_path`) VALUES
(1, '2020-11-28', '12:18:44 AM', '2020-11-28_12-18-44 AM.jpg'),
(2, '2020-11-28', '12:18:44 AM', '2020-11-28_12-18-44 AM.jpg'),
(3, '2020-11-28', '12:18:45 AM', '2020-11-28_12-18-45 AM.jpg'),
(4, '2020-11-28', '12:18:51 AM', '2020-11-28_12-18-51 AM.jpg'),
(5, '2020-11-28', '12:18:51 AM', '2020-11-28_12-18-51 AM.jpg'),
(6, '2020-11-28', '12:18:52 AM', '2020-11-28_12-18-52 AM.jpg'),
(7, '2020-11-28', '12:18:54 AM', '2020-11-28_12-18-54 AM.jpg'),
(8, '2020-11-28', '12:18:54 AM', '2020-11-28_12-18-54 AM.jpg'),
(9, '2020-11-28', '12:18:55 AM', '2020-11-28_12-18-55 AM.jpg'),
(10, '2020-11-28', '12:18:56 AM', '2020-11-28_12-18-56 AM.jpg'),
(11, '2020-11-28', '12:18:58 AM', '2020-11-28_12-18-58 AM.jpg'),
(12, '2020-11-28', '12:18:59 AM', '2020-11-28_12-18-59 AM.jpg'),
(13, '2020-11-28', '12:18:59 AM', '2020-11-28_12-18-59 AM.jpg'),
(14, '2020-11-28', '12:18:59 AM', '2020-11-28_12-18-59 AM.jpg'),
(15, '2020-11-28', '12:18:59 AM', '2020-11-28_12-18-59 AM.jpg'),
(16, '2020-11-28', '12:19:00 AM', '2020-11-28_12-19-00 AM.jpg'),
(17, '2020-11-28', '12:19:00 AM', '2020-11-28_12-19-00 AM.jpg'),
(18, '2020-11-28', '12:19:00 AM', '2020-11-28_12-19-00 AM.jpg'),
(19, '2020-11-28', '12:19:01 AM', '2020-11-28_12-19-01 AM.jpg'),
(20, '2020-11-28', '12:19:01 AM', '2020-11-28_12-19-01 AM.jpg'),
(21, '2020-11-28', '12:19:01 AM', '2020-11-28_12-19-01 AM.jpg'),
(22, '2020-11-28', '12:19:01 AM', '2020-11-28_12-19-01 AM.jpg'),
(23, '2020-11-28', '12:19:02 AM', '2020-11-28_12-19-02 AM.jpg'),
(24, '2020-11-28', '12:19:02 AM', '2020-11-28_12-19-02 AM.jpg'),
(25, '2020-11-28', '12:19:02 AM', '2020-11-28_12-19-02 AM.jpg'),
(26, '2020-11-28', '12:19:03 AM', '2020-11-28_12-19-03 AM.jpg'),
(27, '2020-11-28', '12:19:03 AM', '2020-11-28_12-19-03 AM.jpg'),
(28, '2020-11-28', '12:19:03 AM', '2020-11-28_12-19-03 AM.jpg'),
(29, '2020-11-28', '12:19:05 AM', '2020-11-28_12-19-05 AM.jpg'),
(30, '2020-11-28', '12:19:05 AM', '2020-11-28_12-19-05 AM.jpg'),
(31, '2020-11-28', '12:24:23 AM', '2020-11-28_12-24-23 AM.jpg'),
(32, '2020-11-28', '12:24:35 AM', '2020-11-28_12-24-35 AM.jpg'),
(33, '2020-11-28', '12:24:35 AM', '2020-11-28_12-24-35 AM.jpg'),
(34, '2020-11-28', '12:24:35 AM', '2020-11-28_12-24-35 AM.jpg'),
(35, '2020-11-28', '12:24:36 AM', '2020-11-28_12-24-36 AM.jpg'),
(36, '2020-11-28', '12:24:36 AM', '2020-11-28_12-24-36 AM.jpg'),
(37, '2020-11-28', '12:24:36 AM', '2020-11-28_12-24-36 AM.jpg'),
(38, '2020-11-28', '12:24:37 AM', '2020-11-28_12-24-37 AM.jpg'),
(39, '2020-11-28', '12:24:37 AM', '2020-11-28_12-24-37 AM.jpg'),
(40, '2020-11-28', '12:24:37 AM', '2020-11-28_12-24-37 AM.jpg'),
(41, '2020-11-28', '12:24:37 AM', '2020-11-28_12-24-37 AM.jpg'),
(42, '2020-11-28', '12:24:41 AM', '2020-11-28_12-24-41 AM.jpg'),
(43, '2020-11-30', '05:09:41 PM', '2020-11-30_05-09-41 PM.jpg'),
(44, '2020-11-30', '05:09:42 PM', '2020-11-30_05-09-42 PM.jpg'),
(45, '2020-11-30', '05:11:58 PM', '2020-11-30_05-11-58 PM.jpg'),
(46, '2020-11-30', '05:11:58 PM', '2020-11-30_05-11-58 PM.jpg'),
(47, '2020-11-30', '05:11:59 PM', '2020-11-30_05-11-59 PM.jpg'),
(48, '2020-11-30', '05:12:13 PM', '2020-11-30_05-12-13 PM.jpg'),
(49, '2020-11-30', '05:12:27 PM', '2020-11-30_05-12-27 PM.jpg'),
(50, '2020-11-30', '05:12:33 PM', '2020-11-30_05-12-33 PM.jpg'),
(51, '2020-11-30', '05:12:33 PM', '2020-11-30_05-12-33 PM.jpg'),
(52, '2020-11-30', '05:12:34 PM', '2020-11-30_05-12-34 PM.jpg'),
(53, '2020-11-30', '05:12:36 PM', '2020-11-30_05-12-36 PM.jpg'),
(54, '2020-11-30', '05:12:36 PM', '2020-11-30_05-12-36 PM.jpg'),
(55, '2020-11-30', '05:12:37 PM', '2020-11-30_05-12-37 PM.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `auto_id` int(11) NOT NULL,
  `lang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`auto_id`, `lang`) VALUES
(1, 'sinhala');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `auto_id` int(11) NOT NULL,
  `username` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`auto_id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$Tas.Euw9fjpQ2pT6U1pdkOhrPXdwQR20.DRJHbvTbONHvDXBmnwTi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`auto_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`auto_id`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`auto_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
