-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2026 at 09:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edustream_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `asset_id` int(50) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `group_id` varchar(50) DEFAULT NULL,
  `file_type` varchar(10) DEFAULT NULL,
  `original_filename` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) UNSIGNED DEFAULT NULL,
  `mime_type` varchar(120) DEFAULT NULL,
  `upload_date` datetime NOT NULL DEFAULT current_timestamp(),
  `owner` varchar(120) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `search_text` longtext DEFAULT NULL,
  `mandatory` varchar(5) DEFAULT NULL,
  `file_data` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_tags`
--

CREATE TABLE `asset_tags` (
  `asset_id` varchar(64) NOT NULL,
  `tag_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groupdb`
--

CREATE TABLE `groupdb` (
  `groupID` varchar(50) NOT NULL,
  `groupName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groupdb`
--

INSERT INTO `groupdb` (`groupID`, `groupName`) VALUES
('EduStream', 'EduStream Master Folder'),
('GW09', 'EduStream Project Team');

-- --------------------------------------------------------

--
-- Table structure for table `stu`
--

CREATE TABLE `stu` (
  `matric_no` varchar(15) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `group_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stu`
--

INSERT INTO `stu` (`matric_no`, `full_name`, `group_no`) VALUES
('B032310641', 'UMAR ASHRAFFI BIN ADNAN', 'EduStream'),
('B032310833', 'PRIYADASHWINI A/P YOHESWARAN', 'EduStream'),
('B032310858', 'IRDINA SYAFIAH BINTI NORAZMAN', 'EduStream'),
('B032410816', 'SUFIANA ADLIN BINTI BAHAROM', 'EduStream');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(50) NOT NULL,
  `keyword` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`asset_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `asset_tags`
--
ALTER TABLE `asset_tags`
  ADD PRIMARY KEY (`asset_id`,`tag_id`);

--
-- Indexes for table `groupdb`
--
ALTER TABLE `groupdb`
  ADD PRIMARY KEY (`groupID`);

--
-- Indexes for table `stu`
--
ALTER TABLE `stu`
  ADD PRIMARY KEY (`matric_no`),
  ADD KEY `group_no` (`group_no`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `asset_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groupdb` (`groupID`);

--
-- Constraints for table `stu`
--
ALTER TABLE `stu`
  ADD CONSTRAINT `stu_ibfk_1` FOREIGN KEY (`group_no`) REFERENCES `groupdb` (`groupID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
