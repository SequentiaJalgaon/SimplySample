-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2025 at 10:42 AM
-- Server version: 5.7.23-23
-- PHP Version: 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zecciunm_simplysample`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `login_name` varchar(20) NOT NULL DEFAULT '',
  `login_id` varchar(20) NOT NULL DEFAULT '',
  `login_password` varchar(60) NOT NULL DEFAULT '',
  `login_role` varchar(20) DEFAULT NULL,
  `login_photo` varchar(200) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `login_name`, `login_id`, `login_password`, `login_role`, `login_photo`, `status`) VALUES
(1, 'Administrator', 'admin', '$2y$10$SCtnP5em2ThfCKPc8a/5gOcqeXsBuDI.8DIZPEtc1HvWdLqD29mUG', 'ADMIN', 'default.png', 'Active'),
(2, 'Administrator', 'superadmin', '$2y$10$VZxSraF5hTG7Pok41sQane9qEWYcp5UrmITNVF8XhvMkM8cohxxcK', 'ADMIN', 'default.png', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE `audit_trail` (
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_key_id` int(11) NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_trail`
--

INSERT INTO `audit_trail` (`id`, `timestamp`, `entity`, `entity_key_id`, `action`, `description`) VALUES
(1, '2024-12-09 15:39:56', 'Category', 1, 'INSERT', 'category_id: 1, category_name: Testing Category1, is_active: 1, added_on: 2024-12-09 20:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_on` datetime NOT NULL,
  `status` enum('Pending','Approved','OnBoarded','Rejected') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `is_active`, `added_on`, `edited_on`, `status`) VALUES
(1, 'HP', '1', '2025-01-02 12:49:38', '2025-02-18 14:25:03', 'Approved'),
(2, 'DELL', '1', '2025-01-09 13:12:32', '0000-00-00 00:00:00', 'Approved'),
(3, 'Zebronics', '1', '2025-01-09 13:12:32', '0000-00-00 00:00:00', 'OnBoarded'),
(4, 'Logitech', '1', '2025-01-09 13:12:32', '0000-00-00 00:00:00', 'Rejected'),
(5, 'Frontech', '1', '2025-01-17 00:36:58', '2025-01-30 12:26:32', 'Rejected'),
(6, 'Galax', '1', '2025-01-17 00:36:58', '0000-00-00 00:00:00', 'Pending'),
(7, 'Lenovo', '1', '2025-01-17 00:36:58', '2025-01-29 15:50:22', 'Approved'),
(8, 'Apple', '1', '2025-01-17 00:36:58', '2025-01-30 12:25:53', 'Approved'),
(9, 'SanDisk', '1', '2025-01-17 00:36:58', '2025-01-29 16:03:49', 'Approved'),
(10, 'Samsung', '1', '2025-01-17 00:36:58', '2025-01-29 16:04:05', 'Approved'),
(11, 'ASUS', '1', '2025-01-17 00:36:58', '2025-01-29 16:03:31', 'Rejected'),
(12, 'LG', '1', '2025-01-17 00:36:58', '2025-02-05 16:08:21', 'Rejected'),
(13, 'D-Link', '1', '2025-01-17 00:36:58', '0000-00-00 00:00:00', 'Pending'),
(14, 'Canon', '1', '2025-01-17 00:36:58', '0000-00-00 00:00:00', 'Pending'),
(15, 'Epson', '1', '2025-01-17 00:36:58', '2025-01-30 12:26:06', 'Rejected'),
(16, 'Xiaomi', '1', '2025-01-17 00:36:58', '2025-01-31 09:27:58', 'Rejected'),
(17, 'OnePlus', '1', '2025-01-17 00:36:58', '2025-01-30 12:35:00', 'Approved'),
(19, 'QwikFoods', '0', '2025-01-22 13:31:22', '0000-00-00 00:00:00', 'Pending'),
(20, 'Nakul', '1', '2025-02-06 22:06:36', '2025-02-06 22:06:21', 'Approved'),
(22, 'nakul patil', '0', '2025-02-19 12:25:27', '0000-00-00 00:00:00', 'Pending'),
(23, 'Chitale', '0', '2025-02-19 12:29:45', '0000-00-00 00:00:00', 'Pending'),
(24, 'java', '0', '2025-02-19 13:11:23', '0000-00-00 00:00:00', 'Pending'),
(25, 'javascript', '0', '2025-02-19 13:11:57', '0000-00-00 00:00:00', 'Pending'),
(26, 'cpp', '0', '2025-02-19 14:01:45', '0000-00-00 00:00:00', 'Pending'),
(27, 'mac', '0', '2025-02-19 14:12:08', '0000-00-00 00:00:00', 'Pending'),
(28, 'nik', '0', '2025-02-19 14:22:31', '0000-00-00 00:00:00', 'Pending'),
(29, 'abc', '0', '2025-02-19 15:35:08', '0000-00-00 00:00:00', 'Pending'),
(30, 'Haldiram', '0', '2025-02-19 15:41:29', '2025-02-19 20:21:03', 'OnBoarded'),
(31, 'Bikaji', '0', '2025-02-19 19:03:39', '2025-02-19 21:42:26', 'OnBoarded'),
(32, 'Chakote', '0', '2025-02-20 00:52:54', '2025-02-20 00:53:38', 'OnBoarded'),
(33, 'Amul', '0', '2025-02-20 10:08:50', '2025-02-20 10:10:03', 'OnBoarded'),
(34, 'Anved', '0', '2025-02-20 18:44:54', '0000-00-00 00:00:00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `brand_address`
--

CREATE TABLE `brand_address` (
  `brand_address_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `address_line_1` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `taluka` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` int(6) NOT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address_type` enum('registered','delivery') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_address`
--

INSERT INTO `brand_address` (`brand_address_id`, `brand_id`, `address_line_1`, `address_line_2`, `taluka`, `city`, `state`, `pincode`, `is_active`, `added_on`, `address_type`) VALUES
(1, 1, '', 'Palo Alto, California', 'USA', 'USA', 'USA', 94304, '1', '2025-01-16 20:06:23', 'registered'),
(2, 2, '', 'Round Rock, Texas, U.S.', 'Texas', 'Texas', 'Texas', 91202, '1', '2025-01-16 20:09:44', 'registered'),
(3, 3, '', '36 Flowers Road', 'Chennai', 'Chennai', 'Tamil Nadu', 600084, '1', '2025-01-16 20:15:20', 'registered'),
(4, 4, '', 'S-2 Level, Block-E', 'New Delhi', 'New Delhi', 'New Delhi', 110019, '1', '2025-01-16 20:17:33', 'registered'),
(5, 5, '', 'Frontech Pvt Ltd,ECOCENTRE, Unit-801,EM-4, Sector-V,', 'Kolkata ', 'Kolkata ', 'West Bengal', 700091, '1', '2025-01-17 07:31:24', 'registered'),
(6, 6, '', 'Opp. to Metro pillar no : 1727, Beside Bata Showroom, Megha Hills, Madhapur,', 'Hyderabad', 'Hyderabad', 'Telangana', 500081, '1', '2025-01-17 07:38:31', 'registered'),
(7, 7, '', 'Ferns Icon, Level, 2, Outer Ring Rd, Doddanekundi, Mahadevapura', 'Bengaluru', 'Bengaluru', 'Karnataka', 560037, '1', '2025-01-17 07:42:31', 'registered'),
(8, 8, '', '13th Floor, Prestige Minsk Square,', 'Bengaluru', 'Bengaluru', 'Karnataka ', 560001, '1', '2025-01-17 07:45:38', 'registered'),
(10, 9, '', 'No. 143/1, Amani Bellandur Village, Prestige Tech Park, Marathalli-Sarjapur Outer Ring Road', 'Kadubeesnahalli', 'Bengaluru ', 'Karnataka ', 560103, '1', '2025-01-17 07:48:31', 'registered'),
(11, 10, '', '0th to 24th Floor, Two Horizon Centre, Golf Course Road, Sector-43', 'Delhi', 'Gurgaon', 'Haryana', 122202, '1', '2025-01-17 07:51:58', 'registered'),
(12, 11, '', '402,Supreme Chambers,17/18,Shah Industrial Estate, Veera Desai Road', 'Andheri(West)', 'Mumbai', 'Maharashtra', 400053, '1', '2025-01-17 07:53:54', 'registered'),
(13, 12, '', 'C001,KP tower, Sector 16B', 'Noida', 'Noida', 'Uttar Pradesh', 201301, '1', '2025-01-17 07:56:14', 'registered'),
(14, 13, '', '2nd Floor, Unit No. 24, Kalpataru Square, Kondivita Lane, Andheri Kurla Road', 'Andheri', 'Mumbai', 'Maharashtra', 400059, '1', '2025-01-17 07:58:46', 'registered'),
(15, 14, '', 'Canon India Pvt. Ltd., 6th floor, Embassy One Pinnacle', 'Ganganagar', 'Bengaluru ', 'Karnataka ', 560032, '1', '2025-01-17 08:01:40', 'registered'),
(16, 15, '', '2nd floor, No 112, Vairam complex, Sir Thyagaraya Rd, T. Nagar', 'Chennai', 'Chennai', 'Tamil Nadu', 600017, '1', '2025-01-17 08:04:10', 'registered'),
(17, 16, '', 'Block E, Embassy Tech Village Marathahalli Outer Ring Road', 'Devarabisanahalli', 'Bengaluru ', 'Karnataka ', 560103, '1', '2025-01-17 08:06:07', 'registered'),
(19, 17, '', 'UB City, 24, Vittal Mallya Road, D\'Souza Layout, Ashok Nagar', 'Bengaluru', 'Bengaluru', 'Karnataka', 560001, '1', '2025-01-17 08:08:03', 'registered'),
(50, 30, '', 'Dipalis Registered Address', '', '', '', 0, '1', '2025-02-19 20:31:42', 'registered'),
(51, 30, '', 'Datta Provision 3 Ganesh Colony-Civil Court Road Ganesh Colony', '', '', '', 0, '1', '2025-02-19 20:31:42', 'delivery'),
(52, 31, 'Datta Provision 3 Ganesh Colony-Civil Court Road Ganesh Colony', 'Ring road', 'Jalgaon', 'Jalgaon', 'Maharashtra', 425001, '1', '2025-02-19 21:03:47', 'registered'),
(53, 31, 'Ring Road, Nandanvan colony', 'Near Chandraprabha colony', 'Jalgaon', 'Jalgaon', 'Maharashtra', 425001, '1', '2025-02-19 21:03:47', 'delivery'),
(54, 32, '', '', '', '', '', 0, '1', '2025-02-20 04:31:40', 'registered'),
(55, 32, '', '', '', '', '', 0, '1', '2025-02-20 04:31:40', 'delivery'),
(56, 33, 'SXZXzxcxZ', 'zxxz', 'zsxczczc', 'Zxx', 'Maharashtra', 424002, '1', '2025-02-20 04:43:17', 'registered'),
(57, 33, 'zxzxczczczc', 'zxcx x', 'zXzxxx', 'dhule', 'Maharashtra', 424002, '1', '2025-02-20 04:43:17', 'delivery');

-- --------------------------------------------------------

--
-- Table structure for table `brand_documents`
--

CREATE TABLE `brand_documents` (
  `brand_doc_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `document_title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_documents`
--

INSERT INTO `brand_documents` (`brand_doc_id`, `brand_id`, `document_title`, `file_title`, `added_on`, `is_active`) VALUES
(1, 1, 'Registration Certificate', 'test_file_1.pdf', '2025-01-17 08:10:50', '1'),
(2, 2, 'Registration Certificate', 'test_file_2.pdf', '2025-01-17 08:10:50', '1'),
(3, 3, 'Registration Certificate', 'test_file_3.pdf', '2025-01-17 08:10:50', '1'),
(4, 4, 'Registration Certificate', 'test_file_4.pdf', '2025-01-17 08:10:50', '1'),
(5, 5, 'Registration Certificate', 'test_file_5.pdf', '2025-01-17 08:10:50', '1'),
(6, 6, 'Registration Certificate', 'test_file_6.pdf', '2025-01-17 08:10:50', '1'),
(7, 7, 'Registration Certificate', 'test_file_7.pdf', '2025-01-17 08:10:50', '1'),
(8, 8, 'Registration Certificate', 'test_file_8.pdf', '2025-01-17 08:10:50', '1'),
(9, 9, 'Registration Certificate', 'test_file_9.pdf', '2025-01-17 08:10:50', '1'),
(10, 10, 'Registration Certificate', 'test_file_10.pdf', '2025-01-17 08:10:50', '1'),
(11, 11, 'Registration Certificate', 'test_file_11.pdf', '2025-01-17 08:10:50', '1'),
(12, 12, 'Registration Certificate', 'test_file_12.pdf', '2025-01-17 08:10:50', '1'),
(13, 13, 'Registration Certificate', 'test_file_13.pdf', '2025-01-17 08:10:50', '1'),
(14, 14, 'Registration Certificate', 'test_file_14.pdf', '2025-01-17 08:10:50', '1'),
(15, 15, 'Registration Certificate', 'test_file_15.pdf', '2025-01-17 08:10:50', '1'),
(16, 16, 'Registration Certificate', 'test_file_16.pdf', '2025-01-17 08:10:50', '1'),
(17, 17, 'Registration Certificate', 'test_file_17.pdf', '2025-01-17 08:10:50', '1'),
(51, 30, 'Food License', 'foodlicense_20_02_2025_02_01_42_Feature List For Webinar Functionality in MDI NetworX Website Application By Sequentia .pdf', '2025-02-19 20:31:42', '1'),
(52, 30, 'GST Certificate', 'gst_certificate_20_02_2025_02_01_42_test.pdf', '2025-02-19 20:31:42', '1'),
(53, 31, 'Food License', 'foodlicense_20_02_2025_02_33_47_test.pdf', '2025-02-19 21:03:47', '1'),
(54, 31, 'GST Certificate', 'gst_certificate_20_02_2025_02_33_47_test.pdf', '2025-02-19 21:03:47', '1'),
(55, 33, 'Food License', 'foodlicense_20_02_2025_10_13_17_test.pdf', '2025-02-20 04:43:17', '1'),
(56, 33, 'GST Certificate', 'gst_certificate_20_02_2025_10_13_17_test.pdf', '2025-02-20 04:43:17', '1');

-- --------------------------------------------------------

--
-- Table structure for table `brand_info`
--

CREATE TABLE `brand_info` (
  `brand_info_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` bigint(20) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_year` year(4) NOT NULL,
  `gst_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_logo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `food_licence_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sample_size` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_comments` text COLLATE utf8mb4_unicode_ci,
  `requested_categories` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` enum('1','0') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_info`
--

INSERT INTO `brand_info` (`brand_info_id`, `brand_id`, `first_name`, `last_name`, `contact_number`, `email`, `registration_year`, `gst_number`, `brand_logo`, `food_licence_number`, `sample_size`, `additional_comments`, `requested_categories`, `is_active`) VALUES
(1, 1, 'Hewlett', 'Packard', 1800120100, 'admin@hp.com', '1978', '', 'hp.png', '', NULL, NULL, '', '1'),
(2, 2, 'Michael', 'Dell', 1800120200, 'admin@dell.com', '1920', '', 'dell.png', '', NULL, NULL, '', '1'),
(3, 3, 'Rajesh', 'Doshi', 1800120300, 'admin@zebronics.com', '2000', '', 'zebronics.png', '', NULL, NULL, '', '1'),
(4, 4, 'Logitech', 'Electronics', 911147306622, 'admin@logitech.com', '1982', '', 'logitech.png', '', NULL, NULL, '', '1'),
(5, 5, 'Love', 'Jain', 1800345500, 'admin@frontech.com', '1997', '', 'frontech.png', '', NULL, NULL, '', '1'),
(6, 7, 'Yang', 'Yuanqing', 18004199733, 'admin@lenovo.com', '1984', '', 'lenovo.avif', '', NULL, NULL, '', '1'),
(7, 8, 'Tim', 'Cook', 18002120129, 'admin@apple.com', '1976', '', 'apple.png', '', NULL, NULL, '', '1'),
(8, 9, 'Sanjay', 'Mehrotra', 465487984621, 'admin@sandisk.com', '1988', '', 'sandisk.png', '', NULL, NULL, '', '1'),
(9, 10, 'Lee ', 'Kun-hee', 18005698932, 'admin@samsung.com', '1938', '', 'samsung.png', '', NULL, NULL, '', '1'),
(10, 11, 'Ted', 'Hsu', 18023563541, 'admin@asus.com', '1989', '', 'asus.png', '', NULL, NULL, '', '1'),
(11, 12, 'Koo Bon', 'Moo', 1800235678, 'admin@lg.com', '1947', '', 'lg.png', '', NULL, NULL, '', '1'),
(12, 13, 'Kamlaksha', 'Rama Naik', 1800213546, 'admin@dlink.com', '1986', '', 'dlink.png', '', NULL, NULL, '', '1'),
(13, 14, 'Fujio', 'Mitarai', 1822021356, 'admin@canon.com', '1937', '', 'canon.png', '', NULL, NULL, '', '1'),
(14, 15, 'Seiko', 'Family', 18001256752, 'admin@epson.com', '1942', '', 'epson.png', '', NULL, NULL, '', '1'),
(15, 16, 'Lei', 'Jun', 18001465486, 'admin@xiaomi.com', '2010', '', 'xiaomi.png', '', NULL, NULL, '', '1'),
(16, 17, 'Pete', 'Lau', 18001235465, 'admin@oneplus.com', '2013', '', 'oneplus.png', '', NULL, NULL, '', '1'),
(17, 19, 'Niranjan', 'Chaudhari', 7387414778, 'niranjan@sequentia.co.in', '0000', '', '', '', '100gm', '', '2,5,7,8', '1'),
(18, 20, 'sonya', 'patil', 8669082115, 'sonya@gmail.com', '0000', '', 'https://www.google.com/imgres?q=haldiram&imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fen%2Fthumb%2F9%2F91%2FHaldiram%2527s_2024_Logo.svg%2F800px-Haldiram%2527s_2024_Logo.svg.png&imgrefurl=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FHaldiram%2527s&docid=L-FxK51bo-theM&tbnid=maKs-RQr88HTsM&vet=12ahUKEwjhgaXGvq-LAxUTyzgGHUBPLGkQM3oECGQQAA..i&w=800&h=457&hcb=2&ved=2ahUKEwjhgaXGvq-LAxUTyzgGHUBPLGkQM3oECGQQAA', '', NULL, NULL, '', NULL),
(19, 20, 'sonya', 'patil', 8669082115, 'sonya@gmail.com', '0000', '', 'https://www.google.com/imgres?q=haldiram&imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fen%2Fthumb%2F9%2F91%2FHaldiram%2527s_2024_Logo.svg%2F800px-Haldiram%2527s_2024_Logo.svg.png&imgrefurl=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FHaldiram%2527s&docid=L-FxK51bo-theM&tbnid=maKs-RQr88HTsM&vet=12ahUKEwjhgaXGvq-LAxUTyzgGHUBPLGkQM3oECGQQAA..i&w=800&h=457&hcb=2&ved=2ahUKEwjhgaXGvq-LAxUTyzgGHUBPLGkQM3oECGQQAA', '', NULL, NULL, '', NULL),
(20, 22, 'nakul', 'patil', 8669082115, 'patilnakul472@gmail.com', '0000', '', '', '', '100gm', '', '2,5', '0'),
(21, 23, 'nakul', 'patil', 8669082115, 'patilnakul472@gmail.com', '0000', '', '', '', '100gm', '', '2,5', '0'),
(22, 24, 'nakul', 'patil', 918600082115, 'patilnakul472@gmail.com', '0000', '', '', '', '100gm', '', '2,5', '0'),
(23, 25, 'nakul', 'patil', 918600082115, 'patilnakul472@gmail.com', '0000', '', '', '', '100', '', '2,5', '0'),
(24, 26, 'nakul', 'patil', 918600082115, 'patilnakul472@gmail.com', '0000', '', '', '', '100', 'latest', '2,5', '0'),
(25, 27, 'tejas', 'patil', 917020402325, 'tejas@gmail.com', '0000', '', '', '', '100', 'kjiji', '1', '0'),
(26, 28, 'Nakul2', 'Patil', 8387414569, 'nakulzz@sequentia8.com', '0000', '', '', '', '100gm', '', '1', '0'),
(27, 29, 'amol', 'baviskar', 912345432343, 'amol@gmial.com', '0000', '', '', '', '50', 'hello a', '7,10', '0'),
(28, 30, 'dipali', 'bodhare', 919834522426, 'dipalibodhare5@gmail.com', '2000', '13245689746562', 'haldiram.png', '21321549846asd', '100', 'hfghvcbvc', '18,20,19', '1'),
(29, 31, 'Gayatri', 'Patil', 919604712039, 'gayatri@gmail.com', '1999', '749832749832', 'bikaji.png', 'ashdkj789d89as', '50', 'dfddgdfg', '18', '1'),
(30, 32, 'Ridhi', 'Jadhav', 919785641223, 'ridhi@gmail.com', '1995', '1132353', '', '632112', '100', 'sdddddd', '24,25,26', '1'),
(31, 33, 'Devika', 'Pawar', 919645238565, 'devika@gmail.com', '1990', '1132353', '2025220101132_0.png', '21241546', '100', 'sdsddSX', '20,27,28', '1'),
(32, 34, 'Amol', 'B', 918446256233, 'amol@gmo.com', '0000', '', '', '', '20', 'anything', '25,26', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brand_vs_category`
--

CREATE TABLE `brand_vs_category` (
  `brand_category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_vs_category`
--

INSERT INTO `brand_vs_category` (`brand_category_id`, `brand_id`, `category_id`, `added_on`, `is_active`) VALUES
(1, 1, 2, '2025-01-16 19:48:25', '0'),
(2, 2, 2, '2025-01-16 19:48:25', '1'),
(3, 3, 2, '2025-01-16 19:48:25', '1'),
(4, 4, 2, '2025-01-16 19:48:25', '1'),
(5, 5, 2, '2025-01-16 19:48:25', '1'),
(6, 6, 2, '2025-01-16 19:48:26', '1'),
(7, 7, 2, '2025-01-16 19:48:26', '1'),
(8, 8, 2, '2025-01-16 19:48:26', '1'),
(9, 9, 2, '2025-01-16 19:48:26', '1'),
(10, 10, 2, '2025-01-16 19:48:26', '1'),
(11, 11, 2, '2025-01-16 19:48:26', '1'),
(12, 12, 2, '2025-01-16 19:48:26', '1'),
(13, 13, 2, '2025-01-16 19:48:26', '1'),
(14, 14, 2, '2025-01-16 19:48:26', '1'),
(15, 15, 2, '2025-01-16 19:48:26', '1'),
(16, 16, 2, '2025-01-16 19:48:26', '1'),
(17, 17, 2, '2025-01-16 19:48:26', '1'),
(18, 8, 1, '2025-01-16 19:48:26', '1'),
(19, 8, 4, '2025-01-16 19:48:26', '1'),
(20, 8, 8, '2025-01-16 19:48:26', '1'),
(21, 11, 4, '2025-01-16 19:48:26', '1'),
(22, 14, 6, '2025-01-16 19:48:26', '1'),
(23, 2, 4, '2025-01-16 19:48:26', '1'),
(24, 2, 7, '2025-01-16 19:48:26', '1'),
(25, 13, 8, '2025-01-16 19:48:26', '1'),
(26, 1, 4, '2025-01-16 19:48:26', '0'),
(27, 1, 7, '2025-01-16 19:48:26', '0'),
(28, 7, 4, '2025-01-16 19:48:26', '1'),
(29, 7, 7, '2025-01-16 19:48:26', '1'),
(30, 7, 8, '2025-01-16 19:48:26', '1'),
(31, 12, 3, '2025-01-16 19:48:26', '1'),
(32, 12, 7, '2025-01-16 19:48:26', '1'),
(33, 4, 7, '2025-01-16 19:48:26', '1'),
(34, 17, 1, '2025-01-16 19:48:26', '1'),
(35, 10, 1, '2025-01-16 19:48:26', '1'),
(36, 10, 3, '2025-01-16 19:48:26', '1'),
(37, 10, 4, '2025-01-16 19:48:26', '1'),
(38, 10, 8, '2025-01-16 19:48:26', '1'),
(39, 16, 1, '2025-01-16 19:48:26', '1'),
(40, 16, 3, '2025-01-16 19:48:26', '1'),
(41, 3, 5, '2025-01-16 19:48:26', '1'),
(42, 3, 7, '2025-01-16 19:48:26', '1'),
(43, 3, 8, '2025-01-16 19:48:26', '1'),
(90, 30, 18, '2025-02-19 20:31:42', '1'),
(91, 30, 19, '2025-02-19 20:31:42', '1'),
(93, 31, 18, '2025-02-19 21:03:47', '1'),
(95, 32, 24, '2025-02-20 04:31:40', '1'),
(96, 32, 25, '2025-02-20 04:31:40', '1'),
(97, 32, 26, '2025-02-20 04:31:40', '1'),
(98, 33, 20, '2025-02-20 04:43:17', '1'),
(99, 33, 27, '2025-02-20 04:43:17', '1'),
(100, 33, 28, '2025-02-20 04:43:17', '1');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `business_id` int(11) NOT NULL,
  `business_name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`business_id`, `business_name`, `is_active`, `added_on`) VALUES
(1, 'Hewlett Packard Enterprise (HPE)', '1', '2025-01-24 18:24:41'),
(2, 'Dell Technologies Inc.', '1', '2025-01-24 18:24:41'),
(3, 'Zebronics India Private Limited', '1', '2025-01-24 18:24:41'),
(4, 'Logitech International S.A', '1', '2025-01-24 18:24:41'),
(5, 'Frontech Computers India Private Limited', '1', '2025-01-24 18:24:41'),
(6, 'Lenovo Group Limited', '1', '2025-01-24 18:24:41'),
(7, 'Apple Inc', '1', '2025-01-24 18:24:41'),
(8, 'Western Digital Corporation', '1', '2025-01-24 18:24:41'),
(9, 'Samsung Electronics Co., Ltd. (SEC', '1', '2025-01-24 18:24:41'),
(10, 'ASUSTeK Computer Inc', '1', '2025-01-24 18:24:41'),
(11, 'LG Electronics', '1', '2025-01-24 18:24:41'),
(12, 'D-Link Corporation', '1', '2025-01-24 18:24:41'),
(13, 'Canon Inc', '1', '2025-01-24 18:24:41'),
(14, 'Seiko Epson Corporation', '1', '2025-01-24 18:24:41'),
(15, 'Xiaomi Technology India Private Limited', '1', '2025-01-24 18:24:41'),
(16, 'OnePlus Technology (Shenzhen) Co., Ltd', '1', '2025-01-24 18:24:41'),
(29, 'Dipalis Business Name', '1', '2025-02-19 20:31:42'),
(30, 'Gayatris Business', '1', '2025-02-19 21:03:47'),
(31, 'hgfhgc', '1', '2025-02-20 04:31:40'),
(32, 'Amul', '1', '2025-02-20 04:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `business_vs_brand`
--

CREATE TABLE `business_vs_brand` (
  `business_brand_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_vs_brand`
--

INSERT INTO `business_vs_brand` (`business_brand_id`, `business_id`, `brand_id`, `added_on`, `is_active`) VALUES
(1, 1, 1, '2025-01-24 18:26:06', 1),
(2, 2, 2, '2025-01-24 18:26:06', 1),
(3, 3, 3, '2025-01-24 18:26:06', 1),
(4, 4, 4, '2025-01-24 18:26:06', 1),
(5, 5, 5, '2025-01-24 18:26:06', 1),
(6, 6, 6, '2025-01-24 18:26:06', 1),
(7, 7, 7, '2025-01-24 18:26:06', 1),
(8, 8, 8, '2025-01-24 18:26:06', 1),
(9, 9, 9, '2025-01-24 18:26:06', 1),
(10, 10, 10, '2025-01-24 18:26:06', 1),
(11, 11, 11, '2025-01-24 18:26:06', 1),
(12, 12, 12, '2025-01-24 18:26:06', 1),
(13, 13, 13, '2025-01-24 18:26:06', 1),
(14, 14, 14, '2025-01-24 18:26:06', 1),
(15, 15, 15, '2025-01-24 18:26:06', 1),
(16, 16, 16, '2025-01-24 18:26:06', 1),
(29, 29, 30, '2025-02-19 20:31:42', 1),
(30, 30, 31, '2025-02-19 21:03:47', 1),
(31, 31, 32, '2025-02-20 04:31:40', 1),
(32, 32, 33, '2025-02-20 04:43:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cart_data` longtext NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('wishlist','watchlist') DEFAULT NULL,
  `mobile_number` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `cart_data`, `added_on`, `type`, `mobile_number`) VALUES
(1, 999, '[{\"product_id\":44,\"product_name\":\"Rajbhog\",\"product_description\":\"<p>vcxvcvxvxv</p>\",\"price\":150,\"weight\":50,\"expiryDate\":\"2025-02-28\",\"is_active\":\"Active\",\"is_featured\":\"\",\"product_images\":[[\"https://zecc.in/simplysample/uploads/productIamges/202522085824NaN0.png\"]],\"brand_name\":\"Haldiram\",\"brand_id\":30,\"category_name\":\"Sweets\",\"category_image\":\"\",\"category_id\":18,\"sub_category_name\":\"Tin sweets\",\"sub_category_id\":104,\"quantity\":1,\"rating_and_review\":{\"rating\":0,\"customers\":0},\"id\":44,\"totalWeight\":50},{\"product_id\":45,\"product_name\":\"Mini Gulabjam\",\"product_description\":\"<p>cdsdsdd</p>\",\"price\":200,\"weight\":50,\"expiryDate\":\"2025-02-25\",\"is_active\":\"Active\",\"is_featured\":\"\",\"product_images\":[[\"https://zecc.in/simplysample/uploads/productIamges/202522085935NaN0.png\"]],\"brand_name\":\"Haldiram\",\"brand_id\":30,\"category_name\":\"Sweets\",\"category_image\":\"\",\"category_id\":18,\"sub_category_name\":\"Tin sweets\",\"sub_category_id\":104,\"quantity\":1,\"rating_and_review\":{\"rating\":0,\"customers\":0},\"id\":45,\"totalWeight\":50}]', '2025-02-19 09:20:53', NULL, 9860058383),
(2, 222, '[{\"product_id\":8,\"product_name\":\"SAMSUNG EVO Plus 256GB Micro w/SD Adaptor SDXC, Up-to 160MB/s, Expanded Storage for Gaming Devices, Android Tablets and Smart Phones, Memory Card, MB-MC256SA/IN\",\"product_description\":\"FAST AND SMOOTH: With speeds of up to 160 MB/s, you can store, save, and share instantly. Even with huge files, EVO Plus is incredibly quick with superfast U3, Class 10 rated transfer speeds of up to 160MB/s; Big apps load and run smoothly, while 4K video remains sharp with A2, V30, and UHS-I Interface**ALL THE SPACE YOU NEED: Enhanced speed + compatibility = dependable performance; EVO Plus + Adapter lets you load games to your console, or download more apps on your tablet; Top-notch speed makes transfers seamless and reliable*EXPAND AND STORE BIG: Options available from 64GB to a 1TB. choose your EVO Plus and expand your capacity for hi-resolution images and 4K video files.; With so many sizes select the perfect capacity for all your memories***d 4K video files.YOU\'RE FULLY PROTECTED: The EVO Plus takes on life’s adventures with water, temperature, X-ray, magnet, drop, and wearout protection; Your experiences are irreplaceable and deserves reliable storage, backed by a 10-year limited warranty****WORLD\'S NO. 1 FLASH MEMORY BRAND: Performance and reliability you can count on from the world\'s number one brand for flash memory since 2003;***** All firmware and components are produced in-house, including our world-renowned DRAM and NAND, for quality you can trust\",\"price\":1748,\"weight\":50,\"expiryDate\":\"0000-00-00\",\"is_active\":\"Active\",\"is_featured\":\"\",\"product_images\":[[\"https://zecc.in/simplysample/uploads/productIamges/71ai4yZJUgL._SX679_.jpg\"],[\"https://zecc.in/simplysample/uploads/productIamges/51yvHIQUPgL._SX679_.jpg\"],[\"https://zecc.in/simplysample/uploads/productIamges/41xDwVVxTWL._SX679_.jpg\"],[\"https://zecc.in/simplysample/uploads/productIamges/518YeDMbgmL._SX679_.jpg\"],[\"https://zecc.in/simplysample/uploads/productIamges/71Tflh-kCeL._SY879_.jpg\"]],\"brand_name\":\"SAMSUNG\",\"brand_id\":10,\"category_name\":\"Computer Accessories\",\"category_image\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABUUAAAH/CAIAAAD/niubAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAwYSURBVHhe7ddBCQAwDACxCemz/p3Vw3QcBGIi72YBAACAFp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAmtkPMAnJYn/2jf0AAAAASUVORK5CYII=\",\"category_id\":2,\"sub_category_name\":\"External Devices & Data Storage\",\"sub_category_id\":3,\"quantity\":1,\"rating_and_review\":{\"rating\":0,\"customers\":0},\"id\":8,\"totalWeight\":50}]', '2025-02-19 17:55:19', NULL, 7609714322),
(3, 1004, '[{\"product_id\":14,\"product_name\":\"D-Link DIR-825 |1200Mbps Dual Band Wi-Fi Router| Speeds 2.4 GHz up to 300Mbps & 5 GHz up to 867Mbps | Gigabit Ethernet Ports | High-Gain Antennas | Easy Setup |MTCTE Certified\",\"product_description\":\"AC 1200 Mbps WAVE 2 Concurrent dual band wireless Router with 4 High gain Omni Antenna802.11 a/b/g/n/ac standards with speed of 300 Mbps on 2.4Ghz & 867 Mbps on 5GhzGigabit Ports -- One Gigabit WAN & Four Gigabit LAN ports for high speed wired connectivity.MU-MIMO -- MU-MIMO, which transmits data to multiple wireless devices simultaneously to increase speed and efficiencyMultiple Operating modes: Router mode : to access the internet. Access Point mode : to extend wired network over wireless .Repeater mode : to extend the range of existing wireless router.Easy Setup: Super simple set-up with the D-Link Assistant Mobile APP Or with intuitive WEB GUI setup wizard\",\"price\":1699,\"weight\":1040,\"expiryDate\":\"0000-00-00\",\"is_active\":\"Active\",\"is_featured\":\"\",\"product_images\":[[\"https://zecc.in/simplysample/uploads/productIamges/314BnT0d8FL._SY300_SX300_QL70_FMwebp_.webp\"]],\"brand_name\":\"D-Link\",\"brand_id\":13,\"category_name\":\"Computer Accessories\",\"category_image\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABUUAAAH/CAIAAAD/niubAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAwYSURBVHhe7ddBCQAwDACxCemz/p3Vw3QcBGIi72YBAACAFp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAmtkPMAnJYn/2jf0AAAAASUVORK5CYII=\",\"category_id\":2,\"sub_category_name\":\"Networking Devices\",\"sub_category_id\":6,\"quantity\":1,\"rating_and_review\":{\"rating\":0,\"customers\":0},\"id\":14,\"totalWeight\":1040},{\"product_id\":15,\"product_name\":\"Canon Pixma MG2577s All-in-One Inkjet Colour Printer (Blue/White)\",\"product_description\":\"Printer Type - Inkjet; Functionality - All-in-One (Print, Scan, Copy), Scanner type - Flatbed ; Printer Output - ColourConnectivity - USB ; Compatibility - Windows XP or newer and Mac OS X v10.7.5 or newerPages per minute - 8 pages (Black), 4 pages (Colour) ; Cost per page - Rs 5.3 (Black & White), Rs 7.8 (Colour) - As per ISO standardsIdeal usage - Home & Small Office, Low usage ( less than 100 pages per month)Page size supported - 4.0\\\"x6.0\\\" till A4 / Letter / Legal ; Duplex Print - Manual ; Print resolution - 4800x600Compatible Ink Cartridge - PG-745 (Black), CL-746 (Colour) ; Page Yield - 180 pages ; Includes 1 Black and 1 Colour cartridge in the boxWarranty Details: 1 year manufacturer warranty from the date of purchase\",\"price\":2899,\"weight\":4800,\"expiryDate\":\"0000-00-00\",\"is_active\":\"Active\",\"is_featured\":\"\",\"product_images\":[[\"https://zecc.in/simplysample/uploads/productIamges/51TgRks3kIL._SX679_.jpg\"],[\"https://zecc.in/simplysample/uploads/productIamges/61vbnkR36zL._SX679_.jpg\"],[\"https://zecc.in/simplysample/uploads/productIamges/71ricz+ENhL._SX679_.jpg\"]],\"brand_name\":\"Canon\",\"brand_id\":14,\"category_name\":\"Computer Accessories\",\"category_image\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABUUAAAH/CAIAAAD/niubAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAwYSURBVHhe7ddBCQAwDACxCemz/p3Vw3QcBGIi72YBAACAFp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAmtkPMAnJYn/2jf0AAAAASUVORK5CYII=\",\"category_id\":2,\"sub_category_name\":\"Printers, Inks & Accessories\",\"sub_category_id\":7,\"quantity\":1,\"rating_and_review\":{\"rating\":0,\"customers\":0},\"id\":15,\"totalWeight\":4800},{\"product_id\":16,\"product_name\":\"Epson Perfection V39 Scanner\",\"product_description\":\"4800 x 4800 dpi scanningUSB poweredBuilt-in kickstandDetachable lidEasy Photo ScanWith Epson Easy Photo Fix software, improve the quality of your scans by removing dust, restoring faded colours and correcting backlight\",\"price\":5349,\"weight\":1200,\"expiryDate\":\"0000-00-00\",\"is_active\":\"Active\",\"is_featured\":\"\",\"product_images\":[[\"https://zecc.in/simplysample/uploads/productIamges/61e8xgi7jrL._SX679_.jpg\"]],\"brand_name\":\"Epson\",\"brand_id\":15,\"category_name\":\"Computer Accessories\",\"category_image\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABUUAAAH/CAIAAAD/niubAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAwYSURBVHhe7ddBCQAwDACxCemz/p3Vw3QcBGIi72YBAACAFp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAHp8HAACAmtkPMAnJYn/2jf0AAAAASUVORK5CYII=\",\"category_id\":2,\"sub_category_name\":\"Scanners\",\"sub_category_id\":8,\"quantity\":1,\"rating_and_review\":{\"rating\":0,\"customers\":0},\"id\":16,\"totalWeight\":1200}]', '2025-02-19 20:42:51', NULL, 9325693256),
(4, 1, '[{\"product_id\":43,\"product_name\":\"Kaju Katli\",\"product_description\":\"<p>xczcxzczcc</p>\",\"price\":200,\"weight\":20,\"expiryDate\":\"2025-02-28\",\"is_active\":\"Active\",\"is_featured\":\"\",\"product_images\":[[\"https://zecc.in/simplysample/uploads/productIamges/202522085715NaN0.png\"]],\"brand_name\":\"Haldiram\",\"brand_id\":30,\"category_name\":\"Sweets\",\"category_image\":\"\",\"category_id\":18,\"sub_category_name\":\"Packed sweets\",\"sub_category_id\":103,\"quantity\":1,\"rating_and_review\":{\"rating\":0,\"customers\":0},\"id\":43,\"totalWeight\":20},{\"product_id\":45,\"product_name\":\"Mini Gulabjam\",\"product_description\":\"<p>cdsdsdd</p>\",\"price\":200,\"weight\":50,\"expiryDate\":\"2025-02-25\",\"is_active\":\"Active\",\"is_featured\":\"\",\"product_images\":[[\"https://zecc.in/simplysample/uploads/productIamges/202522085935NaN0.png\"]],\"brand_name\":\"Haldiram\",\"brand_id\":30,\"category_name\":\"Sweets\",\"category_image\":\"\",\"category_id\":18,\"sub_category_name\":\"Tin sweets\",\"sub_category_id\":104,\"quantity\":1,\"rating_and_review\":{\"rating\":0,\"customers\":0},\"id\":45,\"totalWeight\":50}]', '2025-02-20 08:14:32', NULL, 5046218927),
(5, 1006, '[{\"product_id\":51,\"product_name\":\"Dry Petha\",\"product_description\":\"<p>zxxxzxc</p>\",\"price\":120,\"weight\":40,\"expiryDate\":\"2025-02-26\",\"is_active\":\"Active\",\"is_featured\":\"\",\"product_images\":[[\"https://zecc.in/simplysample/uploads/productIamges/202522092933NaN0.png\"]],\"brand_name\":\"Bikaji\",\"brand_id\":31,\"category_name\":\"Sweets\",\"category_image\":\"\",\"category_id\":18,\"sub_category_name\":\"Packed sweets\",\"sub_category_id\":103,\"quantity\":1,\"rating_and_review\":{\"rating\":0,\"customers\":0},\"id\":51,\"totalWeight\":40}]', '2025-02-20 08:21:34', NULL, 9956235689);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_image` blob NOT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_image`, `is_active`, `added_on`) VALUES
(1, 'Mobiles & Accessories', '', '0', '2025-01-16 13:44:05'),
(2, 'Computer Accessories', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141425555414141482f434149414141442f6e6975624141414141584e535230494172733463365141414141526e51553142414143786a777638595155414141414a6345685a63774141456e514141424a304164356d4833674141417759535552425648686537646442435141774441437843656d7a2f703356773351634247496937325942414143414670384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143414870384841414341487038484141434148703848414143416d746b504d416e4a596e2f326a663041414141415355564f524b35435949493d, '0', '2025-01-16 13:44:05'),
(3, 'TV & Home Entertainment', 0x646174613a696d6167652f6a7065673b6261736536342c2f396a2f34414151536b5a4a5267414241514141415141424141442f3277434541416b474277674842676b494277674b43676b4c445259504451774d445273554652415749423069496941644878386b4b4451734a4359784a7838664c5430744d5455334f6a6f364979732f52443834517a51354f6a634243676f4b4451774e47673850476a636c487955334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e2f2f4141424549414a514131414d4249674143455145444551482f784141624141414341774542415141414141414141414141414141454251494442674142422f2f4541446b5141414942417749454177594542515542415145414141454341774145455249684254464255524d6959525179635947526f554a5373664147493848523452557a596e4c78676b4d6b2f38514147674541417745424151454141414141414141414141414141674d454151414642762f454143635241414d4141514d464141494341774541414141414141414241674d524954454545684e4255525179496b4a53635945462f396f4144414d424141495241784541507742644a63724b516f55426551436a6646634c434e395443637232794d31594c474258415878474237484e456d3277464354754d48385135556876742f557330372f33334673316a4c4770596c574864642f2f41436f523458796c5678324e4e6f374e64524c58455a5054493936695553484f6962515163344a3655583547693333422f47577571324d2f34544d434651353743765542417756794b665077367955722f5063736565673756347642564d4f754b667a6173414e79507a7248316336626d72704733716e754a66435676647974574c4751763877622b744d5a7241774b44496b6b6368504d726c635679574e7977556c64616b5a425466616a585553317271412b6e705067566942337946306b64717061316b446537576a68696874314a6b67526d48357134797750456e2f3832442f784e4c72714d69664777794f6d78666478525a32596c516a79715166785665746a685342766a63555959692f6d57503548705639713752652f475748596a6c515049363347396b79744e424a63324d6948476e4761476b6a306b4c6a6574544d6b467976387773706f64725245494a514d4f6872504e53325a71785339307a4e2b79367438477065796b485947744f747641514f5150577259374b427339614239533136484c424c526b2f5a5749794b3732566b334e61763242464270664c616562424731617570544d2f48304d354c4867314144545432343462675a306e46415061454537552f486e544a386e54734347443071776e795943565a3442553871346a46557a6b52486b77746367307937436848556b3446484f4e52394b72613259376974376746414d494d44633154497544696d48677346716953444f35724e5175317041474b3669665a68337271335548744e584845334d734e755647784e703035566339774b456a4c676a65696f356d794d67456a30706434324c7839516b4852724734414d616b376e5963366b4c42447559774231774b726875436f32554434436a494c786c36443535715373562b6a3049366d48797972324e57324849663841484e526668374c6777534b4736676b6a4e4d6b753162486972384d555847384a59485050626e7971656c6b586f706d3862577a454d695861444568476e36304f786b522f64556a70304972554f747249417367494652617944442b524a7258386a626a3655727571567649784f61345a6c6e494c487849574f32322b63316350446446437871704732514f5650785a6f70784c62655964564f416148657774383458557663346f31314b346142385074414d586942666556766c5548556c764d4e766a7970674f4742426b5a4936456461684a624f6d43724c6a73614b63734e6d4f62533046726c4d6c513332714c376242686755774d6359627a5235505959716962682f694d576a6b417a305a534b6373732b785478763041714157333348624e467779684732556b59355630584470516469707a3263555844772b51594a4b2f3841796436433768687971524878315a637168414855304c4b385a79324e2b314d4774334459783565757171704c534e2b54444e543930706c45743641456252453462596d764a4c425475755070557062526b624f4b674a4a4662424272477663734e56394b4873505437554a63384f4f4d686162423231643673777a6f5356706b585342755a614d3462494b636b416756594945303478696d6a514b6574447645464e57786d31494c7737366939345678514e796b61354f72355970704f6f4334337058634a7a337073304a754e4149383638715a5865756f39514e44554c486d726b6a7163615a6f6859765375387042345756704856364b525530697135455061736552477245306552305448555654754b765242384b57326d4f6e75524e457a7656385373446b4569716c536949785371487932584a49344744687653704d6b456f416b6a4b2b6f327278616b4e366d76484c4b6f795552466b712b35754f2b633143537a3164426e364769554f6b31654347473471573850786a316d596a7562526c5559556a3556536b4c6c5270592f38415870576a596474366a346148636f416534465a4e58415474554b5674664b4e397a7a32727837523141436e4a70754938666932726945354130586b6673482f51734544594774666d44555a4c4973437733464e684572446c6d765669564f53317a797a374231666f514e5a4537597a564d6e4438383172536b44387455534148384970627977754269756a4f437747643968567a634f51525a4455325a422b51564571656969755856536a577159696d73504a7a705a635738696e415774564a4337644152517a326a452b35585431694337477a4a79573773704462554450772f4735424e624757786c4f796a416f4f626863702f446d6d4c7256716338435a6a2f592f516657757252747769544a38702b6c655533387866526634794b6f74483457496f754a744a39374e4b34377545485a717657396a7a7a71796b784369527373774834616b4c6b666b593074572b6a50357672566e746963736e48624e4c656f5378794e6f354e66544658675a36306e6976457a742b744670654c38506a514f715158686b5a496e7256794164545145643070354548353054484e47662f6155386c4937776f4c556f7457695652796f564a5963376b664b714a654d3850674a557358596445332b394b724a51666953475a6c5034567a5842704735436b556e38534b54693369432b726231577647574c616d6c3336484e4b71714355476b7a4e332b6c6567535a3331476837506a6b556944784579667a4b64715952333173777957432f476c3670677675586f676b5a626d4361496a7477656c535737746a796c543630524850456477516667614b596e32784e56587739697438644b6e374c3643725970314e5861783656666a773462584a4e56306d4150612b6c556d30394b5979536f7535594367354f49514a6e4c67343756506c77345a66496358666f6f396a394b39396958734b72504737514f51575965754b497437793375564a686c52386338476c7248686644474f73694b2f596b3743754e6c4832464546785553346f2f486a5269757759326b59717472614c734452544d4b72596a4643346e304d5655434732687a37707271764a4665305059672b356e77414d41636b2f57724263494e7330754c45387961387a58306659656235527574326f366e3631594c314f784e4a7645785865506967654d4e5a683337652f4a46412b4e636232583855724435306c3970666b4e6833726778503469633074343047736c44744f494f6d367a4e387a562f77447230366243516d6b4171516445393430756f6e3247726f6476786d376e476c7058306e31327143584d6e357154693641506b47617653347a2b45696b4f5a484b6d4f456e5938334a2b64465253696b717a6e6f507256715474316646497449644e4769696e6466644a4877326f714f36516273353166577335444954314e475250696f375347716a5252332f514b506a525546342b643349394d316e6f706355556c7a673150554270706d7068767971354c476945346f366a6151316c3175526a332f6c556a65486f615632503059346c2b682f4e78466a7a4f61436d766458765a705a375378356b66536f744e74754238713554394e325841544a644964736b56535a6943476a6b4f6f636944676968535a4a442f744d4233794b6e48627572617452783278544f364a354f653462447837694675522f4e3856522b46365a7766785a41774874437645337731442b395a75575052494d7a632f774b6f4a2f7656452f676f78506c7744754d366a6e346230617a54364138615a7559654f32633279546f5438663647724478617a4a4b2b315136687a426343766c5045727942523462744a6a4f346a58422b744c506262615674436c314766644132507871695a756c714131435072736e3853634c5279725873575232796138723476633331715a6d794c6b34322f774277663272715a344c4237344a6d32684f573862375679574a6c556548496f4f636562345651494c2b464934674e59507659506c4a39506f5455593462683446382b6b367570787433717464526d58397a7a6634506d536263506e566970415967343271507373692b3947772b5647573931374d374d5a4e5a513479647965582b66745277346a4f43475646324851626b4539766c585072733038725531526a6673517579526e7a357a327153334362676f3378725333576870774c697a563432393177752f4c7255473446615849456b45367147413868473943763841305a66377251597350777a526c6c6474695142586a354a797a5a4e614f542b465a31414d557352774f7564366f6d2f686d386a476f474e7652547a726c3132437637472b4b6b4a55557363436955495441393575314d6f663465766e58506868426a4f574e457766777a65484a50683673485974797064395668393047707357525a4a7a697230786e66663070702f6f5530626150456a443666643350543462564c2f51727649486867626339573261532b70786652696d674b4e73555845575964714c7475425843736459584248505674544f4468576e4b767048784e545a4f70782b6d4d6d583746533542414a337135556c626b6d46376b553050446e4277486755343534337151346569377450492f706e6c5537366d52793246796f36376c47502f77416d7241584735556744664c44616d635674434a436f676b596a486d4a42465461434d445849716b394e545a492b517054366c47366f587842704d4e714f4430786a39614c69746a7a49596a73462f716156337647765a6e384d524b755430774748716146672f6943525764692f694b7778674769635a625771423735527042466f7957415834484e44584677735a302b464978787468615879386649476b5238746a6e745534654d493431615569352b63383655734f52623067664e5030467662753953552b4262425979766d386e336f4b65383470503546686441324d5070327a544563596a6b79785a6342734b574f37663472782b4d735a53375352704146776f555a7a2b2f3656545063763641764a503051796344346a63414e4963794d66784837563476384e754642646c4c367345356f6e695846704755704449344c374b7138386630705650784a6f37646b52384256386f424a79547a7a745675507a3075644254634a2f513438426a694f6d4e3078314a6575724d546352757a4964546b456262416d75702f687a2f354165615068352f7163776b2f6d3667716b67345948536531576961575654683162526e47474f2f706a2f4e4c317979365a4a634d4e74555a387839614a69733574434e41757458547a416a336a716250716557617263516a7a64575345727a52364542445a4f514239766e5433674e6c6333546f6f56454941627671555a47666943667653323034644d736c74634a626a53546c6d4f7755376a3939363156764e4a7149676945536a417a6e4150546e387a2b2b557655576c4f6b685936536f5977634f634959355731594f793436665035565250775573776b45783859655a6344314f50674b38696a755a727549724d4d61517a5a42775748543950765470686365456443786c6941457a33503746654c643344573566466479464d484658696b53425147417a6c6a356a74544f3176497047574f5a5153334c54794732615833646e47384a6a57547a734268386e485872322f7456567059614a4745637a7178417764734137594f6577322b395a55593658786d7a5649664e5a7779376776386a7a46557877527575336951366439544e7352516b4d386c737a44575741417a676538435476552f6159376b6c4a31494b746874384462705346464c33734737396879326934314c636877634145386836314b5468383241566c386f4753527474516b3175463153514d5343504b686243387633306f53596355596c42634b6a4879375a494861756d473931526e6b44764375466a59743078675a334e446932754a57317a335371447955485944303730744e343861732f6953454b536a4e6e47546b657670393658724864586b707543574f6b4e356a7941776476765655594879326a504c70774e6847734958784c71584962446b7473542b7a544f572f7372654946354e5849726a38565a71366b6d697447456f5a46777841493548416f433576386a2b576f414b6749434d347a6d6d66692b546c6e50506f613237343244624d36534b684f343637556f7550346764424945597675504e5763596b686c636775322b44304862365656636c5471385351345847463556526a364f4a325974356d4f447843466d643542686a37782f70565358454f32676f712f6c363836546f644c365474747638414f6837713544534e673559486331564f42634955386a62483179366d4e6e6a6d4a774e6c41334e4c68647447684d6a4d644a77506a51556430324247423554313961744b68394f77327a672b744d6e4832374d46336f536e754e62416c676f2f456331644a4970547953456a6c7a7a52334137663265386975784b366864586c51685475434e6a67344e53626738437975794f4934542f2b594a7943446a6c324f394456776e6f457461516b65526c44356b4f47504d484a785654616c55666a4f4270584f33332f414672526979736f704a454d654a43414d446d42736636416657726f4f455730387a537332704347476e6c7352734258666b784a3359326a4c52764d774a384458766a4b5070483078585675557362654f4e46574a56776f486c5433765775706236325067586859686d345a6d344d4465474654794f53536452413666504e584c6451324b4b73455143494475655942353550373656472b637874766e7a59432b587070352f616c4e7834747a5a53764352714c78746a503569526e345a3270307032747a7a6d3662304e48444e474c58783377527241544232302f30776331475069456b312b4977793555374d70774d6e6b506c734d6d6b4e7464616f7252664549526f76456254766b366d322b6771797775356c7474656d5250615a79466a30347a68546b48307953666c536e302f4c5963386d6874754c6d4f457649326d516b655841497954742b6c4f6244694f57525a77555967655278676e7467644f74596f33306e447264704862564536614e59324c4e6e4a306e702f6d7237572f5338455267456372653847622f637a794b2f455942487835564e6c364e557453694d6a52726d396c61552b4d56514e6b4253326b6b5a3644714f6d31474c374e71594541797570624136446e386363767257626e6d5335614761344b5965506b4879415233492b6670796f79436469384d6479376b737a6f43527a4b354f50742b6d33576f373666596f6d74655176695639484173636b532b4a6744413073434e3866616b506a5846316379496a496936695378353549424858422f46546d56494a5661565778472b504541504a64382b76706a754b793838704632336946684d3531506f4751505431716a70345454533546354d6952727242475453736b3868474e5158715365572f39717657387772534b644942776f47546e343535566c4f477933627a4b4c6f36735942546d542b5850594849487a72555258646d6a4c466b4b354f5744666d3966333071664e6963503662463669726956764b4c7375755a41774a59735353683759504c7467643645694632713635443569516441636b4c76746e366a76546937555253466f626c74546a4a4567794e2b75632f764e4c48346f6b63446f30696d5252755175656d336230716e4856564f6d674e744a6c46384a5a454c5475536f4f3442497963632b654f6e576b38614b747a686d386d433234355a7a2b2f72526373736c363652496f4c4c677467615142364437664f6c774d6f777971635344664335324a376645665372636376545152545a4a34542f4e6d5664544d2f6b583954364367376d476374357335306e7231782f355273797446446f6a506c55365267376e4a324a394363697235496e554a473869644334485050384162302b4e4d543042376d684b79584869425153664947507737563373696f63506b6c6a6e616a66446b5877316a4f574f33336f575765574f527474544a7a49376e31706b30337761715a64425a6f4752704748505a6362556262777865477572766b6474782f65673761343866553270563849646574453345557356766154736349366c736a3766486168725858633136737665665462544c43534473514d626e6666616a495a6645565a627067414e317a7471787a2b51322b314b494143424b724d677943676247446a7631353963315162382b41556a4c6155426253567a746e66356376705156693157775531326d7541744979306b68615159494b353336444f6532526a353164464c61355643714b534177586b4d5932412b5a2b2b61797250493867416479504557493737456c574f6673666c6d6f4356354c6c44484a3471497971344c65597231412b523270443656766c6a6c6d512f75654a33554d7a494c5270446b35793432337867656d4d637539645378376d53326d6b6a4c452b6249504c49774b38725046482b4a766b426a4f3134736279376f735158424f647a2f41494832716e6831784a4c644e444d724849434b453572676737446f4d67416a745562646c69686966535668637136444f344942327a394b684263496b48387070456a416243347972484f2b547a4f783248664e58366678615242504c314352597a32566c4b73536f797871554256743142596e422b4754396142747068626544346b735a6b77774a5a546a427a6a505839382b374b4e35486c6c73466a7744454630492b534f7535376a636b2f484e4b4c686965485175305365496c30305a59722f77584766767479363731306131737a556d6966453573773230414f7751595666654936656f7831474e36387370787738794356326c6b425a574b5949775267376e3444743071714b2b64555662685663486b4167556a594849306759783371615250637a736b51654744497a68515749337953616131746f77395455785861657770665779425a576244485473783561683148705237794639467a674653716a4b734d35323870783179756e7361796c72634a62443264574a51485547636e6b4279472f725534754a6c5a784637346b4f6c6c556e476b6e6b414f324151652b33553142574456765159736873703459586949535172433438526d58384753646a3966312b6565346b7475742b366868497273436a483875357742394f753943543854754a593252727055494278486e716f3347652f493738732b70706376453275496f316e6a2f6e572b43484177784849672f583762316d4c70716c61675861614e7078434b474b325668724572672b5a434353784a4a4f647551774d6b6a59436c6350456256464e756c773569476459654c7973663841742f54474b587278554e626b54694f545541714b32664c394e7a3966576c6851334d4d3032484d6d5270624a7870363578742b6e394b4c46302b333867566575364e477436684967637765447148664a7a2b5564766a696c4e3563447879385a4a444d51716e6f4f512f536c304c7970476879776862596b37454e76672f4776533278584f44766b34337a54316855734336624e4877692b6768697564544561394b6a4f344334335033716c37324249334b4967364953752f77417a53474d755a6c52656273416f5065765958634945626b547667353336316e6833624156554f5776516b6254526f6d63626a484a747366705155627358566e4a4931623550582b31426b6e7a4145686651666172444c4a4a4b71494e41306a66493565765369574e4950555a7179514b6f5674524b376e7550337658504173715a4b685249504b42304935354e4c59324c527556664f6b42686e484c727933486570576c374b373653664b2b635a7873652f77414f2f774236487874626f4c566a585442704a6b54535938484b6a6d4473636a30494278366d713732365278345335776d774763352f65394c4c71355a64614d3671514d646362477134357059592f4364554869636e49556e347133503734726c6962335a71706a4b552b3670303430345a69547a394b6b556a384855775a6e5539743142493954362f576c70614e6e773673514e6741337666503939615a4c784f5649566a433469436252676e4177653572726c704c514f583950495a692f694b685a5136487a4c315544392f5767316a79515731425747454947366e473265344654745831724e4a71415571565a687353645853716c6c4d6e386c6369545353663766593179576d6f51624463516f756d38447534354d674c416a486636313141654f30666c4568474f66586576617a786f34476a38756366686a4a4878794b4f34596f62415941716d4a4144793145675631645437344a6d53346449353474634b584a31787353662b324166314e51767966394b51644e614e394e612f7069764b367339722f67794f4256624457724573636a504b6a344a6e3844494f6e66486c327a7a72713669766b30434d7a6e4a4a795343633437565368595436677842584f4d48346d7572714d574e5a475a673745376c2f3643672b53612f774152352f582f4144586c645152374231596443785936446a542b5847314d3756556b75356f576a5877784672774e7477746556314a76674f4f51467750446b58384b71474139632f356f5231426b74543164384d652b2f77446d764b366a78676c67774a6e5441495752514d3737484f61746b525a4c576432556168477a3547322b6136756f33364d6e6b446b59724a6748594f4252554c6b763465326c7565506a5856315a526856714f6b4f4467687a79394b6e45533071726e474a635a485047613675725051796551546943424c325a5154355777445258444931754a6f7265525234594772596235333631316452763942692f6651704a7978512b367262656d4d555450493757636a6c7431427836637139727142386f44327978574c4a62515a307859316156323379422f576a4c6530686b7552356450686f4d616575783531316453636a30577852473633462b4f76556a65757271366951706e2f2f5a, '0', '2025-01-16 13:44:05'),
(4, 'Laptops & Accessories', '', '0', '2025-01-16 13:44:06'),
(5, 'Audio', '', '0', '2025-01-16 13:44:06'),
(6, 'Cameras', '', '0', '2025-01-16 13:44:06'),
(7, 'Computer Peripherals', '', '0', '2025-01-16 13:44:06'),
(8, 'Smart Technology', '', '0', '2025-01-16 13:44:06'),
(9, 'Musical Instruemnts', '', '0', '2025-01-16 13:44:06'),
(10, 'Office & Stationary', '', '0', '2025-01-16 13:44:06'),
(14, 'Chivda', 0x646174613a696d6167652f706e673b6261736536342c4141414148475a3065584268646d6c6d414141414147463261575a746157597862576c685a674141413235745a58526841414141414141414143466f5a47787941414141414141414141427761574e3041414141414141414141414141414141414141414141357761585274414141414141414241414141526d6c7362324d414141414152454141417741434141414141414f5341414541414141414141414276774142414141414141565241414541414141414141414f72414144414141414142503941414541414141414141414176674141414531706157356d41414141414141444141414146576c755a6d55434141414141414541414746324d4445414141414146576c755a6d55434141414141414941414746324d4445414141414146576c755a6d55434141414241414d4141455634615759414141414365476c77636e414141414a536158426a627741414162526a62327879636b6c4451774141416168735932317a416841414147317564484a535230496757466c6149416663414145414751414441436b414f57466a633342425546424d4141414141414141414141414141414141414141414141414141414141414141414144323167414241414141414e4d7462474e74637741414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414357526c63324d41414144774141414158324e77636e51414141464d414141414448643063485141414146594141414146484a5957566f4141414673414141414647645957566f41414147414141414146474a5957566f41414147554141414146484a55556b4d414141454d4141414151476455556b4d414141454d4141414151474a55556b4d414141454d414141415147526c63324d41414141414141414142574d7959326b414141414141414141414141414141426a64584a32414141414141414141426f414141444c41636b44597757534347734c3968412f465645624e4348784b5a41794744755352675652643133746133423642596d786d6e797361623939303850704d502f2f644756346441414141414244517a414157466c6149414141414141414150625741414541414141413079315957566f6741414141414141416236494141446a31414141446b46685a5769414141414141414142696d5141417434554141426a6157466c614941414141414141414353674141415068414141747338414141414d5958597851344541484141414141415561584e775a5141414141414141414477414141416467414141413577615868704141414141414549414141414f47463165454d414141414164584a754f6d31775a5763366258426c5a30493659326c6a6344707a65584e305a57317a4f6d463165476c7361574679655470686248426f595141414141414d5958597851344541444141414141415561584e775a5141414141414141414477414141416467414141424277615868704141414141414d4943416741414141656158427459514141414141414141414341414545415959484341414342494944424955414141416f61584a6c5a674141414141414141414f595856346241414341414541415141414141356a5a484e6a41414d4141514142414141524d57316b5958515341416f47474232372b724b6f4d724944454b4141414554594147367861713263665331676e3530635638482b49757533594d4550786c427a72585970613162676f5071694268514a796554565966374d414f6c346d70304c726843696269366e6c596b472f482f53724c565537487833734d6676467467474478632f6a614757386979557178627768547757344b2b397069595a7a5939622b543145414367704c635a78314a3870506b6c554b345644684f462b3058436e5155685a556f624e707972616f344f6b5771584d43742b325739756d692b5775742f37594652593850663034734c71704b33696242376c414f62742b75647a357a2b30586f574a74434461526d69764e7854737337383568736c50324d3731574b497055414832464e7565334b7265306765737a38614a593670776b434c74765763346d5657332f4533767a38456e4a4b71436b70433446412f41697a375135337833372b716d2b435576395349636a7571313079496f695164716b62556d56656f68694c7834546e55764830396f563672593771557344384b654e564f5539544d5a4e6457394b796439722f30775746676670587031656c55526b6271356d586b664f52484e5165716f415558744f6e4f755266462f75626151313130653854307735696e59452f3145515049715a6356746d6472676f4d43687030662b7a464e6d324b4e6979723878327063626f5566516c4157525030344f69624b794f71397235564c7666553268385a627062354b43727473425669675973317246626e4c5131336a394d32443573486250525174796556617146536b415341416f4a474232372b724a41513047684d7077645443674332306536465343494831363148354263596247446f765552496d37593970574766444e5263626b2b324f2f36702f76615055396f493852625248317a6b614c2b317a6c4659345272705a596f4d4175675a557843694262335376483561633577746b6e67714d514a2b3873565349455039375245796e4b6269704536584e4134317a744c45784b4e4a7646676d7138465a4258496b554f46794a32554f6c7a536466774b6941424246717631445544526a467a354a7169534b75536c46334c2f62496c5837505469302f453050464b707158367941724f576b6478467870506639427a3251756745555364475761713568323463655450564237426e3469345150526e57666c303244474e4b412b7a742b7652505437367073756148782b4b4c767970584932385246434e774e57414d796641654a464f78746c6a45576a62324d2b79426f55526a64726454655a77556376635668326d344c526c4e677172507864774e69596b49374164616479454b2b2f2f364b4442727368317270444d526737774264444c396d65533758476f376e627862763965393042635479344c33416b4c4b306a31506b6574762f7449754b53656d6931534a7a786b4c51724679334f65456a6b36346b762b4d344a576e706a76476e3541466b34786b57794736666b6859486a50375a53424f66454744694269386b543774582f6c3834363350517245586d5246582f7743672b6f70376e77415039693449533655552f44526c4679515a52456349664e5556427a39444b386451464176495775463956596637694f324838346e4356724d736375664972494e485332372f64566d524163742f4c4e6e54353436564b69364f6e4d52554439594872425a703048627a517644796e5348797769624e594b6c316c4d6a4136646c4649306a78507732554e5a31387846304a63714b4647486c7a3054507a6e557755534459496449564b697a5a6a4d513844544a526e32797867415a6d46695337552f79434678552f48455447644561643558586c307a6e425061676c597757676f512b6b734f726f534d474c7175472b4434442f3262305837367266377454524a2b5363662f436d2f616d3365736a347546655359494c61596245414f633647634f7a375630724455473353674e684d776c58562f776e4d566d386d723038586b42502b3135504b6b624542716e583761324e7964544e7569677a334576664b484c3052366d414b6a3341476365676d6a623478466639385966775576426446555164437a516f6c4f4d474651664a4a3442652f417144656842536952715355676a49686a6e3842534b64565a6c5534494d5248554d74435837454b317a7077506832554449366a4a3669647152756879627978756e62614678336c69453936597a4e466177436c5170783446693847714b6b78397a546766663577592b786c69732f557437526d6a734e4b383145357166766e6b6969784e774b5568307741306975322f5779694f43755035494a65764154564846313543712b374e4161335a3551366d4c382b515041585965436b796b73515157744631527572307155386c78335a7541323374523057565a634e4e534c6e664f527350762b576e6e566b33333831474d2f4e696a626a694558694e41793937554b642f773653644e584f3968584e304f386748412f4f354178765248413961656c44465444684e724d624366766d57664a47544231616e74556e534776515a3839306c6f68694279674464623332696f636b4a3950442f59726b44634875386e715761456b35594b48676972743863386962343670736e6762745752666e694a5972413969357478306f50694171304d53306f4369503276414b4b6a4242304f2b74342f61574a74574a3168593133326a457655667378634a68447a66794a586551506f352b455442576343595a2b45534e32766c4c6675546a785137436c774544426463424668367761352b4365453537584f654e3132444b4362616a44434550574e6b4f466c2f46496663334955333365474b78486c304f72546b79444f48654332393437507869784f75786a6666444578306c387156582f4769376b4c446a7744527639527052472f2b6f34417a62534a5759794937494e5135474873774954686731714454393132766d7061715253517230796477496a334c6f4a2b59316d43744e6472746675306a4b6c45734b39522f55444f69704d322f3963332b73674d4570674b755450734d6257393269552f36776670666c704b3467737537453055714c4a3977386c696375435a59464c75393931754b532f2b68734546697857682b66576972587a577a4f356453565161725a46473056784444444d34395545333747626b644f362f4c644d78366c4e73776a72484c67652f7766563666744f57517a376e6970777a666e4963656746695878425433394e566b6e5035454d6c353534383574656d784c7a6c52794875776636372b4f477555673165376b4f6e796c2b6f30783070784451664634576d6579504b4d616742547768453872506e56516b445031666737765542497044345261446c507a3055687a464d63446b38796d4c4d676f79553738664a626f484454674939754343774a777243355a5a43697736743745535947704878504f344e437575584f714b655a423463654668786339484561317538774150647a2b43454c73384f443445505455394778725638464e715655556836785a55666357532b7274336d74764e5637514d6a44714779376e34533773315354564f4a464d56766f686b4374694a56637943306668336b504d68493665537369696f4e36316d7a4961687a422b73684432465651477650797a7a4c65765658364a6f59647142734c684779712f426d716a514b486361692f4b6e6f6273366c374566314d77706d32464c485a7a4b7849465675366b4b44536e42342b644152596e5451676d4b5a47704d6762712b52364e797261706633564d493571306451696b4b635762586652342b46382b314b417058337836376e2b73792f7a552b6b79552f376e344372692f34635a6b626b663034672b5a5373473237383642677547766d74367561413757716e625932596f3277314165596b456d66465962426a5138723535453168492f634d31724c6f696b4e316f6364307a4349545a777a683365696f686a782f7633784c764578352b59306b4c2f576931436a546b776f41726f41596670786c337a6e5050723070775770306f6e6a4649306a6352357537596b746747576a6543467a466b49493441414a6c6e5157307673487a46674c73396f32653468336b4a3173785965566b6e6c6b542f3959346a564f4d4369346b3179487a48557739365068643462746d48584c526b54497a313171314950744266414f30615137426e49414e7045652b61323739462f687a44654e574836592b74334c644273774e50717541764d582f554b47537838563437536d767256316535457373736a4f696d7a67726b6e324e66376a435a673844544d6a4e4e63584531497758394d674c2f4b6478382b3144496836767a62513846654e6a42556b4351303338667632393949584b4e4e316177593971323971726c7559745a624d69327257346a303241546c66345a4c647a73675071624a3452776a4e78763653445a6d644b69734579382b454267317236584444496e59336d48586d7479596b43516d716e4764346a46417a6c336376526d75726879326e48314745564454776e6f2b39687265314852596559537839424d68614542464f636d6f573564764a437538334558534a45363179396f546e4e473348373270644f4f467846727847575634656158394b36454a5643516a314d617053376a4551325277772b5855483835485a4e7366324b70756372643451726a6151647561527658627a536e78696150712b3769566c4f31702f4a617a4746496f304941516e62686350754b35634a33746a5569416b64466a656b4674346b6431782f6e38347956652b31533246543031307a5473423941554a307962684963762f3467725174735062366d524b34504f57373677523733504941466e61306b453657797938783971303855495858344f5043304449737045465167346c56363559356a353458767a53596a2f423768357131506f4d37726744776a3631624a5643716b787933416e574b326f50374548426f4f4e4d796241714657466b2f385a696f6f44426650455968664d6c4e747a746352745054652b512b313534452f6479666e50685a6f4c735733736d3477624b4846736270336c68524d647266736f686351434d44724c69706173576861352f446530786767752f4c47596d346f4850686f7a49745658365434394a423167754c793135374b30703776676c413132464a4b586c7a49466f7a7a346b6f48576566564c7032342f797a55566c78646a5041715472483969482f644b6e31314636654b52486a74766f50747839542b782b66557873386568354d6c772f586a755055494464316e6838786e6868725a7074676b37436b53384871316b4f686242414941524a6b52664f5345546571594e6b566c58736f2f635446625a676f42302f6a6e5648494230484278574b387a6c30306474504545516e5957706a4d493146346e67674f315165756a6e456974546e6f426b6e46444a6b556c6c6a665956766a62716f574139786235553679776a775670757a434732652f72394c434c764a715645652b705072782b35694e2b392f333375317278794f4342576b6d524c30394a6e427938664a705841367348355451423366366d74503353454d433743773437526c575675514d2b7755692b6773766c526e7130327569616e53525a66426b456859525a6d6c377a513332797a36475161424e5570446851466a7664396a38625553662b444d4b4a55315a314a6d75776f463075306650744c354c5863385674654f6962784c6741667477635a524c4e7a6e4a44375466507a3953673174675a2f575043776e4261655a527474594e51557a327866764d552b615547755650707a46536a766267484448452f4a48337933322f376f59464436347a394d574943585779716a784c72723849496b524f68434e5a544e4a436e4d4e652f38447a4151346336585a35576770665a44453548436b794b3769723837424a34435578344d7645313867766a6b4c68796452553348617277394b5136534862306c55306f734b354e6541645a6e786756762b736e344a6d5133342b3874545279547550465051686c7449793567434153534a65546d536c6c445232736b7a646a536a41375a772b3852785639724f624c784a6f6478733864673463616438696e6431323348463072442f37566e67706f6d714a5458523063303167676b79546c4c5536774f3635483835723431787178674b5a7339504f574577382f4a34713575613764444538467564625a35524b6c4f396e613676636a6b6837415746597763345166634b6d61774f706c4258573044617a61416d334f446146627047724c645168364c477055414c48434969774c494461584355316c685059577938656662466f563037705173726f38337575344d5471515272656a5079637342637644696f534f34325649696477392b306f425a4635343964766e573857414a4b696c703672786449426e4a7954384e7730777a6e757634316f544f335779784772786a466f494755374773673448617a705256346b6770556f62714754756667766c7359505138316465362b49775267716c536c656a33327a6f39372f4d6732306f5065666c36326f66663578695939776a424755537a7541446f3361583145304d6b584366787a77416732397637625249386b70746b64524b31786530792f54465a4250494e48625051506d693435316d564d54527a58396c71457a7963554a676257732b346a694a7a6e2b4c725147745a776d466f4136674b59573375784e41432f476b564979754b2f6646534a656d51456f734542645371585343522b4164474369343063777477505468446177394a6b58544d654a4a6558746d543272503530504775733061544242784a716e6247452f6635304c4f5448597434484936564b534872446b376a387a424c485066587548685349753051747967744a316973503965585679326461754d63324448496e77714e6c34584b726b6c783754747a466a5642416b687a79556379486e6838334b6a73306248364457524b6d64584f44484941594363394d4e63783566357562635a6739586470364949665473436f7a7432567a317377536a6434373349526f556a6864374459464e3175666765342f362b5359336b6e553161613373544f5754674d466d5a697556753030334c4d2b65785a2f432b31413446766556505237644477624a4578664c3163456f774b7a334e63443449323632393430707a674a7671506f41496c3662346f704c737261365139704b73646e5a50384c5173366d7a3464624c6233454a4f564f30716b7653564934422b637755794145612f774443714f5932567848716b58353663744778562b734d55377142564637695162336a574366477a722f792b3678306142455652515255537456696b6f4f2b4e566668436e614a746236767056666f77454e71644668644e696646363542672b73313331634a36506b31422b2f456270584f4562466a66666f4b4d334d446d764c597237486d7578736d68747439346c497265576f6f63584873464752524b4e66437a426742786b6643466e49394848425348387a7a58707946716b2b41585264454d664f79327a6f4834455a476b716d6f51392f656874534337592f2b4165686c586e6539544f6535347142716b7045774466484359676d6c676532552f5748386f6a477a4e7356595257304c746c4f414141414147525868705a67414153556b7141416741414141474142494241774142414141414151414141426f42425141424141414156674141414273424251414241414141586741414143674241774142414141414167414141424d4341774142414141414151414141476d4842414142414141415a67414141414141414144775351494136414d414150424a4167446f41774141426741416b41634142414141414441794d5441426b5163414241414141414543417741416f41634142414141414441784d4441426f414d414151414141502f2f414141436f4151414151414141504141414141446f41514141514141414859414141414141414141, '0', '2025-01-21 23:53:46');
INSERT INTO `category` (`category_id`, `category_name`, `category_image`, `is_active`, `added_on`) VALUES
(15, 'abcv', 0x646174613a696d6167652f6a7065673b6261736536342c2f396a2f34414151536b5a4a5267414241514141415141424141442f3277434541416b474277674842676b494277674b43676b4c445259504451774d445273554652415749423069496941644878386b4b4451734a4359784a7838664c5430744d5455334f6a6f364979732f52443834517a51354f6a634243676f4b4451774e47673850476a636c487955334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e7a63334e2f2f4141424549414a514135414d4249674143455145444551482f78414163414141424251454241514141414141414141414141414145414149444251594242776a2f784141364541414341514d44416751454177594741674d414141414241674d41424245464569457851524d69555745476359475246444c4246554a536f62485242794d7a6b754877512f465459714c2f7841416141514143417745424141414141414141414141414141414341774142424155472f3851414a5245414177414341674d414177414341774141414141414141454341784553495151544d534a42555252684d6b4b682f396f4144414d424141495241784541507744536261487546346f306a4644544376494a6d73676a74686a7a5535725643504b4f614c5663675535556f617251535a56474168735971654b48484946467952446655735551394b546563596a747576484e574553726a6d6f6f6f714e6768427053796844475430464d38492b6c574b787142307032315232712b333949435277436e2b416f3643707269574b42417a45444e424456624e346a496b6a464662617a42546748336f6c6a59504e45776a78307079723271766658626659587434704a674d2b6247462f3366576e576573527547573856494a754d526874787961657070466532666859684d313377366b675a5a464441455a3748672f6170536c44585a6577627736597955535670424161513537433256374a69757078527a4b42554c6f4b7654524e673737614866623246464f6f71466f2f536f375a514b3057376d6f6d743830586a427044424f4b705755797661446163696f33552f77697267777152513777436d71746c4d7146687778623170356a506f614e454942365630784448536d706932674462536f73772b314b7132446f6761514870555247616c6d514c6a46636a584e437132466f644543426a47616d77534f4670794a6a74556f7065617449694956694f374a6f694b4d55344156496e42726e7539736169614f4d5556477542554d58537031635533483937434845347267634876585735465a58346d764a4c4359796d366a5653764559684c756670754148577438527959764a616964736931516d377639393036526c4473696a385573476231436a50507a6f575262595853326a523442667a787532317044334f514d656e33724e77534b73776678596f587a77537847536576792b31455433747a4f52645065517a4e4775476b5674755031394b32634f74484f39796659644f37616265474f36414b425474534a6c434b32663369447952794f65395132386355354537475357587133694d4f6659485032717575376d3675414a5441576475534a493932546e484a3641352b745278334c53716a4f6e674f4d4847373872413478672f385554687441756e766f32576965496d6f4356423445514f5855726b6e6a6e4f6636673175565a58554d76494979434b386d74645a314c4f4864544445517733455950734b3366777a72734f704c344b6f305467666b4a3434394b7a5a4a612b6f30596258786c34527a586359464a6a6738385574774e4170544e68453152734d314f5144556241554c6c4249476359706777616d6b58496f556b6f6661736d54706b4f794a786b55507449624e454238396134514f314b35614b59304f63644b356a4e496e6d6c6d744f4b7469396e424744545a4643697537697070727675706a725243506a307055754b35516332586f725335666b6e36555243514b72684a6970593536746441746c6f48466433447251516e70336a63554e396c42596570466b6f44783634626d7369787473596d58435365577042496670565646636a76553575557831706b79786846722b742f73363232706b5379715247343747764f4c3756376c354643744b727341432f4a5a2f5442715456376961363169394a6d66775647364e4170594535344139445642504c6458456b6c754d715132343964326577354e64377876485353624f523546566b762f52595158482b66346c784c437a6548787451357a6e75514f763139614954555753596d556f426a4a3365584950546a2f774256547a577269306a5a4e6a62736853526b6b6576546a7455734563793279373351534b47456950304838756359725738557673536f4c4e72324838537a43366c32746a4f48334a7450742b74544e506253782b524978426b44647a75556a674771654e3154416445646e4179514f50626975777263433469574b62776847534758626b486a50593450387157345836496d302b697a6151787953434f326a6c5545624e6946675279446a307a7877665372394a3478635158316f72517a62384e4346326b34474f67355039617a666a3357387448636c6b4934474f754f76663556596153386b3556424f706b332b5356697a62526a6e507031705753587273617437505474497655764c4a4374794a70414d74325a66596a326f76786470494e55656b365a485a3354795133346479754346664f3863666d4836315a534e6c7a5850706439485478743865776f7a726a72696d654f43657441797467554f733247786d685930754e32346355504d504b615a424e536d6667316c70464d485a3970726f6c6f576554427141543834704e517747797933697565494b4445314979302b4f67416c354255526b356f4f5334707363775a73453062374c54446645464b6874792f78557144524e6d6646787831726f7563643671544f635554423530444538477567385768536f73307538446e6d6e746538565479796545324d3546526d355072565044736d79354e336e76585675436170567544363052484b66577036644959714c714f344948576e6d354a3439665371754a792b526e705439786a59456e4f61553866593261524c507045647863695945714d4865454a556c6a6a6e50305033724c617130566a635337566c5a77334a57506c73657047423766537474617942674b376336506133614a76587a6f685657504f4166317256677938482b5877546c78716c74486d3935633374354c627a794e63784a49434274424850396a79667655634e6e4a797a4b504c6a624778495847414e3263592f546974503855365a64764a4662576953547851706b45727456442f41424675352b6e61732f506358556a67584d7a6d4b434d75653252794146782f582b566447625654755444634e505278794c4f3456596f69306a494f6d574c65765159715038517179623558654631364a7379506b6331585839346b756f6872574f61554e486a59712b59383579546b38644b4d7434726961423269694a7541685978654b574947656341306672307473427a2f41414975705949596d386663714679637467444f66663663696e5133304b32384c77776a78355777674b2b555950667239774b6a65782f61463948625352584e746b68517a782b5850592b772b7461714c34503156744d537a6e6e746e534d35556c7565765934343547652f576b33654f4575544c694c5a622f41697a336c773135714e753045364b646748355a41656a65682b6461756555622f5368394774356244546f726165344d3771754e335448383669764a4e725a726d586b6d72656a6f593534794f6d66496f4d7668695258544b475872516c784c746f4b6b636d57454d2f7652416c33446b316e34377244594a6f364b34794f4453586a5a477961354a35717438545a4c6b38556337686c36315633586646457054416f4c2f4762564f635645627a49344e55736b6a4b78354e4d2f465939614e5976344b624c5a3538394b594c6c6b4f5161727678507561516379634c6d6a395a577779532b63746b4846646f59572b5279777056584241374b45796b564c44656d4a6470473455457a67696f392f4e64583137585968574853584a6b6250536d4355304a346c49535650574679446b6b393649535841363157724a5569796539413859537374594c7259787a304e456d634f527436565452767a316f3641394b56575051796368655755754d56625279674163316e375675636b39502b614c4e30454335494765784e5a36683736476369306d644a455a4a4d4d704849504e5a6934304330534f3465376b4d69375732494d6856474d59786e2f6d6a50326e4157496156515163597a366461476656625967743436594763382f7744665131496e4c443646315573383861325a6e613474475656303631446c6c482b6f6f634168674f76553539613942306d3364342f78326f5730554d307a2b4a4846454e6f6947427867666369736864584e744271567842616854615832466b494835517a41746a2f396665746e2b30626135412f447a52794b504c674876387136486d504a554a4a433563374c71435a47634567456a6f534f522f334657304d7732672f30724b576c797059346249374772654734426a3631784b6874396d6855693445347741543936427670516338304d317a782b59304c65584932452b676f356c6b64446b6e35786e76556c7779374f655456414c6f6d59593655664a4c754876576c7730437247534562736a6970494c6a42786d67704878517158494d7077654252634e6f6e73374e4573325231714f596868566648636364616b38624936307631364364374237706544697132556c543171796d5945565854302f4849716d516d5967306259532b516e504e564d6877616c74626b51487a63673039342b686650526662383071435738684b6a7a6756796b65702f777232497a6b63756159386d44516b636f4136303135736e7258576d4f7a424e68676c70322b67424a556979594171564931554871394f45764e414b37534e746a5575336f6f7a52747259585532356d6a4b4b4f7049504830363069754d39746863324751746d696c7549343432646932316570413655546136616b6b574c654f533579704c626571593756484777764c6a396d535233483459384d6f626151426a50662b565a586c6d6d7770354d614e5777646b61454d4f3734782f4b674c6d423775342f46584f6f487731506c6a6a48412b512b6c473676706b304d736a3237796d3337735347594448706e4e55533345586a6d47376d4434494147773463656d66727a523439557555423071312b524f6d6d7879537046613345386a534c6b38636b3535626a6e4651366e5a4c747a46666c534273784a79632b683738632f57724f58554a5a566142474a695650346a6e4137437165585572595830636a4a6834755230415076544d565a4e39677145775762533952746c6a4d71714474385145386b2f39356f4751616a4532386b4f4579775a6662394b30536172466472496c7943716b3548686b347a363157365a457a334d367a426e56546b464a4e6f59665069744d5a71302b612b4265716b2b694c5366694f397334566a58595930504375446e76337a57303044346d6731474a77794d6a4a7979344a78395256487630316f6e6765424e2b3065426b634c6a73636a6e4e566d6d5452526d353268595941336f667a656772506b785938796234365a6635537a305a4c745a564a69594d50365644635373554e5a585364534d63526c354b4d353877504248322f5774435a77386556497761775669654f6733622f5a5779794d4a63305a426553624f33316f4b354f44557474686c785275757578587337466458636834417836346f574b624445357161356971766d4452316f78704e436179365a6278584846454334724f78334f44524b3358485771654c73664754614c68357369684a7061462f452b395279545a6f6f786c315a3252386d6f5a48774d314538767655556b6f4b3961304b44506b735453383071446151626a794b5648367a4e37474174634e6734344647574f6e5839384e3174617975754d6c794d4b42387a576b653373394d736265614b785262737676527645566d515948555a354235376363656c57483752594269564c754f532b636e322b314c767932312b456a7077364d314e6f73316b7537554a42454d675951626a6a35394256336236506f6355516b4e79387842506c6b347a366344327851452b7247535635356f6c6c43674a47484f516f372b5831714a59726e564d4e424b73616a4a644d343267644f6737307136797654623061466a532b46786f647a44486671596b56446a65754632424f77794f34363052714f74746233424f59764d6d444b716b5a357a3836704e516b38433742534f474b4756736b52344f334950636461703732565a436438736a6562486d482f654b582f6a713735736173576b624f6258335331435063474d375277704159635a79667457646c2b49356c315a324465496a44413965527a6a46553931714b53464a43563450424b3844672b7442526268632b4d3452636a7934413536396854735868524b6261442b463764617a65654b456b6c4f303867413572695872547344734a624155445a6e4e5546793566473975683478566861585169534d72502f6d45344b74356944375531345a6d656b585436374c44546b754a372b574751434952487a3562492b5846447a365434742b62435a456a6d6b4f2b4e6c6241786a6a6e365648464e496b2b624f5547562b584f636c6a37567037532f687435524a5048455a74716f58417942337a36642f31706433654e3758384671552f686a627a5239527374532f44327a4e49546a42626f545256705a613344495958384f446332537839666e5678385233724c5062335563364d7042417a317965666e3656575732734b32544e4875524151565a6a6c32505835635970697958634a365153356231734b7337645a486154566270356b5534574b50796e337952312b3943617070346d756f376254643862532f2b4a7963442f37632b31433365704c4f7069746f434f75304c6e496f7a544c2b4b305133643135703845593477414277506c556d626c38762f4273776e394954486332747a2b7a62634d30674f41546b384476783272533666442b457468435a576b6338737a647a56526f2b6f336e346837342b4a6c7a745679526b6a2b745856714a372b354b32734d737a736679786f53632f536b353356506a6f7a5a317836527952533759394b6d556243414b30576e2f41757333474a4c7752574552357a4d775a76396f2f55316f374c34662b48394d5a6645694e395038417854666c7a374c307063654c6b727439436f773366773838654b5766793238627a50384177784b5850324655756f6d61326b384f34686c686b50524a59796850304e65397066694b4d52323043516f5033597746483246445855747666784e62366a6277334d4236704d6f5956736a783150374376776272396e7a3031776335483871656c77665776584e552f77414f766872556c4a74466d734a6578686663762b3171776d756634632f45476b6b76617872715671762f414a4c62687750654d382f624e4d344a674c78386d4a646c454c672b744f38665065713132644a4447345a4858716a6a61772b6c4954594866705665734630475353304d31777750745562795a46514f32615a4d69725a4f5a7833464b684366656c544f4346614e656d643838596b334c4755614d4c4b4e6a63666d3655482b4e385174346a38754e6f55453865702f7254625361473675707045595354465343646d3165673578394b45757270556a412f797973494f31456a504753523072417054725231754936356b686a47784d654a6c53427a7a31783756466136784a61584c77794b4a6b554b7168786b4a67354a786a6d71793675636e754e7241357837482b394e78627a584d766a733247595941376e3372544f4e634e55677667647256365a57745a55664c6a6c6a6a3937766a394b7235706d6642414f63446e70584a514a4c5a50444c62413759334470536a4731514d5563776b744956655a536957473361624757494859486b43724f44546f6746385a79324267593446415275567751614c463264754d3831567932594d6d6649333063757253324977685a5437746d7131347a412f505472346735342f76526253456e4a4e635667657550745553614b6a50632f526c7664626e514c47716a6343323045467659566232326f4442416967436d4d6b686c7877654f78362f617167774b4d46564f422b364b68654e325a69576371653250546a6e4e56574e556234797a5859647245736b6b6152675274476f3851454e79666246567344746344644a4955566569394d697032694c526f7945376c3667353546632f444a75486a756a4c6e387171654236316370537442504a4f2f70317237775969747341535431486569744f746c6c5579336b6e6c417a744441633434716530304b386c326b685949322f6559395257792b4866684c545a49585736754e35626f2b5343702b585371613630756a546a78757532482f416568366265786d652b692f4779742f70573462796f76713250583072637472317270555a747257433367433842593143675937566c594a472b453759326c764c4c666d34666376677068674d66764e6e46567478702b70616c493038327933567a6b2b4b344c4436442b3956314d365830302b715739737674522b4d7349533741664d304e5a6e576453496e434a61773964382b51666f76582b6c4d307577307a5470466b6343357542794a4a65634832486236557a587466444b59304874785176357473502f556f4e7574562f423569452f696b446c756c563766454a567547724b7a584473575973636d676e643250476157375a616c493330487851466b436c754b30396872306271766e362b39654b4f5a4e774b37733159576d6f334d4247436169746f6a6d61505a4e513037524e65514455374b337544325a3138772b54446d7368716e2b456d6c7a6c704e49314b3574575049696e416c54364868767554565a703378484970416b61744e592f45537342682b33725470796f7a333473562b6a7a2f5650384d666953797962654f432b514472424a676e364e69736e714f6c366a706a4d4e52302b367474765670596d432f5275682b3966513176724b755039536a6f39536a5a634d774950555531576a48666772394879364856686b4f75506e53723656754e492b483775517a584f6a36624c49657279576b62452f55696c52636b4a2f77414f7636664f726167565962553263636b4447666e366d6862693661587a4e79434f6e746e7655486953466943707742774f6f7275316e775777654f51525331435447316b556b596c64314b6a38704a464f614a54676e714f395342516f386f4148734b356d6d364d315a6d2f676763644b6544556464426f684c374a67314c66554f366e4b63304c514f69594e546761687a54304e554330544c5847626d756a705554486d72305245752f696f32664e4d4c56475871754957746c2f70576f49305867584e3030624165516e70392f373162787463776f5a495a524b6a486767342b324b78472b6a744d766a5a5841667a736d4d4651324d304e34396d2f4235626a38612b4772476f587368786d546a363039722b2b4b37534a6d2b3156613633624d77506853526a766b352f7055363676596b656154623831616b4f4b4e382b5669662f4147436f727135556c6d5a6c50706e4e4d6b655351376e4a4a507255413166544e32476b4f50614d303235312f5434686d3369615a38635a4742397a5165756776386e456c2f794a307433636c694d4b4f703743685a39537372593751336a79446a456654376d7154554e57757234465a5a436b58614a44686638416d6746616e546958374d47587a71665546784e726c79577a4846627872325862752f6d662b4b50734e64744a735233304968662f414f52443544382f537330546b5647615a3635305a35386e4a76625a764874566451304d6e586b6539524c4c63327a34795269737059366c63325278444a6c4d38787479702f74394b30646c72647065625970783455683441666c666f65314a7645354f68683871623666544c7179317834386232713674766944676559566c70624e57356a59412f77414e44736b734c594f6157613937505145312f77416f38394b73454c6d56654d6d6c56386d54534d634d4e6c69426e48616c696c5372596564707473523656485370565a4256796c5371797a6c5053753071706b5a326e4a53705549424d43616a66725370555342524554555a7055714963766771636872744b725a436444785857344664705550364576365173546d6d354e4b6c516a45684870556561564b725261484131796c537145465431506c7055716847576d6e616e6457377247723734797747312b63664b7461634e674541676d75557179357670302f437075657765654e566b4947635571564b6c47302f2f32513d3d, '1', '2025-01-29 10:50:38'),
(16, 'abc', '', '1', '2025-01-29 17:22:01'),
(17, 'Jewellery', '', '0', '2025-02-05 16:01:23'),
(18, 'Sweets', '', '1', '2025-02-19 11:38:13'),
(19, 'Savories', '', '1', '2025-02-19 11:38:37'),
(20, 'Cookies', '', '1', '2025-02-19 11:38:57'),
(21, 'Savaries', '', '1', '2025-02-19 13:20:21'),
(22, 'TestingCategory', '', '0', '2025-02-19 17:38:27'),
(23, 'Snacks', '', '1', '2025-02-19 18:59:32'),
(24, 'Master Bakery', '', '1', '2025-02-19 21:54:43'),
(25, 'Prime Namkeen', '', '1', '2025-02-19 21:55:05'),
(26, 'Master Namkeen', '', '1', '2025-02-19 21:55:27'),
(27, 'Amul Rusk', '', '1', '2025-02-20 09:47:12'),
(28, 'Icecream', '', '1', '2025-02-20 09:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `category_sequence`
--

CREATE TABLE `category_sequence` (
  `id_category_sequence` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sequence_number` int(11) NOT NULL,
  `is_active` enum('0','1') DEFAULT NULL,
  `added_on` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_sequence`
--

INSERT INTO `category_sequence` (`id_category_sequence`, `category_id`, `sequence_number`, `is_active`, `added_on`) VALUES
(1, 1, 1, '0', '2025-01-22 01:28:42'),
(2, 2, 10, '0', '2025-01-22 01:28:42'),
(3, 3, 6, '0', '2025-01-22 01:28:42'),
(4, 4, 9, '0', '2025-01-22 01:28:42'),
(5, 5, 8, '0', '2025-01-22 01:28:42'),
(6, 6, 7, '0', '2025-01-22 01:28:42'),
(7, 7, 2, '0', '2025-01-22 01:28:42'),
(8, 8, 14, '0', '2025-01-22 01:28:42'),
(9, 9, 4, '0', '2025-01-22 01:28:42'),
(10, 10, 5, '0', '2025-01-22 01:28:42'),
(11, 14, 3, '0', '2025-01-22 01:28:42'),
(12, 5, 1, '0', '2025-01-22 02:32:10'),
(13, 1, 2, '0', '2025-01-22 02:32:10'),
(14, 7, 3, '0', '2025-01-22 02:32:10'),
(15, 14, 4, '0', '2025-01-22 02:32:10'),
(16, 9, 5, '0', '2025-01-22 02:32:10'),
(17, 10, 6, '0', '2025-01-22 02:32:10'),
(18, 3, 7, '0', '2025-01-22 02:32:10'),
(19, 6, 8, '0', '2025-01-22 02:32:10'),
(20, 4, 9, '0', '2025-01-22 02:32:10'),
(21, 2, 10, '0', '2025-01-22 02:32:10'),
(22, 8, 11, '0', '2025-01-22 02:32:10'),
(23, 5, 1, '0', '2025-01-22 02:32:47'),
(24, 1, 2, '0', '2025-01-22 02:32:47'),
(25, 7, 3, '0', '2025-01-22 02:32:47'),
(26, 14, 4, '0', '2025-01-22 02:32:47'),
(27, 9, 5, '0', '2025-01-22 02:32:47'),
(28, 10, 6, '0', '2025-01-22 02:32:47'),
(29, 3, 7, '0', '2025-01-22 02:32:47'),
(30, 6, 8, '0', '2025-01-22 02:32:47'),
(31, 4, 9, '0', '2025-01-22 02:32:47'),
(32, 2, 10, '0', '2025-01-22 02:32:47'),
(33, 8, 11, '0', '2025-01-22 02:32:47'),
(34, 5, 1, '0', '2025-01-22 02:33:16'),
(35, 1, 2, '0', '2025-01-22 02:33:16'),
(36, 7, 3, '0', '2025-01-22 02:33:16'),
(37, 14, 4, '0', '2025-01-22 02:33:16'),
(38, 9, 5, '0', '2025-01-22 02:33:16'),
(39, 10, 6, '0', '2025-01-22 02:33:16'),
(40, 3, 7, '0', '2025-01-22 02:33:16'),
(41, 6, 8, '0', '2025-01-22 02:33:16'),
(42, 4, 9, '0', '2025-01-22 02:33:16'),
(43, 2, 10, '0', '2025-01-22 02:33:16'),
(44, 8, 11, '0', '2025-01-22 02:33:16'),
(45, 10, 1, '0', '2025-01-22 02:35:00'),
(46, 5, 2, '0', '2025-01-22 02:35:00'),
(47, 1, 3, '0', '2025-01-22 02:35:00'),
(48, 7, 4, '0', '2025-01-22 02:35:00'),
(49, 14, 5, '0', '2025-01-22 02:35:00'),
(50, 9, 6, '0', '2025-01-22 02:35:00'),
(51, 3, 7, '0', '2025-01-22 02:35:00'),
(52, 6, 8, '0', '2025-01-22 02:35:00'),
(53, 4, 9, '0', '2025-01-22 02:35:00'),
(54, 2, 10, '0', '2025-01-22 02:35:00'),
(55, 8, 11, '0', '2025-01-22 02:35:00'),
(56, 10, 1, '0', '2025-01-22 02:37:10'),
(57, 5, 2, '0', '2025-01-22 02:37:10'),
(58, 1, 3, '0', '2025-01-22 02:37:10'),
(59, 7, 4, '0', '2025-01-22 02:37:10'),
(60, 14, 5, '0', '2025-01-22 02:37:10'),
(61, 9, 6, '0', '2025-01-22 02:37:10'),
(62, 3, 7, '0', '2025-01-22 02:37:10'),
(63, 6, 8, '0', '2025-01-22 02:37:10'),
(64, 4, 9, '0', '2025-01-22 02:37:10'),
(65, 2, 10, '0', '2025-01-22 02:37:10'),
(66, 8, 11, '0', '2025-01-22 02:37:10'),
(67, 10, 1, '0', '2025-01-22 02:37:48'),
(68, 5, 2, '0', '2025-01-22 02:37:48'),
(69, 1, 3, '0', '2025-01-22 02:37:48'),
(70, 7, 4, '0', '2025-01-22 02:37:48'),
(71, 14, 5, '0', '2025-01-22 02:37:48'),
(72, 9, 6, '0', '2025-01-22 02:37:48'),
(73, 3, 7, '0', '2025-01-22 02:37:48'),
(74, 6, 8, '0', '2025-01-22 02:37:48'),
(75, 4, 9, '0', '2025-01-22 02:37:48'),
(76, 2, 10, '0', '2025-01-22 02:37:48'),
(77, 8, 11, '0', '2025-01-22 02:37:48'),
(78, 5, 1, '0', '2025-01-29 15:28:08'),
(79, 7, 2, '0', '2025-01-29 15:28:08'),
(80, 1, 3, '0', '2025-01-29 15:28:08'),
(81, 10, 4, '0', '2025-01-29 15:28:08'),
(82, 9, 5, '0', '2025-01-29 15:28:08'),
(83, 3, 6, '0', '2025-01-29 15:28:08'),
(84, 6, 7, '0', '2025-01-29 15:28:08'),
(85, 14, 8, '0', '2025-01-29 15:28:08'),
(86, 4, 9, '0', '2025-01-29 15:28:08'),
(87, 2, 10, '0', '2025-01-29 15:28:08'),
(88, 8, 11, '0', '2025-01-29 15:28:08'),
(89, 7, 1, '0', '2025-01-29 15:29:43'),
(90, 5, 2, '0', '2025-01-29 15:29:43'),
(91, 1, 3, '0', '2025-01-29 15:29:43'),
(92, 10, 4, '0', '2025-01-29 15:29:43'),
(93, 9, 5, '0', '2025-01-29 15:29:43'),
(94, 3, 6, '0', '2025-01-29 15:29:43'),
(95, 6, 7, '0', '2025-01-29 15:29:43'),
(96, 14, 8, '0', '2025-01-29 15:29:43'),
(97, 4, 9, '0', '2025-01-29 15:29:43'),
(98, 2, 10, '0', '2025-01-29 15:29:43'),
(99, 8, 11, '0', '2025-01-29 15:29:43'),
(100, 7, 1, '0', '2025-01-29 16:06:28'),
(101, 5, 2, '0', '2025-01-29 16:06:28'),
(102, 1, 3, '0', '2025-01-29 16:06:28'),
(103, 10, 4, '0', '2025-01-29 16:06:28'),
(104, 9, 5, '0', '2025-01-29 16:06:28'),
(105, 3, 6, '0', '2025-01-29 16:06:28'),
(106, 6, 7, '0', '2025-01-29 16:06:28'),
(107, 14, 8, '0', '2025-01-29 16:06:28'),
(108, 4, 9, '0', '2025-01-29 16:06:28'),
(109, 2, 10, '0', '2025-01-29 16:06:28'),
(110, 8, 11, '0', '2025-01-29 16:06:28'),
(111, 7, 1, '0', '2025-01-29 16:06:29'),
(112, 5, 2, '0', '2025-01-29 16:06:29'),
(113, 1, 3, '0', '2025-01-29 16:06:29'),
(114, 10, 4, '0', '2025-01-29 16:06:29'),
(115, 9, 5, '0', '2025-01-29 16:06:29'),
(116, 3, 6, '0', '2025-01-29 16:06:29'),
(117, 6, 7, '0', '2025-01-29 16:06:29'),
(118, 14, 8, '0', '2025-01-29 16:06:29'),
(119, 4, 9, '0', '2025-01-29 16:06:29'),
(120, 2, 10, '0', '2025-01-29 16:06:29'),
(121, 8, 11, '0', '2025-01-29 16:06:29'),
(122, 7, 1, '0', '2025-01-29 17:43:05'),
(123, 5, 2, '0', '2025-01-29 17:43:05'),
(124, 1, 3, '0', '2025-01-29 17:43:05'),
(125, 10, 4, '0', '2025-01-29 17:43:05'),
(126, 9, 5, '0', '2025-01-29 17:43:05'),
(127, 3, 6, '0', '2025-01-29 17:43:05'),
(128, 6, 7, '0', '2025-01-29 17:43:05'),
(129, 14, 8, '0', '2025-01-29 17:43:05'),
(130, 4, 9, '0', '2025-01-29 17:43:05'),
(131, 2, 10, '0', '2025-01-29 17:43:05'),
(132, 8, 11, '0', '2025-01-29 17:43:05'),
(133, 7, 1, '0', '2025-01-29 17:44:42'),
(134, 5, 2, '0', '2025-01-29 17:44:42'),
(135, 1, 3, '0', '2025-01-29 17:44:42'),
(136, 10, 4, '0', '2025-01-29 17:44:42'),
(137, 3, 5, '0', '2025-01-29 17:44:42'),
(138, 9, 6, '0', '2025-01-29 17:44:42'),
(139, 6, 7, '0', '2025-01-29 17:44:42'),
(140, 14, 8, '0', '2025-01-29 17:44:42'),
(141, 4, 9, '0', '2025-01-29 17:44:42'),
(142, 2, 10, '0', '2025-01-29 17:44:42'),
(143, 8, 11, '0', '2025-01-29 17:44:42'),
(144, 5, 1, '0', '2025-01-30 10:08:41'),
(145, 7, 2, '0', '2025-01-30 10:08:41'),
(146, 1, 3, '0', '2025-01-30 10:08:41'),
(147, 10, 4, '0', '2025-01-30 10:08:41'),
(148, 3, 5, '0', '2025-01-30 10:08:41'),
(149, 9, 6, '0', '2025-01-30 10:08:41'),
(150, 6, 7, '0', '2025-01-30 10:08:41'),
(151, 14, 8, '0', '2025-01-30 10:08:41'),
(152, 4, 9, '0', '2025-01-30 10:08:41'),
(153, 2, 10, '0', '2025-01-30 10:08:41'),
(154, 8, 11, '0', '2025-01-30 10:08:41'),
(155, 5, 1, '0', '2025-01-30 10:14:34'),
(156, 7, 2, '0', '2025-01-30 10:14:34'),
(157, 1, 3, '0', '2025-01-30 10:14:34'),
(158, 10, 4, '0', '2025-01-30 10:14:34'),
(159, 3, 5, '0', '2025-01-30 10:14:34'),
(160, 9, 6, '0', '2025-01-30 10:14:34'),
(161, 6, 7, '0', '2025-01-30 10:14:34'),
(162, 14, 8, '0', '2025-01-30 10:14:34'),
(163, 4, 9, '0', '2025-01-30 10:14:34'),
(164, 2, 10, '0', '2025-01-30 10:14:34'),
(165, 8, 11, '0', '2025-01-30 10:14:34'),
(166, 5, 1, '0', '2025-01-30 10:14:35'),
(167, 7, 2, '0', '2025-01-30 10:14:35'),
(168, 1, 3, '0', '2025-01-30 10:14:35'),
(169, 10, 4, '0', '2025-01-30 10:14:35'),
(170, 3, 5, '0', '2025-01-30 10:14:35'),
(171, 9, 6, '0', '2025-01-30 10:14:35'),
(172, 6, 7, '0', '2025-01-30 10:14:35'),
(173, 14, 8, '0', '2025-01-30 10:14:35'),
(174, 4, 9, '0', '2025-01-30 10:14:35'),
(175, 2, 10, '0', '2025-01-30 10:14:35'),
(176, 8, 11, '0', '2025-01-30 10:14:35'),
(177, 7, 1, '0', '2025-02-03 09:46:37'),
(178, 5, 2, '0', '2025-02-03 09:46:37'),
(179, 1, 3, '0', '2025-02-03 09:46:37'),
(180, 10, 4, '0', '2025-02-03 09:46:37'),
(181, 3, 5, '0', '2025-02-03 09:46:37'),
(182, 9, 6, '0', '2025-02-03 09:46:37'),
(183, 6, 7, '0', '2025-02-03 09:46:37'),
(184, 14, 8, '0', '2025-02-03 09:46:37'),
(185, 4, 9, '0', '2025-02-03 09:46:37'),
(186, 2, 10, '0', '2025-02-03 09:46:37'),
(187, 8, 11, '0', '2025-02-03 09:46:37'),
(188, 7, 1, '0', '2025-02-03 09:46:38'),
(189, 5, 2, '0', '2025-02-03 09:46:38'),
(190, 1, 3, '0', '2025-02-03 09:46:38'),
(191, 10, 4, '0', '2025-02-03 09:46:38'),
(192, 3, 5, '0', '2025-02-03 09:46:38'),
(193, 9, 6, '0', '2025-02-03 09:46:38'),
(194, 6, 7, '0', '2025-02-03 09:46:38'),
(195, 14, 8, '0', '2025-02-03 09:46:38'),
(196, 4, 9, '0', '2025-02-03 09:46:38'),
(197, 2, 10, '0', '2025-02-03 09:46:38'),
(198, 8, 11, '0', '2025-02-03 09:46:38'),
(199, 17, 12, '0', '2025-02-05 16:01:23'),
(200, 1, 1, '0', '2025-02-05 16:02:37'),
(201, 14, 2, '0', '2025-02-05 16:02:37'),
(202, 7, 3, '0', '2025-02-05 16:02:37'),
(203, 5, 4, '0', '2025-02-05 16:02:37'),
(204, 10, 5, '0', '2025-02-05 16:02:37'),
(205, 9, 6, '0', '2025-02-05 16:02:37'),
(206, 6, 7, '0', '2025-02-05 16:02:37'),
(207, 4, 8, '0', '2025-02-05 16:02:37'),
(208, 3, 9, '0', '2025-02-05 16:02:37'),
(209, 2, 10, '0', '2025-02-05 16:02:37'),
(210, 8, 11, '0', '2025-02-05 16:02:37'),
(211, 17, 12, '0', '2025-02-05 16:02:37'),
(212, 1, 1, '0', '2025-02-05 16:02:40'),
(213, 14, 2, '0', '2025-02-05 16:02:40'),
(214, 7, 3, '0', '2025-02-05 16:02:40'),
(215, 5, 4, '0', '2025-02-05 16:02:40'),
(216, 10, 5, '0', '2025-02-05 16:02:40'),
(217, 9, 6, '0', '2025-02-05 16:02:40'),
(218, 6, 7, '0', '2025-02-05 16:02:40'),
(219, 4, 8, '0', '2025-02-05 16:02:40'),
(220, 3, 9, '0', '2025-02-05 16:02:40'),
(221, 2, 10, '0', '2025-02-05 16:02:40'),
(222, 8, 11, '0', '2025-02-05 16:02:40'),
(223, 17, 12, '0', '2025-02-05 16:02:40'),
(224, 5, 1, '0', '2025-02-18 09:22:05'),
(225, 9, 2, '0', '2025-02-18 09:22:05'),
(226, 10, 3, '0', '2025-02-18 09:22:05'),
(227, 1, 4, '0', '2025-02-18 09:22:05'),
(228, 14, 5, '0', '2025-02-18 09:22:05'),
(229, 7, 6, '0', '2025-02-18 09:22:05'),
(230, 6, 7, '0', '2025-02-18 09:22:05'),
(231, 4, 8, '0', '2025-02-18 09:22:05'),
(232, 3, 9, '0', '2025-02-18 09:22:05'),
(233, 2, 10, '0', '2025-02-18 09:22:05'),
(234, 8, 11, '0', '2025-02-18 09:22:05'),
(235, 17, 12, '0', '2025-02-18 09:22:05'),
(236, 5, 1, '0', '2025-02-18 09:23:57'),
(237, 9, 2, '0', '2025-02-18 09:23:57'),
(238, 10, 3, '0', '2025-02-18 09:23:57'),
(239, 1, 4, '0', '2025-02-18 09:23:57'),
(240, 14, 5, '0', '2025-02-18 09:23:57'),
(241, 7, 6, '0', '2025-02-18 09:23:57'),
(242, 6, 7, '0', '2025-02-18 09:23:57'),
(243, 4, 8, '0', '2025-02-18 09:23:57'),
(244, 3, 9, '0', '2025-02-18 09:23:57'),
(245, 2, 10, '0', '2025-02-18 09:23:57'),
(246, 8, 11, '0', '2025-02-18 09:23:57'),
(247, 17, 12, '0', '2025-02-18 09:23:57'),
(248, 9, 1, '0', '2025-02-18 10:19:15'),
(249, 5, 2, '0', '2025-02-18 10:19:15'),
(250, 10, 3, '0', '2025-02-18 10:19:15'),
(251, 1, 4, '0', '2025-02-18 10:19:15'),
(252, 14, 5, '0', '2025-02-18 10:19:15'),
(253, 7, 6, '0', '2025-02-18 10:19:15'),
(254, 6, 7, '0', '2025-02-18 10:19:15'),
(255, 4, 8, '0', '2025-02-18 10:19:15'),
(256, 3, 9, '0', '2025-02-18 10:19:15'),
(257, 2, 10, '0', '2025-02-18 10:19:15'),
(258, 8, 11, '0', '2025-02-18 10:19:15'),
(259, 17, 12, '0', '2025-02-18 10:19:15'),
(260, 5, 1, '0', '2025-02-18 10:20:47'),
(261, 9, 2, '0', '2025-02-18 10:20:47'),
(262, 10, 3, '0', '2025-02-18 10:20:47'),
(263, 1, 4, '0', '2025-02-18 10:20:47'),
(264, 14, 5, '0', '2025-02-18 10:20:47'),
(265, 7, 6, '0', '2025-02-18 10:20:47'),
(266, 6, 7, '0', '2025-02-18 10:20:47'),
(267, 4, 8, '0', '2025-02-18 10:20:47'),
(268, 3, 9, '0', '2025-02-18 10:20:47'),
(269, 2, 10, '0', '2025-02-18 10:20:47'),
(270, 8, 11, '0', '2025-02-18 10:20:47'),
(271, 17, 12, '0', '2025-02-18 10:20:47'),
(272, 9, 1, '0', '2025-02-18 10:49:29'),
(273, 5, 2, '0', '2025-02-18 10:49:29'),
(274, 10, 3, '0', '2025-02-18 10:49:29'),
(275, 1, 4, '0', '2025-02-18 10:49:29'),
(276, 14, 5, '0', '2025-02-18 10:49:29'),
(277, 7, 6, '0', '2025-02-18 10:49:29'),
(278, 6, 7, '0', '2025-02-18 10:49:29'),
(279, 4, 8, '0', '2025-02-18 10:49:29'),
(280, 3, 9, '0', '2025-02-18 10:49:29'),
(281, 2, 10, '0', '2025-02-18 10:49:29'),
(282, 8, 11, '0', '2025-02-18 10:49:29'),
(283, 17, 12, '0', '2025-02-18 10:49:29'),
(284, 1, 1, '0', '2025-02-18 10:53:37'),
(285, 9, 2, '0', '2025-02-18 10:53:37'),
(286, 5, 3, '0', '2025-02-18 10:53:37'),
(287, 10, 4, '0', '2025-02-18 10:53:37'),
(288, 14, 5, '0', '2025-02-18 10:53:37'),
(289, 7, 6, '0', '2025-02-18 10:53:37'),
(290, 6, 7, '0', '2025-02-18 10:53:37'),
(291, 4, 8, '0', '2025-02-18 10:53:37'),
(292, 3, 9, '0', '2025-02-18 10:53:37'),
(293, 2, 10, '0', '2025-02-18 10:53:37'),
(294, 8, 11, '0', '2025-02-18 10:53:37'),
(295, 17, 12, '0', '2025-02-18 10:53:37'),
(296, 1, 1, '0', '2025-02-18 10:53:39'),
(297, 9, 2, '0', '2025-02-18 10:53:39'),
(298, 5, 3, '0', '2025-02-18 10:53:39'),
(299, 10, 4, '0', '2025-02-18 10:53:39'),
(300, 14, 5, '0', '2025-02-18 10:53:39'),
(301, 7, 6, '0', '2025-02-18 10:53:39'),
(302, 6, 7, '0', '2025-02-18 10:53:39'),
(303, 4, 8, '0', '2025-02-18 10:53:39'),
(304, 3, 9, '0', '2025-02-18 10:53:39'),
(305, 2, 10, '0', '2025-02-18 10:53:39'),
(306, 8, 11, '0', '2025-02-18 10:53:39'),
(307, 17, 12, '0', '2025-02-18 10:53:39'),
(308, 14, 1, '0', '2025-02-18 11:09:31'),
(309, 1, 2, '0', '2025-02-18 11:09:31'),
(310, 9, 3, '0', '2025-02-18 11:09:31'),
(311, 5, 4, '0', '2025-02-18 11:09:31'),
(312, 10, 5, '0', '2025-02-18 11:09:31'),
(313, 7, 6, '0', '2025-02-18 11:09:31'),
(314, 6, 7, '0', '2025-02-18 11:09:31'),
(315, 4, 8, '0', '2025-02-18 11:09:31'),
(316, 3, 9, '0', '2025-02-18 11:09:31'),
(317, 2, 10, '0', '2025-02-18 11:09:31'),
(318, 8, 11, '0', '2025-02-18 11:09:31'),
(319, 17, 12, '0', '2025-02-18 11:09:31'),
(320, 17, 1, '0', '2025-02-18 11:14:24'),
(321, 14, 2, '0', '2025-02-18 11:14:24'),
(322, 1, 3, '0', '2025-02-18 11:14:24'),
(323, 9, 4, '0', '2025-02-18 11:14:24'),
(324, 5, 5, '0', '2025-02-18 11:14:24'),
(325, 10, 6, '0', '2025-02-18 11:14:24'),
(326, 7, 7, '0', '2025-02-18 11:14:24'),
(327, 6, 8, '0', '2025-02-18 11:14:24'),
(328, 4, 9, '0', '2025-02-18 11:14:24'),
(329, 3, 10, '0', '2025-02-18 11:14:24'),
(330, 2, 11, '0', '2025-02-18 11:14:24'),
(331, 8, 12, '0', '2025-02-18 11:14:24'),
(332, 6, 1, '1', '2025-02-18 11:18:12'),
(333, 17, 2, '1', '2025-02-18 11:18:12'),
(334, 14, 3, '1', '2025-02-18 11:18:12'),
(335, 1, 4, '1', '2025-02-18 11:18:12'),
(336, 9, 5, '1', '2025-02-18 11:18:12'),
(337, 5, 6, '1', '2025-02-18 11:18:12'),
(338, 10, 7, '1', '2025-02-18 11:18:12'),
(339, 7, 8, '1', '2025-02-18 11:18:12'),
(340, 4, 9, '1', '2025-02-18 11:18:12'),
(341, 3, 10, '1', '2025-02-18 11:18:12'),
(342, 2, 11, '1', '2025-02-18 11:18:12'),
(343, 8, 12, '1', '2025-02-18 11:18:12'),
(344, 18, 13, '1', '2025-02-19 11:38:13'),
(345, 19, 14, '1', '2025-02-19 11:38:37'),
(346, 20, 15, '1', '2025-02-19 11:38:57'),
(347, 21, 16, '1', '2025-02-19 13:20:21'),
(348, 22, 17, '1', '2025-02-19 17:38:27'),
(349, 23, 18, '1', '2025-02-19 18:59:32'),
(350, 24, 19, '1', '2025-02-19 21:54:43'),
(351, 25, 20, '1', '2025-02-19 21:55:05'),
(352, 26, 21, '1', '2025-02-19 21:55:27'),
(353, 27, 22, '1', '2025-02-20 09:47:12'),
(354, 28, 23, '1', '2025-02-20 09:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `category_vs_subcategory`
--

CREATE TABLE `category_vs_subcategory` (
  `cat_subcat_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_vs_subcategory`
--

INSERT INTO `category_vs_subcategory` (`cat_subcat_id`, `category_id`, `sub_category_id`, `is_active`, `added_on`) VALUES
(1, 1, 1, '1', '2025-01-16 08:35:47'),
(2, 1, 2, '1', '2025-01-16 08:35:47'),
(3, 1, 3, '1', '2025-01-16 08:35:47'),
(4, 1, 4, '1', '2025-01-16 08:35:47'),
(5, 1, 5, '1', '2025-01-16 08:35:47'),
(6, 1, 6, '1', '2025-01-16 08:35:47'),
(7, 1, 7, '1', '2025-01-16 08:35:47'),
(8, 1, 8, '1', '2025-01-16 08:35:47'),
(9, 1, 9, '1', '2025-01-16 08:35:48'),
(101, 1, 97, '0', '2025-01-27 20:00:39'),
(103, 1, 97, '1', '2025-01-27 20:14:45'),
(10, 2, 10, '1', '2025-01-16 08:35:48'),
(11, 2, 11, '1', '2025-01-16 08:35:48'),
(12, 2, 12, '1', '2025-01-16 08:35:48'),
(13, 2, 13, '1', '2025-01-16 08:35:48'),
(14, 3, 14, '1', '2025-01-16 08:35:48'),
(15, 3, 15, '0', '2025-01-16 08:35:48'),
(16, 3, 16, '0', '2025-01-16 08:35:48'),
(17, 3, 17, '1', '2025-01-16 08:35:48'),
(18, 3, 18, '1', '2025-01-16 08:35:48'),
(19, 3, 19, '1', '2025-01-16 08:35:48'),
(20, 3, 20, '0', '2025-01-16 08:35:48'),
(21, 3, 21, '1', '2025-01-16 08:35:48'),
(22, 3, 22, '1', '2025-01-16 08:35:48'),
(23, 3, 23, '1', '2025-01-16 08:35:48'),
(24, 3, 24, '1', '2025-01-16 08:35:48'),
(25, 3, 25, '1', '2025-01-16 08:35:48'),
(102, 3, 97, '0', '2025-01-27 20:05:54'),
(26, 4, 1, '1', '2025-01-16 08:35:48'),
(27, 4, 2, '1', '2025-01-16 08:35:48'),
(28, 4, 3, '1', '2025-01-16 08:35:48'),
(29, 4, 4, '1', '2025-01-16 08:35:48'),
(30, 4, 5, '1', '2025-01-16 08:35:48'),
(31, 4, 6, '1', '2025-01-16 08:35:48'),
(32, 4, 7, '1', '2025-01-16 08:35:48'),
(33, 4, 8, '1', '2025-01-16 08:35:48'),
(34, 4, 9, '1', '2025-01-16 08:35:48'),
(37, 5, 18, '1', '2025-01-16 08:35:48'),
(35, 5, 26, '1', '2025-01-16 08:35:48'),
(36, 5, 27, '1', '2025-01-16 08:35:48'),
(38, 5, 28, '1', '2025-01-16 08:35:48'),
(39, 5, 29, '1', '2025-01-16 08:35:48'),
(40, 5, 30, '1', '2025-01-16 08:35:48'),
(107, 5, 101, '1', '2025-01-30 04:45:15'),
(56, 6, 20, '1', '2025-01-16 08:35:48'),
(41, 6, 31, '1', '2025-01-16 08:35:48'),
(42, 6, 32, '1', '2025-01-16 08:35:48'),
(43, 6, 33, '1', '2025-01-16 08:35:48'),
(44, 6, 34, '1', '2025-01-16 08:35:48'),
(45, 6, 36, '1', '2025-01-16 08:35:48'),
(46, 6, 37, '1', '2025-01-16 08:35:48'),
(47, 6, 38, '1', '2025-01-16 08:35:48'),
(48, 6, 39, '1', '2025-01-16 08:35:48'),
(49, 6, 40, '1', '2025-01-16 08:35:48'),
(50, 6, 41, '1', '2025-01-16 08:35:48'),
(51, 6, 42, '1', '2025-01-16 08:35:48'),
(52, 6, 43, '1', '2025-01-16 08:35:48'),
(53, 6, 44, '1', '2025-01-16 08:35:48'),
(54, 6, 45, '1', '2025-01-16 08:35:48'),
(55, 6, 46, '1', '2025-01-16 08:35:48'),
(57, 7, 47, '1', '2025-01-16 08:35:48'),
(58, 7, 48, '1', '2025-01-16 08:35:48'),
(59, 7, 49, '1', '2025-01-16 08:35:48'),
(60, 7, 50, '1', '2025-01-16 08:35:48'),
(61, 7, 51, '1', '2025-01-16 08:35:48'),
(62, 7, 52, '1', '2025-01-16 08:35:48'),
(63, 7, 53, '1', '2025-01-16 08:35:48'),
(64, 7, 54, '1', '2025-01-16 08:35:48'),
(65, 7, 55, '1', '2025-01-16 08:35:48'),
(66, 7, 56, '1', '2025-01-16 08:35:48'),
(67, 7, 57, '1', '2025-01-16 08:35:48'),
(68, 7, 58, '1', '2025-01-16 08:35:48'),
(69, 7, 59, '1', '2025-01-16 08:35:48'),
(70, 7, 60, '1', '2025-01-16 08:35:48'),
(71, 7, 61, '1', '2025-01-16 08:35:48'),
(72, 7, 62, '1', '2025-01-16 08:35:48'),
(73, 7, 63, '1', '2025-01-16 08:35:48'),
(74, 7, 64, '1', '2025-01-16 08:35:48'),
(105, 7, 99, '1', '2025-01-29 10:13:39'),
(106, 7, 100, '1', '2025-01-29 10:14:51'),
(75, 8, 65, '1', '2025-01-16 08:35:48'),
(76, 8, 66, '1', '2025-01-16 08:35:48'),
(77, 8, 67, '1', '2025-01-16 08:35:48'),
(78, 8, 69, '1', '2025-01-16 08:35:48'),
(79, 9, 70, '1', '2025-01-16 08:35:48'),
(80, 9, 71, '0', '2025-01-16 08:35:48'),
(81, 9, 72, '1', '2025-01-16 08:35:48'),
(82, 9, 73, '1', '2025-01-16 08:35:48'),
(83, 9, 74, '1', '2025-01-16 08:35:48'),
(84, 9, 75, '1', '2025-01-16 08:35:48'),
(85, 9, 76, '1', '2025-01-16 08:35:48'),
(86, 9, 77, '1', '2025-01-16 08:35:48'),
(87, 9, 78, '1', '2025-01-16 08:35:48'),
(88, 9, 79, '1', '2025-01-16 08:35:48'),
(89, 9, 80, '1', '2025-01-16 08:35:48'),
(90, 9, 81, '1', '2025-01-16 08:35:48'),
(104, 9, 98, '1', '2025-01-29 10:10:59'),
(91, 10, 82, '1', '2025-01-16 08:35:48'),
(92, 10, 83, '1', '2025-01-16 08:35:48'),
(93, 10, 84, '1', '2025-01-16 08:35:48'),
(94, 10, 85, '1', '2025-01-16 08:35:48'),
(95, 10, 86, '1', '2025-01-16 08:35:48'),
(96, 10, 87, '1', '2025-01-16 08:35:48'),
(108, 14, 102, '1', '2025-02-18 07:52:20'),
(109, 18, 103, '1', '2025-02-19 06:10:04'),
(110, 18, 104, '1', '2025-02-19 06:10:52'),
(111, 18, 105, '1', '2025-02-19 06:11:18'),
(112, 19, 106, '1', '2025-02-19 06:12:52'),
(113, 19, 107, '1', '2025-02-19 06:13:29'),
(114, 19, 108, '1', '2025-02-19 06:13:43'),
(124, 20, 118, '1', '2025-02-20 04:47:52'),
(126, 20, 120, '1', '2025-02-20 05:09:27'),
(115, 24, 109, '1', '2025-02-19 16:26:03'),
(116, 24, 110, '1', '2025-02-19 16:26:33'),
(117, 24, 111, '1', '2025-02-19 16:26:56'),
(118, 25, 112, '1', '2025-02-19 16:27:25'),
(119, 25, 113, '1', '2025-02-19 16:27:40'),
(120, 25, 114, '1', '2025-02-19 16:27:57'),
(121, 26, 115, '1', '2025-02-19 16:28:24'),
(122, 26, 116, '1', '2025-02-19 16:28:54'),
(123, 26, 117, '1', '2025-02-19 16:29:15'),
(127, 27, 121, '1', '2025-02-20 13:12:33'),
(125, 28, 119, '1', '2025-02-20 04:52:38');

-- --------------------------------------------------------

--
-- Table structure for table `contact_form`
--

CREATE TABLE `contact_form` (
  `id_contact_form` int(10) NOT NULL,
  `name` varchar(250) NOT NULL,
  `mobile_number` bigint(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_form`
--

INSERT INTO `contact_form` (`id_contact_form`, `name`, `mobile_number`, `email`, `subject`, `message`, `added_on`) VALUES
(1, 'gayatri', 9876543456, 'gayu@gmail.com', 'abcd', 'fs gdf gdg g ghg hghg', '2025-02-04 10:48:42'),
(2, 'Megha', 8787878787, 'megha@gmail.com', 'ttttt', 'fs tefrtvg gdg g ghg hghg', '2025-02-04 12:08:52'),
(3, 'Megha', 8787878787, 'megha@gmail.com', 'ttttt', 'fs tefrtvg gdg g ghg hghg', '2025-02-04 12:29:36'),
(4, 'Dipali', 9834522426, 'dipali@gmail.com', 'abcd', 'dsdsdsdsdsd', '2025-02-05 15:21:32'),
(5, 'Dipali', 7020402325, 'dipali@gmail.com', 'abcd', 'dsdsdsdsdsd', '2025-02-18 18:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `offer_id` int(11) NOT NULL,
  `offercode` varchar(50) NOT NULL,
  `discount_type` varchar(50) NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `min_order_amount` decimal(10,2) NOT NULL,
  `max_order_discount` decimal(10,2) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date NOT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `amount_shipping` decimal(10,2) DEFAULT NULL,
  `amount_gst` decimal(10,2) NOT NULL,
  `amount_discount` decimal(10,2) DEFAULT NULL,
  `amount_total` decimal(10,2) NOT NULL,
  `amount_final` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash_on_delivery',
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_on` datetime DEFAULT NULL,
  `product_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `user_id`, `address_id`, `amount_shipping`, `amount_gst`, `amount_discount`, `amount_total`, `amount_final`, `payment_method`, `transaction_id`, `shipping_method`, `status`, `added_on`, `edited_on`, `product_count`) VALUES
(1, '0000-00-00', 5, 1, NULL, 0.00, NULL, 206.00, 206.00, 'cash_on_delivery', NULL, NULL, '', '2025-02-18 18:25:11', NULL, 3),
(2, '0000-00-00', 222, 2, NULL, 0.00, NULL, 206.00, 206.00, 'cash_on_delivery', NULL, NULL, '', '2025-02-19 23:03:03', NULL, 3),
(3, '0000-00-00', 222, 2, NULL, 0.00, NULL, 1748.00, 1758.00, 'cash_on_delivery', NULL, NULL, '', '2025-02-20 00:35:35', NULL, 1),
(4, '0000-00-00', 222, 2, NULL, 0.00, NULL, 206.00, 206.00, 'cash_on_delivery', NULL, NULL, '', '2025-02-20 00:37:45', NULL, 3),
(5, '0000-00-00', 999, 605, NULL, 0.00, NULL, 49729.00, 49739.00, 'cash_on_delivery', NULL, NULL, '', '2025-02-20 01:02:53', NULL, 2),
(6, '2025-02-20', 999, 604, NULL, 0.00, NULL, 21597.00, 21607.00, 'cash_on_delivery', NULL, NULL, '', '2025-02-20 08:42:14', NULL, 3),
(7, '2025-02-20', 1, 602, NULL, 0.00, NULL, 400.00, 410.00, 'cash_on_delivery', NULL, NULL, '', '2025-02-20 13:45:25', NULL, 2),
(8, '2025-02-20', 999, 604, NULL, 0.00, NULL, 750.00, 760.00, 'cash_on_delivery', NULL, NULL, '', '2025-02-20 18:24:01', NULL, 3),
(9, '2025-02-21', 222, 2, NULL, 0.00, NULL, 206.00, 206.00, 'cash_on_delivery', NULL, NULL, '', '2025-02-21 10:39:09', NULL, 3),
(10, '2025-02-21', 222, 2, NULL, 0.00, NULL, 206.00, 206.00, 'cash_on_delivery', NULL, NULL, '', '2025-02-21 10:40:28', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `order_offers`
--

CREATE TABLE `order_offers` (
  `id_order_offers` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `added_on` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_vs_product`
--

CREATE TABLE `order_vs_product` (
  `id_order_vs_product` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_weight` decimal(10,0) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount_product` decimal(10,2) NOT NULL,
  `amount_gst` decimal(10,2) DEFAULT NULL,
  `amount_total` decimal(10,2) NOT NULL,
  `added_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `product_description` text,
  `product_name` varchar(1000) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `subcategory_name` varchar(255) DEFAULT NULL,
  `brand_name` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_vs_product`
--

INSERT INTO `order_vs_product` (`id_order_vs_product`, `order_id`, `product_id`, `product_weight`, `quantity`, `amount_product`, `amount_gst`, `amount_total`, `added_on`, `product_description`, `product_name`, `category_id`, `subcategory_id`, `brand_id`, `category_name`, `subcategory_name`, `brand_name`) VALUES
(1, 1, 1, 40, 2, 2099.00, 0.00, 4198.00, '2025-02-18 18:25:11', 'About this itemFaster performance, Smart & Silent operation512GB, Ultra low power consumptionFlash Interface QLCSequential Read Speed 550MB/s Sequential Write Speed 480MB/s', 'ZEB-SD52 SSD 512GB, SATA II and SATA III Interface, QLC, Silent Operation', 2, 1, 3, 'Computer Accessories', 'Components', 'ZEBRONICS'),
(2, 1, 3, 4300, 1, 3379.00, 0.00, 3379.00, '2025-02-18 18:25:11', 'Advanced Cooling System: Equipped with 4 vibrant RGB cooling fans and a high-performance mesh front panel for superior airflow, ensuring optimal cooling efficiency even during intense gaming sessions.Crystal-Clear Display: The innovative hinged magnetic tempered glass door provides a clear view of your PC\'s components, showcasing your high-performance hardware in style.Enhanced Connectivity: Features 1x USB 3.0, 2x USB 2.0 ports, alongside dedicated 3.5mm microphone and headphone jacks for seamless connectivity. Includes a convenient reset button and a responsive power button for easy operation.Versatile Liquid Cooling Support: Supports various liquid cooling configurations including front (240mm/280mm/360mm), top (240mm/280mm), and rear (120mm), enabling you to unleash the full potential of advanced cooling solutions for overclocking and intensive tasks.Spacious Interior Design: Offers ample room to accommodate ATX, M-ATX, and ITX motherboards, ensuring compatibility with a wide range of gaming setups and hardware configurations.Optimized Graphics Card Compatibility: Supports graphics cards up to 330mm in length, allowing you to install the latest high-performance GPUs without compromise.Sleek and Modern Aesthetic: Boasts a minimalist design with clean lines, adding a sophisticated touch to your gaming rig while complementing any gaming environment.', 'Galaxy Microsystems Ltd., Galaxy Microsystems Ltd., Hong Kong, Kowloon Bay, Wang Chiu Rd, 33, Exchange Tower, Room 1601, 16th Floor', 2, 1, 6, 'Computer Accessories', 'Components', 'Galax'),
(3, 1, 5, 7100, 4, 49490.00, 0.00, 197960.00, '2025-02-18 18:25:11', 'Processor: Intel Core i3-1315U | Speed: Base 1.2Ghz, Max 4.5Ghz, E-Core 0.9/3.3Ghz | 6 Cores | 8 Threads | 10MB CacheOS: Pre-Loaded Windows 11 Home with Lifetime Validity | Office Home & Student 2021Memory and Storage: 1x8GB DDR5-5200 RAM, Two DDR5 SO-DIMM slots, dual-channel capable, Up to 32GB DDR5-5200 | Storage: 512GB SSD M.2 2280 PCIe 4.0x4 NVMe || Graphics: Integrated Intel UHD GraphicsDisplay: 27-inch Full HD IPS (1920x1080) | Brightness: 300 nits | IPS Display | Anti Glare | 99% sRGB | 3-side borderless, hardware low blue light, Non-TouchCamera:- 5.0 MP | Speakers:- 3Wx2, HARMAN', 'Lenovo IdeaCentre AIO 13th Gen Core i3-1315U 27\" FHD IPS (8GB RAM/512GB SSD/Windows11/MS Office 2021/3Wx2 Harman Speakers/Alexa Built-in/Wireless Keyboard & Mouse, Grey), F0HM00G4IN All-in-One Desktop', 2, 2, 7, 'Computer Accessories', 'Desktops', 'Lenovo'),
(4, 2, 1, 40, 2, 2099.00, 0.00, 4198.00, '2025-02-19 23:03:03', 'About this itemFaster performance, Smart & Silent operation512GB, Ultra low power consumptionFlash Interface QLCSequential Read Speed 550MB/s Sequential Write Speed 480MB/s', 'ZEB-SD52 SSD 512GB, SATA II and SATA III Interface, QLC, Silent Operation', 2, 1, 3, 'Computer Accessories', 'Components', 'ZEBRONICS'),
(5, 2, 3, 4300, 1, 3379.00, 0.00, 3379.00, '2025-02-19 23:03:03', 'Advanced Cooling System: Equipped with 4 vibrant RGB cooling fans and a high-performance mesh front panel for superior airflow, ensuring optimal cooling efficiency even during intense gaming sessions.Crystal-Clear Display: The innovative hinged magnetic tempered glass door provides a clear view of your PC\'s components, showcasing your high-performance hardware in style.Enhanced Connectivity: Features 1x USB 3.0, 2x USB 2.0 ports, alongside dedicated 3.5mm microphone and headphone jacks for seamless connectivity. Includes a convenient reset button and a responsive power button for easy operation.Versatile Liquid Cooling Support: Supports various liquid cooling configurations including front (240mm/280mm/360mm), top (240mm/280mm), and rear (120mm), enabling you to unleash the full potential of advanced cooling solutions for overclocking and intensive tasks.Spacious Interior Design: Offers ample room to accommodate ATX, M-ATX, and ITX motherboards, ensuring compatibility with a wide range of gaming setups and hardware configurations.Optimized Graphics Card Compatibility: Supports graphics cards up to 330mm in length, allowing you to install the latest high-performance GPUs without compromise.Sleek and Modern Aesthetic: Boasts a minimalist design with clean lines, adding a sophisticated touch to your gaming rig while complementing any gaming environment.', 'Galaxy Microsystems Ltd., Galaxy Microsystems Ltd., Hong Kong, Kowloon Bay, Wang Chiu Rd, 33, Exchange Tower, Room 1601, 16th Floor', 2, 1, 6, 'Computer Accessories', 'Components', 'Galax'),
(6, 2, 5, 7100, 4, 49490.00, 0.00, 197960.00, '2025-02-19 23:03:03', 'Processor: Intel Core i3-1315U | Speed: Base 1.2Ghz, Max 4.5Ghz, E-Core 0.9/3.3Ghz | 6 Cores | 8 Threads | 10MB CacheOS: Pre-Loaded Windows 11 Home with Lifetime Validity | Office Home & Student 2021Memory and Storage: 1x8GB DDR5-5200 RAM, Two DDR5 SO-DIMM slots, dual-channel capable, Up to 32GB DDR5-5200 | Storage: 512GB SSD M.2 2280 PCIe 4.0x4 NVMe || Graphics: Integrated Intel UHD GraphicsDisplay: 27-inch Full HD IPS (1920x1080) | Brightness: 300 nits | IPS Display | Anti Glare | 99% sRGB | 3-side borderless, hardware low blue light, Non-TouchCamera:- 5.0 MP | Speakers:- 3Wx2, HARMAN', 'Lenovo IdeaCentre AIO 13th Gen Core i3-1315U 27\" FHD IPS (8GB RAM/512GB SSD/Windows11/MS Office 2021/3Wx2 Harman Speakers/Alexa Built-in/Wireless Keyboard & Mouse, Grey), F0HM00G4IN All-in-One Desktop', 2, 2, 7, 'Computer Accessories', 'Desktops', 'Lenovo'),
(7, 3, 8, 50, 1, 1748.00, 0.00, 1748.00, '2025-02-20 00:35:35', 'FAST AND SMOOTH: With speeds of up to 160 MB/s, you can store, save, and share instantly. Even with huge files, EVO Plus is incredibly quick with superfast U3, Class 10 rated transfer speeds of up to 160MB/s; Big apps load and run smoothly, while 4K video remains sharp with A2, V30, and UHS-I Interface**ALL THE SPACE YOU NEED: Enhanced speed + compatibility = dependable performance; EVO Plus + Adapter lets you load games to your console, or download more apps on your tablet; Top-notch speed makes transfers seamless and reliable*EXPAND AND STORE BIG: Options available from 64GB to a 1TB. choose your EVO Plus and expand your capacity for hi-resolution images and 4K video files.; With so many sizes select the perfect capacity for all your memories***d 4K video files.YOU\'RE FULLY PROTECTED: The EVO Plus takes on life’s adventures with water, temperature, X-ray, magnet, drop, and wearout protection; Your experiences are irreplaceable and deserves reliable storage, backed by a 10-year limited warranty****WORLD\'S NO. 1 FLASH MEMORY BRAND: Performance and reliability you can count on from the world\'s number one brand for flash memory since 2003;***** All firmware and components are produced in-house, including our world-renowned DRAM and NAND, for quality you can trust', 'SAMSUNG EVO Plus 256GB Micro w/SD Adaptor SDXC, Up-to 160MB/s, Expanded Storage for Gaming Devices, Android Tablets and Smart Phones, Memory Card, MB-MC256SA/IN', 2, 3, 10, 'Computer Accessories', 'External Devices & Data Storage', 'SAMSUNG'),
(8, 4, 1, 40, 2, 2099.00, 0.00, 4198.00, '2025-02-20 00:37:45', 'About this itemFaster performance, Smart & Silent operation512GB, Ultra low power consumptionFlash Interface QLCSequential Read Speed 550MB/s Sequential Write Speed 480MB/s', 'ZEB-SD52 SSD 512GB, SATA II and SATA III Interface, QLC, Silent Operation', 2, 1, 3, 'Computer Accessories', 'Components', 'ZEBRONICS'),
(9, 4, 6, 4480, 1, 119990.00, 0.00, 119990.00, '2025-02-20 00:37:45', '<p>SUPERCHARGED BY M3 — Get more done faster with a next-generation chip from Apple. From creating presentations to gaming, you’ll fly through work and play.FITS PERFECTLY IN YOUR SPACE — The all-in-one desktop design is strikingly thin, comes in vibrant colours and becomes the centrepiece of any room.IMMERSIVE DISPLAY — The 60.96 cm (24?) 4.5K Retina display features 500 nits of brightness and support for one billion colours. Everything from streaming movies to editing photos is sharp and colourful.ADVANCED CAMERA AND AUDIO — Look and sound your best with a 1080p FaceTime HD camera, a studio-quality three-mic array and a six-speaker sound system with Spatial Audio.WORKS WITH YOUR FAVOURITE APPS — All your go-to apps run lightning fast — including Microsoft 365, Adobe Creative Cloud and Zoom. You can even run many of your favourite iPhone and iPad apps directly on your iMac.WORKS WITH ALL YOUR APPLE DEVICES — You can do amazing things when you use your Apple devices together. Copy something on iPhone and paste it on iMac. Use your iMac to answer FaceTime calls or send texts with Messages. And that’s just the beginning.MAGIC ACCESSORIES INCLUDED — iMac comes with a colour-matched Magic Mouse and Magic Keyboard.</p>', 'Apple 2023 iMac (24-inch, Apple M3 chip with 8?core CPU and 8?core GPU, 8GB Unified Memory, 256GB) - Silver', 2, 2, 8, 'Computer Accessories', 'Desktops', 'Apple'),
(10, 4, 5, 7100, 4, 49490.00, 0.00, 197960.00, '2025-02-20 00:37:45', 'Processor: Intel Core i3-1315U | Speed: Base 1.2Ghz, Max 4.5Ghz, E-Core 0.9/3.3Ghz | 6 Cores | 8 Threads | 10MB CacheOS: Pre-Loaded Windows 11 Home with Lifetime Validity | Office Home & Student 2021Memory and Storage: 1x8GB DDR5-5200 RAM, Two DDR5 SO-DIMM slots, dual-channel capable, Up to 32GB DDR5-5200 | Storage: 512GB SSD M.2 2280 PCIe 4.0x4 NVMe || Graphics: Integrated Intel UHD GraphicsDisplay: 27-inch Full HD IPS (1920x1080) | Brightness: 300 nits | IPS Display | Anti Glare | 99% sRGB | 3-side borderless, hardware low blue light, Non-TouchCamera:- 5.0 MP | Speakers:- 3Wx2, HARMAN', 'Lenovo IdeaCentre AIO 13th Gen Core i3-1315U 27\" FHD IPS (8GB RAM/512GB SSD/Windows11/MS Office 2021/3Wx2 Harman Speakers/Alexa Built-in/Wireless Keyboard & Mouse, Grey), F0HM00G4IN All-in-One Desktop', 2, 2, 7, 'Computer Accessories', 'Desktops', 'Lenovo'),
(11, 5, 2, 15, 1, 239.00, 0.00, 239.00, '2025-02-20 01:02:53', 'Give your PC a way to ventilate hot air and keep air flow for a cooled system. Fan speed 3000 RPM. Max Airflow. 55 CFM.Make your CPU cooler with this super cooling fan. It creates a flow of air that pushes heat out of your system preventing any overheating.An easy to install application that gets attached to your PC’s CPU effortlessly. With a sunflower design that also improves the looks of your frame.Dissipate heat effectively with more air flow and less heat present. Helps you perform heavy tasks without damaging any internal parts.The super silent performance with de-vibration helps you perform your task in peace.', 'FRONTECH 775/1155 CPU Cooling Fan with Universal Socket & Heat Sink for Better Air Circulation, Super Silent, De-Vibrating, HS Sunflower Design, (CPF-0002, Black)', 2, 1, 5, 'Computer Accessories', 'Components', 'FRONTECH'),
(12, 5, 5, 7100, 1, 49490.00, 0.00, 49490.00, '2025-02-20 01:02:53', 'Processor: Intel Core i3-1315U | Speed: Base 1.2Ghz, Max 4.5Ghz, E-Core 0.9/3.3Ghz | 6 Cores | 8 Threads | 10MB CacheOS: Pre-Loaded Windows 11 Home with Lifetime Validity | Office Home & Student 2021Memory and Storage: 1x8GB DDR5-5200 RAM, Two DDR5 SO-DIMM slots, dual-channel capable, Up to 32GB DDR5-5200 | Storage: 512GB SSD M.2 2280 PCIe 4.0x4 NVMe || Graphics: Integrated Intel UHD GraphicsDisplay: 27-inch Full HD IPS (1920x1080) | Brightness: 300 nits | IPS Display | Anti Glare | 99% sRGB | 3-side borderless, hardware low blue light, Non-TouchCamera:- 5.0 MP | Speakers:- 3Wx2, HARMAN', 'Lenovo IdeaCentre AIO 13th Gen Core i3-1315U 27\" FHD IPS (8GB RAM/512GB SSD/Windows11/MS Office 2021/3Wx2 Harman Speakers/Alexa Built-in/Wireless Keyboard & Mouse, Grey), F0HM00G4IN All-in-One Desktop', 2, 2, 7, 'Computer Accessories', 'Desktops', 'Lenovo'),
(13, 6, 14, 1040, 1, 1699.00, 0.00, 1699.00, '2025-02-20 08:42:14', 'AC 1200 Mbps WAVE 2 Concurrent dual band wireless Router with 4 High gain Omni Antenna802.11 a/b/g/n/ac standards with speed of 300 Mbps on 2.4Ghz & 867 Mbps on 5GhzGigabit Ports -- One Gigabit WAN & Four Gigabit LAN ports for high speed wired connectivity.MU-MIMO -- MU-MIMO, which transmits data to multiple wireless devices simultaneously to increase speed and efficiencyMultiple Operating modes: Router mode : to access the internet. Access Point mode : to extend wired network over wireless .Repeater mode : to extend the range of existing wireless router.Easy Setup: Super simple set-up with the D-Link Assistant Mobile APP Or with intuitive WEB GUI setup wizard', 'D-Link DIR-825 |1200Mbps Dual Band Wi-Fi Router| Speeds 2.4 GHz up to 300Mbps & 5 GHz up to 867Mbps | Gigabit Ethernet Ports | High-Gain Antennas | Easy Setup |MTCTE Certified', 2, 6, 13, 'Computer Accessories', 'Networking Devices', 'D-Link'),
(14, 6, 15, 4800, 1, 2899.00, 0.00, 2899.00, '2025-02-20 08:42:14', 'Printer Type - Inkjet; Functionality - All-in-One (Print, Scan, Copy), Scanner type - Flatbed ; Printer Output - ColourConnectivity - USB ; Compatibility - Windows XP or newer and Mac OS X v10.7.5 or newerPages per minute - 8 pages (Black), 4 pages (Colour) ; Cost per page - Rs 5.3 (Black & White), Rs 7.8 (Colour) - As per ISO standardsIdeal usage - Home & Small Office, Low usage ( less than 100 pages per month)Page size supported - 4.0\"x6.0\" till A4 / Letter / Legal ; Duplex Print - Manual ; Print resolution - 4800x600Compatible Ink Cartridge - PG-745 (Black), CL-746 (Colour) ; Page Yield - 180 pages ; Includes 1 Black and 1 Colour cartridge in the boxWarranty Details: 1 year manufacturer warranty from the date of purchase', 'Canon Pixma MG2577s All-in-One Inkjet Colour Printer (Blue/White)', 2, 7, 14, 'Computer Accessories', 'Printers, Inks & Accessories', 'Canon'),
(15, 6, 12, 4500, 1, 16999.00, 0.00, 16999.00, '2025-02-20 08:42:14', 'Display: 29 inch (73cm) 21:9 UltraWide IPS FHD (2560 x 1080) , sRGB 99%, Color Calibrated, HDR10Connectivity: USB-C, Display Port , HDMI Port, Headphone outGaming Features: 100hz Refresh rate, Motion Blur Reduction , AMD FreeSync, Black StablizerSpecial Feature : Inbuilt Speaker 7W x 2 with Max Audio, Tilt Adjustment, White ColorWarranty: 3 Years Parts and Labour', 'LG UltraWide 29 inch (73 cm) IPS FHD, 2560x1080 Pixels, Color Calibrated, 100Hz, 7W x 2 Inbuilt Speaker, USB-C, Display Port, HDMI, White Color-29WQ600', 2, 5, 12, 'Computer Accessories', 'Monitors', 'LG'),
(16, 7, 43, 20, 1, 200.00, 0.00, 200.00, '2025-02-20 13:45:25', '<p>xczcxzczcc</p>', 'Kaju Katli', 18, 103, 30, 'Sweets', 'Packed sweets', 'Haldiram'),
(17, 7, 45, 50, 1, 200.00, 0.00, 200.00, '2025-02-20 13:45:25', '<p>cdsdsdd</p>', 'Mini Gulabjam', 18, 104, 30, 'Sweets', 'Tin sweets', 'Haldiram'),
(18, 8, 43, 20, 1, 200.00, 0.00, 200.00, '2025-02-20 18:24:01', '<p>xczcxzczcc</p>', 'Kaju Katli', 18, 103, 30, 'Sweets', 'Packed sweets', 'Haldiram'),
(19, 8, 44, 50, 1, 150.00, 0.00, 150.00, '2025-02-20 18:24:01', '<p>vcxvcvxvxv</p>', 'Rajbhog', 18, 104, 30, 'Sweets', 'Tin sweets', 'Haldiram'),
(20, 8, 45, 50, 2, 200.00, 0.00, 400.00, '2025-02-20 18:24:01', '<p>cdsdsdd</p>', 'Mini Gulabjam', 18, 104, 30, 'Sweets', 'Tin sweets', 'Haldiram'),
(21, 9, 1, 40, 2, 2099.00, 0.00, 4198.00, '2025-02-21 10:39:09', 'About this itemFaster performance, Smart & Silent operation512GB, Ultra low power consumptionFlash Interface QLCSequential Read Speed 550MB/s Sequential Write Speed 480MB/s', 'ZEB-SD52 SSD 512GB, SATA II and SATA III Interface, QLC, Silent Operation', 2, 1, 3, 'Computer Accessories', 'Components', 'Zebronics'),
(22, 10, 1, 40, 2, 2099.00, 0.00, 4198.00, '2025-02-21 10:40:28', 'About this itemFaster performance, Smart & Silent operation512GB, Ultra low power consumptionFlash Interface QLCSequential Read Speed 550MB/s Sequential Write Speed 480MB/s', 'ZEB-SD52 SSD 512GB, SATA II and SATA III Interface, QLC, Silent Operation', 2, 1, 3, 'Computer Accessories', 'Components', 'Zebronics');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `weight` float NOT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_on` timestamp NULL DEFAULT NULL,
  `is_featured` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `expiryDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `price`, `weight`, `is_active`, `added_on`, `edited_on`, `is_featured`, `expiryDate`) VALUES
(1, 'ZEB-SD52 SSD 512GB, SATA II and SATA III Interface, QLC, Silent Operation', 'About this itemFaster performance, Smart & Silent operation512GB, Ultra low power consumptionFlash Interface QLCSequential Read Speed 550MB/s Sequential Write Speed 480MB/s', 2099, 40, '1', '2025-01-16 18:41:06', NULL, '1', '0000-00-00'),
(2, 'FRONTECH 775/1155 CPU Cooling Fan with Universal Socket & Heat Sink for Better Air Circulation, Super Silent, De-Vibrating, HS Sunflower Design, (CPF-0002, Black)', 'Give your PC a way to ventilate hot air and keep air flow for a cooled system. Fan speed 3000 RPM. Max Airflow. 55 CFM.Make your CPU cooler with this super cooling fan. It creates a flow of air that pushes heat out of your system preventing any overheating.An easy to install application that gets attached to your PC’s CPU effortlessly. With a sunflower design that also improves the looks of your frame.Dissipate heat effectively with more air flow and less heat present. Helps you perform heavy tasks without damaging any internal parts.The super silent performance with de-vibration helps you perform your task in peace.', 239, 15, '0', '2025-01-16 18:41:06', NULL, '1', '0000-00-00'),
(3, 'Galaxy Microsystems Ltd., Galaxy Microsystems Ltd., Hong Kong, Kowloon Bay, Wang Chiu Rd, 33, Exchange Tower, Room 1601, 16th Floor', 'Advanced Cooling System: Equipped with 4 vibrant RGB cooling fans and a high-performance mesh front panel for superior airflow, ensuring optimal cooling efficiency even during intense gaming sessions.Crystal-Clear Display: The innovative hinged magnetic tempered glass door provides a clear view of your PC\'s components, showcasing your high-performance hardware in style.Enhanced Connectivity: Features 1x USB 3.0, 2x USB 2.0 ports, alongside dedicated 3.5mm microphone and headphone jacks for seamless connectivity. Includes a convenient reset button and a responsive power button for easy operation.Versatile Liquid Cooling Support: Supports various liquid cooling configurations including front (240mm/280mm/360mm), top (240mm/280mm), and rear (120mm), enabling you to unleash the full potential of advanced cooling solutions for overclocking and intensive tasks.Spacious Interior Design: Offers ample room to accommodate ATX, M-ATX, and ITX motherboards, ensuring compatibility with a wide range of gaming setups and hardware configurations.Optimized Graphics Card Compatibility: Supports graphics cards up to 330mm in length, allowing you to install the latest high-performance GPUs without compromise.Sleek and Modern Aesthetic: Boasts a minimalist design with clean lines, adding a sophisticated touch to your gaming rig while complementing any gaming environment.', 3379, 4300, '0', '2025-01-16 18:41:06', NULL, '1', '0000-00-00'),
(4, 'HP All-in-One PC, Windows 11 Home, Intel Processor N200, 21.45-Inch (54.5 Cm), FHD, Intel UHD Graphics, 720P HD Camera W/Privacy Shutter, Dual Speakers (Win 11, White, 4.17 Kg), Dg0154In', '4-core Intel Processor N200 Experience reliable performance with a processor that features 4 threads and 6MB L3 cache for smooth multitasking and fast processing.Intel UHD graphics Enjoy immersive visuals with Intel UHD graphics. Perfect for both work and entertainment, it delivers crystal-clear images for an enhanced viewing experience.Substantial memory and storage The 8GB DDR5 RAM ensures efficient multitasking, while the 512GB PCIe NVMe SSD provides ample storage space for all your files and applications.Micro-edge display Immerse yourself in the 21.45\" FHD, anti-glare, and micro-edge display. Experience vivid colors and sharp details with 99% sRGB for an unforgettable viewing experience.Seamless connectivity Stay connected with Wi-Fi 6 (1x1) and Bluetooth 5.3. It also features 1 x USB Type-C, 4 x USB Type-A, 1 x RJ-45, and 1 x HDMI-out 1.4 port for easy connectivity.HD Conferencing The HP True Vision 720p HD camera with temporal noise reduction ensures clear video calls. The dual speakers offer high-quality audio for an improved conferencing experience.Why HP Choose HP, India\'s No.1 PC brand, for cutting-edge technology, robust performance, and reliable service. Enjoy peace of mind with HP\'s extensive network of service centers.', 30990, 4170, '0', '2025-01-16 18:41:06', NULL, '1', '0000-00-00'),
(5, 'Lenovo IdeaCentre AIO 13th Gen Core i3-1315U 27\" FHD IPS (8GB RAM/512GB SSD/Windows11/MS Office 2021/3Wx2 Harman Speakers/Alexa Built-in/Wireless Keyboard & Mouse, Grey), F0HM00G4IN All-in-One Desktop', 'Processor: Intel Core i3-1315U | Speed: Base 1.2Ghz, Max 4.5Ghz, E-Core 0.9/3.3Ghz | 6 Cores | 8 Threads | 10MB CacheOS: Pre-Loaded Windows 11 Home with Lifetime Validity | Office Home & Student 2021Memory and Storage: 1x8GB DDR5-5200 RAM, Two DDR5 SO-DIMM slots, dual-channel capable, Up to 32GB DDR5-5200 | Storage: 512GB SSD M.2 2280 PCIe 4.0x4 NVMe || Graphics: Integrated Intel UHD GraphicsDisplay: 27-inch Full HD IPS (1920x1080) | Brightness: 300 nits | IPS Display | Anti Glare | 99% sRGB | 3-side borderless, hardware low blue light, Non-TouchCamera:- 5.0 MP | Speakers:- 3Wx2, HARMAN', 49490, 7100, '0', '2025-01-16 18:41:06', NULL, '0', '0000-00-00'),
(6, 'Apple 2023 iMac (24-inch, Apple M3 chip with 8?core CPU and 8?core GPU, 8GB Unified Memory, 256GB) - Silver', '<p>SUPERCHARGED BY M3 — Get more done faster with a next-generation chip from Apple. From creating presentations to gaming, you’ll fly through work and play.FITS PERFECTLY IN YOUR SPACE — The all-in-one desktop design is strikingly thin, comes in vibrant colours and becomes the centrepiece of any room.IMMERSIVE DISPLAY — The 60.96 cm (24″) 4.5K Retina display features 500 nits of brightness and support for one billion colours. Everything from streaming movies to editing photos is sharp and colourful.ADVANCED CAMERA AND AUDIO — Look and sound your best with a 1080p FaceTime HD camera, a studio-quality three-mic array and a six-speaker sound system with Spatial Audio.WORKS WITH YOUR FAVOURITE APPS — All your go-to apps run lightning fast — including Microsoft 365, Adobe Creative Cloud and Zoom. You can even run many of your favourite iPhone and iPad apps directly on your iMac.WORKS WITH ALL YOUR APPLE DEVICES — You can do amazing things when you use your Apple devices together. Copy something on iPhone and paste it on iMac. Use your iMac to answer FaceTime calls or send texts with Messages. And that’s just the beginning.MAGIC ACCESSORIES INCLUDED — iMac comes with a colour-matched Magic Mouse and Magic Keyboard.</p>', 119990, 4480, '0', '2025-01-16 18:41:06', NULL, '0', '2025-02-27'),
(7, 'Sandisk 1TB Portable SSD, 800MB/s R, USB 3.2 Gen 2, Rugged SSD with Upto 2 Meter Drop Protection, Type-C to Type-A Cable, PC & Mac Compatible, 3 Y Warranty, External SSD (SDSSDE30-1T00-G26)', 'Get fast solid state performance with 800MB/s read speeds in a portable driveBack up your content and memories on a storage solution that fits seamlessly into your mobile lifestyleTake it with you on your adventures—up to two-meter drop protection means this durable drive can take a beatingSecure it to your belt loop or backpack for extra peace of mind thanks to the tough rubber hookFrom SanDisk, a brand professional photographers trust to take on assignments', 6997, 40.8, '0', '2025-01-16 18:41:06', NULL, '0', '0000-00-00'),
(8, 'SAMSUNG EVO Plus 256GB Micro w/SD Adaptor SDXC, Up-to 160MB/s, Expanded Storage for Gaming Devices, Android Tablets and Smart Phones, Memory Card, MB-MC256SA/IN', 'FAST AND SMOOTH: With speeds of up to 160 MB/s, you can store, save, and share instantly. Even with huge files, EVO Plus is incredibly quick with superfast U3, Class 10 rated transfer speeds of up to 160MB/s; Big apps load and run smoothly, while 4K video remains sharp with A2, V30, and UHS-I Interface**ALL THE SPACE YOU NEED: Enhanced speed + compatibility = dependable performance; EVO Plus + Adapter lets you load games to your console, or download more apps on your tablet; Top-notch speed makes transfers seamless and reliable*EXPAND AND STORE BIG: Options available from 64GB to a 1TB. choose your EVO Plus and expand your capacity for hi-resolution images and 4K video files.; With so many sizes select the perfect capacity for all your memories***d 4K video files.YOU\'RE FULLY PROTECTED: The EVO Plus takes on life’s adventures with water, temperature, X-ray, magnet, drop, and wearout protection; Your experiences are irreplaceable and deserves reliable storage, backed by a 10-year limited warranty****WORLD\'S NO. 1 FLASH MEMORY BRAND: Performance and reliability you can count on from the world\'s number one brand for flash memory since 2003;***** All firmware and components are produced in-house, including our world-renowned DRAM and NAND, for quality you can trust', 1748, 50, '0', '2025-01-16 18:41:06', NULL, '0', '0000-00-00'),
(9, 'HP x796w 256GB USB 3.2 Flash Drive', '[Storage] : Offers a mobile storage solution to store and share your music, photos, les and more.[Design] : Durable metal casing. It is ideal as external storage.', 2399, 14, '0', '2025-01-16 18:41:06', NULL, '0', '0000-00-00'),
(10, 'ASUS Vivobook 16\" FHD+ (1920 X 1200), 60Hz 300Nits, Core i5-12500H, (16GB RAM/512GB SSD/Intel Iris X? Graphics/Win 11/Office Home/Fingerprint/42Whr Battery/Transparent Silver/1.88Kg), X1605ZAC-MB541WS', 'Processor : Intel Core i5-12500H Processor 2.5 GHz (18M Cache, up to 4.5 GHz, 4P+8E cores) Perfect for multitasking and entertainmentMemory : 16GB DDR4 RAM| Storage : 512GB M.2 NVMe PCIe 4.0 SSDGraphics : Intergrated Intel Iris Xᵉ GraphicsDisplay :16.0-inch, WUXGA (1920 x 1200) 16:10 aspect ratio, 60Hz refresh rate, 300nits Brightness| Keyboard : Backlit Chiclet KeyboardBattery : 42WHrs, 3S1P, 3-cell Li-ionI/O Ports : 1x USB 2.0 Type-A, 1x USB 3.2 Gen 1 Type-C, 2x USB 3.2 Gen 1 Type-A, 1x HDMI 1.4, 1x DC-inAudio : 1x 3.5mm Combo Audio Jack, Webcam : 720p HD camera with privacy shutter, Mic : Built-in array microphoneOn Board Wireless : Wi-Fi 5(802.11ac) (Dual band) 1*1 + Bluetooth 5.1 Wireless Card (*Bluetooth version may change with OS version different.)', 51990, 188, '0', '2025-01-16 18:41:06', NULL, '0', '0000-00-00'),
(11, 'Dell 15 [Smartchoice] Intel Core i3-1215U Processor, 12th Gen (8GB RAM/512GB SSD/FHD/Window 11/MS Office\' 21/15\"(38 cm) Display/15 Month McAfee/Black/1.69kg Thin & Light Laptop', 'Processor: Intel Core i3-1215U 12th Generation (up to 4.40 GHz, 10MB 6 Cores)RAM & Storage: 8 GB, 1 x 8 GB, DDR4, 2666 MHz, (2 DIMM Slots, Expandable up to 16GB) & 512GB SSDSoftware: Pre-Loaded Windows 11 Home with Lifetime Validity | MS Office Home and Student 2021 with lifetime validity| McAfee Multi-Device Security 15-month subscriptionGraphics & Keyboard: Integrated Onboard Graphics & Standard Keyboard // Display: 15.6\" FHD WVA AG 120Hz 250 nits Narrow BorderPorts: 2 USB 3.2 Gen 1 ports, 1 USB 2.0 port, 1 Headset jack, 1 HDMI 1.4 port, 1 SD 3.0 card slot, 1 Flip-Down RJ-45 port 10/100/1000 Mbps', 33990, 1690, '0', '2025-01-16 18:41:06', NULL, '0', '0000-00-00'),
(12, 'LG UltraWide 29 inch (73 cm) IPS FHD, 2560x1080 Pixels, Color Calibrated, 100Hz, 7W x 2 Inbuilt Speaker, USB-C, Display Port, HDMI, White Color-29WQ600', 'Display: 29 inch (73cm) 21:9 UltraWide IPS FHD (2560 x 1080) , sRGB 99%, Color Calibrated, HDR10Connectivity: USB-C, Display Port , HDMI Port, Headphone outGaming Features: 100hz Refresh rate, Motion Blur Reduction , AMD FreeSync, Black StablizerSpecial Feature : Inbuilt Speaker 7W x 2 with Max Audio, Tilt Adjustment, White ColorWarranty: 3 Years Parts and Labour', 16999, 4500, '0', '2025-01-16 18:41:06', NULL, '0', '0000-00-00'),
(13, 'ZEBRONICS New Launch N24A 24\"(60.4 cm) Gaming Monitor, FHD 1920x1080, IPS-Antiglare Display, 280Nits, 180Hz, 1ms MPRT, HDR10, 99% sRGB, Adaptive Sync, 1 x DP | 1 x HDMI | 1 x 3.5mm', 'Anti-glare screen: The 60.4cm screen of the ZEB-N24A is treated with an anti-glare coating, which reduces reflections and minimizes eye strain during prolonged gaming sessions.Built-in Speakers: Equipped with built-in speakers, the ZEB-N24A offers a convenient audio solution without the need for external speakers.Bezel-Less Design: The ZEB-N24A boasts a sleek, bezel-less design, providing an expansive viewing area that enhances the sense of immersion. Its 16:9 aspect ratio offers a wider viewing experience.Refresh Rate: The monitor\'s 180Hz refresh rate and 1ms MPRT ensure smooth gameplay with reduced motion blur and more frames per second.High-resolution: The monitor\'s IPS display and Full HD 1920x1080 resolution deliver sharp, clear visuals, offering an ideal balance between performance and quality for gaming.Brightness: The ZEB-N24A offers 280 nits of brightness and supports HDR10 for enhanced contrast and a broader color range.Connectivity: The ZEB-N24A features one DisplayPort, one HDMI port, and a headphone jack, providing flexible connectivity.', 7998, 2750, '0', '2025-01-16 18:41:06', NULL, '0', '0000-00-00'),
(14, 'D-Link DIR-825 |1200Mbps Dual Band Wi-Fi Router| Speeds 2.4 GHz up to 300Mbps & 5 GHz up to 867Mbps | Gigabit Ethernet Ports | High-Gain Antennas | Easy Setup |MTCTE Certified', 'AC 1200 Mbps WAVE 2 Concurrent dual band wireless Router with 4 High gain Omni Antenna802.11 a/b/g/n/ac standards with speed of 300 Mbps on 2.4Ghz & 867 Mbps on 5GhzGigabit Ports -- One Gigabit WAN & Four Gigabit LAN ports for high speed wired connectivity.MU-MIMO -- MU-MIMO, which transmits data to multiple wireless devices simultaneously to increase speed and efficiencyMultiple Operating modes: Router mode : to access the internet. Access Point mode : to extend wired network over wireless .Repeater mode : to extend the range of existing wireless router.Easy Setup: Super simple set-up with the D-Link Assistant Mobile APP Or with intuitive WEB GUI setup wizard', 1699, 1040, '0', '2025-01-16 18:41:06', NULL, '0', '0000-00-00'),
(15, 'Canon Pixma MG2577s All-in-One Inkjet Colour Printer (Blue/White)', 'Printer Type - Inkjet; Functionality - All-in-One (Print, Scan, Copy), Scanner type - Flatbed ; Printer Output - ColourConnectivity - USB ; Compatibility - Windows XP or newer and Mac OS X v10.7.5 or newerPages per minute - 8 pages (Black), 4 pages (Colour) ; Cost per page - Rs 5.3 (Black & White), Rs 7.8 (Colour) - As per ISO standardsIdeal usage - Home & Small Office, Low usage ( less than 100 pages per month)Page size supported - 4.0\"x6.0\" till A4 / Letter / Legal ; Duplex Print - Manual ; Print resolution - 4800x600Compatible Ink Cartridge - PG-745 (Black), CL-746 (Colour) ; Page Yield - 180 pages ; Includes 1 Black and 1 Colour cartridge in the boxWarranty Details: 1 year manufacturer warranty from the date of purchase', 2899, 4800, '0', '2025-01-16 18:41:06', NULL, '0', '0000-00-00'),
(16, 'Epson Perfection V39 Scanner', '4800 x 4800 dpi scanningUSB poweredBuilt-in kickstandDetachable lidEasy Photo ScanWith Epson Easy Photo Fix software, improve the quality of your scans by removing dust, restoring faded colours and correcting backlight', 5349, 1200, '0', '2025-01-16 18:41:06', NULL, '0', '0000-00-00'),
(17, 'Xiaomi Pad 6| Qualcomm Snapdragon 870| Powered by HyperOS |144Hz Refresh Rate| 8GB, 256GB| 2.8K+ Display (11-inch/27.81cm) Tablet| Dolby Vision Atmos| Quad Speakers| Wi-Fi| Gray', 'Snapdragon 870 Octa-Core Processor | Adreno 650 | Qualcomm AI engine | LPDDR5 RAM | UFS 3.1 | Up to 8GB RAM144Hz 7-Stage Refresh Rate | 27.9cm(11) Display Tablet | 2.8K Resolution | 1 Billion Colors | 2880*1800 High ResolutionQuad Speakers with Dolby Atmos | Long Lasting 8840mAh Battery | Android 13 | MIUI 14 with Android & Security Updates8MP Front Camera with Focus Frame | 13MP Rear Camera | Metal Unibody Design', 21999, 1700, '0', '2025-01-16 18:41:06', NULL, '0', '0000-00-00'),
(18, 'OnePlus Pad 2(12.1 Inch)LCD Display,12GB RAM, 256GB Storage,Snapdragon 8 Gen 3,144Hz Refresh Rate,Dolby Vision & Atmos,Open Canvas,AI features,6 speakers,Wi-Fi with Cellular Data Sharing [Nimbus Gray]', '[Display]: 3K+ Display (30.73cm), 7:5 ReadFit ratio; Display type: IPS LCD; Display resolution: 3000x2120 Dolby Vision display, 304 PPI; Peak Display brightness (900 nits); Screen refresh rate: 144Hz.[AI-enhanced Productivity]: AI Eraser 2.0 to remove unwanted objects in photos, Smart Cutout to quickly create stickers, & the AI Toolbox set of features like AI Summary & AI Writer.[Design & Storage]: 12GB RAM+ 256GB storage. All-metal unibody seamless design for lasting beauty and durability. Anodization enhances durability, ensuring a scratch-free look.[Processor]: Snapdragon 8 Gen 3 is one of the fastest SoC in the smartphone industry, and with stable diffusion. The upgraded Qualcomm Adreno GPU yields 25% faster graphics rendering and 25% improved GPU power efficiency, enhancing gaming and streaming[Speakers]: Equipped with 6 speakers (3 on each side), it delivers a more impactful bass effect, clearer high-frequency performance, and a more immersive stereo sound experience.[Battery & Charging]: 9510mAh Battery with 67W SUPERVOOC fast charging which can fully charge the Pad 2 in just 80 minutes.[Camera]: Front 8MP & Rear 13MP cameras which clearly capture memorable moments, scan files/documents easily along with lots of AI features', 40999, 1710, '0', '2025-01-16 18:41:06', NULL, '0', '0000-00-00'),
(34, 'Testing PRoduct ', '<p>sdasdas sd sd as d</p>', 200, 20, '0', '2025-01-18 04:06:01', NULL, '0', '0000-00-00'),
(35, 'asdsadsa das ds d ', '<p>123</p>', 200, 20, '0', '2025-01-27 06:46:51', NULL, '0', '0000-00-00'),
(36, 'chakli', '<p>dsadsdsdcsikhjkhnmb</p>', 80, 10, '0', '2025-02-18 07:53:43', NULL, '0', '0000-00-00'),
(37, 'Farsan', '<p>dsdsddscds</p>', 100, 20, '1', '2025-02-18 07:55:10', NULL, '0', '0000-00-00'),
(38, 'Spicy Potato Chivda', '<p>zxzcxvcx</p>', 100, 10, '1', '2025-02-18 07:56:41', NULL, '0', '0000-00-00'),
(39, 'Farsan spicy', '<p>dfggvhvng</p>', 150, 20, '1', '2025-02-18 09:07:55', NULL, '0', '0000-00-00'),
(40, 'Farsan potato', '<p>sdzdxcdxxdc</p>', 110, 50, '1', '2025-02-18 09:08:39', NULL, '0', '0000-00-00'),
(41, 'Milk Cake', '<p>cxvvvvxxvvv</p>', 50, 10, '1', '2025-02-20 03:24:08', NULL, '0', '2025-07-31'),
(42, 'Motichoor Laddo', '<p>csdcvvvv</p>', 100, 20, '1', '2025-02-20 03:25:58', NULL, '0', '2025-03-20'),
(43, 'Kaju Katli', '<p>xczcxzczcc</p>', 200, 20, '1', '2025-02-20 03:27:17', NULL, '0', '2025-02-28'),
(44, 'Rajbhog', '<p>vcxvcvxvxv</p>', 150, 50, '1', '2025-02-20 03:28:26', NULL, '0', '2025-02-28'),
(45, 'Mini Gulabjam', '<p>cdsdsdd</p>', 200, 50, '1', '2025-02-20 03:29:36', NULL, '0', '2025-02-25'),
(46, 'Sweet Amla', '<p>djgjbfdsjbsjka</p>', 80, 10, '1', '2025-02-20 03:30:54', NULL, '0', '2025-02-25'),
(47, 'Madrasi Sauf', '<p>djkhksjadhsakj</p>', 50, 10, '1', '2025-02-20 03:32:08', NULL, '0', '2025-02-26'),
(48, 'Madrasi Sauf', '<p>djkhksjadhsakj</p>', 50, 10, '1', '2025-02-20 03:32:08', NULL, '0', '2025-02-26'),
(49, 'Bhujia Sev', '<p>cvxcvxv</p>', 100, 20, '1', '2025-02-20 03:33:36', NULL, '0', '2025-02-22'),
(50, 'Moong Dal', '<p>jksdhnakjsdfn,</p>', 50, 10, '1', '2025-02-20 03:34:31', NULL, '0', '2025-02-27'),
(51, 'Dry Petha', '<p>zxxxzxc</p>', 120, 40, '1', '2025-02-20 03:59:34', NULL, '0', '2025-02-26'),
(52, 'Besan Ladoo', '<p>saxdcc</p>', 150, 50, '1', '2025-02-20 04:00:35', NULL, '0', '2025-02-27'),
(53, 'Butter', '<p>xzcxvv</p>', 20, 10, '1', '2025-02-20 04:48:46', NULL, '0', '2025-02-26'),
(54, 'Coconut', '<p>ZXZX</p>', 25, 20, '1', '2025-02-20 04:50:48', NULL, '0', '2025-02-26'),
(55, 'Butterscotch', '<p>zxzcc</p>', 50, 10, '1', '2025-02-20 04:54:58', NULL, '0', '2025-02-26'),
(56, 'Cococrunch', '<p>asXZdc</p>', 100, 20, '1', '2025-02-20 04:56:59', NULL, '0', '2025-02-25'),
(57, 'Chocolate', '<p>cbvbbn</p>', 70, 20, '1', '2025-02-20 05:11:01', NULL, '0', '2025-02-26'),
(58, 'Chocolate', '<p>cbvbbn</p>', 70, 20, '0', '2025-02-20 05:11:05', NULL, '0', '2025-02-26');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `prod_img_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `file_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`prod_img_id`, `product_id`, `file_name`, `is_active`, `added_on`, `data`) VALUES
(1, 1, '71nTwoiWQIL._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(2, 1, '61F1S1V5chL._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(3, 1, '61JbOmmHjSL._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(4, 2, '81y5M1xVgKL._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(5, 2, '81hwM+O36bL._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(6, 2, '71uNfJgnrYL._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(7, 3, '819cvkE--kL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(8, 3, '81qU9HN4E+L._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(9, 3, '81OLJHvnAML._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(10, 4, '61wt6u4yXEL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(11, 4, '71bzRKPLHcL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(12, 4, '81tP0fMaJML._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(13, 5, '71u2F4bIzXL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(14, 5, '71QR6AY4M6L._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(15, 5, '611mEARqOnL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(16, 5, '612FGLxoQDL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(17, 6, '61Tedl8bksL._SX679_.jpg', '0', '2025-01-16 19:02:12', NULL),
(18, 6, '71Ce7JmgS6L._SX679_.jpg', '0', '2025-01-16 19:02:12', NULL),
(19, 7, '71bBCTIvIIL._SX679_.jpg', '0', '2025-01-16 19:02:12', NULL),
(20, 8, '71ai4yZJUgL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(21, 8, '51yvHIQUPgL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(22, 8, '41xDwVVxTWL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(23, 8, '518YeDMbgmL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(24, 8, '71Tflh-kCeL._SY879_.jpg', '1', '2025-01-16 19:02:12', NULL),
(25, 9, '81E+P0-L1VL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(26, 9, '81Paie44TSL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(27, 10, '71t2GDCrIbL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(28, 10, '81ceMuSihLL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(29, 10, '61fsBFww9DL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(30, 11, '61-Y-eWXqtL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(31, 11, '61Egbtl06bL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(32, 11, '51O+exD+3jL._SL1000_.jpg', '1', '2025-01-16 19:02:12', NULL),
(33, 12, '61JNbQnIUDL._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(34, 12, '417UynCAixL._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(35, 13, '81TB5JcEKkL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(36, 14, '314BnT0d8FL._SY300_SX300_QL70_FMwebp_.webp', '1', '2025-01-16 19:02:12', NULL),
(37, 15, '51TgRks3kIL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(38, 15, '61vbnkR36zL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(39, 15, '71ricz+ENhL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(40, 16, '61e8xgi7jrL._SX679_.jpg', '1', '2025-01-16 19:02:12', NULL),
(41, 17, '61N1RFGVVCL._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(42, 17, '81oz4DcvD4L._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(43, 17, '7135E0xd7xL._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(44, 18, '61tslaYWLjL._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(45, 18, '51jgG3xLVnL._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(46, 18, '51HCGpeU88L._SX522_.jpg', '1', '2025-01-16 19:02:12', NULL),
(47, 18, '7163MSZRX3L._SL1500_.jpg', '1', '2025-01-16 19:02:12', NULL),
(48, 18, '71NblC5DpxL._SL1500_.jpg', '1', '2025-01-16 19:02:12', NULL),
(73, 34, 'image0.png', '1', '2025-01-18 04:06:01', NULL),
(74, 34, 'image1.png', '1', '2025-01-18 04:06:01', NULL),
(75, 34, 'image2.png', '1', '2025-01-18 04:06:01', NULL),
(76, 34, 'image3.png', '1', '2025-01-18 04:06:01', NULL),
(77, 34, 'image4.png', '1', '2025-01-18 04:06:01', NULL),
(78, 34, 'image5.png', '1', '2025-01-18 04:06:01', NULL),
(79, 34, 'image6.png', '1', '2025-01-18 04:06:01', NULL),
(80, 34, 'image7.png', '1', '2025-01-18 04:06:01', NULL),
(81, 35, 'image0.png', '1', '2025-01-27 06:46:51', NULL),
(82, 36, '2025218132341NaN0.png', '0', '2025-02-18 07:53:43', NULL),
(83, 37, '202521813257NaN0.png', '1', '2025-02-18 07:55:10', NULL),
(84, 38, '2025218132638NaN0.png', '1', '2025-02-18 07:56:41', NULL),
(85, 39, '2025218143752NaN0.png', '1', '2025-02-18 09:07:55', NULL),
(86, 40, '2025218143836NaN0.png', '1', '2025-02-18 09:08:39', NULL),
(87, 6, '202521911743NaN0.png', '0', '2025-02-18 19:47:44', NULL),
(88, 6, '202521911743NaN1.png', '0', '2025-02-18 19:47:44', NULL),
(89, 6, '202521912016NaN0.png', '1', '2025-02-18 19:50:16', NULL),
(90, 6, '202521912016NaN1.png', '1', '2025-02-18 19:50:16', NULL),
(91, 41, '20252208547NaN0.png', '1', '2025-02-20 03:24:08', NULL),
(92, 42, '202522085556NaN0.png', '1', '2025-02-20 03:25:58', NULL),
(93, 43, '202522085715NaN0.png', '1', '2025-02-20 03:27:17', NULL),
(94, 44, '202522085824NaN0.png', '1', '2025-02-20 03:28:26', NULL),
(95, 45, '202522085935NaN0.png', '1', '2025-02-20 03:29:36', NULL),
(96, 46, '20252209052NaN0.png', '1', '2025-02-20 03:30:54', NULL),
(97, 47, '20252209147NaN0.png', '1', '2025-02-20 03:32:08', NULL),
(98, 48, '20252209154NaN0.png', '1', '2025-02-20 03:32:08', NULL),
(99, 49, '20252209335NaN0.png', '1', '2025-02-20 03:33:36', NULL),
(100, 50, '20252209430NaN0.png', '1', '2025-02-20 03:34:31', NULL),
(101, 51, '202522092933NaN0.png', '1', '2025-02-20 03:59:35', NULL),
(102, 52, '202522093034NaN0.png', '1', '2025-02-20 04:00:35', NULL),
(103, 53, '2025220101844NaN0.png', '1', '2025-02-20 04:48:46', NULL),
(104, 54, '2025220102046NaN0.png', '1', '2025-02-20 04:50:48', NULL),
(105, 55, '2025220102456NaN0.png', '1', '2025-02-20 04:54:58', NULL),
(106, 56, '2025220102657NaN0.png', '1', '2025-02-20 04:56:59', NULL),
(107, 57, '2025220104044NaN0.png', '1', '2025-02-20 05:11:01', NULL),
(108, 58, '2025220104058NaN0.png', '1', '2025-02-20 05:11:05', NULL),
(109, 36, '2025220141415NaN0.png', '1', '2025-02-20 08:44:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_mapping`
--

CREATE TABLE `product_mapping` (
  `product_mapping_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_mapping`
--

INSERT INTO `product_mapping` (`product_mapping_id`, `product_id`, `brand_id`, `category_id`, `sub_category_id`, `added_on`, `is_active`) VALUES
(1, 1, 3, 2, 1, '2025-01-16 19:14:11', '1'),
(2, 2, 5, 2, 1, '2025-01-16 19:14:11', '1'),
(3, 3, 6, 2, 1, '2025-01-16 19:14:11', '1'),
(4, 4, 1, 2, 2, '2025-01-16 19:14:11', '1'),
(5, 5, 7, 2, 2, '2025-01-16 19:14:11', '1'),
(6, 6, 8, 2, 2, '2025-01-16 19:14:11', '1'),
(7, 7, 9, 2, 3, '2025-01-16 19:14:11', '1'),
(8, 8, 10, 2, 3, '2025-01-16 19:14:11', '1'),
(9, 9, 1, 2, 3, '2025-01-16 19:14:11', '1'),
(10, 10, 11, 2, 4, '2025-01-16 19:14:11', '1'),
(11, 11, 2, 2, 4, '2025-01-16 19:14:11', '1'),
(12, 12, 12, 2, 5, '2025-01-16 19:14:11', '1'),
(13, 13, 3, 2, 5, '2025-01-16 19:14:11', '1'),
(14, 14, 13, 2, 6, '2025-01-16 19:14:11', '1'),
(15, 15, 14, 2, 7, '2025-01-16 19:14:11', '1'),
(16, 16, 15, 2, 8, '2025-01-16 19:14:11', '1'),
(17, 17, 16, 2, 9, '2025-01-16 19:14:11', '1'),
(18, 18, 17, 2, 9, '2025-01-16 19:14:11', '1'),
(28, 34, 17, 10, 87, '2025-01-18 04:06:01', '1'),
(29, 35, 17, 10, 87, '2025-01-27 06:46:51', '1'),
(30, 36, 20, 16, 100, '2025-02-18 07:53:43', '1'),
(31, 37, 20, 14, 102, '2025-02-18 07:55:10', '1'),
(32, 38, 20, 14, 102, '2025-02-18 07:56:41', '1'),
(33, 39, 20, 14, 102, '2025-02-18 09:07:55', '1'),
(34, 40, 20, 14, 102, '2025-02-18 09:08:39', '1'),
(35, 41, 30, 18, 103, '2025-02-20 03:24:08', '1'),
(36, 42, 30, 18, 103, '2025-02-20 03:25:58', '1'),
(37, 43, 30, 18, 103, '2025-02-20 03:27:17', '1'),
(38, 44, 30, 18, 104, '2025-02-20 03:28:26', '1'),
(39, 45, 30, 18, 104, '2025-02-20 03:29:36', '1'),
(40, 46, 30, 18, 105, '2025-02-20 03:30:54', '1'),
(41, 47, 30, 18, 105, '2025-02-20 03:32:08', '1'),
(42, 48, 30, 18, 105, '2025-02-20 03:32:08', '1'),
(43, 49, 30, 19, 106, '2025-02-20 03:33:36', '1'),
(44, 50, 30, 19, 106, '2025-02-20 03:34:31', '1'),
(45, 51, 31, 18, 103, '2025-02-20 03:59:35', '1'),
(46, 52, 31, 18, 103, '2025-02-20 04:00:35', '1'),
(47, 53, 33, 20, 118, '2025-02-20 04:48:46', '1'),
(48, 54, 33, 20, 118, '2025-02-20 04:50:48', '1'),
(49, 55, 33, 28, 119, '2025-02-20 04:54:58', '1'),
(50, 56, 33, 28, 119, '2025-02-20 04:56:59', '1'),
(51, 57, 33, 20, 120, '2025-02-20 05:11:01', '1'),
(52, 58, 33, 20, 120, '2025-02-20 05:11:05', '1');

-- --------------------------------------------------------

--
-- Table structure for table `rating_review`
--

CREATE TABLE `rating_review` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Approved','Pending','Rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rating_review`
--

INSERT INTO `rating_review` (`id`, `order_id`, `product_id`, `user_id`, `rating`, `message`, `added_on`, `status`) VALUES
(1, 1, 3, 3, 2, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', '2025-01-21 00:00:00', 'Approved'),
(2, 1, 1, 1, 4, 'vvvvvThis is a sample text message that contains exactly one hundred characters for validation purpose.', '0000-00-00 00:00:00', 'Approved'),
(3, 1, 2, 1, 4, 'vvvvvThis is a sample text message that contains exactly one hundred characters for validation purpose.', '0000-00-00 00:00:00', 'Approved'),
(4, 1, 3, 2, 4, 'Excellent', '0000-00-00 00:00:00', 'Approved'),
(5, 1, 1, 1, 1, '', '0000-00-00 00:00:00', 'Approved'),
(6, 1, 2, 1, 4, 'NotBad', '0000-00-00 00:00:00', 'Approved'),
(7, 1, 3, 1, 5, 'Excellent', '0000-00-00 00:00:00', 'Approved'),
(8, 1, 1, 1, 1, '', '0000-00-00 00:00:00', 'Approved'),
(9, 1, 2, 1, 4, 'NotBad', '0000-00-00 00:00:00', 'Approved'),
(10, 1, 3, 1, 3, 'Excellent', '0000-00-00 00:00:00', 'Rejected'),
(11, 1, 1, 1, 2, '', '0000-00-00 00:00:00', 'Pending'),
(12, 1, 2, 1, 4, 'NotBad', '0000-00-00 00:00:00', 'Approved'),
(13, 1, 3, 1, 4, 'Excellent', '0000-00-00 00:00:00', 'Approved'),
(14, 1, 1, 1, 5, 'vvvvvThis is a sample text message that contains exactly one hundred characters for validation purpose.', '2025-02-12 17:30:08', 'Approved'),
(15, 1, 2, 1, 3, 'vvvvvThis is a sample text message that contains exactly one hundred characters for validation purpose.', '2025-02-12 17:30:08', 'Approved'),
(16, 1, 3, 1, 4, 'vvvvThis is a sample text message that contains exactly one hundred characters for validation purpose.', '2025-02-12 17:30:08', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `sub_category_id` int(11) NOT NULL,
  `sub_category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_category_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`sub_category_id`, `sub_category_name`, `sub_category_value`, `added_on`, `is_active`) VALUES
(1, 'Components', '', '2025-01-16 08:23:31', '1'),
(2, 'Desktops', '', '2025-01-16 08:23:31', '1'),
(3, 'External Devices & Data Storage', '', '2025-01-16 08:23:31', '1'),
(4, 'Laptops', '', '2025-01-16 08:23:31', '1'),
(5, 'Monitors', '', '2025-01-16 08:23:31', '1'),
(6, 'Networking Devices', '', '2025-01-16 08:23:31', '1'),
(7, 'Printers, Inks & Accessories', '', '2025-01-16 08:23:31', '1'),
(8, 'Scanners', '', '2025-01-16 08:23:31', '1'),
(9, 'Tablets', '', '2025-01-16 08:23:31', '1'),
(10, 'Mobile Accessories', '', '2025-01-16 08:23:31', '1'),
(11, 'Data Cards & Dongles', '', '2025-01-16 08:23:31', '1'),
(12, 'Smartphones & Basic Mobiles', '', '2025-01-16 08:23:31', '1'),
(13, 'Smart Watches', '', '2025-01-16 08:23:31', '1'),
(14, 'Home Cinema, TV & Video Accessories', '', '2025-01-16 08:23:31', '1'),
(15, 'AV Receivers & Amplifiers', '', '2025-01-16 08:23:31', '1'),
(16, 'DVD Players & Recorders', '', '2025-01-16 08:23:31', '1'),
(17, 'Home Theater Systems', '', '2025-01-16 08:23:31', '1'),
(18, 'Media Streaming Devices', '', '2025-01-16 08:23:31', '1'),
(19, 'Portable DVD & Blu-ray Players', '', '2025-01-16 08:23:31', '1'),
(20, 'Home Cinema Projectors', '', '2025-01-16 08:23:31', '1'),
(21, 'Satellite Dishes', '', '2025-01-16 08:23:31', '1'),
(22, 'Satellite TV Dish Equipment', '', '2025-01-16 08:23:31', '1'),
(23, 'Home Cinema Speakers', '', '2025-01-16 08:23:31', '1'),
(24, 'Televisions', '', '2025-01-16 08:23:31', '1'),
(25, 'TV Receivers', '', '2025-01-16 08:23:31', '1'),
(26, 'Hi-Fi & Home Audio Accessories', '', '2025-01-16 08:23:31', '1'),
(27, 'Hi-Fi Compact Stereo Systems', '', '2025-01-16 08:23:31', '1'),
(28, 'Radios & Boomboxes', '', '2025-01-16 08:23:31', '1'),
(29, 'Receivers & Separates', '', '2025-01-16 08:23:31', '1'),
(30, 'Hi-Fi & Home Audio Speakers', '', '2025-01-16 08:23:31', '1'),
(31, 'Camera & Photo Accessories', '', '2025-01-16 08:23:31', '1'),
(32, 'Action Cameras', '', '2025-01-16 08:23:31', '1'),
(33, 'Binoculars, Telescopes & Optics', '', '2025-01-16 08:23:31', '1'),
(34, 'Cases & Bags for Camera & Photo', '', '2025-01-16 08:23:31', '1'),
(35, 'Digital Cameras', '', '2025-01-16 08:23:31', '1'),
(36, 'Film Scanners', '', '2025-01-16 08:23:31', '1'),
(37, 'Film Cameras', '', '2025-01-16 08:23:31', '1'),
(38, 'Camera Flashes', '', '2025-01-16 08:23:31', '1'),
(39, 'Camcorder & Camera Lenses', '', '2025-01-16 08:23:31', '1'),
(40, 'Photo Printers', '', '2025-01-16 08:23:31', '1'),
(41, 'Photo Studio & Lighting', '', '2025-01-16 08:23:31', '1'),
(42, 'Security Cameras', '', '2025-01-16 08:23:31', '1'),
(43, 'Simulated Cameras', '', '2025-01-16 08:23:31', '1'),
(44, 'Slide Photo Viewers', '', '2025-01-16 08:23:31', '1'),
(45, 'Underwater Video & Photography', '', '2025-01-16 08:23:31', '1'),
(46, 'Video Cameras', '', '2025-01-16 08:23:31', '1'),
(47, 'Adapters', '', '2025-01-16 08:23:31', '1'),
(48, 'Webcams & VoIP Equipment', '', '2025-01-16 08:23:31', '1'),
(49, 'Blank Media', '', '2025-01-16 08:23:31', '1'),
(50, 'Blank Media Cases & Wallets', '', '2025-01-16 08:23:31', '1'),
(51, 'Cables & Accessories', '', '2025-01-16 08:23:31', '1'),
(52, 'Hard Disk Bags', '', '2025-01-16 08:23:31', '1'),
(53, 'Hard Drive Accessories', '', '2025-01-16 08:23:31', '1'),
(54, 'Keyboards, Mice & Input Devices', '', '2025-01-16 08:23:31', '1'),
(55, 'KVM Switches', '', '2025-01-16 08:23:31', '1'),
(56, 'Laptop Accessories', '', '2025-01-16 08:23:31', '1'),
(57, 'Media Storage Sleeves', '', '2025-01-16 08:23:31', '1'),
(58, 'Monitor Accessories', '', '2025-01-16 08:23:31', '1'),
(59, 'Office Equipment Cleaners', '', '2025-01-16 08:23:31', '1'),
(60, 'PC Gaming Peripherals', '', '2025-01-16 08:23:31', '1'),
(61, 'Tablet Accessories', '', '2025-01-16 08:23:31', '1'),
(62, 'Uninterrupted Power Supplies', '', '2025-01-16 08:23:31', '1'),
(63, 'USB Gadgets', '', '2025-01-16 08:23:31', '1'),
(64, 'USB Hubs', '', '2025-01-16 08:23:31', '1'),
(65, 'Electronics', '', '2025-01-16 08:23:31', '1'),
(66, 'Home & Kitchen', '', '2025-01-16 08:23:31', '1'),
(67, 'Home Improvement', '', '2025-01-16 08:23:31', '1'),
(68, 'Industrial & Scientific', '', '2025-01-16 08:23:31', '1'),
(69, 'Sports, Fitness & Outdoors', '', '2025-01-16 08:23:31', '1'),
(70, 'DJ & VJ Equipment', '', '2025-01-16 08:23:31', '1'),
(71, 'Drums & Percussion', '', '2025-01-16 08:23:31', '1'),
(72, 'General Music-Making Accessories', '', '2025-01-16 08:23:31', '1'),
(73, 'Guitars, Basses & Gear', '', '2025-01-16 08:23:31', '1'),
(74, 'Karaoke Equipment', '', '2025-01-16 08:23:31', '1'),
(75, 'Microphones', '', '2025-01-16 08:23:31', '1'),
(76, 'PA & Stage', '', '2025-01-16 08:23:31', '1'),
(77, 'Piano & Keyboard', '', '2025-01-16 08:23:31', '1'),
(78, 'Recording & Computer', '', '2025-01-16 08:23:31', '1'),
(79, 'String Instruments', '', '2025-01-16 08:23:31', '1'),
(80, 'Synthesisers, Samplers & Digital Instruments', '', '2025-01-16 08:23:31', '1'),
(81, 'Wind Instruments', '', '2025-01-16 08:23:31', '1'),
(82, 'Calendars, Planners & Personal Organisers', '', '2025-01-16 08:23:31', '1'),
(83, 'Envelopes & Postal Supplies', '', '2025-01-16 08:23:31', '1'),
(84, 'Furniture & Lighting', '', '2025-01-16 08:23:31', '1'),
(85, 'Office Electronics', '', '2025-01-16 08:23:31', '1'),
(86, 'Office Paper Products', '', '2025-01-16 08:23:31', '1'),
(87, 'Office Supplies', '', '2025-01-16 08:23:31', '1'),
(88, ' Wind Instruments', '', '2025-01-21 10:18:19', '1'),
(97, 'Testing', '', '2025-01-27 20:00:39', '1'),
(98, 'wind instrument1', '', '2025-01-29 10:10:59', '1'),
(99, 'Router', '', '2025-01-29 10:13:39', '1'),
(100, 'ABC', '', '2025-01-29 10:14:51', '1'),
(101, 'song', '', '2025-01-30 04:45:15', '1'),
(102, 'Namkeen', '', '2025-02-18 07:52:20', '1'),
(103, 'Packed sweets', '', '2025-02-19 06:10:04', '1'),
(104, 'Tin sweets', '', '2025-02-19 06:10:52', '1'),
(105, 'Fresh pops', '', '2025-02-19 06:11:18', '1'),
(106, 'Namkeen1', '', '2025-02-19 06:12:52', '1'),
(107, 'Papad', '', '2025-02-19 06:13:29', '1'),
(108, 'Mathari', '', '2025-02-19 06:13:43', '1'),
(109, 'Bread', '', '2025-02-19 16:26:03', '1'),
(110, 'Bunpav', '', '2025-02-19 16:26:33', '1'),
(111, 'Cookies', '', '2025-02-19 16:26:56', '1'),
(112, 'Besan', '', '2025-02-19 16:27:25', '1'),
(113, 'Chiwda', '', '2025-02-19 16:27:40', '1'),
(114, 'Sweet', '', '2025-02-19 16:27:57', '1'),
(115, 'Potato chips', '', '2025-02-19 16:28:24', '1'),
(116, 'Fryums', '', '2025-02-19 16:28:54', '1'),
(117, 'Dal & nuts', '', '2025-02-19 16:29:15', '1'),
(118, 'Butter Cookies', '', '2025-02-20 04:47:52', '1'),
(119, 'Tricones', '', '2025-02-20 04:52:38', '1'),
(120, 'Chocolate cookies', '', '2025-02-20 05:09:27', '1'),
(121, '2123', '', '2025-02-20 13:12:33', '1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` bigint(20) NOT NULL,
  `gender` enum('male','female','transgender') COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_photo` blob,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_verified` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `password`, `mobile_number`, `gender`, `profile_photo`, `is_active`, `mobile_verified`, `added_on`, `city`, `state`, `pincode`) VALUES
(1, 'James', 'Butt', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5046218927, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'New Orleans', 'Orleans', 70116),
(2, 'Josephine', 'Darakjy', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8102929388, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Brighton', 'Livingston', 48116),
(3, 'Art', 'Venere', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8566368749, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Bridgeport', 'Gloucester', 8014),
(4, 'Lenna', 'Paprocki', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9073854412, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Anchorage', 'Anchorage', 99501),
(5, 'Donette', 'Foller', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5135701893, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Hamilton', 'Butler', 45011),
(6, 'Simona', 'Morasca', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4195032484, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Ashland', 'Ashland', 44805),
(7, 'Mitsue', 'Tollner', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7735736914, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Chicago', 'Cook', 60632),
(8, 'Leota', 'Dilliard', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4087523500, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'San Jose', 'Santa Clara', 95111),
(9, 'Sage', 'Wieser', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6054142147, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Sioux Falls', 'Minnehaha', 57105),
(10, 'Kris', 'Marrier', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4106558723, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Baltimore', 'Baltimore City', 21224),
(11, 'Minna', 'Amigon', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2158741229, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Kulpsville', 'Montgomery', 19443),
(12, 'Abel', 'Maclead', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6313353414, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Middle Island', 'Suffolk', 11953),
(13, 'Kiley', 'Caldarera', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3104985651, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Los Angeles', 'Los Angeles', 90034),
(14, 'Graciela', 'Ruta', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4407808425, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Chagrin Falls', 'Geauga', 44023),
(15, 'Cammy', 'Albares', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9565376195, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Laredo', 'Webb', 78045),
(16, 'Mattie', 'Poquette', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6022774385, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Phoenix', 'Maricopa', 85013),
(17, 'Meaghan', 'Garufi', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9313139635, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Mc Minnville', 'Warren', 37110),
(18, 'Gladys', 'Rim', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4146619598, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Milwaukee', 'Milwaukee', 53207),
(19, 'Yuki', 'Whobrey', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3132887937, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Taylor', 'Wayne', 48180),
(20, 'Fletcher', 'Flosi', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8158282147, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Rockford', 'Winnebago', 61109),
(21, 'Bette', 'Nicka', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6105453615, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Aston', 'Delaware', 19014),
(22, 'Veronika', 'Inouye', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4085401785, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'San Jose', 'Santa Clara', 95111),
(23, 'Willard', 'Kolmetz', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9723039197, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Irving', 'Dallas', 75062),
(24, 'Maryann', 'Royster', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5189667987, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Albany', 'Albany', 12204),
(25, 'Alisha', 'Slusarski', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7326583154, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Middlesex', 'Middlesex', 8846),
(26, 'Allene', 'Iturbide', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7156626764, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Stevens Point', 'Portage', 54481),
(27, 'Chanel', 'Caudy', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9133882079, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Shawnee', 'Johnson', 66218),
(28, 'Ezekiel', 'Chui', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4106691642, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Easton', 'Talbot', 21601),
(29, 'Willow', 'Kusko', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2125824976, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'New York', 'New York', 10011),
(30, 'Bernardo', 'Figeroa', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9363363951, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Conroe', 'Montgomery', 77301),
(31, 'Ammie', 'Corrio', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6148019788, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Columbus', 'Franklin', 43215),
(32, 'Francine', 'Vocelka', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5059773911, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Las Cruces', 'Dona Ana', 88011),
(33, 'Ernie', 'Stenseth', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2017096245, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Ridgefield Park', 'Bergen', 7660),
(34, 'Albina', 'Glick', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7329247882, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Dunellen', 'Middlesex', 8812),
(35, 'Alishia', 'Sergi', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2128601579, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'New York', 'New York', 10025),
(36, 'Solange', 'Shinko', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5049799175, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Metairie', 'Jefferson', 70002),
(37, 'Jose', 'Stockham', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2126758570, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'New York', 'New York', 10011),
(38, 'Rozella', 'Ostrosky', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8058326163, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Camarillo', 'Ventura', 93012),
(39, 'Valentine', 'Gillian', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2108129597, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'San Antonio', 'Bexar', 78204),
(40, 'Kati', 'Rulapaugh', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7854637829, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Abilene', 'Dickinson', 67410),
(41, 'Youlanda', 'Schemmer', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5415488197, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Prineville', 'Crook', 97754),
(42, 'Dyan', 'Oldroyd', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9134134604, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Overland Park', 'Johnson', 66204),
(43, 'Roxane', 'Campain', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9072314722, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Fairbanks', 'Fairbanks North Star', 99708),
(44, 'Lavera', 'Perin', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3056067291, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Miami', 'Miami-Dade', 33196),
(45, 'Erick', 'Ferencz', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9077411044, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Fairbanks', 'Fairbanks North Star', 99712),
(46, 'Fatima', 'Saylors', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9527682416, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Hopkins', 'Hennepin', 55343),
(47, 'Jina', 'Briddick', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6173995124, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Boston', 'Suffolk', 2128),
(48, 'Kanisha', 'Waycott', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3234532780, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Los Angeles', 'Los Angeles', 90006),
(49, 'Emerson', 'Bowley', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6083367444, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Madison', 'Dane', 53711),
(50, 'Blair', 'Malet', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2159079111, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Philadelphia', 'Philadelphia', 19132),
(51, 'Brock', 'Bolognia', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2124029216, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'New York', 'New York', 10003),
(52, 'Lorrie', 'Nestle', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9318756644, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Tullahoma', 'Coffee', 37388),
(53, 'Sabra', 'Uyetake', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8039255213, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Columbia', 'Richland', 29201),
(54, 'Marjory', 'Mastella', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6108145533, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Wayne', 'Delaware', 19087),
(55, 'Karl', 'Klonowski', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9088776135, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Flemington', 'Hunterdon', 8822),
(56, 'Tonette', 'Wenner', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5169686051, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Westbury', 'Nassau', 11590),
(57, 'Amber', 'Monarrez', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2159348655, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Jenkintown', 'Montgomery', 19046),
(58, 'Shenika', 'Seewald', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8184234007, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Van Nuys', 'Los Angeles', 91405),
(59, 'Delmy', 'Ahle', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4014582547, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Providence', 'Providence', 2909),
(60, 'Deeanna', 'Juhas', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2152119589, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Huntingdon Valley', 'Montgomery', 19006),
(61, 'Blondell', 'Pugh', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4019608259, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Providence', 'Providence', 2904),
(62, 'Jamal', 'Vanausdal', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7322341546, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Monroe Township', 'Middlesex', 8831),
(63, 'Cecily', 'Hollack', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5124863817, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Austin', 'Travis', 78731),
(64, 'Carmelina', 'Lindall', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3037247371, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Littleton', 'Douglas', 80126),
(65, 'Maurine', 'Yglesias', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4147481374, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Milwaukee', 'Milwaukee', 53214),
(66, 'Tawna', 'Buvens', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2126749610, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'New York', 'New York', 10009),
(67, 'Penney', 'Weight', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9077979628, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Anchorage', 'Anchorage', 99515),
(68, 'Elly', 'Morocco', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8143935571, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Erie', 'Erie', 16502),
(69, 'Ilene', 'Eroman', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4109149018, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Glen Burnie', 'Anne Arundel', 21061),
(70, 'Vallie', 'Mondella', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2088625339, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Boise', 'Ada', 83707),
(71, 'Kallie', 'Blackwood', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4153152761, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'San Francisco', 'San Francisco', 94104),
(72, 'Johnetta', 'Abdallah', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9192259345, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Chapel Hill', 'Orange', 27514),
(73, 'Bobbye', 'Rhym', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6505285783, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'San Carlos', 'San Mateo', 94070),
(74, 'Micaela', 'Rhymes', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9256473298, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Concord', 'Contra Costa', 94520),
(75, 'Tamar', 'Hoogland', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7403438575, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'London', 'Madison', 43140),
(76, 'Moon', 'Parlato', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5858668313, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Wellsville', 'Allegany', 14895),
(77, 'Laurel', 'Reitler', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4105204832, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Baltimore', 'Baltimore City', 21215),
(78, 'Delisa', 'Crupi', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9733542040, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Newark', 'Essex', 7105),
(79, 'Viva', 'Toelkes', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7734465569, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Chicago', 'Cook', 60647),
(80, 'Elza', 'Lipke', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9739273447, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Newark', 'Essex', 7104),
(81, 'Devorah', 'Chickering', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5059758559, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Clovis', 'Curry', 88101),
(82, 'Timothy', 'Mulqueen', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7183326527, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Staten Island', 'Richmond', 10309),
(83, 'Arlette', 'Honeywell', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9047754480, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Jacksonville', 'Duval', 32254),
(84, 'Dominque', 'Dickerson', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5109933758, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Hayward', 'Alameda', 94545),
(85, 'Lettie', 'Isenhower', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2166577668, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Beachwood', 'Cuyahoga', 44122),
(86, 'Myra', 'Munns', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8179147518, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Euless', 'Tarrant', 76040),
(87, 'Stephaine', 'Barfield', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3107747643, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Gardena', 'Los Angeles', 90247),
(88, 'Lai', 'Gato', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8477287286, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Evanston', 'Cook', 60201),
(89, 'Stephen', 'Emigh', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3305375358, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Akron', 'Summit', 44302),
(90, 'Tyra', 'Shields', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2152551641, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Philadelphia', 'Philadelphia', 19106),
(91, 'Tammara', 'Wardrip', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6508031936, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Burlingame', 'San Mateo', 94010),
(92, 'Cory', 'Gibes', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6265721096, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'San Gabriel', 'Los Angeles', 91776),
(93, 'Danica', 'Bruschke', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2547828569, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Waco', 'McLennan', 76708),
(94, 'Wilda', 'Giguere', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9078705536, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Anchorage', 'Anchorage', 99501),
(95, 'Elvera', 'Benimadho', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4087038505, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'San Jose', 'Santa Clara', 95110),
(96, 'Carma', 'Vanheusen', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5105037169, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'San Leandro', 'Alameda', 94577),
(97, 'Malinda', 'Hochard', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3177225066, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Indianapolis', 'Marion', 46202),
(98, 'Natalie', 'Fern', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3077048713, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Rock Springs', 'Sweetwater', 82901),
(99, 'Lisha', 'Centini', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7032353937, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Mc Lean', 'Fairfax', 22102),
(100, 'Arlene', 'Klusman', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5047105840, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'New Orleans', 'Orleans', 70112),
(101, 'Alease', 'Buemi', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3033014946, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Boulder', 'Boulder', 80303),
(102, 'Louisa', 'Cronauer', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5108287047, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'San Leandro', 'Alameda', 94577),
(103, 'Angella', 'Cetta', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8088927943, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Honolulu', 'Honolulu', 96817),
(104, 'Cyndy', 'Goldammer', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9523349408, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Burnsville', 'Dakota', 55337),
(105, 'Rosio', 'Cork', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3362435659, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'High Point', 'Guilford', 27263),
(106, 'Celeste', 'Korando', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5165092347, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Lynbrook', 'Nassau', 11563),
(107, 'Twana', 'Felger', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5039393153, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Portland', 'Washington', 97224),
(108, 'Estrella', 'Samu', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6089767199, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Beloit', 'Rock', 53511),
(109, 'Donte', 'Kines', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5084298576, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Worcester', 'Worcester', 1602),
(110, 'Tiffiny', 'Steffensmeier', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3053859695, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Miami', 'Miami-Dade', 33133),
(111, 'Edna', 'Miceli', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8144602655, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Erie', 'Erie', 16502),
(112, 'Sue', 'Kownacki', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9726663413, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Mesquite', 'Dallas', 75149),
(113, 'Jesusa', 'Shin', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9312738709, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Tullahoma', 'Coffee', 37388),
(114, 'Rolland', 'Francescon', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9736492922, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Paterson', 'Passaic', 7501),
(115, 'Pamella', 'Schmierer', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3054208970, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Homestead', 'Miami-Dade', 33030),
(116, 'Glory', 'Kulzer', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4102249462, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Owings Mills', 'Baltimore', 21117),
(117, 'Shawna', 'Palaspas', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8052753566, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Thousand Oaks', 'Ventura', 91362),
(118, 'Brandon', 'Callaro', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8082156832, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Honolulu', 'Honolulu', 96819),
(119, 'Scarlet', 'Cartan', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2297353378, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Albany', 'Dougherty', 31701),
(120, 'Oretha', 'Menter', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6174185043, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Boston', 'Suffolk', 2210),
(121, 'Ty', 'Smith', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2016721553, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Hackensack', 'Bergen', 7601),
(122, 'Xuan', 'Rochin', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6509335072, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'San Mateo', 'San Mateo', 94403),
(123, 'Lindsey', 'Dilello', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9096399887, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Ontario', 'San Bernardino', 91761),
(124, 'Devora', 'Perez', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5109553016, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Oakland', 'Alameda', 94606),
(125, 'Herman', 'Demesa', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5184972940, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Troy', 'Rensselaer', 12180),
(126, 'Rory', 'Papasergi', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5708677489, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Clarks Summit', 'Lackawanna', 18411),
(127, 'Talia', 'Riopelle', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9732452133, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Orange', 'Essex', 7050),
(128, 'Van', 'Shire', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9084092890, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Pittstown', 'Hunterdon', 8867),
(129, 'Lucina', 'Lary', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3217494981, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Cocoa', 'Brevard', 32922),
(130, 'Bok', 'Isaacs', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7188093762, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Bronx', 'Bronx', 10468),
(131, 'Rolande', 'Spickerman', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8083153077, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Pearl City', 'Honolulu', 96782),
(132, 'Howard', 'Paulas', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3036234241, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Denver', 'Denver', 80231),
(133, 'Kimbery', 'Madarang', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9733101634, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Rockaway', 'Morris', 7866),
(134, 'Thurman', 'Manno', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6095243586, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Absecon', 'Atlantic', 8201),
(135, 'Becky', 'Mirafuentes', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9088778409, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Plainfield', 'Union', 7062),
(136, 'Beatriz', 'Corrington', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5085844279, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Middleboro', 'Plymouth', 2346),
(137, 'Marti', 'Maybury', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7737754522, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Chicago', 'Cook', 60638),
(138, 'Nieves', 'Gotter', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5035275274, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Portland', 'Multnomah', 97202),
(139, 'Leatha', 'Hagele', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2143391809, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Dallas', 'Dallas', 75227),
(140, 'Valentin', 'Klimek', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3123035453, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Chicago', 'Cook', 60604),
(141, 'Melissa', 'Wiklund', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4199393613, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Findlay', 'Hancock', 45840),
(142, 'Sheridan', 'Zane', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9516453605, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Riverside', 'Riverside', 92501),
(143, 'Bulah', 'Padilla', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2544634368, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Waco', 'McLennan', 76707),
(144, 'Audra', 'Kohnert', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6154067854, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Nashville', 'Davidson', 37211),
(145, 'Daren', 'Weirather', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4149592540, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Milwaukee', 'Milwaukee', 53216),
(146, 'Fernanda', 'Jillson', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4103875260, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Preston', 'Caroline', 21655),
(147, 'Gearldine', 'Gellinger', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9729346914, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Irving', 'Dallas', 75061),
(148, 'Chau', 'Kitzman', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3105608022, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Beverly Hills', 'Los Angeles', 90212),
(149, 'Theola', 'Frey', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5169485768, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Massapequa', 'Nassau', 11758),
(150, 'Cheryl', 'Haroldson', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6095187697, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Atlantic City', 'Atlantic', 8401),
(151, 'Laticia', 'Merced', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5135087371, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Cincinnati', 'Hamilton', 45203),
(152, 'Carissa', 'Batman', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5413264074, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Eugene', 'Lane', 97401),
(153, 'Lezlie', 'Craghead', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9195333762, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Smithfield', 'Johnston', 27577),
(154, 'Ozell', 'Shealy', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2123328435, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'New York', 'New York', 10002),
(155, 'Arminda', 'Parvis', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6029069419, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Phoenix', 'Maricopa', 85017),
(156, 'Reita', 'Leto', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3172341135, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Indianapolis', 'Marion', 46240),
(157, 'Yolando', 'Luczki', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3153044759, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Syracuse', 'Onondaga', 13214),
(158, 'Lizette', 'Stem', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8564875412, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Cherry Hill', 'Camden', 8002),
(159, 'Gregoria', 'Pawlowicz', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5162121915, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Garden City', 'Nassau', 11530),
(160, 'Carin', 'Deleo', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5013081040, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Little Rock', 'Pulaski', 72202),
(161, 'Chantell', 'Maynerich', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6515912583, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Saint Paul', 'Ramsey', 55101),
(162, 'Dierdre', 'Yum', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2153253042, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Philadelphia', 'Philadelphia', 19134),
(163, 'Larae', 'Gudroe', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9858907262, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Houma', 'Terrebonne', 70360),
(164, 'Latrice', 'Tolfree', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6319577624, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Ronkonkoma', 'Suffolk', 11779),
(165, 'Kerry', 'Theodorov', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9165913277, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Sacramento', 'Sacramento', 95827),
(166, 'Dorthy', 'Hidvegi', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2086492373, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Boise', 'Ada', 83704),
(167, 'Fannie', 'Lungren', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5125875746, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Round Rock', 'Williamson', 78664),
(168, 'Evangelina', 'Radde', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2159643284, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Philadelphia', 'Philadelphia', 19123),
(169, 'Novella', 'Degroot', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8084774775, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Hilo', 'Hawaii', 96720),
(170, 'Clay', 'Hoa', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7755018109, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Reno', 'Washoe', 89502),
(171, 'Jennifer', 'Fallick', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8479799545, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Wheeling', 'Cook', 60090),
(172, 'Irma', 'Wolfgramm', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9735457355, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Randolph', 'Morris', 7869),
(173, 'Eun', 'Coody', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8642563620, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Spartanburg', 'Spartanburg', 29301),
(174, 'Sylvia', 'Cousey', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4102099545, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Hampstead', 'Carroll', 21074),
(175, 'Nana', 'Wrinkles', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9148552115, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Mount Vernon', 'Westchester', 10553),
(176, 'Layla', 'Springe', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2122603151, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'New York', 'New York', 10011),
(177, 'Joesph', 'Degonia', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5106779785, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Berkeley', 'Alameda', 94710),
(178, 'Annabelle', 'Boord', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9786976263, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Concord', 'Middlesex', 1742),
(179, 'Stephaine', 'Vinning', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4157676596, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'San Francisco', 'San Francisco', 94104),
(180, 'Nelida', 'Sawchuk', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2019711638, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Paramus', 'Bergen', 7652),
(181, 'Marguerita', 'Hiatt', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9256347158, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Oakley', 'Contra Costa', 94561),
(182, 'Carmela', 'Cookey', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7734944195, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Chicago', 'Cook', 60623),
(183, 'Junita', 'Brideau', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9739433423, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Cedar Grove', 'Essex', 7009),
(184, 'Claribel', 'Varriano', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4195444900, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Perrysburg', 'Wood', 43551),
(185, 'Benton', 'Skursky', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3105792907, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Gardena', 'Los Angeles', 90248),
(186, 'Hillary', 'Skulski', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3522422570, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Homosassa', 'Citrus', 34448),
(187, 'Merilyn', 'Bayless', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4087585015, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Santa Clara', 'Santa Clara', 95054),
(188, 'Teri', 'Ennaco', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5708895187, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Hazleton', 'Luzerne', 18201),
(189, 'Merlyn', 'Lawler', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2015887810, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Jersey City', 'Hudson', 7304),
(190, 'Georgene', 'Montezuma', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9256155185, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'San Ramon', 'Contra Costa', 94583),
(191, 'Jettie', 'Mconnell', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9088023564, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Bridgewater', 'Somerset', 8807),
(192, 'Lemuel', 'Latzke', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6317486479, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Bohemia', 'Suffolk', 11716),
(193, 'Melodie', 'Knipp', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8056901682, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Thousand Oaks', 'Ventura', 91362),
(194, 'Candida', 'Corbley', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9082758357, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Somerville', 'Somerset', 8876),
(195, 'Karan', 'Karpin', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5039408327, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Beaverton', 'Washington', 97005),
(196, 'Andra', 'Scheyer', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5035162189, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Salem', 'Marion', 97302),
(197, 'Felicidad', 'Poullion', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8563059731, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Riverton', 'Burlington', 8077),
(198, 'Belen', 'Strassner', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7705078791, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Douglasville', 'Douglas', 30135),
(199, 'Gracia', 'Melnyk', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9042353633, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Jacksonville', 'Duval', 32216),
(200, 'Jolanda', 'Hanafan', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2074589196, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Bangor', 'Penobscot', 4401),
(201, 'Barrett', 'Toyama', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8177655781, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Kennedale', 'Tarrant', 76060),
(202, 'Helga', 'Fredicks', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7167524114, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Buffalo', 'Erie', 14228),
(203, 'Ashlyn', 'Pinilla', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3056709628, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Opa Locka', 'Miami-Dade', 33054),
(204, 'Fausto', 'Agramonte', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2123131783, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'New York', 'New York', 10038),
(205, 'Ronny', 'Caiafa', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2156057570, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Philadelphia', 'Philadelphia', 19103),
(206, 'Marge', 'Limmel', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8504301663, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Crestview', 'Okaloosa', 32536),
(207, 'Norah', 'Waymire', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4153067897, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'San Francisco', 'San Francisco', 94107),
(208, 'Aliza', 'Baltimore', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4085043552, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'San Jose', 'Santa Clara', 95132),
(209, 'Mozell', 'Pelkowski', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6509471215, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'South San Francisco', 'San Mateo', 94080),
(210, 'Viola', 'Bitsuie', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8188644875, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Northridge', 'Los Angeles', 91325),
(211, 'Franklyn', 'Emard', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2155588189, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Philadelphia', 'Philadelphia', 19103),
(212, 'Willodean', 'Konopacki', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3372538384, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Lafayette', 'Lafayette', 70506),
(213, 'Beckie', 'Silvestrini', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3135334884, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Dearborn', 'Wayne', 48126),
(214, 'Rebecka', 'Gesick', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5122138574, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Austin', 'Travis', 78754),
(215, 'Frederica', 'Blunk', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2144282285, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Dallas', 'Dallas', 75207),
(216, 'Glen', 'Bartolet', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2066975796, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Vashon', 'King', 98070),
(217, 'Freeman', 'Gochal', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6104763501, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Coatesville', 'Chester', 19320),
(218, 'Vincent', 'Meinerding', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2153721718, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Philadelphia', 'Philadelphia', 19143),
(219, 'Rima', 'Bevelacqua', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3108585079, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Gardena', 'Los Angeles', 90248),
(220, 'Glendora', 'Sarbacher', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7076538214, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Rohnert Park', 'Sonoma', 94928),
(221, 'Avery', 'Steier', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4078089439, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Orlando', 'Orange', 32803),
(222, 'Cristy', 'Lother', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7609714322, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Escondido', 'San Diego', 92025),
(223, 'Nicolette', 'Brossart', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5088379230, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Westborough', 'Worcester', 1581),
(224, 'Tracey', 'Modzelewski', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9362649294, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Conroe', 'Montgomery', 77301),
(225, 'Virgina', 'Tegarden', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4142148697, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Milwaukee', 'Milwaukee', 53226),
(226, 'Tiera', 'Frankel', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6266364117, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'El Monte', 'Los Angeles', 91731),
(227, 'Alaine', 'Bergesen', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9143009193, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Yonkers', 'Westchester', 10701),
(228, 'Earleen', 'Mai', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2142891973, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Dallas', 'Dallas', 75227),
(229, 'Leonida', 'Gobern', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2282355615, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Biloxi', 'Harrison', 39530),
(230, 'Ressie', 'Auffrey', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3056048981, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Miami', 'Miami-Dade', 33134),
(231, 'Justine', 'Mugnolo', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2123049225, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'New York', 'New York', 10048),
(232, 'Eladia', 'Saulter', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2014744924, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Ramsey', 'Bergen', 7446),
(233, 'Chaya', 'Malvin', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7349285182, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Ann Arbor', 'Washtenaw', 48103),
(234, 'Gwenn', 'Suffield', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6312586558, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Deer Park', 'Suffolk', 11729),
(235, 'Salena', 'Karpel', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3307918557, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Canton', 'Stark', 44707),
(236, 'Yoko', 'Fishburne', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2035064706, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'New Haven', 'New Haven', 6511),
(237, 'Taryn', 'Moyd', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7033224041, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Fairfax', 'Fairfax City', 22030),
(238, 'Katina', 'Polidori', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9786262978, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Wilmington', 'Middlesex', 1887),
(239, 'Rickie', 'Plumer', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4196931334, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Toledo', 'Lucas', 43613),
(240, 'Alex', 'Loader', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2536607821, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Tacoma', 'Pierce', 98409),
(241, 'Lashon', 'Vizarro', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9167417884, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Roseville', 'Placer', 95661),
(242, 'Lauran', 'Burnard', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3073427795, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Riverton', 'Fremont', 82501),
(243, 'Ceola', 'Setter', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2076277565, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Warren', 'Knox', 4864),
(244, 'My', 'Rantanen', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2154915633, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Richboro', 'Bucks', 18954),
(245, 'Lorrine', 'Worlds', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8137692939, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Tampa', 'Hillsborough', 33614),
(246, 'Peggie', 'Sturiale', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6196081763, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'El Cajon', 'San Diego', 92020),
(247, 'Marvel', 'Raymo', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9797188968, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'College Station', 'Brazos', 77840),
(248, 'Daron', 'Dinos', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8472333075, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Highland Park', 'Lake', 60035),
(249, 'An', 'Fritz', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6092285265, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Atlantic City', 'Atlantic', 8401),
(250, 'Portia', 'Stimmel', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9087227128, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Bridgewater', 'Somerset', 8807),
(251, 'Rhea', 'Aredondo', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7185609537, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Brooklyn', 'Kings', 11226),
(252, 'Benedict', 'Sama', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3147871588, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Saint Louis', 'Saint Louis City', 63104),
(253, 'Alyce', 'Arias', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2093171801, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Stockton', 'San Joaquin', 95207),
(254, 'Heike', 'Berganza', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9739365095, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Little Falls', 'Passaic', 7424),
(255, 'Carey', 'Dopico', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3175782453, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Indianapolis', 'Marion', 46220),
(256, 'Dottie', 'Hellickson', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2065406076, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Seattle', 'King', 98133),
(257, 'Deandrea', 'Hughey', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3368227652, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Burlington', 'Alamance', 27215),
(258, 'Kimberlie', 'Duenas', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7856298542, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Hays', 'Ellis', 67601),
(259, 'Martina', 'Staback', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4074716908, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Orlando', 'Orange', 32822),
(260, 'Skye', 'Fillingim', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6125082655, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Minneapolis', 'Hennepin', 55401),
(261, 'Jade', 'Farrar', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8033525387, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Columbia', 'Richland', 29201),
(262, 'Charlene', 'Hamilton', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7073001771, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Santa Rosa', 'Sonoma', 95407),
(263, 'Geoffrey', 'Acey', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8472221734, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Palatine', 'Cook', 60067),
(264, 'Stevie', 'Westerbeck', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9498674077, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Costa Mesa', 'Orange', 92626),
(265, 'Pamella', 'Fortino', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3034042210, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Denver', 'Denver', 80212),
(266, 'Harrison', 'Haufler', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2038016193, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'New Haven', 'New Haven', 6515),
(267, 'Johnna', 'Engelberg', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4259867573, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Bothell', 'Snohomish', 98021),
(268, 'Buddy', 'Cloney', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4409895826, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Strongsville', 'Cuyahoga', 44136),
(269, 'Dalene', 'Riden', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6033156839, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Plaistow', 'Rockingham', 3865),
(270, 'Jerry', 'Zurcher', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3215185938, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Satellite Beach', 'Brevard', 32937),
(271, 'Haydee', 'Denooyer', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2127928658, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'New York', 'New York', 10016),
(272, 'Joseph', 'Cryer', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7145842237, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Huntington Beach', 'Orange', 92647),
(273, 'Deonna', 'Kippley', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2489134677, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Southfield', 'Oakland', 48075),
(274, 'Raymon', 'Calvaresi', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3178254724, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Indianapolis', 'Marion', 46222),
(275, 'Alecia', 'Bubash', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9402767922, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Wichita Falls', 'Wichita', 76301);
INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `password`, `mobile_number`, `gender`, `profile_photo`, `is_active`, `mobile_verified`, `added_on`, `city`, `state`, `pincode`) VALUES
(276, 'Ma', 'Layous', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2037213388, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'North Haven', 'New Haven', 6473),
(277, 'Detra', 'Coyier', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4107399277, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Aberdeen', 'Harford', 21001),
(278, 'Terrilyn', 'Rodeigues', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5044634384, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'New Orleans', 'Orleans', 70130),
(279, 'Salome', 'Lacovara', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8045505097, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Richmond', 'Richmond City', 23219),
(280, 'Garry', 'Keetch', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2159798776, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Southampton', 'Bucks', 18966),
(281, 'Matthew', 'Neither', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9526517597, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Shakopee', 'Scott', 55379),
(282, 'Theodora', 'Restrepo', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3059368226, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Miami', 'Miami-Dade', 33136),
(283, 'Noah', 'Kalafatis', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4142635287, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Milwaukee', 'Milwaukee', 53209),
(284, 'Carmen', 'Sweigard', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7329412621, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Somerset', 'Somerset', 8873),
(285, 'Lavonda', 'Hengel', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7018982154, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Fargo', 'Cass', 58102),
(286, 'Junita', 'Stoltzman', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7756389963, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Carson City', 'Carson City', 89701),
(287, 'Herminia', 'Nicolozakes', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6029545141, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Scottsdale', 'Maricopa', 85254),
(288, 'Casie', 'Good', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6153902251, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Nashville', 'Davidson', 37211),
(289, 'Reena', 'Maisto', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4103511863, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Salisbury', 'Wicomico', 21801),
(290, 'Mirta', 'Mallett', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2128701286, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'New York', 'New York', 10004),
(291, 'Cathrine', 'Pontoriero', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8067031435, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Amarillo', 'Randall', 79109),
(292, 'Filiberto', 'Tawil', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3237652528, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Los Angeles', 'Los Angeles', 90016),
(293, 'Raul', 'Upthegrove', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6195095282, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'La Mesa', 'San Diego', 91942),
(294, 'Sarah', 'Candlish', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7707321194, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Atlanta', 'Fulton', 30328),
(295, 'Lucy', 'Treston', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5087695250, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Worcester', 'Worcester', 1602),
(296, 'Judy', 'Aquas', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2697567222, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Niles', 'Berrien', 49120),
(297, 'Yvonne', 'Tjepkema', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9737141721, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Fairfield', 'Essex', 7004),
(298, 'Kayleigh', 'Lace', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3377409323, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Lafayette', 'Lafayette', 70508),
(299, 'Felix', 'Hirpara', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7174915643, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Denver', 'Lancaster', 17517),
(300, 'Tresa', 'Sweely', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3143599566, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Valley Park', 'Saint Louis', 63088),
(301, 'Kristeen', 'Turinetti', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8172138851, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Arlington', 'Tarrant', 76013),
(302, 'Jenelle', 'Regusters', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8139328715, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Tampa', 'Hillsborough', 33619),
(303, 'Renea', 'Monterrubio', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7706794752, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Atlanta', 'Fulton', 30328),
(304, 'Olive', 'Matuszak', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7609386069, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Cathedral City', 'Riverside', 92234),
(305, 'Ligia', 'Reiber', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5179061108, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Lansing', 'Ingham', 48933),
(306, 'Christiane', 'Eschberger', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6023904944, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Phoenix', 'Maricopa', 85034),
(307, 'Goldie', 'Schirpke', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2072957569, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Bangor', 'Penobscot', 4401),
(308, 'Loreta', 'Timenez', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3016966420, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Clinton', 'Prince Georges', 20735),
(309, 'Fabiola', 'Hauenstein', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7178093119, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'York', 'York', 17404),
(310, 'Amie', 'Perigo', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9724197946, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Mesquite', 'Dallas', 75150),
(311, 'Raina', 'Brachle', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4063181515, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Butte', 'Silver Bow', 59701),
(312, 'Erinn', 'Canlas', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9737673008, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Livingston', 'Essex', 7039),
(313, 'Cherry', 'Lietz', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2489806904, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Waterford', 'Oakland', 48329),
(314, 'Kattie', 'Vonasek', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2169233715, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Cleveland', 'Cuyahoga', 44103),
(315, 'Lilli', 'Scriven', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3256311560, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Abilene', 'Taylor', 79601),
(316, 'Whitley', 'Tomasulo', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8175264408, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Fort Worth', 'Tarrant', 76107),
(317, 'Barbra', 'Adkin', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7182013751, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Brooklyn', 'Kings', 11230),
(318, 'Hermila', 'Thyberg', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4018934882, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Providence', 'Providence', 2903),
(319, 'Jesusita', 'Flister', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7178859118, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Lancaster', 'Lancaster', 17601),
(320, 'Caitlin', 'Julia', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4019484982, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Johnston', 'Providence', 2919),
(321, 'Roosevelt', 'Hoffis', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3056224739, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Hialeah', 'Miami-Dade', 33014),
(322, 'Helaine', 'Halter', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2018324168, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Jersey City', 'Hudson', 7304),
(323, 'Lorean', 'Martabano', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2108564979, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'San Antonio', 'Bexar', 78204),
(324, 'France', 'Buzick', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7184788504, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Brooklyn', 'Kings', 11219),
(325, 'Justine', 'Ferrario', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9099933242, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Pomona', 'Los Angeles', 91768),
(326, 'Adelina', 'Nabours', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2162304892, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Cleveland', 'Cuyahoga', 44103),
(327, 'Derick', 'Dhamer', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2123044515, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'New York', 'New York', 10013),
(328, 'Jerry', 'Dallen', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8047629576, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Richmond', 'Richmond City', 23219),
(329, 'Leota', 'Ragel', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7062214243, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Trion', 'Chattooga', 30753),
(330, 'Jutta', 'Amyot', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3375151438, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Broussard', 'Lafayette', 70518),
(331, 'Aja', 'Gehrett', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9735442677, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Nutley', 'Essex', 7110),
(332, 'Kirk', 'Herritt', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6074073716, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Vestal', 'Broome', 13850),
(333, 'Leonora', 'Mauson', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9734122995, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Passaic', 'Passaic', 7055),
(334, 'Winfred', 'Brucato', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2082524552, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Moscow', 'Latah', 83843),
(335, 'Tarra', 'Nachor', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4154111775, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'San Francisco', 'San Francisco', 94104),
(336, 'Corinne', 'Loder', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5089424186, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'North Attleboro', 'Bristol', 2760),
(337, 'Dulce', 'Labreche', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2483578718, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Rochester', 'Oakland', 48307),
(338, 'Kate', 'Keneipp', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9203536377, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Green Bay', 'Brown', 54301),
(339, 'Kaitlyn', 'Ogg', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4106654903, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Baltimore', 'Baltimore City', 21230),
(340, 'Sherita', 'Saras', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7196691664, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Colorado Springs', 'El Paso', 80937),
(341, 'Lashawnda', 'Stuer', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4195888719, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Toledo', 'Lucas', 43607),
(342, 'Ernest', 'Syrop', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3019989644, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Hyattsville', 'Prince Georges', 20785),
(343, 'Nobuko', 'Halsey', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5088559887, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'New Bedford', 'Bristol', 2745),
(344, 'Lavonna', 'Wolny', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7034831970, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Mc Lean', 'Fairfax', 22102),
(345, 'Lashaunda', 'Lizama', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4106782473, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Hanover', 'Anne Arundel', 21076),
(346, 'Mariann', 'Bilden', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5122234791, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Austin', 'Travis', 78753),
(347, 'Helene', 'Rodenberger', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6234618551, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Peoria', 'Maricopa', 85381),
(348, 'Roselle', 'Estell', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4195715920, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Bucyrus', 'Crawford', 44820),
(349, 'Samira', 'Heintzman', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2063114137, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Kent', 'King', 98032),
(350, 'Margart', 'Meisel', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5136172362, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Cincinnati', 'Hamilton', 45251),
(351, 'Kristofer', 'Bennick', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8123681511, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Bloomington', 'Monroe', 47404),
(352, 'Weldon', 'Acuff', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8473532156, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Arlington Heights', 'Cook', 60004),
(353, 'Shalon', 'Shadrick', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7182322337, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Brooklyn', 'Kings', 11223),
(354, 'Denise', 'Patak', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4074464358, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Orlando', 'Orange', 32801),
(355, 'Louvenia', 'Beech', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3108202117, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Beverly Hills', 'Los Angeles', 90210),
(356, 'Audry', 'Yaw', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8137974816, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Brandon', 'Hillsborough', 33511),
(357, 'Kristel', 'Ehmann', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9154521290, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'El Paso', 'El Paso', 79925),
(358, 'Vincenza', 'Zepp', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6196035125, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'El Cajon', 'San Diego', 92020),
(359, 'Elouise', 'Gwalthney', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3018415012, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Bladensburg', 'Prince Georges', 20710),
(360, 'Venita', 'Maillard', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7145236653, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Anaheim', 'Orange', 92801),
(361, 'Kasandra', 'Semidey', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3147329131, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Saint Louis', 'Saint Louis City', 63102),
(362, 'Xochitl', 'Discipio', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5122331831, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Round Rock', 'Williamson', 78664),
(363, 'Maile', 'Linahan', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3366702640, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Greensboro', 'Guilford', 27409),
(364, 'Krissy', 'Rauser', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6314434710, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Coram', 'Suffolk', 11727),
(365, 'Pete', 'Dubaldi', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2018252514, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Lyndhurst', 'Bergen', 7071),
(366, 'Linn', 'Paa', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9014124381, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Memphis', 'Shelby', 38112),
(367, 'Paris', 'Wide', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4045054445, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Atlanta', 'Fulton', 30342),
(368, 'Wynell', 'Dorshorst', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6504731262, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Pacifica', 'San Mateo', 94044),
(369, 'Quentin', 'Birkner', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9527027993, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Burnsville', 'Dakota', 55337),
(370, 'Regenia', 'Kannady', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4807261280, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Scottsdale', 'Maricopa', 85260),
(371, 'Sheron', 'Louissant', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7189768610, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Long Island City', 'Queens', 11101),
(372, 'Izetta', 'Funnell', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7708443447, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Atlanta', 'Dekalb', 30340),
(373, 'Rodolfo', 'Butzen', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5072103510, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Northfield', 'Rice', 55057),
(374, 'Zona', 'Colla', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2034611949, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Norwalk', 'Fairfield', 6854),
(375, 'Serina', 'Zagen', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2602733725, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Fort Wayne', 'Allen', 46802),
(376, 'Paz', 'Sahagun', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6019278287, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Meridian', 'Lauderdale', 39307),
(377, 'Markus', 'Lukasik', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5869707380, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Sterling Heights', 'Macomb', 48310),
(378, 'Jaclyn', 'Bachman', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7198533600, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Colorado Springs', 'El Paso', 80919),
(379, 'Cyril', 'Daufeldt', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2127458484, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'New York', 'New York', 10013),
(380, 'Gayla', 'Schnitzler', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5106863407, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Hayward', 'Alameda', 94545),
(381, 'Erick', 'Nievas', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7737049903, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Chicago', 'Cook', 60624),
(382, 'Jennie', 'Drymon', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5702184831, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Scranton', 'Lackawanna', 18509),
(383, 'Mitsue', 'Scipione', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5309869272, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Oroville', 'Butte', 95965),
(384, 'Ciara', 'Ventura', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8458238877, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Port Jervis', 'Orange', 12771),
(385, 'Galen', 'Cantres', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2166006111, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Brook Park', 'Cuyahoga', 44142),
(386, 'Truman', 'Feichtner', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9738522736, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Bloomfield', 'Essex', 7003),
(387, 'Gail', 'Kitty', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9074359166, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Anchorage', 'Anchorage', 99501),
(388, 'Dalene', 'Schoeneck', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2152681275, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Philadelphia', 'Philadelphia', 19102),
(389, 'Gertude', 'Witten', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5139777043, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Cincinnati', 'Hamilton', 45217),
(390, 'Lizbeth', 'Kohl', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3106991222, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Gardena', 'Los Angeles', 90248),
(391, 'Glenn', 'Berray', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5153707348, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Des Moines', 'Polk', 50315),
(392, 'Lashandra', 'Klang', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6108091818, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'King of Prussia', 'Montgomery', 19406),
(393, 'Lenna', 'Newville', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9196232524, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Raleigh', 'Wake', 27601),
(394, 'Laurel', 'Pagliuca', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5096955199, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Richland', 'Benton', 99352),
(395, 'Mireya', 'Frerking', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9148685965, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Pelham', 'Westchester', 10803),
(396, 'Annelle', 'Tagala', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4107571035, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Parkville', 'Baltimore', 21234),
(397, 'Dean', 'Ketelsen', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5168474418, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Hicksville', 'Nassau', 11801),
(398, 'Levi', 'Munis', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5084564907, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Worcester', 'Worcester', 1603),
(399, 'Sylvie', 'Ryser', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9186449555, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Tulsa', 'Tulsa', 74105),
(400, 'Sharee', 'Maile', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2314679978, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Muskegon', 'Muskegon', 49442),
(401, 'Cordelia', 'Storment', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3375666001, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Lafayette', 'Lafayette', 70506),
(402, 'Mollie', 'Mcdoniel', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4199753182, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Bowling Green', 'Wood', 43402),
(403, 'Brett', 'Mccullan', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6194619984, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'La Mesa', 'San Diego', 91942),
(404, 'Teddy', 'Pedrozo', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2038923863, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Bridgeport', 'Fairfield', 6610),
(405, 'Tasia', 'Andreason', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2019209002, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Kearny', 'Hudson', 7032),
(406, 'Hubert', 'Walthall', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3309031345, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Barberton', 'Summit', 44203),
(407, 'Arthur', 'Farrow', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2012385688, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Englewood', 'Bergen', 7631),
(408, 'Vilma', 'Berlanga', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6167373085, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Grand Rapids', 'Kent', 49546),
(409, 'Billye', 'Miro', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6015675386, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Pearl', 'Rankin', 39208),
(410, 'Glenna', 'Slayton', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9016409178, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Memphis', 'Shelby', 38118),
(411, 'Mitzie', 'Hudnall', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3034021940, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Englewood', 'Arapahoe', 80110),
(412, 'Bernardine', 'Rodefer', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9019014726, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Memphis', 'Shelby', 38112),
(413, 'Staci', 'Schmaltz', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6268662339, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Pasadena', 'Los Angeles', 91106),
(414, 'Nichelle', 'Meteer', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7732259985, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Chicago', 'Cook', 60657),
(415, 'Janine', 'Rhoden', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7182285894, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Astoria', 'Queens', 11103),
(416, 'Ettie', 'Hoopengardner', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5097555393, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Richland', 'Benton', 99352),
(417, 'Eden', 'Jayson', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4108907866, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Baltimore', 'Baltimore City', 21202),
(418, 'Lynelle', 'Auber', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9738608610, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Newark', 'Essex', 7104),
(419, 'Merissa', 'Tomblin', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5625796900, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Bellflower', 'Los Angeles', 90706),
(420, 'Golda', 'Kaniecki', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7326289909, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Toms River', 'Ocean', 8755),
(421, 'Catarina', 'Gleich', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9732103994, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Denville', 'Morris', 7834),
(422, 'Virgie', 'Kiel', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3037767548, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Denver', 'Denver', 80216),
(423, 'Jolene', 'Ostolaza', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7576827116, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Newport News', 'Newport News City', 23608),
(424, 'Keneth', 'Borgman', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6029194211, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Phoenix', 'Maricopa', 85012),
(425, 'Rikki', 'Nayar', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3059689487, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Miami', 'Miami-Dade', 33155),
(426, 'Elke', 'Sengbusch', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6028962993, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Phoenix', 'Maricopa', 85013),
(427, 'Hoa', 'Sarao', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3865267800, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Oak Hill', 'Volusia', 32759),
(428, 'Trinidad', 'Mcrae', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4153319634, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'San Francisco', 'San Francisco', 94105),
(429, 'Mari', 'Lueckenbach', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8587939684, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'San Diego', 'San Diego', 92110),
(430, 'Selma', 'Husser', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2019918369, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Jersey City', 'Hudson', 7306),
(431, 'Antione', 'Onofrio', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9094307765, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'San Bernardino', 'San Bernardino', 92410),
(432, 'Luisa', 'Jurney', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6173652134, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Cambridge', 'Middlesex', 2138),
(433, 'Clorinda', 'Heimann', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7602915497, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Escondido', 'San Diego', 92025),
(434, 'Dick', 'Wenzinger', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3105109713, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Gardena', 'Los Angeles', 90248),
(435, 'Ahmed', 'Angalich', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7175288996, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Harrisburg', 'Dauphin', 17110),
(436, 'Iluminada', 'Ohms', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4802932882, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Mesa', 'Maricopa', 85204),
(437, 'Joanna', 'Leinenbach', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5614704574, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Lake Worth', 'Palm Beach', 33461),
(438, 'Caprice', 'Suell', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6152461824, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Nashville', 'Davidson', 37211),
(439, 'Stephane', 'Myricks', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8597177638, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Burlington', 'Boone', 41005),
(440, 'Quentin', 'Swayze', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7345616170, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Milan', 'Monroe', 48160),
(441, 'Annmarie', 'Castros', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9367517961, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Conroe', 'Montgomery', 77301),
(442, 'Shonda', 'Greenbush', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9734822430, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Clifton', 'Passaic', 7011),
(443, 'Cecil', 'Lapage', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2016933967, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Union City', 'Hudson', 7087),
(444, 'Jeanice', 'Claucherty', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3059884162, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Miami', 'Miami-Dade', 33142),
(445, 'Josphine', 'Villanueva', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9315539774, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Moss', 'Clay', 38575),
(446, 'Daniel', 'Perruzza', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7147713880, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Santa Ana', 'Orange', 92705),
(447, 'Cassi', 'Wildfong', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8476333216, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Rolling Meadows', 'Cook', 60008),
(448, 'Britt', 'Galam', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2158883304, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Hatfield', 'Montgomery', 19440),
(449, 'Adell', 'Lipkin', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9736541561, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Whippany', 'Morris', 7981),
(450, 'Jacqueline', 'Rowling', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8148658113, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Erie', 'Erie', 16501),
(451, 'Lonny', 'Weglarz', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8012939853, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Salt Lake City', 'Salt Lake', 84115),
(452, 'Lonna', 'Diestel', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9109223672, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Fayetteville', 'Cumberland', 28301),
(453, 'Cristal', 'Samara', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2139758026, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Los Angeles', 'Los Angeles', 90021),
(454, 'Kenneth', 'Grenet', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5174992322, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'East Lansing', 'Ingham', 48823),
(455, 'Elli', 'Mclaird', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3158182638, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Utica', 'Oneida', 13501),
(456, 'Alline', 'Jeanty', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5746562800, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'South Bend', 'St Joseph', 46601),
(457, 'Sharika', 'Eanes', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4073121691, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Orlando', 'Orange', 32806),
(458, 'Nu', 'Mcnease', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9737519003, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Harrison', 'Hudson', 7029),
(459, 'Daniela', 'Comnick', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6092008577, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Trenton', 'Mercer', 8611),
(460, 'Cecilia', 'Colaizzo', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 6083824541, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Madison', 'Dane', 53717),
(461, 'Leslie', 'Threets', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9148619748, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Katonah', 'Westchester', 10536),
(462, 'Nan', 'Koppinger', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3363705333, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Greensboro', 'Guilford', 27401),
(463, 'Izetta', 'Dewar', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4104731708, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Baltimore', 'Baltimore City', 21217),
(464, 'Tegan', 'Arceo', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 7327302692, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Monroe Township', 'Middlesex', 8831),
(465, 'Ruthann', 'Keener', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8302582769, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Kerrville', 'Kerr', 78028),
(466, 'Joni', 'Breland', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8475195906, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Elk Grove Village', 'Cook', 60007),
(467, 'Vi', 'Rentfro', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7326054781, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Freehold', 'Monmouth', 7728),
(468, 'Colette', 'Kardas', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4028965943, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Omaha', 'Douglas', 68124),
(469, 'Malcolm', 'Tromblay', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7032215602, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Annandale', 'Fairfax', 22003),
(470, 'Ryan', 'Harnos', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 9725581665, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Plano', 'Collin', 75075),
(471, 'Jess', 'Chaffins', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2125104633, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'New York', 'New York', 10016),
(472, 'Sharen', 'Bourbon', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5168161541, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Syosset', 'Nassau', 11791),
(473, 'Nickolas', 'Juvera', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3525988301, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Crystal River', 'Citrus', 34429),
(474, 'Gary', 'Nunlee', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3175426023, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Fortville', 'Hancock', 46040),
(475, 'Diane', 'Devreese', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 8165579673, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Saint Joseph', 'Buchanan', 64504),
(476, 'Roslyn', 'Chavous', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6012349632, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Jackson', 'Hinds', 39211),
(477, 'Glory', 'Schieler', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3258692649, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Abilene', 'Taylor', 79602),
(478, 'Rasheeda', 'Sayaphon', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4088054309, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Saratoga', 'Santa Clara', 95070),
(479, 'Alpha', 'Palaia', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8563122629, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Cherry Hill', 'Camden', 8003),
(480, 'Refugia', 'Jacobos', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5109748671, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Hayward', 'Alameda', 94545),
(481, 'Shawnda', 'Yori', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4075385106, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Longwood', 'Seminole', 32750),
(482, 'Mona', 'Delasancha', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 3074031488, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Cheyenne', 'Laramie', 82001),
(483, 'Gilma', 'Liukko', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 5163939967, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Garden City', 'Nassau', 11530),
(484, 'Janey', 'Gabisi', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6089677194, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Madison', 'Dane', 53715),
(485, 'Lili', 'Paskin', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2014312989, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Kearny', 'Hudson', 7032),
(486, 'Loren', 'Asar', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5706483035, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Old Forge', 'Lackawanna', 18518),
(487, 'Dorothy', 'Chesterfield', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 8586177834, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'San Diego', 'San Diego', 92126),
(488, 'Gail', 'Similton', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7606165388, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Thousand Palms', 'Riverside', 92276),
(489, 'Catalina', 'Tillotson', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 6093733332, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Margate City', 'Atlantic', 8402),
(490, 'Lawrence', 'Lorens', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4014656432, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Providence', 'Providence', 2906),
(491, 'Carlee', 'Boulter', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 7853471805, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Abilene', 'Dickinson', 67410),
(492, 'Thaddeus', 'Ankeny', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 9169203571, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Roseville', 'Placer', 95678),
(493, 'Jovita', 'Oles', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3862484118, 'male', 0x20, '1', '1', '2025-02-18 20:47:13', 'Daytona Beach', 'Volusia', 32114),
(494, 'Alesia', 'Hixenbaugh', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 2026467516, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Washington', 'District of Columbia', 20001),
(495, 'Lai', 'Harabedian', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 4154233294, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Novato', 'Marin', 94945),
(496, 'Brittni', 'Gillaspie', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2087091235, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Boise', 'Ada', 83709),
(497, 'Raylene', 'Kampa', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 5744991454, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Elkhart', 'Elkhart', 46514),
(498, 'Flo', 'Bookamer', '$2y$10$MzSFe3ibGT9V1o0RqYHoIuOvA5X7fJVfp4CH9.QgIq56Wg/S/Gh92', 3087262182, 'female', 0x20, '1', '1', '2025-02-18 20:47:13', 'Alliance', 'Box Butte', 69301),
(499, 'Jani', 'Biddy', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 2067116498, 'female', 0x20, '1', '0', '2025-02-18 20:47:13', 'Seattle', 'King', 98104),
(500, 'Chauncey', 'Motley', '$2y$10$oQShp7NuNHSZ9FV2f.QZXe9TqVAY2HBFAxaCNlSUoXCNZKy7wtyMe', 4074134842, 'male', 0x20, '1', '0', '2025-02-18 20:47:13', 'Orlando', 'Orange', 32804),
(999, 'ganesh', 'patil', '$2y$10$/wv1WcUJ8ZAQYQCsvLITWusEPcc26znehTbMy5HsBEnZGYaqLyrfG', 9860058383, 'male', NULL, '1', '1', '2025-02-19 14:39:39', NULL, NULL, NULL),
(1000, '', '', '$2y$10$.y9tHy9f.HWBwNm11z3Q3.Nn1ME9CRak8G8M/u/5.fHa2XkURPDla', 8669082115, 'male', NULL, '1', '1', '2025-02-19 15:04:05', NULL, NULL, NULL),
(1001, '', '', '$2y$10$e.034co2WOkivmDn6Jy97e72yGXNhTkKu59fzfQkxpgQttAdhx2h.', 9604712039, 'male', NULL, '1', '1', '2025-02-19 15:57:15', NULL, NULL, NULL),
(1002, '', '', '$2y$10$NvR5OATnkyiwH72FvTqfRuLxTiJo2zUvlkFbQ5eSomCmcv8nYehWS', 9785642352, 'male', NULL, '1', '1', '2025-02-19 17:22:20', NULL, NULL, NULL),
(1003, '', '', '$2y$10$sVuPKDagmXU4kgniXY6iYeeGOwbESi.ePw7Xueu3IWwpuZnhR0w.2', 7208872088, 'male', NULL, '1', '1', '2025-02-19 17:29:08', NULL, NULL, NULL),
(1004, '', '', '$2y$10$1rKftJ/Zq1n0cWrLLiUimOTkPmG2CSeQRb7l1ue.UqYZInSGvN6Y2', 9325693256, 'male', NULL, '1', '1', '2025-02-19 19:15:29', NULL, NULL, NULL),
(1005, '', '', '$2y$10$0yXCXrsnp2o8LEBtkU4i8OM1nfjTYr4JbRBXBQp4fuh7zOYswmtgW', 9612365896, 'male', NULL, '1', '1', '2025-02-19 19:33:27', NULL, NULL, NULL),
(1006, '', '', '', 9956235689, 'male', NULL, '1', '1', '2025-02-20 13:50:35', NULL, NULL, NULL),
(1007, '', '', '$2y$10$SRTupIK3Lbl9XlINlLiF7uEeIcn2DoJm5s0BkeTtZZYPLG.dxFtuS', 8446256233, 'male', NULL, '1', '1', '2025-02-20 18:10:38', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_vs_address`
--

CREATE TABLE `user_vs_address` (
  `id_user_vs_address` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address_line_1` varchar(1000) DEFAULT NULL,
  `address_line_2` text,
  `taluka` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  `added_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT NULL,
  `address_type` enum('home','work','other') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_vs_address`
--

INSERT INTO `user_vs_address` (`id_user_vs_address`, `user_id`, `address_line_1`, `address_line_2`, `taluka`, `city`, `state`, `pincode`, `is_active`, `added_on`, `updated_on`, `address_type`) VALUES
(1, 492, '47 MySakila Drive', '', 'Alberta', 'Lethbridge', 'Canada', 123456, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(2, 222, '28 MySQL Boulevard', '', 'QLD', 'Woodridge', 'Australia', 655448, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(3, 490, '23 Workhaven Lane', '', 'Alberta', 'Lethbridge', 'Canada', 562328, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(4, 215, '1411 Lillydale Drive', '', 'QLD', 'Woodridge', 'Australia', 569961, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(5, 310, '1913 Hanoi Way', '', 'Nagasaki', 'Sasebo', 'Japan', 35200, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(6, 144, '1121 Loja Avenue', '', 'California', 'San Bernardino', 'United States', 17886, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(7, 472, '692 Joliet Street', '', 'Attika', 'Athenai', 'Greece', 83579, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(8, 120, '1566 Inegl Manor', '', 'Mandalay', 'Myingyan', 'Myanmar', 53561, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(9, 179, '53 Idfu Parkway', '', 'Nantou', 'Nantou', 'Taiwan', 42399, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(10, 128, '1795 Santiago de Compostela Way', '', 'Texas', 'Laredo', 'United States', 18743, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(11, 209, '900 Santiago de Compostela Parkway', '', 'Central Serbia', 'Kragujevac', 'Yugoslavia', 93896, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(12, 94, '478 Joliet Way', '', 'Hamilton', 'Hamilton', 'New Zealand', 77948, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(13, 345, '613 Korolev Drive', '', 'Masqat', 'Masqat', 'Oman', 45844, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(14, 70, '1531 Sal Drive', '', 'Esfahan', 'Esfahan', 'Iran', 53628, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(15, 74, '1542 Tarlac Parkway', '', 'Kanagawa', 'Sagamihara', 'Japan', 1027, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(16, 200, '808 Bhopal Manor', '', 'Haryana', 'Yamuna Nagar', 'India', 10672, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(17, 474, '270 Amroha Parkway', '', 'Osmaniye', 'Osmaniye', 'Turkey', 29610, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(18, 389, '770 Bydgoszcz Avenue', '', 'California', 'Citrus Heights', 'United States', 16266, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(19, 400, '419 Iligan Lane', '', 'Madhya Pradesh', 'Bhopal', 'India', 72878, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(20, 379, '360 Toulouse Parkway', '', 'England', 'Southend-on-Sea', 'United Kingdom', 54308, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(21, 253, '270 Toulon Boulevard', '', 'Kalmykia', 'Elista', 'Russian Federation', 81766, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(22, 155, '320 Brest Avenue', '', 'Kaduna', 'Kaduna', 'Nigeria', 43331, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(23, 370, '1417 Lancaster Avenue', '', 'Northern Cape', 'Kimberley', 'South Africa', 72192, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(24, 220, '1688 Okara Way', '', 'Nothwest Border Prov', 'Mardan', 'Pakistan', 21954, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(25, 450, '262 A Corua (La Corua) Parkway', '', 'Dhaka', 'Tangail', 'Bangladesh', 34418, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(26, 107, '28 Charlotte Amalie Street', '', 'Rabat-Sal-Zammour-Z', 'Sal', 'Morocco', 37551, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(27, 161, '1780 Hino Boulevard', '', 'Liepaja', 'Liepaja', 'Latvia', 7716, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(28, 355, '96 Tafuna Way', '', 'Crdoba', 'Crdoba', 'Argentina', 99865, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(29, 318, '934 San Felipe de Puerto Plata Street', '', 'Sind', 'Shikarpur', 'Pakistan', 99780, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(30, 419, '18 Duisburg Boulevard', '', '', 'Citt del Vaticano', 'Holy See (Vatican City State)', 58327, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(31, 37, '217 Botshabelo Place', '', 'Southern Mindanao', 'Davao', 'Philippines', 49521, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(32, 401, '1425 Shikarpur Manor', '', 'Bihar', 'Munger (Monghyr)', 'India', 65599, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(33, 331, '786 Aurora Avenue', '', 'Yamaguchi', 'Shimonoseki', 'Japan', 65750, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(34, 294, '1668 Anpolis Street', '', 'Taipei', 'Lungtan', 'Taiwan', 50199, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(35, 90, '33 Gorontalo Way', '', 'West Bengali', 'Kamarhati', 'India', 30348, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(36, 170, '176 Mandaluyong Place', '', 'Uttar Pradesh', 'Jhansi', 'India', 65213, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(37, 269, '127 Purnea (Purnia) Manor', '', 'Piemonte', 'Alessandria', 'Italy', 79388, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(38, 305, '61 Tama Street', '', 'Okayama', 'Kurashiki', 'Japan', 94065, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(39, 291, '391 Callao Drive', '', 'Midi-Pyrnes', 'Toulouse', 'France', 34021, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(40, 43, '334 Munger (Monghyr) Lane', '', 'Markazi', 'Arak', 'Iran', 38145, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(41, 365, '1440 Fukuyama Loop', '', 'Henan', 'Nanyang', 'China', 47929, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(42, 316, '269 Cam Ranh Parkway', '', 'Chisinau', 'Chisinau', 'Moldova', 34689, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(43, 192, '306 Antofagasta Place', '', 'Esprito Santo', 'Vila Velha', 'Brazil', 3989, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(44, 346, '671 Graz Street', '', 'Oriental', 'Nador', 'Morocco', 94399, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(45, 13, '42 Brindisi Place', '', 'Yerevan', 'Yerevan', 'Armenia', 16744, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(46, 61, '1632 Bislig Avenue', '', 'Nonthaburi', 'Pak Kret', 'Thailand', 61117, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(47, 491, '1447 Imus Way', '', 'Tahiti', 'Faaa', 'French Polynesia', 48942, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(48, 481, '1998 Halifax Drive', '', 'Lipetsk', 'Lipetsk', 'Russian Federation', 76022, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(49, 18, '1718 Valencia Street', '', 'Antofagasta', 'Antofagasta', 'Chile', 37359, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(50, 340, '46 Pjatigorsk Lane', '', 'Moscow (City)', 'Moscow', 'Russian Federation', 23616, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(51, 169, '686 Garland Manor', '', 'Cear', 'Juazeiro do Norte', 'Brazil', 52535, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(52, 224, '909 Garland Manor', '', 'Tatarstan', 'Niznekamsk', 'Russian Federation', 69367, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(53, 159, '725 Isesaki Place', '', 'Mekka', 'Jedda', 'Saudi Arabia', 74428, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(54, 6, '115 Hidalgo Parkway', '', 'Khartum', 'Omdurman', 'Sudan', 80168, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(55, 251, '1135 Izumisano Parkway', '', 'California', 'Fontana', 'United States', 48150, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(56, 500, '939 Probolinggo Loop', '', 'Galicia', 'A Corua (La Corua)', 'Spain', 4166, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(57, 217, '17 Kabul Boulevard', '', 'Chiba', 'Nagareyama', 'Japan', 38594, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(58, 485, '1964 Allappuzha (Alleppey) Street', '', 'Yamaguchi', 'Iwakuni', 'Japan', 48980, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(59, 183, '1697 Kowloon and New Kowloon Loop', '', 'Moskova', 'Balaiha', 'Russian Federation', 57807, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(60, 118, '1668 Saint Louis Place', '', 'Tahiti', 'Papeete', 'French Polynesia', 39072, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(61, 491, '943 Tokat Street', '', 'Vaduz', 'Vaduz', 'Liechtenstein', 45428, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(62, 373, '1114 Liepaja Street', '', 'Sarawak', 'Kuching', 'Malaysia', 69226, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(63, 448, '1213 Ranchi Parkway', '', 'Karnataka', 'Mysore', 'India', 94352, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(64, 365, '81 Hodeida Way', '', 'Rajasthan', 'Jaipur', 'India', 55561, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(65, 8, '915 Ponce Place', '', 'Basel-Stadt', 'Basel', 'Switzerland', 83980, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(66, 58, '1717 Guadalajara Lane', '', 'Missouri', 'Saint Louis', 'United States', 85505, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(67, 202, '1214 Hanoi Way', '', 'Nebraska', 'Lincoln', 'United States', 67055, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(68, 246, '1966 Amroha Avenue', '', 'Sichuan', 'Daxian', 'China', 70385, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(69, 270, '698 Otsu Street', '', 'Cayenne', 'Cayenne', 'French Guiana', 71110, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(70, 320, '1150 Kimchon Manor', '', 'Skne ln', 'Malm', 'Sweden', 96109, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(71, 472, '1586 Guaruj Place', '', 'Hunan', 'Xiangtan', 'China', 5135, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(72, 334, '57 Arlington Manor', '', 'Madhya Pradesh', 'Shivapuri', 'India', 48960, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(73, 425, '1031 Daugavpils Parkway', '', 'Bchar', 'Bchar', 'Algeria', 59025, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(74, 359, '1124 Buenaventura Drive', '', 'Mekka', 'al-Hawiya', 'Saudi Arabia', 6856, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(75, 286, '492 Cam Ranh Street', '', 'Eastern Visayas', 'Baybay', 'Philippines', 50805, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(76, 405, '89 Allappuzha (Alleppey) Manor', '', 'National Capital Reg', 'Taguig', 'Philippines', 75444, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(77, 134, '1947 Poos de Caldas Boulevard', '', 'Chiayi', 'Chiayi', 'Taiwan', 60951, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(78, 65, '1206 Dos Quebradas Place', '', 'So Paulo', 'Rio Claro', 'Brazil', 20207, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(79, 226, '1551 Rampur Lane', '', 'Changhwa', 'Changhwa', 'Taiwan', 72394, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(80, 438, '602 Paarl Street', '', 'Pavlodar', 'Pavlodar', 'Kazakstan', 98889, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(81, 4, '1692 Ede Loop', '', 'So Paulo', 'Araatuba', 'Brazil', 9223, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(82, 364, '936 Salzburg Lane', '', 'Uttar Pradesh', 'Rae Bareli', 'India', 96709, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(83, 186, '586 Tete Way', '', 'Kanagawa', 'Kamakura', 'Japan', 1079, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(84, 328, '1888 Kabul Drive', '', 'Oyo & Osun', 'Ife', 'Nigeria', 20936, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(85, 401, '320 Baiyin Parkway', '', 'Mahajanga', 'Mahajanga', 'Madagascar', 37307, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(86, 81, '927 Baha Blanca Parkway', '', 'Krim', 'Simferopol', 'Ukraine', 9495, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(87, 133, '929 Tallahassee Loop', '', 'Gauteng', 'Springs', 'South Africa', 74671, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(88, 157, '125 Citt del Vaticano Boulevard', '', 'Puebla', 'Atlixco', 'Mexico', 67912, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(89, 490, '1557 Ktahya Boulevard', '', 'England', 'Bradford', 'United Kingdom', 88002, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(90, 269, '870 Ashqelon Loop', '', 'Songkhla', 'Songkhla', 'Thailand', 84931, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(91, 397, '1740 Portoviejo Avenue', '', 'Sucre', 'Sincelejo', 'Colombia', 29932, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(92, 234, '1942 Ciparay Parkway', '', 'Cheju', 'Cheju', 'South Korea', 82624, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(93, 293, '1926 El Alto Avenue', '', 'Buenos Aires', 'La Plata', 'Argentina', 75543, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(94, 295, '1952 Chatsworth Drive', '', 'Guangdong', 'Meixian', 'China', 25958, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(95, 235, '1370 Le Mans Avenue', '', 'Brunei and Muara', 'Bandar Seri Begawan', 'Brunei', 52163, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(96, 173, '984 Effon-Alaiye Avenue', '', 'Gois', 'Goinia', 'Brazil', 17119, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(97, 120, '832 Nakhon Sawan Manor', '', 'Inner Mongolia', 'Zalantun', 'China', 49021, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(98, 312, '152 Kitwe Parkway', '', 'Caraga', 'Bislig', 'Philippines', 53182, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(99, 135, '1697 Tanauan Lane', '', 'Punjab', 'Pathankot', 'India', 22870, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(100, 328, '1308 Arecibo Way', '', 'Georgia', 'Augusta-Richmond County', 'United States', 30695, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(101, 288, '1599 Plock Drive', '', 'Tete', 'Tete', 'Mozambique', 71986, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(102, 101, '669 Firozabad Loop', '', 'Abu Dhabi', 'al-Ayn', 'United Arab Emirates', 92265, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(103, 196, '588 Vila Velha Manor', '', 'Kyongsangbuk', 'Kimchon', 'South Korea', 51540, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(104, 474, '1913 Kamakura Place', '', 'Lipetsk', 'Jelets', 'Russian Federation', 97287, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(105, 129, '733 Mandaluyong Place', '', 'Asir', 'Abha', 'Saudi Arabia', 77459, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(106, 316, '659 Vaduz Drive', '', 'Ha Darom', 'Ashdod', 'Israel', 49708, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(107, 3, '1177 Jelets Way', '', 'Kwara & Kogi', 'Ilorin', 'Nigeria', 3305, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(108, 162, '1386 Yangor Avenue', '', 'Provence-Alpes-Cte', 'Toulon', 'France', 80720, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(109, 212, '454 Nakhon Sawan Boulevard', '', 'Funafuti', 'Funafuti', 'Tuvalu', 76383, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(110, 259, '1867 San Juan Bautista Tuxtepec Avenue', '', 'Ivanovo', 'Ivanovo', 'Russian Federation', 78311, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(111, 127, '1532 Dzerzinsk Way', '', 'Buenos Aires', 'Merlo', 'Argentina', 9599, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(112, 387, '1002 Ahmadnagar Manor', '', 'Mxico', 'Huixquilucan', 'Mexico', 93026, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(113, 169, '682 Junan Way', '', 'North West', 'Klerksdorp', 'South Africa', 30418, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(114, 410, '804 Elista Drive', '', 'Hubei', 'Enshi', 'China', 61069, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(115, 339, '1378 Alvorada Avenue', '', 'Distrito Federal', 'Caracas', 'Venezuela', 75834, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(116, 290, '793 Cam Ranh Avenue', '', 'California', 'Lancaster', 'United States', 87057, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(117, 303, '1079 Tel Aviv-Jaffa Boulevard', '', 'Sucre', 'Cuman', 'Venezuela', 10885, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(118, 415, '442 Rae Bareli Place', '', 'Nordrhein-Westfalen', 'Duisburg', 'Germany', 24321, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(119, 71, '1107 Nakhon Sawan Avenue', '', 'Mxico', 'Nezahualcyotl', 'Mexico', 75149, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(120, 188, '544 Malm Parkway', '', 'Central Java', 'Pemalang', 'Indonesia', 63502, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(121, 448, '1967 Sincelejo Place', '', 'Gujarat', 'Gandhinagar', 'India', 73644, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(122, 17, '333 Goinia Way', '', 'Texas', 'Grand Prairie', 'United States', 78625, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(123, 190, '1987 Coacalco de Berriozbal Loop', '', 'al-Qalyubiya', 'Shubra al-Khayma', 'Egypt', 96065, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(124, 362, '241 Mosul Lane', '', 'Risaralda', 'Dos Quebradas', 'Colombia', 76157, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(125, 321, '211 Chiayi Drive', '', 'Uttar Pradesh', 'Etawah', 'India', 58186, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(126, 248, '1175 Tanauan Way', '', 'Lima', 'Lima', 'Peru', 64615, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(127, 20, '117 Boa Vista Way', '', 'Uttar Pradesh', 'Varanasi (Benares)', 'India', 6804, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(128, 154, '848 Tafuna Manor', '', 'Ktahya', 'Ktahya', 'Turkey', 45142, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(129, 62, '569 Baicheng Lane', '', 'Gauteng', 'Boksburg', 'South Africa', 60304, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(130, 231, '1666 Qomsheh Drive', '', 'So Paulo', 'Po', 'Brazil', 66255, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(131, 464, '801 Hagonoy Drive', '', 'Smolensk', 'Smolensk', 'Russian Federation', 8439, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(132, 340, '1050 Garden Grove Avenue', '', 'Slaskie', 'Jastrzebie-Zdrj', 'Poland', 4999, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(133, 116, '1854 Tieli Street', '', 'Shandong', 'Liaocheng', 'China', 15819, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(134, 348, '758 Junan Lane', '', 'Gois', 'guas Lindas de Gois', 'Brazil', 82639, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(135, 316, '1752 So Leopoldo Parkway', '', 'Taka-Karpatia', 'Mukateve', 'Ukraine', 14014, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(136, 232, '898 Belm Manor', '', 'Free State', 'Botshabelo', 'South Africa', 49757, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(137, 391, '261 Saint Louis Way', '', 'Coahuila de Zaragoza', 'Torren', 'Mexico', 83401, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(138, 465, '765 Southampton Drive', '', 'al-Qalyubiya', 'Qalyub', 'Egypt', 4285, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(139, 435, '943 Johannesburg Avenue', '', 'Maharashtra', 'Pune', 'India', 5892, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(140, 267, '788 Atinsk Street', '', 'Karnataka', 'Hubli-Dharwad', 'India', 81691, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(141, 390, '1749 Daxian Place', '', 'Gelderland', 'Apeldoorn', 'Netherlands', 11044, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(142, 246, '1587 Sullana Lane', '', 'Inner Mongolia', 'Hohhot', 'China', 85769, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(143, 243, '1029 Dzerzinsk Manor', '', 'Ynlin', 'Touliu', 'Taiwan', 57519, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(144, 212, '1666 Beni-Mellal Place', '', 'Tennessee', 'Clarksville', 'United States', 13377, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(145, 347, '928 Jaffna Loop', '', 'Hiroshima', 'Fukuyama', 'Japan', 93762, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(146, 268, '483 Ljubertsy Parkway', '', 'Scotland', 'Dundee', 'United Kingdom', 60562, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(147, 74, '374 Bat Yam Boulevard', '', 'Kilis', 'Kilis', 'Turkey', 97700, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(148, 253, '1027 Songkhla Manor', '', 'Minsk', 'Molodetno', 'Belarus', 30861, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(149, 107, '999 Sanaa Loop', '', 'Gauteng', 'Soshanguve', 'South Africa', 3439, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(150, 257, '879 Newcastle Way', '', 'Michigan', 'Sterling Heights', 'United States', 90732, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(151, 111, '1337 Lincoln Parkway', '', 'Saitama', 'Urawa', 'Japan', 99457, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(152, 163, '1952 Pune Lane', '', 'Saint-Denis', 'Saint-Denis', 'Runion', 92150, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(153, 155, '782 Mosul Street', '', 'Massachusetts', 'Brockton', 'United States', 25545, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(154, 336, '781 Shimonoseki Drive', '', 'Michoacn de Ocampo', 'Hidalgo', 'Mexico', 95444, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(155, 464, '1560 Jelets Boulevard', '', 'Shandong', 'Laiwu', 'China', 77777, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(156, 415, '1963 Moscow Place', '', 'Assam', 'Nagaon', 'India', 64863, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(157, 193, '456 Escobar Way', '', 'Jakarta Raya', 'Jakarta', 'Indonesia', 36061, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(158, 109, '798 Cianjur Avenue', '', 'Shanxi', 'Yuncheng', 'China', 76990, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(159, 426, '185 Novi Sad Place', '', 'Bern', 'Bern', 'Switzerland', 41778, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(160, 132, '1367 Yantai Manor', '', 'Ondo & Ekiti', 'Ondo', 'Nigeria', 21294, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(161, 205, '1386 Nakhon Sawan Boulevard', '', 'Pyongyang-si', 'Pyongyang', 'North Korea', 53502, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(162, 104, '369 Papeete Way', '', 'North Carolina', 'Greensboro', 'United States', 66639, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(163, 108, '1440 Compton Place', '', 'North Austria', 'Linz', 'Austria', 81037, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(164, 191, '1623 Baha Blanca Manor', '', 'Moskova', 'Ljubertsy', 'Russian Federation', 81511, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(165, 42, '97 Shimoga Avenue', '', 'Tel Aviv', 'Tel Aviv-Jaffa', 'Israel', 44660, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(166, 433, '1740 Le Mans Loop', '', 'Pays de la Loire', 'Le Mans', 'France', 22853, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(167, 217, '1287 Xiangfan Boulevard', '', 'Gifu', 'Kakamigahara', 'Japan', 57844, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(168, 240, '842 Salzburg Lane', '', 'Adana', 'Tarsus', 'Turkey', 3313, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(169, 145, '154 Tallahassee Loop', '', 'Xinxiang', 'Hami', 'China', 62250, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(170, 275, '710 San Felipe del Progreso Avenue', '', 'Lilongwe', 'Lilongwe', 'Malawi', 76901, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(171, 493, '1540 Wroclaw Drive', '', 'Maharashtra', 'Chandrapur', 'India', 62686, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(172, 369, '475 Atinsk Way', '', 'Gansu', 'Jinchang', 'China', 59571, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(173, 105, '1294 Firozabad Drive', '', 'Jiangxi', 'Pingxiang', 'China', 70618, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(174, 245, '1877 Ezhou Lane', '', 'Rajasthan', 'Udaipur', 'India', 63337, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(175, 31, '316 Uruapan Street', '', 'Perak', 'Ipoh', 'Malaysia', 58194, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(176, 104, '29 Pyongyang Loop', '', 'Batman', 'Batman', 'Turkey', 47753, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(177, 23, '1010 Klerksdorp Way', '', 'Steiermark', 'Graz', 'Austria', 6802, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(178, 265, '1848 Salala Boulevard', '', 'Miranda', 'Ocumare del Tuy', 'Venezuela', 25220, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(179, 373, '431 Xiangtan Avenue', '', 'Kerala', 'Allappuzha (Alleppey)', 'India', 4854, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(180, 96, '757 Rustenburg Avenue', '', 'Skikda', 'Skikda', 'Algeria', 89668, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(181, 490, '146 Johannesburg Way', '', 'Tamaulipas', 'Matamoros', 'Mexico', 54132, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(182, 237, '1891 Rizhao Boulevard', '', 'So Paulo', 'Santa Brbara dOeste', 'Brazil', 47288, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(183, 451, '1089 Iwatsuki Avenue', '', 'Kirov', 'Kirovo-Tepetsk', 'Russian Federation', 35109, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(184, 201, '1410 Benin City Parkway', '', 'Risaralda', 'Pereira', 'Colombia', 29747, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(185, 274, '682 Garden Grove Place', '', 'Tennessee', 'Memphis', 'United States', 67497, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(186, 99, '533 al-Ayn Boulevard', '', 'California', 'Compton', 'United States', 8862, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(187, 255, '1839 Szkesfehrvr Parkway', '', 'Gois', 'Luzinia', 'Brazil', 55709, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(188, 106, '741 Ambattur Manor', '', 'Noord-Brabant', 's-Hertogenbosch', 'Netherlands', 43310, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(189, 104, '927 Barcelona Street', '', 'Chaharmahal va Bakht', 'Shahr-e Kord', 'Iran', 65121, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(190, 174, '435 0 Way', '', 'West Bengali', 'Haldia', 'India', 74750, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(191, 86, '140 Chiayi Parkway', '', 'Sumy', 'Sumy', 'Ukraine', 38982, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(192, 60, '1166 Changhwa Street', '', 'Caraga', 'Bayugan', 'Philippines', 58852, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(193, 346, '891 Novi Sad Manor', '', 'Ontario', 'Oshawa', 'Canada', 5379, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(194, 399, '605 Rio Claro Parkway', '', 'Tabora', 'Tabora', 'Tanzania', 49348, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(195, 127, '1077 San Felipe de Puerto Plata Place', '', 'Rostov-na-Donu', 'Novoterkassk', 'Russian Federation', 65387, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(196, 277, '9 San Miguel de Tucumn Manor', '', 'Uttar Pradesh', 'Firozabad', 'India', 90845, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(197, 467, '447 Surakarta Loop', '', 'Nyanza', 'Kisumu', 'Kenya', 10428, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(198, 465, '345 Oshawa Boulevard', '', 'Tokyo-to', 'Hino', 'Japan', 32114, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(199, 337, '1792 Valle de la Pascua Place', '', 'Nordrhein-Westfalen', 'Siegen', 'Germany', 15540, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(200, 178, '1074 Binzhou Manor', '', 'Baden-Wrttemberg', 'Mannheim', 'Germany', 36490, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(201, 170, '817 Bradford Loop', '', 'Jiangsu', 'Changzhou', 'China', 89459, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(202, 462, '955 Bamenda Way', '', 'Ondo & Ekiti', 'Ikerre', 'Nigeria', 1545, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(203, 66, '1149 A Corua (La Corua) Boulevard', '', 'Haiphong', 'Haiphong', 'Vietnam', 95824, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(204, 221, '387 Mwene-Ditu Drive', '', 'Ahal', 'Ashgabat', 'Turkmenistan', 8073, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(205, 272, '68 Molodetno Manor', '', 'Nordrhein-Westfalen', 'Witten', 'Germany', 4662, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(206, 269, '642 Nador Drive', '', 'Maharashtra', 'Bhusawal', 'India', 3924, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(207, 394, '1688 Nador Lane', '', 'Sulawesi Utara', 'Gorontalo', 'Indonesia', 61613, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(208, 147, '1215 Pyongyang Parkway', '', 'Usak', 'Usak', 'Turkey', 25238, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(209, 495, '1679 Antofagasta Street', '', 'Alto Paran', 'Ciudad del Este', 'Paraguay', 86599, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(210, 241, '1304 s-Hertogenbosch Way', '', 'Santa Catarina', 'Blumenau', 'Brazil', 10925, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(211, 157, '850 Salala Loop', '', 'Kitaa', 'Nuuk', 'Greenland', 10800, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(212, 124, '624 Oshawa Boulevard', '', 'West Bengali', 'Balurghat', 'India', 89959, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(213, 395, '43 Dadu Avenue', '', 'Rajasthan', 'Bhilwara', 'India', 4855, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(214, 117, '751 Lima Loop', '', 'Aden', 'Aden', 'Yemen', 99405, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(215, 466, '1333 Haldia Street', '', 'Jilin', 'Fuyu', 'China', 82161, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(216, 57, '660 Jedda Boulevard', '', 'Washington', 'Bellevue', 'United States', 25053, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(217, 322, '1001 Miyakonojo Lane', '', 'Taizz', 'Taizz', 'Yemen', 67924, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(218, 302, '226 Brest Manor', '', 'California', 'Sunnyvale', 'United States', 2299, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(219, 490, '1229 Valencia Parkway', '', 'Haskovo', 'Stara Zagora', 'Bulgaria', 99124, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(220, 147, '1201 Qomsheh Manor', '', 'Gois', 'Aparecida de Goinia', 'Brazil', 21464, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(221, 200, '866 Shivapuri Manor', '', 'Uttar Pradesh', 'Sambhal', 'India', 22474, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(222, 384, '1168 Najafabad Parkway', '', 'Kabol', 'Kabul', 'Afghanistan', 40301, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(223, 217, '1244 Allappuzha (Alleppey) Place', '', 'Buenos Aires', 'Vicente Lpez', 'Argentina', 20657, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(224, 135, '1842 Luzinia Boulevard', '', 'Zanzibar West', 'Zanzibar', 'Tanzania', 94420, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(225, 274, '1926 Gingoog Street', '', 'Sisilia', 'Syrakusa', 'Italy', 22824, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(226, 413, '810 Palghat (Palakkad) Boulevard', '', 'Jaroslavl', 'Jaroslavl', 'Russian Federation', 73431, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(227, 276, '1820 Maring Parkway', '', 'Punjab', 'Mandi Bahauddin', 'Pakistan', 88307, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(228, 101, '60 Poos de Caldas Street', '', 'Rajasthan', 'Jodhpur', 'India', 82338, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(229, 338, '1014 Loja Manor', '', 'Tamil Nadu', 'Ambattur', 'India', 66851, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(230, 167, '201 Effon-Alaiye Way', '', 'Asuncin', 'Asuncin', 'Paraguay', 64344, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(231, 100, '430 Alessandria Loop', '', 'Saarland', 'Saarbrcken', 'Germany', 47446, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(232, 205, '754 Valencia Place', '', 'Phnom Penh', 'Phnom Penh', 'Cambodia', 87911, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(233, 296, '356 Olomouc Manor', '', 'Gois', 'Anpolis', 'Brazil', 93323, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(234, 378, '1256 Bislig Boulevard', '', 'Botosani', 'Botosani', 'Romania', 50598, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(235, 486, '954 Kimchon Place', '', 'West Bengali', 'Uttarpara-Kotrung', 'India', 42420, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(236, 354, '885 Yingkou Manor', '', 'Kaduna', 'Zaria', 'Nigeria', 31390, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(237, 357, '1736 Cavite Place', '', 'Qina', 'Idfu', 'Egypt', 98775, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(238, 378, '346 Skikda Parkway', '', 'Hawalli', 'Jalib al-Shuyukh', 'Kuwait', 90628, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(239, 325, '98 Stara Zagora Boulevard', '', 'Valle', 'Buenaventura', 'Colombia', 76448, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(240, 235, '1479 Rustenburg Boulevard', '', 'Southern Tagalog', 'Tanza', 'Philippines', 18727, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(241, 334, '647 A Corua (La Corua) Street', '', 'Chollanam', 'Naju', 'South Korea', 36971, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(242, 283, '1964 Gijn Manor', '', 'Karnataka', 'Shimoga', 'India', 14408, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(243, 243, '47 Syktyvkar Lane', '', 'West Java', 'Ciomas', 'Indonesia', 22236, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(244, 285, '1148 Saarbrcken Parkway', '', 'Fukushima', 'Iwaki', 'Japan', 1921, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(245, 486, '1103 Bilbays Parkway', '', 'Hubei', 'Xiangfan', 'China', 87660, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(246, 23, '1246 Boksburg Parkway', '', 'Hebei', 'Qinhuangdao', 'China', 28349, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(247, 355, '1483 Pathankot Street', '', 'Tucumn', 'San Miguel de Tucumn', 'Argentina', 37288, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(248, 56, '582 Papeete Loop', '', 'Central Visayas', 'Lapu-Lapu', 'Philippines', 27722, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(249, 203, '300 Junan Street', '', 'Kyonggi', 'Uijongbu', 'South Korea', 81314, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(250, 21, '829 Grand Prairie Way', '', 'Paran', 'Maring', 'Brazil', 6461, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(251, 217, '1473 Changhwa Parkway', '', 'Mxico', 'Coacalco de Berriozbal', 'Mexico', 75933, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(252, 400, '1309 Weifang Street', '', 'Florida', 'Tallahassee', 'United States', 57338, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(253, 471, '1760 Oshawa Manor', '', 'Tianjin', 'Tianjin', 'China', 38140, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(254, 121, '786 Stara Zagora Way', '', 'Oyo & Osun', 'Oyo', 'Nigeria', 98332, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(255, 174, '1966 Tonghae Street', '', 'Anhalt Sachsen', 'Halle/Saale', 'Germany', 36481, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(256, 478, '1497 Yuzhou Drive', '', 'England', 'London', 'United Kingdom', 3433, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(257, 21, '752 Ondo Loop', '', 'Miyazaki', 'Miyakonojo', 'Japan', 32474, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(258, 116, '1338 Zalantun Lane', '', 'Minas Gerais', 'Poos de Caldas', 'Brazil', 45403, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(259, 134, '127 Iwakuni Boulevard', '', 'Central Luzon', 'Hagonoy', 'Philippines', 20777, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(260, 422, '51 Laredo Avenue', '', 'Sagaing', 'Monywa', 'Myanmar', 68146, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(261, 273, '771 Yaound Manor', '', 'Sofala', 'Beira', 'Mozambique', 86768, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(262, 122, '532 Toulon Street', '', 'Santiago', 'Santiago de los Caballeros', 'Dominican Republic', 69517, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(263, 145, '1027 Banjul Place', '', 'West Bengali', 'Halisahar', 'India', 50390, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(264, 98, '1158 Mandi Bahauddin Parkway', '', 'Shanxi', 'Datong', 'China', 98484, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(265, 421, '862 Xintai Lane', '', 'Cagayan Valley', 'Tuguegarao', 'Philippines', 30065, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(266, 156, '816 Cayenne Parkway', '', 'Manab', 'Portoviejo', 'Ecuador', 93629, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(267, 336, '1831 Nam Dinh Loop', '', 'National Capital Reg', 'Mandaluyong', 'Philippines', 51990, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(268, 433, '446 Kirovo-Tepetsk Lane', '', 'Osaka', 'Higashiosaka', 'Japan', 19428, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(269, 288, '682 Halisahar Place', '', 'Severn Morava', 'Olomouc', 'Czech Republic', 20536, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(270, 322, '1587 Loja Manor', '', 'Salzburg', 'Salzburg', 'Austria', 5410, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(271, 65, '1762 Paarl Parkway', '', 'Hunan', 'Lengshuijiang', 'China', 53928, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(272, 11, '1519 Ilorin Place', '', 'Kerala', 'Palghat (Palakkad)', 'India', 49298, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(273, 385, '920 Kumbakonam Loop', '', 'California', 'Salinas', 'United States', 75090, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(274, 358, '906 Goinia Way', '', 'Wielkopolskie', 'Kalisz', 'Poland', 83565, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(275, 95, '1675 Xiangfan Manor', '', 'Tamil Nadu', 'Kumbakonam', 'India', 11763, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(276, 371, '85 San Felipe de Puerto Plata Drive', '', 'Shandong', 'Yantai', 'China', 46063, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(277, 94, '144 South Hill Loop', '', 'Guanajuato', 'Salamanca', 'Mexico', 2012, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(278, 495, '1884 Shikarpur Avenue', '', 'Haryana', 'Karnal', 'India', 85548, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(279, 374, '1980 Kamjanets-Podilskyi Street', '', 'Illinois', 'Peoria', 'United States', 89502, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(280, 9, '1944 Bamenda Way', '', 'Michigan', 'Warren', 'United States', 24645, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(281, 472, '556 Baybay Manor', '', 'Oyo & Osun', 'Ogbomosho', 'Nigeria', 55802, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(282, 214, '457 Tongliao Loop', '', 'Bursa', 'Inegl', 'Turkey', 56254, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(283, 225, '600 Bradford Street', '', 'East Azerbaidzan', 'Tabriz', 'Iran', 96204, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(284, 276, '1006 Santa Brbara dOeste Manor', '', 'Ondo & Ekiti', 'Owo', 'Nigeria', 36229, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(285, 300, '1308 Sumy Loop', '', 'Fujian', 'Fuzhou', 'China', 30657, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(286, 273, '1405 Chisinau Place', '', 'Ponce', 'Ponce', 'Puerto Rico', 8160, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(287, 141, '226 Halifax Street', '', 'Xinxiang', 'Korla', 'China', 58492, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(288, 346, '1279 Udine Parkway', '', 'Edo & Delta', 'Benin City', 'Nigeria', 75860, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(289, 138, '1336 Benin City Drive', '', 'Shiga', 'Otsu', 'Japan', 46044, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(290, 67, '1155 Liaocheng Place', '', 'Oyo & Osun', 'Effon-Alaiye', 'Nigeria', 22650, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(291, 133, '1993 Tabuk Lane', '', 'Tamil Nadu', 'Tambaram', 'India', 64221, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(292, 268, '86 Higashiosaka Lane', '', 'Guanajuato', 'Valle de Santiago', 'Mexico', 33768, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(293, 261, '1912 Allende Manor', '', 'Kowloon and New Kowl', 'Kowloon and New Kowloon', 'Hong Kong', 58124, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(294, 382, '544 Tarsus Boulevard', '', 'Gurico', 'Valle de la Pascua', 'Venezuela', 53145, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(295, 64, '1936 Cuman Avenue', '', 'Virginia', 'Roanoke', 'United States', 61195, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(296, 193, '1192 Tongliao Street', '', 'Sharja', 'Sharja', 'United Arab Emirates', 19065, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(297, 138, '44 Najafabad Way', '', 'Baskimaa', 'Donostia-San Sebastin', 'Spain', 61391, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(298, 489, '32 Pudukkottai Lane', '', 'Ohio', 'Dayton', 'United States', 38834, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(299, 457, '661 Chisinau Lane', '', 'Pietari', 'Kolpino', 'Russian Federation', 8856, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(300, 73, '951 Stara Zagora Manor', '', 'Punjab', 'Patiala', 'India', 98573, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(301, 16, '922 Vila Velha Loop', '', 'Maharashtra', 'Ahmadnagar', 'India', 4085, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(302, 418, '898 Jining Lane', '', 'Pohjois-Pohjanmaa', 'Oulu', 'Finland', 40070, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(303, 303, '1635 Kuwana Boulevard', '', 'Hiroshima', 'Hiroshima', 'Japan', 52137, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(304, 368, '41 El Alto Parkway', '', 'Maharashtra', 'Parbhani', 'India', 56883, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(305, 161, '1883 Maikop Lane', '', 'Kaliningrad', 'Kaliningrad', 'Russian Federation', 68469, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(306, 480, '1908 Gaziantep Place', '', 'Liaoning', 'Tiefa', 'China', 58979, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(307, 20, '687 Alessandria Parkway', '', 'Sanaa', 'Sanaa', 'Yemen', 57587, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(308, 175, '827 Yuncheng Drive', '', 'Callao', 'Callao', 'Peru', 79047, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(309, 256, '913 Coacalco de Berriozbal Loop', '', 'Texas', 'Arlington', 'United States', 42141, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(310, 45, '715 So Bernardo do Campo Lane', '', 'Kedah', 'Sungai Petani', 'Malaysia', 84804, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(311, 437, '1354 Siegen Street', '', 'Rio de Janeiro', 'Angra dos Reis', 'Brazil', 80184, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(312, 39, '1191 Sungai Petani Boulevard', '', 'Missouri', 'Kansas City', 'United States', 9668, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(313, 132, '1224 Huejutla de Reyes Boulevard', '', 'Lombardia', 'Brescia', 'Italy', 70923, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(314, 389, '543 Bergamo Avenue', '', 'Minas Gerais', 'Ibirit', 'Brazil', 59686, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(315, 386, '746 Joliet Lane', '', 'Kursk', 'Kursk', 'Russian Federation', 94878, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(316, 442, '780 Kimberley Way', '', 'Tabuk', 'Tabuk', 'Saudi Arabia', 17032, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(317, 91, '1774 Yaound Place', '', 'Hubei', 'Ezhou', 'China', 91400, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(318, 473, '1957 Yantai Lane', '', 'So Paulo', 'Sorocaba', 'Brazil', 59255, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(319, 14, '1542 Lubumbashi Boulevard', '', 'Tel Aviv', 'Bat Yam', 'Israel', 62472, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(320, 239, '651 Pathankot Loop', '', 'Maharashtra', 'Miraj', 'India', 59811, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(321, 439, '1359 Zhoushan Parkway', '', 'Streymoyar', 'Trshavn', 'Faroe Islands', 29763, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(322, 488, '1769 Iwaki Lane', '', 'Kujawsko-Pomorskie', 'Bydgoszcz', 'Poland', 25787, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(323, 303, '1145 Vilnius Manor', '', 'Mxico', 'San Felipe del Progreso', 'Mexico', 73170, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(324, 34, '1892 Nabereznyje Telny Lane', '', 'Tutuila', 'Tafuna', 'American Samoa', 28396, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(325, 319, '470 Boksburg Street', '', 'Central', 'Birgunj', 'Nepal', 97960, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(326, 205, '1427 A Corua (La Corua) Place', '', 'Buenos Aires', 'Baha Blanca', 'Argentina', 85799, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(327, 173, '479 San Felipe del Progreso Avenue', '', 'Morelos', 'Cuautla', 'Mexico', 54949, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(328, 21, '867 Benin City Avenue', '', 'Henan', 'Yuzhou', 'China', 78543, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(329, 452, '981 Kumbakonam Place', '', 'Distrito Federal', 'Braslia', 'Brazil', 87611, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(330, 393, '1016 Iwakuni Street', '', 'St George', 'Kingstown', 'Saint Vincent and the Grenadines', 49833, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(331, 463, '663 Baha Blanca Parkway', '', 'Adana', 'Adana', 'Turkey', 33463, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(332, 55, '1860 Taguig Loop', '', 'West Java', 'Ciparay', 'Indonesia', 59550, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(333, 429, '1816 Bydgoszcz Loop', '', 'Dhaka', 'Jamalpur', 'Bangladesh', 64308, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(334, 39, '587 Benguela Manor', '', 'Illinois', 'Aurora', 'United States', 91590, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(335, 368, '430 Kumbakonam Drive', '', 'Santa F', 'Santa F', 'Argentina', 28814, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(336, 55, '1838 Tabriz Lane', '', 'Dhaka', 'Dhaka', 'Bangladesh', 1195, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(337, 469, '431 Szkesfehrvr Avenue', '', 'Baki', 'Baku', 'Azerbaijan', 57828, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(338, 454, '503 Sogamoso Loop', '', 'Sumqayit', 'Sumqayit', 'Azerbaijan', 49812, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(339, 196, '507 Smolensk Loop', '', 'Sousse', 'Sousse', 'Tunisia', 22971, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(340, 361, '1920 Weifang Avenue', '', 'Uttar Pradesh', 'Rampur', 'India', 15643, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(341, 15, '124 al-Manama Way', '', 'Hiroshima', 'Onomichi', 'Japan', 52368, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(342, 418, '1443 Mardan Street', '', 'Western Cape', 'Paarl', 'South Africa', 31483, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(343, 181, '1909 Benguela Lane', '', 'Henan', 'Xinxiang', 'China', 19913, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(344, 156, '68 Ponce Parkway', '', 'Hanoi', 'Hanoi', 'Vietnam', 85926, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(345, 431, '1217 Konotop Avenue', '', 'Gelderland', 'Ede', 'Netherlands', 504, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(346, 150, '1293 Nam Dinh Way', '', 'Roraima', 'Boa Vista', 'Brazil', 71583, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(347, 489, '785 Vaduz Street', '', 'Baja California', 'Mexicali', 'Mexico', 36170, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(348, 357, '1516 Escobar Drive', '', 'Tongatapu', 'Nukualofa', 'Tonga', 46069, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(349, 265, '1628 Nagareyama Lane', '', 'Central', 'San Lorenzo', 'Paraguay', 60079, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(350, 51, '1157 Nyeri Loop', '', 'Adygea', 'Maikop', 'Russian Federation', 56380, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(351, 393, '1673 Tangail Drive', '', 'Daugavpils', 'Daugavpils', 'Latvia', 26857, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(352, 410, '381 Kabul Way', '', 'Taipei', 'Hsichuh', 'Taiwan', 87272, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(353, 175, '953 Hodeida Street', '', 'Southern Tagalog', 'Imus', 'Philippines', 18841, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(354, 244, '469 Nakhon Sawan Street', '', 'Tuvassia', 'Teboksary', 'Russian Federation', 58866, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home');
INSERT INTO `user_vs_address` (`id_user_vs_address`, `user_id`, `address_line_1`, `address_line_2`, `taluka`, `city`, `state`, `pincode`, `is_active`, `added_on`, `updated_on`, `address_type`) VALUES
(355, 420, '1378 Beira Loop', '', 'Krasnojarsk', 'Zeleznogorsk', 'Russian Federation', 40792, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(356, 437, '1641 Changhwa Place', '', 'Nord-Ouest', 'Bamenda', 'Cameroon', 37636, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(357, 222, '1698 Southport Loop', '', 'Hidalgo', 'Pachuca de Soto', 'Mexico', 49009, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(358, 24, '519 Nyeri Manor', '', 'So Paulo', 'Santo Andr', 'Brazil', 37650, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(359, 30, '619 Hunuco Avenue', '', 'Shimane', 'Matsue', 'Japan', 81508, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(360, 63, '45 Aparecida de Goinia Place', '', 'Madhya Pradesh', 'Satna', 'India', 7431, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(361, 146, '482 Kowloon and New Kowloon Manor', '', 'Bratislava', 'Bratislava', 'Slovakia', 97056, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(362, 298, '604 Bern Place', '', 'Jharkhand', 'Ranchi', 'India', 5373, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(363, 133, '1623 Kingstown Drive', '', 'Buenos Aires', 'Almirante Brown', 'Argentina', 91299, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(364, 309, '1009 Zanzibar Lane', '', 'Arecibo', 'Arecibo', 'Puerto Rico', 64875, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(365, 209, '114 Jalib al-Shuyukh Manor', '', 'Centre', 'Yaound', 'Cameroon', 60440, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(366, 108, '1163 London Parkway', '', 'Par', 'Belm', 'Brazil', 6066, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(367, 481, '1658 Jastrzebie-Zdrj Loop', '', 'Central', 'Nyeri', 'Kenya', 96584, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(368, 453, '817 Laredo Avenue', '', 'Jalisco', 'Guadalajara', 'Mexico', 77449, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(369, 11, '1565 Tangail Manor', '', 'Okinawa', 'Okinawa', 'Japan', 45750, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(370, 81, '1912 Emeishan Drive', '', 'Balikesir', 'Balikesir', 'Turkey', 33050, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(371, 192, '230 Urawa Drive', '', 'Andhra Pradesh', 'Adoni', 'India', 2738, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(372, 77, '1922 Miraj Way', '', 'Esfahan', 'Najafabad', 'Iran', 13203, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(373, 453, '433 Florencia Street', '', 'Chihuahua', 'Jurez', 'Mexico', 91330, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(374, 432, '1049 Matamoros Parkway', '', 'Karnataka', 'Gulbarga', 'India', 69640, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(375, 65, '1061 Ede Avenue', '', 'Southern Tagalog', 'Cabuyao', 'Philippines', 57810, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(376, 154, '154 Oshawa Manor', '', 'East Java', 'Probolinggo', 'Indonesia', 72771, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(377, 188, '1191 Tandil Drive', '', 'Southern Tagalog', 'Tanauan', 'Philippines', 6362, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(378, 347, '1133 Rizhao Avenue', '', 'Pernambuco', 'Vitria de Santo Anto', 'Brazil', 2800, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(379, 254, '1519 Santiago de los Caballeros Loop', '', 'East Kasai', 'Mwene-Ditu', 'Congo, The Democratic Republic of the', 22025, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(380, 416, '1618 Olomouc Manor', '', 'Kurgan', 'Kurgan', 'Russian Federation', 26385, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(381, 184, '220 Hidalgo Drive', '', 'Kermanshah', 'Kermanshah', 'Iran', 45298, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(382, 63, '686 Donostia-San Sebastin Lane', '', 'Guangdong', 'Shenzhen', 'China', 97390, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(383, 79, '97 Mogiljov Lane', '', 'Gujarat', 'Bhavnagar', 'India', 89294, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(384, 40, '1642 Charlotte Amalie Drive', '', 'Slaskie', 'Tychy', 'Poland', 75442, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(385, 148, '1368 Maracabo Boulevard', '', '', 'South Hill', 'Anguilla', 32716, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(386, 373, '401 Sucre Boulevard', '', 'New Hampshire', 'Manchester', 'United States', 25007, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(387, 128, '368 Hunuco Boulevard', '', 'Namibe', 'Namibe', 'Angola', 17165, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(388, 279, '500 Lincoln Parkway', '', 'Jiangsu', 'Huaian', 'China', 95509, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(389, 10, '102 Chapra Drive', '', 'Ibaragi', 'Tama', 'Japan', 14073, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(390, 307, '1793 Meixian Place', '', 'Hmelnytskyi', 'Kamjanets-Podilskyi', 'Ukraine', 33535, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(391, 216, '514 Ife Way', '', 'Shaba', 'Lubumbashi', 'Congo, The Democratic Republic of the', 69973, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(392, 232, '717 Changzhou Lane', '', 'Southern Tagalog', 'Cavite', 'Philippines', 21615, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(393, 410, '753 Ilorin Avenue', '', 'Sichuan', 'Emeishan', 'China', 3656, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(394, 68, '1337 Mit Ghamr Avenue', '', 'Nakhon Sawan', 'Nakhon Sawan', 'Thailand', 29810, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(395, 468, '767 Pyongyang Drive', '', 'Osaka', 'Izumisano', 'Japan', 83536, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(396, 191, '614 Pak Kret Street', '', 'Addis Abeba', 'Addis Abeba', 'Ethiopia', 27796, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(397, 329, '954 Lapu-Lapu Way', '', 'Moskova', 'Korolev', 'Russian Federation', 8816, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(398, 262, '331 Bydgoszcz Parkway', '', 'Asturia', 'Gijn', 'Spain', 966, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(399, 377, '1152 Citrus Heights Manor', '', 'al-Qadarif', 'al-Qadarif', 'Sudan', 5239, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(400, 361, '168 Cianjur Manor', '', 'Saitama', 'Iwatsuki', 'Japan', 73824, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(401, 189, '616 Hagonoy Avenue', '', 'Krasnojarsk', 'Atinsk', 'Russian Federation', 46043, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(402, 399, '1190 0 Place', '', 'Rio Grande do Sul', 'Bag', 'Brazil', 10417, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(403, 238, '734 Bchar Place', '', 'Punjab', 'Okara', 'Pakistan', 30586, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(404, 210, '530 Lausanne Lane', '', 'Texas', 'Dallas', 'United States', 11067, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(405, 411, '454 Patiala Lane', '', 'Fukushima', 'Koriyama', 'Japan', 13496, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(406, 246, '1346 Mysore Drive', '', 'Bretagne', 'Brest', 'France', 61507, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(407, 383, '990 Etawah Loop', '', 'Tamil Nadu', 'Valparai', 'India', 79940, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(408, 62, '1266 Laredo Parkway', '', 'Saitama', 'Omiya', 'Japan', 7664, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(409, 123, '88 Nagaon Manor', '', 'Buenos Aires', 'Tandil', 'Argentina', 86868, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(410, 96, '264 Bhimavaram Manor', '', 'St Thomas', 'Charlotte Amalie', 'Virgin Islands, U.S.', 54749, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(411, 106, '1639 Saarbrcken Drive', '', 'North West', 'Rustenburg', 'South Africa', 9827, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(412, 239, '692 Amroha Drive', '', 'Northern', 'Jaffna', 'Sri Lanka', 35575, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(413, 482, '1936 Lapu-Lapu Parkway', '', 'Bauchi & Gombe', 'Deba Habe', 'Nigeria', 7122, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(414, 111, '432 Garden Grove Street', '', 'Ontario', 'Richmond Hill', 'Canada', 65630, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(415, 306, '1445 Carmen Parkway', '', 'West Java', 'Cianjur', 'Indonesia', 70809, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(416, 422, '791 Salinas Street', '', 'Punjab', 'Hoshiarpur', 'India', 40509, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(417, 262, '126 Acua Parkway', '', 'West Bengali', 'Berhampore (Baharampur)', 'India', 58888, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(418, 260, '397 Sunnyvale Avenue', '', 'Guanajuato', 'Allende', 'Mexico', 55566, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(419, 122, '992 Klerksdorp Loop', '', 'Utrecht', 'Amersfoort', 'Netherlands', 33711, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(420, 309, '966 Arecibo Loop', '', 'Sind', 'Dadu', 'Pakistan', 94018, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(421, 274, '289 Santo Andr Manor', '', 'al-Sharqiya', 'al-Qatif', 'Saudi Arabia', 72410, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(422, 81, '437 Chungho Drive', '', 'Puerto Plata', 'San Felipe de Puerto Plata', 'Dominican Republic', 59489, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(423, 457, '1948 Bayugan Parkway', '', 'Bihar', 'Katihar', 'India', 60622, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(424, 332, '1866 al-Qatif Avenue', '', 'California', 'El Monte', 'United States', 89420, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(425, 284, '1661 Abha Drive', '', 'Tamil Nadu', 'Pudukkottai', 'India', 14400, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(426, 469, '1557 Cape Coral Parkway', '', 'Hubei', 'Laohekou', 'China', 46875, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(427, 252, '1727 Matamoros Place', '', 'Sawhaj', 'Sawhaj', 'Egypt', 78813, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(428, 138, '1269 Botosani Manor', '', 'Guangdong', 'Shanwei', 'China', 47394, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(429, 309, '355 Vitria de Santo Anto Way', '', 'Oaxaca', 'San Juan Bautista Tuxtepec', 'Mexico', 81758, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(430, 424, '1596 Acua Parkway', '', 'Jharkhand', 'Purnea (Purnia)', 'India', 70425, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(431, 125, '259 Ipoh Drive', '', 'So Paulo', 'Guaruj', 'Brazil', 64964, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(432, 446, '1823 Hoshiarpur Lane', '', 'Komi', 'Syktyvkar', 'Russian Federation', 33191, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(433, 84, '1404 Taguig Drive', '', 'Okayama', 'Tsuyama', 'Japan', 87212, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(434, 128, '740 Udaipur Lane', '', 'Nizni Novgorod', 'Dzerzinsk', 'Russian Federation', 33505, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(435, 83, '287 Cuautla Boulevard', '', 'Chuquisaca', 'Sucre', 'Bolivia', 72736, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(436, 281, '1766 Almirante Brown Street', '', 'KwaZulu-Natal', 'Newcastle', 'South Africa', 63104, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(437, 41, '596 Huixquilucan Place', '', 'Nampula', 'Naala-Porto', 'Mozambique', 65892, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(438, 383, '1351 Aparecida de Goinia Parkway', '', 'Northern Mindanao', 'Ozamis', 'Philippines', 41775, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(439, 193, '722 Bradford Lane', '', 'Shandong', 'Junan', 'China', 90920, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(440, 328, '983 Santa F Way', '', 'British Colombia', 'Vancouver', 'Canada', 47472, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(441, 128, '1245 Ibirit Way', '', 'La Romana', 'La Romana', 'Dominican Republic', 40926, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(442, 371, '1836 Korla Parkway', '', 'Copperbelt', 'Kitwe', 'Zambia', 55405, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(443, 458, '231 Kaliningrad Place', '', 'Lombardia', 'Bergamo', 'Italy', 57833, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(444, 295, '495 Bhimavaram Lane', '', 'Maharashtra', 'Dhule (Dhulia)', 'India', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(445, 439, '1924 Shimonoseki Drive', '', 'Batna', 'Batna', 'Algeria', 52625, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(446, 233, '105 Dzerzinsk Manor', '', 'Inner Mongolia', 'Tongliao', 'China', 48570, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(447, 228, '614 Denizli Parkway', '', 'Rio Grande do Sul', 'So Leopoldo', 'Brazil', 29444, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(448, 375, '1289 Belm Boulevard', '', 'Tartumaa', 'Tartu', 'Estonia', 88306, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(449, 191, '203 Tambaram Street', '', 'Buenos Aires', 'Escobar', 'Argentina', 73942, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(450, 298, '1704 Tambaram Manor', '', 'West Bengali', 'Uluberia', 'India', 2834, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(451, 84, '207 Cuernavaca Loop', '', 'Tatarstan', 'Nabereznyje Telny', 'Russian Federation', 52671, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(452, 375, '319 Springs Loop', '', 'Baijeri', 'Erlangen', 'Germany', 99552, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(453, 99, '956 Nam Dinh Manor', '', 'Kerman', 'Sirjan', 'Iran', 21872, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(454, 157, '1947 Paarl Way', '', 'Central Java', 'Surakarta', 'Indonesia', 23636, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(455, 258, '814 Simferopol Loop', '', 'Sinaloa', 'El Fuerte', 'Mexico', 48745, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(456, 320, '535 Ahmadnagar Manor', '', 'Abu Dhabi', 'Abu Dhabi', 'United Arab Emirates', 41136, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(457, 402, '138 Caracas Boulevard', '', 'Zulia', 'Maracabo', 'Venezuela', 16790, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(458, 258, '251 Florencia Drive', '', 'Michoacn de Ocampo', 'Uruapan', 'Mexico', 16119, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(459, 138, '659 Gatineau Boulevard', '', 'La Paz', 'El Alto', 'Bolivia', 28587, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(460, 120, '1889 Valparai Way', '', 'Ziguinchor', 'Ziguinchor', 'Senegal', 75559, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(461, 355, '1485 Bratislava Place', '', 'Illinois', 'Rockford', 'United States', 83183, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(462, 62, '935 Aden Boulevard', '', 'Central Java', 'Tegal', 'Indonesia', 64709, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(463, 487, '76 Kermanshah Manor', '', 'Esfahan', 'Qomsheh', 'Iran', 23343, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(464, 132, '734 Tanshui Avenue', '', 'Caquet', 'Florencia', 'Colombia', 70664, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(465, 281, '118 Jaffna Loop', '', 'Northern Mindanao', 'Gingoog', 'Philippines', 10447, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(466, 498, '1621 Tongliao Avenue', '', 'Irkutsk', 'Usolje-Sibirskoje', 'Russian Federation', 22173, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(467, 316, '1844 Usak Avenue', '', 'Nova Scotia', 'Halifax', 'Canada', 84461, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(468, 396, '1872 Toulon Loop', '', 'OHiggins', 'Rancagua', 'Chile', 7939, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(469, 352, '1088 Ibirit Place', '', 'Jalisco', 'Zapopan', 'Mexico', 88502, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(470, 205, '1322 Mosul Parkway', '', 'Shandong', 'Dongying', 'China', 95400, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(471, 180, '1447 Chatsworth Place', '', 'Chihuahua', 'Cuauhtmoc', 'Mexico', 41545, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(472, 356, '1257 Guadalajara Street', '', 'Karnataka', 'Bijapur', 'India', 33599, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(473, 273, '1469 Plock Lane', '', 'Galicia', 'Ourense (Orense)', 'Spain', 95835, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(474, 430, '434 Ourense (Orense) Manor', '', 'Hodeida', 'Hodeida', 'Yemen', 14122, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(475, 53, '270 Tambaram Parkway', '', 'Gauteng', 'Johannesburg', 'South Africa', 9668, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(476, 239, '1786 Salinas Place', '', 'Nam Ha', 'Nam Dinh', 'Vietnam', 66546, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(477, 362, '1078 Stara Zagora Drive', '', 'Aceh', 'Lhokseumawe', 'Indonesia', 69221, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(478, 406, '1854 Okara Boulevard', '', 'Drenthe', 'Emmen', 'Netherlands', 42123, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(479, 308, '421 Yaound Street', '', 'Sumy', 'ostka', 'Ukraine', 11363, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(480, 14, '1153 Allende Way', '', 'Qubec', 'Gatineau', 'Canada', 20336, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(481, 165, '808 Naala-Porto Parkway', '', 'England', 'Stockport', 'United Kingdom', 41060, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(482, 89, '632 Usolje-Sibirskoje Parkway', '', 'Ha Darom', 'Ashqelon', 'Israel', 73085, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(483, 295, '98 Pyongyang Boulevard', '', 'Ohio', 'Akron', 'United States', 88749, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(484, 21, '984 Novoterkassk Loop', '', 'Gaziantep', 'Gaziantep', 'Turkey', 28165, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(485, 74, '64 Korla Street', '', 'Mwanza', 'Mwanza', 'Tanzania', 25145, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(486, 65, '1785 So Bernardo do Campo Street', '', 'Veracruz', 'Coatzacoalcos', 'Mexico', 71182, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(487, 480, '698 Jelets Boulevard', '', 'Denizli', 'Denizli', 'Turkey', 2596, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(488, 140, '1297 Alvorada Parkway', '', 'Ningxia', 'Yinchuan', 'China', 11839, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(489, 428, '1909 Dayton Avenue', '', 'Guangdong', 'Shaoguan', 'China', 88513, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(490, 375, '1789 Saint-Denis Parkway', '', 'Coahuila de Zaragoza', 'Acua', 'Mexico', 8268, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(491, 491, '185 Mannheim Lane', '', 'Stavropol', 'Pjatigorsk', 'Russian Federation', 23661, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(492, 137, '184 Mandaluyong Street', '', 'Baja California Sur', 'La Paz', 'Mexico', 94239, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(493, 425, '591 Sungai Petani Drive', '', 'Okayama', 'Okayama', 'Japan', 46400, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(494, 129, '656 Matamoros Drive', '', 'Boyac', 'Sogamoso', 'Colombia', 19489, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(495, 148, '775 ostka Drive', '', 'al-Daqahliya', 'Mit Ghamr', 'Egypt', 22358, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(496, 368, '1013 Tabuk Boulevard', '', 'West Bengali', 'Kanchrapara', 'India', 96203, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(497, 213, '319 Plock Parkway', '', 'Istanbul', 'Sultanbeyli', 'Turkey', 26101, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(498, 210, '1954 Kowloon and New Kowloon Way', '', 'Chimborazo', 'Robamba', 'Ecuador', 63667, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(499, 498, '362 Rajkot Lane', '', 'Gansu', 'Baiyin', 'China', 98030, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(500, 170, '1060 Tandil Lane', '', 'Shandong', 'Rizhao', 'China', 72349, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(501, 245, '1515 Korla Way', '', 'England', 'York', 'United Kingdom', 57197, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(502, 287, '1416 San Juan Bautista Tuxtepec Avenue', '', 'Zufar', 'Salala', 'Oman', 50592, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(503, 206, '1 Valle de Santiago Avenue', '', 'Apulia', 'Brindisi', 'Italy', 86208, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(504, 481, '519 Brescia Parkway', '', 'East Java', 'Madiun', 'Indonesia', 69504, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(505, 197, '414 Mandaluyong Street', '', 'Lubelskie', 'Lublin', 'Poland', 16370, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(506, 482, '1197 Sokoto Boulevard', '', 'West Bengali', 'Siliguri (Shiliguri)', 'India', 87687, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(507, 372, '496 Celaya Drive', '', 'Nagano', 'Ueda', 'Japan', 90797, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(508, 393, '786 Matsue Way', '', 'Illinois', 'Joliet', 'United States', 37469, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(509, 482, '48 Maracabo Place', '', 'Central Luzon', 'Talavera', 'Philippines', 1570, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(510, 439, '1152 al-Qatif Lane', '', 'Kalimantan Barat', 'Pontianak', 'Indonesia', 44816, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(511, 218, '1269 Ipoh Avenue', '', 'Eskisehir', 'Eskisehir', 'Turkey', 54674, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(512, 57, '758 Korolev Parkway', '', 'Andhra Pradesh', 'Vijayawada', 'India', 75474, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(513, 462, '1747 Rustenburg Place', '', 'Bihar', 'Chapra', 'India', 51369, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(514, 22, '886 Tonghae Place', '', 'Volgograd', 'Kamyin', 'Russian Federation', 19450, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(515, 327, '1574 Goinia Boulevard', '', 'Heilongjiang', 'Suihua', 'China', 39529, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(516, 288, '548 Uruapan Street', '', 'Ontario', 'London', 'United Kingdom', 35653, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(517, 360, '962 Tama Loop', '', '', 'Yangor', 'Nauru', 65952, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(518, 214, '1778 Gijn Manor', '', 'Hubei', 'Zaoyang', 'China', 35156, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(519, 400, '568 Dhule (Dhulia) Loop', '', 'Coquimbo', 'Coquimbo', 'Chile', 92568, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(520, 473, '1768 Udine Loop', '', 'Battambang', 'Battambang', 'Cambodia', 32347, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(521, 304, '608 Birgunj Parkway', '', 'Taipei', 'Chungho', 'Taiwan', 400, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(522, 112, '680 A Corua (La Corua) Manor', '', 'Sivas', 'Sivas', 'Turkey', 49806, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(523, 189, '1949 Sanya Street', '', 'Gumma', 'Isesaki', 'Japan', 61244, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(524, 233, '617 Klerksdorp Place', '', 'Khanh Hoa', 'Nha Trang', 'Vietnam', 94707, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(525, 51, '1993 0 Loop', '', 'Liaoning', 'Yingkou', 'China', 41214, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(526, 222, '1176 Southend-on-Sea Manor', '', 'Southern Tagalog', 'Santa Rosa', 'Philippines', 81651, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(527, 304, '600 Purnea (Purnia) Avenue', '', 'Nghe An', 'Vinh', 'Vietnam', 18043, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(528, 185, '1003 Qinhuangdao Street', '', 'West Java', 'Purwakarta', 'Indonesia', 25972, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(529, 216, '1986 Sivas Place', '', 'Friuli-Venezia Giuli', 'Udine', 'Italy', 95775, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(530, 285, '1427 Tabuk Place', '', 'Florida', 'Cape Coral', 'United States', 31342, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(531, 21, '556 Asuncin Way', '', 'Mogiljov', 'Mogiljov', 'Belarus', 35364, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(532, 95, '486 Ondo Parkway', '', 'Benguela', 'Benguela', 'Angola', 35202, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(533, 297, '635 Brest Manor', '', 'Andhra Pradesh', 'Bhimavaram', 'India', 40899, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(534, 173, '166 Jinchang Street', '', 'Buenos Aires', 'Ezeiza', 'Argentina', 86760, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(535, 369, '958 Sagamihara Lane', '', 'Mie', 'Kuwana', 'Japan', 88408, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(536, 22, '1817 Livorno Way', '', 'Khanh Hoa', 'Cam Ranh', 'Vietnam', 79401, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(537, 482, '1332 Gaziantep Lane', '', 'Shandong', 'Binzhou', 'China', 22813, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(538, 26, '949 Allende Lane', '', 'Uttar Pradesh', 'Amroha', 'India', 67521, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(539, 330, '195 Ilorin Street', '', 'Chari-Baguirmi', 'NDjamna', 'Chad', 49250, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(540, 57, '193 Bhusawal Place', '', 'Kang-won', 'Tonghae', 'South Korea', 9750, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(541, 360, '43 Vilnius Manor', '', 'Colorado', 'Aurora', 'United States', 79814, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(542, 125, '183 Haiphong Street', '', 'Jilin', 'Baicheng', 'China', 69953, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(543, 481, '163 Augusta-Richmond County Loop', '', 'Carabobo', 'Valencia', 'Venezuela', 33030, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(544, 177, '191 Jos Azueta Parkway', '', 'Ruse', 'Ruse', 'Bulgaria', 13629, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(545, 456, '379 Lublin Parkway', '', 'Toscana', 'Livorno', 'Italy', 74568, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(546, 177, '1658 Cuman Loop', '', 'Sumatera Selatan', 'Pangkal Pinang', 'Indonesia', 51309, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(547, 143, '454 Qinhuangdao Drive', '', 'Tadla-Azilal', 'Beni-Mellal', 'Morocco', 25866, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(548, 160, '1715 Okayama Street', '', 'So Paulo', 'So Bernardo do Campo', 'Brazil', 55676, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(549, 280, '182 Nukualofa Drive', '', 'Sumy', 'Konotop', 'Ukraine', 15414, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(550, 173, '390 Wroclaw Way', '', 'Hainan', 'Sanya', 'China', 5753, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(551, 425, '1421 Quilmes Lane', '', 'Ishikawa', 'Kanazawa', 'Japan', 19151, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(552, 86, '947 Trshavn Place', '', 'Central Luzon', 'Tarlac', 'Philippines', 841, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(553, 119, '1764 Jalib al-Shuyukh Parkway', '', 'Galicia', 'Santiago de Compostela', 'Spain', 77642, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(554, 364, '346 Cam Ranh Avenue', '', 'Zhejiang', 'Zhoushan', 'China', 39976, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(555, 498, '1407 Pachuca de Soto Place', '', 'Rio Grande do Sul', 'Alvorada', 'Brazil', 26284, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(556, 160, '904 Clarksville Drive', '', 'Zhejiang', 'Haining', 'China', 52234, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(557, 35, '1917 Kumbakonam Parkway', '', 'Vojvodina', 'Novi Sad', 'Yugoslavia', 11892, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(558, 408, '1447 Imus Place', '', 'Gujarat', 'Rajkot', 'India', 12905, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(559, 388, '1497 Fengshan Drive', '', 'KwaZulu-Natal', 'Chatsworth', 'South Africa', 63022, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(560, 439, '869 Shikarpur Way', '', 'England', 'Southport', 'United Kingdom', 57380, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(561, 368, '1059 Yuncheng Avenue', '', 'Vilna', 'Vilnius', 'Lithuania', 47498, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(562, 398, '505 Madiun Boulevard', '', 'Dolnoslaskie', 'Wroclaw', 'Poland', 97271, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(563, 464, '1741 Hoshiarpur Boulevard', '', 'al-Sharqiya', 'Bilbays', 'Egypt', 22372, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(564, 499, '1229 Varanasi (Benares) Manor', '', 'Buenos Aires', 'Avellaneda', 'Argentina', 40195, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(565, 84, '1894 Boa Vista Way', '', 'Texas', 'Garland', 'United States', 77464, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(566, 151, '1342 Sharja Way', '', 'Sokoto & Kebbi & Zam', 'Sokoto', 'Nigeria', 93655, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(567, 264, '1342 Abha Boulevard', '', 'Bukarest', 'Bucuresti', 'Romania', 10714, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(568, 359, '415 Pune Avenue', '', 'Shandong', 'Xintai', 'China', 44274, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(569, 162, '1746 Faaa Way', '', 'Huanuco', 'Hunuco', 'Peru', 32515, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(570, 148, '539 Hami Way', '', 'Tokat', 'Tokat', 'Turkey', 52196, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(571, 464, '1407 Surakarta Manor', '', 'Moskova', 'Serpuhov', 'Russian Federation', 33224, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(572, 91, '502 Mandi Bahauddin Parkway', '', 'Anzotegui', 'Barcelona', 'Venezuela', 15992, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(573, 360, '1052 Pathankot Avenue', '', 'Sichuan', 'Leshan', 'China', 77397, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(574, 2, '1351 Sousse Lane', '', 'Coahuila de Zaragoza', 'Monclova', 'Mexico', 37815, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(575, 168, '1501 Pangkal Pinang Avenue', '', 'Mazowieckie', 'Plock', 'Poland', 943, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(576, 241, '1405 Hagonoy Avenue', '', 'Slaskie', 'Czestochowa', 'Poland', 86587, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(577, 105, '521 San Juan Bautista Tuxtepec Place', '', 'Qaraghandy', 'Zhezqazghan', 'Kazakstan', 95093, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(578, 477, '923 Tangail Boulevard', '', 'Tokyo-to', 'Akishima', 'Japan', 33384, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(579, 234, '186 Skikda Lane', '', 'Morelos', 'Cuernavaca', 'Mexico', 89422, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(580, 110, '1568 Celaya Parkway', '', 'Kaohsiung', 'Fengshan', 'Taiwan', 34750, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(581, 202, '1489 Kakamigahara Lane', '', 'Taipei', 'Tanshui', 'Taiwan', 98883, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(582, 300, '1819 Alessandria Loop', '', 'Campeche', 'Carmen', 'Mexico', 53829, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(583, 169, '1208 Tama Loop', '', 'Ninawa', 'Mosul', 'Iraq', 73605, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(584, 111, '951 Springs Lane', '', 'Central Mindanao', 'Iligan', 'Philippines', 96115, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(585, 439, '760 Miyakonojo Drive', '', 'Guerrero', 'Jos Azueta', 'Mexico', 64682, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(586, 173, '966 Asuncin Way', '', 'Hidalgo', 'Huejutla de Reyes', 'Mexico', 62703, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(587, 183, '1584 Ljubertsy Lane', '', 'England', 'Southampton', 'United Kingdom', 22954, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(588, 216, '247 Jining Parkway', '', 'Banjul', 'Banjul', 'Gambia', 53446, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(589, 228, '773 Dallas Manor', '', 'Buenos Aires', 'Quilmes', 'Argentina', 12664, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(590, 198, '1923 Stara Zagora Lane', '', 'Nantou', 'Tsaotun', 'Taiwan', 95179, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(591, 314, '1402 Zanzibar Boulevard', '', 'Guanajuato', 'Celaya', 'Mexico', 71102, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(592, 35, '1464 Kursk Parkway', '', 'Shandong', 'Weifang', 'China', 17381, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'home'),
(593, 50, '1074 Sanaa Parkway', '', 'Loja', 'Loja', 'Ecuador', 22474, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(594, 327, '1759 Niznekamsk Avenue', '', 'al-Manama', 'al-Manama', 'Bahrain', 39414, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(595, 149, '32 Liaocheng Way', '', 'Minas Gerais', 'Juiz de Fora', 'Brazil', 1944, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(596, 270, '42 Fontana Avenue', '', 'Fejr', 'Szkesfehrvr', 'Hungary', 14684, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(597, 143, '1895 Zhezqazghan Drive', '', 'California', 'Garden Grove', 'United States', 36693, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(598, 447, '1837 Kaduna Parkway', '', 'Inner Mongolia', 'Jining', 'China', 82580, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(599, 252, '844 Bucuresti Place', '', 'Liaoning', 'Jinzhou', 'China', 36603, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'other'),
(600, 130, '1101 Bucuresti Boulevard', '', 'West Greece', 'Patras', 'Greece', 97661, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(601, 240, '1103 Quilmes Boulevard', '', 'Piura', 'Sullana', 'Peru', 52137, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(602, 1, '1331 Usak Boulevard', '', 'Vaud', 'Lausanne', 'Switzerland', 61960, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(603, 7, '1325 Fukuyama Street', '', 'Heilongjiang', 'Tieli', 'China', 27107, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'work'),
(604, 999, ' b_1801,puneville', 'punawale,katewasti', 'punawale', 'pune', 'Maharashtra', 411033, '1', '2025-02-19 15:19:57', NULL, NULL),
(605, 999, 'state bank colony', 'durga mandir', 'jalgaon', 'jalgaon', 'Maharashtra', 425001, '1', '2025-02-19 15:24:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_vs_category`
--

CREATE TABLE `user_vs_category` (
  `user_cat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_vs_category`
--

INSERT INTO `user_vs_category` (`user_cat_id`, `user_id`, `category_id`, `added_on`, `is_active`) VALUES
(1, 6, 2, '2025-02-18 18:25:01', '1'),
(2, 320, 6, '2025-02-18 18:25:01', '1'),
(3, 274, 9, '2025-02-18 18:25:01', '1'),
(4, 365, 2, '2025-02-18 18:25:01', '1'),
(5, 150, 3, '2025-02-18 18:25:01', '1'),
(6, 470, 6, '2025-02-18 18:25:01', '1'),
(7, 400, 3, '2025-02-18 18:25:01', '1'),
(8, 177, 10, '2025-02-18 18:25:01', '1'),
(9, 49, 6, '2025-02-18 18:25:01', '1'),
(10, 308, 3, '2025-02-18 18:25:01', '1'),
(11, 452, 6, '2025-02-18 18:25:01', '1'),
(12, 116, 2, '2025-02-18 18:25:01', '1'),
(13, 287, 8, '2025-02-18 18:25:01', '1'),
(14, 121, 3, '2025-02-18 18:25:01', '1'),
(15, 299, 6, '2025-02-18 18:25:01', '1'),
(16, 425, 6, '2025-02-18 18:25:01', '1'),
(17, 405, 9, '2025-02-18 18:25:01', '1'),
(18, 302, 1, '2025-02-18 18:25:01', '1'),
(19, 379, 1, '2025-02-18 18:25:01', '1'),
(20, 448, 9, '2025-02-18 18:25:01', '1'),
(23, 426, 2, '2025-02-18 18:25:01', '1'),
(24, 73, 9, '2025-02-18 18:25:01', '1'),
(25, 125, 5, '2025-02-18 18:25:01', '1'),
(26, 458, 10, '2025-02-18 18:25:01', '1'),
(27, 141, 7, '2025-02-18 18:25:01', '1'),
(28, 265, 3, '2025-02-18 18:25:01', '1'),
(29, 236, 2, '2025-02-18 18:25:01', '1'),
(30, 366, 7, '2025-02-18 18:25:01', '1'),
(31, 137, 9, '2025-02-18 18:25:01', '1'),
(32, 481, 7, '2025-02-18 18:25:01', '1'),
(33, 432, 1, '2025-02-18 18:25:01', '1'),
(34, 67, 5, '2025-02-18 18:25:01', '1'),
(35, 212, 2, '2025-02-18 18:25:01', '1'),
(36, 444, 7, '2025-02-18 18:25:01', '1'),
(37, 27, 2, '2025-02-18 18:25:01', '1'),
(38, 63, 4, '2025-02-18 18:25:01', '1'),
(39, 43, 10, '2025-02-18 18:25:01', '1'),
(40, 19, 5, '2025-02-18 18:25:01', '1'),
(41, 314, 5, '2025-02-18 18:25:01', '1'),
(42, 11, 4, '2025-02-18 18:25:01', '1'),
(43, 170, 2, '2025-02-18 18:25:01', '1'),
(44, 112, 3, '2025-02-18 18:25:01', '1'),
(45, 37, 1, '2025-02-18 18:25:01', '1'),
(46, 296, 4, '2025-02-18 18:25:01', '1'),
(47, 23, 7, '2025-02-18 18:25:01', '1'),
(48, 117, 2, '2025-02-18 18:25:01', '1'),
(49, 270, 10, '2025-02-18 18:25:01', '1'),
(50, 359, 9, '2025-02-18 18:25:01', '1'),
(51, 110, 8, '2025-02-18 18:25:01', '1'),
(52, 442, 3, '2025-02-18 18:25:01', '1'),
(53, 371, 4, '2025-02-18 18:25:01', '1'),
(54, 127, 5, '2025-02-18 18:25:01', '1'),
(55, 267, 3, '2025-02-18 18:25:01', '1'),
(56, 73, 2, '2025-02-18 18:25:01', '1'),
(57, 238, 8, '2025-02-18 18:25:01', '1'),
(58, 159, 2, '2025-02-18 18:25:01', '1'),
(59, 205, 2, '2025-02-18 18:25:01', '1'),
(60, 413, 5, '2025-02-18 18:25:01', '1'),
(61, 200, 3, '2025-02-18 18:25:01', '1'),
(62, 65, 7, '2025-02-18 18:25:01', '1'),
(63, 240, 2, '2025-02-18 18:25:01', '1'),
(64, 94, 4, '2025-02-18 18:25:01', '1'),
(65, 213, 8, '2025-02-18 18:25:01', '1'),
(66, 42, 4, '2025-02-18 18:25:01', '1'),
(67, 410, 6, '2025-02-18 18:25:01', '1'),
(68, 36, 10, '2025-02-18 18:25:01', '1'),
(69, 186, 4, '2025-02-18 18:25:01', '1'),
(70, 133, 9, '2025-02-18 18:25:01', '1'),
(71, 366, 5, '2025-02-18 18:25:01', '1'),
(72, 332, 9, '2025-02-18 18:25:01', '1'),
(73, 204, 7, '2025-02-18 18:25:01', '1'),
(74, 268, 8, '2025-02-18 18:25:01', '1'),
(75, 438, 9, '2025-02-18 18:25:01', '1'),
(77, 294, 10, '2025-02-18 18:25:01', '1'),
(78, 63, 9, '2025-02-18 18:25:01', '1'),
(79, 217, 1, '2025-02-18 18:25:01', '1'),
(80, 302, 8, '2025-02-18 18:25:01', '1'),
(81, 392, 7, '2025-02-18 18:25:01', '1'),
(82, 264, 6, '2025-02-18 18:25:01', '1'),
(83, 469, 5, '2025-02-18 18:25:01', '1'),
(84, 39, 7, '2025-02-18 18:25:01', '1'),
(85, 268, 9, '2025-02-18 18:25:01', '1'),
(86, 86, 7, '2025-02-18 18:25:01', '1'),
(87, 343, 7, '2025-02-18 18:25:01', '1'),
(88, 87, 6, '2025-02-18 18:25:01', '1'),
(89, 265, 10, '2025-02-18 18:25:01', '1'),
(90, 6, 4, '2025-02-18 18:25:01', '1'),
(91, 248, 2, '2025-02-18 18:25:01', '1'),
(92, 282, 2, '2025-02-18 18:25:01', '1'),
(93, 500, 4, '2025-02-18 18:25:01', '1'),
(95, 490, 3, '2025-02-18 18:25:01', '1'),
(96, 497, 6, '2025-02-18 18:25:01', '1'),
(97, 479, 5, '2025-02-18 18:25:01', '1'),
(98, 221, 6, '2025-02-18 18:25:01', '1'),
(99, 335, 9, '2025-02-18 18:25:01', '1'),
(100, 198, 1, '2025-02-18 18:25:01', '1'),
(101, 301, 3, '2025-02-18 18:25:01', '1'),
(102, 460, 4, '2025-02-18 18:25:01', '1'),
(103, 339, 5, '2025-02-18 18:25:01', '1'),
(104, 306, 1, '2025-02-18 18:25:01', '1'),
(105, 191, 1, '2025-02-18 18:25:01', '1'),
(106, 61, 7, '2025-02-18 18:25:01', '1'),
(107, 305, 1, '2025-02-18 18:25:01', '1'),
(108, 181, 9, '2025-02-18 18:25:01', '1'),
(109, 133, 5, '2025-02-18 18:25:01', '1'),
(110, 342, 1, '2025-02-18 18:25:01', '1'),
(111, 30, 4, '2025-02-18 18:25:01', '1'),
(112, 245, 6, '2025-02-18 18:25:01', '1'),
(113, 407, 6, '2025-02-18 18:25:01', '1'),
(114, 222, 4, '2025-02-18 18:25:01', '1'),
(115, 324, 9, '2025-02-18 18:25:01', '1'),
(116, 445, 9, '2025-02-18 18:25:01', '1'),
(117, 105, 2, '2025-02-18 18:25:01', '1'),
(118, 219, 4, '2025-02-18 18:25:01', '1'),
(119, 179, 7, '2025-02-18 18:25:01', '1'),
(120, 255, 3, '2025-02-18 18:25:01', '1'),
(121, 108, 2, '2025-02-18 18:25:01', '1'),
(122, 18, 6, '2025-02-18 18:25:01', '1'),
(123, 367, 5, '2025-02-18 18:25:01', '1'),
(124, 19, 1, '2025-02-18 18:25:01', '1'),
(125, 490, 10, '2025-02-18 18:25:01', '1'),
(127, 97, 3, '2025-02-18 18:25:01', '1'),
(128, 446, 9, '2025-02-18 18:25:01', '1'),
(129, 462, 6, '2025-02-18 18:25:01', '1'),
(130, 393, 10, '2025-02-18 18:25:01', '1'),
(131, 142, 1, '2025-02-18 18:25:01', '1'),
(132, 306, 4, '2025-02-18 18:25:01', '1'),
(133, 69, 1, '2025-02-18 18:25:01', '1'),
(134, 236, 9, '2025-02-18 18:25:01', '1'),
(135, 109, 8, '2025-02-18 18:25:01', '1'),
(136, 88, 3, '2025-02-18 18:25:01', '1'),
(137, 23, 10, '2025-02-18 18:25:01', '1'),
(138, 325, 1, '2025-02-18 18:25:01', '1'),
(139, 67, 4, '2025-02-18 18:25:01', '1'),
(140, 372, 3, '2025-02-18 18:25:01', '1'),
(141, 244, 10, '2025-02-18 18:25:01', '1'),
(142, 350, 3, '2025-02-18 18:25:01', '1'),
(143, 176, 5, '2025-02-18 18:25:01', '1'),
(144, 78, 7, '2025-02-18 18:25:01', '1'),
(145, 389, 8, '2025-02-18 18:25:01', '1'),
(147, 368, 8, '2025-02-18 18:25:01', '1'),
(148, 91, 2, '2025-02-18 18:25:01', '1'),
(149, 140, 3, '2025-02-18 18:25:01', '1'),
(150, 497, 10, '2025-02-18 18:25:01', '1'),
(151, 273, 3, '2025-02-18 18:25:01', '1'),
(152, 169, 2, '2025-02-18 18:25:01', '1'),
(153, 13, 3, '2025-02-18 18:25:01', '1'),
(154, 48, 9, '2025-02-18 18:25:01', '1'),
(155, 31, 5, '2025-02-18 18:25:01', '1'),
(156, 134, 5, '2025-02-18 18:25:01', '1'),
(157, 476, 2, '2025-02-18 18:25:01', '1'),
(158, 197, 5, '2025-02-18 18:25:01', '1'),
(159, 401, 10, '2025-02-18 18:25:01', '1'),
(160, 65, 1, '2025-02-18 18:25:01', '1'),
(161, 150, 6, '2025-02-18 18:25:01', '1'),
(162, 10, 4, '2025-02-18 18:25:01', '1'),
(163, 423, 8, '2025-02-18 18:25:01', '1'),
(165, 234, 9, '2025-02-18 18:25:01', '1'),
(166, 464, 3, '2025-02-18 18:25:01', '1'),
(167, 328, 3, '2025-02-18 18:25:01', '1'),
(168, 476, 6, '2025-02-18 18:25:01', '1'),
(169, 382, 6, '2025-02-18 18:25:01', '1'),
(170, 75, 10, '2025-02-18 18:25:01', '1'),
(171, 318, 10, '2025-02-18 18:25:01', '1'),
(172, 296, 2, '2025-02-18 18:25:01', '1'),
(174, 493, 6, '2025-02-18 18:25:01', '1'),
(175, 298, 7, '2025-02-18 18:25:01', '1'),
(176, 381, 4, '2025-02-18 18:25:01', '1'),
(177, 27, 1, '2025-02-18 18:25:01', '1'),
(178, 107, 2, '2025-02-18 18:25:01', '1'),
(179, 172, 9, '2025-02-18 18:25:01', '1'),
(180, 12, 3, '2025-02-18 18:25:01', '1'),
(181, 235, 8, '2025-02-18 18:25:01', '1'),
(182, 321, 10, '2025-02-18 18:25:01', '1'),
(184, 325, 3, '2025-02-18 18:25:01', '1'),
(185, 96, 1, '2025-02-18 18:25:01', '1'),
(186, 12, 7, '2025-02-18 18:25:01', '1'),
(188, 434, 1, '2025-02-18 18:25:01', '1'),
(189, 20, 3, '2025-02-18 18:25:01', '1'),
(190, 79, 9, '2025-02-18 18:25:01', '1'),
(191, 472, 6, '2025-02-18 18:25:01', '1'),
(192, 399, 9, '2025-02-18 18:25:01', '1'),
(193, 296, 8, '2025-02-18 18:25:01', '1'),
(194, 386, 10, '2025-02-18 18:25:01', '1'),
(195, 84, 3, '2025-02-18 18:25:01', '1'),
(196, 123, 7, '2025-02-18 18:25:01', '1'),
(197, 40, 6, '2025-02-18 18:25:01', '1'),
(198, 457, 8, '2025-02-18 18:25:01', '1'),
(200, 49, 5, '2025-02-18 18:25:01', '1'),
(201, 182, 7, '2025-02-18 18:25:01', '1'),
(203, 287, 7, '2025-02-18 18:25:01', '1'),
(204, 324, 1, '2025-02-18 18:25:01', '1'),
(205, 169, 6, '2025-02-18 18:25:01', '1'),
(206, 73, 10, '2025-02-18 18:25:01', '1'),
(207, 91, 8, '2025-02-18 18:25:01', '1'),
(208, 345, 6, '2025-02-18 18:25:01', '1'),
(209, 484, 10, '2025-02-18 18:25:01', '1'),
(210, 283, 5, '2025-02-18 18:25:01', '1'),
(211, 481, 6, '2025-02-18 18:25:01', '1'),
(212, 397, 10, '2025-02-18 18:25:01', '1'),
(213, 442, 8, '2025-02-18 18:25:01', '1'),
(214, 175, 7, '2025-02-18 18:25:01', '1'),
(215, 214, 5, '2025-02-18 18:25:01', '1'),
(216, 68, 3, '2025-02-18 18:25:01', '1'),
(217, 167, 3, '2025-02-18 18:25:01', '1'),
(218, 225, 1, '2025-02-18 18:25:01', '1'),
(219, 130, 8, '2025-02-18 18:25:01', '1'),
(220, 103, 4, '2025-02-18 18:25:01', '1'),
(221, 130, 2, '2025-02-18 18:25:01', '1'),
(222, 494, 8, '2025-02-18 18:25:01', '1'),
(223, 267, 1, '2025-02-18 18:25:01', '1'),
(224, 271, 9, '2025-02-18 18:25:01', '1'),
(225, 462, 5, '2025-02-18 18:25:01', '1'),
(226, 64, 5, '2025-02-18 18:25:01', '1'),
(228, 330, 3, '2025-02-18 18:25:01', '1'),
(229, 220, 9, '2025-02-18 18:25:01', '1'),
(230, 418, 3, '2025-02-18 18:25:01', '1'),
(231, 29, 7, '2025-02-18 18:25:01', '1'),
(232, 80, 2, '2025-02-18 18:25:01', '1'),
(233, 5, 3, '2025-02-18 18:25:01', '1'),
(234, 117, 1, '2025-02-18 18:25:01', '1'),
(235, 435, 9, '2025-02-18 18:25:01', '1'),
(236, 52, 7, '2025-02-18 18:25:01', '1'),
(237, 216, 7, '2025-02-18 18:25:01', '1'),
(238, 256, 9, '2025-02-18 18:25:01', '1'),
(239, 430, 8, '2025-02-18 18:25:01', '1'),
(240, 331, 9, '2025-02-18 18:25:01', '1'),
(241, 456, 6, '2025-02-18 18:25:01', '1'),
(242, 423, 3, '2025-02-18 18:25:01', '1'),
(243, 207, 1, '2025-02-18 18:25:01', '1'),
(244, 88, 6, '2025-02-18 18:25:01', '1'),
(245, 275, 7, '2025-02-18 18:25:01', '1'),
(246, 359, 5, '2025-02-18 18:25:01', '1'),
(247, 186, 7, '2025-02-18 18:25:01', '1'),
(248, 242, 10, '2025-02-18 18:25:01', '1'),
(249, 73, 8, '2025-02-18 18:25:01', '1'),
(250, 450, 10, '2025-02-18 18:25:01', '1'),
(251, 190, 1, '2025-02-18 18:25:01', '1'),
(252, 25, 10, '2025-02-18 18:25:01', '1'),
(253, 139, 10, '2025-02-18 18:25:01', '1'),
(254, 431, 8, '2025-02-18 18:25:01', '1'),
(255, 67, 1, '2025-02-18 18:25:01', '1'),
(256, 117, 6, '2025-02-18 18:25:01', '1'),
(257, 173, 8, '2025-02-18 18:25:01', '1'),
(258, 96, 8, '2025-02-18 18:25:01', '1'),
(259, 429, 8, '2025-02-18 18:25:01', '1'),
(260, 140, 2, '2025-02-18 18:25:01', '1'),
(261, 474, 5, '2025-02-18 18:25:01', '1'),
(264, 452, 9, '2025-02-18 18:25:01', '1'),
(265, 241, 5, '2025-02-18 18:25:01', '1'),
(266, 393, 3, '2025-02-18 18:25:01', '1'),
(267, 354, 1, '2025-02-18 18:25:01', '1'),
(268, 171, 2, '2025-02-18 18:25:01', '1'),
(269, 150, 5, '2025-02-18 18:25:01', '1'),
(270, 488, 9, '2025-02-18 18:25:01', '1'),
(271, 427, 3, '2025-02-18 18:25:01', '1'),
(272, 139, 3, '2025-02-18 18:25:01', '1'),
(274, 459, 5, '2025-02-18 18:25:01', '1'),
(276, 496, 1, '2025-02-18 18:25:01', '1'),
(277, 24, 8, '2025-02-18 18:25:01', '1'),
(278, 6, 5, '2025-02-18 18:25:01', '1'),
(279, 371, 7, '2025-02-18 18:25:01', '1'),
(280, 90, 8, '2025-02-18 18:25:01', '1'),
(281, 351, 10, '2025-02-18 18:25:01', '1'),
(282, 258, 5, '2025-02-18 18:25:01', '1'),
(284, 200, 2, '2025-02-18 18:25:01', '1'),
(285, 324, 8, '2025-02-18 18:25:01', '1'),
(287, 158, 7, '2025-02-18 18:25:01', '1'),
(288, 57, 8, '2025-02-18 18:25:01', '1'),
(289, 321, 8, '2025-02-18 18:25:01', '1'),
(290, 127, 1, '2025-02-18 18:25:01', '1'),
(291, 459, 4, '2025-02-18 18:25:01', '1'),
(292, 466, 9, '2025-02-18 18:25:01', '1'),
(293, 262, 9, '2025-02-18 18:25:01', '1'),
(294, 346, 5, '2025-02-18 18:25:01', '1'),
(295, 410, 4, '2025-02-18 18:25:01', '1'),
(296, 44, 8, '2025-02-18 18:25:01', '1'),
(297, 422, 2, '2025-02-18 18:25:01', '1'),
(298, 219, 9, '2025-02-18 18:25:01', '1'),
(299, 354, 5, '2025-02-18 18:25:01', '1'),
(300, 87, 1, '2025-02-18 18:25:01', '1'),
(301, 328, 8, '2025-02-18 18:25:01', '1'),
(302, 500, 1, '2025-02-18 18:25:01', '1'),
(304, 449, 9, '2025-02-18 18:25:01', '1'),
(305, 53, 10, '2025-02-18 18:25:01', '1'),
(306, 288, 4, '2025-02-18 18:25:01', '1'),
(307, 457, 9, '2025-02-18 18:25:01', '1'),
(308, 97, 1, '2025-02-18 18:25:01', '1'),
(309, 114, 8, '2025-02-18 18:25:01', '1'),
(310, 477, 7, '2025-02-18 18:25:01', '1'),
(311, 206, 8, '2025-02-18 18:25:01', '1'),
(312, 309, 4, '2025-02-18 18:25:01', '1'),
(313, 162, 2, '2025-02-18 18:25:01', '1'),
(314, 77, 9, '2025-02-18 18:25:01', '1'),
(315, 228, 6, '2025-02-18 18:25:01', '1'),
(316, 143, 10, '2025-02-18 18:25:01', '1'),
(317, 176, 1, '2025-02-18 18:25:01', '1'),
(319, 39, 1, '2025-02-18 18:25:01', '1'),
(320, 62, 3, '2025-02-18 18:25:01', '1'),
(321, 201, 3, '2025-02-18 18:25:01', '1'),
(322, 491, 2, '2025-02-18 18:25:01', '1'),
(323, 346, 10, '2025-02-18 18:25:01', '1'),
(324, 56, 5, '2025-02-18 18:25:01', '1'),
(326, 176, 8, '2025-02-18 18:25:01', '1'),
(327, 124, 7, '2025-02-18 18:25:01', '1'),
(328, 252, 8, '2025-02-18 18:25:01', '1'),
(329, 46, 1, '2025-02-18 18:25:01', '1'),
(330, 358, 3, '2025-02-18 18:25:01', '1'),
(331, 5, 2, '2025-02-18 18:25:01', '1'),
(332, 215, 2, '2025-02-18 18:25:01', '1'),
(333, 54, 3, '2025-02-18 18:25:01', '1'),
(334, 429, 9, '2025-02-18 18:25:01', '1'),
(336, 101, 3, '2025-02-18 18:25:01', '1'),
(337, 108, 8, '2025-02-18 18:25:01', '1'),
(338, 33, 10, '2025-02-18 18:25:01', '1'),
(339, 392, 4, '2025-02-18 18:25:01', '1'),
(340, 70, 6, '2025-02-18 18:25:01', '1'),
(342, 404, 2, '2025-02-18 18:25:01', '1'),
(343, 190, 6, '2025-02-18 18:25:01', '1'),
(345, 483, 2, '2025-02-18 18:25:01', '1'),
(346, 64, 8, '2025-02-18 18:25:01', '1'),
(347, 248, 9, '2025-02-18 18:25:01', '1'),
(348, 155, 7, '2025-02-18 18:25:01', '1'),
(349, 395, 2, '2025-02-18 18:25:01', '1'),
(350, 232, 5, '2025-02-18 18:25:01', '1'),
(351, 402, 2, '2025-02-18 18:25:01', '1'),
(352, 106, 6, '2025-02-18 18:25:01', '1'),
(353, 118, 10, '2025-02-18 18:25:01', '1'),
(354, 386, 4, '2025-02-18 18:25:01', '1'),
(355, 342, 7, '2025-02-18 18:25:01', '1'),
(356, 53, 5, '2025-02-18 18:25:01', '1'),
(358, 302, 10, '2025-02-18 18:25:01', '1'),
(359, 439, 8, '2025-02-18 18:25:01', '1'),
(360, 69, 7, '2025-02-18 18:25:01', '1'),
(361, 476, 9, '2025-02-18 18:25:01', '1'),
(362, 380, 8, '2025-02-18 18:25:01', '1'),
(363, 327, 2, '2025-02-18 18:25:01', '1'),
(364, 48, 1, '2025-02-18 18:25:01', '1'),
(365, 143, 7, '2025-02-18 18:25:01', '1'),
(366, 177, 5, '2025-02-18 18:25:01', '1'),
(368, 151, 3, '2025-02-18 18:25:01', '1'),
(369, 303, 9, '2025-02-18 18:25:01', '1'),
(370, 22, 10, '2025-02-18 18:25:01', '1'),
(371, 376, 3, '2025-02-18 18:25:01', '1'),
(372, 148, 5, '2025-02-18 18:25:01', '1'),
(373, 285, 7, '2025-02-18 18:25:01', '1'),
(375, 441, 1, '2025-02-18 18:25:01', '1'),
(376, 202, 9, '2025-02-18 18:25:01', '1'),
(377, 348, 2, '2025-02-18 18:25:01', '1'),
(378, 179, 4, '2025-02-18 18:25:01', '1'),
(379, 427, 8, '2025-02-18 18:25:01', '1'),
(380, 262, 5, '2025-02-18 18:25:01', '1'),
(382, 274, 1, '2025-02-18 18:25:01', '1'),
(383, 491, 5, '2025-02-18 18:25:01', '1'),
(384, 52, 9, '2025-02-18 18:25:01', '1'),
(385, 248, 4, '2025-02-18 18:25:01', '1'),
(386, 403, 2, '2025-02-18 18:25:01', '1'),
(387, 197, 2, '2025-02-18 18:25:01', '1'),
(388, 255, 6, '2025-02-18 18:25:01', '1'),
(389, 113, 8, '2025-02-18 18:25:01', '1'),
(390, 124, 6, '2025-02-18 18:25:01', '1'),
(391, 1, 1, '2025-02-18 18:25:01', '1'),
(392, 268, 10, '2025-02-18 18:25:01', '1'),
(393, 409, 1, '2025-02-18 18:25:01', '1'),
(394, 23, 6, '2025-02-18 18:25:01', '1'),
(395, 348, 9, '2025-02-18 18:25:01', '1'),
(396, 120, 5, '2025-02-18 18:25:01', '1'),
(397, 336, 6, '2025-02-18 18:25:01', '1'),
(398, 306, 6, '2025-02-18 18:25:01', '1'),
(399, 101, 6, '2025-02-18 18:25:01', '1'),
(400, 199, 4, '2025-02-18 18:25:01', '1'),
(401, 332, 6, '2025-02-18 18:25:01', '1'),
(402, 152, 9, '2025-02-18 18:25:01', '1'),
(403, 82, 9, '2025-02-18 18:25:01', '1'),
(404, 60, 6, '2025-02-18 18:25:01', '1'),
(405, 8, 1, '2025-02-18 18:25:01', '1'),
(406, 77, 8, '2025-02-18 18:25:01', '1'),
(407, 392, 10, '2025-02-18 18:25:01', '1'),
(408, 258, 9, '2025-02-18 18:25:01', '1'),
(409, 327, 9, '2025-02-18 18:25:01', '1'),
(410, 189, 4, '2025-02-18 18:25:01', '1'),
(411, 452, 7, '2025-02-18 18:25:01', '1'),
(412, 17, 8, '2025-02-18 18:25:01', '1'),
(413, 393, 8, '2025-02-18 18:25:01', '1'),
(414, 398, 5, '2025-02-18 18:25:01', '1'),
(415, 70, 1, '2025-02-18 18:25:01', '1'),
(416, 62, 5, '2025-02-18 18:25:01', '1'),
(418, 271, 6, '2025-02-18 18:25:01', '1'),
(420, 489, 10, '2025-02-18 18:25:01', '1'),
(422, 419, 8, '2025-02-18 18:25:01', '1'),
(424, 3, 4, '2025-02-18 18:25:01', '1'),
(425, 320, 4, '2025-02-18 18:25:01', '1'),
(426, 448, 5, '2025-02-18 18:25:01', '1'),
(427, 389, 6, '2025-02-18 18:25:01', '1'),
(428, 195, 5, '2025-02-18 18:25:01', '1'),
(429, 410, 10, '2025-02-18 18:25:01', '1'),
(430, 79, 4, '2025-02-18 18:25:01', '1'),
(431, 55, 8, '2025-02-18 18:25:01', '1'),
(434, 271, 2, '2025-02-18 18:25:01', '1'),
(435, 106, 3, '2025-02-18 18:25:01', '1'),
(436, 198, 7, '2025-02-18 18:25:01', '1'),
(437, 294, 7, '2025-02-18 18:25:01', '1'),
(438, 212, 9, '2025-02-18 18:25:01', '1'),
(439, 345, 9, '2025-02-18 18:25:01', '1'),
(440, 458, 3, '2025-02-18 18:25:01', '1'),
(441, 33, 3, '2025-02-18 18:25:01', '1'),
(443, 378, 4, '2025-02-18 18:25:01', '1'),
(444, 298, 2, '2025-02-18 18:25:01', '1'),
(448, 473, 6, '2025-02-18 18:25:01', '1'),
(449, 205, 5, '2025-02-18 18:25:01', '1'),
(450, 65, 9, '2025-02-18 18:25:01', '1'),
(451, 364, 5, '2025-02-18 18:25:01', '1'),
(453, 393, 2, '2025-02-18 18:25:01', '1'),
(454, 164, 9, '2025-02-18 18:25:01', '1'),
(455, 248, 10, '2025-02-18 18:25:01', '1'),
(456, 422, 5, '2025-02-18 18:25:01', '1'),
(457, 145, 7, '2025-02-18 18:25:01', '1'),
(458, 284, 6, '2025-02-18 18:25:01', '1'),
(459, 316, 4, '2025-02-18 18:25:01', '1'),
(460, 185, 1, '2025-02-18 18:25:01', '1'),
(461, 212, 10, '2025-02-18 18:25:01', '1'),
(462, 257, 4, '2025-02-18 18:25:01', '1'),
(463, 421, 8, '2025-02-18 18:25:01', '1'),
(464, 333, 1, '2025-02-18 18:25:01', '1'),
(465, 254, 7, '2025-02-18 18:25:01', '1'),
(466, 397, 4, '2025-02-18 18:25:01', '1'),
(467, 239, 9, '2025-02-18 18:25:01', '1'),
(468, 45, 1, '2025-02-18 18:25:01', '1'),
(469, 390, 7, '2025-02-18 18:25:01', '1'),
(470, 142, 6, '2025-02-18 18:25:01', '1'),
(471, 24, 4, '2025-02-18 18:25:01', '1'),
(472, 150, 2, '2025-02-18 18:25:01', '1'),
(474, 432, 5, '2025-02-18 18:25:01', '1'),
(475, 27, 6, '2025-02-18 18:25:01', '1'),
(476, 222, 9, '2025-02-18 18:25:01', '1'),
(477, 161, 10, '2025-02-18 18:25:01', '1'),
(478, 444, 5, '2025-02-18 18:25:01', '1'),
(479, 99, 4, '2025-02-18 18:25:01', '1'),
(480, 455, 1, '2025-02-18 18:25:01', '1'),
(481, 3, 6, '2025-02-18 18:25:01', '1'),
(483, 282, 6, '2025-02-18 18:25:01', '1'),
(484, 473, 1, '2025-02-18 18:25:01', '1'),
(485, 207, 10, '2025-02-18 18:25:01', '1'),
(486, 446, 4, '2025-02-18 18:25:01', '1'),
(487, 35, 10, '2025-02-18 18:25:01', '1'),
(488, 388, 7, '2025-02-18 18:25:01', '1'),
(490, 33, 6, '2025-02-18 18:25:01', '1'),
(491, 18, 2, '2025-02-18 18:25:01', '1'),
(492, 232, 9, '2025-02-18 18:25:01', '1'),
(493, 189, 8, '2025-02-18 18:25:01', '1'),
(495, 158, 3, '2025-02-18 18:25:01', '1'),
(496, 471, 10, '2025-02-18 18:25:01', '1'),
(499, 473, 8, '2025-02-18 18:25:01', '1'),
(500, 338, 6, '2025-02-18 18:25:01', '1'),
(501, 464, 9, '2025-02-18 18:25:01', '1'),
(502, 292, 1, '2025-02-18 18:25:01', '1'),
(503, 104, 2, '2025-02-18 18:25:01', '1'),
(505, 399, 6, '2025-02-18 18:25:01', '1'),
(506, 497, 3, '2025-02-18 18:25:01', '1'),
(507, 83, 3, '2025-02-18 18:25:01', '1'),
(508, 269, 3, '2025-02-18 18:25:01', '1'),
(510, 242, 3, '2025-02-18 18:25:01', '1'),
(511, 115, 9, '2025-02-18 18:25:01', '1'),
(512, 176, 7, '2025-02-18 18:25:01', '1'),
(513, 97, 6, '2025-02-18 18:25:01', '1'),
(514, 31, 10, '2025-02-18 18:25:01', '1'),
(517, 272, 4, '2025-02-18 18:25:01', '1'),
(518, 211, 10, '2025-02-18 18:25:01', '1'),
(519, 12, 9, '2025-02-18 18:25:01', '1'),
(520, 401, 2, '2025-02-18 18:25:01', '1'),
(521, 321, 9, '2025-02-18 18:25:01', '1'),
(522, 484, 3, '2025-02-18 18:25:01', '1'),
(523, 28, 8, '2025-02-18 18:25:01', '1'),
(525, 411, 4, '2025-02-18 18:25:01', '1'),
(527, 11, 3, '2025-02-18 18:25:01', '1'),
(528, 119, 1, '2025-02-18 18:25:01', '1'),
(529, 41, 8, '2025-02-18 18:25:01', '1'),
(530, 160, 9, '2025-02-18 18:25:01', '1'),
(531, 450, 5, '2025-02-18 18:25:01', '1'),
(532, 320, 9, '2025-02-18 18:25:01', '1'),
(533, 194, 9, '2025-02-18 18:25:01', '1'),
(534, 365, 4, '2025-02-18 18:25:01', '1'),
(535, 160, 4, '2025-02-18 18:25:01', '1'),
(536, 91, 7, '2025-02-18 18:25:01', '1'),
(537, 278, 5, '2025-02-18 18:25:01', '1'),
(538, 479, 7, '2025-02-18 18:25:01', '1'),
(539, 37, 7, '2025-02-18 18:25:01', '1'),
(540, 91, 6, '2025-02-18 18:25:01', '1'),
(541, 304, 3, '2025-02-18 18:25:01', '1'),
(542, 224, 10, '2025-02-18 18:25:01', '1'),
(543, 388, 8, '2025-02-18 18:25:01', '1'),
(544, 355, 2, '2025-02-18 18:25:01', '1'),
(545, 238, 6, '2025-02-18 18:25:01', '1'),
(546, 110, 7, '2025-02-18 18:25:01', '1'),
(547, 394, 8, '2025-02-18 18:25:01', '1'),
(548, 152, 6, '2025-02-18 18:25:01', '1'),
(550, 159, 3, '2025-02-18 18:25:01', '1'),
(551, 34, 9, '2025-02-18 18:25:01', '1'),
(552, 277, 2, '2025-02-18 18:25:01', '1'),
(553, 59, 10, '2025-02-18 18:25:01', '1'),
(554, 426, 3, '2025-02-18 18:25:01', '1'),
(555, 16, 10, '2025-02-18 18:25:01', '1'),
(556, 398, 8, '2025-02-18 18:25:01', '1'),
(558, 498, 5, '2025-02-18 18:25:01', '1'),
(559, 185, 8, '2025-02-18 18:25:01', '1'),
(562, 31, 2, '2025-02-18 18:25:01', '1'),
(563, 402, 8, '2025-02-18 18:25:01', '1'),
(564, 415, 1, '2025-02-18 18:25:01', '1'),
(566, 407, 10, '2025-02-18 18:25:01', '1'),
(567, 455, 2, '2025-02-18 18:25:01', '1'),
(568, 5, 6, '2025-02-18 18:25:01', '1'),
(569, 184, 3, '2025-02-18 18:25:01', '1'),
(570, 231, 3, '2025-02-18 18:25:01', '1'),
(571, 149, 3, '2025-02-18 18:25:01', '1'),
(572, 108, 7, '2025-02-18 18:25:01', '1'),
(573, 138, 6, '2025-02-18 18:25:01', '1'),
(574, 210, 2, '2025-02-18 18:25:01', '1'),
(575, 101, 9, '2025-02-18 18:25:01', '1'),
(577, 268, 4, '2025-02-18 18:25:01', '1'),
(578, 434, 10, '2025-02-18 18:25:01', '1'),
(579, 87, 8, '2025-02-18 18:25:01', '1'),
(580, 337, 4, '2025-02-18 18:25:01', '1'),
(581, 43, 8, '2025-02-18 18:25:01', '1'),
(582, 304, 7, '2025-02-18 18:25:01', '1'),
(583, 307, 5, '2025-02-18 18:25:01', '1'),
(584, 200, 10, '2025-02-18 18:25:01', '1'),
(585, 146, 2, '2025-02-18 18:25:01', '1'),
(587, 211, 6, '2025-02-18 18:25:01', '1'),
(588, 280, 8, '2025-02-18 18:25:01', '1'),
(589, 449, 7, '2025-02-18 18:25:01', '1'),
(590, 115, 6, '2025-02-18 18:25:01', '1'),
(591, 226, 1, '2025-02-18 18:25:01', '1'),
(592, 472, 7, '2025-02-18 18:25:01', '1'),
(593, 170, 3, '2025-02-18 18:25:01', '1'),
(594, 459, 7, '2025-02-18 18:25:01', '1'),
(595, 94, 2, '2025-02-18 18:25:01', '1'),
(596, 493, 7, '2025-02-18 18:25:01', '1'),
(597, 42, 6, '2025-02-18 18:25:01', '1'),
(598, 430, 9, '2025-02-18 18:25:01', '1'),
(600, 448, 3, '2025-02-18 18:25:01', '1'),
(601, 309, 7, '2025-02-18 18:25:01', '1'),
(602, 406, 8, '2025-02-18 18:25:01', '1'),
(603, 51, 4, '2025-02-18 18:25:01', '1'),
(604, 170, 7, '2025-02-18 18:25:01', '1'),
(605, 270, 1, '2025-02-18 18:25:01', '1'),
(606, 264, 5, '2025-02-18 18:25:01', '1'),
(607, 160, 5, '2025-02-18 18:25:01', '1'),
(608, 312, 9, '2025-02-18 18:25:01', '1'),
(609, 17, 10, '2025-02-18 18:25:01', '1'),
(610, 1, 4, '2025-02-18 18:25:01', '1'),
(611, 426, 4, '2025-02-18 18:25:01', '1'),
(612, 380, 3, '2025-02-18 18:25:01', '1'),
(614, 157, 5, '2025-02-18 18:25:01', '1'),
(616, 451, 3, '2025-02-18 18:25:01', '1'),
(617, 461, 3, '2025-02-18 18:25:01', '1'),
(618, 474, 7, '2025-02-18 18:25:01', '1'),
(619, 224, 5, '2025-02-18 18:25:01', '1'),
(620, 416, 8, '2025-02-18 18:25:01', '1'),
(621, 132, 5, '2025-02-18 18:25:01', '1'),
(622, 335, 5, '2025-02-18 18:25:01', '1'),
(623, 37, 9, '2025-02-18 18:25:01', '1'),
(624, 338, 3, '2025-02-18 18:25:01', '1'),
(625, 76, 9, '2025-02-18 18:25:01', '1'),
(627, 435, 10, '2025-02-18 18:25:01', '1'),
(629, 500, 10, '2025-02-18 18:25:01', '1'),
(631, 19, 7, '2025-02-18 18:25:01', '1'),
(632, 445, 8, '2025-02-18 18:25:01', '1'),
(633, 499, 3, '2025-02-18 18:25:01', '1'),
(634, 346, 3, '2025-02-18 18:25:01', '1'),
(635, 457, 6, '2025-02-18 18:25:01', '1'),
(636, 362, 9, '2025-02-18 18:25:01', '1'),
(638, 237, 9, '2025-02-18 18:25:01', '1'),
(639, 155, 5, '2025-02-18 18:25:01', '1'),
(640, 20, 1, '2025-02-18 18:25:01', '1'),
(641, 369, 5, '2025-02-18 18:25:01', '1'),
(642, 428, 6, '2025-02-18 18:25:01', '1'),
(643, 266, 4, '2025-02-18 18:25:01', '1'),
(644, 281, 5, '2025-02-18 18:25:01', '1'),
(645, 99, 7, '2025-02-18 18:25:01', '1'),
(646, 484, 8, '2025-02-18 18:25:01', '1'),
(647, 115, 8, '2025-02-18 18:25:01', '1'),
(648, 124, 3, '2025-02-18 18:25:01', '1'),
(649, 416, 4, '2025-02-18 18:25:01', '1'),
(650, 53, 4, '2025-02-18 18:25:01', '1'),
(651, 85, 3, '2025-02-18 18:25:01', '1'),
(652, 52, 4, '2025-02-18 18:25:01', '1'),
(653, 123, 2, '2025-02-18 18:25:01', '1'),
(654, 94, 1, '2025-02-18 18:25:01', '1'),
(655, 208, 5, '2025-02-18 18:25:01', '1'),
(656, 106, 4, '2025-02-18 18:25:01', '1'),
(658, 173, 9, '2025-02-18 18:25:01', '1'),
(659, 430, 10, '2025-02-18 18:25:01', '1'),
(660, 164, 7, '2025-02-18 18:25:01', '1'),
(662, 278, 9, '2025-02-18 18:25:01', '1'),
(663, 454, 7, '2025-02-18 18:25:01', '1'),
(664, 340, 9, '2025-02-18 18:25:01', '1'),
(665, 366, 4, '2025-02-18 18:25:01', '1'),
(666, 223, 8, '2025-02-18 18:25:01', '1'),
(667, 472, 1, '2025-02-18 18:25:01', '1'),
(669, 472, 8, '2025-02-18 18:25:01', '1'),
(670, 312, 1, '2025-02-18 18:25:01', '1'),
(672, 196, 8, '2025-02-18 18:25:01', '1'),
(673, 206, 6, '2025-02-18 18:25:01', '1'),
(674, 343, 4, '2025-02-18 18:25:01', '1'),
(677, 68, 10, '2025-02-18 18:25:01', '1'),
(679, 299, 1, '2025-02-18 18:25:01', '1'),
(680, 136, 3, '2025-02-18 18:25:01', '1'),
(681, 437, 8, '2025-02-18 18:25:01', '1'),
(682, 15, 8, '2025-02-18 18:25:01', '1'),
(683, 278, 3, '2025-02-18 18:25:01', '1'),
(685, 403, 3, '2025-02-18 18:25:01', '1'),
(687, 166, 1, '2025-02-18 18:25:01', '1'),
(688, 32, 10, '2025-02-18 18:25:01', '1'),
(690, 352, 8, '2025-02-18 18:25:01', '1'),
(691, 469, 4, '2025-02-18 18:25:01', '1'),
(692, 26, 4, '2025-02-18 18:25:01', '1'),
(693, 131, 10, '2025-02-18 18:25:01', '1'),
(694, 247, 10, '2025-02-18 18:25:01', '1'),
(695, 486, 8, '2025-02-18 18:25:01', '1'),
(696, 43, 3, '2025-02-18 18:25:01', '1'),
(697, 405, 6, '2025-02-18 18:25:01', '1'),
(698, 191, 6, '2025-02-18 18:25:01', '1'),
(699, 69, 9, '2025-02-18 18:25:01', '1'),
(700, 94, 8, '2025-02-18 18:25:01', '1'),
(701, 445, 3, '2025-02-18 18:25:01', '1'),
(702, 425, 4, '2025-02-18 18:25:01', '1'),
(703, 264, 10, '2025-02-18 18:25:01', '1'),
(704, 386, 1, '2025-02-18 18:25:01', '1'),
(705, 447, 2, '2025-02-18 18:25:01', '1'),
(707, 446, 3, '2025-02-18 18:25:01', '1'),
(708, 67, 7, '2025-02-18 18:25:01', '1'),
(709, 500, 7, '2025-02-18 18:25:01', '1'),
(710, 122, 1, '2025-02-18 18:25:01', '1'),
(711, 279, 8, '2025-02-18 18:25:01', '1'),
(712, 285, 1, '2025-02-18 18:25:01', '1'),
(713, 363, 8, '2025-02-18 18:25:01', '1'),
(714, 262, 3, '2025-02-18 18:25:01', '1'),
(715, 160, 6, '2025-02-18 18:25:01', '1'),
(716, 86, 4, '2025-02-18 18:25:01', '1'),
(717, 348, 4, '2025-02-18 18:25:01', '1'),
(718, 317, 4, '2025-02-18 18:25:01', '1'),
(719, 342, 5, '2025-02-18 18:25:01', '1'),
(720, 244, 3, '2025-02-18 18:25:01', '1'),
(722, 418, 2, '2025-02-18 18:25:01', '1'),
(724, 455, 4, '2025-02-18 18:25:01', '1'),
(726, 277, 1, '2025-02-18 18:25:01', '1'),
(728, 66, 9, '2025-02-18 18:25:01', '1'),
(731, 443, 8, '2025-02-18 18:25:01', '1'),
(732, 462, 10, '2025-02-18 18:25:01', '1'),
(733, 165, 5, '2025-02-18 18:25:01', '1'),
(734, 224, 4, '2025-02-18 18:25:01', '1'),
(735, 353, 3, '2025-02-18 18:25:01', '1'),
(737, 496, 6, '2025-02-18 18:25:01', '1'),
(738, 405, 8, '2025-02-18 18:25:01', '1'),
(739, 269, 9, '2025-02-18 18:25:01', '1'),
(740, 335, 1, '2025-02-18 18:25:01', '1'),
(741, 246, 5, '2025-02-18 18:25:01', '1'),
(742, 288, 10, '2025-02-18 18:25:01', '1'),
(743, 168, 7, '2025-02-18 18:25:01', '1'),
(745, 245, 2, '2025-02-18 18:25:01', '1'),
(747, 259, 3, '2025-02-18 18:25:01', '1'),
(748, 167, 10, '2025-02-18 18:25:01', '1'),
(749, 347, 6, '2025-02-18 18:25:01', '1'),
(752, 74, 6, '2025-02-18 18:25:01', '1'),
(753, 228, 8, '2025-02-18 18:25:01', '1'),
(754, 492, 10, '2025-02-18 18:25:01', '1'),
(755, 349, 6, '2025-02-18 18:25:01', '1'),
(756, 391, 1, '2025-02-18 18:25:01', '1'),
(757, 472, 5, '2025-02-18 18:25:01', '1'),
(758, 265, 2, '2025-02-18 18:25:01', '1'),
(759, 192, 1, '2025-02-18 18:25:01', '1'),
(760, 239, 5, '2025-02-18 18:25:01', '1'),
(761, 280, 6, '2025-02-18 18:25:01', '1'),
(762, 490, 9, '2025-02-18 18:25:01', '1'),
(763, 431, 4, '2025-02-18 18:25:01', '1'),
(764, 96, 7, '2025-02-18 18:25:01', '1'),
(765, 443, 5, '2025-02-18 18:25:01', '1'),
(766, 227, 6, '2025-02-18 18:25:01', '1'),
(767, 375, 6, '2025-02-18 18:25:01', '1'),
(768, 203, 8, '2025-02-18 18:25:01', '1'),
(770, 153, 6, '2025-02-18 18:25:01', '1'),
(771, 208, 2, '2025-02-18 18:25:01', '1'),
(772, 96, 3, '2025-02-18 18:25:01', '1'),
(773, 482, 10, '2025-02-18 18:25:01', '1'),
(774, 336, 10, '2025-02-18 18:25:01', '1'),
(775, 226, 10, '2025-02-18 18:25:01', '1'),
(776, 74, 2, '2025-02-18 18:25:01', '1'),
(777, 164, 3, '2025-02-18 18:25:01', '1'),
(778, 174, 5, '2025-02-18 18:25:01', '1'),
(779, 333, 5, '2025-02-18 18:25:01', '1'),
(780, 481, 9, '2025-02-18 18:25:01', '1'),
(781, 242, 2, '2025-02-18 18:25:01', '1'),
(782, 257, 9, '2025-02-18 18:25:01', '1'),
(783, 390, 5, '2025-02-18 18:25:01', '1'),
(786, 242, 8, '2025-02-18 18:25:01', '1'),
(787, 262, 1, '2025-02-18 18:25:01', '1'),
(788, 90, 7, '2025-02-18 18:25:01', '1'),
(789, 251, 4, '2025-02-18 18:25:01', '1'),
(791, 54, 5, '2025-02-18 18:25:01', '1'),
(793, 155, 2, '2025-02-18 18:25:01', '1'),
(795, 319, 8, '2025-02-18 18:25:01', '1'),
(796, 279, 7, '2025-02-18 18:25:01', '1'),
(797, 191, 2, '2025-02-18 18:25:01', '1'),
(798, 153, 2, '2025-02-18 18:25:01', '1'),
(799, 113, 6, '2025-02-18 18:25:01', '1'),
(800, 452, 1, '2025-02-18 18:25:01', '1'),
(801, 405, 2, '2025-02-18 18:25:01', '1'),
(802, 475, 3, '2025-02-18 18:25:01', '1'),
(803, 43, 2, '2025-02-18 18:25:01', '1'),
(804, 435, 4, '2025-02-18 18:25:01', '1'),
(805, 215, 3, '2025-02-18 18:25:01', '1'),
(806, 204, 2, '2025-02-18 18:25:01', '1'),
(807, 167, 5, '2025-02-18 18:25:01', '1'),
(808, 108, 4, '2025-02-18 18:25:01', '1'),
(809, 328, 10, '2025-02-18 18:25:01', '1'),
(810, 309, 10, '2025-02-18 18:25:01', '1'),
(811, 374, 3, '2025-02-18 18:25:01', '1'),
(813, 63, 8, '2025-02-18 18:25:01', '1'),
(814, 217, 2, '2025-02-18 18:25:01', '1'),
(815, 319, 10, '2025-02-18 18:25:01', '1'),
(816, 53, 7, '2025-02-18 18:25:01', '1'),
(817, 61, 2, '2025-02-18 18:25:01', '1'),
(818, 56, 6, '2025-02-18 18:25:01', '1'),
(819, 475, 10, '2025-02-18 18:25:01', '1'),
(820, 349, 4, '2025-02-18 18:25:01', '1'),
(821, 496, 2, '2025-02-18 18:25:01', '1'),
(822, 97, 9, '2025-02-18 18:25:01', '1'),
(823, 310, 5, '2025-02-18 18:25:01', '1'),
(824, 423, 2, '2025-02-18 18:25:01', '1'),
(825, 9, 1, '2025-02-18 18:25:01', '1'),
(826, 244, 1, '2025-02-18 18:25:01', '1'),
(827, 283, 2, '2025-02-18 18:25:01', '1'),
(828, 145, 5, '2025-02-18 18:25:01', '1'),
(829, 306, 3, '2025-02-18 18:25:01', '1'),
(831, 156, 3, '2025-02-18 18:25:01', '1'),
(832, 477, 10, '2025-02-18 18:25:01', '1'),
(833, 216, 2, '2025-02-18 18:25:01', '1'),
(834, 12, 4, '2025-02-18 18:25:01', '1'),
(835, 432, 2, '2025-02-18 18:25:01', '1'),
(836, 268, 3, '2025-02-18 18:25:01', '1'),
(837, 10, 10, '2025-02-18 18:25:01', '1'),
(838, 160, 2, '2025-02-18 18:25:01', '1'),
(839, 385, 4, '2025-02-18 18:25:01', '1'),
(840, 222, 1, '2025-02-18 18:25:01', '1'),
(841, 344, 1, '2025-02-18 18:25:01', '1'),
(842, 297, 6, '2025-02-18 18:25:01', '1'),
(843, 407, 1, '2025-02-18 18:25:01', '1'),
(845, 355, 1, '2025-02-18 18:25:01', '1'),
(846, 167, 4, '2025-02-18 18:25:01', '1'),
(847, 381, 9, '2025-02-18 18:25:01', '1'),
(849, 141, 10, '2025-02-18 18:25:01', '1'),
(850, 18, 9, '2025-02-18 18:25:01', '1'),
(851, 493, 5, '2025-02-18 18:25:01', '1'),
(852, 373, 4, '2025-02-18 18:25:01', '1'),
(853, 345, 3, '2025-02-18 18:25:01', '1'),
(854, 35, 9, '2025-02-18 18:25:01', '1'),
(855, 402, 9, '2025-02-18 18:25:01', '1'),
(856, 382, 7, '2025-02-18 18:25:01', '1'),
(857, 233, 4, '2025-02-18 18:25:01', '1'),
(858, 207, 9, '2025-02-18 18:25:01', '1'),
(859, 294, 6, '2025-02-18 18:25:01', '1'),
(860, 104, 4, '2025-02-18 18:25:01', '1'),
(862, 209, 7, '2025-02-18 18:25:01', '1'),
(863, 10, 9, '2025-02-18 18:25:01', '1'),
(864, 392, 8, '2025-02-18 18:25:01', '1'),
(865, 243, 4, '2025-02-18 18:25:01', '1'),
(866, 447, 3, '2025-02-18 18:25:01', '1'),
(868, 288, 2, '2025-02-18 18:25:01', '1'),
(869, 488, 8, '2025-02-18 18:25:01', '1'),
(870, 42, 10, '2025-02-18 18:25:01', '1'),
(871, 252, 7, '2025-02-18 18:25:01', '1'),
(872, 451, 1, '2025-02-18 18:25:01', '1'),
(873, 363, 6, '2025-02-18 18:25:01', '1'),
(874, 59, 4, '2025-02-18 18:25:01', '1'),
(875, 368, 5, '2025-02-18 18:25:01', '1'),
(876, 383, 8, '2025-02-18 18:25:01', '1'),
(877, 419, 2, '2025-02-18 18:25:01', '1'),
(878, 465, 7, '2025-02-18 18:25:01', '1'),
(879, 80, 3, '2025-02-18 18:25:01', '1'),
(880, 197, 10, '2025-02-18 18:25:01', '1'),
(881, 274, 10, '2025-02-18 18:25:01', '1'),
(882, 55, 4, '2025-02-18 18:25:01', '1'),
(883, 381, 1, '2025-02-18 18:25:01', '1'),
(884, 46, 7, '2025-02-18 18:25:01', '1'),
(885, 266, 2, '2025-02-18 18:25:01', '1'),
(887, 229, 6, '2025-02-18 18:25:01', '1'),
(888, 215, 4, '2025-02-18 18:25:01', '1'),
(889, 443, 4, '2025-02-18 18:25:01', '1'),
(890, 98, 9, '2025-02-18 18:25:01', '1'),
(891, 177, 2, '2025-02-18 18:25:01', '1'),
(892, 364, 9, '2025-02-18 18:25:01', '1'),
(893, 286, 1, '2025-02-18 18:25:01', '1'),
(894, 483, 5, '2025-02-18 18:25:01', '1'),
(895, 390, 8, '2025-02-18 18:25:01', '1'),
(896, 12, 10, '2025-02-18 18:25:01', '1'),
(897, 329, 2, '2025-02-18 18:25:01', '1'),
(899, 141, 2, '2025-02-18 18:25:01', '1'),
(900, 149, 10, '2025-02-18 18:25:01', '1'),
(901, 452, 10, '2025-02-18 18:25:01', '1'),
(902, 455, 9, '2025-02-18 18:25:01', '1'),
(903, 106, 1, '2025-02-18 18:25:01', '1'),
(904, 235, 10, '2025-02-18 18:25:01', '1'),
(905, 383, 10, '2025-02-18 18:25:01', '1'),
(906, 11, 7, '2025-02-18 18:25:01', '1'),
(908, 128, 4, '2025-02-18 18:25:01', '1'),
(910, 274, 7, '2025-02-18 18:25:01', '1'),
(911, 318, 8, '2025-02-18 18:25:01', '1'),
(912, 168, 9, '2025-02-18 18:25:01', '1'),
(913, 263, 8, '2025-02-18 18:25:01', '1'),
(914, 463, 3, '2025-02-18 18:25:01', '1'),
(915, 246, 2, '2025-02-18 18:25:01', '1'),
(916, 195, 1, '2025-02-18 18:25:01', '1'),
(918, 492, 2, '2025-02-18 18:25:01', '1'),
(919, 230, 6, '2025-02-18 18:25:01', '1'),
(920, 244, 8, '2025-02-18 18:25:01', '1'),
(921, 105, 5, '2025-02-18 18:25:01', '1'),
(922, 473, 10, '2025-02-18 18:25:01', '1'),
(923, 353, 10, '2025-02-18 18:25:01', '1'),
(924, 133, 6, '2025-02-18 18:25:01', '1'),
(926, 321, 5, '2025-02-18 18:25:01', '1'),
(927, 116, 3, '2025-02-18 18:25:01', '1'),
(928, 416, 6, '2025-02-18 18:25:01', '1'),
(929, 114, 4, '2025-02-18 18:25:01', '1'),
(930, 137, 8, '2025-02-18 18:25:01', '1'),
(931, 360, 4, '2025-02-18 18:25:01', '1'),
(932, 180, 6, '2025-02-18 18:25:01', '1'),
(933, 102, 5, '2025-02-18 18:25:01', '1'),
(934, 39, 3, '2025-02-18 18:25:01', '1'),
(936, 378, 3, '2025-02-18 18:25:01', '1'),
(937, 16, 5, '2025-02-18 18:25:01', '1'),
(939, 293, 2, '2025-02-18 18:25:01', '1'),
(940, 9, 3, '2025-02-18 18:25:01', '1'),
(941, 14, 8, '2025-02-18 18:25:01', '1'),
(942, 239, 7, '2025-02-18 18:25:01', '1'),
(943, 110, 9, '2025-02-18 18:25:01', '1'),
(944, 431, 2, '2025-02-18 18:25:01', '1'),
(945, 123, 1, '2025-02-18 18:25:01', '1'),
(946, 380, 1, '2025-02-18 18:25:01', '1'),
(947, 404, 5, '2025-02-18 18:25:01', '1'),
(948, 178, 8, '2025-02-18 18:25:01', '1'),
(949, 181, 7, '2025-02-18 18:25:01', '1'),
(950, 122, 10, '2025-02-18 18:25:01', '1'),
(951, 312, 7, '2025-02-18 18:25:01', '1'),
(953, 27, 7, '2025-02-18 18:25:01', '1'),
(955, 290, 7, '2025-02-18 18:25:01', '1'),
(956, 228, 10, '2025-02-18 18:25:01', '1'),
(957, 330, 6, '2025-02-18 18:25:01', '1'),
(959, 283, 6, '2025-02-18 18:25:01', '1'),
(961, 447, 4, '2025-02-18 18:25:01', '1'),
(962, 366, 10, '2025-02-18 18:25:01', '1'),
(963, 460, 10, '2025-02-18 18:25:01', '1'),
(964, 479, 6, '2025-02-18 18:25:01', '1'),
(965, 35, 2, '2025-02-18 18:25:01', '1'),
(966, 121, 7, '2025-02-18 18:25:01', '1'),
(967, 132, 3, '2025-02-18 18:25:01', '1'),
(969, 311, 2, '2025-02-18 18:25:01', '1'),
(970, 146, 1, '2025-02-18 18:25:01', '1'),
(971, 119, 10, '2025-02-18 18:25:01', '1'),
(973, 297, 9, '2025-02-18 18:25:01', '1'),
(974, 492, 1, '2025-02-18 18:25:01', '1'),
(975, 195, 3, '2025-02-18 18:25:01', '1'),
(976, 20, 8, '2025-02-18 18:25:01', '1'),
(977, 175, 1, '2025-02-18 18:25:01', '1'),
(978, 482, 8, '2025-02-18 18:25:01', '1'),
(979, 193, 9, '2025-02-18 18:25:01', '1'),
(980, 203, 10, '2025-02-18 18:25:01', '1'),
(981, 283, 10, '2025-02-18 18:25:01', '1'),
(982, 329, 4, '2025-02-18 18:25:01', '1'),
(983, 88, 1, '2025-02-18 18:25:01', '1'),
(985, 48, 2, '2025-02-18 18:25:01', '1'),
(986, 268, 7, '2025-02-18 18:25:01', '1'),
(987, 98, 4, '2025-02-18 18:25:01', '1'),
(988, 94, 6, '2025-02-18 18:25:01', '1'),
(989, 349, 3, '2025-02-18 18:25:01', '1'),
(990, 188, 9, '2025-02-18 18:25:01', '1'),
(991, 375, 10, '2025-02-18 18:25:01', '1'),
(992, 363, 7, '2025-02-18 18:25:01', '1'),
(993, 260, 1, '2025-02-18 18:25:01', '1'),
(995, 196, 4, '2025-02-18 18:25:01', '1'),
(996, 68, 1, '2025-02-18 18:25:01', '1'),
(997, 233, 7, '2025-02-18 18:25:01', '1'),
(998, 263, 5, '2025-02-18 18:25:01', '1'),
(999, 487, 9, '2025-02-18 18:25:01', '1'),
(1001, 285, 5, '2025-02-18 18:25:01', '1'),
(1002, 106, 7, '2025-02-18 18:25:01', '1'),
(1003, 61, 5, '2025-02-18 18:25:01', '1'),
(1004, 259, 5, '2025-02-18 18:25:01', '1'),
(1005, 213, 6, '2025-02-18 18:25:01', '1'),
(1006, 64, 1, '2025-02-18 18:25:01', '1'),
(1007, 258, 10, '2025-02-18 18:25:01', '1'),
(1008, 190, 2, '2025-02-18 18:25:01', '1'),
(1009, 177, 8, '2025-02-18 18:25:01', '1'),
(1011, 351, 7, '2025-02-18 18:25:01', '1'),
(1013, 189, 2, '2025-02-18 18:25:01', '1'),
(1014, 361, 5, '2025-02-18 18:25:01', '1'),
(1015, 86, 2, '2025-02-18 18:25:01', '1'),
(1016, 354, 9, '2025-02-18 18:25:01', '1'),
(1017, 250, 7, '2025-02-18 18:25:01', '1'),
(1018, 433, 2, '2025-02-18 18:25:01', '1'),
(1019, 368, 6, '2025-02-18 18:25:01', '1'),
(1020, 237, 7, '2025-02-18 18:25:01', '1'),
(1021, 128, 1, '2025-02-18 18:25:01', '1'),
(1024, 497, 4, '2025-02-18 18:25:01', '1'),
(1025, 341, 8, '2025-02-18 18:25:01', '1'),
(1026, 51, 9, '2025-02-18 18:25:01', '1'),
(1027, 329, 9, '2025-02-18 18:25:01', '1'),
(1028, 193, 2, '2025-02-18 18:25:01', '1'),
(1030, 377, 6, '2025-02-18 18:25:01', '1'),
(1031, 492, 7, '2025-02-18 18:25:01', '1'),
(1032, 167, 6, '2025-02-18 18:25:01', '1'),
(1034, 262, 8, '2025-02-18 18:25:01', '1'),
(1035, 19, 2, '2025-02-18 18:25:01', '1'),
(1036, 457, 3, '2025-02-18 18:25:01', '1'),
(1037, 193, 5, '2025-02-18 18:25:01', '1'),
(1040, 108, 6, '2025-02-18 18:25:01', '1'),
(1041, 188, 4, '2025-02-18 18:25:01', '1'),
(1042, 229, 2, '2025-02-18 18:25:01', '1'),
(1043, 208, 8, '2025-02-18 18:25:01', '1'),
(1044, 305, 10, '2025-02-18 18:25:01', '1'),
(1045, 280, 7, '2025-02-18 18:25:01', '1'),
(1046, 396, 1, '2025-02-18 18:25:01', '1'),
(1049, 52, 5, '2025-02-18 18:25:01', '1'),
(1050, 249, 8, '2025-02-18 18:25:01', '1'),
(1051, 390, 2, '2025-02-18 18:25:01', '1'),
(1052, 471, 7, '2025-02-18 18:25:01', '1'),
(1053, 159, 10, '2025-02-18 18:25:01', '1'),
(1054, 15, 7, '2025-02-18 18:25:01', '1'),
(1056, 289, 7, '2025-02-18 18:25:01', '1'),
(1057, 101, 4, '2025-02-18 18:25:01', '1'),
(1058, 141, 8, '2025-02-18 18:25:01', '1'),
(1059, 57, 9, '2025-02-18 18:25:01', '1'),
(1062, 94, 7, '2025-02-18 18:25:01', '1'),
(1063, 135, 7, '2025-02-18 18:25:01', '1'),
(1066, 463, 10, '2025-02-18 18:25:01', '1'),
(1067, 452, 3, '2025-02-18 18:25:01', '1'),
(1068, 458, 5, '2025-02-18 18:25:01', '1'),
(1070, 377, 1, '2025-02-18 18:25:01', '1'),
(1071, 124, 1, '2025-02-18 18:25:01', '1'),
(1072, 277, 3, '2025-02-18 18:25:01', '1'),
(1073, 440, 7, '2025-02-18 18:25:01', '1'),
(1074, 312, 5, '2025-02-18 18:25:01', '1'),
(1075, 447, 10, '2025-02-18 18:25:01', '1'),
(1076, 493, 4, '2025-02-18 18:25:01', '1'),
(1078, 137, 10, '2025-02-18 18:25:01', '1'),
(1079, 128, 9, '2025-02-18 18:25:01', '1'),
(1082, 263, 9, '2025-02-18 18:25:01', '1'),
(1084, 169, 9, '2025-02-18 18:25:01', '1'),
(1085, 217, 8, '2025-02-18 18:25:01', '1'),
(1086, 457, 4, '2025-02-18 18:25:01', '1'),
(1087, 144, 4, '2025-02-18 18:25:01', '1'),
(1090, 92, 10, '2025-02-18 18:25:01', '1'),
(1091, 363, 10, '2025-02-18 18:25:01', '1'),
(1092, 184, 1, '2025-02-18 18:25:01', '1'),
(1093, 299, 9, '2025-02-18 18:25:01', '1'),
(1095, 365, 8, '2025-02-18 18:25:01', '1'),
(1096, 24, 10, '2025-02-18 18:25:01', '1'),
(1097, 153, 8, '2025-02-18 18:25:01', '1'),
(1098, 406, 3, '2025-02-18 18:25:01', '1'),
(1099, 34, 5, '2025-02-18 18:25:01', '1'),
(1101, 452, 2, '2025-02-18 18:25:01', '1'),
(1102, 433, 9, '2025-02-18 18:25:01', '1'),
(1103, 480, 9, '2025-02-18 18:25:01', '1'),
(1104, 357, 1, '2025-02-18 18:25:01', '1'),
(1106, 58, 7, '2025-02-18 18:25:01', '1'),
(1107, 217, 10, '2025-02-18 18:25:01', '1'),
(1108, 34, 3, '2025-02-18 18:25:01', '1'),
(1109, 27, 4, '2025-02-18 18:25:01', '1'),
(1111, 359, 10, '2025-02-18 18:25:01', '1'),
(1112, 424, 10, '2025-02-18 18:25:01', '1'),
(1114, 99, 2, '2025-02-18 18:25:01', '1'),
(1115, 339, 9, '2025-02-18 18:25:01', '1'),
(1117, 494, 10, '2025-02-18 18:25:01', '1'),
(1118, 31, 1, '2025-02-18 18:25:01', '1'),
(1119, 376, 1, '2025-02-18 18:25:01', '1'),
(1120, 244, 9, '2025-02-18 18:25:01', '1'),
(1121, 410, 3, '2025-02-18 18:25:01', '1'),
(1122, 62, 7, '2025-02-18 18:25:01', '1'),
(1125, 158, 2, '2025-02-18 18:25:01', '1'),
(1126, 90, 6, '2025-02-18 18:25:01', '1'),
(1127, 264, 8, '2025-02-18 18:25:01', '1'),
(1128, 417, 9, '2025-02-18 18:25:01', '1'),
(1129, 179, 1, '2025-02-18 18:25:01', '1'),
(1130, 121, 4, '2025-02-18 18:25:01', '1'),
(1131, 460, 5, '2025-02-18 18:25:01', '1'),
(1132, 231, 7, '2025-02-18 18:25:01', '1'),
(1133, 492, 3, '2025-02-18 18:25:01', '1'),
(1134, 277, 5, '2025-02-18 18:25:01', '1'),
(1135, 282, 7, '2025-02-18 18:25:01', '1'),
(1136, 95, 2, '2025-02-18 18:25:01', '1'),
(1137, 352, 4, '2025-02-18 18:25:01', '1'),
(1138, 352, 10, '2025-02-18 18:25:01', '1'),
(1139, 466, 10, '2025-02-18 18:25:01', '1'),
(1140, 356, 3, '2025-02-18 18:25:01', '1'),
(1142, 70, 3, '2025-02-18 18:25:01', '1'),
(1144, 420, 5, '2025-02-18 18:25:01', '1'),
(1145, 131, 8, '2025-02-18 18:25:01', '1'),
(1146, 153, 9, '2025-02-18 18:25:01', '1'),
(1147, 473, 3, '2025-02-18 18:25:01', '1'),
(1148, 232, 2, '2025-02-18 18:25:01', '1'),
(1149, 215, 9, '2025-02-18 18:25:01', '1'),
(1153, 197, 8, '2025-02-18 18:25:01', '1'),
(1154, 127, 6, '2025-02-18 18:25:01', '1'),
(1155, 173, 2, '2025-02-18 18:25:01', '1'),
(1157, 405, 1, '2025-02-18 18:25:01', '1'),
(1158, 255, 2, '2025-02-18 18:25:01', '1'),
(1159, 21, 1, '2025-02-18 18:25:01', '1'),
(1162, 410, 9, '2025-02-18 18:25:01', '1'),
(1164, 227, 10, '2025-02-18 18:25:01', '1'),
(1166, 82, 7, '2025-02-18 18:25:01', '1'),
(1168, 9, 7, '2025-02-18 18:25:01', '1'),
(1169, 327, 8, '2025-02-18 18:25:01', '1'),
(1172, 277, 9, '2025-02-18 18:25:01', '1'),
(1173, 395, 3, '2025-02-18 18:25:01', '1'),
(1174, 4, 4, '2025-02-18 18:25:01', '1'),
(1175, 15, 2, '2025-02-18 18:25:01', '1'),
(1176, 105, 7, '2025-02-18 18:25:01', '1'),
(1178, 458, 4, '2025-02-18 18:25:01', '1'),
(1179, 415, 3, '2025-02-18 18:25:01', '1'),
(1180, 60, 8, '2025-02-18 18:25:01', '1'),
(1182, 64, 3, '2025-02-18 18:25:01', '1'),
(1183, 421, 4, '2025-02-18 18:25:01', '1'),
(1184, 483, 3, '2025-02-18 18:25:01', '1'),
(1185, 376, 2, '2025-02-18 18:25:01', '1'),
(1186, 83, 8, '2025-02-18 18:25:01', '1'),
(1188, 182, 10, '2025-02-18 18:25:01', '1'),
(1189, 119, 7, '2025-02-18 18:25:01', '1'),
(1190, 170, 5, '2025-02-18 18:25:01', '1'),
(1191, 396, 10, '2025-02-18 18:25:01', '1'),
(1193, 159, 8, '2025-02-18 18:25:01', '1'),
(1194, 198, 5, '2025-02-18 18:25:01', '1'),
(1196, 87, 5, '2025-02-18 18:25:01', '1'),
(1197, 399, 2, '2025-02-18 18:25:01', '1'),
(1198, 319, 9, '2025-02-18 18:25:01', '1'),
(1199, 110, 6, '2025-02-18 18:25:01', '1'),
(1200, 20, 4, '2025-02-18 18:25:01', '1'),
(1201, 36, 2, '2025-02-18 18:25:01', '1'),
(1202, 49, 4, '2025-02-18 18:25:01', '1'),
(1204, 298, 6, '2025-02-18 18:25:01', '1'),
(1205, 198, 6, '2025-02-18 18:25:01', '1'),
(1206, 499, 8, '2025-02-18 18:25:01', '1'),
(1207, 183, 8, '2025-02-18 18:25:01', '1'),
(1208, 38, 10, '2025-02-18 18:25:01', '1'),
(1210, 218, 3, '2025-02-18 18:25:01', '1'),
(1211, 352, 2, '2025-02-18 18:25:01', '1'),
(1212, 164, 10, '2025-02-18 18:25:01', '1'),
(1213, 395, 10, '2025-02-18 18:25:01', '1'),
(1216, 120, 4, '2025-02-18 18:25:01', '1'),
(1218, 497, 1, '2025-02-18 18:25:01', '1'),
(1219, 180, 8, '2025-02-18 18:25:01', '1'),
(1223, 336, 8, '2025-02-18 18:25:01', '1'),
(1224, 451, 6, '2025-02-18 18:25:01', '1'),
(1225, 396, 5, '2025-02-18 18:25:01', '1'),
(1228, 423, 1, '2025-02-18 18:25:01', '1'),
(1229, 387, 10, '2025-02-18 18:25:01', '1'),
(1230, 411, 6, '2025-02-18 18:25:01', '1'),
(1231, 23, 8, '2025-02-18 18:25:01', '1'),
(1232, 460, 2, '2025-02-18 18:25:01', '1'),
(1233, 261, 6, '2025-02-18 18:25:01', '1'),
(1234, 230, 7, '2025-02-18 18:25:01', '1'),
(1236, 182, 4, '2025-02-18 18:25:01', '1'),
(1237, 151, 2, '2025-02-18 18:25:01', '1'),
(1238, 300, 1, '2025-02-18 18:25:01', '1'),
(1239, 424, 4, '2025-02-18 18:25:01', '1'),
(1241, 70, 10, '2025-02-18 18:25:01', '1'),
(1243, 151, 6, '2025-02-18 18:25:01', '1'),
(1244, 454, 9, '2025-02-18 18:25:01', '1'),
(1246, 312, 3, '2025-02-18 18:25:01', '1'),
(1247, 357, 10, '2025-02-18 18:25:01', '1'),
(1248, 308, 4, '2025-02-18 18:25:01', '1'),
(1249, 267, 9, '2025-02-18 18:25:01', '1'),
(1252, 139, 9, '2025-02-18 18:25:01', '1'),
(1253, 39, 8, '2025-02-18 18:25:01', '1'),
(1254, 256, 8, '2025-02-18 18:25:01', '1'),
(1255, 411, 5, '2025-02-18 18:25:01', '1'),
(1256, 53, 8, '2025-02-18 18:25:01', '1'),
(1257, 462, 8, '2025-02-18 18:25:01', '1'),
(1259, 453, 9, '2025-02-18 18:25:01', '1'),
(1260, 99, 1, '2025-02-18 18:25:01', '1'),
(1261, 43, 6, '2025-02-18 18:25:01', '1'),
(1265, 1001, 3, '2025-02-19 10:39:33', '1'),
(1266, 2, 1, '2025-02-19 11:22:55', '1'),
(1267, 2, 2, '2025-02-19 11:22:55', '1'),
(1268, 2, 3, '2025-02-19 11:22:55', '1'),
(1269, 1003, 2, '2025-02-19 11:59:53', '1'),
(1271, 7, 7, '2025-02-19 13:43:54', '1'),
(1272, 7, 10, '2025-02-19 13:43:54', '1'),
(1273, 50, 2, '2025-02-19 13:44:24', '1'),
(1274, 50, 10, '2025-02-19 13:44:24', '1'),
(1275, 50, 18, '2025-02-19 13:44:24', '1'),
(1276, 1004, 3, '2025-02-19 13:46:07', '1'),
(1277, 1004, 7, '2025-02-19 13:46:07', '1'),
(1278, 1004, 20, '2025-02-19 13:46:07', '1'),
(1279, 1005, 2, '2025-02-19 14:04:12', '1'),
(1280, 1005, 5, '2025-02-19 14:04:12', '1'),
(1281, 1005, 10, '2025-02-19 14:04:12', '1'),
(1282, 1005, 17, '2025-02-19 14:04:12', '1'),
(1283, 1005, 19, '2025-02-19 14:04:12', '1'),
(1284, 1006, 18, '2025-02-20 08:21:03', '1'),
(1285, 1006, 19, '2025-02-20 08:21:03', '1'),
(1286, 1006, 20, '2025-02-20 08:21:03', '1'),
(1287, 1006, 23, '2025-02-20 08:21:03', '1'),
(1288, 1006, 28, '2025-02-20 08:21:03', '1'),
(1289, 1007, 3, '2025-02-20 12:42:30', '1'),
(1290, 1007, 4, '2025-02-20 12:42:30', '1'),
(1291, 1007, 6, '2025-02-20 12:42:30', '1'),
(1292, 1007, 9, '2025-02-20 12:42:30', '1'),
(1293, 1007, 18, '2025-02-20 12:42:30', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user_vs_email`
--

CREATE TABLE `user_vs_email` (
  `user_vs_email_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `is_active` enum('1','0') NOT NULL DEFAULT '1',
  `added_on` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_vs_email`
--

INSERT INTO `user_vs_email` (`user_vs_email_id`, `user_id`, `email_id`, `is_active`, `added_on`) VALUES
(1, 12, 'abel.maclead@gmail.com', '1', '2025-02-18 23:55:20'),
(2, 326, 'adelina.nabours@gmail.com', '1', '2025-02-18 23:55:20'),
(3, 449, 'adell.lipkin@gmail.com', '1', '2025-02-18 23:55:20'),
(4, 435, 'ahmed.angalich@gmail.com', '1', '2025-02-18 23:55:20'),
(5, 331, 'aja.gehrett@gmail.com', '1', '2025-02-18 23:55:20'),
(6, 227, 'alaine.bergesen@gmail.com', '1', '2025-02-18 23:55:20'),
(7, 34, 'albina.glick@gmail.com', '1', '2025-02-18 23:55:20'),
(8, 101, 'alease.buemi@gmail.com', '1', '2025-02-18 23:55:20'),
(9, 275, 'alecia.bubash@gmail.com', '1', '2025-02-18 23:55:20'),
(10, 494, 'alesia.hixenbaugh@gmail.com', '1', '2025-02-18 23:55:20'),
(11, 240, 'alex.loader@gmail.com', '1', '2025-02-18 23:55:20'),
(12, 25, 'alisha.slusarski@gmail.com', '1', '2025-02-18 23:55:20'),
(13, 35, 'alishia.sergi@gmail.com', '1', '2025-02-18 23:55:20'),
(14, 208, 'aliza.baltimore@gmail.com', '1', '2025-02-18 23:55:20'),
(15, 26, 'allene.iturbide@gmail.com', '1', '2025-02-18 23:55:20'),
(16, 456, 'alline.jeanty@gmail.com', '1', '2025-02-18 23:55:20'),
(17, 479, 'alpha.palaia@gmail.com', '1', '2025-02-18 23:55:20'),
(18, 253, 'alyce.arias@gmail.com', '1', '2025-02-18 23:55:20'),
(19, 57, 'amber.monarrez@gmail.com', '1', '2025-02-18 23:55:20'),
(20, 310, 'amie.perigo@gmail.com', '1', '2025-02-18 23:55:20'),
(21, 31, 'ammie.corrio@gmail.com', '1', '2025-02-18 23:55:20'),
(22, 249, 'an.fritz@gmail.com', '1', '2025-02-18 23:55:20'),
(23, 196, 'andra.scheyer@gmail.com', '1', '2025-02-18 23:55:20'),
(24, 103, 'angella.cetta@gmail.com', '1', '2025-02-18 23:55:20'),
(25, 178, 'annabelle.boord@gmail.com', '1', '2025-02-18 23:55:20'),
(26, 396, 'annelle.tagala@gmail.com', '1', '2025-02-18 23:55:20'),
(27, 441, 'annmarie.castros@gmail.com', '1', '2025-02-18 23:55:20'),
(28, 431, 'antione.onofrio@gmail.com', '1', '2025-02-18 23:55:20'),
(29, 100, 'arlene.klusman@gmail.com', '1', '2025-02-18 23:55:20'),
(30, 83, 'arlette.honeywell@gmail.com', '1', '2025-02-18 23:55:20'),
(31, 155, 'arminda.parvis@gmail.com', '1', '2025-02-18 23:55:20'),
(32, 3, 'art.venere@gmail.com', '1', '2025-02-18 23:55:20'),
(33, 407, 'arthur.farrow@gmail.com', '1', '2025-02-18 23:55:20'),
(34, 203, 'ashlyn.pinilla@gmail.com', '1', '2025-02-18 23:55:20'),
(35, 144, 'audra.kohnert@gmail.com', '1', '2025-02-18 23:55:20'),
(36, 356, 'audry.yaw@gmail.com', '1', '2025-02-18 23:55:20'),
(37, 221, 'avery.steier@gmail.com', '1', '2025-02-18 23:55:20'),
(38, 317, 'barbra.adkin@gmail.com', '1', '2025-02-18 23:55:20'),
(39, 201, 'barrett.toyama@gmail.com', '1', '2025-02-18 23:55:20'),
(40, 136, 'beatriz.corrington@gmail.com', '1', '2025-02-18 23:55:20'),
(41, 213, 'beckie.silvestrini@gmail.com', '1', '2025-02-18 23:55:20'),
(42, 135, 'becky.mirafuentes@gmail.com', '1', '2025-02-18 23:55:20'),
(43, 198, 'belen.strassner@gmail.com', '1', '2025-02-18 23:55:20'),
(44, 252, 'benedict.sama@gmail.com', '1', '2025-02-18 23:55:20'),
(45, 185, 'benton.skursky@gmail.com', '1', '2025-02-18 23:55:20'),
(46, 412, 'bernardine.rodefer@gmail.com', '1', '2025-02-18 23:55:20'),
(47, 30, 'bernardo.figeroa@gmail.com', '1', '2025-02-18 23:55:20'),
(48, 21, 'bette.nicka@gmail.com', '1', '2025-02-18 23:55:20'),
(49, 409, 'billye.miro@gmail.com', '1', '2025-02-18 23:55:20'),
(50, 50, 'blair.malet@gmail.com', '1', '2025-02-18 23:55:20'),
(51, 61, 'blondell.pugh@gmail.com', '1', '2025-02-18 23:55:20'),
(52, 73, 'bobbye.rhym@gmail.com', '1', '2025-02-18 23:55:20'),
(53, 130, 'bok.isaacs@gmail.com', '1', '2025-02-18 23:55:20'),
(54, 118, 'brandon.callaro@gmail.com', '1', '2025-02-18 23:55:20'),
(55, 403, 'brett.mccullan@gmail.com', '1', '2025-02-18 23:55:20'),
(56, 448, 'britt.galam@gmail.com', '1', '2025-02-18 23:55:20'),
(57, 496, 'brittni.gillaspie@gmail.com', '1', '2025-02-18 23:55:20'),
(58, 51, 'brock.bolognia@gmail.com', '1', '2025-02-18 23:55:20'),
(59, 268, 'buddy.cloney@gmail.com', '1', '2025-02-18 23:55:20'),
(60, 143, 'bulah.padilla@gmail.com', '1', '2025-02-18 23:55:20'),
(61, 320, 'caitlin.julia@gmail.com', '1', '2025-02-18 23:55:20'),
(62, 15, 'cammy.albares@gmail.com', '1', '2025-02-18 23:55:20'),
(63, 194, 'candida.corbley@gmail.com', '1', '2025-02-18 23:55:20'),
(64, 438, 'caprice.suell@gmail.com', '1', '2025-02-18 23:55:20'),
(65, 255, 'carey.dopico@gmail.com', '1', '2025-02-18 23:55:20'),
(66, 160, 'carin.deleo@gmail.com', '1', '2025-02-18 23:55:20'),
(67, 152, 'carissa.batman@gmail.com', '1', '2025-02-18 23:55:20'),
(68, 491, 'carlee.boulter@gmail.com', '1', '2025-02-18 23:55:20'),
(69, 96, 'carma.vanheusen@gmail.com', '1', '2025-02-18 23:55:20'),
(70, 182, 'carmela.cookey@gmail.com', '1', '2025-02-18 23:55:20'),
(71, 64, 'carmelina.lindall@gmail.com', '1', '2025-02-18 23:55:20'),
(72, 284, 'carmen.sweigard@gmail.com', '1', '2025-02-18 23:55:20'),
(73, 288, 'casie.good@gmail.com', '1', '2025-02-18 23:55:20'),
(74, 447, 'cassi.wildfong@gmail.com', '1', '2025-02-18 23:55:20'),
(75, 489, 'catalina.tillotson@gmail.com', '1', '2025-02-18 23:55:20'),
(76, 421, 'catarina.gleich@gmail.com', '1', '2025-02-18 23:55:20'),
(77, 291, 'cathrine.pontoriero@gmail.com', '1', '2025-02-18 23:55:20'),
(78, 443, 'cecil.lapage@gmail.com', '1', '2025-02-18 23:55:20'),
(79, 460, 'cecilia.colaizzo@gmail.com', '1', '2025-02-18 23:55:20'),
(80, 63, 'cecily.hollack@gmail.com', '1', '2025-02-18 23:55:20'),
(81, 106, 'celeste.korando@gmail.com', '1', '2025-02-18 23:55:20'),
(82, 243, 'ceola.setter@gmail.com', '1', '2025-02-18 23:55:20'),
(83, 27, 'chanel.caudy@gmail.com', '1', '2025-02-18 23:55:20'),
(84, 161, 'chantell.maynerich@gmail.com', '1', '2025-02-18 23:55:20'),
(85, 262, 'charlene.hamilton@gmail.com', '1', '2025-02-18 23:55:20'),
(86, 148, 'chau.kitzman@gmail.com', '1', '2025-02-18 23:55:20'),
(87, 500, 'chauncey.motley@gmail.com', '1', '2025-02-18 23:55:20'),
(88, 233, 'chaya.malvin@gmail.com', '1', '2025-02-18 23:55:20'),
(89, 313, 'cherry.lietz@gmail.com', '1', '2025-02-18 23:55:20'),
(90, 150, 'cheryl.haroldson@gmail.com', '1', '2025-02-18 23:55:20'),
(91, 306, 'christiane.eschberger@gmail.com', '1', '2025-02-18 23:55:20'),
(92, 384, 'ciara.ventura@gmail.com', '1', '2025-02-18 23:55:20'),
(93, 184, 'claribel.varriano@gmail.com', '1', '2025-02-18 23:55:20'),
(94, 170, 'clay.hoa@gmail.com', '1', '2025-02-18 23:55:20'),
(95, 433, 'clorinda.heimann@gmail.com', '1', '2025-02-18 23:55:20'),
(96, 468, 'colette.kardas@gmail.com', '1', '2025-02-18 23:55:20'),
(97, 401, 'cordelia.storment@gmail.com', '1', '2025-02-18 23:55:20'),
(98, 336, 'corinne.loder@gmail.com', '1', '2025-02-18 23:55:20'),
(99, 92, 'cory.gibes@gmail.com', '1', '2025-02-18 23:55:20'),
(100, 453, 'cristal.samara@gmail.com', '1', '2025-02-18 23:55:20'),
(101, 222, 'cristy.lother@gmail.com', '1', '2025-02-18 23:55:20'),
(102, 104, 'cyndy.goldammer@gmail.com', '1', '2025-02-18 23:55:20'),
(103, 379, 'cyril.daufeldt@gmail.com', '1', '2025-02-18 23:55:20'),
(104, 269, 'dalene.riden@gmail.com', '1', '2025-02-18 23:55:20'),
(105, 388, 'dalene.schoeneck@gmail.com', '1', '2025-02-18 23:55:20'),
(106, 93, 'danica.bruschke@gmail.com', '1', '2025-02-18 23:55:20'),
(107, 446, 'daniel.perruzza@gmail.com', '1', '2025-02-18 23:55:20'),
(108, 459, 'daniela.comnick@gmail.com', '1', '2025-02-18 23:55:20'),
(109, 145, 'daren.weirather@gmail.com', '1', '2025-02-18 23:55:20'),
(110, 248, 'daron.dinos@gmail.com', '1', '2025-02-18 23:55:20'),
(111, 397, 'dean.ketelsen@gmail.com', '1', '2025-02-18 23:55:20'),
(112, 257, 'deandrea.hughey@gmail.com', '1', '2025-02-18 23:55:20'),
(113, 60, 'deeanna.juhas@gmail.com', '1', '2025-02-18 23:55:20'),
(114, 78, 'delisa.crupi@gmail.com', '1', '2025-02-18 23:55:20'),
(115, 59, 'delmy.ahle@gmail.com', '1', '2025-02-18 23:55:20'),
(116, 354, 'denise.patak@gmail.com', '1', '2025-02-18 23:55:20'),
(117, 273, 'deonna.kippley@gmail.com', '1', '2025-02-18 23:55:20'),
(118, 327, 'derick.dhamer@gmail.com', '1', '2025-02-18 23:55:20'),
(119, 277, 'detra.coyier@gmail.com', '1', '2025-02-18 23:55:20'),
(120, 124, 'devora.perez@gmail.com', '1', '2025-02-18 23:55:20'),
(121, 81, 'devorah.chickering@gmail.com', '1', '2025-02-18 23:55:20'),
(122, 475, 'diane.devreese@gmail.com', '1', '2025-02-18 23:55:20'),
(123, 434, 'dick.wenzinger@gmail.com', '1', '2025-02-18 23:55:20'),
(124, 162, 'dierdre.yum@gmail.com', '1', '2025-02-18 23:55:20'),
(125, 84, 'dominque.dickerson@gmail.com', '1', '2025-02-18 23:55:20'),
(126, 5, 'donette.foller@gmail.com', '1', '2025-02-18 23:55:20'),
(127, 109, 'donte.kines@gmail.com', '1', '2025-02-18 23:55:20'),
(128, 487, 'dorothy.chesterfield@gmail.com', '1', '2025-02-18 23:55:20'),
(129, 166, 'dorthy.hidvegi@gmail.com', '1', '2025-02-18 23:55:20'),
(130, 256, 'dottie.hellickson@gmail.com', '1', '2025-02-18 23:55:20'),
(131, 337, 'dulce.labreche@gmail.com', '1', '2025-02-18 23:55:20'),
(132, 42, 'dyan.oldroyd@gmail.com', '1', '2025-02-18 23:55:20'),
(133, 228, 'earleen.mai@gmail.com', '1', '2025-02-18 23:55:20'),
(134, 417, 'eden.jayson@gmail.com', '1', '2025-02-18 23:55:20'),
(135, 111, 'edna.miceli@gmail.com', '1', '2025-02-18 23:55:20'),
(136, 232, 'eladia.saulter@gmail.com', '1', '2025-02-18 23:55:20'),
(137, 426, 'elke.sengbusch@gmail.com', '1', '2025-02-18 23:55:20'),
(138, 455, 'elli.mclaird@gmail.com', '1', '2025-02-18 23:55:20'),
(139, 68, 'elly.morocco@gmail.com', '1', '2025-02-18 23:55:20'),
(140, 359, 'elouise.gwalthney@gmail.com', '1', '2025-02-18 23:55:20'),
(141, 95, 'elvera.benimadho@gmail.com', '1', '2025-02-18 23:55:20'),
(142, 80, 'elza.lipke@gmail.com', '1', '2025-02-18 23:55:20'),
(143, 49, 'emerson.bowley@gmail.com', '1', '2025-02-18 23:55:20'),
(144, 45, 'erick.ferencz@gmail.com', '1', '2025-02-18 23:55:20'),
(145, 381, 'erick.nievas@gmail.com', '1', '2025-02-18 23:55:20'),
(146, 312, 'erinn.canlas@gmail.com', '1', '2025-02-18 23:55:20'),
(147, 342, 'ernest.syrop@gmail.com', '1', '2025-02-18 23:55:20'),
(148, 33, 'ernie.stenseth@gmail.com', '1', '2025-02-18 23:55:20'),
(149, 108, 'estrella.samu@gmail.com', '1', '2025-02-18 23:55:20'),
(150, 416, 'ettie.hoopengardner@gmail.com', '1', '2025-02-18 23:55:20'),
(151, 173, 'eun.coody@gmail.com', '1', '2025-02-18 23:55:20'),
(152, 168, 'evangelina.radde@gmail.com', '1', '2025-02-18 23:55:20'),
(153, 28, 'ezekiel.chui@gmail.com', '1', '2025-02-18 23:55:20'),
(154, 309, 'fabiola.hauenstein@gmail.com', '1', '2025-02-18 23:55:20'),
(155, 167, 'fannie.lungren@gmail.com', '1', '2025-02-18 23:55:20'),
(156, 46, 'fatima.saylors@gmail.com', '1', '2025-02-18 23:55:20'),
(157, 204, 'fausto.agramonte@gmail.com', '1', '2025-02-18 23:55:20'),
(158, 197, 'felicidad.poullion@gmail.com', '1', '2025-02-18 23:55:20'),
(159, 299, 'felix.hirpara@gmail.com', '1', '2025-02-18 23:55:20'),
(160, 146, 'fernanda.jillson@gmail.com', '1', '2025-02-18 23:55:20'),
(161, 292, 'filiberto.tawil@gmail.com', '1', '2025-02-18 23:55:20'),
(162, 20, 'fletcher.flosi@gmail.com', '1', '2025-02-18 23:55:20'),
(163, 498, 'flo.bookamer@gmail.com', '1', '2025-02-18 23:55:20'),
(164, 324, 'france.buzick@gmail.com', '1', '2025-02-18 23:55:20'),
(165, 32, 'francine.vocelka@gmail.com', '1', '2025-02-18 23:55:20'),
(166, 211, 'franklyn.emard@gmail.com', '1', '2025-02-18 23:55:20'),
(167, 215, 'frederica.blunk@gmail.com', '1', '2025-02-18 23:55:20'),
(168, 217, 'freeman.gochal@gmail.com', '1', '2025-02-18 23:55:20'),
(169, 387, 'gail.kitty@gmail.com', '1', '2025-02-18 23:55:20'),
(170, 488, 'gail.similton@gmail.com', '1', '2025-02-18 23:55:20'),
(171, 385, 'galen.cantres@gmail.com', '1', '2025-02-18 23:55:20'),
(172, 280, 'garry.keetch@gmail.com', '1', '2025-02-18 23:55:20'),
(173, 474, 'gary.nunlee@gmail.com', '1', '2025-02-18 23:55:20'),
(174, 380, 'gayla.schnitzler@gmail.com', '1', '2025-02-18 23:55:20'),
(175, 147, 'gearldine.gellinger@gmail.com', '1', '2025-02-18 23:55:20'),
(176, 263, 'geoffrey.acey@gmail.com', '1', '2025-02-18 23:55:20'),
(177, 190, 'georgene.montezuma@gmail.com', '1', '2025-02-18 23:55:20'),
(178, 389, 'gertude.witten@gmail.com', '1', '2025-02-18 23:55:20'),
(179, 483, 'gilma.liukko@gmail.com', '1', '2025-02-18 23:55:20'),
(180, 18, 'gladys.rim@gmail.com', '1', '2025-02-18 23:55:20'),
(181, 216, 'glen.bartolet@gmail.com', '1', '2025-02-18 23:55:20'),
(182, 220, 'glendora.sarbacher@gmail.com', '1', '2025-02-18 23:55:20'),
(183, 391, 'glenn.berray@gmail.com', '1', '2025-02-18 23:55:20'),
(184, 410, 'glenna.slayton@gmail.com', '1', '2025-02-18 23:55:20'),
(185, 116, 'glory.kulzer@gmail.com', '1', '2025-02-18 23:55:20'),
(186, 477, 'glory.schieler@gmail.com', '1', '2025-02-18 23:55:20'),
(187, 420, 'golda.kaniecki@gmail.com', '1', '2025-02-18 23:55:20'),
(188, 307, 'goldie.schirpke@gmail.com', '1', '2025-02-18 23:55:20'),
(189, 199, 'gracia.melnyk@gmail.com', '1', '2025-02-18 23:55:20'),
(190, 14, 'graciela.ruta@gmail.com', '1', '2025-02-18 23:55:20'),
(191, 159, 'gregoria.pawlowicz@gmail.com', '1', '2025-02-18 23:55:20'),
(192, 234, 'gwenn.suffield@gmail.com', '1', '2025-02-18 23:55:20'),
(193, 266, 'harrison.haufler@gmail.com', '1', '2025-02-18 23:55:20'),
(194, 271, 'haydee.denooyer@gmail.com', '1', '2025-02-18 23:55:20'),
(195, 254, 'heike.berganza@gmail.com', '1', '2025-02-18 23:55:20'),
(196, 322, 'helaine.halter@gmail.com', '1', '2025-02-18 23:55:20'),
(197, 347, 'helene.rodenberger@gmail.com', '1', '2025-02-18 23:55:20'),
(198, 202, 'helga.fredicks@gmail.com', '1', '2025-02-18 23:55:20'),
(199, 125, 'herman.demesa@gmail.com', '1', '2025-02-18 23:55:20'),
(200, 318, 'hermila.thyberg@gmail.com', '1', '2025-02-18 23:55:20'),
(201, 287, 'herminia.nicolozakes@gmail.com', '1', '2025-02-18 23:55:20'),
(202, 186, 'hillary.skulski@gmail.com', '1', '2025-02-18 23:55:20'),
(203, 427, 'hoa.sarao@gmail.com', '1', '2025-02-18 23:55:20'),
(204, 132, 'howard.paulas@gmail.com', '1', '2025-02-18 23:55:20'),
(205, 406, 'hubert.walthall@gmail.com', '1', '2025-02-18 23:55:20'),
(206, 69, 'ilene.eroman@gmail.com', '1', '2025-02-18 23:55:20'),
(207, 436, 'iluminada.ohms@gmail.com', '1', '2025-02-18 23:55:20'),
(208, 172, 'irma.wolfgramm@gmail.com', '1', '2025-02-18 23:55:20'),
(209, 463, 'izetta.dewar@gmail.com', '1', '2025-02-18 23:55:20'),
(210, 372, 'izetta.funnell@gmail.com', '1', '2025-02-18 23:55:20'),
(211, 378, 'jaclyn.bachman@gmail.com', '1', '2025-02-18 23:55:20'),
(212, 450, 'jacqueline.rowling@gmail.com', '1', '2025-02-18 23:55:20'),
(213, 261, 'jade.farrar@gmail.com', '1', '2025-02-18 23:55:20'),
(214, 62, 'jamal.vanausdal@gmail.com', '1', '2025-02-18 23:55:20'),
(215, 1, 'james.butt@gmail.com', '1', '2025-02-18 23:55:20'),
(216, 484, 'janey.gabisi@gmail.com', '1', '2025-02-18 23:55:20'),
(217, 499, 'jani.biddy@gmail.com', '1', '2025-02-18 23:55:20'),
(218, 415, 'janine.rhoden@gmail.com', '1', '2025-02-18 23:55:20'),
(219, 444, 'jeanice.claucherty@gmail.com', '1', '2025-02-18 23:55:20'),
(220, 302, 'jenelle.regusters@gmail.com', '1', '2025-02-18 23:55:20'),
(221, 382, 'jennie.drymon@gmail.com', '1', '2025-02-18 23:55:20'),
(222, 171, 'jennifer.fallick@gmail.com', '1', '2025-02-18 23:55:20'),
(223, 328, 'jerry.dallen@gmail.com', '1', '2025-02-18 23:55:20'),
(224, 270, 'jerry.zurcher@gmail.com', '1', '2025-02-18 23:55:20'),
(225, 471, 'jess.chaffins@gmail.com', '1', '2025-02-18 23:55:20'),
(226, 113, 'jesusa.shin@gmail.com', '1', '2025-02-18 23:55:20'),
(227, 319, 'jesusita.flister@gmail.com', '1', '2025-02-18 23:55:20'),
(228, 191, 'jettie.mconnell@gmail.com', '1', '2025-02-18 23:55:20'),
(229, 47, 'jina.briddick@gmail.com', '1', '2025-02-18 23:55:20'),
(230, 437, 'joanna.leinenbach@gmail.com', '1', '2025-02-18 23:55:20'),
(231, 177, 'joesph.degonia@gmail.com', '1', '2025-02-18 23:55:20'),
(232, 72, 'johnetta.abdallah@gmail.com', '1', '2025-02-18 23:55:20'),
(233, 267, 'johnna.engelberg@gmail.com', '1', '2025-02-18 23:55:20'),
(234, 200, 'jolanda.hanafan@gmail.com', '1', '2025-02-18 23:55:20'),
(235, 423, 'jolene.ostolaza@gmail.com', '1', '2025-02-18 23:55:20'),
(236, 466, 'joni.breland@gmail.com', '1', '2025-02-18 23:55:20'),
(237, 37, 'jose.stockham@gmail.com', '1', '2025-02-18 23:55:20'),
(238, 272, 'joseph.cryer@gmail.com', '1', '2025-02-18 23:55:20'),
(239, 2, 'josephine.darakjy@gmail.com', '1', '2025-02-18 23:55:20'),
(240, 445, 'josphine.villanueva@gmail.com', '1', '2025-02-18 23:55:20'),
(241, 493, 'jovita.oles@gmail.com', '1', '2025-02-18 23:55:20'),
(242, 296, 'judy.aquas@gmail.com', '1', '2025-02-18 23:55:20'),
(243, 183, 'junita.brideau@gmail.com', '1', '2025-02-18 23:55:20'),
(244, 286, 'junita.stoltzman@gmail.com', '1', '2025-02-18 23:55:20'),
(245, 325, 'justine.ferrario@gmail.com', '1', '2025-02-18 23:55:20'),
(246, 231, 'justine.mugnolo@gmail.com', '1', '2025-02-18 23:55:20'),
(247, 330, 'jutta.amyot@gmail.com', '1', '2025-02-18 23:55:20'),
(248, 339, 'kaitlyn.ogg@gmail.com', '1', '2025-02-18 23:55:20'),
(249, 71, 'kallie.blackwood@gmail.com', '1', '2025-02-18 23:55:20'),
(250, 48, 'kanisha.waycott@gmail.com', '1', '2025-02-18 23:55:20'),
(251, 195, 'karan.karpin@gmail.com', '1', '2025-02-18 23:55:20'),
(252, 55, 'karl.klonowski@gmail.com', '1', '2025-02-18 23:55:20'),
(253, 361, 'kasandra.semidey@gmail.com', '1', '2025-02-18 23:55:20'),
(254, 338, 'kate.keneipp@gmail.com', '1', '2025-02-18 23:55:20'),
(255, 40, 'kati.rulapaugh@gmail.com', '1', '2025-02-18 23:55:20'),
(256, 238, 'katina.polidori@gmail.com', '1', '2025-02-18 23:55:20'),
(257, 314, 'kattie.vonasek@gmail.com', '1', '2025-02-18 23:55:20'),
(258, 298, 'kayleigh.lace@gmail.com', '1', '2025-02-18 23:55:20'),
(259, 424, 'keneth.borgman@gmail.com', '1', '2025-02-18 23:55:20'),
(260, 454, 'kenneth.grenet@gmail.com', '1', '2025-02-18 23:55:20'),
(261, 165, 'kerry.theodorov@gmail.com', '1', '2025-02-18 23:55:20'),
(262, 13, 'kiley.caldarera@gmail.com', '1', '2025-02-18 23:55:20'),
(263, 258, 'kimberlie.duenas@gmail.com', '1', '2025-02-18 23:55:20'),
(264, 133, 'kimbery.madarang@gmail.com', '1', '2025-02-18 23:55:20'),
(265, 332, 'kirk.herritt@gmail.com', '1', '2025-02-18 23:55:20'),
(266, 10, 'kris.marrier@gmail.com', '1', '2025-02-18 23:55:20'),
(267, 364, 'krissy.rauser@gmail.com', '1', '2025-02-18 23:55:20'),
(268, 301, 'kristeen.turinetti@gmail.com', '1', '2025-02-18 23:55:20'),
(269, 357, 'kristel.ehmann@gmail.com', '1', '2025-02-18 23:55:20'),
(270, 351, 'kristofer.bennick@gmail.com', '1', '2025-02-18 23:55:20'),
(271, 88, 'lai.gato@gmail.com', '1', '2025-02-18 23:55:20'),
(272, 495, 'lai.harabedian@gmail.com', '1', '2025-02-18 23:55:20'),
(273, 163, 'larae.gudroe@gmail.com', '1', '2025-02-18 23:55:20'),
(274, 392, 'lashandra.klang@gmail.com', '1', '2025-02-18 23:55:20'),
(275, 345, 'lashaunda.lizama@gmail.com', '1', '2025-02-18 23:55:20'),
(276, 341, 'lashawnda.stuer@gmail.com', '1', '2025-02-18 23:55:20'),
(277, 241, 'lashon.vizarro@gmail.com', '1', '2025-02-18 23:55:20'),
(278, 151, 'laticia.merced@gmail.com', '1', '2025-02-18 23:55:20'),
(279, 164, 'latrice.tolfree@gmail.com', '1', '2025-02-18 23:55:20'),
(280, 242, 'lauran.burnard@gmail.com', '1', '2025-02-18 23:55:20'),
(281, 394, 'laurel.pagliuca@gmail.com', '1', '2025-02-18 23:55:20'),
(282, 77, 'laurel.reitler@gmail.com', '1', '2025-02-18 23:55:20'),
(283, 44, 'lavera.perin@gmail.com', '1', '2025-02-18 23:55:20'),
(284, 285, 'lavonda.hengel@gmail.com', '1', '2025-02-18 23:55:20'),
(285, 344, 'lavonna.wolny@gmail.com', '1', '2025-02-18 23:55:20'),
(286, 490, 'lawrence.lorens@gmail.com', '1', '2025-02-18 23:55:20'),
(287, 176, 'layla.springe@gmail.com', '1', '2025-02-18 23:55:20'),
(288, 139, 'leatha.hagele@gmail.com', '1', '2025-02-18 23:55:20'),
(289, 192, 'lemuel.latzke@gmail.com', '1', '2025-02-18 23:55:20'),
(290, 393, 'lenna.newville@gmail.com', '1', '2025-02-18 23:55:20'),
(291, 4, 'lenna.paprocki@gmail.com', '1', '2025-02-18 23:55:20'),
(292, 229, 'leonida.gobern@gmail.com', '1', '2025-02-18 23:55:20'),
(293, 333, 'leonora.mauson@gmail.com', '1', '2025-02-18 23:55:20'),
(294, 8, 'leota.dilliard@gmail.com', '1', '2025-02-18 23:55:20'),
(295, 329, 'leota.ragel@gmail.com', '1', '2025-02-18 23:55:20'),
(296, 461, 'leslie.threets@gmail.com', '1', '2025-02-18 23:55:20'),
(297, 85, 'lettie.isenhower@gmail.com', '1', '2025-02-18 23:55:20'),
(298, 398, 'levi.munis@gmail.com', '1', '2025-02-18 23:55:20'),
(299, 153, 'lezlie.craghead@gmail.com', '1', '2025-02-18 23:55:20'),
(300, 305, 'ligia.reiber@gmail.com', '1', '2025-02-18 23:55:20'),
(301, 485, 'lili.paskin@gmail.com', '1', '2025-02-18 23:55:20'),
(302, 315, 'lilli.scriven@gmail.com', '1', '2025-02-18 23:55:20'),
(303, 123, 'lindsey.dilello@gmail.com', '1', '2025-02-18 23:55:20'),
(304, 366, 'linn.paa@gmail.com', '1', '2025-02-18 23:55:20'),
(305, 99, 'lisha.centini@gmail.com', '1', '2025-02-18 23:55:20'),
(306, 390, 'lizbeth.kohl@gmail.com', '1', '2025-02-18 23:55:20'),
(307, 158, 'lizette.stem@gmail.com', '1', '2025-02-18 23:55:20'),
(308, 452, 'lonna.diestel@gmail.com', '1', '2025-02-18 23:55:20'),
(309, 451, 'lonny.weglarz@gmail.com', '1', '2025-02-18 23:55:20'),
(310, 323, 'lorean.martabano@gmail.com', '1', '2025-02-18 23:55:20'),
(311, 486, 'loren.asar@gmail.com', '1', '2025-02-18 23:55:20'),
(312, 308, 'loreta.timenez@gmail.com', '1', '2025-02-18 23:55:20'),
(313, 52, 'lorrie.nestle@gmail.com', '1', '2025-02-18 23:55:20'),
(314, 245, 'lorrine.worlds@gmail.com', '1', '2025-02-18 23:55:20'),
(315, 102, 'louisa.cronauer@gmail.com', '1', '2025-02-18 23:55:20'),
(316, 355, 'louvenia.beech@gmail.com', '1', '2025-02-18 23:55:20'),
(317, 129, 'lucina.lary@gmail.com', '1', '2025-02-18 23:55:20'),
(318, 295, 'lucy.treston@gmail.com', '1', '2025-02-18 23:55:20'),
(319, 432, 'luisa.jurney@gmail.com', '1', '2025-02-18 23:55:20'),
(320, 418, 'lynelle.auber@gmail.com', '1', '2025-02-18 23:55:20'),
(321, 276, 'ma.layous@gmail.com', '1', '2025-02-18 23:55:20'),
(322, 363, 'maile.linahan@gmail.com', '1', '2025-02-18 23:55:20'),
(323, 469, 'malcolm.tromblay@gmail.com', '1', '2025-02-18 23:55:20'),
(324, 97, 'malinda.hochard@gmail.com', '1', '2025-02-18 23:55:20'),
(325, 350, 'margart.meisel@gmail.com', '1', '2025-02-18 23:55:20'),
(326, 206, 'marge.limmel@gmail.com', '1', '2025-02-18 23:55:20'),
(327, 181, 'marguerita.hiatt@gmail.com', '1', '2025-02-18 23:55:20'),
(328, 429, 'mari.lueckenbach@gmail.com', '1', '2025-02-18 23:55:20'),
(329, 346, 'mariann.bilden@gmail.com', '1', '2025-02-18 23:55:20'),
(330, 54, 'marjory.mastella@gmail.com', '1', '2025-02-18 23:55:20'),
(331, 377, 'markus.lukasik@gmail.com', '1', '2025-02-18 23:55:20'),
(332, 137, 'marti.maybury@gmail.com', '1', '2025-02-18 23:55:20'),
(333, 259, 'martina.staback@gmail.com', '1', '2025-02-18 23:55:20'),
(334, 247, 'marvel.raymo@gmail.com', '1', '2025-02-18 23:55:20'),
(335, 24, 'maryann.royster@gmail.com', '1', '2025-02-18 23:55:20'),
(336, 281, 'matthew.neither@gmail.com', '1', '2025-02-18 23:55:20'),
(337, 16, 'mattie.poquette@gmail.com', '1', '2025-02-18 23:55:20'),
(338, 65, 'maurine.yglesias@gmail.com', '1', '2025-02-18 23:55:20'),
(339, 17, 'meaghan.garufi@gmail.com', '1', '2025-02-18 23:55:20'),
(340, 141, 'melissa.wiklund@gmail.com', '1', '2025-02-18 23:55:20'),
(341, 193, 'melodie.knipp@gmail.com', '1', '2025-02-18 23:55:20'),
(342, 187, 'merilyn.bayless@gmail.com', '1', '2025-02-18 23:55:20'),
(343, 419, 'merissa.tomblin@gmail.com', '1', '2025-02-18 23:55:20'),
(344, 189, 'merlyn.lawler@gmail.com', '1', '2025-02-18 23:55:20'),
(345, 74, 'micaela.rhymes@gmail.com', '1', '2025-02-18 23:55:20'),
(346, 11, 'minna.amigon@gmail.com', '1', '2025-02-18 23:55:20'),
(347, 395, 'mireya.frerking@gmail.com', '1', '2025-02-18 23:55:20'),
(348, 290, 'mirta.mallett@gmail.com', '1', '2025-02-18 23:55:20'),
(349, 383, 'mitsue.scipione@gmail.com', '1', '2025-02-18 23:55:20'),
(350, 7, 'mitsue.tollner@gmail.com', '1', '2025-02-18 23:55:20'),
(351, 411, 'mitzie.hudnall@gmail.com', '1', '2025-02-18 23:55:20'),
(352, 402, 'mollie.mcdoniel@gmail.com', '1', '2025-02-18 23:55:20'),
(353, 482, 'mona.delasancha@gmail.com', '1', '2025-02-18 23:55:20'),
(354, 76, 'moon.parlato@gmail.com', '1', '2025-02-18 23:55:20'),
(355, 209, 'mozell.pelkowski@gmail.com', '1', '2025-02-18 23:55:20'),
(356, 244, 'my.rantanen@gmail.com', '1', '2025-02-18 23:55:20'),
(357, 86, 'myra.munns@gmail.com', '1', '2025-02-18 23:55:20'),
(358, 462, 'nan.koppinger@gmail.com', '1', '2025-02-18 23:55:20'),
(359, 175, 'nana.wrinkles@gmail.com', '1', '2025-02-18 23:55:20'),
(360, 98, 'natalie.fern@gmail.com', '1', '2025-02-18 23:55:20'),
(361, 180, 'nelida.sawchuk@gmail.com', '1', '2025-02-18 23:55:20'),
(362, 414, 'nichelle.meteer@gmail.com', '1', '2025-02-18 23:55:20'),
(363, 473, 'nickolas.juvera@gmail.com', '1', '2025-02-18 23:55:20'),
(364, 223, 'nicolette.brossart@gmail.com', '1', '2025-02-18 23:55:20'),
(365, 138, 'nieves.gotter@gmail.com', '1', '2025-02-18 23:55:20'),
(366, 283, 'noah.kalafatis@gmail.com', '1', '2025-02-18 23:55:20'),
(367, 343, 'nobuko.halsey@gmail.com', '1', '2025-02-18 23:55:20'),
(368, 207, 'norah.waymire@gmail.com', '1', '2025-02-18 23:55:20'),
(369, 169, 'novella.degroot@gmail.com', '1', '2025-02-18 23:55:20'),
(370, 458, 'nu.mcnease@gmail.com', '1', '2025-02-18 23:55:20'),
(371, 304, 'olive.matuszak@gmail.com', '1', '2025-02-18 23:55:20'),
(372, 120, 'oretha.menter@gmail.com', '1', '2025-02-18 23:55:20'),
(373, 154, 'ozell.shealy@gmail.com', '1', '2025-02-18 23:55:20'),
(374, 265, 'pamella.fortino@gmail.com', '1', '2025-02-18 23:55:20'),
(375, 115, 'pamella.schmierer@gmail.com', '1', '2025-02-18 23:55:20'),
(376, 367, 'paris.wide@gmail.com', '1', '2025-02-18 23:55:20'),
(377, 376, 'paz.sahagun@gmail.com', '1', '2025-02-18 23:55:20'),
(378, 246, 'peggie.sturiale@gmail.com', '1', '2025-02-18 23:55:20'),
(379, 67, 'penney.weight@gmail.com', '1', '2025-02-18 23:55:20'),
(380, 365, 'pete.dubaldi@gmail.com', '1', '2025-02-18 23:55:20'),
(381, 250, 'portia.stimmel@gmail.com', '1', '2025-02-18 23:55:20'),
(382, 369, 'quentin.birkner@gmail.com', '1', '2025-02-18 23:55:20'),
(383, 440, 'quentin.swayze@gmail.com', '1', '2025-02-18 23:55:20'),
(384, 311, 'raina.brachle@gmail.com', '1', '2025-02-18 23:55:20'),
(385, 478, 'rasheeda.sayaphon@gmail.com', '1', '2025-02-18 23:55:20'),
(386, 293, 'raul.upthegrove@gmail.com', '1', '2025-02-18 23:55:20'),
(387, 497, 'raylene.kampa@gmail.com', '1', '2025-02-18 23:55:20'),
(388, 274, 'raymon.calvaresi@gmail.com', '1', '2025-02-18 23:55:20'),
(389, 214, 'rebecka.gesick@gmail.com', '1', '2025-02-18 23:55:20'),
(390, 289, 'reena.maisto@gmail.com', '1', '2025-02-18 23:55:20'),
(391, 480, 'refugia.jacobos@gmail.com', '1', '2025-02-18 23:55:20'),
(392, 370, 'regenia.kannady@gmail.com', '1', '2025-02-18 23:55:20'),
(393, 156, 'reita.leto@gmail.com', '1', '2025-02-18 23:55:20'),
(394, 303, 'renea.monterrubio@gmail.com', '1', '2025-02-18 23:55:20'),
(395, 230, 'ressie.auffrey@gmail.com', '1', '2025-02-18 23:55:20'),
(396, 251, 'rhea.aredondo@gmail.com', '1', '2025-02-18 23:55:20'),
(397, 239, 'rickie.plumer@gmail.com', '1', '2025-02-18 23:55:20'),
(398, 425, 'rikki.nayar@gmail.com', '1', '2025-02-18 23:55:20'),
(399, 219, 'rima.bevelacqua@gmail.com', '1', '2025-02-18 23:55:20'),
(400, 373, 'rodolfo.butzen@gmail.com', '1', '2025-02-18 23:55:20'),
(401, 131, 'rolande.spickerman@gmail.com', '1', '2025-02-18 23:55:20'),
(402, 114, 'rolland.francescon@gmail.com', '1', '2025-02-18 23:55:20'),
(403, 205, 'ronny.caiafa@gmail.com', '1', '2025-02-18 23:55:20'),
(404, 321, 'roosevelt.hoffis@gmail.com', '1', '2025-02-18 23:55:20'),
(405, 126, 'rory.papasergi@gmail.com', '1', '2025-02-18 23:55:20'),
(406, 348, 'roselle.estell@gmail.com', '1', '2025-02-18 23:55:20'),
(407, 105, 'rosio.cork@gmail.com', '1', '2025-02-18 23:55:20'),
(408, 476, 'roslyn.chavous@gmail.com', '1', '2025-02-18 23:55:20'),
(409, 43, 'roxane.campain@gmail.com', '1', '2025-02-18 23:55:20'),
(410, 38, 'rozella.ostrosky@gmail.com', '1', '2025-02-18 23:55:20'),
(411, 465, 'ruthann.keener@gmail.com', '1', '2025-02-18 23:55:20'),
(412, 470, 'ryan.harnos@gmail.com', '1', '2025-02-18 23:55:20'),
(413, 53, 'sabra.uyetake@gmail.com', '1', '2025-02-18 23:55:20'),
(414, 9, 'sage.wieser@gmail.com', '1', '2025-02-18 23:55:20'),
(415, 235, 'salena.karpel@gmail.com', '1', '2025-02-18 23:55:20'),
(416, 279, 'salome.lacovara@gmail.com', '1', '2025-02-18 23:55:20'),
(417, 349, 'samira.heintzman@gmail.com', '1', '2025-02-18 23:55:20'),
(418, 294, 'sarah.candlish@gmail.com', '1', '2025-02-18 23:55:20'),
(419, 119, 'scarlet.cartan@gmail.com', '1', '2025-02-18 23:55:20'),
(420, 430, 'selma.husser@gmail.com', '1', '2025-02-18 23:55:20'),
(421, 375, 'serina.zagen@gmail.com', '1', '2025-02-18 23:55:20'),
(422, 353, 'shalon.shadrick@gmail.com', '1', '2025-02-18 23:55:20'),
(423, 400, 'sharee.maile@gmail.com', '1', '2025-02-18 23:55:20'),
(424, 472, 'sharen.bourbon@gmail.com', '1', '2025-02-18 23:55:20'),
(425, 457, 'sharika.eanes@gmail.com', '1', '2025-02-18 23:55:20'),
(426, 117, 'shawna.palaspas@gmail.com', '1', '2025-02-18 23:55:20'),
(427, 481, 'shawnda.yori@gmail.com', '1', '2025-02-18 23:55:20'),
(428, 58, 'shenika.seewald@gmail.com', '1', '2025-02-18 23:55:20'),
(429, 142, 'sheridan.zane@gmail.com', '1', '2025-02-18 23:55:20'),
(430, 340, 'sherita.saras@gmail.com', '1', '2025-02-18 23:55:20'),
(431, 371, 'sheron.louissant@gmail.com', '1', '2025-02-18 23:55:20'),
(432, 442, 'shonda.greenbush@gmail.com', '1', '2025-02-18 23:55:20'),
(433, 6, 'simona.morasca@gmail.com', '1', '2025-02-18 23:55:20'),
(434, 260, 'skye.fillingim@gmail.com', '1', '2025-02-18 23:55:20'),
(435, 36, 'solange.shinko@gmail.com', '1', '2025-02-18 23:55:20'),
(436, 413, 'staci.schmaltz@gmail.com', '1', '2025-02-18 23:55:20'),
(437, 87, 'stephaine.barfield@gmail.com', '1', '2025-02-18 23:55:20'),
(438, 179, 'stephaine.vinning@gmail.com', '1', '2025-02-18 23:55:20'),
(439, 439, 'stephane.myricks@gmail.com', '1', '2025-02-18 23:55:20'),
(440, 89, 'stephen.emigh@gmail.com', '1', '2025-02-18 23:55:20'),
(441, 264, 'stevie.westerbeck@gmail.com', '1', '2025-02-18 23:55:20'),
(442, 112, 'sue.kownacki@gmail.com', '1', '2025-02-18 23:55:20'),
(443, 174, 'sylvia.cousey@gmail.com', '1', '2025-02-18 23:55:20'),
(444, 399, 'sylvie.ryser@gmail.com', '1', '2025-02-18 23:55:20'),
(445, 127, 'talia.riopelle@gmail.com', '1', '2025-02-18 23:55:20'),
(446, 75, 'tamar.hoogland@gmail.com', '1', '2025-02-18 23:55:20'),
(447, 91, 'tammara.wardrip@gmail.com', '1', '2025-02-18 23:55:20'),
(448, 335, 'tarra.nachor@gmail.com', '1', '2025-02-18 23:55:20'),
(449, 237, 'taryn.moyd@gmail.com', '1', '2025-02-18 23:55:20'),
(450, 405, 'tasia.andreason@gmail.com', '1', '2025-02-18 23:55:20'),
(451, 66, 'tawna.buvens@gmail.com', '1', '2025-02-18 23:55:20'),
(452, 404, 'teddy.pedrozo@gmail.com', '1', '2025-02-18 23:55:20'),
(453, 464, 'tegan.arceo@gmail.com', '1', '2025-02-18 23:55:20'),
(454, 188, 'teri.ennaco@gmail.com', '1', '2025-02-18 23:55:20'),
(455, 278, 'terrilyn.rodeigues@gmail.com', '1', '2025-02-18 23:55:20'),
(456, 492, 'thaddeus.ankeny@gmail.com', '1', '2025-02-18 23:55:20'),
(457, 282, 'theodora.restrepo@gmail.com', '1', '2025-02-18 23:55:20'),
(458, 149, 'theola.frey@gmail.com', '1', '2025-02-18 23:55:20'),
(459, 134, 'thurman.manno@gmail.com', '1', '2025-02-18 23:55:20'),
(460, 226, 'tiera.frankel@gmail.com', '1', '2025-02-18 23:55:20'),
(461, 110, 'tiffiny.steffensmeier@gmail.com', '1', '2025-02-18 23:55:20'),
(462, 82, 'timothy.mulqueen@gmail.com', '1', '2025-02-18 23:55:20'),
(463, 56, 'tonette.wenner@gmail.com', '1', '2025-02-18 23:55:20'),
(464, 224, 'tracey.modzelewski@gmail.com', '1', '2025-02-18 23:55:20'),
(465, 300, 'tresa.sweely@gmail.com', '1', '2025-02-18 23:55:20'),
(466, 428, 'trinidad.mcrae@gmail.com', '1', '2025-02-18 23:55:20'),
(467, 386, 'truman.feichtner@gmail.com', '1', '2025-02-18 23:55:20'),
(468, 107, 'twana.felger@gmail.com', '1', '2025-02-18 23:55:20'),
(469, 121, 'ty.smith@gmail.com', '1', '2025-02-18 23:55:20'),
(470, 90, 'tyra.shields@gmail.com', '1', '2025-02-18 23:55:20'),
(471, 140, 'valentin.klimek@gmail.com', '1', '2025-02-18 23:55:20'),
(472, 39, 'valentine.gillian@gmail.com', '1', '2025-02-18 23:55:20'),
(473, 70, 'vallie.mondella@gmail.com', '1', '2025-02-18 23:55:20'),
(474, 128, 'van.shire@gmail.com', '1', '2025-02-18 23:55:20'),
(475, 360, 'venita.maillard@gmail.com', '1', '2025-02-18 23:55:20'),
(476, 22, 'veronika.inouye@gmail.com', '1', '2025-02-18 23:55:20'),
(477, 467, 'vi.rentfro@gmail.com', '1', '2025-02-18 23:55:20'),
(478, 408, 'vilma.berlanga@gmail.com', '1', '2025-02-18 23:55:20'),
(479, 218, 'vincent.meinerding@gmail.com', '1', '2025-02-18 23:55:20'),
(480, 358, 'vincenza.zepp@gmail.com', '1', '2025-02-18 23:55:20'),
(481, 210, 'viola.bitsuie@gmail.com', '1', '2025-02-18 23:55:20'),
(482, 422, 'virgie.kiel@gmail.com', '1', '2025-02-18 23:55:20'),
(483, 225, 'virgina.tegarden@gmail.com', '1', '2025-02-18 23:55:20'),
(484, 79, 'viva.toelkes@gmail.com', '1', '2025-02-18 23:55:20'),
(485, 352, 'weldon.acuff@gmail.com', '1', '2025-02-18 23:55:20'),
(486, 316, 'whitley.tomasulo@gmail.com', '1', '2025-02-18 23:55:20'),
(487, 94, 'wilda.giguere@gmail.com', '1', '2025-02-18 23:55:20'),
(488, 23, 'willard.kolmetz@gmail.com', '1', '2025-02-18 23:55:20'),
(489, 212, 'willodean.konopacki@gmail.com', '1', '2025-02-18 23:55:20'),
(490, 29, 'willow.kusko@gmail.com', '1', '2025-02-18 23:55:20'),
(491, 334, 'winfred.brucato@gmail.com', '1', '2025-02-18 23:55:20'),
(492, 368, 'wynell.dorshorst@gmail.com', '1', '2025-02-18 23:55:20'),
(493, 362, 'xochitl.discipio@gmail.com', '1', '2025-02-18 23:55:20'),
(494, 122, 'xuan.rochin@gmail.com', '1', '2025-02-18 23:55:20'),
(495, 236, 'yoko.fishburne@gmail.com', '1', '2025-02-18 23:55:20'),
(496, 157, 'yolando.luczki@gmail.com', '1', '2025-02-18 23:55:20'),
(497, 41, 'youlanda.schemmer@gmail.com', '1', '2025-02-18 23:55:20'),
(498, 19, 'yuki.whobrey@gmail.com', '1', '2025-02-18 23:55:20'),
(499, 297, 'yvonne.tjepkema@gmail.com', '1', '2025-02-18 23:55:20'),
(500, 374, 'zona.colla@gmail.com', '1', '2025-02-18 23:55:20'),
(501, 1001, 'dipali@gmail.com', '1', '2025-02-19 15:58:44'),
(502, 1001, 'dipali1@gmail.com', '1', '2025-02-19 16:09:16'),
(503, 1002, 'patildipali@gmail.com', '1', '2025-02-19 17:23:15'),
(504, 1007, 'amol@gmail.com', '1', '2025-02-20 18:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_vs_notification`
--

CREATE TABLE `user_vs_notification` (
  `id_user_vs_notification` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `is_active` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_vs_registration_code`
--

CREATE TABLE `user_vs_registration_code` (
  `id_user_registration_code` int(11) NOT NULL,
  `registration_code` int(6) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiry_time` int(11) DEFAULT '180',
  `mobile_number` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_resend` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_vs_registration_code`
--

INSERT INTO `user_vs_registration_code` (`id_user_registration_code`, `registration_code`, `added_on`, `expiry_time`, `mobile_number`, `email`, `is_resend`) VALUES
(1, 321410, '2025-02-17 17:29:56', 180, 8669082115, NULL, '0'),
(2, 969435, '2025-02-17 18:21:11', 180, 8669082116, NULL, '0'),
(3, 218453, '2025-02-17 18:49:17', 180, 8669082117, NULL, '0'),
(4, 679935, '2025-02-17 19:22:38', 180, 8669082118, NULL, '0'),
(5, 125113, '2025-02-18 12:38:07', 180, 8669082119, NULL, '0'),
(6, 147420, '2025-02-18 18:16:32', 180, 8669082120, NULL, '0'),
(7, 222436, '2025-02-19 14:38:44', 180, 9860058383, NULL, '0'),
(8, 351168, '2025-02-19 15:03:40', 180, 8669082115, NULL, '0'),
(9, 336327, '2025-02-19 15:56:04', 180, 9604712039, NULL, '0'),
(10, 626330, '2025-02-19 15:56:04', 180, 9604712039, NULL, '0'),
(11, 262357, '2025-02-19 17:21:57', 180, 9785642352, NULL, '0'),
(12, 213928, '2025-02-19 17:28:37', 180, 7208872088, NULL, '0'),
(13, 264758, '2025-02-19 19:15:03', 180, 9325693256, NULL, '0'),
(14, 829207, '2025-02-19 19:32:56', 180, 9612365896, NULL, '0'),
(15, 269737, '2025-02-20 13:50:05', 180, 9956235689, NULL, '0'),
(16, 124598, '2025-02-20 18:08:45', 180, 8446256233, NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `user_vs_verification_code`
--

CREATE TABLE `user_vs_verification_code` (
  `id_user_verification_code` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `verification_code` int(6) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiry_time` int(11) DEFAULT NULL,
  `mobile_number` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_resend` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_vs_verification_code`
--

INSERT INTO `user_vs_verification_code` (`id_user_verification_code`, `user_id`, `verification_code`, `added_on`, `expiry_time`, `mobile_number`, `email`, `is_resend`) VALUES
(1, 5, 351772, '2025-02-18 18:33:16', 2025, 9834522426, NULL, '0'),
(2, 1001, 359399, '2025-02-19 15:58:04', NULL, 9604712039, 'dipali@gmail.com', '0'),
(3, 1001, 497010, '2025-02-19 16:08:54', NULL, 9604712039, 'dipali1@gmail.com', '0'),
(4, 1002, 800348, '2025-02-19 17:22:57', NULL, 9785642352, 'patildipali@gmail.com', '0'),
(5, 999, 653970, '2025-02-20 17:37:13', 2025, 9860058383, NULL, '0'),
(6, 999, 527718, '2025-02-20 17:38:36', 2025, 9860058383, NULL, '0'),
(7, 999, 516060, '2025-02-20 17:40:49', 2025, 9860058383, NULL, '0'),
(8, 4, 225719, '2025-02-20 17:59:08', 2025, 9073854412, NULL, '0'),
(9, 1007, 446476, '2025-02-20 18:11:45', NULL, 8446256233, 'amol@gmail.com', '0');

-- --------------------------------------------------------

--
-- Table structure for table `user_watchlist`
--

CREATE TABLE `user_watchlist` (
  `user_watchlist_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_wishlist`
--

CREATE TABLE `user_wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_wishlist`
--

INSERT INTO `user_wishlist` (`id`, `user_id`, `product_id`, `added_on`) VALUES
(3, 1004, 2, '2025-02-19 20:42:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `brand_address`
--
ALTER TABLE `brand_address`
  ADD PRIMARY KEY (`brand_address_id`),
  ADD KEY `idx_addressid` (`brand_id`);

--
-- Indexes for table `brand_documents`
--
ALTER TABLE `brand_documents`
  ADD PRIMARY KEY (`brand_doc_id`),
  ADD KEY `brand_documents_brand_id_idx` (`brand_id`);

--
-- Indexes for table `brand_info`
--
ALTER TABLE `brand_info`
  ADD PRIMARY KEY (`brand_info_id`),
  ADD KEY `idx_brand_info` (`brand_id`);

--
-- Indexes for table `brand_vs_category`
--
ALTER TABLE `brand_vs_category`
  ADD PRIMARY KEY (`brand_category_id`),
  ADD UNIQUE KEY `unique` (`brand_id`,`category_id`),
  ADD KEY `idx_brandcat_brand_id` (`brand_id`),
  ADD KEY `idx_brandcat_category_id` (`category_id`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`business_id`);

--
-- Indexes for table `business_vs_brand`
--
ALTER TABLE `business_vs_brand`
  ADD PRIMARY KEY (`business_brand_id`),
  ADD KEY `idx_business_id_check` (`business_id`),
  ADD KEY `idx_brand_id_check` (`brand_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isx_carts_user_id_idx` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `category_sequence`
--
ALTER TABLE `category_sequence`
  ADD PRIMARY KEY (`id_category_sequence`);

--
-- Indexes for table `category_vs_subcategory`
--
ALTER TABLE `category_vs_subcategory`
  ADD PRIMARY KEY (`cat_subcat_id`),
  ADD UNIQUE KEY `UNIQUE_CAT_SUB_ADD` (`category_id`,`sub_category_id`,`is_active`,`added_on`),
  ADD KEY `subCategoryIdCheck` (`sub_category_id`),
  ADD KEY `categoryIdCheck_idx` (`category_id`);

--
-- Indexes for table `contact_form`
--
ALTER TABLE `contact_form`
  ADD PRIMARY KEY (`id_contact_form`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`offer_id`),
  ADD UNIQUE KEY `offercode_UNIQUE` (`offercode`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `idx_prders_user_id_idx` (`user_id`),
  ADD KEY `idx_order_address_id_idx` (`address_id`);

--
-- Indexes for table `order_offers`
--
ALTER TABLE `order_offers`
  ADD PRIMARY KEY (`id_order_offers`),
  ADD KEY `idx_order_offers_order_id_idx` (`order_id`),
  ADD KEY `idx_order_offers_offercode_id_idx` (`offer_id`);

--
-- Indexes for table `order_vs_product`
--
ALTER TABLE `order_vs_product`
  ADD PRIMARY KEY (`id_order_vs_product`),
  ADD KEY `idx_orders_vs_product_order_id_idx` (`order_id`),
  ADD KEY `idx_orders_vs_product_product_id_idx` (`product_id`),
  ADD KEY `idx_orders_vs_product_category_id_idx` (`category_id`),
  ADD KEY `idx_orders_vs_product_subcategory_id_idx` (`subcategory_id`),
  ADD KEY `idx_orders_vs_product_brand_id_idx` (`brand_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`prod_img_id`),
  ADD KEY `idx_prodImage_prod_id` (`product_id`);

--
-- Indexes for table `product_mapping`
--
ALTER TABLE `product_mapping`
  ADD PRIMARY KEY (`product_mapping_id`),
  ADD UNIQUE KEY `uniqueIndex` (`product_id`,`brand_id`,`category_id`,`sub_category_id`,`is_active`),
  ADD KEY `idx_mapping_prod_id` (`product_id`),
  ADD KEY `idx_mapping_brand_id` (`brand_id`),
  ADD KEY `idx_mapping_cat_id` (`category_id`),
  ADD KEY `idx_mapping_sub_cat_id` (`sub_category_id`);

--
-- Indexes for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`sub_category_id`),
  ADD UNIQUE KEY `sub_category_name` (`sub_category_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `mobile_number` (`mobile_number`);

--
-- Indexes for table `user_vs_address`
--
ALTER TABLE `user_vs_address`
  ADD PRIMARY KEY (`id_user_vs_address`),
  ADD KEY `user_vs_address_user_id_idx` (`user_id`);

--
-- Indexes for table `user_vs_category`
--
ALTER TABLE `user_vs_category`
  ADD PRIMARY KEY (`user_cat_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`category_id`,`is_active`) USING BTREE,
  ADD KEY `caegoryCheck` (`category_id`);

--
-- Indexes for table `user_vs_email`
--
ALTER TABLE `user_vs_email`
  ADD PRIMARY KEY (`user_vs_email_id`),
  ADD UNIQUE KEY `idx_unique_email_user` (`user_id`,`email_id`,`is_active`);

--
-- Indexes for table `user_vs_notification`
--
ALTER TABLE `user_vs_notification`
  ADD PRIMARY KEY (`id_user_vs_notification`),
  ADD UNIQUE KEY `unique` (`user_id`,`email_id`,`is_active`);

--
-- Indexes for table `user_vs_registration_code`
--
ALTER TABLE `user_vs_registration_code`
  ADD PRIMARY KEY (`id_user_registration_code`);

--
-- Indexes for table `user_vs_verification_code`
--
ALTER TABLE `user_vs_verification_code`
  ADD PRIMARY KEY (`id_user_verification_code`),
  ADD KEY `userVerification_idx` (`user_id`);

--
-- Indexes for table `user_watchlist`
--
ALTER TABLE `user_watchlist`
  ADD PRIMARY KEY (`user_watchlist_id`),
  ADD KEY `idx_watchlist_user_id_idx` (`user_id`),
  ADD KEY `idx_watchlist_product_id_idx` (`product_id`);

--
-- Indexes for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_carts_user_id_idx` (`user_id`),
  ADD KEY `idx_carts_product_id_idx` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `brand_address`
--
ALTER TABLE `brand_address`
  MODIFY `brand_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `brand_documents`
--
ALTER TABLE `brand_documents`
  MODIFY `brand_doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `brand_info`
--
ALTER TABLE `brand_info`
  MODIFY `brand_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `brand_vs_category`
--
ALTER TABLE `brand_vs_category`
  MODIFY `brand_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `business_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `business_vs_brand`
--
ALTER TABLE `business_vs_brand`
  MODIFY `business_brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `category_sequence`
--
ALTER TABLE `category_sequence`
  MODIFY `id_category_sequence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=355;

--
-- AUTO_INCREMENT for table `category_vs_subcategory`
--
ALTER TABLE `category_vs_subcategory`
  MODIFY `cat_subcat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `contact_form`
--
ALTER TABLE `contact_form`
  MODIFY `id_contact_form` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_vs_product`
--
ALTER TABLE `order_vs_product`
  MODIFY `id_order_vs_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `prod_img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `product_mapping`
--
ALTER TABLE `product_mapping`
  MODIFY `product_mapping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `rating_review`
--
ALTER TABLE `rating_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `sub_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT for table `user_vs_address`
--
ALTER TABLE `user_vs_address`
  MODIFY `id_user_vs_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=606;

--
-- AUTO_INCREMENT for table `user_vs_category`
--
ALTER TABLE `user_vs_category`
  MODIFY `user_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1294;

--
-- AUTO_INCREMENT for table `user_vs_email`
--
ALTER TABLE `user_vs_email`
  MODIFY `user_vs_email_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

--
-- AUTO_INCREMENT for table `user_vs_notification`
--
ALTER TABLE `user_vs_notification`
  MODIFY `id_user_vs_notification` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_vs_registration_code`
--
ALTER TABLE `user_vs_registration_code`
  MODIFY `id_user_registration_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_vs_verification_code`
--
ALTER TABLE `user_vs_verification_code`
  MODIFY `id_user_verification_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_watchlist`
--
ALTER TABLE `user_watchlist`
  MODIFY `user_watchlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brand_address`
--
ALTER TABLE `brand_address`
  ADD CONSTRAINT `idx_addressid` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`);

--
-- Constraints for table `brand_documents`
--
ALTER TABLE `brand_documents`
  ADD CONSTRAINT `brand_documents_brand_id_idx` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`);

--
-- Constraints for table `brand_info`
--
ALTER TABLE `brand_info`
  ADD CONSTRAINT `idx_brand_info` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`);

--
-- Constraints for table `brand_vs_category`
--
ALTER TABLE `brand_vs_category`
  ADD CONSTRAINT `idx_brandcat_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `idx_brandcat_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `business_vs_brand`
--
ALTER TABLE `business_vs_brand`
  ADD CONSTRAINT `idx_brand_id_check` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `idx_business_id_check` FOREIGN KEY (`business_id`) REFERENCES `business` (`business_id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `isx_carts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `category_vs_subcategory`
--
ALTER TABLE `category_vs_subcategory`
  ADD CONSTRAINT `categoryIdCheck` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `subCategoryIdCheck` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`sub_category_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `idx_order_address_id` FOREIGN KEY (`address_id`) REFERENCES `user_vs_address` (`id_user_vs_address`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idx_orders_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_offers`
--
ALTER TABLE `order_offers`
  ADD CONSTRAINT `idx_order_offers_offercode_id` FOREIGN KEY (`offer_id`) REFERENCES `order_offers` (`id_order_offers`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idx_order_offers_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_vs_product`
--
ALTER TABLE `order_vs_product`
  ADD CONSTRAINT `idx_orders_vs_product_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idx_orders_vs_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idx_orders_vs_product_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idx_orders_vs_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idx_orders_vs_product_subcategory_id` FOREIGN KEY (`subcategory_id`) REFERENCES `sub_category` (`sub_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `idx_prodImage_prod_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_mapping`
--
ALTER TABLE `product_mapping`
  ADD CONSTRAINT `idx_mapping_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `idx_mapping_cat_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `idx_mapping_prod_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `idx_mapping_sub_cat_id` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`sub_category_id`);

--
-- Constraints for table `user_vs_address`
--
ALTER TABLE `user_vs_address`
  ADD CONSTRAINT `user_vs_address_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_vs_category`
--
ALTER TABLE `user_vs_category`
  ADD CONSTRAINT `caegoryCheck` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `userCheckCat` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_vs_email`
--
ALTER TABLE `user_vs_email`
  ADD CONSTRAINT `user_vs_email_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_vs_notification`
--
ALTER TABLE `user_vs_notification`
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_vs_verification_code`
--
ALTER TABLE `user_vs_verification_code`
  ADD CONSTRAINT `userVerification` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_watchlist`
--
ALTER TABLE `user_watchlist`
  ADD CONSTRAINT `idx_watchlist_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idx_watchlist_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  ADD CONSTRAINT `idx_carts_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idx_carts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
