-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for tasys
CREATE DATABASE IF NOT EXISTS `tasys` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tasys`;

-- Dumping structure for table tasys.compensation
CREATE TABLE IF NOT EXISTS `compensation` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_id` int(11) NOT NULL,
  `com_status` int(11) NOT NULL COMMENT '0=waiting, 1=approve',
  PRIMARY KEY (`com_id`),
  KEY `work_id` (`work_id`),
  CONSTRAINT `compensation_ibfk_1` FOREIGN KEY (`work_id`) REFERENCES `worktime_tbl` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tasys.compensation: ~0 rows (approximately)
/*!40000 ALTER TABLE `compensation` DISABLE KEYS */;
/*!40000 ALTER TABLE `compensation` ENABLE KEYS */;

-- Dumping structure for table tasys.course
CREATE TABLE IF NOT EXISTS `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `major_id` int(11) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`course_id`),
  KEY `major_id` (`major_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tasys.course: ~19 rows (approximately)
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`course_id`, `course_name`, `major_id`, `deleted`) VALUES
	(1, '2', 1, 1),
	(4, '4', 1, 1),
	(5, '5', 1, 1),
	(7, '7', 1, 1),
	(44, '44', 2, 1),
	(45, '45', 1, 1),
	(55, '55', 1, 1),
	(68, '444', 1, 1),
	(4444, '4', 1, 1),
	(5555, 't', 1, 1),
	(10111, '111', 1, 1),
	(954141, 'WEBPRO', 1, 0),
	(954142, 'COMPRO', 1, 1),
	(954144, 'TEST', 1, 0),
	(3213213, '2312312', 1, 1),
	(5435435, '5325325', 1, 1),
	(6346436, '432536346546', 1, 1),
	(54654654, '436436', 1, 1),
	(63464363, '3253634634', 1, 1);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;

-- Dumping structure for table tasys.day_work
CREATE TABLE IF NOT EXISTS `day_work` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `day` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table tasys.day_work: ~3 rows (approximately)
/*!40000 ALTER TABLE `day_work` DISABLE KEYS */;
INSERT INTO `day_work` (`id`, `day`) VALUES
	(1, 'M-TH'),
	(2, 'Tu-Fr'),
	(3, 'Wed');
/*!40000 ALTER TABLE `day_work` ENABLE KEYS */;

-- Dumping structure for table tasys.major
CREATE TABLE IF NOT EXISTS `major` (
  `major_id` int(7) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(100) NOT NULL,
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table tasys.major: ~2 rows (approximately)
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` (`major_id`, `major_name`) VALUES
	(1, 'DG'),
	(2, 'SE');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;

-- Dumping structure for table tasys.matching_course
CREATE TABLE IF NOT EXISTS `matching_course` (
  `m_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `sem_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `section` int(4) NOT NULL,
  `t_date` varchar(10) NOT NULL,
  `t_time` varchar(12) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Only lecturerID',
  `language` varchar(25) NOT NULL DEFAULT '' COMMENT 'stuTH=90, stuENG=120, ExTH=200, ExENG=300, Special=450',
  `hr_per_week` int(11) NOT NULL,
  `m_status` int(11) NOT NULL COMMENT '0=close, 1=open',
  `deleted` int(11) DEFAULT NULL COMMENT '0=non deleted , 1=deleted',
  PRIMARY KEY (`m_course_id`),
  KEY `sem_id` (`sem_id`),
  KEY `course_id` (`course_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `matching_course_ibfk_1` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`sem_id`),
  CONSTRAINT `matching_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `matching_course_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table tasys.matching_course: ~15 rows (approximately)
/*!40000 ALTER TABLE `matching_course` DISABLE KEYS */;
INSERT INTO `matching_course` (`m_course_id`, `sem_id`, `course_id`, `section`, `t_date`, `t_time`, `user_id`, `language`, `hr_per_week`, `m_status`, `deleted`) VALUES
	(5, 1, 5, 4, '1', '', 2, 'TH', 4, 1, 1),
	(6, 1, 5, 0, '1', '4', 2, 'TH', 4, 1, 1),
	(7, 1, 5, 4, '1', '44', 2, 'TH', 4, 1, 1),
	(8, 1, 5, 4, '1', '4', 2, 'TH', 4, 1, 1),
	(10, 1, 5, 4, '1', '15.00-17.00', 2, 'TH', 4, 1, 0),
	(14, 1, 954141, 4, '2', '15.00-17.00', 2, 'ENG', 4, 1, 0),
	(15, 1, 954141, 4, '1', '15.00-17.00', 2, 'TH', 4, 0, 0),
	(16, 1, 954141, 4, '1', '15.00-19.00', 2, 'TH', 4, 0, 0),
	(17, 1, 954141, 4, '1', '14.00-18.00', 2, 'TH', 4, 0, 0),
	(19, 1, 954141, 4, '2', '15.00-17.00', 2, 'TH', 4, 1, 0),
	(20, 1, 954141, 4, '2', '15.00-17.00', 2, 'TH', 4, 1, 0),
	(21, 1, 954141, 4, '2', '15.00-17.00', 2, 'TH', 4, 1, 0),
	(22, 1, 954141, 4, '2', '15.00-17.00', 2, 'TH', 4, 1, 0),
	(23, 1, 954142, 4, '2', '15.00-17.00', 2, 'TH', 4, 1, 0),
	(24, 1, 954141, 421421421, '1', '', 2, 'TH', 4214, 0, 0);
/*!40000 ALTER TABLE `matching_course` ENABLE KEYS */;

-- Dumping structure for table tasys.matching_ta
CREATE TABLE IF NOT EXISTS `matching_ta` (
  `m_ta_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `register_id` int(11) NOT NULL,
  `m_ta_status` int(11) NOT NULL,
  PRIMARY KEY (`m_ta_id`),
  KEY `request_id` (`request_id`),
  KEY `register_id` (`register_id`),
  CONSTRAINT `matching_ta_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `ta_request` (`request_id`),
  CONSTRAINT `matching_ta_ibfk_2` FOREIGN KEY (`register_id`) REFERENCES `register` (`register_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tasys.matching_ta: ~0 rows (approximately)
/*!40000 ALTER TABLE `matching_ta` DISABLE KEYS */;
/*!40000 ALTER TABLE `matching_ta` ENABLE KEYS */;

-- Dumping structure for table tasys.register
CREATE TABLE IF NOT EXISTS `register` (
  `register_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `m_course_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `r_status` tinyint(1) NOT NULL COMMENT '0=unsgined,1=signed,2=approved',
  PRIMARY KEY (`register_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `register_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table tasys.register: ~9 rows (approximately)
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` (`register_id`, `user_id`, `m_course_id`, `timestamp`, `r_status`) VALUES
	(1, 3, 8, '2021-03-13 01:04:16', 0),
	(2, 3, 10, '2021-03-13 01:04:48', 2),
	(3, 3, 15, '2021-03-13 01:32:25', 2),
	(4, 3, 16, '2021-03-13 01:33:11', 2),
	(5, 3, 15, '2021-03-13 02:02:23', 2),
	(6, 3, 15, '2021-03-13 02:03:03', 2),
	(7, 3, 15, '2021-03-13 02:03:05', 2),
	(8, 3, 17, '2021-03-14 03:17:49', 2),
	(9, 3, 24, '2021-03-14 03:42:55', 2);
/*!40000 ALTER TABLE `register` ENABLE KEYS */;

-- Dumping structure for table tasys.semester
CREATE TABLE IF NOT EXISTS `semester` (
  `sem_id` int(5) NOT NULL AUTO_INCREMENT,
  `sem_number` int(1) NOT NULL COMMENT '1 = sem 1 or 2 = sem 2',
  `year` int(5) NOT NULL,
  PRIMARY KEY (`sem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table tasys.semester: ~2 rows (approximately)
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` (`sem_id`, `sem_number`, `year`) VALUES
	(1, 1, 2563),
	(2, 2, 2563);
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;

-- Dumping structure for table tasys.ta_request
CREATE TABLE IF NOT EXISTS `ta_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_course_id` int(11) NOT NULL,
  `stu_num` int(11) NOT NULL,
  `ex_num` int(11) NOT NULL,
  `request_note` varchar(200) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `requested_by` int(11) DEFAULT NULL,
  `approved` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`request_id`),
  KEY `m_course_id` (`m_course_id`),
  CONSTRAINT `ta_request_ibfk_1` FOREIGN KEY (`m_course_id`) REFERENCES `matching_course` (`m_course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Dumping data for table tasys.ta_request: ~7 rows (approximately)
/*!40000 ALTER TABLE `ta_request` DISABLE KEYS */;
INSERT INTO `ta_request` (`request_id`, `m_course_id`, `stu_num`, `ex_num`, `request_note`, `timestamp`, `requested_by`, `approved`) VALUES
	(1, 8, 4, 4, 'test', '0000-00-00 00:00:00', 2, 1),
	(2, 8, 4, 4, '4', '2021-02-15 13:42:10', 2, 1),
	(3, 10, 4, 4, 'ขอ', '2021-02-17 19:01:01', 2, 1),
	(20, 15, 0, 0, 'test', '2021-03-12 16:52:53', 2, 1),
	(21, 16, 4, 0, 'ขอหน่อยนะค้าบบบบ', '2021-03-12 20:47:00', 2, 1),
	(22, 17, 4, 4, '444', '2021-03-14 03:16:48', 2, 1),
	(23, 24, 3, 3, '3', '2021-03-14 03:42:23', 2, 1);
/*!40000 ALTER TABLE `ta_request` ENABLE KEYS */;

-- Dumping structure for table tasys.user_tbl
CREATE TABLE IF NOT EXISTS `user_tbl` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT,
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
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table tasys.user_tbl: ~3 rows (approximately)
/*!40000 ALTER TABLE `user_tbl` DISABLE KEYS */;
INSERT INTO `user_tbl` (`user_id`, `username`, `password`, `f_name`, `l_name`, `student_id`, `major`, `cmu_mail`, `line_id`, `facebook_link`, `tel`, `portfolio_link`, `user_type`, `timestamp`) VALUES
	(1, 'TEST', 'TEST', 'TEST', 'TEST', 612110192, 'CAMT', 'test@cmu.ac.th', NULL, NULL, '0929649152', 'test.com', '1', '2021-01-12 22:42:58'),
	(2, 'teacher', 'test', 'Varin', 'Ankinandana', 123456789, 'CAMT', 'test@cmu.ac.th', NULL, NULL, '123456789', 'test', '2', '2021-02-10 16:40:07'),
	(3, 'student', 'test', 't', 't', 45678910, 'CAMT', 'reqw@cmu.ac.th', NULL, NULL, '123456789', 'lol.com', '3', '2021-02-17 18:57:14');
/*!40000 ALTER TABLE `user_tbl` ENABLE KEYS */;

-- Dumping structure for table tasys.worktime_tbl
CREATE TABLE IF NOT EXISTS `worktime_tbl` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT,
  `register_id` int(11) NOT NULL COMMENT 'Only r_status=2 admin approve',
  `work_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `total_worktime` int(11) NOT NULL,
  PRIMARY KEY (`work_id`),
  KEY `register_id` (`register_id`),
  CONSTRAINT `worktime_tbl_ibfk_1` FOREIGN KEY (`register_id`) REFERENCES `register` (`register_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tasys.worktime_tbl: ~0 rows (approximately)
/*!40000 ALTER TABLE `worktime_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `worktime_tbl` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
