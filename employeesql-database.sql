-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: employee_sys
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attandance`
--

DROP TABLE IF EXISTS `attandance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attandance` (
  `attandance_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int DEFAULT NULL,
  `date_att` date DEFAULT NULL,
  `stat` enum('present','absent','leave') DEFAULT NULL,
  PRIMARY KEY (`attandance_id`),
  KEY `attandance_ibfk_1` (`emp_id`),
  CONSTRAINT `attandance_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attandance`
--

LOCK TABLES `attandance` WRITE;
/*!40000 ALTER TABLE `attandance` DISABLE KEYS */;
INSERT INTO `attandance` VALUES (1,2,'2025-12-08','present'),(2,2,'2025-12-08','absent'),(3,2,'2025-12-08','absent'),(4,2,'2025-12-08','absent'),(5,2,'2025-12-09','absent'),(6,2,'2025-12-09','absent'),(7,2,'2025-12-09','absent'),(8,2,'2025-12-09','absent'),(9,2,'2025-12-10','absent'),(10,2,'2025-12-10','absent'),(11,2,'2025-12-10','absent'),(12,3,'2025-12-10','absent');
/*!40000 ALTER TABLE `attandance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'IT'),(2,'HR'),(3,'Finance');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(108) NOT NULL,
  `department_id` int DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `base_salary` double NOT NULL,
  `join_date` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `emp_pass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `email` (`email`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (2,'Ramesh',2,'HR Manager',40000,'2023-09-10','ramesh@gmail.com','8888888888','test123'),(3,'Mahesh',3,'Accountant',35000,'2023-06-10','mahesh@gmail.com','7777777777','test123'),(4,'ram',1,'clerk',65000,'2025-12-08','ram@gmail.com','9887766554','ram123'),(5,'suresh',2,'manager',40000,'2025-12-10','suresh@gmail.com','9966855825','test123');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_admin`
--

DROP TABLE IF EXISTS `hr_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hr_admin` (
  `hr_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`hr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_admin`
--

LOCK TABLES `hr_admin` WRITE;
/*!40000 ALTER TABLE `hr_admin` DISABLE KEYS */;
INSERT INTO `hr_admin` VALUES (1,'admin','admin123');
/*!40000 ALTER TABLE `hr_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_management`
--

DROP TABLE IF EXISTS `leave_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_management` (
  `leave_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `stat` enum('pending','approved','rejected') DEFAULT 'pending',
  PRIMARY KEY (`leave_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `leave_management_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_management`
--

LOCK TABLES `leave_management` WRITE;
/*!40000 ALTER TABLE `leave_management` DISABLE KEYS */;
INSERT INTO `leave_management` VALUES (1,2,'2025-12-15','2025-12-17','fummy','rejected'),(2,2,'2025-12-11','2025-12-15','work','rejected'),(3,2,'2025-12-11','2025-12-15','personal','rejected'),(4,2,'2025-12-11','2025-12-15','personal','approved'),(5,2,'2025-12-20','2025-12-24','rocking','rejected'),(6,3,'2025-12-10','2025-12-15','personal work','approved');
/*!40000 ALTER TABLE `leave_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll` (
  `payroll_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int DEFAULT NULL,
  `month_nam` varchar(20) DEFAULT NULL,
  `basic` double DEFAULT NULL,
  `hra` double DEFAULT NULL,
  `deductions` double DEFAULT NULL,
  `net_salary` double DEFAULT NULL,
  `generated_on` date DEFAULT NULL,
  PRIMARY KEY (`payroll_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (1,2,'december',40000,4000,4000,40000,'2025-12-09'),(2,3,'december',35000,3500,0,38500,'2025-12-09'),(3,4,'december',65000,6500,0,71500,'2025-12-09'),(4,4,'december',65000,6500,0,71500,'2025-12-10'),(5,2,'december',40000,4000,13333.333333333332,30666.666666666668,'2025-12-10'),(6,5,'december',40000,4000,0,44000,'2025-12-10'),(7,3,'december',35000,3500,1166.6666666666667,37333.333333333336,'2025-12-10');
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-10 16:21:43
