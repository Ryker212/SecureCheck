-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2024 at 08:41 AM
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
-- Database: `officer_kt2`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmpCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PrefixName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PrefixName2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FirstName2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LastName2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UnitCodeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ParentUnitCodeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PositionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CompanyName2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmpCode`, `PrefixName`, `FirstName`, `LastName`, `PrefixName2`, `FirstName2`, `LastName2`, `UnitCodeName`, `ParentUnitCodeName`, `PositionName`, `CompanyName2`) VALUES
('045381', 'นาย', 'ขวัญ', 'ดำรงศ์งาม', 'Mr.', 'KWAN', 'DAMRONGNGAM', 'แผนกสารสนเทศ', 'ฝ่ายสารสนเทศ', 'ผู้ช่วยผู้จัดการฝ่ายสารสนเทศ', 'KT2'),
('045897', 'นาย', 'วสันต์', 'จันทร์ดี', 'Mr.', 'WASAN', 'JANDEE', 'แผนกสารสนเทศ', 'ฝ่ายสารสนเทศ', 'ผู้ช่วยผู้จัดการแผนกสารสนเทศ', 'KT2'),
('110261', 'นางสาว', 'พิชามญชุ์', 'โสพรม', 'Ms.', 'PICHAMON', 'SOPROM', 'แผนกสารสนเทศ', 'ฝ่ายสารสนเทศ', 'โปรแกรมเมอร์', 'KT2'),
('110543', 'นาย', 'สุทธิจิต', 'พุทธประวัติ', 'Mr.', 'SUTTHICHIT', 'PUTTAPRAWAT', 'แผนกสารสนเทศ', 'ฝ่ายสารสนเทศ', 'โปรแกรมเมอร์', 'KT2'),
('110558', 'นางสาว', 'ขอบฟ้า', 'ปาณดิษฐ์', 'Ms.', 'KHOBFAH', 'PANDIT', 'แผนกสารสนเทศ', 'ฝ่ายสารสนเทศ', 'โปรแกรมเมอร์ SCADA', 'KT2'),
('110628', 'นาย', 'รัฐพงษ์', 'แก้วโมรา', 'Mr.', 'RATTAPONG', 'KAWMORA', 'แผนกสารสนเทศ', 'ฝ่ายสารสนเทศ', 'หัวหน้าหน่วยสารสนเทศ', 'KT2'),
('110761', 'นาย', 'กฤษณะ', 'รักคณะชาติ', 'Mr.', 'KRIDSANA', 'RAKKANACHART', 'แผนกสารสนเทศ', 'ฝ่ายสารสนเทศ', 'เจ้าหน้าที่สารสนเทศ', 'KT2');

-- --------------------------------------------------------

--
-- Table structure for table `timestamp`
--

CREATE TABLE `timestamp` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `id_emp` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmpCode`);

--
-- Indexes for table `timestamp`
--
ALTER TABLE `timestamp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_emp` (`id_emp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `timestamp`
--
ALTER TABLE `timestamp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `timestamp`
--
ALTER TABLE `timestamp`
  ADD CONSTRAINT `1` FOREIGN KEY (`id_emp`) REFERENCES `employee` (`EmpCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
