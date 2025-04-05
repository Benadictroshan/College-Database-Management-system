CREATE DATABASE  IF NOT EXISTS `collegedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `collegedb`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: collegedb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `classrooms`
--

DROP TABLE IF EXISTS `classrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classrooms` (
  `classroom_id` int NOT NULL AUTO_INCREMENT,
  `room_number` varchar(20) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`classroom_id`),
  UNIQUE KEY `room_number` (`room_number`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms`
--

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
INSERT INTO `classrooms` VALUES (1,'C101',40),(2,'C102',35),(3,'C103',50),(4,'C104',45),(5,'C105',30),(6,'C106',60),(7,'C107',40),(8,'C108',55),(9,'C109',50),(10,'C110',35),(11,'C111',45),(12,'C112',60),(13,'C113',30),(14,'C114',55),(15,'C115',40);
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `credits` int DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Data Structures and Algorithms',1,4),(2,'Database Management Systems',2,3),(3,'Operating Systems',3,4),(4,'Computer Networks',4,3),(5,'Software Engineering',5,3),(6,'Artificial Intelligence',6,4),(7,'Machine Learning',7,3),(8,'Cyber Security',8,3),(9,'Digital Signal Processing',9,4),(10,'Cloud Computing',10,3),(11,'Embedded Systems',11,4),(12,'Big Data Analytics',12,3),(13,'Internet of Things (IoT)',13,4),(14,'Blockchain Technology',14,3),(15,'Human-Computer Interaction',15,3);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (6,'Aerospace Engineering'),(12,'Biology'),(5,'Biomedical Engineering'),(14,'Business Administration'),(7,'Chemical Engineering'),(4,'Civil Engineering'),(1,'Computer Science'),(3,'Electrical Engineering'),(8,'Environmental Science'),(15,'Law'),(10,'Mathematics'),(2,'Mechanical Engineering'),(9,'Physics'),(13,'Psychology'),(11,'Statistics');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `enrollment_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,1,3,'Fall',2024),(2,2,5,'Spring',2023),(3,3,1,'Fall',2022),(4,4,7,'Spring',2024),(5,5,2,'Fall',2023),(6,6,8,'Spring',2024),(7,7,4,'Fall',2023),(8,8,9,'Spring',2022),(9,9,6,'Fall',2024),(10,10,10,'Spring',2023),(11,11,12,'Fall',2022),(12,12,15,'Spring',2024),(13,13,3,'Fall',2023),(14,14,14,'Spring',2022),(15,15,1,'Fall',2024),(16,16,4,'Spring',2023),(17,17,6,'Fall',2022),(18,18,11,'Spring',2024),(19,19,8,'Fall',2023),(20,20,13,'Spring',2022),(21,21,3,'Fall',2024),(22,22,5,'Spring',2023),(23,23,1,'Fall',2022),(24,24,7,'Spring',2024),(25,25,2,'Fall',2023),(26,26,10,'Spring',2024),(27,27,14,'Fall',2023),(28,28,9,'Spring',2022),(29,29,12,'Fall',2024),(30,30,15,'Spring',2023);
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examresults`
--

DROP TABLE IF EXISTS `examresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examresults` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `exam_id` int DEFAULT NULL,
  `obtained_marks` int DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `student_id` (`student_id`),
  KEY `exam_id` (`exam_id`),
  CONSTRAINT `examresults_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  CONSTRAINT `examresults_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examresults`
--

LOCK TABLES `examresults` WRITE;
/*!40000 ALTER TABLE `examresults` DISABLE KEYS */;
INSERT INTO `examresults` VALUES (1,1,3,22),(2,2,5,68),(3,3,1,55),(4,4,7,45),(5,5,2,92),(6,6,8,80),(7,7,4,66),(8,8,9,18),(9,9,6,27),(10,10,10,58),(11,11,12,19),(12,12,14,98),(13,13,16,62),(14,14,18,74),(15,15,20,23),(16,16,22,65),(17,17,24,94),(18,18,26,30),(19,19,28,15),(20,20,30,88),(21,21,1,40),(22,22,3,20),(23,23,5,76),(24,24,7,52),(25,25,9,25),(26,26,11,84),(27,27,13,68),(28,28,15,19),(29,29,17,90),(30,30,19,100),(31,1,3,NULL);
/*!40000 ALTER TABLE `examresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `exam_type` enum('Midterm','Final','Quiz') DEFAULT NULL,
  `total_marks` int DEFAULT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (1,1,'2024-04-10','Midterm',60),(2,2,'2024-05-15','Final',100),(3,3,'2024-03-20','Quiz',25),(4,4,'2024-06-05','Midterm',70),(5,5,'2024-07-10','Final',100),(6,6,'2024-04-25','Quiz',30),(7,7,'2024-08-20','Midterm',55),(8,8,'2024-09-15','Final',100),(9,9,'2024-05-10','Quiz',20),(10,10,'2024-10-01','Midterm',65),(11,11,'2024-06-12','Final',100),(12,12,'2024-07-05','Quiz',28),(13,13,'2024-04-22','Midterm',75),(14,14,'2024-05-30','Final',100),(15,15,'2024-08-10','Quiz',22),(16,1,'2024-09-05','Midterm',60),(17,2,'2024-10-20','Final',100),(18,3,'2024-06-30','Quiz',30),(19,4,'2024-07-15','Midterm',50),(20,5,'2024-11-10','Final',100),(21,6,'2024-08-05','Quiz',25),(22,7,'2024-12-15','Midterm',70),(23,8,'2024-09-25','Final',100),(24,9,'2024-10-15','Quiz',20),(25,10,'2024-11-22','Midterm',55),(26,11,'2024-12-10','Final',100),(27,12,'2024-08-28','Quiz',27),(28,13,'2024-06-14','Midterm',75),(29,14,'2024-07-22','Final',100),(30,15,'2024-09-30','Quiz',23);
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultyassignments`
--

DROP TABLE IF EXISTS `facultyassignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultyassignments` (
  `assignment_id` int NOT NULL AUTO_INCREMENT,
  `professor_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `professor_id` (`professor_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `facultyassignments_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`professor_id`) ON DELETE CASCADE,
  CONSTRAINT `facultyassignments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultyassignments`
--

LOCK TABLES `facultyassignments` WRITE;
/*!40000 ALTER TABLE `facultyassignments` DISABLE KEYS */;
INSERT INTO `facultyassignments` VALUES (1,1,3),(2,2,5),(3,3,1),(4,4,7),(5,5,2),(6,6,8),(7,7,4),(8,8,9),(9,9,6),(10,10,10),(11,11,12),(12,12,15),(13,13,3),(14,14,14),(15,15,1),(16,16,4),(17,17,6),(18,18,11),(19,19,8),(20,20,13),(21,21,3),(22,22,5),(23,23,1),(24,24,7),(25,25,2),(26,26,10),(27,27,14),(28,28,9),(29,29,12),(30,30,15);
/*!40000 ALTER TABLE `facultyassignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professors` (
  `professor_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  PRIMARY KEY (`professor_id`),
  UNIQUE KEY `email` (`email`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `professors_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professors`
--

LOCK TABLES `professors` WRITE;
/*!40000 ALTER TABLE `professors` DISABLE KEYS */;
INSERT INTO `professors` VALUES (1,'Dr. John','Doe','john.doe@example.com','9876543210',1),(2,'Dr. Alice','Smith','alice.smith@example.com','9876543211',2),(3,'Dr. Robert','Brown','robert.brown@example.com','9876543212',3),(4,'Dr. Emily','Davis','emily.davis@example.com','9876543213',4),(5,'Dr. Michael','Johnson','michael.johnson@example.com','9876543214',5),(6,'Dr. Jessica','White','jessica.white@example.com','9876543215',6),(7,'Dr. David','Miller','david.miller@example.com','9876543216',7),(8,'Dr. Sarah','Wilson','sarah.wilson@example.com','9876543217',8),(9,'Dr. Daniel','Moore','daniel.moore@example.com','9876543218',9),(10,'Dr. Laura','Taylor','laura.taylor@example.com','9876543219',10),(11,'Dr. James','Anderson','james.anderson@example.com','9876543220',11),(12,'Dr. Sophia','Thomas','sophia.thomas@example.com','9876543221',12),(13,'Dr. William','Jackson','william.jackson@example.com','9876543222',13),(14,'Dr. Olivia','Harris','olivia.harris@example.com','9876543223',14),(15,'Dr. Matthew','Martin','matthew.martin@example.com','9876543224',15),(16,'Dr. Ethan','Thompson','ethan.thompson@example.com','9876543225',1),(17,'Dr. Ava','Garcia','ava.garcia@example.com','9876543226',2),(18,'Dr. Benjamin','Martinez','benjamin.martinez@example.com','9876543227',3),(19,'Dr. Chloe','Robinson','chloe.robinson@example.com','9876543228',4),(20,'Dr. Alexander','Clark','alexander.clark@example.com','9876543229',5),(21,'Dr. Emma','Rodriguez','emma.rodriguez@example.com','9876543230',6),(22,'Dr. Mason','Lewis','mason.lewis@example.com','9876543231',7),(23,'Dr. Harper','Lee','harper.lee@example.com','9876543232',8),(24,'Dr. Logan','Walker','logan.walker@example.com','9876543233',9),(25,'Dr. Lily','Hall','lily.hall@example.com','9876543234',10),(26,'Dr. Jacob','Allen','jacob.allen@example.com','9876543235',11),(27,'Dr. Madison','Young','madison.young@example.com','9876543236',12),(28,'Dr. Elijah','King','elijah.king@example.com','9876543237',13),(29,'Dr. Grace','Wright','grace.wright@example.com','9876543238',14),(30,'Dr. Lucas','Scott','lucas.scott@example.com','9876543239',15);
/*!40000 ALTER TABLE `professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `studentprofile`
--

DROP TABLE IF EXISTS `studentprofile`;
/*!50001 DROP VIEW IF EXISTS `studentprofile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentprofile` AS SELECT 
 1 AS `student_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `department_name`,
 1 AS `dob`,
 1 AS `gender`,
 1 AS `department_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'John','Doe','2002-05-15','Male','john.doe@example.com','9876543210',1),(2,'Jane','Smith','2001-07-22','Female','jane.smith@example.com','9876543211',2),(3,'Alice','Johnson','2003-03-10','Female','alice.johnson@example.com','9876543212',1),(4,'Bob','Williams','2000-12-05','Male','bob.williams@example.com','9876543213',3),(5,'Charlie','Brown','2002-09-17','Male','charlie.brown@example.com','9876543214',2),(6,'David','Jones','2001-06-25','Male','david.jones@example.com','9876543215',3),(7,'Emma','Garcia','2002-04-19','Female','emma.garcia@example.com','9876543216',1),(8,'Fiona','Martinez','2000-11-30','Female','fiona.martinez@example.com','9876543217',2),(9,'George','Harris','2001-08-07','Male','george.harris@example.com','9876543218',3),(10,'Hannah','Clark','2003-01-14','Female','hannah.clark@example.com','9876543219',1),(11,'Isaac','Lewis','2002-02-28','Male','isaac.lewis@example.com','9876543220',2),(12,'Jack','Walker','2000-10-13','Male','jack.walker@example.com','9876543221',3),(13,'Kate','Hall','2001-09-21','Female','kate.hall@example.com','9876543222',1),(14,'Liam','Allen','2003-07-05','Male','liam.allen@example.com','9876543223',2),(15,'Mia','Young','2002-06-18','Female','mia.young@example.com','9876543224',3),(16,'Nathan','King','2001-05-02','Male','nathan.king@example.com','9876543225',1),(17,'Olivia','Wright','2003-03-23','Female','olivia.wright@example.com','9876543226',2),(18,'Paul','Scott','2000-12-11','Male','paul.scott@example.com','9876543227',3),(19,'Quinn','Green','2002-08-26','Other','quinn.green@example.com','9876543228',1),(20,'Rachel','Adams','2001-07-08','Female','rachel.adams@example.com','9876543229',2),(21,'Samuel','Baker','2002-04-14','Male','samuel.baker@example.com','9876543230',3),(22,'Tina','Perez','2000-11-20','Female','tina.perez@example.com','9876543231',1),(23,'Umar','Collins','2001-10-31','Male','umar.collins@example.com','9876543232',2),(24,'Victoria','Rivera','2003-05-17','Female','victoria.rivera@example.com','9876543233',3),(25,'William','Carter','2002-03-29','Male','william.carter@example.com','9876543234',1),(26,'Xavier','Mitchell','2001-09-12','Male','xavier.mitchell@example.com','9876543235',2),(27,'Yasmin','Roberts','2000-06-15','Female','yasmin.roberts@example.com','9876543236',3),(28,'Zack','Evans','2002-01-04','Male','zack.evans@example.com','9876543237',1),(29,'Amelia','Torres','2001-02-19','Female','amelia.torres@example.com','9876543238',2),(30,'Benjamin','Gomez','2003-08-08','Male','benjamin.gomez@example.com','9876543239',3);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `classroom_id` int DEFAULT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `course_id` (`course_id`),
  KEY `classroom_id` (`classroom_id`),
  CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `timetable_ibfk_2` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`classroom_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (1,1,3,'Monday','09:00:00','10:30:00'),(2,2,5,'Tuesday','10:45:00','12:15:00'),(3,3,7,'Wednesday','13:00:00','14:30:00'),(4,4,9,'Thursday','09:00:00','10:30:00'),(5,5,11,'Friday','10:45:00','12:15:00'),(6,6,13,'Saturday','13:00:00','14:30:00'),(7,7,1,'Monday','14:45:00','16:15:00'),(8,8,4,'Tuesday','09:00:00','10:30:00'),(9,9,6,'Wednesday','10:45:00','12:15:00'),(10,10,8,'Thursday','13:00:00','14:30:00'),(11,11,10,'Friday','14:45:00','16:15:00'),(12,12,12,'Saturday','09:00:00','10:30:00'),(13,13,14,'Monday','10:45:00','12:15:00'),(14,14,2,'Tuesday','13:00:00','14:30:00'),(15,15,15,'Wednesday','14:45:00','16:15:00'),(16,1,4,NULL,'09:30:00',NULL);
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `topperformingstudentsview`
--

DROP TABLE IF EXISTS `topperformingstudentsview`;
/*!50001 DROP VIEW IF EXISTS `topperformingstudentsview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `topperformingstudentsview` AS SELECT 
 1 AS `student_id`,
 1 AS `student_name`,
 1 AS `course_name`,
 1 AS `obtained_marks`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `studentprofile`
--

/*!50001 DROP VIEW IF EXISTS `studentprofile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentprofile` AS select `s`.`student_id` AS `student_id`,`s`.`first_name` AS `first_name`,`s`.`last_name` AS `last_name`,`s`.`email` AS `email`,`s`.`phone` AS `phone`,`d`.`department_name` AS `department_name`,`s`.`dob` AS `dob`,`s`.`gender` AS `gender`,`s`.`department_id` AS `department_id` from (`students` `s` join `departments` `d` on((`s`.`department_id` = `d`.`department_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `topperformingstudentsview`
--

/*!50001 DROP VIEW IF EXISTS `topperformingstudentsview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `topperformingstudentsview` AS select `s`.`student_id` AS `student_id`,concat(`s`.`first_name`,' ',`s`.`last_name`) AS `student_name`,`c`.`course_name` AS `course_name`,`er`.`obtained_marks` AS `obtained_marks` from (((`examresults` `er` join `students` `s` on((`er`.`student_id` = `s`.`student_id`))) join `exams` `e` on((`er`.`exam_id` = `e`.`exam_id`))) join `courses` `c` on((`e`.`course_id` = `c`.`course_id`))) where (`er`.`obtained_marks` > 85) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-05 18:57:27
