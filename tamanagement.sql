-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2021 at 08:22 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tamanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `compensation`
--

CREATE TABLE `compensation` (
  `com_id` int(11) NOT NULL,
  `work_id` int(11) NOT NULL,
  `com_status` int(11) NOT NULL COMMENT '0=waiting, 1=approve'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `major_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `major_id` int(7) NOT NULL,
  `major_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `matching_course`
--

CREATE TABLE `matching_course` (
  `m_course_id` int(11) NOT NULL,
  `sem_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `section` int(4) NOT NULL,
  `t_date` varchar(10) NOT NULL,
  `t_time` varchar(12) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Only lecturerID',
  `rate_com` int(11) NOT NULL COMMENT 'stuTH=90, stuENG=120, ExTH=200, ExENG=300, Special=450',
  `hr_per_week` int(11) NOT NULL,
  `m_ststus` int(11) NOT NULL COMMENT '0=close, 1=open'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `matching_ta`
--

CREATE TABLE `matching_ta` (
  `m_ta_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `register_id` int(11) NOT NULL,
  `m_ta_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `register_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `m_course_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `sem_id` int(5) NOT NULL,
  `sem_number` int(1) NOT NULL COMMENT '1 = sem 1 or 2 = sem 2',
  `year` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ta_request`
--

CREATE TABLE `ta_request` (
  `request_id` int(11) NOT NULL,
  `m_course_id` int(11) NOT NULL,
  `stu_num` int(11) NOT NULL,
  `ex_num` int(11) NOT NULL,
  `request_note` varchar(200) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `user_id` int(4) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `l_name` varchar(30) NOT NULL,
  `student_id` int(15) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `cmu_mail` varchar(20) DEFAULT NULL,
  `line_id` varchar(20) DEFAULT NULL,
  `facebook_link` varchar(100) DEFAULT NULL,
  `tel` varchar(12) DEFAULT NULL,
  `portfolio_link` varchar(100) DEFAULT NULL,
  `user_type` varchar(20) NOT NULL COMMENT '1=admin, 2=student, 3=external, 4=lecturer',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `worktime_tbl`
--

CREATE TABLE `worktime_tbl` (
  `work_id` int(11) NOT NULL,
  `register_id` int(11) NOT NULL COMMENT 'Only r_status=2 admin approve',
  `work_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `total_worktime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compensation`
--
ALTER TABLE `compensation`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `work_id` (`work_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `major_id` (`major_id`);

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`major_id`);

--
-- Indexes for table `matching_course`
--
ALTER TABLE `matching_course`
  ADD PRIMARY KEY (`m_course_id`),
  ADD KEY `sem_id` (`sem_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `matching_ta`
--
ALTER TABLE `matching_ta`
  ADD PRIMARY KEY (`m_ta_id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `register_id` (`register_id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`register_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`sem_id`);

--
-- Indexes for table `ta_request`
--
ALTER TABLE `ta_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `m_course_id` (`m_course_id`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `worktime_tbl`
--
ALTER TABLE `worktime_tbl`
  ADD PRIMARY KEY (`work_id`),
  ADD KEY `register_id` (`register_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compensation`
--
ALTER TABLE `compensation`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `major`
--
ALTER TABLE `major`
  MODIFY `major_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matching_course`
--
ALTER TABLE `matching_course`
  MODIFY `m_course_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matching_ta`
--
ALTER TABLE `matching_ta`
  MODIFY `m_ta_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `register_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `sem_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ta_request`
--
ALTER TABLE `ta_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_tbl`
--
ALTER TABLE `user_tbl`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worktime_tbl`
--
ALTER TABLE `worktime_tbl`
  MODIFY `work_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compensation`
--
ALTER TABLE `compensation`
  ADD CONSTRAINT `compensation_ibfk_1` FOREIGN KEY (`work_id`) REFERENCES `worktime_tbl` (`work_id`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`);

--
-- Constraints for table `matching_course`
--
ALTER TABLE `matching_course`
  ADD CONSTRAINT `matching_course_ibfk_1` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`sem_id`),
  ADD CONSTRAINT `matching_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `matching_course_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`user_id`);

--
-- Constraints for table `matching_ta`
--
ALTER TABLE `matching_ta`
  ADD CONSTRAINT `matching_ta_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `ta_request` (`request_id`),
  ADD CONSTRAINT `matching_ta_ibfk_2` FOREIGN KEY (`register_id`) REFERENCES `register` (`register_id`);

--
-- Constraints for table `register`
--
ALTER TABLE `register`
  ADD CONSTRAINT `register_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`user_id`);

--
-- Constraints for table `ta_request`
--
ALTER TABLE `ta_request`
  ADD CONSTRAINT `ta_request_ibfk_1` FOREIGN KEY (`m_course_id`) REFERENCES `matching_course` (`m_course_id`);

--
-- Constraints for table `worktime_tbl`
--
ALTER TABLE `worktime_tbl`
  ADD CONSTRAINT `worktime_tbl_ibfk_1` FOREIGN KEY (`register_id`) REFERENCES `register` (`register_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
