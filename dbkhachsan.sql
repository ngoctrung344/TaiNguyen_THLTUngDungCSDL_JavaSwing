-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 01, 2022 at 03:51 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbkhachsan`
--
CREATE DATABASE IF NOT EXISTS `dbkhachsan` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dbkhachsan`;

-- --------------------------------------------------------

--
-- Table structure for table `datphong`
--

DROP TABLE IF EXISTS `datphong`;
CREATE TABLE IF NOT EXISTS `datphong` (
  `madat` int(11) NOT NULL AUTO_INCREMENT,
  `tenkhachdat` varchar(100) NOT NULL,
  `maphong` varchar(100) NOT NULL,
  `ngaydat` date NOT NULL,
  PRIMARY KEY (`madat`),
  KEY `maphong` (`maphong`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `datphong`
--

INSERT INTO `datphong` (`madat`, `tenkhachdat`, `maphong`, `ngaydat`) VALUES
(1, 'Trần Tí', 'DLX', '2022-06-30'),
(2, 'Lê Sửu', 'STD', '2022-08-17'),
(3, 'Nguyễn Dần', 'SUP', '2022-06-24'),
(4, 'Trịnh Mão', 'DLX', '2022-09-22'),
(5, 'Hoàng Thìn', 'SUP', '2022-07-07'),
(6, 'Đỗ Tỵ', 'DLX', '2023-05-18');

-- --------------------------------------------------------

--
-- Table structure for table `phong`
--

DROP TABLE IF EXISTS `phong`;
CREATE TABLE IF NOT EXISTS `phong` (
  `maphong` varchar(100) NOT NULL,
  `tenphong` varchar(100) NOT NULL,
  PRIMARY KEY (`maphong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phong`
--

INSERT INTO `phong` (`maphong`, `tenphong`) VALUES
('DLX', 'Deluxe'),
('STD', 'Standard'),
('SUP', 'Superior'),
('SUT', 'Suite');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `datphong`
--
ALTER TABLE `datphong`
  ADD CONSTRAINT `fk_datphong_maphong_phong_maphong` FOREIGN KEY (`maphong`) REFERENCES `phong` (`maphong`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
