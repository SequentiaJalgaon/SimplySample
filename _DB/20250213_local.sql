CREATE DATABASE  IF NOT EXISTS `simplysample_niranjan` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `simplysample_niranjan`;
-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: simplysample_niranjan
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) NOT NULL DEFAULT '',
  `login_id` varchar(20) NOT NULL DEFAULT '',
  `login_password` varchar(60) NOT NULL DEFAULT '',
  `login_role` varchar(20) DEFAULT NULL,
  `login_photo` varchar(200) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Administrator','admin','$2y$10$cTD5ekbnwGaAw0djULx2SuHhtYkYPmXwIbVKM.FVrAuZApnXoErDS','ADMIN','default.png','Active'),(2,'Administrator','superadmin','$2y$10$VZxSraF5hTG7Pok41sQane9qEWYcp5UrmITNVF8XhvMkM8cohxxcK','ADMIN','default.png','Active');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_trail`
--

DROP TABLE IF EXISTS `audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `entity` varchar(255) NOT NULL,
  `entity_key_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_trail`
--

LOCK TABLES `audit_trail` WRITE;
/*!40000 ALTER TABLE `audit_trail` DISABLE KEYS */;
INSERT INTO `audit_trail` VALUES (1,'2024-12-09 15:39:56','Category',1,'INSERT','category_id: 1, category_name: Testing Category1, is_active: 1, added_on: 2024-12-09 20:45:10');
/*!40000 ALTER TABLE `audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_address`
--

DROP TABLE IF EXISTS `brand_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_address` (
  `brand_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `address_line_1` varchar(1000) NOT NULL,
  `address_line_2` text NOT NULL,
  `taluka` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pincode` int(6) NOT NULL,
  `is_active` enum('0','1') NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `address_type` enum('registered','delivery') NOT NULL,
  PRIMARY KEY (`brand_address_id`),
  KEY `idx_addressid` (`brand_id`),
  CONSTRAINT `idx_addressid` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_address`
--

LOCK TABLES `brand_address` WRITE;
/*!40000 ALTER TABLE `brand_address` DISABLE KEYS */;
INSERT INTO `brand_address` VALUES (1,1,'','Palo Alto, California','USA','USA','USA',94304,'1','2025-01-16 20:06:23','registered'),(2,2,'','Round Rock, Texas, U.S.','Texas','Texas','Texas',91202,'1','2025-01-16 20:09:44','registered'),(3,3,'','36 Flowers Road','Chennai','Chennai','Tamil Nadu',600084,'1','2025-01-16 20:15:20','registered'),(4,4,'','S-2 Level, Block-E','New Delhi','New Delhi','New Delhi',110019,'1','2025-01-16 20:17:33','registered'),(5,5,'','Frontech Pvt Ltd,ECOCENTRE, Unit-801,EM-4, Sector-V,','Kolkata ','Kolkata ','West Bengal',700091,'1','2025-01-17 07:31:24','registered'),(6,6,'','Opp. to Metro pillar no : 1727, Beside Bata Showroom, Megha Hills, Madhapur,','Hyderabad','Hyderabad','Telangana',500081,'1','2025-01-17 07:38:31','registered'),(7,7,'','Ferns Icon, Level, 2, Outer Ring Rd, Doddanekundi, Mahadevapura','Bengaluru','Bengaluru','Karnataka',560037,'1','2025-01-17 07:42:31','registered'),(8,8,'','13th Floor, Prestige Minsk Square,','Bengaluru','Bengaluru','Karnataka ',560001,'1','2025-01-17 07:45:38','registered'),(10,9,'','No. 143/1, Amani Bellandur Village, Prestige Tech Park, Marathalli-Sarjapur Outer Ring Road','Kadubeesnahalli','Bengaluru ','Karnataka ',560103,'1','2025-01-17 07:48:31','registered'),(11,10,'','0th to 24th Floor, Two Horizon Centre, Golf Course Road, Sector-43','Delhi','Gurgaon','Haryana',122202,'1','2025-01-17 07:51:58','registered'),(12,11,'','402,Supreme Chambers,17/18,Shah Industrial Estate, Veera Desai Road','Andheri(West)','Mumbai','Maharashtra',400053,'1','2025-01-17 07:53:54','registered'),(13,12,'','C001,KP tower, Sector 16B','Noida','Noida','Uttar Pradesh',201301,'1','2025-01-17 07:56:14','registered'),(14,13,'','2nd Floor, Unit No. 24, Kalpataru Square, Kondivita Lane, Andheri Kurla Road','Andheri','Mumbai','Maharashtra',400059,'1','2025-01-17 07:58:46','registered'),(15,14,'','Canon India Pvt. Ltd., 6th floor, Embassy One Pinnacle','Ganganagar','Bengaluru ','Karnataka ',560032,'1','2025-01-17 08:01:40','registered'),(16,15,'','2nd floor, No 112, Vairam complex, Sir Thyagaraya Rd, T. Nagar','Chennai','Chennai','Tamil Nadu',600017,'1','2025-01-17 08:04:10','registered'),(17,16,'','Block E, Embassy Tech Village Marathahalli Outer Ring Road','Devarabisanahalli','Bengaluru ','Karnataka ',560103,'1','2025-01-17 08:06:07','registered'),(19,17,'','UB City, 24, Vittal Mallya Road, D\'Souza Layout, Ashok Nagar','Bengaluru','Bengaluru','Karnataka',560001,'1','2025-01-17 08:08:03','registered'),(20,2,'','Testing address For elivery','USA1','USA1','USA1',123456,'1','2025-01-30 19:36:03','delivery');
/*!40000 ALTER TABLE `brand_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_documents`
--

DROP TABLE IF EXISTS `brand_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_documents` (
  `brand_doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `document_title` varchar(1000) NOT NULL,
  `file_title` text NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`brand_doc_id`),
  KEY `brand_documents_brand_id_idx` (`brand_id`),
  CONSTRAINT `brand_documents_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_documents`
--

LOCK TABLES `brand_documents` WRITE;
/*!40000 ALTER TABLE `brand_documents` DISABLE KEYS */;
INSERT INTO `brand_documents` VALUES (1,1,'Food License','test_file_1.pdf','2025-01-17 08:10:50','1'),(2,2,'Food License','test_file_2.pdf','2025-01-17 08:10:50','1'),(3,3,'Food License','test_file_3.pdf','2025-01-17 08:10:50','1'),(4,4,'Food License','test_file_4.pdf','2025-01-17 08:10:50','1'),(5,5,'Food License','test_file_5.pdf','2025-01-17 08:10:50','1'),(6,6,'Food License','test_file_6.pdf','2025-01-17 08:10:50','1'),(7,7,'Food License','test_file_7.pdf','2025-01-17 08:10:50','1'),(8,8,'Food License','test_file_8.pdf','2025-01-17 08:10:50','1'),(9,9,'Food License','test_file_9.pdf','2025-01-17 08:10:50','1'),(10,10,'Food License','test_file_10.pdf','2025-01-17 08:10:50','1'),(11,11,'Food License','test_file_11.pdf','2025-01-17 08:10:50','1'),(12,12,'Food License','test_file_12.pdf','2025-01-17 08:10:50','1'),(13,13,'Food License','test_file_13.pdf','2025-01-17 08:10:50','1'),(14,14,'Food License','test_file_14.pdf','2025-01-17 08:10:50','1'),(15,15,'Food License','test_file_15.pdf','2025-01-17 08:10:50','1'),(16,16,'Food License','test_file_16.pdf','2025-01-17 08:10:50','1'),(17,17,'Food License','test_file_17.pdf','2025-01-17 08:10:50','1'),(26,1,'GST Certificate','test_file_1_g.pdf','2025-01-30 22:10:50','1'),(27,2,'GST Certificate','test_file_2_g.pdf','2025-01-30 22:10:50','1'),(28,3,'GST Certificate','test_file_3_g.pdf','2025-01-30 22:10:50','1'),(29,4,'GST Certificate','test_file_4_g.pdf','2025-01-30 22:10:50','1'),(30,5,'GST Certificate','test_file_5_g.pdf','2025-01-30 22:10:50','1'),(31,6,'GST Certificate','test_file_6_g.pdf','2025-01-30 22:10:50','1'),(32,7,'GST Certificate','test_file_7_g.pdf','2025-01-30 22:10:50','1'),(33,8,'GST Certificate','test_file_8_g.pdf','2025-01-30 22:10:50','1'),(34,9,'GST Certificate','test_file_9_g.pdf','2025-01-30 22:10:50','1'),(35,10,'GST Certificate','test_file_10_g.pdf','2025-01-30 22:10:50','1'),(36,11,'GST Certificate','test_file_11_g.pdf','2025-01-30 22:10:50','1'),(37,12,'GST Certificate','test_file_12_g.pdf','2025-01-30 22:10:50','1'),(38,13,'GST Certificate','test_file_13_g.pdf','2025-01-30 22:10:50','1'),(39,14,'GST Certificate','test_file_14_g.pdf','2025-01-30 22:10:50','1'),(40,15,'GST Certificate','test_file_15_g.pdf','2025-01-30 22:10:50','1'),(41,16,'GST Certificate','test_file_16_g.pdf','2025-01-30 22:10:50','1'),(42,17,'GST Certificate','test_file_17_g.pdf','2025-01-30 22:10:50','1');
/*!40000 ALTER TABLE `brand_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_info`
--

DROP TABLE IF EXISTS `brand_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_info` (
  `brand_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `contact_number` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `registration_year` year(4) NOT NULL,
  `gst_number` varchar(15) NOT NULL,
  `brand_logo` text NOT NULL,
  `food_licence_number` varchar(255) NOT NULL,
  `sample_size` varchar(45) DEFAULT NULL,
  `additional_comments` text DEFAULT NULL,
  `requested_categories` text NOT NULL,
  `is_active` enum('1','0') DEFAULT NULL,
  PRIMARY KEY (`brand_info_id`),
  KEY `idx_brand_info` (`brand_id`),
  CONSTRAINT `idx_brand_info` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_info`
--

LOCK TABLES `brand_info` WRITE;
/*!40000 ALTER TABLE `brand_info` DISABLE KEYS */;
INSERT INTO `brand_info` VALUES (1,1,'Hewlett','Packard',1800120100,'admin@hp.com',1978,'','hp.png','',NULL,NULL,'','1'),(2,2,'Michael','Dell',1800120200,'admin@dell.com',1920,'','dell.png','',NULL,NULL,'2,6,8,7','1'),(3,3,'Rajesh','Doshi',1800120300,'admin@zebronics.com',2000,'','zebronics.png','',NULL,NULL,'','1'),(4,4,'Logitech','Electronics',911147306622,'admin@logitech.com',1982,'','logitech.png','',NULL,NULL,'','1'),(5,5,'Love','Jain',1800345500,'admin@frontech.com',1997,'','frontech.png','',NULL,NULL,'','1'),(6,7,'Yang','Yuanqing',18004199733,'admin@lenovo.com',1984,'','lenovo.avif','',NULL,NULL,'','1'),(7,8,'Tim','Cook',18002120129,'admin@apple.com',1976,'','apple.png','',NULL,NULL,'','1'),(8,9,'Sanjay','Mehrotra',465487984621,'admin@sandisk.com',1988,'','sandisk.png','',NULL,NULL,'','1'),(9,10,'Lee ','Kun-hee',18005698932,'admin@samsung.com',1938,'','samsung.png','',NULL,NULL,'','1'),(10,11,'Ted','Hsu',18023563541,'admin@asus.com',1989,'','asus.png','',NULL,NULL,'','1'),(11,12,'Koo Bon','Moo',1800235678,'admin@lg.com',1947,'','lg.png','',NULL,NULL,'','1'),(12,13,'Kamlaksha','Rama Naik',1800213546,'admin@dlink.com',1986,'','dlink.png','',NULL,NULL,'','1'),(13,14,'Fujio','Mitarai',1822021356,'admin@canon.com',1937,'','canon.png','',NULL,NULL,'','1'),(14,15,'Seiko','Family',18001256752,'admin@epson.com',1942,'','epson.png','',NULL,NULL,'','1'),(15,16,'Lei','Jun',18001465486,'admin@xiaomi.com',2010,'','xiaomi.png','',NULL,NULL,'','1'),(16,17,'Pete','Lau',18001235465,'admin@oneplus.com',2013,'','oneplus.png','',NULL,NULL,'','1'),(17,19,'Niranjan','Chaudhari',7387414778,'niranjan@sequentia.co.in',0000,'','','','100gm','','2,5,7,8','1');
/*!40000 ALTER TABLE `brand_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_vs_category`
--

DROP TABLE IF EXISTS `brand_vs_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_vs_category` (
  `brand_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`brand_category_id`),
  UNIQUE KEY `unique` (`brand_id`,`category_id`),
  KEY `idx_brandcat_brand_id` (`brand_id`),
  KEY `idx_brandcat_category_id` (`category_id`),
  CONSTRAINT `idx_brandcat_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `idx_brandcat_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_vs_category`
--

LOCK TABLES `brand_vs_category` WRITE;
/*!40000 ALTER TABLE `brand_vs_category` DISABLE KEYS */;
INSERT INTO `brand_vs_category` VALUES (1,1,2,'2025-01-16 19:48:25','0'),(2,2,2,'2025-01-16 19:48:25','1'),(3,3,2,'2025-01-16 19:48:25','1'),(4,4,2,'2025-01-16 19:48:25','1'),(5,5,2,'2025-01-16 19:48:25','1'),(6,6,2,'2025-01-16 19:48:26','1'),(7,7,2,'2025-01-16 19:48:26','1'),(8,8,2,'2025-01-16 19:48:26','1'),(9,9,2,'2025-01-16 19:48:26','1'),(10,10,2,'2025-01-16 19:48:26','1'),(11,11,2,'2025-01-16 19:48:26','1'),(12,12,2,'2025-01-16 19:48:26','1'),(13,13,2,'2025-01-16 19:48:26','1'),(14,14,2,'2025-01-16 19:48:26','1'),(15,15,2,'2025-01-16 19:48:26','1'),(16,16,2,'2025-01-16 19:48:26','1'),(17,17,2,'2025-01-16 19:48:26','1'),(18,8,1,'2025-01-16 19:48:26','1'),(19,8,4,'2025-01-16 19:48:26','1'),(20,8,8,'2025-01-16 19:48:26','1'),(21,11,4,'2025-01-16 19:48:26','1'),(22,14,6,'2025-01-16 19:48:26','1'),(23,2,4,'2025-01-16 19:48:26','1'),(24,2,7,'2025-01-16 19:48:26','1'),(25,13,8,'2025-01-16 19:48:26','1'),(26,1,4,'2025-01-16 19:48:26','0'),(27,1,7,'2025-01-16 19:48:26','0'),(28,7,4,'2025-01-16 19:48:26','1'),(29,7,7,'2025-01-16 19:48:26','1'),(30,7,8,'2025-01-16 19:48:26','1'),(31,12,3,'2025-01-16 19:48:26','1'),(32,12,7,'2025-01-16 19:48:26','1'),(33,4,7,'2025-01-16 19:48:26','1'),(34,17,1,'2025-01-16 19:48:26','1'),(35,10,1,'2025-01-16 19:48:26','1'),(36,10,3,'2025-01-16 19:48:26','1'),(37,10,4,'2025-01-16 19:48:26','1'),(38,10,8,'2025-01-16 19:48:26','1'),(39,16,1,'2025-01-16 19:48:26','1'),(40,16,3,'2025-01-16 19:48:26','1'),(41,3,5,'2025-01-16 19:48:26','1'),(42,3,7,'2025-01-16 19:48:26','1'),(43,3,8,'2025-01-16 19:48:26','1');
/*!40000 ALTER TABLE `brand_vs_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(1000) NOT NULL,
  `is_active` enum('0','1') NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp(),
  `edited_on` datetime NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'HP','1','2025-01-02 12:49:38','2025-01-16 01:00:00','Pending'),(2,'DELL','1','2025-01-09 13:12:32','0000-00-00 00:00:00','Approved'),(3,'ZEBRONICS','1','2025-01-09 13:12:32','0000-00-00 00:00:00','OnBoarded'),(4,'Logitech','1','2025-01-09 13:12:32','0000-00-00 00:00:00','Rejected'),(5,'FRONTECH','1','2025-01-17 00:36:58','0000-00-00 00:00:00','pending'),(6,'Galax','1','2025-01-17 00:36:58','0000-00-00 00:00:00','pending'),(7,'Lenovo','1','2025-01-17 00:36:58','0000-00-00 00:00:00','pending'),(8,'Apple','1','2025-01-17 00:36:58','0000-00-00 00:00:00','pending'),(9,'SanDisk','1','2025-01-17 00:36:58','0000-00-00 00:00:00','pending'),(10,'SAMSUNG','1','2025-01-17 00:36:58','0000-00-00 00:00:00','pending'),(11,'ASUS','1','2025-01-17 00:36:58','0000-00-00 00:00:00','pending'),(12,'LG','1','2025-01-17 00:36:58','0000-00-00 00:00:00','pending'),(13,'D-Link','1','2025-01-17 00:36:58','0000-00-00 00:00:00','pending'),(14,'Canon','1','2025-01-17 00:36:58','0000-00-00 00:00:00','pending'),(15,'Epson','1','2025-01-17 00:36:58','0000-00-00 00:00:00','pending'),(16,'Xiaomi','1','2025-01-17 00:36:58','0000-00-00 00:00:00','pending'),(17,'OnePlus','1','2025-01-17 00:36:58','0000-00-00 00:00:00','pending'),(19,'QwikFoods','0','2025-01-22 13:31:22','0000-00-00 00:00:00','Pending');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(1000) NOT NULL,
  `is_active` enum('0','1') NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (1,'Hewlett Packard Enterprise (HPE)','1','2025-01-24 18:24:41'),(2,'Dell Technologies Inc.','1','2025-01-24 18:24:41'),(3,'Zebronics India Private Limited','1','2025-01-24 18:24:41'),(4,'Logitech International S.A','1','2025-01-24 18:24:41'),(5,'Frontech Computers India Private Limited','1','2025-01-24 18:24:41'),(6,'Lenovo Group Limited','1','2025-01-24 18:24:41'),(7,'Apple Inc','1','2025-01-24 18:24:41'),(8,'Western Digital Corporation','1','2025-01-24 18:24:41'),(9,'Samsung Electronics Co., Ltd. (SEC','1','2025-01-24 18:24:41'),(10,'ASUSTeK Computer Inc','1','2025-01-24 18:24:41'),(11,'LG Electronics','1','2025-01-24 18:24:41'),(12,'D-Link Corporation','1','2025-01-24 18:24:41'),(13,'Canon Inc','1','2025-01-24 18:24:41'),(14,'Seiko Epson Corporation','1','2025-01-24 18:24:41'),(15,'Xiaomi Technology India Private Limited','1','2025-01-24 18:24:41'),(16,'OnePlus Technology (Shenzhen) Co., Ltd','1','2025-01-24 18:24:41'),(17,'','1','2025-01-24 18:24:41');
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_vs_brand`
--

DROP TABLE IF EXISTS `business_vs_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_vs_brand` (
  `business_brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`business_brand_id`),
  KEY `idx_business_id_check` (`business_id`),
  KEY `idx_brand_id_check` (`brand_id`),
  CONSTRAINT `idx_brand_id_check` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `idx_business_id_check` FOREIGN KEY (`business_id`) REFERENCES `business` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_vs_brand`
--

LOCK TABLES `business_vs_brand` WRITE;
/*!40000 ALTER TABLE `business_vs_brand` DISABLE KEYS */;
INSERT INTO `business_vs_brand` VALUES (1,1,1,'2025-01-24 18:26:06',1),(2,2,2,'2025-01-24 18:26:06',1),(3,3,3,'2025-01-24 18:26:06',1),(4,4,4,'2025-01-24 18:26:06',1),(5,5,5,'2025-01-24 18:26:06',1),(6,6,6,'2025-01-24 18:26:06',1),(7,7,7,'2025-01-24 18:26:06',1),(8,8,8,'2025-01-24 18:26:06',1),(9,9,9,'2025-01-24 18:26:06',1),(10,10,10,'2025-01-24 18:26:06',1),(11,11,11,'2025-01-24 18:26:06',1),(12,12,12,'2025-01-24 18:26:06',1),(13,13,13,'2025-01-24 18:26:06',1),(14,14,14,'2025-01-24 18:26:06',1),(15,15,15,'2025-01-24 18:26:06',1),(16,16,16,'2025-01-24 18:26:06',1),(17,17,17,'2025-01-24 18:26:06',1);
/*!40000 ALTER TABLE `business_vs_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `category_image` blob NOT NULL,
  `is_active` enum('0','1') NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Mobiles & Accessories','','1','2025-01-16 13:44:05'),(2,'Computer Accessories','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABUUAAAH/CAIAAAD/niubAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAwYSURBVHhe7ddBCQAwDACxCemz/p3Vw3QcBGIi72YBAACAFp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAmtkPMAnJYn/2jf0AAAAASUVORK5CYII=','1','2025-01-16 13:44:05'),(3,'TV & Home Entertainment','','1','2025-01-16 13:44:05'),(4,'Laptops & Accessories','','1','2025-01-16 13:44:06'),(5,'Audio','','1','2025-01-16 13:44:06'),(6,'Cameras','','1','2025-01-16 13:44:06'),(7,'Computer Peripherals','','1','2025-01-16 13:44:06'),(8,'Smart Technology','','1','2025-01-16 13:44:06'),(9,'Musical Instruemnts','','1','2025-01-16 13:44:06'),(10,'Office & Stationary','','1','2025-01-16 13:44:06'),(14,'sadasd sad1','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABUUAAAH/CAIAAAD/niubAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAwYSURBVHhe7ddBCQAwDACxCemz/p3Vw3QcBGIi72YBAACAFp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAmtkPMAnJYn/2jf0AAAAASUVORK5CYII=','1','2025-01-21 23:53:46');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_sequence`
--

DROP TABLE IF EXISTS `category_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_sequence` (
  `id_category_sequence` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `sequence_number` int(11) NOT NULL,
  `is_active` enum('0','1') DEFAULT NULL,
  `added_on` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_category_sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_sequence`
--

LOCK TABLES `category_sequence` WRITE;
/*!40000 ALTER TABLE `category_sequence` DISABLE KEYS */;
INSERT INTO `category_sequence` VALUES (1,1,1,'0','2025-01-22 01:28:42'),(2,2,10,'0','2025-01-22 01:28:42'),(3,3,6,'0','2025-01-22 01:28:42'),(4,4,9,'0','2025-01-22 01:28:42'),(5,5,8,'0','2025-01-22 01:28:42'),(6,6,7,'0','2025-01-22 01:28:42'),(7,7,2,'0','2025-01-22 01:28:42'),(8,8,14,'0','2025-01-22 01:28:42'),(9,9,4,'0','2025-01-22 01:28:42'),(10,10,5,'0','2025-01-22 01:28:42'),(11,14,3,'0','2025-01-22 01:28:42'),(12,5,1,'0','2025-01-22 02:32:10'),(13,1,2,'0','2025-01-22 02:32:10'),(14,7,3,'0','2025-01-22 02:32:10'),(15,14,4,'0','2025-01-22 02:32:10'),(16,9,5,'0','2025-01-22 02:32:10'),(17,10,6,'0','2025-01-22 02:32:10'),(18,3,7,'0','2025-01-22 02:32:10'),(19,6,8,'0','2025-01-22 02:32:10'),(20,4,9,'0','2025-01-22 02:32:10'),(21,2,10,'0','2025-01-22 02:32:10'),(22,8,11,'0','2025-01-22 02:32:10'),(23,5,1,'0','2025-01-22 02:32:47'),(24,1,2,'0','2025-01-22 02:32:47'),(25,7,3,'0','2025-01-22 02:32:47'),(26,14,4,'0','2025-01-22 02:32:47'),(27,9,5,'0','2025-01-22 02:32:47'),(28,10,6,'0','2025-01-22 02:32:47'),(29,3,7,'0','2025-01-22 02:32:47'),(30,6,8,'0','2025-01-22 02:32:47'),(31,4,9,'0','2025-01-22 02:32:47'),(32,2,10,'0','2025-01-22 02:32:47'),(33,8,11,'0','2025-01-22 02:32:47'),(34,5,1,'0','2025-01-22 02:33:16'),(35,1,2,'0','2025-01-22 02:33:16'),(36,7,3,'0','2025-01-22 02:33:16'),(37,14,4,'0','2025-01-22 02:33:16'),(38,9,5,'0','2025-01-22 02:33:16'),(39,10,6,'0','2025-01-22 02:33:16'),(40,3,7,'0','2025-01-22 02:33:16'),(41,6,8,'0','2025-01-22 02:33:16'),(42,4,9,'0','2025-01-22 02:33:16'),(43,2,10,'0','2025-01-22 02:33:16'),(44,8,11,'0','2025-01-22 02:33:16'),(45,10,1,'0','2025-01-22 02:35:00'),(46,5,2,'0','2025-01-22 02:35:00'),(47,1,3,'0','2025-01-22 02:35:00'),(48,7,4,'0','2025-01-22 02:35:00'),(49,14,5,'0','2025-01-22 02:35:00'),(50,9,6,'0','2025-01-22 02:35:00'),(51,3,7,'0','2025-01-22 02:35:00'),(52,6,8,'0','2025-01-22 02:35:00'),(53,4,9,'0','2025-01-22 02:35:00'),(54,2,10,'0','2025-01-22 02:35:00'),(55,8,11,'0','2025-01-22 02:35:00'),(56,10,1,'0','2025-01-22 02:37:10'),(57,5,2,'0','2025-01-22 02:37:10'),(58,1,3,'0','2025-01-22 02:37:10'),(59,7,4,'0','2025-01-22 02:37:10'),(60,14,5,'0','2025-01-22 02:37:10'),(61,9,6,'0','2025-01-22 02:37:10'),(62,3,7,'0','2025-01-22 02:37:10'),(63,6,8,'0','2025-01-22 02:37:10'),(64,4,9,'0','2025-01-22 02:37:10'),(65,2,10,'0','2025-01-22 02:37:10'),(66,8,11,'0','2025-01-22 02:37:10'),(67,10,1,'0','2025-01-22 02:37:48'),(68,5,2,'0','2025-01-22 02:37:48'),(69,1,3,'0','2025-01-22 02:37:48'),(70,7,4,'0','2025-01-22 02:37:48'),(71,14,5,'0','2025-01-22 02:37:48'),(72,9,6,'0','2025-01-22 02:37:48'),(73,3,7,'0','2025-01-22 02:37:48'),(74,6,8,'0','2025-01-22 02:37:48'),(75,4,9,'0','2025-01-22 02:37:48'),(76,2,10,'0','2025-01-22 02:37:48'),(77,8,11,'0','2025-01-22 02:37:48'),(80,10,1,'1','2025-02-03 01:43:21'),(81,9,2,'1','2025-02-03 01:43:21'),(82,5,3,'1','2025-02-03 01:43:21'),(83,1,4,'1','2025-02-03 01:43:21'),(84,7,5,'1','2025-02-03 01:43:21'),(85,14,6,'1','2025-02-03 01:43:21'),(86,3,7,'1','2025-02-03 01:43:21'),(87,6,8,'1','2025-02-03 01:43:21'),(88,4,9,'1','2025-02-03 01:43:21'),(89,2,10,'1','2025-02-03 01:43:21'),(90,8,11,'1','2025-02-03 01:43:21');
/*!40000 ALTER TABLE `category_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_vs_subcategory`
--

DROP TABLE IF EXISTS `category_vs_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_vs_subcategory` (
  `cat_subcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`cat_subcat_id`),
  UNIQUE KEY `UNIQUE_CAT_SUB_ADD` (`category_id`,`sub_category_id`,`is_active`,`added_on`),
  KEY `subCategoryIdCheck` (`sub_category_id`),
  KEY `categoryIdCheck_idx` (`category_id`),
  CONSTRAINT `categoryIdCheck` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `subCategoryIdCheck` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`sub_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_vs_subcategory`
--

LOCK TABLES `category_vs_subcategory` WRITE;
/*!40000 ALTER TABLE `category_vs_subcategory` DISABLE KEYS */;
INSERT INTO `category_vs_subcategory` VALUES (1,1,1,'1','2025-01-16 08:35:47'),(2,1,2,'1','2025-01-16 08:35:47'),(3,1,3,'1','2025-01-16 08:35:47'),(4,1,4,'1','2025-01-16 08:35:47'),(5,1,5,'1','2025-01-16 08:35:47'),(6,1,6,'1','2025-01-16 08:35:47'),(7,1,7,'1','2025-01-16 08:35:47'),(8,1,8,'1','2025-01-16 08:35:47'),(9,1,9,'1','2025-01-16 08:35:48'),(101,1,97,'0','2025-01-27 20:00:39'),(103,1,97,'1','2025-01-27 20:14:45'),(10,2,10,'1','2025-01-16 08:35:48'),(11,2,11,'1','2025-01-16 08:35:48'),(12,2,12,'1','2025-01-16 08:35:48'),(13,2,13,'1','2025-01-16 08:35:48'),(14,3,14,'1','2025-01-16 08:35:48'),(15,3,15,'1','2025-01-16 08:35:48'),(16,3,16,'1','2025-01-16 08:35:48'),(17,3,17,'1','2025-01-16 08:35:48'),(18,3,18,'1','2025-01-16 08:35:48'),(19,3,19,'1','2025-01-16 08:35:48'),(20,3,20,'1','2025-01-16 08:35:48'),(21,3,21,'1','2025-01-16 08:35:48'),(22,3,22,'1','2025-01-16 08:35:48'),(23,3,23,'1','2025-01-16 08:35:48'),(24,3,24,'1','2025-01-16 08:35:48'),(25,3,25,'1','2025-01-16 08:35:48'),(102,3,97,'0','2025-01-27 20:05:54'),(26,4,1,'1','2025-01-16 08:35:48'),(27,4,2,'1','2025-01-16 08:35:48'),(28,4,3,'1','2025-01-16 08:35:48'),(29,4,4,'1','2025-01-16 08:35:48'),(30,4,5,'1','2025-01-16 08:35:48'),(31,4,6,'1','2025-01-16 08:35:48'),(32,4,7,'1','2025-01-16 08:35:48'),(33,4,8,'1','2025-01-16 08:35:48'),(34,4,9,'1','2025-01-16 08:35:48'),(37,5,18,'1','2025-01-16 08:35:48'),(35,5,26,'1','2025-01-16 08:35:48'),(36,5,27,'1','2025-01-16 08:35:48'),(38,5,28,'1','2025-01-16 08:35:48'),(39,5,29,'1','2025-01-16 08:35:48'),(40,5,30,'1','2025-01-16 08:35:48'),(56,6,20,'1','2025-01-16 08:35:48'),(41,6,31,'1','2025-01-16 08:35:48'),(42,6,32,'1','2025-01-16 08:35:48'),(43,6,33,'1','2025-01-16 08:35:48'),(44,6,34,'1','2025-01-16 08:35:48'),(45,6,36,'1','2025-01-16 08:35:48'),(46,6,37,'1','2025-01-16 08:35:48'),(47,6,38,'1','2025-01-16 08:35:48'),(48,6,39,'1','2025-01-16 08:35:48'),(49,6,40,'1','2025-01-16 08:35:48'),(50,6,41,'1','2025-01-16 08:35:48'),(51,6,42,'1','2025-01-16 08:35:48'),(52,6,43,'1','2025-01-16 08:35:48'),(53,6,44,'1','2025-01-16 08:35:48'),(54,6,45,'1','2025-01-16 08:35:48'),(55,6,46,'1','2025-01-16 08:35:48'),(57,7,47,'1','2025-01-16 08:35:48'),(58,7,48,'1','2025-01-16 08:35:48'),(59,7,49,'1','2025-01-16 08:35:48'),(60,7,50,'1','2025-01-16 08:35:48'),(61,7,51,'1','2025-01-16 08:35:48'),(62,7,52,'1','2025-01-16 08:35:48'),(63,7,53,'1','2025-01-16 08:35:48'),(64,7,54,'1','2025-01-16 08:35:48'),(65,7,55,'1','2025-01-16 08:35:48'),(66,7,56,'1','2025-01-16 08:35:48'),(67,7,57,'1','2025-01-16 08:35:48'),(68,7,58,'1','2025-01-16 08:35:48'),(69,7,59,'1','2025-01-16 08:35:48'),(70,7,60,'1','2025-01-16 08:35:48'),(71,7,61,'1','2025-01-16 08:35:48'),(72,7,62,'1','2025-01-16 08:35:48'),(73,7,63,'1','2025-01-16 08:35:48'),(74,7,64,'1','2025-01-16 08:35:48'),(75,8,65,'1','2025-01-16 08:35:48'),(76,8,66,'1','2025-01-16 08:35:48'),(77,8,67,'1','2025-01-16 08:35:48'),(78,8,69,'1','2025-01-16 08:35:48'),(79,9,70,'1','2025-01-16 08:35:48'),(80,9,71,'1','2025-01-16 08:35:48'),(81,9,72,'1','2025-01-16 08:35:48'),(82,9,73,'1','2025-01-16 08:35:48'),(83,9,74,'1','2025-01-16 08:35:48'),(84,9,75,'1','2025-01-16 08:35:48'),(85,9,76,'1','2025-01-16 08:35:48'),(86,9,77,'1','2025-01-16 08:35:48'),(87,9,78,'1','2025-01-16 08:35:48'),(88,9,79,'1','2025-01-16 08:35:48'),(89,9,80,'1','2025-01-16 08:35:48'),(90,9,81,'1','2025-01-16 08:35:48'),(91,10,82,'1','2025-01-16 08:35:48'),(92,10,83,'1','2025-01-16 08:35:48'),(93,10,84,'1','2025-01-16 08:35:48'),(94,10,85,'1','2025-01-16 08:35:48'),(95,10,86,'1','2025-01-16 08:35:48'),(96,10,87,'1','2025-01-16 08:35:48');
/*!40000 ALTER TABLE `category_vs_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_form`
--

DROP TABLE IF EXISTS `contact_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_form` (
  `id_contact_form` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `mobile_number` bigint(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_contact_form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_form`
--

LOCK TABLES `contact_form` WRITE;
/*!40000 ALTER TABLE `contact_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_vs_product`
--

DROP TABLE IF EXISTS `order_vs_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_vs_product` (
  `id_order_vs_product` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,0) NOT NULL,
  `tax_amount` decimal(10,0) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` decimal(10,0) NOT NULL,
  `product_description` text DEFAULT NULL,
  `product_weight` decimal(10,0) NOT NULL,
  `product_name` varchar(1000) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `subcategory_name` varchar(255) DEFAULT NULL,
  `brand_name` varchar(1000) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `order_total_amount` decimal(10,0) DEFAULT NULL,
  `added_on` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_order_vs_product`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_vs_product`
--

LOCK TABLES `order_vs_product` WRITE;
/*!40000 ALTER TABLE `order_vs_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_vs_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_address_id` int(11) NOT NULL,
  `product_ids` text NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `shipping_method` varchar(45) DEFAULT NULL,
  `shipping_amount` decimal(10,0) DEFAULT NULL,
  `price_amount` decimal(10,0) DEFAULT NULL,
  `order_subtotal` decimal(10,0) DEFAULT NULL,
  `total_amount` decimal(10,0) NOT NULL,
  `status` text NOT NULL,
  `added_on` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-01-21',1,1,'38','1','abc',123,122,150,0,'Active',0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `prod_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `file_name` text NOT NULL,
  `is_active` enum('0','1') NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `data` blob DEFAULT NULL,
  PRIMARY KEY (`prod_img_id`),
  KEY `idx_prodImage_prod_id` (`product_id`),
  CONSTRAINT `idx_prodImage_prod_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,1,'71nTwoiWQIL._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(2,1,'61F1S1V5chL._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(3,1,'61JbOmmHjSL._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(4,2,'81y5M1xVgKL._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(5,2,'81hwM+O36bL._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(6,2,'71uNfJgnrYL._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(7,3,'819cvkE--kL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(8,3,'81qU9HN4E+L._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(9,3,'81OLJHvnAML._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(10,4,'61wt6u4yXEL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(11,4,'71bzRKPLHcL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(12,4,'81tP0fMaJML._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(13,5,'71u2F4bIzXL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(14,5,'71QR6AY4M6L._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(15,5,'611mEARqOnL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(16,5,'612FGLxoQDL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(17,6,'61Tedl8bksL._SX679_.jpg','0','2025-01-16 19:02:12',NULL),(18,6,'71Ce7JmgS6L._SX679_.jpg','0','2025-01-16 19:02:12',NULL),(19,7,'71bBCTIvIIL._SX679_.jpg','0','2025-01-16 19:02:12',NULL),(20,8,'71ai4yZJUgL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(21,8,'51yvHIQUPgL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(22,8,'41xDwVVxTWL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(23,8,'518YeDMbgmL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(24,8,'71Tflh-kCeL._SY879_.jpg','1','2025-01-16 19:02:12',NULL),(25,9,'81E+P0-L1VL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(26,9,'81Paie44TSL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(27,10,'71t2GDCrIbL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(28,10,'81ceMuSihLL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(29,10,'61fsBFww9DL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(30,11,'61-Y-eWXqtL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(31,11,'61Egbtl06bL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(32,11,'51O+exD+3jL._SL1000_.jpg','1','2025-01-16 19:02:12',NULL),(33,12,'61JNbQnIUDL._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(34,12,'417UynCAixL._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(35,13,'81TB5JcEKkL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(36,14,'314BnT0d8FL._SY300_SX300_QL70_FMwebp_.webp','1','2025-01-16 19:02:12',NULL),(37,15,'51TgRks3kIL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(38,15,'61vbnkR36zL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(39,15,'71ricz+ENhL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(40,16,'61e8xgi7jrL._SX679_.jpg','1','2025-01-16 19:02:12',NULL),(41,17,'61N1RFGVVCL._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(42,17,'81oz4DcvD4L._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(43,17,'7135E0xd7xL._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(44,18,'61tslaYWLjL._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(45,18,'51jgG3xLVnL._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(46,18,'51HCGpeU88L._SX522_.jpg','1','2025-01-16 19:02:12',NULL),(47,18,'7163MSZRX3L._SL1500_.jpg','1','2025-01-16 19:02:12',NULL),(48,18,'71NblC5DpxL._SL1500_.jpg','1','2025-01-16 19:02:12',NULL),(108,6,'2025130233959NaN0.png','0','2025-01-30 18:14:03',NULL),(109,6,'2025130233959NaN1.png','0','2025-01-30 18:14:03',NULL),(110,6,'2025130233959NaN2.png','0','2025-01-30 18:14:03',NULL),(111,6,'2025130233959NaN0.png','0','2025-01-30 18:17:56',NULL),(112,6,'2025130233959NaN1.png','0','2025-01-30 18:17:56',NULL),(113,6,'2025130233959NaN2.png','0','2025-01-30 18:17:56',NULL),(114,6,'2025130233959NaN0.png','0','2025-01-30 18:18:58',NULL),(115,6,'2025130233959NaN1.png','0','2025-01-30 18:18:58',NULL),(116,6,'2025130233959NaN2.png','0','2025-01-30 18:18:58',NULL),(117,6,'2025130233959NaN0.png','0','2025-01-30 18:19:49',NULL),(118,6,'2025130233959NaN1.png','0','2025-01-30 18:19:49',NULL),(119,6,'2025130233959NaN2.png','0','2025-01-30 18:19:49',NULL),(120,6,'2025130233959NaN0.png','0','2025-01-30 18:20:57',NULL),(121,6,'2025130233959NaN1.png','0','2025-01-30 18:20:57',NULL),(122,6,'2025130233959NaN2.png','0','2025-01-30 18:20:57',NULL),(123,6,'2025130235130NaN0.png','0','2025-01-30 18:21:30',NULL),(124,6,'2025130235130NaN1.png','0','2025-01-30 18:21:30',NULL),(125,6,'2025130235215NaN0.png','0','2025-01-30 18:22:15',NULL),(126,6,'2025130235215NaN1.png','0','2025-01-30 18:22:15',NULL),(127,6,'2025130235215NaN2.png','0','2025-01-30 18:22:15',NULL),(128,6,'2025130235343NaN0.png','0','2025-01-30 18:23:43',NULL),(129,6,'2025130235343NaN1.png','0','2025-01-30 18:23:43',NULL),(130,6,'2025130235419NaN0.png','0','2025-01-30 18:24:19',NULL),(131,6,'2025130235419NaN1.png','0','2025-01-30 18:24:19',NULL),(132,6,'20252301735NaN0.png','0','2025-02-02 18:47:35',NULL),(133,6,'20252301735NaN1.png','0','2025-02-02 18:47:35',NULL),(134,6,'20252301735NaN2.png','0','2025-02-02 18:47:35',NULL),(135,6,'20252301827NaN0.png','0','2025-02-02 18:48:28',NULL),(136,6,'20252301827NaN1.png','0','2025-02-02 18:48:28',NULL),(137,6,'20252301827NaN2.png','0','2025-02-02 18:48:28',NULL),(138,6,'20252301924NaN0.png','1','2025-02-02 18:49:24',NULL),(139,6,'20252301924NaN1.png','1','2025-02-02 18:49:24',NULL);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_mapping`
--

DROP TABLE IF EXISTS `product_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_mapping` (
  `product_mapping_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`product_mapping_id`),
  UNIQUE KEY `uniqueIndex` (`product_id`,`brand_id`,`category_id`,`sub_category_id`,`is_active`),
  KEY `idx_mapping_prod_id` (`product_id`),
  KEY `idx_mapping_brand_id` (`brand_id`),
  KEY `idx_mapping_cat_id` (`category_id`),
  KEY `idx_mapping_sub_cat_id` (`sub_category_id`),
  CONSTRAINT `idx_mapping_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `idx_mapping_cat_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `idx_mapping_prod_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `idx_mapping_sub_cat_id` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`sub_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_mapping`
--

LOCK TABLES `product_mapping` WRITE;
/*!40000 ALTER TABLE `product_mapping` DISABLE KEYS */;
INSERT INTO `product_mapping` VALUES (1,1,3,2,1,'2025-01-16 19:14:11','1'),(2,2,5,2,1,'2025-01-16 19:14:11','1'),(3,3,6,2,1,'2025-01-16 19:14:11','1'),(4,4,1,2,2,'2025-01-16 19:14:11','1'),(5,5,7,2,2,'2025-01-16 19:14:11','1'),(6,6,8,2,2,'2025-01-16 19:14:11','1'),(7,7,9,2,3,'2025-01-16 19:14:11','1'),(8,8,10,2,3,'2025-01-16 19:14:11','1'),(9,9,1,2,3,'2025-01-16 19:14:11','1'),(10,10,11,2,4,'2025-01-16 19:14:11','1'),(11,11,2,2,4,'2025-01-16 19:14:11','1'),(12,12,12,2,5,'2025-01-16 19:14:11','1'),(13,13,3,2,5,'2025-01-16 19:14:11','1'),(14,14,13,2,6,'2025-01-16 19:14:11','1'),(15,15,14,2,7,'2025-01-16 19:14:11','1'),(16,16,15,2,8,'2025-01-16 19:14:11','1'),(17,17,16,2,9,'2025-01-16 19:14:11','1'),(18,18,17,2,9,'2025-01-16 19:14:11','1');
/*!40000 ALTER TABLE `product_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(1000) NOT NULL,
  `product_description` text NOT NULL,
  `price` float NOT NULL,
  `weight` float NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `edited_on` timestamp NULL DEFAULT NULL,
  `is_featured` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'ZEB-SD52 SSD 512GB, SATA II and SATA III Interface, QLC, Silent Operation','About this itemFaster performance, Smart & Silent operation512GB, Ultra low power consumptionFlash Interface QLCSequential Read Speed 550MB/s Sequential Write Speed 480MB/s',2099,40,'1','2025-01-16 18:41:06',NULL,'1'),(2,'FRONTECH 775/1155 CPU Cooling Fan with Universal Socket & Heat Sink for Better Air Circulation, Super Silent, De-Vibrating, HS Sunflower Design, (CPF-0002, Black)','Give your PC a way to ventilate hot air and keep air flow for a cooled system. Fan speed 3000 RPM. Max Airflow. 55 CFM.Make your CPU cooler with this super cooling fan. It creates a flow of air that pushes heat out of your system preventing any overheating.An easy to install application that gets attached to your PC’s CPU effortlessly. With a sunflower design that also improves the looks of your frame.Dissipate heat effectively with more air flow and less heat present. Helps you perform heavy tasks without damaging any internal parts.The super silent performance with de-vibration helps you perform your task in peace.',239,15,'1','2025-01-16 18:41:06',NULL,'1'),(3,'Galaxy Microsystems Ltd., Galaxy Microsystems Ltd., Hong Kong, Kowloon Bay, Wang Chiu Rd, 33, Exchange Tower, Room 1601, 16th Floor','Advanced Cooling System: Equipped with 4 vibrant RGB cooling fans and a high-performance mesh front panel for superior airflow, ensuring optimal cooling efficiency even during intense gaming sessions.Crystal-Clear Display: The innovative hinged magnetic tempered glass door provides a clear view of your PC\'s components, showcasing your high-performance hardware in style.Enhanced Connectivity: Features 1x USB 3.0, 2x USB 2.0 ports, alongside dedicated 3.5mm microphone and headphone jacks for seamless connectivity. Includes a convenient reset button and a responsive power button for easy operation.Versatile Liquid Cooling Support: Supports various liquid cooling configurations including front (240mm/280mm/360mm), top (240mm/280mm), and rear (120mm), enabling you to unleash the full potential of advanced cooling solutions for overclocking and intensive tasks.Spacious Interior Design: Offers ample room to accommodate ATX, M-ATX, and ITX motherboards, ensuring compatibility with a wide range of gaming setups and hardware configurations.Optimized Graphics Card Compatibility: Supports graphics cards up to 330mm in length, allowing you to install the latest high-performance GPUs without compromise.Sleek and Modern Aesthetic: Boasts a minimalist design with clean lines, adding a sophisticated touch to your gaming rig while complementing any gaming environment.',3379,4300,'1','2025-01-16 18:41:06',NULL,'1'),(4,'HP All-in-One PC, Windows 11 Home, Intel Processor N200, 21.45-Inch (54.5 Cm), FHD, Intel UHD Graphics, 720P HD Camera W/Privacy Shutter, Dual Speakers (Win 11, White, 4.17 Kg), Dg0154In','4-core Intel Processor N200 Experience reliable performance with a processor that features 4 threads and 6MB L3 cache for smooth multitasking and fast processing.Intel UHD graphics Enjoy immersive visuals with Intel UHD graphics. Perfect for both work and entertainment, it delivers crystal-clear images for an enhanced viewing experience.Substantial memory and storage The 8GB DDR5 RAM ensures efficient multitasking, while the 512GB PCIe NVMe SSD provides ample storage space for all your files and applications.Micro-edge display Immerse yourself in the 21.45\" FHD, anti-glare, and micro-edge display. Experience vivid colors and sharp details with 99% sRGB for an unforgettable viewing experience.Seamless connectivity Stay connected with Wi-Fi 6 (1x1) and Bluetooth 5.3. It also features 1 x USB Type-C, 4 x USB Type-A, 1 x RJ-45, and 1 x HDMI-out 1.4 port for easy connectivity.HD Conferencing The HP True Vision 720p HD camera with temporal noise reduction ensures clear video calls. The dual speakers offer high-quality audio for an improved conferencing experience.Why HP Choose HP, India\'s No.1 PC brand, for cutting-edge technology, robust performance, and reliable service. Enjoy peace of mind with HP\'s extensive network of service centers.',30990,4170,'1','2025-01-16 18:41:06',NULL,'0'),(5,'Lenovo IdeaCentre AIO 13th Gen Core i3-1315U 27\" FHD IPS (8GB RAM/512GB SSD/Windows11/MS Office 2021/3Wx2 Harman Speakers/Alexa Built-in/Wireless Keyboard & Mouse, Grey), F0HM00G4IN All-in-One Desktop','Processor: Intel Core i3-1315U | Speed: Base 1.2Ghz, Max 4.5Ghz, E-Core 0.9/3.3Ghz | 6 Cores | 8 Threads | 10MB CacheOS: Pre-Loaded Windows 11 Home with Lifetime Validity | Office Home & Student 2021Memory and Storage: 1x8GB DDR5-5200 RAM, Two DDR5 SO-DIMM slots, dual-channel capable, Up to 32GB DDR5-5200 | Storage: 512GB SSD M.2 2280 PCIe 4.0x4 NVMe || Graphics: Integrated Intel UHD GraphicsDisplay: 27-inch Full HD IPS (1920x1080) | Brightness: 300 nits | IPS Display | Anti Glare | 99% sRGB | 3-side borderless, hardware low blue light, Non-TouchCamera:- 5.0 MP | Speakers:- 3Wx2, HARMAN',49490,7100,'1','2025-01-16 18:41:06',NULL,'1'),(6,'Apple 2023 iMac (24-inch, Apple M3 chip with 8?core CPU and 8?core GPU, 8GB Unified Memory, 256GB) - Silver','<p>SUPERCHARGED BY M3 ? Get more done faster with a next-generation chip from Apple. From creating presentations to gaming, you?ll fly through work and play.FITS PERFECTLY IN YOUR SPACE ? The all-in-one desktop design is strikingly thin, comes in vibrant colours and becomes the centrepiece of any room.IMMERSIVE DISPLAY ? The 60.96 cm (24?) 4.5K Retina display features 500 nits of brightness and support for one billion colours. Everything from streaming movies to editing photos is sharp and colourful.ADVANCED CAMERA AND AUDIO ? Look and sound your best with a 1080p FaceTime HD camera, a studio-quality three-mic array and a six-speaker sound system with Spatial Audio.WORKS WITH YOUR FAVOURITE APPS ? All your go-to apps run lightning fast ? including Microsoft 365, Adobe Creative Cloud and Zoom. You can even run many of your favourite iPhone and iPad apps directly on your iMac.WORKS WITH ALL YOUR APPLE DEVICES ? You can do amazing things when you use your Apple devices together. Copy something on iPhone and paste it on iMac. Use your iMac to answer FaceTime calls or send texts with Messages. And that?s just the beginning.MAGIC ACCESSORIES INCLUDED ? iMac comes with a colour-matched Magic Mouse and Magic Keyboard.</p>',119990,4480,'1','2025-01-16 18:41:06',NULL,'0'),(7,'Sandisk 1TB Portable SSD, 800MB/s R, USB 3.2 Gen 2, Rugged SSD with Upto 2 Meter Drop Protection, Type-C to Type-A Cable, PC & Mac Compatible, 3 Y Warranty, External SSD (SDSSDE30-1T00-G26)','Get fast solid state performance with 800MB/s read speeds in a portable driveBack up your content and memories on a storage solution that fits seamlessly into your mobile lifestyleTake it with you on your adventures—up to two-meter drop protection means this durable drive can take a beatingSecure it to your belt loop or backpack for extra peace of mind thanks to the tough rubber hookFrom SanDisk, a brand professional photographers trust to take on assignments',6997,40.8,'1','2025-01-16 18:41:06',NULL,'0'),(8,'SAMSUNG EVO Plus 256GB Micro w/SD Adaptor SDXC, Up-to 160MB/s, Expanded Storage for Gaming Devices, Android Tablets and Smart Phones, Memory Card, MB-MC256SA/IN','FAST AND SMOOTH: With speeds of up to 160 MB/s, you can store, save, and share instantly. Even with huge files, EVO Plus is incredibly quick with superfast U3, Class 10 rated transfer speeds of up to 160MB/s; Big apps load and run smoothly, while 4K video remains sharp with A2, V30, and UHS-I Interface**ALL THE SPACE YOU NEED: Enhanced speed + compatibility = dependable performance; EVO Plus + Adapter lets you load games to your console, or download more apps on your tablet; Top-notch speed makes transfers seamless and reliable*EXPAND AND STORE BIG: Options available from 64GB to a 1TB. choose your EVO Plus and expand your capacity for hi-resolution images and 4K video files.; With so many sizes select the perfect capacity for all your memories***d 4K video files.YOU\'RE FULLY PROTECTED: The EVO Plus takes on life’s adventures with water, temperature, X-ray, magnet, drop, and wearout protection; Your experiences are irreplaceable and deserves reliable storage, backed by a 10-year limited warranty****WORLD\'S NO. 1 FLASH MEMORY BRAND: Performance and reliability you can count on from the world\'s number one brand for flash memory since 2003;***** All firmware and components are produced in-house, including our world-renowned DRAM and NAND, for quality you can trust',1748,50,'1','2025-01-16 18:41:06',NULL,'0'),(9,'HP x796w 256GB USB 3.2 Flash Drive','[Storage] : Offers a mobile storage solution to store and share your music, photos, les and more.[Design] : Durable metal casing. It is ideal as external storage.',2399,14,'1','2025-01-16 18:41:06',NULL,'0'),(10,'ASUS Vivobook 16\" FHD+ (1920 X 1200), 60Hz 300Nits, Core i5-12500H, (16GB RAM/512GB SSD/Intel Iris X? Graphics/Win 11/Office Home/Fingerprint/42Whr Battery/Transparent Silver/1.88Kg), X1605ZAC-MB541WS','Processor : Intel Core i5-12500H Processor 2.5 GHz (18M Cache, up to 4.5 GHz, 4P+8E cores) Perfect for multitasking and entertainmentMemory : 16GB DDR4 RAM| Storage : 512GB M.2 NVMe PCIe 4.0 SSDGraphics : Intergrated Intel Iris Xᵉ GraphicsDisplay :16.0-inch, WUXGA (1920 x 1200) 16:10 aspect ratio, 60Hz refresh rate, 300nits Brightness| Keyboard : Backlit Chiclet KeyboardBattery : 42WHrs, 3S1P, 3-cell Li-ionI/O Ports : 1x USB 2.0 Type-A, 1x USB 3.2 Gen 1 Type-C, 2x USB 3.2 Gen 1 Type-A, 1x HDMI 1.4, 1x DC-inAudio : 1x 3.5mm Combo Audio Jack, Webcam : 720p HD camera with privacy shutter, Mic : Built-in array microphoneOn Board Wireless : Wi-Fi 5(802.11ac) (Dual band) 1*1 + Bluetooth 5.1 Wireless Card (*Bluetooth version may change with OS version different.)',51990,188,'1','2025-01-16 18:41:06',NULL,'0'),(11,'Dell 15 [Smartchoice] Intel Core i3-1215U Processor, 12th Gen (8GB RAM/512GB SSD/FHD/Window 11/MS Office\' 21/15\"(38 cm) Display/15 Month McAfee/Black/1.69kg Thin & Light Laptop','Processor: Intel Core i3-1215U 12th Generation (up to 4.40 GHz, 10MB 6 Cores)RAM & Storage: 8 GB, 1 x 8 GB, DDR4, 2666 MHz, (2 DIMM Slots, Expandable up to 16GB) & 512GB SSDSoftware: Pre-Loaded Windows 11 Home with Lifetime Validity | MS Office Home and Student 2021 with lifetime validity| McAfee Multi-Device Security 15-month subscriptionGraphics & Keyboard: Integrated Onboard Graphics & Standard Keyboard // Display: 15.6\" FHD WVA AG 120Hz 250 nits Narrow BorderPorts: 2 USB 3.2 Gen 1 ports, 1 USB 2.0 port, 1 Headset jack, 1 HDMI 1.4 port, 1 SD 3.0 card slot, 1 Flip-Down RJ-45 port 10/100/1000 Mbps',33990,1690,'1','2025-01-16 18:41:06',NULL,'0'),(12,'LG UltraWide 29 inch (73 cm) IPS FHD, 2560x1080 Pixels, Color Calibrated, 100Hz, 7W x 2 Inbuilt Speaker, USB-C, Display Port, HDMI, White Color-29WQ600','Display: 29 inch (73cm) 21:9 UltraWide IPS FHD (2560 x 1080) , sRGB 99%, Color Calibrated, HDR10Connectivity: USB-C, Display Port , HDMI Port, Headphone outGaming Features: 100hz Refresh rate, Motion Blur Reduction , AMD FreeSync, Black StablizerSpecial Feature : Inbuilt Speaker 7W x 2 with Max Audio, Tilt Adjustment, White ColorWarranty: 3 Years Parts and Labour',16999,4500,'1','2025-01-16 18:41:06',NULL,'0'),(13,'ZEBRONICS New Launch N24A 24\"(60.4 cm) Gaming Monitor, FHD 1920x1080, IPS-Antiglare Display, 280Nits, 180Hz, 1ms MPRT, HDR10, 99% sRGB, Adaptive Sync, 1 x DP | 1 x HDMI | 1 x 3.5mm','Anti-glare screen: The 60.4cm screen of the ZEB-N24A is treated with an anti-glare coating, which reduces reflections and minimizes eye strain during prolonged gaming sessions.Built-in Speakers: Equipped with built-in speakers, the ZEB-N24A offers a convenient audio solution without the need for external speakers.Bezel-Less Design: The ZEB-N24A boasts a sleek, bezel-less design, providing an expansive viewing area that enhances the sense of immersion. Its 16:9 aspect ratio offers a wider viewing experience.Refresh Rate: The monitor\'s 180Hz refresh rate and 1ms MPRT ensure smooth gameplay with reduced motion blur and more frames per second.High-resolution: The monitor\'s IPS display and Full HD 1920x1080 resolution deliver sharp, clear visuals, offering an ideal balance between performance and quality for gaming.Brightness: The ZEB-N24A offers 280 nits of brightness and supports HDR10 for enhanced contrast and a broader color range.Connectivity: The ZEB-N24A features one DisplayPort, one HDMI port, and a headphone jack, providing flexible connectivity.',7998,2750,'1','2025-01-16 18:41:06',NULL,'0'),(14,'D-Link DIR-825 |1200Mbps Dual Band Wi-Fi Router| Speeds 2.4 GHz up to 300Mbps & 5 GHz up to 867Mbps | Gigabit Ethernet Ports | High-Gain Antennas | Easy Setup |MTCTE Certified','AC 1200 Mbps WAVE 2 Concurrent dual band wireless Router with 4 High gain Omni Antenna802.11 a/b/g/n/ac standards with speed of 300 Mbps on 2.4Ghz & 867 Mbps on 5GhzGigabit Ports -- One Gigabit WAN & Four Gigabit LAN ports for high speed wired connectivity.MU-MIMO -- MU-MIMO, which transmits data to multiple wireless devices simultaneously to increase speed and efficiencyMultiple Operating modes: Router mode : to access the internet. Access Point mode : to extend wired network over wireless .Repeater mode : to extend the range of existing wireless router.Easy Setup: Super simple set-up with the D-Link Assistant Mobile APP Or with intuitive WEB GUI setup wizard',1699,1040,'1','2025-01-16 18:41:06',NULL,'0'),(15,'Canon Pixma MG2577s All-in-One Inkjet Colour Printer (Blue/White)','Printer Type - Inkjet; Functionality - All-in-One (Print, Scan, Copy), Scanner type - Flatbed ; Printer Output - ColourConnectivity - USB ; Compatibility - Windows XP or newer and Mac OS X v10.7.5 or newerPages per minute - 8 pages (Black), 4 pages (Colour) ; Cost per page - Rs 5.3 (Black & White), Rs 7.8 (Colour) - As per ISO standardsIdeal usage - Home & Small Office, Low usage ( less than 100 pages per month)Page size supported - 4.0\"x6.0\" till A4 / Letter / Legal ; Duplex Print - Manual ; Print resolution - 4800x600Compatible Ink Cartridge - PG-745 (Black), CL-746 (Colour) ; Page Yield - 180 pages ; Includes 1 Black and 1 Colour cartridge in the boxWarranty Details: 1 year manufacturer warranty from the date of purchase',2899,4800,'1','2025-01-16 18:41:06',NULL,'0'),(16,'Epson Perfection V39 Scanner','4800 x 4800 dpi scanningUSB poweredBuilt-in kickstandDetachable lidEasy Photo ScanWith Epson Easy Photo Fix software, improve the quality of your scans by removing dust, restoring faded colours and correcting backlight',5349,1200,'1','2025-01-16 18:41:06',NULL,'0'),(17,'Xiaomi Pad 6| Qualcomm Snapdragon 870| Powered by HyperOS |144Hz Refresh Rate| 8GB, 256GB| 2.8K+ Display (11-inch/27.81cm) Tablet| Dolby Vision Atmos| Quad Speakers| Wi-Fi| Gray','Snapdragon 870 Octa-Core Processor | Adreno 650 | Qualcomm AI engine | LPDDR5 RAM | UFS 3.1 | Up to 8GB RAM144Hz 7-Stage Refresh Rate | 27.9cm(11) Display Tablet | 2.8K Resolution | 1 Billion Colors | 2880*1800 High ResolutionQuad Speakers with Dolby Atmos | Long Lasting 8840mAh Battery | Android 13 | MIUI 14 with Android & Security Updates8MP Front Camera with Focus Frame | 13MP Rear Camera | Metal Unibody Design',21999,1700,'1','2025-01-16 18:41:06',NULL,'0'),(18,'OnePlus Pad 2(12.1 Inch)LCD Display,12GB RAM, 256GB Storage,Snapdragon 8 Gen 3,144Hz Refresh Rate,Dolby Vision & Atmos,Open Canvas,AI features,6 speakers,Wi-Fi with Cellular Data Sharing [Nimbus Gray]','[Display]: 3K+ Display (30.73cm), 7:5 ReadFit ratio; Display type: IPS LCD; Display resolution: 3000x2120 Dolby Vision display, 304 PPI; Peak Display brightness (900 nits); Screen refresh rate: 144Hz.[AI-enhanced Productivity]: AI Eraser 2.0 to remove unwanted objects in photos, Smart Cutout to quickly create stickers, & the AI Toolbox set of features like AI Summary & AI Writer.[Design & Storage]: 12GB RAM+ 256GB storage. All-metal unibody seamless design for lasting beauty and durability. Anodization enhances durability, ensuring a scratch-free look.[Processor]: Snapdragon 8 Gen 3 is one of the fastest SoC in the smartphone industry, and with stable diffusion. The upgraded Qualcomm Adreno GPU yields 25% faster graphics rendering and 25% improved GPU power efficiency, enhancing gaming and streaming[Speakers]: Equipped with 6 speakers (3 on each side), it delivers a more impactful bass effect, clearer high-frequency performance, and a more immersive stereo sound experience.[Battery & Charging]: 9510mAh Battery with 67W SUPERVOOC fast charging which can fully charge the Pad 2 in just 80 minutes.[Camera]: Front 8MP & Rear 13MP cameras which clearly capture memorable moments, scan files/documents easily along with lots of AI features',40999,1710,'1','2025-01-16 18:41:06',NULL,'0'),(41,'adjskdhgsh djahs djsag djahs djgsa j 123','<p>sadasdsad asdas d asd asd 123</p>',100,200,'1','2025-01-30 10:07:55',NULL,'0'),(42,'adjskdhgsh djahs djsag djahs djgsa j','<p>asdasd</p>',100,200,'1','2025-01-30 17:27:13',NULL,'0'),(43,'adjskdhgsh djahs djsag djahs djgsa j','<p>sdasdasd</p>',100,200,'1','2025-01-30 18:08:42',NULL,'0');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_review`
--

DROP TABLE IF EXISTS `rating_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `message` text NOT NULL,
  `added_on` datetime NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_review`
--

LOCK TABLES `rating_review` WRITE;
/*!40000 ALTER TABLE `rating_review` DISABLE KEYS */;
INSERT INTO `rating_review` VALUES (1,1,38,1,4,'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.','2025-01-21 00:00:00','Active');
/*!40000 ALTER TABLE `rating_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_category` (
  `sub_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_category_name` varchar(255) NOT NULL,
  `sub_category_value` varchar(255) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` enum('0','1') NOT NULL,
  PRIMARY KEY (`sub_category_id`),
  UNIQUE KEY `sub_category_name` (`sub_category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category`
--

LOCK TABLES `sub_category` WRITE;
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` VALUES (1,'Components','','2025-01-16 08:23:31','1'),(2,'Desktops','','2025-01-16 08:23:31','1'),(3,'External Devices & Data Storage','','2025-01-16 08:23:31','1'),(4,'Laptops','','2025-01-16 08:23:31','1'),(5,'Monitors','','2025-01-16 08:23:31','1'),(6,'Networking Devices','','2025-01-16 08:23:31','1'),(7,'Printers, Inks & Accessories','','2025-01-16 08:23:31','1'),(8,'Scanners','','2025-01-16 08:23:31','1'),(9,'Tablets','','2025-01-16 08:23:31','1'),(10,'Mobile Accessories','','2025-01-16 08:23:31','1'),(11,'Data Cards & Dongles','','2025-01-16 08:23:31','1'),(12,'Smartphones & Basic Mobiles','','2025-01-16 08:23:31','1'),(13,'Smart Watches','','2025-01-16 08:23:31','1'),(14,'Home Cinema, TV & Video Accessories','','2025-01-16 08:23:31','1'),(15,'AV Receivers & Amplifiers','','2025-01-16 08:23:31','1'),(16,'DVD Players & Recorders','','2025-01-16 08:23:31','1'),(17,'Home Theater Systems','','2025-01-16 08:23:31','1'),(18,'Media Streaming Devices','','2025-01-16 08:23:31','1'),(19,'Portable DVD & Blu-ray Players','','2025-01-16 08:23:31','1'),(20,'Home Cinema Projectors','','2025-01-16 08:23:31','1'),(21,'Satellite Dishes','','2025-01-16 08:23:31','1'),(22,'Satellite TV Dish Equipment','','2025-01-16 08:23:31','1'),(23,'Home Cinema Speakers','','2025-01-16 08:23:31','1'),(24,'Televisions','','2025-01-16 08:23:31','1'),(25,'TV Receivers','','2025-01-16 08:23:31','1'),(26,'Hi-Fi & Home Audio Accessories','','2025-01-16 08:23:31','1'),(27,'Hi-Fi Compact Stereo Systems','','2025-01-16 08:23:31','1'),(28,'Radios & Boomboxes','','2025-01-16 08:23:31','1'),(29,'Receivers & Separates','','2025-01-16 08:23:31','1'),(30,'Hi-Fi & Home Audio Speakers','','2025-01-16 08:23:31','1'),(31,'Camera & Photo Accessories','','2025-01-16 08:23:31','1'),(32,'Action Cameras','','2025-01-16 08:23:31','1'),(33,'Binoculars, Telescopes & Optics','','2025-01-16 08:23:31','1'),(34,'Cases & Bags for Camera & Photo','','2025-01-16 08:23:31','1'),(35,'Digital Cameras','','2025-01-16 08:23:31','1'),(36,'Film Scanners','','2025-01-16 08:23:31','1'),(37,'Film Cameras','','2025-01-16 08:23:31','1'),(38,'Camera Flashes','','2025-01-16 08:23:31','1'),(39,'Camcorder & Camera Lenses','','2025-01-16 08:23:31','1'),(40,'Photo Printers','','2025-01-16 08:23:31','1'),(41,'Photo Studio & Lighting','','2025-01-16 08:23:31','1'),(42,'Security Cameras','','2025-01-16 08:23:31','1'),(43,'Simulated Cameras','','2025-01-16 08:23:31','1'),(44,'Slide Photo Viewers','','2025-01-16 08:23:31','1'),(45,'Underwater Video & Photography','','2025-01-16 08:23:31','1'),(46,'Video Cameras','','2025-01-16 08:23:31','1'),(47,'Adapters','','2025-01-16 08:23:31','1'),(48,'Webcams & VoIP Equipment','','2025-01-16 08:23:31','1'),(49,'Blank Media','','2025-01-16 08:23:31','1'),(50,'Blank Media Cases & Wallets','','2025-01-16 08:23:31','1'),(51,'Cables & Accessories','','2025-01-16 08:23:31','1'),(52,'Hard Disk Bags','','2025-01-16 08:23:31','1'),(53,'Hard Drive Accessories','','2025-01-16 08:23:31','1'),(54,'Keyboards, Mice & Input Devices','','2025-01-16 08:23:31','1'),(55,'KVM Switches','','2025-01-16 08:23:31','1'),(56,'Laptop Accessories','','2025-01-16 08:23:31','1'),(57,'Media Storage Sleeves','','2025-01-16 08:23:31','1'),(58,'Monitor Accessories','','2025-01-16 08:23:31','1'),(59,'Office Equipment Cleaners','','2025-01-16 08:23:31','1'),(60,'PC Gaming Peripherals','','2025-01-16 08:23:31','1'),(61,'Tablet Accessories','','2025-01-16 08:23:31','1'),(62,'Uninterrupted Power Supplies','','2025-01-16 08:23:31','1'),(63,'USB Gadgets','','2025-01-16 08:23:31','1'),(64,'USB Hubs','','2025-01-16 08:23:31','1'),(65,'Electronics','','2025-01-16 08:23:31','1'),(66,'Home & Kitchen','','2025-01-16 08:23:31','1'),(67,'Home Improvement','','2025-01-16 08:23:31','1'),(68,'Industrial & Scientific','','2025-01-16 08:23:31','1'),(69,'Sports, Fitness & Outdoors','','2025-01-16 08:23:31','1'),(70,'DJ & VJ Equipment','','2025-01-16 08:23:31','1'),(71,'Drums & Percussion','','2025-01-16 08:23:31','1'),(72,'General Music-Making Accessories','','2025-01-16 08:23:31','1'),(73,'Guitars, Basses & Gear','','2025-01-16 08:23:31','1'),(74,'Karaoke Equipment','','2025-01-16 08:23:31','1'),(75,'Microphones','','2025-01-16 08:23:31','1'),(76,'PA & Stage','','2025-01-16 08:23:31','1'),(77,'Piano & Keyboard','','2025-01-16 08:23:31','1'),(78,'Recording & Computer','','2025-01-16 08:23:31','1'),(79,'String Instruments','','2025-01-16 08:23:31','1'),(80,'Synthesisers, Samplers & Digital Instruments','','2025-01-16 08:23:31','1'),(81,'Wind Instruments','','2025-01-16 08:23:31','1'),(82,'Calendars, Planners & Personal Organisers','','2025-01-16 08:23:31','1'),(83,'Envelopes & Postal Supplies','','2025-01-16 08:23:31','1'),(84,'Furniture & Lighting','','2025-01-16 08:23:31','1'),(85,'Office Electronics','','2025-01-16 08:23:31','1'),(86,'Office Paper Products','','2025-01-16 08:23:31','1'),(87,'Office Supplies','','2025-01-16 08:23:31','1'),(88,' Wind Instruments','','2025-01-21 10:18:19','1'),(97,'Testing','','2025-01-27 20:00:39','1');
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vs_address`
--

DROP TABLE IF EXISTS `user_vs_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_vs_address` (
  `id_user_vs_address` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `address_line_1` varchar(1000) DEFAULT NULL,
  `address_line_2` text DEFAULT NULL,
  `taluka` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `updated_on` datetime DEFAULT NULL,
  `address_type` enum('home','work','other') DEFAULT NULL,
  PRIMARY KEY (`id_user_vs_address`),
  KEY `user_vs_address_user_id_idx` (`user_id`),
  CONSTRAINT `user_vs_address_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vs_address`
--

LOCK TABLES `user_vs_address` WRITE;
/*!40000 ALTER TABLE `user_vs_address` DISABLE KEYS */;
INSERT INTO `user_vs_address` VALUES (1,1,'Nandanvan Colony, Ganesh Colony Road','Near Sabji Mandi, Back to HP Petrol pump, Chandraprabha Colony Road','Jalgaon','Jalgaon','Maharashtra',425001,'1','2025-01-28 19:21:15',NULL,NULL),(2,1,'CT Survey No 51/IA, NF No 6 Plot No 14,','NH 6, near Bus Stop, Shiv Colony','Dharangaon','Jalgaon','Maharashtra',433021,'1','2025-01-28 19:43:30',NULL,NULL);
/*!40000 ALTER TABLE `user_vs_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vs_category`
--

DROP TABLE IF EXISTS `user_vs_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_vs_category` (
  `user_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_cat_id`),
  UNIQUE KEY `user_id` (`user_id`,`category_id`,`is_active`) USING BTREE,
  KEY `caegoryCheck` (`category_id`),
  CONSTRAINT `caegoryCheck` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `userCheckCat` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vs_category`
--

LOCK TABLES `user_vs_category` WRITE;
/*!40000 ALTER TABLE `user_vs_category` DISABLE KEYS */;
INSERT INTO `user_vs_category` VALUES (41,1,6,'2025-01-31 06:46:44','1'),(42,1,7,'2025-01-31 06:46:44','0'),(43,1,10,'2025-01-31 06:46:44','1'),(44,1,8,'2025-01-31 06:46:44','1'),(45,1,14,'2025-01-31 06:56:58','1');
/*!40000 ALTER TABLE `user_vs_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vs_email`
--

DROP TABLE IF EXISTS `user_vs_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_vs_email` (
  `user_vs_email_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `is_active` enum('1','0') NOT NULL DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`user_vs_email_id`),
  UNIQUE KEY `idx_unique_email_user` (`user_id`,`email_id`,`is_active`),
  CONSTRAINT `user_vs_email_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vs_email`
--

LOCK TABLES `user_vs_email` WRITE;
/*!40000 ALTER TABLE `user_vs_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_vs_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vs_notification`
--

DROP TABLE IF EXISTS `user_vs_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_vs_notification` (
  `id_user_vs_notification` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `is_active` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_user_vs_notification`),
  UNIQUE KEY `unique` (`user_id`,`email_id`,`is_active`),
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vs_notification`
--

LOCK TABLES `user_vs_notification` WRITE;
/*!40000 ALTER TABLE `user_vs_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_vs_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vs_registration_code`
--

DROP TABLE IF EXISTS `user_vs_registration_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_vs_registration_code` (
  `id_user_registration_code` int(11) NOT NULL AUTO_INCREMENT,
  `registration_code` int(6) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp(),
  `expiry_time` int(11) DEFAULT 180,
  `mobile_number` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_resend` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id_user_registration_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vs_registration_code`
--

LOCK TABLES `user_vs_registration_code` WRITE;
/*!40000 ALTER TABLE `user_vs_registration_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_vs_registration_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vs_verification_code`
--

DROP TABLE IF EXISTS `user_vs_verification_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_vs_verification_code` (
  `id_user_verification_code` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `verification_code` int(6) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp(),
  `expiry_time` int(11) DEFAULT NULL,
  `mobile_number` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_resend` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id_user_verification_code`),
  KEY `userVerification_idx` (`user_id`),
  CONSTRAINT `userVerification` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vs_verification_code`
--

LOCK TABLES `user_vs_verification_code` WRITE;
/*!40000 ALTER TABLE `user_vs_verification_code` DISABLE KEYS */;
INSERT INTO `user_vs_verification_code` VALUES (4,1,617147,'2025-01-31 11:27:11',0,7387414778,NULL,'0'),(5,1,161109,'2025-01-31 11:39:27',0,7387414778,NULL,'0'),(6,1,367437,'2025-01-31 11:49:48',0,7387414778,NULL,'0'),(7,1,538665,'2025-01-31 11:50:18',2147483647,7387414778,NULL,'0');
/*!40000 ALTER TABLE `user_vs_verification_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `mobile_number` bigint(20) NOT NULL,
  `gender` enum('male','female','transgender') NOT NULL,
  `profile_photo` text DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL,
  `mobile_verified` enum('0','1') NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp(),
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `mobile_number` (`mobile_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nitin','Prakash','123',7387414778,'male','default.png','1','1','2024-12-09 21:06:11','Pune','Maharashtra',442244),(2,'Aditya','Patil','admin',7387414773,'male','default.png','1','1','2025-01-21 00:00:00',NULL,NULL,NULL);
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

-- Dump completed on 2025-02-13  0:59:18
