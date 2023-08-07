-- MySQL dump 10.13  Distrib 8.0.33, for macos12.6 (x86_64)
--
-- Host: localhost    Database: clinicv3db
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `consultations`
--

DROP TABLE IF EXISTS `consultations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint unsigned NOT NULL,
  `patient_id` bigint unsigned NOT NULL,
  `consultation_date_time` timestamp NOT NULL,
  `health_concerns` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consultations_doctor_id_foreign` (`doctor_id`),
  KEY `consultations_patient_id_foreign` (`patient_id`),
  CONSTRAINT `consultations_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `consultations_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultations`
--

LOCK TABLES `consultations` WRITE;
/*!40000 ALTER TABLE `consultations` DISABLE KEYS */;
INSERT INTO `consultations` VALUES (1,2,15,'2023-07-25 18:30:00','sdasd',0,'2023-07-26 10:51:19','2023-07-26 10:51:19'),(2,1,18,'2023-07-27 00:30:00','Testing',0,'2023-07-26 11:03:46','2023-07-26 11:03:46'),(3,1,19,'2023-07-27 01:30:00','12312312',0,'2023-07-26 11:06:36','2023-07-26 11:06:36'),(4,1,20,'2023-07-26 13:30:00','Testing',0,'2023-07-26 11:31:24','2023-07-26 11:31:24'),(5,1,21,'2023-07-26 13:30:00','123123123',0,'2023-07-26 12:37:14','2023-07-26 12:37:14'),(6,1,22,'2023-07-27 05:00:00','nbadfscasncasgcas',0,'2023-07-26 12:57:36','2023-07-26 12:57:36'),(7,2,23,'2023-07-31 13:00:00','testing',0,'2023-07-26 13:04:59','2023-07-26 13:04:59'),(8,2,24,'2023-07-27 05:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer urna enim, molestie quis hendrerit varius, consequat eu sem. Vestibulum leo turpis, luctus non aliquam sed, bibendum sed justo. Nam mauris arcu, pulvinar in lorem at, lobortis molestie enim. Duis massa nibh, porta ut dui at, blandit facilisis lacus. Donec rutrum mi vitae nulla laoreet elementum. Nulla facilisi. Sed orci est, suscipit sit amet scelerisque a, fermentum quis est. Nulla facilisi. Sed at vestibulum neque.',0,'2023-07-26 13:14:03','2023-07-26 13:14:03'),(9,1,25,'2023-08-02 13:30:00','testing',0,'2023-07-27 04:17:09','2023-07-27 04:17:09'),(10,2,26,'2023-07-28 05:00:00','asdqwezxczxc',0,'2023-07-27 04:40:40','2023-07-27 04:40:40'),(11,1,27,'2023-08-02 13:30:00','sadasdqweqweqwe',0,'2023-07-27 06:16:56','2023-07-27 06:16:56'),(12,1,28,'2023-08-01 13:00:00','Testing',0,'2023-07-27 08:26:56','2023-07-27 08:26:56'),(13,2,29,'2023-08-02 06:00:00','Testing123',0,'2023-07-27 08:39:11','2023-07-27 08:39:11'),(14,2,30,'2023-08-02 13:30:00','Testing',0,'2023-07-27 08:51:31','2023-07-27 08:51:31'),(15,2,31,'2023-08-02 13:30:00','Testing',0,'2023-07-27 09:14:37','2023-07-27 09:14:37'),(16,1,32,'2023-08-02 13:30:00','TestingTesting2',0,'2023-07-27 09:25:36','2023-07-27 09:25:36'),(17,1,33,'2023-08-02 13:30:00','Testing',0,'2023-07-29 05:09:42','2023-07-29 05:09:42'),(18,1,34,'2023-08-02 13:30:00','asdasbduyefqsdasd',0,'2023-07-31 03:46:18','2023-07-31 03:46:18'),(19,1,35,'2023-08-02 13:30:00','testing',0,'2023-07-31 04:22:03','2023-07-31 04:22:03'),(20,1,36,'2023-08-02 13:30:00','techadmin@123',0,'2023-07-31 04:29:24','2023-07-31 04:29:24');
/*!40000 ALTER TABLE `consultations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Dr. Emanuel','He is a board-certified physician with over 15 years of experience in internal medicine','+91 1234567890','$300','assets/icons/male.svg',NULL,NULL),(2,'Dr. Jessica','She is a seasoned family physician who specializes in pediatric and women`s health.','+91 9876543210','$250','assets/icons/female.svg',NULL,NULL),(13,'Imran','Testing','123123','123123',NULL,'2023-08-01 04:17:06','2023-08-01 04:17:06'),(14,'Sameer','Testing 2 ','123123123123','432',NULL,'2023-08-02 06:44:20','2023-08-02 06:44:20');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_07_19_095235_create_doctors_table',1),(6,'2023_07_19_095257_create_patients_table',1),(7,'2023_07_19_095258_create_consultations_table',1),(8,'2023_07_19_095309_create_payments_table',1),(9,'2023_07_19_095327_create_slots_table',1),(10,'2023_07_19_095342_create_slot_times_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'asdasd','asdas@gmailc.ocm','123123','2023-07-26 09:37:27','2023-07-26 09:37:27'),(2,'Imran Khan A','imran@gmail.com','123123123','2023-07-26 09:51:30','2023-07-26 09:51:30'),(3,'asdasd','asdasd@asdasd','123123123','2023-07-26 09:52:34','2023-07-26 09:52:34'),(4,'Imran2','imran2@gmail.com','7708809112','2023-07-26 10:16:37','2023-07-26 10:16:37'),(5,'adasd','imran2@gmail.com','213123','2023-07-26 10:19:43','2023-07-26 10:19:43'),(6,'qweqw','imran2@gmail.com','213123','2023-07-26 10:20:06','2023-07-26 10:20:06'),(7,'asdasd','12312@aasda','123123','2023-07-26 10:20:48','2023-07-26 10:20:48'),(8,'asdasd','imran2@gmail.com','213123','2023-07-26 10:22:20','2023-07-26 10:22:20'),(9,'asdasd','imran2@gmail.com','213123','2023-07-26 10:24:50','2023-07-26 10:24:50'),(10,'asdasd','imran2@gmail.com','213123','2023-07-26 10:25:27','2023-07-26 10:25:27'),(11,'asdas','imran2@gmail.com','123123','2023-07-26 10:25:42','2023-07-26 10:25:42'),(12,'asdasd','imran2@gmail.com','123123','2023-07-26 10:26:01','2023-07-26 10:26:01'),(13,'asdasd','imran2@gmail.com','123123','2023-07-26 10:29:01','2023-07-26 10:29:01'),(14,'Imran','imran3@gmail.com','123123123','2023-07-26 10:50:30','2023-07-26 10:50:30'),(15,'asdasd','2023-07-26','21123','2023-07-26 10:51:19','2023-07-26 10:51:19'),(16,'asdasd','2023-07-26','21123123','2023-07-26 10:52:38','2023-07-26 10:52:38'),(17,'Imran','imran@gmail.com','123123123','2023-07-26 10:59:43','2023-07-26 10:59:43'),(18,'Imran ','imran4@gmail.com','123123123','2023-07-26 11:03:46','2023-07-26 11:03:46'),(19,'asdasd','asdasd@asdasd','1231231','2023-07-26 11:06:36','2023-07-26 11:06:36'),(20,'Imrsn','imran@gmail.com','123123123','2023-07-26 11:31:24','2023-07-26 11:31:24'),(21,'Imean','asdasd@123123','123123','2023-07-26 12:37:14','2023-07-26 12:37:14'),(22,'Test','test@tesing.com','1234123412334','2023-07-26 12:57:36','2023-07-26 12:57:36'),(23,'Imran','asdasd@123123','123123123','2023-07-26 13:04:59','2023-07-26 13:04:59'),(24,'Imran Khan A','drakezyrn@gmail.com','7708809112','2023-07-26 13:14:03','2023-07-26 13:14:03'),(25,'Imran','imran@gmail.com','77088091123','2023-07-27 04:17:09','2023-07-27 04:17:09'),(26,'Imran','imran@gmail.com','123123123','2023-07-27 04:40:40','2023-07-27 04:40:40'),(27,'Imran','imran@gmail.com','123123','2023-07-27 06:16:56','2023-07-27 06:16:56'),(28,'Imran','imran@gmail.com','123123123123','2023-07-27 08:26:56','2023-07-27 08:26:56'),(29,'Imran','imran@gmail.com','7708809112','2023-07-27 08:39:11','2023-07-27 08:39:11'),(30,'Imran','imran@gmail.com','7708809112','2023-07-27 08:51:31','2023-07-27 08:51:31'),(31,'Imran','imran@gmail.com','123123123','2023-07-27 09:14:37','2023-07-27 09:14:37'),(32,'Imraen','imran@gmail.com','123412341234','2023-07-27 09:25:36','2023-07-27 09:25:36'),(33,'Imran','imran@gmail.com','123123123','2023-07-29 05:09:42','2023-07-29 05:09:42'),(34,'Imran','imran@gmail.com','123123123','2023-07-31 03:46:18','2023-07-31 03:46:18'),(35,'Imran','imran@asdasd.com','12345123','2023-07-31 04:22:03','2023-07-31 04:22:03'),(36,'Imran','imran@gmail.com','123123','2023-07-31 04:29:24','2023-07-31 04:29:24');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint unsigned NOT NULL,
  `consultation_id` bigint unsigned NOT NULL,
  `amount` double NOT NULL,
  `payment_status` enum('Success','Failure','Pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_patient_id_foreign` (`patient_id`),
  KEY `payments_consultation_id_foreign` (`consultation_id`),
  CONSTRAINT `payments_consultation_id_foreign` FOREIGN KEY (`consultation_id`) REFERENCES `consultations` (`id`),
  CONSTRAINT `payments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot_times`
--

DROP TABLE IF EXISTS `slot_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slot_times` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slot_id` bigint unsigned NOT NULL,
  `time` time NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slot_times_slot_id_foreign` (`slot_id`),
  CONSTRAINT `slot_times_slot_id_foreign` FOREIGN KEY (`slot_id`) REFERENCES `slots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot_times`
--

LOCK TABLES `slot_times` WRITE;
/*!40000 ALTER TABLE `slot_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `slot_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slots`
--

DROP TABLE IF EXISTS `slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slots_doctor_id_foreign` (`doctor_id`),
  CONSTRAINT `slots_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slots`
--

LOCK TABLES `slots` WRITE;
/*!40000 ALTER TABLE `slots` DISABLE KEYS */;
INSERT INTO `slots` VALUES (2,13,'2023-08-15','2023-08-01 12:43:40','2023-08-01 12:43:50'),(3,1,'2023-08-15','2023-08-01 12:45:22','2023-08-01 12:45:22'),(4,13,'2023-08-15','2023-08-01 12:45:44','2023-08-01 12:45:44'),(5,13,'2023-08-14','2023-08-01 12:49:29','2023-08-01 12:49:37'),(6,2,'2023-07-30','2023-08-01 12:49:56','2023-08-01 12:50:02'),(7,1,'2023-08-02','2023-08-01 12:55:41','2023-08-01 12:55:41'),(8,13,'2023-08-09','2023-08-02 06:24:53','2023-08-02 06:24:53'),(9,1,'2023-08-16','2023-08-02 06:25:44','2023-08-02 06:25:44');
/*!40000 ALTER TABLE `slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@saasforest.com',NULL,'$2y$10$.faq/5//Spx8/4v.HIqy4uyx0hC8tNx4MGnfd3C90nHtUP86vO.PC','lwBJd3RDOiPAJv4Uw3Z50AyqNnf7B2Y1R0lytGUBGgqKP8kqV0YA08ScOOVM','2023-07-31 05:56:13','2023-07-31 05:56:13');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-02 12:29:27
