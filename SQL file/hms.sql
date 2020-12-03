-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2020 at 04:01 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'Test@12345', '28-09-2020 11:42:05 AM');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `doctorSpecialization` varchar(255) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `consultancyFees` int(11) DEFAULT NULL,
  `appointmentDate` varchar(255) DEFAULT NULL,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `userStatus` int(11) DEFAULT NULL,
  `doctorStatus` int(11) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `doctorSpecialization`, `doctorId`, `userId`, `consultancyFees`, `appointmentDate`, `appointmentTime`, `postingDate`, `userStatus`, `doctorStatus`, `updationDate`) VALUES
(3, 'Demo test', 7, 6, 600, '2020-09-29', '9:15 AM', '2020-09-23 18:31:28', 1, 0, '2020-10-16 05:41:51'),
(4, 'Ayurveda', 5, 5, 8050, '2020-10-08', '1:00 PM', '2020-10-05 10:28:54', 1, 1, '2020-10-16 05:42:15'),
(5, 'Dermatologist', 9, 7, 500, '2020-09-30', '5:30 PM', '2020-10-10 18:41:34', 1, 0, '2020-10-10 18:48:30'),
(6, 'Dermatologist', 9, 2, 500, '2020-10-21', '7:45 PM', '2020-10-09 14:10:56', 1, 0, '2020-10-09 14:17:11'),
(7, 'General Physician', 6, 9, 2500, '2020-10-16', '5:30 PM', '2020-10-14 13:51:50', 1, 1, NULL),
(8, 'General Physician', 6, 9, 2500, '2020-10-12', '4:00 PM', '2020-10-14 13:51:50', 1, 1, NULL),
(9, 'Dentist', 1, 9, 500, '2020-10-24', '11:15 AM', '2020-10-23 05:36:54', 1, 1, NULL),
(10, 'Dentist', 1, 9, 500, '2020-11-06', '6:45 PM', '2020-11-05 13:13:23', 1, 0, '2020-11-05 13:53:11');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `ID` int(10) NOT NULL,
  `patId` int(10) DEFAULT NULL,
  `mName` varchar(200) DEFAULT NULL,
  `mqty` varchar(200) NOT NULL,
  `mseller` varchar(100) DEFAULT NULL,
  `orderTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `docFees` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `docEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `specilization`, `doctorName`, `address`, `docFees`, `contactno`, `docEmail`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'Dentist', 'Anuj', 'New Delhi', '500', 8285703354, 'anuj.lpu1@gmail.com', 'ae69a331121724849f83f2aca559eb49', '2020-10-09 06:25:37', '2020-10-16 05:37:12'),
(2, 'Homeopath', 'Sarita Pandey', 'Varanasi', '600', 2147483647, 'sarita@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2020-10-09 06:51:51', '2020-10-16 05:37:25'),
(4, 'Homeopath', 'Vijay Verma', 'New Delhi', '700', 25668888, 'vijay@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2020-09-07 07:45:09', '2020-10-16 05:37:37'),
(5, 'Ayurveda', 'Sanjeev', 'Gurugram', '8050', 442166644646, 'sanjeev@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2020-09-07 07:47:07', '2020-10-16 05:37:48'),
(7, 'Demo test', 'abc ', 'New Delhi India', '200', 852888888, 'test@demo.com', 'f925916e2754e5e03f75dd58a5733251', '2020-09-07 08:08:58', '2020-10-10 18:17:25'),
(8, 'Ayurveda', 'Test Doctor', 'Xyz Abc New Delhi', '600', 1234567890, 'test@test.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-09-23 17:57:43', '2020-10-16 05:38:42'),
(9, 'Dermatologist', 'Anuj kumar', 'New Delhi India 110001', '500', 1234567890, 'anujk@test.com', 'ae69a331121724849f83f2aca559eb49', '2020-09-10 18:37:47', '2020-10-16 05:38:52'),
(10, 'Dermatologist', 'fawad khan', 'anna nagar', '200', 8222285555, 'khan@gmail.com', 'cc03e747a6afbbcbf8be7668acfebee5', '2020-10-22 06:57:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctorslog`
--

CREATE TABLE `doctorslog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorslog`
--

INSERT INTO `doctorslog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(20, NULL, ' test@demo.com', 0x3a3a3100000000000000000000000000, '2020-10-09 13:59:47', NULL, 0),
(21, NULL, ' test@demo.com', 0x3a3a3100000000000000000000000000, '2020-10-09 14:00:05', NULL, 0),
(22, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2020-10-09 14:04:56', '09-10-2020 07:38:33 PM', 1),
(23, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2020-10-09 14:11:22', '09-10-2020 07:42:09 PM', 1),
(24, NULL, 'amit@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-09 14:12:22', NULL, 0),
(25, NULL, 'amit@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-09 14:13:05', NULL, 0),
(26, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-09 14:13:34', '14-10-2020 10:12:55 AM', 1),
(27, 9, 'anujk@test.com', 0x3a3a3100000000000000000000000000, '2020-10-09 14:14:23', NULL, 1),
(28, 9, 'anujk@test.com', 0x3a3a3100000000000000000000000000, '2020-10-13 07:42:34', NULL, 1),
(29, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2020-10-13 09:38:17', NULL, 1),
(30, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2020-10-13 20:24:24', NULL, 1),
(31, 7, 'test@demo.com', 0x3a3a3100000000000000000000000000, '2020-10-13 20:34:02', '14-10-2020 02:04:06 AM', 1),
(32, 8, 'test@test.com', 0x3a3a3100000000000000000000000000, '2020-10-14 10:47:45', '14-10-2020 04:18:56 PM', 1),
(33, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 10:53:07', '14-10-2020 04:33:24 PM', 1),
(34, NULL, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 14:01:50', NULL, 0),
(35, NULL, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 14:02:30', NULL, 0),
(36, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 14:03:12', '14-10-2020 07:36:16 PM', 1),
(37, NULL, 'anujk@test.com', 0x3a3a3100000000000000000000000000, '2020-10-14 14:06:26', NULL, 0),
(38, NULL, 'anujk@test.com', 0x3a3a3100000000000000000000000000, '2020-10-14 14:06:34', NULL, 0),
(39, 9, 'anujk@test.com', 0x3a3a3100000000000000000000000000, '2020-10-14 14:09:30', '14-10-2020 07:44:15 PM', 1),
(40, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 14:14:27', '15-10-2020 10:01:45 PM', 1),
(41, 6, 'amrita@test.com', 0x3a3a3100000000000000000000000000, '2020-10-14 14:17:15', '14-10-2020 07:49:39 PM', 1),
(42, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-15 16:57:47', '15-10-2020 10:32:17 PM', 1),
(43, NULL, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-15 17:06:51', NULL, 0),
(44, NULL, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-15 17:06:58', NULL, 0),
(45, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-15 17:07:04', '16-10-2020 10:48:41 AM', 1),
(46, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-16 05:24:30', '16-10-2020 12:19:09 PM', 1),
(47, 9, 'anujk@test.com', 0x3a3a3100000000000000000000000000, '2020-10-16 05:29:51', '16-10-2020 11:16:10 AM', 1),
(48, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-23 05:11:03', '23-10-2020 10:41:37 AM', 1),
(49, NULL, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-29 17:11:26', NULL, 0),
(50, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-29 17:11:34', '29-10-2020 10:48:19 PM', 1),
(51, NULL, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-29 19:00:26', NULL, 0),
(52, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-29 19:00:31', '30-10-2020 12:53:36 AM', 1),
(53, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-30 05:11:45', '30-10-2020 11:20:15 AM', 1),
(54, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-11-02 13:42:21', '02-11-2020 07:18:38 PM', 1),
(55, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-11-05 12:46:22', '05-11-2020 06:17:08 PM', 1),
(56, 1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-11-05 13:52:40', '05-11-2020 07:27:59 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctorspecilization`
--

CREATE TABLE `doctorspecilization` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorspecilization`
--

INSERT INTO `doctorspecilization` (`id`, `specilization`, `creationDate`, `updationDate`) VALUES
(1, 'Gynecologist/Obstetrician', '2020-09-28 12:30:00', '2020-10-16 05:44:07'),
(2, 'General Physician', '2020-09-28 12:30:00', '2020-10-16 05:44:07'),
(3, 'Dermatologist', '2020-09-28 12:30:00', '2020-10-16 05:44:07'),
(4, 'Homeopath', '2020-09-28 12:30:00', '2020-10-16 05:44:07'),
(5, 'Ayurveda', '2020-09-28 12:30:00', '2020-10-16 05:44:07'),
(6, 'Dentist', '2020-09-28 12:30:00', '2020-10-16 05:44:07'),
(7, 'Ear-Nose-Throat (Ent) Specialist', '2020-09-28 12:30:00', '2020-10-16 05:44:07'),
(9, 'Demo test', '2020-09-28 12:30:00', '2020-10-16 05:44:07'),
(10, 'Bones Specialist demo', '2020-09-28 12:30:00', '2020-10-16 05:44:07'),
(11, 'Test', '2020-09-28 12:30:00', '2020-10-16 05:44:07'),
(12, 'Dermatologist', '2020-09-28 12:30:00', '2020-10-16 05:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `ID` int(10) NOT NULL,
  `pharmId` int(10) NOT NULL,
  `mediId` varchar(200) DEFAULT NULL,
  `mediName` varchar(200) DEFAULT NULL,
  `mediQuantity` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`ID`, `pharmId`, `mediId`, `mediName`, `mediQuantity`) VALUES
(2, 1, 'cal500', 'Calpol-500', '43'),
(4, 1, 'dol600', 'Dolo 600', '150'),
(5, 1, 'cr500', 'Crocin', '99'),
(6, 1, 'az250', 'Azithromycin', '45'),
(7, 2, 'ben', 'Benadryl', '99'),
(8, 2, 'zin12', 'Zincovit', '75'),
(9, 5, '1', 'allegra', '20'),
(10, 5, '2', 'sporin', '30'),
(11, 5, '1', 'allegra', '2');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(10) NOT NULL,
  `patId` int(10) DEFAULT NULL,
  `mName` varchar(200) DEFAULT NULL,
  `mqty` varchar(200) NOT NULL,
  `mseller` varchar(100) DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Placed',
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `patId`, `mName`, `mqty`, `mseller`, `Status`, `CreationDate`) VALUES
(21, 7, 'Benadryl', '1', 'Anu', 'Placed', '2020-10-13 20:50:55'),
(22, 7, 'Azithromycin', '5', 'Anand', 'Confirmed', '2020-11-05 13:57:42'),
(23, 9, 'Calpol-500', '1', 'Anand', 'Confirmed', '2020-10-16 05:11:32'),
(24, 9, 'Calpol-500', '1', 'Anand', 'Confirmed', '2020-10-16 05:11:32'),
(25, 9, 'Dolo', '1', 'Anand', 'Confirmed', '2020-10-16 05:11:32'),
(26, 9, 'Crocin-500', '1', 'Anand', 'Confirmed', '2020-10-16 05:11:32'),
(27, 9, 'Crocin', '1', 'Anand', 'Confirmed', '2020-10-16 05:11:32'),
(28, 9, 'Crocin', '1', 'Anand', 'Confirmed', '2020-10-16 05:11:32'),
(29, 9, 'Crocin', '1', 'Anand', 'Confirmed', '2020-10-16 05:11:32'),
(30, 9, 'Crocin', '1', 'Anand', 'Confirmed', '2020-10-16 05:11:32'),
(31, 9, 'Crocin', '15', 'Anand', 'Confirmed', '2020-10-16 06:49:05'),
(32, 9, 'Crocin', '1', 'Anand', 'Confirmed', '2020-10-16 06:49:05'),
(33, 9, 'Crocin', '1', 'Anand', 'Confirmed', '2020-10-16 06:49:05'),
(34, 9, 'Crocin', '1', 'Anand', 'Confirmed', '2020-10-16 06:49:05'),
(35, 9, 'Crocin', '1', 'Anand', 'Placed', '2020-10-22 17:25:10'),
(36, 9, 'Crocin', '1', 'Anand', 'Placed', '2020-10-23 05:38:33'),
(37, 9, 'Crocin', '1', 'Anand', 'Placed', '2020-11-05 13:17:04');

-- --------------------------------------------------------

--
-- Table structure for table `orders1`
--

CREATE TABLE `orders1` (
  `ID` int(11) NOT NULL,
  `PatId` int(11) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders1`
--

INSERT INTO `orders1` (`ID`, `PatId`, `CreationDate`) VALUES
(1, 9, '2020-10-15 13:39:30'),
(2, 9, '2020-10-15 13:43:06');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `ID` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `PharmId` int(11) NOT NULL,
  `MId` int(11) NOT NULL,
  `mqty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`ID`, `OrderId`, `PharmId`, `MId`, `mqty`) VALUES
(1, 1, 1, 0, 1),
(2, 2, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacists`
--

CREATE TABLE `pharmacists` (
  `id` int(11) NOT NULL,
  `pharmName` varchar(255) DEFAULT NULL,
  `pharmAddress` longtext DEFAULT NULL,
  `pharmContactno` bigint(11) DEFAULT NULL,
  `pharmEmail` varchar(255) DEFAULT NULL,
  `pharmPassword` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacists`
--

INSERT INTO `pharmacists` (`id`, `pharmName`, `pharmAddress`, `pharmContactno`, `pharmEmail`, `pharmPassword`, `creationDate`, `updationDate`) VALUES
(1, 'Anand', 'New Delhi', 8285703358, 'anand@pharm.com', 'f925916e2754e5e03f75dd58a5733251', '2020-10-09 00:55:37', '2020-10-16 05:41:00'),
(2, 'Anu', 'Chennai', 9876543251, 'anu@pharm.com', 'f925916e2754e5e03f75dd58a5733251', '2020-10-13 20:02:16', NULL),
(3, 'Ajay', 'Mumbai', 879654321, 'test', 'f925916e2754e5e03f75dd58a5733251\r\n', '2020-10-13 20:31:57', NULL),
(4, 'Shankar', 'Coimbatore', 8799654326, 'shankar@pharm.com', 'f925916e2754e5e03f75dd58a5733251', '2020-10-14 05:07:43', NULL),
(5, 'savitri', '2 anna nagar chennai', 9919722843, 'savitri23@hotmail.com', '9bd1084348db8fddc3c4431bdec6a45a', '2020-10-14 10:24:57', '2020-10-14 11:25:14'),
(6, 'fawad bhai', 'anna nagar', 9919722843, 'khan2@gmail.com', 'cc03e747a6afbbcbf8be7668acfebee5', '2020-10-22 06:59:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(11) NOT NULL,
  `patid` int(11) NOT NULL,
  `imageName` varchar(50) NOT NULL,
  `ocroutput` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `patid`, `imageName`, `ocroutput`) VALUES
(1, 9, '', ''),
(2, 9, '', ''),
(3, 6, '', ''),
(4, 6, '', ''),
(5, 9, '', ''),
(6, 4, '', ''),
(7, 9, '', ''),
(8, 9, 'Pres_9_8.jpeg', 'crocin'),
(9, 9, 'Pres_9_9.jpeg', 'crocin'),
(10, 9, 'Pres_9_10.jpeg', ''),
(11, 9, 'Pres_9_11.jpeg', ''),
(12, 9, 'Pres_9_12.jpeg', 'test'),
(13, 9, 'Pres_9_13.jpeg', 'testbottle'),
(14, 9, 'Pres_9_14.jpeg', ''),
(15, 9, 'Pres_9_15.jpeg', ''),
(16, 9, 'Pres_9_16.jpeg', 'test'),
(17, 9, 'Pres_9_17.jpeg', 'test'),
(18, 9, 'Pres_9_18.jpeg', 'test'),
(19, 9, 'Pres_9_19.jpeg', 'testCrocin'),
(20, 9, 'Pres_9_20.jpeg', 'testCrocin'),
(21, 9, 'Pres_9_21.jpeg', 'testCrocin'),
(22, 9, 'Pres_9_22.jpeg', 'Crocin'),
(23, 9, 'Pres_9_23.jpeg', 'Crocin'),
(24, 9, 'Pres_9_24.jpeg', 'Crocin'),
(25, 9, 'Pres_9_25.jpeg', 'Crocin'),
(26, 9, 'Pres_9_26.jpeg', 'Crocin'),
(27, 9, 'Pres_9_27.jpeg', 'Crocin'),
(28, 9, 'Pres_9_28.jpeg', 'Crocin'),
(29, 9, 'Pres_9_29.jpeg', 'Crocin'),
(30, 9, 'Pres_9_30.jpeg', 'Crocin'),
(31, 9, 'Pres_9_31.jpeg', 'Crocin'),
(32, 9, 'Pres_9_32.jpeg', 'Crocin'),
(33, 9, 'Pres_9_33.jpeg', 'Crocin'),
(34, 9, 'Pres_9_34.', ''),
(35, 9, 'Pres_9_35.jpeg', 'Crocin'),
(36, 9, 'Pres_9_36.jpeg', 'Crocin'),
(37, 9, 'Pres_9_37.', ''),
(38, 9, 'Pres_9_38.jpeg', 'Crocin'),
(39, 9, 'Pres_9_39.jpeg', 'Crocin'),
(40, 9, 'Pres_9_40.jpeg', 'Crocin'),
(41, 9, 'Pres_9_41.jpeg', 'Crocin'),
(42, 9, 'Pres_9_42.jpeg', 'Crocin'),
(43, 9, 'Pres_9_43.jpeg', 'Crocin'),
(44, 9, 'Pres_9_44.jpeg', 'Crocin'),
(45, 9, 'Pres_9_45.jpeg', 'Crocin'),
(46, 9, 'Pres_9_46.jpeg', 'Crocin'),
(47, 9, 'Pres_9_47.jpeg', 'Crocin'),
(48, 9, 'Pres_9_48.jpeg', 'Crocin'),
(49, 9, 'Pres_9_49.jpeg', ''),
(50, 9, 'Pres_9_50.jpeg', 'Crocin'),
(51, 9, 'Pres_9_51.jpeg', 'Crocin'),
(52, 9, 'Pres_9_52.jpeg', 'Crocin'),
(53, 9, 'Pres_9_53.jpeg', 'Crocin'),
(54, 9, 'Pres_9_54.jpeg', 'Crocin');

-- --------------------------------------------------------

--
-- Table structure for table `scandetails`
--

CREATE TABLE `scandetails` (
  `ID` int(11) NOT NULL,
  `DocName` varchar(50) NOT NULL,
  `Implication` varchar(100) NOT NULL,
  `Comments` varchar(100) NOT NULL DEFAULT 'nil',
  `Care` varchar(100) NOT NULL DEFAULT 'nil',
  `ScanID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scandetails`
--

INSERT INTO `scandetails` (`ID`, `DocName`, `Implication`, `Comments`, `Care`, `ScanID`) VALUES
(1, 'Anuj', 'Ra factor is high', 'Test needs to be repeated once in 3 months.', 'imflammation pills to be taken', 2),
(4, 'Anuj', 'Ra factor is high', '', 'take care', 2);

-- --------------------------------------------------------

--
-- Table structure for table `scans`
--

CREATE TABLE `scans` (
  `ID` int(11) NOT NULL,
  `PatID` int(11) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Reason` varchar(100) NOT NULL,
  `Filename` varchar(50) NOT NULL,
  `Creation_Time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scans`
--

INSERT INTO `scans` (`ID`, `PatID`, `Type`, `Reason`, `Filename`, `Creation_Time`) VALUES
(2, 9, 'BloodTest', 'RA factor test', '2.png', '2020-10-29 17:09:22'),
(4, 9, 'Scan', 'test2', '4.JPG', '2020-10-29 17:37:41');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactus`
--

CREATE TABLE `tblcontactus` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(12) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsRead` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactus`
--

INSERT INTO `tblcontactus` (`id`, `fullname`, `email`, `contactno`, `message`, `PostingDate`, `AdminRemark`, `LastupdationDate`, `IsRead`) VALUES
(1, 'test user', 'test@gmail.com', 2523523522523523, ' This is sample text for the test.', '2020-09-29 19:03:08', 'Test Admin Remark', '2020-09-30 12:55:23', 1),
(2, 'Anuj kumar', 'phpgurukulofficial@gmail.com', 1111111111111111, ' This is sample text for testing.  This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing. This is sample text for testing.', '2019-06-30 13:06:50', NULL, NULL, NULL),
(3, 'fdsfsdf', 'fsdfsd@ghashhgs.com', 3264826346, 'sample text   sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  sample text  ', '2019-11-10 18:53:48', 'vfdsfgfd', '2019-11-10 18:54:04', 1),
(4, 'fawad khan', 'khan@gmail.com', 8222285555, ' I am doctor. Please add.', '2020-10-22 06:55:27', 'doctor added', '2020-10-22 06:56:24', 1),
(5, 'Rajesh', 'raj@gmail.com', 9978667545, ' Please register me as a doctor.', '2020-11-05 13:59:34', 'Will register after proof.', '2020-11-05 14:01:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicalhistory`
--

CREATE TABLE `tblmedicalhistory` (
  `ID` int(10) NOT NULL,
  `PatientID` int(10) DEFAULT NULL,
  `BloodPressure` varchar(200) DEFAULT NULL,
  `BloodSugar` varchar(200) NOT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `Temperature` varchar(200) DEFAULT NULL,
  `MedicalPres` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblmedicalhistory`
--

INSERT INTO `tblmedicalhistory` (`ID`, `PatientID`, `BloodPressure`, `BloodSugar`, `Weight`, `Temperature`, `MedicalPres`, `CreationDate`) VALUES
(2, 3, '120/185', '80/120', '85 Kg', '101 degree', '#Fever, #BP high\r\n1.Paracetamol\r\n2.jocib tab\r\n', '2020-10-06 04:20:07'),
(3, 2, '90/120', '92/190', '86 kg', '99 deg', '#Sugar High\r\n1.Petz 30', '2019-11-06 04:31:24'),
(4, 1, '125/200', '86/120', '56 kg', '98 deg', '# blood pressure is high\r\n1.koil cipla', '2019-11-06 04:52:42'),
(5, 1, '96/120', '98/120', '57 kg', '102 deg', '#Viral\r\n1.gjgjh-1Ml\r\n2.kjhuiy-2M', '2019-11-06 04:56:55'),
(6, 4, '90/120', '120', '56', '98 F', '#blood sugar high\r\n#Asthma problem', '2019-11-06 14:38:33'),
(7, 5, '80/120', '120', '85', '98.6', 'Rx\r\n\r\nAbc tab\r\nxyz Syrup', '2019-11-10 18:50:23'),
(8, 1, '125/470', '22', '56', '94', 'Nil', '2020-10-15 16:59:33'),
(9, 7, '125/60', '22', '40', '97', 'Imol for pain management', '2020-10-16 05:28:39'),
(10, 7, '125/60', '22', '56', '99', 'nil', '2020-10-30 05:36:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblpatient`
--

CREATE TABLE `tblpatient` (
  `ID` int(10) NOT NULL,
  `Docid` int(10) DEFAULT NULL,
  `PatientName` varchar(200) DEFAULT NULL,
  `PatientContno` bigint(10) DEFAULT NULL,
  `PatientEmail` varchar(200) DEFAULT NULL,
  `PatientGender` varchar(50) DEFAULT NULL,
  `PatientAdd` mediumtext DEFAULT NULL,
  `PatientAge` int(10) DEFAULT NULL,
  `PatientMedhis` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpatient`
--

INSERT INTO `tblpatient` (`ID`, `Docid`, `PatientName`, `PatientContno`, `PatientEmail`, `PatientGender`, `PatientAdd`, `PatientAge`, `PatientMedhis`, `CreationDate`, `UpdationDate`) VALUES
(1, 1, 'Manisha Jha', 4558968789, 'test@gmail.com', 'Female', '\"\"J&K Block J-127, Laxmi Nagar New Delhi', 26, 'She is diabetic patient', '2019-11-04 21:38:06', '2019-11-06 06:48:05'),
(2, 5, 'Raghu Yadav', 9797977979, 'raghu@gmail.com', 'Male', 'ABC Apartment Mayur Vihar Ph-1 New Delhi', 39, 'No', '2019-11-05 10:40:13', '2019-11-05 11:53:45'),
(3, 7, 'Mansi', 9878978798, 'jk@gmail.com', 'Female', '\"fdghyj', 46, 'No', '2019-11-05 10:49:41', '2019-11-05 11:58:59'),
(4, 7, 'Manav Sharma', 9888988989, 'sharma@gmail.com', 'Male', 'L-56,Ashok Nagar New Delhi-110096', 45, 'He is long suffered by asthma', '2019-11-06 14:33:54', '2019-11-06 14:34:31'),
(5, 9, 'John', 1234567890, 'john@test.com', 'Male', 'Test ', 25, 'THis is sample text for testing.', '2019-11-10 18:49:24', '2020-10-09 14:17:23'),
(6, 2, 'Sarita Pandey', 987643211, 'test1@gmail.com', 'female', 'test', 12, 'Fever', '2020-10-09 14:20:14', NULL),
(7, 1, 'Saviksha', 12345654, 'sav@gmail.com', 'female', '32, anna nagar, chennai', 20, 'Braces put and removed.', '2020-10-16 05:27:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(24, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-09 14:00:58', '09-10-2020 07:34:27 PM', 1),
(25, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-09 14:09:33', '09-10-2020 07:41:07 PM', 1),
(26, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-09 14:17:53', NULL, 1),
(27, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-13 07:47:06', NULL, 1),
(28, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-13 20:14:48', NULL, 1),
(29, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-13 20:43:07', '14-10-2020 02:13:31 AM', 1),
(30, 7, 'john@test.com', 0x3a3a3100000000000000000000000000, '2020-10-13 20:50:10', NULL, 1),
(31, 1, 'anand@pharm.com', 0x3a3a3100000000000000000000000000, '2020-10-13 20:54:09', '14-10-2020 02:25:57 AM', 1),
(32, NULL, 'anand@pharm.com', 0x3a3a3100000000000000000000000000, '2020-10-13 20:56:08', NULL, 0),
(33, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-13 20:56:17', '14-10-2020 02:26:20 AM', 1),
(34, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 04:27:23', '14-10-2020 09:57:52 AM', 1),
(35, 2, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 04:43:09', '14-10-2020 10:15:24 AM', 1),
(36, NULL, 'sav', 0x3a3a3100000000000000000000000000, '2020-10-14 10:18:17', NULL, 0),
(37, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 10:19:38', '14-10-2020 03:50:36 PM', 1),
(38, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 10:49:27', '14-10-2020 04:21:55 PM', 1),
(39, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 13:46:49', '14-10-2020 07:31:24 PM', 1),
(40, NULL, 'abhishek@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 14:37:37', NULL, 0),
(41, NULL, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 14:44:26', NULL, 0),
(42, NULL, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 20:25:13', NULL, 0),
(43, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-14 20:25:20', NULL, 1),
(44, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-15 05:18:51', '15-10-2020 11:58:51 AM', 1),
(45, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-15 07:56:18', '15-10-2020 01:37:40 PM', 1),
(46, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-15 08:07:48', '15-10-2020 04:22:54 PM', 1),
(47, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-15 10:53:05', '15-10-2020 06:47:58 PM', 1),
(48, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-15 13:18:07', '15-10-2020 06:49:04 PM', 1),
(49, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-15 13:19:17', '15-10-2020 08:05:04 PM', 1),
(50, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-15 14:45:56', '15-10-2020 08:18:28 PM', 1),
(51, NULL, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-15 16:53:50', NULL, 0),
(52, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-15 16:53:58', '15-10-2020 10:27:23 PM', 1),
(53, NULL, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-16 05:21:33', NULL, 0),
(54, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-16 05:21:45', '16-10-2020 10:51:57 AM', 1),
(55, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-16 05:28:57', '16-10-2020 10:59:41 AM', 1),
(56, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-16 05:46:25', '16-10-2020 11:21:26 AM', 1),
(57, NULL, 'abhishek23@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-16 05:58:22', NULL, 0),
(58, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-16 06:48:11', '16-10-2020 12:18:49 PM', 1),
(59, NULL, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-22 16:39:10', NULL, 0),
(60, NULL, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-22 16:39:20', NULL, 0),
(61, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-22 16:40:43', '22-10-2020 10:30:47 PM', 1),
(62, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-22 17:24:30', '22-10-2020 10:55:17 PM', 1),
(63, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-23 05:11:17', '23-10-2020 10:41:20 AM', 1),
(64, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-23 05:36:22', NULL, 1),
(65, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-29 16:17:12', NULL, 1),
(66, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-29 18:56:34', '30-10-2020 12:30:15 AM', 1),
(67, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-29 19:20:55', '30-10-2020 12:53:31 AM', 1),
(68, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-10-30 05:50:22', '30-10-2020 11:26:54 AM', 1),
(69, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-11-02 12:30:11', '02-11-2020 07:12:07 PM', 1),
(70, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-11-02 13:44:41', '02-11-2020 07:15:26 PM', 1),
(71, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-11-05 12:45:55', '05-11-2020 06:15:58 PM', 1),
(72, 9, 'sav@gmail.com', 0x3a3a3100000000000000000000000000, '2020-11-05 13:12:54', '05-11-2020 07:15:56 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `address`, `city`, `gender`, `email`, `password`, `regDate`, `updationDate`) VALUES
(2, 'Sarita pandey', 'New Delhi India', 'Delhi', 'female', 'test@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2020-09-30 05:34:39', '2020-10-16 05:40:12'),
(3, 'Amit', 'New Delhi', 'New delhi', 'male', 'amit@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2020-09-07 06:36:53', '2020-10-16 05:40:22'),
(4, 'Rahul Singh', 'New Delhi', 'New delhi', 'male', 'rahul@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2020-10-07 07:41:14', '2020-10-16 05:40:35'),
(5, 'Amit kumar', 'New Delhi India', 'Delhi', 'male', 'amit12@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2020-09-07 08:00:26', '2020-10-16 05:40:02'),
(6, 'Test user', 'New Delhi', 'Delhi', 'male', 'tetuser@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2020-09-23 18:24:53', '2020-09-23 18:36:09'),
(7, 'John', 'USA', 'Newyork', 'male', 'john@test.com', 'f925916e2754e5e03f75dd58a5733251', '2020-09-10 18:40:21', '2020-09-10 18:40:51'),
(9, 'sav', '74 bbc', 'chennai', 'male', 'sav@gmail.com', '5f9102fdc435334ad00ad0237364ac5a', '2020-10-14 10:19:20', '2020-10-15 16:53:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorslog`
--
ALTER TABLE `doctorslog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `orders1`
--
ALTER TABLE `orders1`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pharmacists`
--
ALTER TABLE `pharmacists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `id_2` (`id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scandetails`
--
ALTER TABLE `scandetails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `scans`
--
ALTER TABLE `scans`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpatient`
--
ALTER TABLE `tblpatient`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doctorslog`
--
ALTER TABLE `doctorslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `orders1`
--
ALTER TABLE `orders1`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pharmacists`
--
ALTER TABLE `pharmacists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `scandetails`
--
ALTER TABLE `scandetails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `scans`
--
ALTER TABLE `scans`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblpatient`
--
ALTER TABLE `tblpatient`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
