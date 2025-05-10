-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 01, 2022 at 02:50 PM
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
-- Database: `dbduan`
--
CREATE DATABASE IF NOT EXISTS `dbduan` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dbduan`;

-- --------------------------------------------------------

--
-- Table structure for table `duan`
--

DROP TABLE IF EXISTS `duan`;
CREATE TABLE IF NOT EXISTS `duan` (
  `mada` int(11) NOT NULL AUTO_INCREMENT,
  `tenda` varchar(100) NOT NULL,
  PRIMARY KEY (`mada`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `duan`
--

INSERT INTO `duan` (`mada`, `tenda`) VALUES
(1, 'Dự án 1'),
(2, 'Dự án 2'),
(3, 'Dự án 3'),
(4, 'Dự án 4');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `manv` varchar(100) NOT NULL,
  `tennv` varchar(100) NOT NULL,
  `ngaysinh` date NOT NULL,
  `mada` int(11) NOT NULL,
  PRIMARY KEY (`manv`),
  KEY `mada` (`mada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`manv`, `tennv`, `ngaysinh`, `mada`) VALUES
('NV1', 'Nhân viên 1', '1999-03-15', 1),
('NV2', 'Nhân viên 2', '1996-05-07', 1),
('NV3', 'Nhân viên 3', '2000-02-03', 2),
('NV4', 'Nhân viên 4', '2002-09-07', 2),
('NV5', 'Nhân viên 5', '1985-07-12', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `fk_nhanvien_mada_duan_mada` FOREIGN KEY (`mada`) REFERENCES `duan` (`mada`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
