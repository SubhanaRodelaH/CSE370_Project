-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2025 at 10:35 PM
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
-- Database: `floodguard_network`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Report_No` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `Name`, `Report_No`) VALUES
(1, 'Subhana Rodela Hridi', 101),
(2, 'Farjana Sikder Tisha', 102),
(3, 'Irtiza Tasnimah', 103);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `Admin_id` int(11) NOT NULL,
  `Volunteer_id` int(11) NOT NULL,
  `Message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `distribution`
--

CREATE TABLE `distribution` (
  `V_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `distribution`
--

INSERT INTO `distribution` (`V_id`) VALUES
(101),
(102),
(103);

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `Donation_id` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Donation_type` varchar(100) DEFAULT NULL,
  `Relief_id` int(11) DEFAULT NULL,
  `Donor_id` int(11) DEFAULT NULL,
  `Reciept_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`Donation_id`, `Quantity`, `Date`, `Donation_type`, `Relief_id`, `Donor_id`, `Reciept_no`) VALUES
(301, 100, '2023-08-01', 'Rice', 201, 501, 10001),
(302, 50, '2023-08-02', 'Blankets', 202, 502, 10002),
(303, 200, '2023-08-03', 'Water', 203, 503, 10003);

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Phone_No` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`ID`, `Name`, `Phone_No`) VALUES
(501, 'Brac Organization', '029871234'),
(502, 'Grameen Foundation', '029875678'),
(503, 'Local Business Group', '029879012');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `Location_id` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Severity` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`Location_id`, `Name`, `Severity`) VALUES
(1, 'Sylhet', 'High'),
(2, 'Bhola', 'Extreme'),
(3, 'Sunamganj', 'Critical');

-- --------------------------------------------------------

--
-- Table structure for table `relief`
--

CREATE TABLE `relief` (
  `Relief_ID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Expiry_Date` varchar(100) DEFAULT NULL,
  `Relief_type` varchar(100) DEFAULT NULL,
  `Location_id` int(11) DEFAULT NULL,
  `D_volunteer_id` int(11) DEFAULT NULL,
  `Victim_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `relief`
--

INSERT INTO `relief` (`Relief_ID`, `Quantity`, `Expiry_Date`, `Relief_type`, `Location_id`, `D_volunteer_id`, `Victim_id`) VALUES
(201, 150, '2023-12-31', 'Dry Food', 1, 101, 1001),
(202, 80, '2024-06-30', 'Medical Kit', 2, 102, 1002),
(203, 200, '2023-11-15', 'Cloths', 3, 103, 1003);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `Report_no` int(11) NOT NULL,
  `Report_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`Report_no`, `Report_type`) VALUES
(101, 'Flood Damage Assessment'),
(102, 'Relief Distribution'),
(103, 'Volunteer Activities');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `Skills` varchar(100) NOT NULL,
  `Volunteer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`Skills`, `Volunteer_ID`) VALUES
('Boat Operation', 102),
('Crisis Counseling', 103),
('First Aid', 101);

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `V_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transfer`
--

INSERT INTO `transfer` (`V_id`) VALUES
(101),
(102),
(103);

-- --------------------------------------------------------

--
-- Table structure for table `victims`
--

CREATE TABLE `victims` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Needs` varchar(255) DEFAULT NULL,
  `Phone_No` varchar(20) DEFAULT NULL,
  `Victim_number` int(11) DEFAULT NULL,
  `Victim_type` varchar(20) DEFAULT NULL,
  `Location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `victims`
--

INSERT INTO `victims` (`ID`, `Name`, `Needs`, `Phone_No`, `Victim_number`, `Victim_type`, `Location_id`) VALUES
(1001, 'Rahim Miah', 'Food, Water', '01755667788', 5, 'Representative', 1),
(1002, 'Ayesha Akter', 'Shelter, Medicine', '01899887766', 3, 'Individual', 2),
(1003, 'Jamal Uddin', 'Clothing, Blankets', '01944332211', 7, 'Representative', 3);

-- --------------------------------------------------------

--
-- Table structure for table `volunteers`
--

CREATE TABLE `volunteers` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Phone_No` varchar(20) DEFAULT NULL,
  `Availability` varchar(20) DEFAULT NULL,
  `Location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volunteers`
--

INSERT INTO `volunteers` (`ID`, `Name`, `Phone_No`, `Availability`, `Location_id`) VALUES
(101, 'Shahin Alam', '01712345678', 'NO', 1),
(102, 'Nusrat Jahan', '01876543210', 'YES', 2),
(103, 'Kamal Hossain', '01911223344', 'YES', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Report_No` (`Report_No`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`Admin_id`,`Volunteer_id`);

--
-- Indexes for table `distribution`
--
ALTER TABLE `distribution`
  ADD PRIMARY KEY (`V_id`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`Donation_id`),
  ADD KEY `Donor_id` (`Donor_id`),
  ADD KEY `Relief_id` (`Relief_id`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Location_id`);

--
-- Indexes for table `relief`
--
ALTER TABLE `relief`
  ADD PRIMARY KEY (`Relief_ID`),
  ADD KEY `Location_id` (`Location_id`),
  ADD KEY `D_volunteer_id` (`D_volunteer_id`),
  ADD KEY `Victim_id` (`Victim_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`Report_no`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`Skills`,`Volunteer_ID`),
  ADD KEY `Volunteer_ID` (`Volunteer_ID`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`V_id`);

--
-- Indexes for table `victims`
--
ALTER TABLE `victims`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Location_id` (`Location_id`);

--
-- Indexes for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Location_id` (`Location_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`Report_No`) REFERENCES `report` (`Report_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `distribution`
--
ALTER TABLE `distribution`
  ADD CONSTRAINT `distribution_ibfk_1` FOREIGN KEY (`V_id`) REFERENCES `volunteers` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`Donor_id`) REFERENCES `donor` (`ID`),
  ADD CONSTRAINT `donation_ibfk_2` FOREIGN KEY (`Relief_id`) REFERENCES `relief` (`Relief_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relief`
--
ALTER TABLE `relief`
  ADD CONSTRAINT `relief_ibfk_1` FOREIGN KEY (`Location_id`) REFERENCES `location` (`Location_id`),
  ADD CONSTRAINT `relief_ibfk_2` FOREIGN KEY (`D_volunteer_id`) REFERENCES `distribution` (`V_id`),
  ADD CONSTRAINT `relief_ibfk_3` FOREIGN KEY (`Victim_id`) REFERENCES `victims` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`Volunteer_ID`) REFERENCES `volunteers` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`V_id`) REFERENCES `volunteers` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `victims`
--
ALTER TABLE `victims`
  ADD CONSTRAINT `victims_ibfk_1` FOREIGN KEY (`Location_id`) REFERENCES `location` (`Location_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD CONSTRAINT `volunteers_ibfk_1` FOREIGN KEY (`Location_id`) REFERENCES `location` (`Location_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
