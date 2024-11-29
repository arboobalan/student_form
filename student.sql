-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.31 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table student.student_data
DROP TABLE IF EXISTS `student_data`;
CREATE TABLE IF NOT EXISTS `student_data` (
  `stud_id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `stu_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `district` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mobile` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT '0',
  `updated_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stud_id`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student.student_data: 0 rows
/*!40000 ALTER TABLE `student_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_data` ENABLE KEYS */;

-- Dumping structure for table student.stu_district
DROP TABLE IF EXISTS `stu_district`;
CREATE TABLE IF NOT EXISTS `stu_district` (
  `district_id` smallint unsigned NOT NULL,
  `district_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`district_id`) USING BTREE,
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table student.stu_district: ~38 rows (approximately)
INSERT INTO `stu_district` (`district_id`, `district_name`, `created_by`, `created_on`, `updated_by`, `updated_on`, `is_deleted`) VALUES
	(602, 'THIRUVALLUR', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(603, 'CHENNAI', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(604, 'KANCHIPURAM', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(605, 'VELLORE', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(606, 'TIRUVANNAMALAI', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(607, 'VILLUPURAM', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(608, 'SALEM', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(609, 'NAMAKKAL', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(610, 'ERODE', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(611, 'THE NILGIRIS', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(612, 'DINDIGUL', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(613, 'KARUR', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(614, 'TIRUCHIRAPPALLI', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(615, 'PERAMBALUR', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(616, 'ARIYALUR', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(617, 'CUDDALORE', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(618, 'NAGAPATTINAM', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(619, 'THIRUVARUR', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(620, 'THANJAVUR', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(621, 'PUDUKKOTTAI', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(622, 'SIVAGANGA', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(623, 'MADURAI', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(624, 'THENI', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(625, 'VIRUDHUNAGAR', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(626, 'RAMANATHAPURAM', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(627, 'TUTICORIN', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(628, 'TIRUNELVELI', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(629, 'KANNIYAKUMARI', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(630, 'DHARMAPURI', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(631, 'KRISHNAGIRI', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(632, 'COIMBATORE', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(633, 'TIRUPPUR', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(2087, 'KALLAKURICHI', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(2090, 'CHENGALPATTU', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(2092, 'RANIPET', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(2093, 'TENKASI', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(2094, 'TIRUPATHUR', 0, '2022-12-30 10:03:58', NULL, NULL, 0),
	(2101, 'MAYILADUTHURAI', 0, '2022-12-30 10:03:58', NULL, NULL, 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
