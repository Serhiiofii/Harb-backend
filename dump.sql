-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: harbourhub
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.10.2

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
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payments` tinyint(1) NOT NULL DEFAULT '0',
  `orders` tinyint(1) NOT NULL DEFAULT '0',
  `products` tinyint(1) NOT NULL DEFAULT '0',
  `services` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_roles_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES ('eb237979-a2f3-4647-84c7-8b3cbb7d9ae2','14fb42cd-9ce8-4916-aefb-5103660c65a6',1,1,1,1,'2023-01-29 19:38:50','2023-02-06 12:06:45'),('c9d130d0-9dc4-4c04-8df3-671e1f3412b2','15c65225-5dcb-412e-8692-c3dac99aab96',0,1,1,1,'2023-01-30 09:45:49','2023-02-06 05:59:41'),('8b68de80-bfcf-46e4-96b1-960a54146885','42202bb5-83c0-46e6-9875-8ec2d2cf77d5',0,0,0,1,'2023-02-03 10:44:10','2023-02-06 06:00:41'),('d21c7aeb-d423-4127-89ac-c21373c5c614','7e5f1260-5f04-43ff-80ec-3eba5ee1b913',0,1,1,1,'2023-02-03 10:48:34','2023-02-06 06:00:22'),('c5a8a08f-c451-4460-a5ec-ef3d4a0ae89e','0330c600-ed19-4ca1-9768-cb764cebe4e7',0,1,1,1,'2023-02-03 13:18:47','2023-02-06 06:00:15');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booked_services`
--

DROP TABLE IF EXISTS `booked_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booked_services` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(64,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booked_services_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booked_services`
--

LOCK TABLES `booked_services` WRITE;
/*!40000 ALTER TABLE `booked_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `booked_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `equipment_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checkout_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bid_amount` decimal(64,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES ('04675cf7-402d-4bea-b8cd-996b3062ad3b','23557de8-56ce-4a0f-9f0e-c7824df69ee7','c44d3e78-97cd-4807-b8fb-051b6e5374b0','poXF8WAMC0',30000.00,'2023-01-27 16:30:19','2023-01-27 16:30:19'),('0d63cf46-bc1f-411e-9508-cf68d75f9003','facda5b1-3ca6-4cd7-bdc5-b51207af820e','60e65a37-3c14-4082-9f90-3f2c08857d3f','As4d1LRrH2',50000.00,'2023-01-27 16:43:01','2023-01-27 16:43:01'),('332c2183-6cd2-4153-ba9d-cb09509c5c0c','96ef70ce-2345-47ac-84e3-f65851d1e7ae','9c1c2b9c-95a2-4cf4-8a2c-c5cde5da393f','WuN0hwfMvQ',50000.00,'2023-02-02 18:52:15','2023-02-02 18:52:15'),('4e93c08a-f1bd-400d-9cde-3b01c412bf7d','c6fd29e9-5699-4377-8a0b-b4de30252191','a009a4c1-468f-431b-ab9b-ba30e921aa0c','GPtpYtWFn7',50000.00,'2023-04-18 16:54:40','2023-04-18 16:54:40'),('8fe00063-80b8-448a-b1fd-7c67751f8823','68114c05-2c3c-49da-aebf-6d267fd9cd65','ebd20fa9-1ec8-4646-8034-25fe9819f869','uZDHhJquMw',50000.00,'2023-02-02 19:03:15','2023-02-02 19:03:15'),('94c3df1a-eeb2-4d80-b1f0-fc2e7c0fdeb1','23557de8-56ce-4a0f-9f0e-c7824df69ee7','c44d3e78-97cd-4807-b8fb-051b6e5374b0','poXF8WAMC0',30000.00,'2023-01-27 16:32:01','2023-01-27 16:32:01'),('c41c1c89-0b1c-438e-b8cd-780ce4136ef3','96ef70ce-2345-47ac-84e3-f65851d1e7ae','d6144c21-b893-4f54-a310-05f0720d642f','WuN0hwfMvQ',1000.00,'2023-04-18 16:54:35','2023-04-18 16:54:35'),('c6c2d81c-11d1-4f37-83ae-511b6d2d7b5e','facda5b1-3ca6-4cd7-bdc5-b51207af820e','60e65a37-3c14-4082-9f90-3f2c08857d3f','As4d1LRrH2',50000.00,'2023-01-29 20:20:21','2023-01-29 20:20:21'),('dca65ee3-8488-4e11-818b-43f799484215','96ef70ce-2345-47ac-84e3-f65851d1e7ae','d6144c21-b893-4f54-a310-05f0720d642f','WuN0hwfMvQ',1000.00,'2023-04-18 16:54:44','2023-04-18 16:54:44');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacturer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `equipment_specification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `build_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_count` bigint unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment_user_id_index` (`user_id`),
  KEY `equipment_seller_id_index` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES ('90cbc772-77ca-4413-acdc-463bc3fdf3b3','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','Pipes','octg pipes','Bluetide','Industrial Pipe','2010-02-01','sale','Pipes for Oil and Gas',0,'2023-02-11 09:32:57','2023-02-11 09:32:57'),('a009a4c1-468f-431b-ab9b-ba30e921aa0c','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','Bulldozer','Hauling Equipment','DOOSAN','DL300A','2020-11-21','rent','Bulldozer',0,'2023-02-01 10:00:24','2023-02-01 10:00:24'),('a79f8957-753f-4b32-9897-b6d7b236ce73','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','Cargo Vessel','Vessels','Evergreen','Cargo Vessel','2016-01-22','rent','Evergreen Cargo Vessel',0,'2023-02-01 10:41:32','2023-02-01 10:41:32'),('bd8672fd-ad7b-4fe9-9cbb-e9856f6b3603','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','Bulldozer','Hauling Equipment','Allis-Charmers','Allis01-129','2017-11-21','rent','Bulldozer for offshore equipment hauling',0,'2023-02-02 19:21:26','2023-02-02 19:21:26'),('bf9d8812-37ef-48d4-bbaa-fd0d3c3b63c4','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','Forklift','Cranes','Toyota','Tokyo25','2021-01-12','sale','Toyota Forklift',0,'2023-02-01 12:22:18','2023-02-01 12:22:18'),('d6144c21-b893-4f54-a310-05f0720d642f','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','Truck','hauling equipment','ROMAN','TRCK779','2009-11-22','rent','Hauling Truck',0,'2023-02-11 09:20:12','2023-02-11 09:20:12');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_custom_specifications`
--

DROP TABLE IF EXISTS `equipment_custom_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_custom_specifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `equipment_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment_custom_specifications_user_id_index` (`user_id`),
  KEY `equipment_custom_specifications_equipment_id_index` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_custom_specifications`
--

LOCK TABLES `equipment_custom_specifications` WRITE;
/*!40000 ALTER TABLE `equipment_custom_specifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment_custom_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_images`
--

DROP TABLE IF EXISTS `equipment_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_images` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `equipment_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment_images_equipment_id_index` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_images`
--

LOCK TABLES `equipment_images` WRITE;
/*!40000 ALTER TABLE `equipment_images` DISABLE KEYS */;
INSERT INTO `equipment_images` VALUES ('16c930ef-a118-404d-b2ba-0694bfbea62c','bf9d8812-37ef-48d4-bbaa-fd0d3c3b63c4','https://harbourhub.xyz/images/202302011222download-(1).jpeg','2023-02-01 12:22:18','2023-02-01 12:22:18'),('2e8ffd9e-d4b2-4fc6-bf9c-0e3c3631f4c4','a79f8957-753f-4b32-9897-b6d7b236ce73','https://harbourhub.xyz/images/202302011041download.jpeg','2023-02-01 10:41:32','2023-02-01 10:41:32'),('30d3ccc8-933c-4fdf-abaa-ef157a46dd88','90cbc772-77ca-4413-acdc-463bc3fdf3b3','https://harbourhub.xyz/images/202302110932octg-scaled.jpg','2023-02-11 09:32:57','2023-02-11 09:32:57'),('4b970e9f-fd74-4171-9657-242579c0853e','bd8672fd-ad7b-4fe9-9cbb-e9856f6b3603','https://harbourhub.xyz/images/202302021921bulll.png','2023-02-02 19:21:26','2023-02-02 19:21:26'),('c69a624d-0d19-4c55-8a45-92f3fa5989e3','d6144c21-b893-4f54-a310-05f0720d642f','https://harbourhub.xyz/images/202302110920pexels-mehmet-turgut-kirkgoz-14214416-(1).jpg','2023-02-11 09:20:12','2023-02-11 09:20:12'),('d0c3ebaa-db4b-41f3-a656-ad03ee1ec20c','a009a4c1-468f-431b-ab9b-ba30e921aa0c','https://harbourhub.xyz/images/202302011000download-(1).png','2023-02-01 10:00:24','2023-02-01 10:00:24');
/*!40000 ALTER TABLE `equipment_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_11_21_123358_create_sellers_table',1),(6,'2022_11_21_123603_create_seller_documents_table',1),(7,'2022_11_21_123809_create_seller_business_accounts_table',1),(8,'2022_12_14_135254_create_equipment_table',1),(9,'2022_12_14_135658_create_equipment_images_table',1),(10,'2022_12_14_141857_create_equipment_custom_specifications_table',1),(11,'2022_12_14_142707_create_services_table',1),(12,'2022_12_15_141311_create_payments_table',1),(13,'2022_12_20_172001_create_booked_services_table',1),(14,'2022_12_20_173812_create_placed_orders_table',1),(15,'2022_12_30_165204_create_product_bids_table',1),(16,'2022_12_31_003647_create_cart_items_table',1),(17,'2023_01_02_142622_create_user_notifications_table',1),(18,'2023_01_04_000909_create_saved_items_table',1),(19,'2023_01_04_152408_create_support_messages_table',1),(20,'2023_01_04_152625_create_support_message_images_table',1),(21,'2023_01_12_114235_create_admin_roles_table',1),(22,'2023_01_27_161937_add_field_to_user_notifications_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `equipment_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(64,2) NOT NULL,
  `checkout_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_user_id_index` (`user_id`),
  KEY `payments_equipment_id_index` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES ('95cf2124-e36f-49e5-91c9-26ad10e0a7e3','facda5b1-3ca6-4cd7-bdc5-b51207af820e','60e65a37-3c14-4082-9f90-3f2c08857d3f','sale','equipment',50000.00,'As4d1LRrH2','zwuVtrnYIc','pending','2023-01-29 20:24:32','2023-01-29 20:24:32'),('d00512ce-4601-4397-ae95-f70d140a20f7','68114c05-2c3c-49da-aebf-6d267fd9cd65','ebd20fa9-1ec8-4646-8034-25fe9819f869','rent','equipment',50000.00,'uZDHhJquMw','h1Wb7l46EB','pending','2023-02-02 19:06:10','2023-02-02 19:06:10'),('ea9a1f42-8e67-4f0f-89b7-6fa7951929cd','facda5b1-3ca6-4cd7-bdc5-b51207af820e','60e65a37-3c14-4082-9f90-3f2c08857d3f','sale','equipment',50000.00,'As4d1LRrH2','zwuVtrnYIc','pending','2023-01-29 20:24:32','2023-01-29 20:24:32');
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
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (5,'App\\Models\\User','facda5b1-3ca6-4cd7-bdc5-b51207af820e','owen@gmail.com','448d5d5aec9bbd5bb6915ee66896d4cdd359c1fe362d42853b56428bdeeea5e3','[\"*\"]','2023-01-26 03:09:02',NULL,'2023-01-25 23:21:29','2023-01-26 03:09:02'),(7,'App\\Models\\User','facda5b1-3ca6-4cd7-bdc5-b51207af820e','owen@gmail.com','024587c9806d68afd71b1d6cafee0e9c01e9e7825e99f002b7accb64d758cd2b','[\"*\"]','2023-01-26 03:14:30',NULL,'2023-01-26 03:09:24','2023-01-26 03:14:30'),(13,'App\\Models\\User','facda5b1-3ca6-4cd7-bdc5-b51207af820e','owen@gmail.com','0265799647c09373b9c60c528c9b99a786fc1d6e73284d2122176b6b81caccf0','[\"*\"]','2023-01-26 03:56:57',NULL,'2023-01-26 03:49:34','2023-01-26 03:56:57'),(15,'App\\Models\\User','23557de8-56ce-4a0f-9f0e-c7824df69ee7','hello@gmail.com','bb3a3b7a783f5ebabf4e31cfe512ce8b87e4d638f8630e6dcf98f436c42c5f48','[\"*\"]','2023-01-26 04:00:40',NULL,'2023-01-26 03:59:57','2023-01-26 04:00:40'),(17,'App\\Models\\User','facda5b1-3ca6-4cd7-bdc5-b51207af820e','owen@gmail.com','520c9276ce3c4e7929141fc0d21bf641bc25e322522b835dc2828ce68cbc50e9','[\"*\"]','2023-01-26 23:06:37',NULL,'2023-01-26 04:01:29','2023-01-26 23:06:37'),(20,'App\\Models\\User','facda5b1-3ca6-4cd7-bdc5-b51207af820e','owen@gmail.com','97a5937279f778664916a29ae07e4e36ff734a9fa973e6cbd9ce2acd154cbc94','[\"*\"]','2023-01-26 23:09:18',NULL,'2023-01-26 23:08:37','2023-01-26 23:09:18'),(21,'App\\Models\\User','8882192e-7ddd-43a7-9da3-d811af4e86d7','alaboexcel123@gmail.com','463a612a99d512f161dfebd72c04b0e4377dfe31de11d7bf21bad11658f236d3','[\"*\"]','2023-01-26 23:11:03',NULL,'2023-01-26 23:10:34','2023-01-26 23:11:03'),(23,'App\\Models\\User','facda5b1-3ca6-4cd7-bdc5-b51207af820e','owen@gmail.com','2a4048c51fb786fa8efa92d6b3f7c937a29dd10ae08eca1f5c16a3acb4006ce5','[\"*\"]','2023-01-27 16:15:01',NULL,'2023-01-26 23:11:48','2023-01-27 16:15:01'),(26,'App\\Models\\User','facda5b1-3ca6-4cd7-bdc5-b51207af820e','owen@gmail.com','e6016fc50f44c11cf60a8d5951739006ed8e645e9e49dd4b404b67ec5a526e30','[\"*\"]','2023-01-27 16:28:42',NULL,'2023-01-27 16:27:54','2023-01-27 16:28:42'),(28,'App\\Models\\User','facda5b1-3ca6-4cd7-bdc5-b51207af820e','owen@gmail.com','76d8ac1b30c8423ca8a73076dc6ebcabc2c98aba7b3ede61c1e33186c3697eef','[\"*\"]','2023-01-27 16:34:20',NULL,'2023-01-27 16:29:44','2023-01-27 16:34:20'),(30,'App\\Models\\User','facda5b1-3ca6-4cd7-bdc5-b51207af820e','owen@gmail.com','c0891c04bd0c052431ff79d1171d5a07b75e215f00e439b037157f1898a5c280','[\"*\"]','2023-01-28 05:11:01',NULL,'2023-01-27 16:43:38','2023-01-28 05:11:01'),(32,'App\\Models\\User','facda5b1-3ca6-4cd7-bdc5-b51207af820e','owen@gmail.com','4f0acda170f41672726ccfd83302c566836c5e8e040582708d3dfe9935550be6','[\"*\"]','2023-01-28 05:24:52',NULL,'2023-01-28 05:15:40','2023-01-28 05:24:52'),(35,'App\\Models\\User','facda5b1-3ca6-4cd7-bdc5-b51207af820e','owen@gmail.com','0b677a82be0f89ebc6a482882bd76117c2e4e12ac2ab2a4ec6e886e5a34a1a90','[\"*\"]','2023-01-29 20:56:00',NULL,'2023-01-29 20:20:42','2023-01-29 20:56:00'),(36,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','05c6540fe03934e9e48ed5e25aa791b8a95f3b1385f84c4cd3bafc8b678fceb3','[\"*\"]','2023-01-29 20:57:58',NULL,'2023-01-29 20:56:14','2023-01-29 20:57:58'),(37,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','919d60ff9c56f094eeec27e6f1fd3f500068a6335a67648d62631445524dfb6e','[\"*\"]','2023-01-29 20:58:18',NULL,'2023-01-29 20:58:18','2023-01-29 20:58:18'),(38,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','d91c02c92994b6254dbf878fc07dcb970db6f14eda9c4aec3532664b304b1c74','[\"*\"]','2023-01-30 07:17:36',NULL,'2023-01-29 20:59:14','2023-01-30 07:17:36'),(45,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','5864c4ba2f13f70e9d4c6d749f48f21a34dd336a976b2bef3c0fe2495ed31595','[\"*\"]',NULL,NULL,'2023-01-30 07:40:21','2023-01-30 07:40:21'),(47,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','1c6663d7cb0eba68bf2645ff05a13f9f95b7147e95bdb61ee8000fbf2c745080','[\"*\"]','2023-01-30 09:46:54',NULL,'2023-01-30 08:53:14','2023-01-30 09:46:54'),(48,'App\\Models\\User','15c65225-5dcb-412e-8692-c3dac99aab96','o.gideon@hotmail.com','0f9e7176d54ff8f870726dad05fa1d71ae83180113c3a4236bd20a8638b905d2','[\"*\"]','2023-01-31 13:39:05',NULL,'2023-01-30 09:47:18','2023-01-31 13:39:05'),(57,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','1764d0cb8f603b421598c452d29d29084cc39b3ef0e4e47c1594d935481b90bc','[\"*\"]','2023-02-01 17:14:30',NULL,'2023-02-01 10:28:07','2023-02-01 17:14:30'),(63,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','6cfdfc75596b135b2070d88a3c94805b21720e9588ce646c52a56e95ddc2763f','[\"*\"]','2023-02-03 13:25:50',NULL,'2023-02-02 18:29:33','2023-02-03 13:25:50'),(64,'App\\Models\\User','68114c05-2c3c-49da-aebf-6d267fd9cd65','owen@gmail.com','588fa35b6fed8c8613ebe0068d2e3e91988d9a152b1b9d1245c44516b91b8303','[\"*\"]','2023-02-02 18:51:04',NULL,'2023-02-02 18:42:55','2023-02-02 18:51:04'),(68,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','855c539b7cf4b9d000b76db1981843351550bdf395b948dc8848ebfa1507dfe7','[\"*\"]','2023-02-02 19:00:59',NULL,'2023-02-02 18:53:33','2023-02-02 19:00:59'),(69,'App\\Models\\User','68114c05-2c3c-49da-aebf-6d267fd9cd65','owen@gmail.com','dea8321ae959f00c4ef9d5e3c001af16d29c8a86a1d778bf6a4b7efdb71f131f','[\"*\"]','2023-02-02 19:15:17',NULL,'2023-02-02 18:59:33','2023-02-02 19:15:17'),(71,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','c3432d010cfe7441f2b2e35f42ed2181c41781921f9ea1b573ff852eb8ed2e0c','[\"*\"]','2023-02-02 19:12:42',NULL,'2023-02-02 19:07:13','2023-02-02 19:12:42'),(73,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','17ada74c0fae3e6f4c0a63061e4290ecd7c0c8a7b9a5110996565657374efe4c','[\"*\"]','2023-02-02 19:43:20',NULL,'2023-02-02 19:19:45','2023-02-02 19:43:20'),(76,'App\\Models\\User','d99350aa-a84d-41ae-852d-f2db9aa14882','udoka.okuofu@yahoo.com','9ffc3be6771e7134a7eda3316dd0bd0c590619a3bbae927c4b3b50dd6268e977','[\"*\"]','2023-02-03 08:55:47',NULL,'2023-02-03 08:42:32','2023-02-03 08:55:47'),(77,'App\\Models\\User','d99350aa-a84d-41ae-852d-f2db9aa14882','udoka.okuofu@yahoo.com','d9930cdad1c2ae16ab87d84a35fc509f584cc1f30065e9bcbba778f611b758c4','[\"*\"]','2023-02-03 09:00:00',NULL,'2023-02-03 08:59:59','2023-02-03 09:00:00'),(79,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','5ffccdd811fbf1246bb8c6bbf040c1233e314b76af8a227c5966ff36815daa8b','[\"*\"]','2023-02-03 13:43:03',NULL,'2023-02-03 10:42:45','2023-02-03 13:43:03'),(80,'App\\Models\\User','0330c600-ed19-4ca1-9768-cb764cebe4e7','georgiacharles247@gmail.com','9513945f36fd51010a8392778ac8afd5ce18d2c0e67be6ea15344807fa513587','[\"*\"]','2023-02-03 13:21:08',NULL,'2023-02-03 13:19:51','2023-02-03 13:21:08'),(81,'App\\Models\\User','7e5f1260-5f04-43ff-80ec-3eba5ee1b913','gideon.onye@pyloop.com','7cded481d01f6302a23fa54a3bec20dd4b1542ba62a39f93c4afcff27ea88c80','[\"*\"]','2023-02-03 13:21:32',NULL,'2023-02-03 13:21:32','2023-02-03 13:21:32'),(82,'App\\Models\\User','7e5f1260-5f04-43ff-80ec-3eba5ee1b913','gideon.onye@pyloop.com','e2e682f919fb7163b2b24955ebe770122a61c8f12bb41f65d666ec2906638cd6','[\"*\"]','2023-02-03 16:37:04',NULL,'2023-02-03 13:26:25','2023-02-03 16:37:04'),(84,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','908c1b3ec8b8b4819e7c6fb0b043e919f759f6975d019d7df4a7c8c9e01cf018','[\"*\"]','2023-02-03 16:07:01',NULL,'2023-02-03 13:47:02','2023-02-03 16:07:01'),(86,'App\\Models\\User','7e5f1260-5f04-43ff-80ec-3eba5ee1b913','gideon.onye@pyloop.com','ad5009b9003941fb9abb7986bdd37b36549afbb7e4bcc165810c85e54399b220','[\"*\"]','2023-02-03 17:02:51',NULL,'2023-02-03 17:01:44','2023-02-03 17:02:51'),(88,'App\\Models\\User','7e5f1260-5f04-43ff-80ec-3eba5ee1b913','gideon.onye@pyloop.com','ca2013b9f10343356fb9a4d356323bbba473c600c551679ebb260e87349cb1ec','[\"*\"]','2023-02-03 17:55:22',NULL,'2023-02-03 17:46:59','2023-02-03 17:55:22'),(90,'App\\Models\\User','68114c05-2c3c-49da-aebf-6d267fd9cd65','owen@gmail.com','ee00f62e3f0b2c0cc0bef1905c94013229a968a67f70fda4cc0f3695da81d227','[\"*\"]','2023-02-04 06:04:46',NULL,'2023-02-04 06:04:08','2023-02-04 06:04:46'),(94,'App\\Models\\User','7e5f1260-5f04-43ff-80ec-3eba5ee1b913','gideon.onye@pyloop.com','39ac0f7262d6a743b65d6865dab7de2777960d4a51df8f801127ef5123982209','[\"*\"]','2023-02-04 09:43:11',NULL,'2023-02-04 09:42:52','2023-02-04 09:43:11'),(96,'App\\Models\\User','7e5f1260-5f04-43ff-80ec-3eba5ee1b913','gideon.onye@pyloop.com','ccbfb80b4d50dd597304cbae2270d04e378052a55dd6a8c5ec92c899ba413dea','[\"*\"]','2023-02-07 12:48:36',NULL,'2023-02-04 19:33:50','2023-02-07 12:48:36'),(97,'App\\Models\\User','0330c600-ed19-4ca1-9768-cb764cebe4e7','georgiacharles247@gmail.com','02f25ded1c1c490e3d951ad55bb604b4399d252bcfc62a11449e600a48ee6a44','[\"*\"]','2023-02-06 10:50:40',NULL,'2023-02-06 10:48:42','2023-02-06 10:50:40'),(98,'App\\Models\\User','d99350aa-a84d-41ae-852d-f2db9aa14882','udoka.okuofu@yahoo.com','d8e0b12acbe93f646aa3b6b3c605be0c51fbcf2aa7272f3128b414047e80d3ba','[\"*\"]','2023-02-06 11:15:19',NULL,'2023-02-06 11:10:57','2023-02-06 11:15:19'),(99,'App\\Models\\User','68114c05-2c3c-49da-aebf-6d267fd9cd65','owen@gmail.com','ca7838947bba36356f12a9d20ae9f138b152503ae173a2862e74c6d49ae721be','[\"*\"]','2023-02-06 12:04:24',NULL,'2023-02-06 12:04:22','2023-02-06 12:04:24'),(101,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','deeb6c6bfcc920bbaa6247eed315e762246d112b768fb7959430d33260a6bdda','[\"*\"]','2023-02-06 12:13:47',NULL,'2023-02-06 12:05:31','2023-02-06 12:13:47'),(103,'App\\Models\\User','14fb42cd-9ce8-4916-aefb-5103660c65a6','admin123@gmail.com','2f9f0670670916ed2270157abeb0e4a4c5af79b1d09401310fbc87ad407fae35','[\"*\"]','2023-02-07 16:10:33',NULL,'2023-02-07 16:10:32','2023-02-07 16:10:33'),(104,'App\\Models\\User','7e5f1260-5f04-43ff-80ec-3eba5ee1b913','gideon.onye@pyloop.com','1a39cfc7d51ce0836d2ccb5318a31a6a79015fb3f80422deeaa894a1a6ff50ce','[\"*\"]','2023-02-07 16:20:03',NULL,'2023-02-07 16:19:45','2023-02-07 16:20:03'),(105,'App\\Models\\User','68114c05-2c3c-49da-aebf-6d267fd9cd65','owen@gmail.com','45349418d3a7630719addfcc3c6e1edcd03ab18c42c42e931c83d55d1a9294c9','[\"*\"]','2023-02-07 21:14:35',NULL,'2023-02-07 21:08:42','2023-02-07 21:14:35'),(106,'App\\Models\\User','96ef70ce-2345-47ac-84e3-f65851d1e7ae','gonyewuenyi@gmail.com','f394a9d450dc109f1fed8e0c88b5123832051a2763e238530d9b4d0443e5c0f0','[\"*\"]','2023-02-11 09:22:14',NULL,'2023-02-08 12:29:15','2023-02-11 09:22:14'),(107,'App\\Models\\User','68114c05-2c3c-49da-aebf-6d267fd9cd65','owen@gmail.com','30322373c586d9bbefa647bb7d6f7c0cff7084704d69b47ff64ba624f4ac5d2c','[\"*\"]','2023-02-08 14:06:37',NULL,'2023-02-08 13:33:58','2023-02-08 14:06:37'),(108,'App\\Models\\User','68114c05-2c3c-49da-aebf-6d267fd9cd65','owen@gmail.com','83471a32edb7cf2ce0843463871ee736020e4fd6ac4f4748445f035f571daed8','[\"*\"]','2023-02-11 08:58:57',NULL,'2023-02-11 08:58:50','2023-02-11 08:58:57'),(109,'App\\Models\\User','68114c05-2c3c-49da-aebf-6d267fd9cd65','owen@gmail.com','d5dcd293c3d316e7925f32c7a7df68a1bc70ddc8019659226f124a08e4c049a9','[\"*\"]','2023-02-11 09:37:12',NULL,'2023-02-11 09:01:14','2023-02-11 09:37:12'),(110,'App\\Models\\User','96ef70ce-2345-47ac-84e3-f65851d1e7ae','gonyewuenyi@gmail.com','02257b0c56a2360069a0d74694c97037089e1c70f14e84058c767a85505ecbb3','[\"*\"]','2023-02-17 14:53:56',NULL,'2023-02-11 09:23:08','2023-02-17 14:53:56'),(111,'App\\Models\\User','c6fd29e9-5699-4377-8a0b-b4de30252191','alaboexcel@gmail.com','84f7be03d474d865114fe1f079bab347ab6799aebc3b84f6435e2a45de626529','[\"*\"]','2023-02-23 18:01:01',NULL,'2023-02-11 09:38:25','2023-02-23 18:01:01'),(112,'App\\Models\\User','7e5f1260-5f04-43ff-80ec-3eba5ee1b913','gideon.onye@pyloop.com','eb36eabde95cd585e9294a46fa93b252eaeb46ce0cf80b2e4962194735ffc80e','[\"*\"]','2023-02-11 09:39:36',NULL,'2023-02-11 09:38:31','2023-02-11 09:39:36'),(113,'App\\Models\\User','68114c05-2c3c-49da-aebf-6d267fd9cd65','owen@gmail.com','c22342baa9b6e181c69703cb22a970d01ef1813d462406e25a41ff1abc9766e0','[\"*\"]','2023-02-13 09:00:05',NULL,'2023-02-13 08:59:16','2023-02-13 09:00:05'),(114,'App\\Models\\User','c6fd29e9-5699-4377-8a0b-b4de30252191','alaboexcel@gmail.com','081bd28dada11576a27c846746de5ffcd29515c79fbffc8135559956b806f108','[\"*\"]','2023-03-10 15:26:53',NULL,'2023-02-13 09:02:42','2023-03-10 15:26:53'),(115,'App\\Models\\User','754a39cf-698e-4e97-9b57-199049d55b02','maduagwu.tony@gmail.com','7c011f56c6dfc62f5dd27526a6ecc4e1a3cdccf34cef2130a0bb86c88c2d1769','[\"*\"]','2023-04-19 14:53:44',NULL,'2023-02-17 14:41:27','2023-04-19 14:53:44'),(116,'App\\Models\\User','d99350aa-a84d-41ae-852d-f2db9aa14882','udoka.okuofu@yahoo.com','0585e8fd091f69ab42a480dee3dc568dd782ee5911343e2bb76bf80695228417','[\"*\"]','2023-02-17 17:35:13',NULL,'2023-02-17 17:11:44','2023-02-17 17:35:13'),(117,'App\\Models\\User','d99350aa-a84d-41ae-852d-f2db9aa14882','udoka.okuofu@yahoo.com','3cbc6943056d37a91534fd3fc3bf8a2a0c0ba3742691c552146c6fe6786d5dad','[\"*\"]','2023-04-19 14:35:23',NULL,'2023-03-01 08:48:11','2023-04-19 14:35:23'),(118,'App\\Models\\User','96ef70ce-2345-47ac-84e3-f65851d1e7ae','gonyewuenyi@gmail.com','01a69fee1622970b7da9f3b73a19c0008c188bdd3e09d4ac506b818472d88991','[\"*\"]','2023-03-30 11:32:53',NULL,'2023-03-02 07:17:08','2023-03-30 11:32:53'),(119,'App\\Models\\User','c6fd29e9-5699-4377-8a0b-b4de30252191','alaboexcel@gmail.com','bf664de9f31173cd8cbc2cb65dfa7dd8005be7233cc6e86d34af227dd5fb6464','[\"*\"]','2023-03-10 15:28:07',NULL,'2023-03-10 15:27:58','2023-03-10 15:28:07'),(120,'App\\Models\\User','96ef70ce-2345-47ac-84e3-f65851d1e7ae','gonyewuenyi@gmail.com','2f1b9aa906f2f9142cff7e0b74868184e9839e01c7862e94fcad1e06ddec0849','[\"*\"]','2023-04-13 23:17:26',NULL,'2023-04-08 06:00:51','2023-04-13 23:17:26'),(121,'App\\Models\\User','96ef70ce-2345-47ac-84e3-f65851d1e7ae','gonyewuenyi@gmail.com','300fe6922f3d508cc61172cb7e782a2e74d987f040b5f445023f7a05a0ce795c','[\"*\"]','2023-04-11 06:01:22',NULL,'2023-04-11 06:01:21','2023-04-11 06:01:22'),(122,'App\\Models\\User','96ef70ce-2345-47ac-84e3-f65851d1e7ae','gonyewuenyi@gmail.com','008352be6cf91a50c971a735d3983ec217a0dd1932c4770320b95938f0b25489','[\"*\"]','2023-04-20 15:48:27',NULL,'2023-04-11 11:04:23','2023-04-20 15:48:27'),(123,'App\\Models\\User','c8a7cf62-13fa-48fb-a91d-fc468f891788','seller_1@test.com','2432e15dc0fbe7de7904190eab6c65cba1490b753f47fb5d56811d8de832eb48','[\"*\"]','2023-04-14 05:14:17',NULL,'2023-04-13 07:49:55','2023-04-14 05:14:17'),(124,'App\\Models\\User','776af330-1fdb-44eb-a1a9-3701e2ddd93a','chimdinmaukpai@gmail.com','479ab25bf1d8b5c312443d862f509cb25727d7ee566bd3b885d02e5fee9297c3','[\"*\"]','2023-04-18 17:46:01',NULL,'2023-04-18 17:44:58','2023-04-18 17:46:01'),(125,'App\\Models\\User','d99350aa-a84d-41ae-852d-f2db9aa14882','Udoka.okuofu@yahoo.com','6e51accbc33922341db60a4a56ff7b4736397ec15eaa50ebe4a5ddb535b97fda','[\"*\"]','2023-04-19 10:48:12',NULL,'2023-04-19 09:06:15','2023-04-19 10:48:12'),(126,'App\\Models\\User','0419ecc2-19c5-4372-94f4-cc65d0371a30','ifyirondi@gmail.com','6982421a8768312889d121f90fe224d31f7f3ba2d9c6db3cac72cea86cc26ece','[\"*\"]','2023-04-20 19:34:05',NULL,'2023-04-19 11:35:07','2023-04-20 19:34:05'),(127,'App\\Models\\User','0330c600-ed19-4ca1-9768-cb764cebe4e7','georgiacharles247@gmail.com','ec9f37a6fb21bb08c09e972b1c854dd6b7666b754ed0aadfaab2e9b49d7395ec','[\"*\"]','2023-04-19 14:45:35',NULL,'2023-04-19 14:38:33','2023-04-19 14:45:35'),(128,'App\\Models\\User','d99350aa-a84d-41ae-852d-f2db9aa14882','udoka.okuofu@yahoo.com','c8aff0a7b9e421b89a43cda58456d0ca74c889bff3335781a1b79db897f735d6','[\"*\"]','2023-04-19 15:13:15',NULL,'2023-04-19 14:45:48','2023-04-19 15:13:15'),(129,'App\\Models\\User','10751e4a-d59f-4d6b-a3e2-8ccdb37b407c','user2@test.com','654cce6fbf8bd0c0573bb44a4b4d85009e3ed64b03f6a78a29256fc139016d95','[\"*\"]','2023-04-19 19:08:08',NULL,'2023-04-19 16:59:04','2023-04-19 19:08:08'),(130,'App\\Models\\User','0330c600-ed19-4ca1-9768-cb764cebe4e7','georgiacharles247@gmail.com','11b8a3f7e28d0aa35a2e53c6afb3bff1324b83fe92821749a5cb70bd6350c6b4','[\"*\"]','2023-04-19 19:31:27',NULL,'2023-04-19 19:16:14','2023-04-19 19:31:27'),(131,'App\\Models\\User','899d22b8-ea4a-46fc-9290-9616f70c2fba','Pizzie09@yahoo.com','2d3e2679917d6a99fd01c46ba7dd3df7a67bcee41301ed59c07f5e6df0b40f9d','[\"*\"]','2023-04-19 19:23:51',NULL,'2023-04-19 19:18:06','2023-04-19 19:23:51'),(132,'App\\Models\\User','69ab88fa-a037-4a9b-bbcc-ca094f5af440','deecox_18@yahoo.com','b4065da337bf497c74ddd3242ad76f32689a8485186053348ee1a45504b41ffe','[\"*\"]','2023-04-19 21:39:12',NULL,'2023-04-19 21:28:17','2023-04-19 21:39:12'),(133,'App\\Models\\User','d99350aa-a84d-41ae-852d-f2db9aa14882','udoka.okuofu@yahoo.com','58bee814e268a20290f8a2eda5e5adbdd2d86a2aecdc9e9d92c1e323c4f92ed4','[\"*\"]','2023-04-20 15:23:26',NULL,'2023-04-20 15:22:04','2023-04-20 15:23:26');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `placed_orders`
--

DROP TABLE IF EXISTS `placed_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `placed_orders` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `equipment_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(64,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout_reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_type` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `placed_orders_user_id_index` (`user_id`),
  KEY `placed_orders_equipment_id_index` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `placed_orders`
--

LOCK TABLES `placed_orders` WRITE;
/*!40000 ALTER TABLE `placed_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `placed_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bids`
--

DROP TABLE IF EXISTS `product_bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bids` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `equipment_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(64,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bids_user_id_index` (`user_id`),
  KEY `product_bids_seller_id_index` (`seller_id`),
  KEY `product_bids_equipment_id_index` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bids`
--

LOCK TABLES `product_bids` WRITE;
/*!40000 ALTER TABLE `product_bids` DISABLE KEYS */;
INSERT INTO `product_bids` VALUES ('120097d2-2c7d-4a33-a481-ee7a6003add9','96ef70ce-2345-47ac-84e3-f65851d1e7ae','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','367f97f2-d4c6-413a-92ec-f67fb290cb3c',30000.00,'pending','2023-02-01 17:04:03','2023-02-01 17:04:03'),('2cb8947e-454c-4949-90c5-212ab09185c3','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','a79f8957-753f-4b32-9897-b6d7b236ce73',30000.00,'pending','2023-02-02 06:45:11','2023-02-02 06:45:11'),('3f72cfd5-c651-436d-accd-b81807e7a68a','c6fd29e9-5699-4377-8a0b-b4de30252191','1175a2d8-e149-4302-899b-ce4eacda3ebe','a009a4c1-468f-431b-ab9b-ba30e921aa0c',50000.00,'approved','2023-02-01 16:35:47','2023-04-18 16:54:40'),('512e2ac9-151d-47b8-8662-2540371c1165','c6fd29e9-5699-4377-8a0b-b4de30252191','1175a2d8-e149-4302-899b-ce4eacda3ebe','bf9d8812-37ef-48d4-bbaa-fd0d3c3b63c4',50000.00,'pending','2023-02-01 16:35:31','2023-02-03 08:25:18'),('7ff93592-89da-4ca3-a39b-7e638f1c3d3f','68114c05-2c3c-49da-aebf-6d267fd9cd65','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','ebd20fa9-1ec8-4646-8034-25fe9819f869',50000.00,'approved','2023-02-02 19:01:36','2023-02-02 19:03:15'),('91923cb5-e9e7-49e1-bacd-f80d08b69485','15c65225-5dcb-412e-8692-c3dac99aab96','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','b7f6bfbd-ddf3-40fe-b96d-e13057f6058d',10000.00,'pending','2023-01-31 10:08:40','2023-01-31 10:08:40'),('9a46817b-e51c-4137-94a4-2f5c86e5df03','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','d6144c21-b893-4f54-a310-05f0720d642f',1000.00,'approved','2023-03-10 15:47:09','2023-04-18 16:54:35'),('a813461d-1242-438d-8d96-8264dbc2e0cf','facda5b1-3ca6-4cd7-bdc5-b51207af820e','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','60e65a37-3c14-4082-9f90-3f2c08857d3f',50000.00,'approved','2023-01-26 03:55:59','2023-01-27 16:43:01'),('b6254fc8-0954-4649-b41f-bb5221ca63a4','7e5f1260-5f04-43ff-80ec-3eba5ee1b913','1175a2d8-e149-4302-899b-ce4eacda3ebe','bd8672fd-ad7b-4fe9-9cbb-e9856f6b3603',1000.00,'pending','2023-02-06 06:56:55','2023-04-13 11:32:45'),('b9bc7956-e7aa-4d6b-a269-987fd3825fac','7e5f1260-5f04-43ff-80ec-3eba5ee1b913','1175a2d8-e149-4302-899b-ce4eacda3ebe','90cbc772-77ca-4413-acdc-463bc3fdf3b3',1000.00,'pending','2023-02-11 09:39:36','2023-04-13 11:29:49'),('e222353a-88ee-46e0-8427-800e995c9d62','96ef70ce-2345-47ac-84e3-f65851d1e7ae','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','9c1c2b9c-95a2-4cf4-8a2c-c5cde5da393f',50000.00,'approved','2023-02-02 16:50:59','2023-02-02 18:52:15'),('ea37f04c-dd88-4e88-bb6b-9b86698eeca7','23557de8-56ce-4a0f-9f0e-c7824df69ee7','12707e98-5f3f-4c4e-a40a-013aee491e88','c44d3e78-97cd-4807-b8fb-051b6e5374b0',50000.00,'declined','2023-01-26 04:00:25','2023-01-28 03:41:29');
/*!40000 ALTER TABLE `product_bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_items`
--

DROP TABLE IF EXISTS `saved_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saved_items` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `equipment_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `saved_items_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_items`
--

LOCK TABLES `saved_items` WRITE;
/*!40000 ALTER TABLE `saved_items` DISABLE KEYS */;
INSERT INTO `saved_items` VALUES ('15079bea-c006-42d2-a1f9-de7eee045786','d99350aa-a84d-41ae-852d-f2db9aa14882','bf9d8812-37ef-48d4-bbaa-fd0d3c3b63c4',NULL,'2023-02-17 17:32:48','2023-02-17 17:32:48'),('225a1205-cde2-4048-af11-435837423eec','776af330-1fdb-44eb-a1a9-3701e2ddd93a','bf9d8812-37ef-48d4-bbaa-fd0d3c3b63c4',NULL,'2023-02-03 08:24:31','2023-02-03 08:24:31'),('2ba727d8-3497-424c-9f29-59aa6ef1091d','c8a7cf62-13fa-48fb-a91d-fc468f891788','d6144c21-b893-4f54-a310-05f0720d642f',NULL,'2023-04-13 11:32:24','2023-04-13 11:32:24'),('2d8ff7e5-745d-4922-a880-782cea33fe7c','754a39cf-698e-4e97-9b57-199049d55b02','90cbc772-77ca-4413-acdc-463bc3fdf3b3',NULL,'2023-04-12 05:23:43','2023-04-12 05:23:43'),('2db97d0b-f1db-4fe8-87ad-770d4e3bf6b5','96ef70ce-2345-47ac-84e3-f65851d1e7ae','b7f6bfbd-ddf3-40fe-b96d-e13057f6058d',NULL,'2023-01-28 02:52:07','2023-01-28 02:52:07'),('3273e611-b6a4-4032-afc1-a2c574749821','c8a7cf62-13fa-48fb-a91d-fc468f891788','d6144c21-b893-4f54-a310-05f0720d642f',NULL,'2023-04-13 11:31:27','2023-04-13 11:31:27'),('3d499302-609c-4a96-8b0d-542995383cb9','776af330-1fdb-44eb-a1a9-3701e2ddd93a','a79f8957-753f-4b32-9897-b6d7b236ce73',NULL,'2023-02-03 08:24:48','2023-02-03 08:24:48'),('52037883-5107-4ae3-b2f8-69c81f07d0ea','96ef70ce-2345-47ac-84e3-f65851d1e7ae','a79f8957-753f-4b32-9897-b6d7b236ce73',NULL,'2023-02-02 17:39:21','2023-02-02 17:39:21'),('53c57f4b-169c-4bb8-948a-48f2f0e6d586','96ef70ce-2345-47ac-84e3-f65851d1e7ae','bf9d8812-37ef-48d4-bbaa-fd0d3c3b63c4',NULL,'2023-02-01 16:40:52','2023-02-01 16:40:52'),('65908436-9f09-4814-88b7-58efe11a51db','d99350aa-a84d-41ae-852d-f2db9aa14882','90cbc772-77ca-4413-acdc-463bc3fdf3b3',NULL,'2023-03-15 12:33:10','2023-03-15 12:33:10'),('692eb563-706a-4df3-b1d4-71a3e7c50b50','776af330-1fdb-44eb-a1a9-3701e2ddd93a','bf9d8812-37ef-48d4-bbaa-fd0d3c3b63c4',NULL,'2023-02-03 08:24:32','2023-02-03 08:24:32'),('701da09a-1776-4757-bb5e-db37750a7a93','96ef70ce-2345-47ac-84e3-f65851d1e7ae','4858bd13-5e13-4d40-8dad-58894e25e91f',NULL,'2023-01-28 02:59:34','2023-01-28 02:59:34'),('70856fc2-f0c0-409f-bf09-e5c0dbadbef4','776af330-1fdb-44eb-a1a9-3701e2ddd93a','bf9d8812-37ef-48d4-bbaa-fd0d3c3b63c4',NULL,'2023-02-03 08:24:31','2023-02-03 08:24:31'),('7f8d12f8-adfe-445d-a501-1afa9f43b258','facda5b1-3ca6-4cd7-bdc5-b51207af820e','60e65a37-3c14-4082-9f90-3f2c08857d3f',NULL,'2023-01-26 04:02:59','2023-01-26 04:02:59'),('8131191f-9aa1-4c9f-9377-6f91e2c7a1c8','96ef70ce-2345-47ac-84e3-f65851d1e7ae','b7f6bfbd-ddf3-40fe-b96d-e13057f6058d',NULL,'2023-01-28 02:50:58','2023-01-28 02:50:58'),('97a98748-a37d-4612-8372-191593971857','776af330-1fdb-44eb-a1a9-3701e2ddd93a','a009a4c1-468f-431b-ab9b-ba30e921aa0c',NULL,'2023-02-03 08:24:52','2023-02-03 08:24:52'),('b640de66-a6f3-412b-be33-8a866c522dca','15c65225-5dcb-412e-8692-c3dac99aab96','c44d3e78-97cd-4807-b8fb-051b6e5374b0',NULL,'2023-01-31 10:06:50','2023-01-31 10:06:50'),('c32bd93a-8f80-42bf-b168-1777a8ab33bf','0419ecc2-19c5-4372-94f4-cc65d0371a30','4858bd13-5e13-4d40-8dad-58894e25e91f',NULL,'2023-01-28 11:17:15','2023-01-28 11:17:15'),('e18d2a25-5e91-4d1b-9b57-e4271d83c136','c8a7cf62-13fa-48fb-a91d-fc468f891788','d6144c21-b893-4f54-a310-05f0720d642f',NULL,'2023-04-13 11:31:32','2023-04-13 11:31:32'),('e3aba9c8-6a4b-4afe-a6a6-9e8c0bf90092','776af330-1fdb-44eb-a1a9-3701e2ddd93a','bf9d8812-37ef-48d4-bbaa-fd0d3c3b63c4',NULL,'2023-02-03 08:24:31','2023-02-03 08:24:31'),('f62c7b7f-8194-447c-b442-e5e9636ef135','96ef70ce-2345-47ac-84e3-f65851d1e7ae','4858bd13-5e13-4d40-8dad-58894e25e91f',NULL,'2023-01-29 14:36:57','2023-01-29 14:36:57'),('f8989574-badb-439f-a507-c895700eee72','facda5b1-3ca6-4cd7-bdc5-b51207af820e','c44d3e78-97cd-4807-b8fb-051b6e5374b0',NULL,'2023-01-26 04:03:01','2023-01-26 04:03:01'),('fc7add3a-7e31-4e6b-bf11-fa13102000dd','c6fd29e9-5699-4377-8a0b-b4de30252191','a009a4c1-468f-431b-ab9b-ba30e921aa0c',NULL,'2023-02-01 16:36:57','2023-02-01 16:36:57');
/*!40000 ALTER TABLE `saved_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_business_accounts`
--

DROP TABLE IF EXISTS `seller_business_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_business_accounts` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_officer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_officer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_business_accounts_user_id_index` (`user_id`),
  KEY `seller_business_accounts_seller_id_index` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_business_accounts`
--

LOCK TABLES `seller_business_accounts` WRITE;
/*!40000 ALTER TABLE `seller_business_accounts` DISABLE KEYS */;
INSERT INTO `seller_business_accounts` VALUES ('2a28b735-3635-4e66-86d7-3b4b9c5a888a','facda5b1-3ca6-4cd7-bdc5-b51207af820e','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Iusto sed ea consequ','10','hello word','Explicabo Necessita','Quis culpa suscipit','Dolor pariatur Est','2023-01-28 04:24:27','2023-01-28 04:24:27'),('c0dc74d1-3988-4f1e-84ac-56af3381c454','facda5b1-3ca6-4cd7-bdc5-b51207af820e','d3bc6b3c-f020-47ee-bb53-7e3af4aeaaf8','Molestiae ipsum cill','34','hello word','Beatae aliquam aliqu','Sit cupidatat evenie','Omnis aspernatur bea','2023-01-26 03:09:02','2023-01-26 03:09:02'),('c93c353e-feee-43e4-8d0f-c6be3e2448e4','c6fd29e9-5699-4377-8a0b-b4de30252191','6cdda6ce-cdc4-4797-a9e6-899ff0a44f24','Consequat Voluptas','83','hello word','In laboris eligendi','Et eum dolore mollit','Ipsam mollit ut sit','2023-01-25 19:45:32','2023-01-25 19:45:32'),('fd112f2c-6eab-47de-8b30-e98b65452a66','c6fd29e9-5699-4377-8a0b-b4de30252191','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','Cupidatat dolor cons','13','hello word','Et voluptatem Labor','Nostrud odit volupta','Suscipit et vero qua','2023-01-26 03:25:35','2023-01-26 03:25:35');
/*!40000 ALTER TABLE `seller_business_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_documents`
--

DROP TABLE IF EXISTS `seller_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_documents` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_documents_user_id_index` (`user_id`),
  KEY `seller_documents_seller_id_index` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_documents`
--

LOCK TABLES `seller_documents` WRITE;
/*!40000 ALTER TABLE `seller_documents` DISABLE KEYS */;
INSERT INTO `seller_documents` VALUES ('00217e87-459f-4cf5-87bc-98e60cf618cb','facda5b1-3ca6-4cd7-bdc5-b51207af820e','f3b034e6-919c-4dd3-add9-a9f5cdfcbf18','https://harbourhub.xyz/images/202301260252build.PNG','2023-01-26 02:52:00','2023-01-26 02:52:00'),('0328c423-175b-4731-b6f9-3cf836d2580f','facda5b1-3ca6-4cd7-bdc5-b51207af820e','12707e98-5f3f-4c4e-a40a-013aee491e88','https://harbourhub.xyz/images/202301260258Capture.PNG','2023-01-26 02:58:59','2023-01-26 02:58:59'),('03ced376-cbbb-411b-9fd2-2b52fb6539e4','facda5b1-3ca6-4cd7-bdc5-b51207af820e','4363f2ce-6991-4df7-8144-f60d3f097a6e','https://harbourhub.xyz/images/202301260257Capture.PNG','2023-01-26 02:57:52','2023-01-26 02:57:52'),('0717a5d7-aa6f-47ed-9bd6-362425c4e78e','facda5b1-3ca6-4cd7-bdc5-b51207af820e','867472d4-c188-4acd-b78c-108b2087b3df','https://harbourhub.xyz/images/202301260255button.PNG','2023-01-26 02:55:13','2023-01-26 02:55:13'),('10f6598a-2f54-4a56-920f-dce4930fe620','96ef70ce-2345-47ac-84e3-f65851d1e7ae','3132810f-23d9-4e73-8194-533d19a1e6a3','https://harbourhub.xyz/images/202301260100gid.jpg','2023-01-26 01:00:10','2023-01-26 01:00:10'),('11794f15-72e8-4fdf-80a4-626a0fabf5bf','facda5b1-3ca6-4cd7-bdc5-b51207af820e','4363f2ce-6991-4df7-8144-f60d3f097a6e','https://harbourhub.xyz/images/202301260257build.PNG','2023-01-26 02:57:52','2023-01-26 02:57:52'),('14d636cf-fbe4-45a6-92c0-87ac9258d6e3','c6fd29e9-5699-4377-8a0b-b4de30252191','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','https://harbourhub.xyz/images/202301260324000000.PNG','2023-01-26 03:24:19','2023-01-26 03:24:19'),('1df692cf-12e4-4f4b-a46d-3f7815bb58b3','facda5b1-3ca6-4cd7-bdc5-b51207af820e','a145e46c-f731-449e-a477-97e2089edfae','https://harbourhub.xyz/images/202301260252111111.PNG','2023-01-26 02:52:58','2023-01-26 02:52:58'),('1f689abc-0a0b-4471-a9ca-ba92db8c094a','facda5b1-3ca6-4cd7-bdc5-b51207af820e','4363f2ce-6991-4df7-8144-f60d3f097a6e','https://harbourhub.xyz/images/202301260257000000.PNG','2023-01-26 02:57:52','2023-01-26 02:57:52'),('2546fe49-754f-4c52-8cf9-f007b95af5c1','facda5b1-3ca6-4cd7-bdc5-b51207af820e','c16a64e4-155d-4436-88d2-8891df01bc9d','https://harbourhub.xyz/images/202301280417build.PNG','2023-01-28 04:17:49','2023-01-28 04:17:49'),('27f70cb7-8a89-42bc-b19e-c6dfef43b7cb','facda5b1-3ca6-4cd7-bdc5-b51207af820e','e41cfdd5-e295-4035-afd4-3a59c034afbd','https://harbourhub.xyz/images/202301280419111111.PNG','2023-01-28 04:19:31','2023-01-28 04:19:31'),('2b7ce195-dca1-4485-813b-ed88eccd0d6b','c6fd29e9-5699-4377-8a0b-b4de30252191','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','https://harbourhub.xyz/images/202301260324111111.PNG','2023-01-26 03:24:19','2023-01-26 03:24:19'),('355e4696-c1cb-4c39-972a-5da4021a8af4','facda5b1-3ca6-4cd7-bdc5-b51207af820e','f62a91d9-dd8e-4043-b98c-168952ac4b05','https://harbourhub.xyz/images/202301260254000000.PNG','2023-01-26 02:54:16','2023-01-26 02:54:16'),('38c56c47-6c59-4b97-ab5d-3e378644b92a','96ef70ce-2345-47ac-84e3-f65851d1e7ae','b6b02501-a954-4958-b4d2-7c8a19897aae','https://harbourhub.xyz/images/202301260109gid.jpg','2023-01-26 01:09:14','2023-01-26 01:09:14'),('38f283e9-85e6-4820-a74d-a4bb5ba409d3','facda5b1-3ca6-4cd7-bdc5-b51207af820e','d3bc6b3c-f020-47ee-bb53-7e3af4aeaaf8','https://harbourhub.xyz/images/202301260308111111.PNG','2023-01-26 03:08:52','2023-01-26 03:08:52'),('391b21b2-6e38-4d29-b238-494e34002e24','facda5b1-3ca6-4cd7-bdc5-b51207af820e','f45a30d7-fd55-4435-a925-95c06500cbee','https://harbourhub.xyz/images/202301280421error.PNG','2023-01-28 04:21:58','2023-01-28 04:21:58'),('3c325774-c0f7-4761-af3e-2a25060409ca','facda5b1-3ca6-4cd7-bdc5-b51207af820e','f3b034e6-919c-4dd3-add9-a9f5cdfcbf18','https://harbourhub.xyz/images/202301260252Capture.PNG','2023-01-26 02:52:00','2023-01-26 02:52:00'),('4b09694f-0c94-4411-a3a8-c1ed09e37bb9','facda5b1-3ca6-4cd7-bdc5-b51207af820e','452dd6d1-47c3-48a4-8a2b-38288d4ec25f','https://harbourhub.xyz/images/202301260250DATE-FORMAT.PNG','2023-01-26 02:50:19','2023-01-26 02:50:19'),('4b9180f0-9360-4739-8556-9512c6bc3888','facda5b1-3ca6-4cd7-bdc5-b51207af820e','f62a91d9-dd8e-4043-b98c-168952ac4b05','https://harbourhub.xyz/images/202301260254000000.PNG','2023-01-26 02:54:16','2023-01-26 02:54:16'),('5a37c8d4-94ba-42b2-aaee-6da2328adbcd','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','https://harbourhub.xyz/images/202301260056gid.jpg','2023-01-26 00:56:29','2023-01-26 00:56:29'),('5b4beee2-efbe-491e-a716-01088a08d6a7','96ef70ce-2345-47ac-84e3-f65851d1e7ae','15b441ae-6d82-468b-a66b-0f1eda04a1ef','https://harbourhub.xyz/images/202301260057gid.jpg','2023-01-26 00:57:06','2023-01-26 00:57:06'),('5db6b6db-ad6e-4f8a-ad31-f9a6591199bd','facda5b1-3ca6-4cd7-bdc5-b51207af820e','e41cfdd5-e295-4035-afd4-3a59c034afbd','https://harbourhub.xyz/images/202301280419111111.PNG','2023-01-28 04:19:31','2023-01-28 04:19:31'),('68223e6c-5984-4e23-a4a2-ac93e3cc74cc','facda5b1-3ca6-4cd7-bdc5-b51207af820e','f62a91d9-dd8e-4043-b98c-168952ac4b05','https://harbourhub.xyz/images/202301260254build.PNG','2023-01-26 02:54:16','2023-01-26 02:54:16'),('698a4e20-512d-4415-8643-fe3650fa742b','96ef70ce-2345-47ac-84e3-f65851d1e7ae','da8bf06f-46d5-45f5-85ec-7ccee6389d16','https://harbourhub.xyz/images/202301280245tntNwzQB_400x400.jpg','2023-01-28 02:45:31','2023-01-28 02:45:31'),('6c139bca-1a84-4678-8093-4ab31b05da2c','96ef70ce-2345-47ac-84e3-f65851d1e7ae','de7ace2a-3d95-404d-8556-1eb35b2154ab','https://harbourhub.xyz/images/202301260056gid.jpg','2023-01-26 00:56:45','2023-01-26 00:56:45'),('6cfb9822-3157-4d07-9ce5-6d2b7a6fb2c5','96ef70ce-2345-47ac-84e3-f65851d1e7ae','3132810f-23d9-4e73-8194-533d19a1e6a3','https://harbourhub.xyz/images/202301260100gid.jpg','2023-01-26 01:00:10','2023-01-26 01:00:10'),('6fb98a4c-8617-455c-9415-335a3dc2ca22','facda5b1-3ca6-4cd7-bdc5-b51207af820e','a145e46c-f731-449e-a477-97e2089edfae','https://harbourhub.xyz/images/202301260252111111.PNG','2023-01-26 02:52:58','2023-01-26 02:52:58'),('78846d52-1d84-46e3-95b7-0eaaf7a4aa80','96ef70ce-2345-47ac-84e3-f65851d1e7ae','337faf92-e0ff-4d1f-addc-55d08a3679db','https://harbourhub.xyz/images/202301260059gid.jpg','2023-01-26 00:59:55','2023-01-26 00:59:55'),('7c713932-6b1f-4cdd-8b1b-727ea6c256a2','facda5b1-3ca6-4cd7-bdc5-b51207af820e','12707e98-5f3f-4c4e-a40a-013aee491e88','https://harbourhub.xyz/images/202301260258111111.PNG','2023-01-26 02:58:59','2023-01-26 02:58:59'),('8144ef6a-3f8f-4b47-a74d-b4a73292e87a','c6fd29e9-5699-4377-8a0b-b4de30252191','6cdda6ce-cdc4-4797-a9e6-899ff0a44f24','https://harbourhub.xyz/images/202301251939photo-1531482615713-2afd69097998.avif','2023-01-25 19:39:27','2023-01-25 19:39:27'),('88122017-8531-4785-a041-719d2a13aa14','96ef70ce-2345-47ac-84e3-f65851d1e7ae','15b441ae-6d82-468b-a66b-0f1eda04a1ef','https://harbourhub.xyz/images/202301260057gid.jpg','2023-01-26 00:57:06','2023-01-26 00:57:06'),('8fb3ea61-3bcb-41e1-984b-5dd6b67638cd','96ef70ce-2345-47ac-84e3-f65851d1e7ae','b6b02501-a954-4958-b4d2-7c8a19897aae','https://harbourhub.xyz/images/202301260109gid.jpg','2023-01-26 01:09:14','2023-01-26 01:09:14'),('92c8dbd1-08bf-4bff-9b4e-82122fe832e4','facda5b1-3ca6-4cd7-bdc5-b51207af820e','c16a64e4-155d-4436-88d2-8891df01bc9d','https://harbourhub.xyz/images/202301280417build.PNG','2023-01-28 04:17:49','2023-01-28 04:17:49'),('968e60ea-567f-4b8c-ab5f-191b0bd07610','96ef70ce-2345-47ac-84e3-f65851d1e7ae','337faf92-e0ff-4d1f-addc-55d08a3679db','https://harbourhub.xyz/images/202301260059gid.jpg','2023-01-26 00:59:55','2023-01-26 00:59:55'),('9bb7278b-0326-4aff-89b3-5ecebfb6e7c9','facda5b1-3ca6-4cd7-bdc5-b51207af820e','867472d4-c188-4acd-b78c-108b2087b3df','https://harbourhub.xyz/images/202301260255Capture.PNG','2023-01-26 02:55:13','2023-01-26 02:55:13'),('9ebb68f6-e11f-4a15-9776-7a08fc527187','facda5b1-3ca6-4cd7-bdc5-b51207af820e','df3bc8e7-cf7d-480b-9fa2-685bd2f1a35c','https://harbourhub.xyz/images/202301260307111111.PNG','2023-01-26 03:07:06','2023-01-26 03:07:06'),('9fddc385-57dd-43fd-88b1-39d3fb48f101','facda5b1-3ca6-4cd7-bdc5-b51207af820e','df3bc8e7-cf7d-480b-9fa2-685bd2f1a35c','https://harbourhub.xyz/images/202301260307button.PNG','2023-01-26 03:07:06','2023-01-26 03:07:06'),('a0a4c288-0c46-4dd3-b0de-e74a8c4027e9','facda5b1-3ca6-4cd7-bdc5-b51207af820e','e41cfdd5-e295-4035-afd4-3a59c034afbd','https://harbourhub.xyz/images/202301280419build.PNG','2023-01-28 04:19:31','2023-01-28 04:19:31'),('ab675e42-3330-4cc3-bae2-0bfef9b7dbe7','facda5b1-3ca6-4cd7-bdc5-b51207af820e','867472d4-c188-4acd-b78c-108b2087b3df','https://harbourhub.xyz/images/202301260255111111.PNG','2023-01-26 02:55:13','2023-01-26 02:55:13'),('ac194d17-c00c-4703-b4fa-9b895f6e87e2','96ef70ce-2345-47ac-84e3-f65851d1e7ae','15b441ae-6d82-468b-a66b-0f1eda04a1ef','https://harbourhub.xyz/images/202301260057gid.jpg','2023-01-26 00:57:06','2023-01-26 00:57:06'),('adb8d950-6014-439b-b7a4-ff9453f24ce7','facda5b1-3ca6-4cd7-bdc5-b51207af820e','452dd6d1-47c3-48a4-8a2b-38288d4ec25f','https://harbourhub.xyz/images/202301260250000000.PNG','2023-01-26 02:50:19','2023-01-26 02:50:19'),('ae6ca39a-c43a-4346-8a4f-2be0ddd4e757','facda5b1-3ca6-4cd7-bdc5-b51207af820e','c16a64e4-155d-4436-88d2-8891df01bc9d','https://harbourhub.xyz/images/202301280417000000.PNG','2023-01-28 04:17:49','2023-01-28 04:17:49'),('b74079cd-63dc-486c-bb71-0bd16dfbce2a','facda5b1-3ca6-4cd7-bdc5-b51207af820e','df3bc8e7-cf7d-480b-9fa2-685bd2f1a35c','https://harbourhub.xyz/images/202301260307build.PNG','2023-01-26 03:07:06','2023-01-26 03:07:06'),('bbb93d63-d9f4-48d4-b7c7-f7b2da6ef44f','facda5b1-3ca6-4cd7-bdc5-b51207af820e','452dd6d1-47c3-48a4-8a2b-38288d4ec25f','https://harbourhub.xyz/images/202301260250button.PNG','2023-01-26 02:50:19','2023-01-26 02:50:19'),('bbbf12e8-b668-49af-80af-00de257dbf62','facda5b1-3ca6-4cd7-bdc5-b51207af820e','f45a30d7-fd55-4435-a925-95c06500cbee','https://harbourhub.xyz/images/202301280421button.PNG','2023-01-28 04:21:58','2023-01-28 04:21:58'),('bd76d4f2-156c-4034-a78a-ec5574349578','facda5b1-3ca6-4cd7-bdc5-b51207af820e','f45a30d7-fd55-4435-a925-95c06500cbee','https://harbourhub.xyz/images/202301280421drag.PNG','2023-01-28 04:21:58','2023-01-28 04:21:58'),('c08aecb4-f810-4d65-90ff-85585a438383','facda5b1-3ca6-4cd7-bdc5-b51207af820e','a145e46c-f731-449e-a477-97e2089edfae','https://harbourhub.xyz/images/202301260252111111.PNG','2023-01-26 02:52:58','2023-01-26 02:52:58'),('c49f6116-f61f-48ef-88ee-57a53b082dda','96ef70ce-2345-47ac-84e3-f65851d1e7ae','b6b02501-a954-4958-b4d2-7c8a19897aae','https://harbourhub.xyz/images/202301260109gid.jpg','2023-01-26 01:09:14','2023-01-26 01:09:14'),('c863fe3c-867d-461a-9832-6545b4a23287','96ef70ce-2345-47ac-84e3-f65851d1e7ae','de7ace2a-3d95-404d-8556-1eb35b2154ab','https://harbourhub.xyz/images/202301260056gid.jpg','2023-01-26 00:56:45','2023-01-26 00:56:45'),('c8abee99-44d7-4dce-803e-400852664ed6','96ef70ce-2345-47ac-84e3-f65851d1e7ae','3132810f-23d9-4e73-8194-533d19a1e6a3','https://harbourhub.xyz/images/202301260100gid.jpg','2023-01-26 01:00:10','2023-01-26 01:00:10'),('cb5da922-965a-4fac-9eb2-4484aab7645b','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','https://harbourhub.xyz/images/202301260056gid.jpg','2023-01-26 00:56:29','2023-01-26 00:56:29'),('cdc74bdd-96cf-457d-9a96-c4eec5cf3e14','96ef70ce-2345-47ac-84e3-f65851d1e7ae','337faf92-e0ff-4d1f-addc-55d08a3679db','https://harbourhub.xyz/images/202301260059gid.jpg','2023-01-26 00:59:55','2023-01-26 00:59:55'),('ced70fe6-aab5-455c-9049-14dee7d1ea81','facda5b1-3ca6-4cd7-bdc5-b51207af820e','d3bc6b3c-f020-47ee-bb53-7e3af4aeaaf8','https://harbourhub.xyz/images/202301260308111111.PNG','2023-01-26 03:08:52','2023-01-26 03:08:52'),('d03b9dd7-869c-42e0-9e23-ed4df76739b9','facda5b1-3ca6-4cd7-bdc5-b51207af820e','d3bc6b3c-f020-47ee-bb53-7e3af4aeaaf8','https://harbourhub.xyz/images/202301260308build.PNG','2023-01-26 03:08:52','2023-01-26 03:08:52'),('d239c580-a186-458a-93b3-753f9468f2d9','facda5b1-3ca6-4cd7-bdc5-b51207af820e','12707e98-5f3f-4c4e-a40a-013aee491e88','https://harbourhub.xyz/images/202301260258000000.PNG','2023-01-26 02:58:59','2023-01-26 02:58:59'),('d6a3b0cd-f390-4bc4-adfb-dec5abf93ebe','96ef70ce-2345-47ac-84e3-f65851d1e7ae','de7ace2a-3d95-404d-8556-1eb35b2154ab','https://harbourhub.xyz/images/202301260056gid.jpg','2023-01-26 00:56:45','2023-01-26 00:56:45'),('d9e03e0f-c9cb-4738-b5aa-0252a1e2e1f7','c6fd29e9-5699-4377-8a0b-b4de30252191','6cdda6ce-cdc4-4797-a9e6-899ff0a44f24','https://harbourhub.xyz/images/202301251939photo-1531482615713-2afd69097998-(1).jpeg','2023-01-25 19:39:27','2023-01-25 19:39:27'),('dd205711-5212-4a2b-b22a-5e7485862385','c6fd29e9-5699-4377-8a0b-b4de30252191','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','https://harbourhub.xyz/images/202301260324build.PNG','2023-01-26 03:24:19','2023-01-26 03:24:19'),('e0bce150-2750-4f6e-90bf-4867598e8b92','facda5b1-3ca6-4cd7-bdc5-b51207af820e','0669595e-3395-47e0-badb-908ce727a7a4','https://harbourhub.xyz/images/202301280424Capture.PNG','2023-01-28 04:24:13','2023-01-28 04:24:13'),('e0c30b7d-7f5d-4ea1-8bc0-77dbb0d77034','facda5b1-3ca6-4cd7-bdc5-b51207af820e','f3b034e6-919c-4dd3-add9-a9f5cdfcbf18','https://harbourhub.xyz/images/202301260252111111.PNG','2023-01-26 02:52:00','2023-01-26 02:52:00'),('e11b81f2-6ff9-423c-9701-d7d37b34fa47','facda5b1-3ca6-4cd7-bdc5-b51207af820e','0669595e-3395-47e0-badb-908ce727a7a4','https://harbourhub.xyz/images/202301280424codde.PNG','2023-01-28 04:24:13','2023-01-28 04:24:13'),('e7c4d420-37ab-4c62-9e03-fab502209e0e','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','https://harbourhub.xyz/images/202301260056gid.jpg','2023-01-26 00:56:29','2023-01-26 00:56:29'),('f70a314f-8b1f-46bc-8329-4e18ba4e5c42','96ef70ce-2345-47ac-84e3-f65851d1e7ae','6ea3a105-9d2f-4bbb-8d7c-301f89319c12','https://harbourhub.xyz/images/202301260056gid.jpg','2023-01-26 00:56:05','2023-01-26 00:56:05'),('fbb809fa-eb70-4195-9b0f-d689c37da48d','c6fd29e9-5699-4377-8a0b-b4de30252191','6cdda6ce-cdc4-4797-a9e6-899ff0a44f24','https://harbourhub.xyz/images/202301251939photo-1531482615713-2afd69097998-(1).jpeg','2023-01-25 19:39:27','2023-01-25 19:39:27'),('ff443121-72c6-4b09-bde3-7cbe721406c4','facda5b1-3ca6-4cd7-bdc5-b51207af820e','0669595e-3395-47e0-badb-908ce727a7a4','https://harbourhub.xyz/images/202301280424git.PNG','2023-01-28 04:24:13','2023-01-28 04:24:13');
/*!40000 ALTER TABLE `seller_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_entity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sellers_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES ('0669595e-3395-47e0-badb-908ce727a7a4','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Voluptatem Maiores','Itaque ut quia cumqu','hello word','Quasi ut cillum aut','Soluta ut laboris ob','Maiores autem dolor',0,0,'2023-01-28 04:24:13','2023-01-28 04:24:13'),('1175a2d8-e149-4302-899b-ce4eacda3ebe','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Gideon','gonyewuenyi@gmail.com','hello word','Oga','Port Harcourt','Business',0,0,'2023-01-26 00:56:29','2023-01-26 00:56:29'),('12707e98-5f3f-4c4e-a40a-013aee491e88','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Saepe asperiores vel','Aliquid aut laborum','hello word','Harum voluptatum eli','Quam ullamco amet v','Soluta sint debitis',0,0,'2023-01-26 02:58:59','2023-01-26 02:58:59'),('15b441ae-6d82-468b-a66b-0f1eda04a1ef','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Gideon','gonyewuenyi@gmail.com','hello word','Oga','Port Harcourt','Business',0,0,'2023-01-26 00:57:06','2023-01-26 00:57:06'),('305f2919-d6ed-46ff-ac70-48c47f6aab80','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Veritatis voluptas m','Facere possimus num','hello word','Enim enim pariatur','Et nemo ea saepe exp','Fugit et deserunt a',0,0,'2023-01-26 02:42:32','2023-01-26 02:42:32'),('3132810f-23d9-4e73-8194-533d19a1e6a3','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Gideon','gonyewuenyi@gmail.com','hello word','Oga','Port Harcourt','Business',0,0,'2023-01-26 01:00:10','2023-01-26 01:00:10'),('337faf92-e0ff-4d1f-addc-55d08a3679db','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Gideon','gonyewuenyi@gmail.com','hello word','Oga','Port Harcourt','Business',0,0,'2023-01-26 00:59:55','2023-01-26 00:59:55'),('41cba2a2-f3cf-466f-a94f-04c5e2ad642d','c6fd29e9-5699-4377-8a0b-b4de30252191','Molestiae placeat e','alaboexcel@gmail.com','hello word','Labore et exercitati','114 Rumuaholu road','Adipisci blanditiis',0,0,'2023-01-26 03:24:19','2023-01-26 03:24:19'),('4363f2ce-6991-4df7-8144-f60d3f097a6e','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Doloremque qui quide','Cum eligendi id ali','hello word','Dicta aliquam sequi','Praesentium eum exer','Excepturi esse conse',0,0,'2023-01-26 02:57:52','2023-01-26 02:57:52'),('452dd6d1-47c3-48a4-8a2b-38288d4ec25f','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Est ut at in dolore','Necessitatibus quod','hello word','Rerum rerum dolore v','Tempore ut sint ve','Nostrum minima esse',0,0,'2023-01-26 02:50:19','2023-01-26 02:50:19'),('6cdda6ce-cdc4-4797-a9e6-899ff0a44f24','c6fd29e9-5699-4377-8a0b-b4de30252191','Eiusmod debitis adip','Magna et nisi rerum','hello word','Architecto magna tem','Neque eligendi duis','Ut ut magna ipsam re',0,0,'2023-01-25 19:39:27','2023-01-25 19:39:27'),('6ea3a105-9d2f-4bbb-8d7c-301f89319c12','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Gideon','gonyewuenyi@gmail.com','hello word','Oga','Port Harcourt','Business',0,0,'2023-01-26 00:56:05','2023-01-26 00:56:05'),('867472d4-c188-4acd-b78c-108b2087b3df','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Voluptatem quia susc','Qui et tenetur quo e','hello word','Voluptatem sunt rer','Exercitation ipsum','Ut est dolorem ipsam',0,0,'2023-01-26 02:55:13','2023-01-26 02:55:13'),('a145e46c-f731-449e-a477-97e2089edfae','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Id est atque magni','Sit deleniti cumque','hello word','Doloribus vel totam','Qui nulla est sed do','Commodi tempora anim',0,0,'2023-01-26 02:52:58','2023-01-26 02:52:58'),('aef5c183-7073-4331-bac4-f17f161a86e2','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Dolore tempore quam','In voluptatem Elige','hello word','Voluptatem reprehen','Consectetur error eo','Aute ad excepturi ar',0,0,'2023-01-26 02:44:35','2023-01-26 02:44:35'),('b6b02501-a954-4958-b4d2-7c8a19897aae','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Gideon','gonyewuenyi@gmail.com','hello word','Oga','Port Harcourt','Business',0,0,'2023-01-26 01:09:14','2023-01-26 01:09:14'),('c16a64e4-155d-4436-88d2-8891df01bc9d','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Voluptatem in rerum','Rem explicabo Ullam','hello word','Ut autem aut quia do','Eveniet dolores fac','Qui omnis anim aut a',0,0,'2023-01-28 04:17:49','2023-01-28 04:17:49'),('d3bc6b3c-f020-47ee-bb53-7e3af4aeaaf8','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Quis omnis maiores q','Deserunt fuga Et do','hello word','Aliquid assumenda mo','Labore cupidatat dol','Assumenda odio sed a',0,0,'2023-01-26 03:08:52','2023-01-26 03:08:52'),('da8bf06f-46d5-45f5-85ec-7ccee6389d16','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Compa','gonyewuenyi@gmail.com','hello word','Oga','Port Harcourt','Business',0,0,'2023-01-28 02:45:31','2023-01-28 02:45:31'),('de7ace2a-3d95-404d-8556-1eb35b2154ab','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Gideon','gonyewuenyi@gmail.com','hello word','Oga','Port Harcourt','Business',0,0,'2023-01-26 00:56:45','2023-01-26 00:56:45'),('df3bc8e7-cf7d-480b-9fa2-685bd2f1a35c','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Suscipit omnis aut a','Aliquid rem et paria','hello word','Aut sint magni aliq','Temporibus minim qui','Ad culpa explicabo',0,0,'2023-01-26 03:07:06','2023-01-26 03:07:06'),('e41cfdd5-e295-4035-afd4-3a59c034afbd','facda5b1-3ca6-4cd7-bdc5-b51207af820e','In iure dolor conseq','Alias sed temporibus','hello word','Consequatur natus v','Et in aliqua Volupt','Commodo ipsa velit',0,0,'2023-01-28 04:19:31','2023-01-28 04:19:31'),('f3b034e6-919c-4dd3-add9-a9f5cdfcbf18','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Eos ea aspernatur e','Dolores fugiat ex ut','hello word','Fugiat eu culpa ma','Quas accusantium seq','Et do amet consequu',0,0,'2023-01-26 02:52:00','2023-01-26 02:52:00'),('f45a30d7-fd55-4435-a925-95c06500cbee','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Ut amet tempora qua','Suscipit ut nulla ip','hello word','Dignissimos enim ass','Ad doloremque at sed','Nemo nostrum necessi',0,0,'2023-01-28 04:21:58','2023-01-28 04:21:58'),('f62a91d9-dd8e-4043-b98c-168952ac4b05','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Ut aperiam maiores p','Et ea earum officia','hello word','Sit tempora dolor ei','Eos voluptatem quia','Iure quia rerum even',0,0,'2023-01-26 02:54:16','2023-01-26 02:54:16');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_seller_id_index` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES ('77de8ae8-7562-434d-b3c6-4cac20ca829f','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','Eaque in sint aut ut','hello word','Harum quas magni eaq','2023-01-31 21:23:47','2023-01-31 21:23:47'),('f6661aca-0501-4716-9808-be615c84b043','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','Repellendus Culpa','hello word','Id id tempor labor','2023-01-31 21:23:33','2023-01-31 21:23:33');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_message_images`
--

DROP TABLE IF EXISTS `support_message_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_message_images` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `support_message_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_message_images_support_message_id_index` (`support_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_message_images`
--

LOCK TABLES `support_message_images` WRITE;
/*!40000 ALTER TABLE `support_message_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_message_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_messages`
--

DROP TABLE IF EXISTS `support_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_messages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_to` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messaging_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_messages_sender_index` (`sender`),
  KEY `support_messages_sent_to_index` (`sent_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_messages`
--

LOCK TABLES `support_messages` WRITE;
/*!40000 ALTER TABLE `support_messages` DISABLE KEYS */;
INSERT INTO `support_messages` VALUES ('11862f15-cfba-426a-b26f-9c22cfe0f641','facda5b1-3ca6-4cd7-bdc5-b51207af820e','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','O9OE4P5Md2','you?',0,'2023-01-28 05:24:06','2023-01-28 05:24:06'),('1a0b1024-f7ec-4e46-8e8c-840b124b5432','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','hey',0,'2023-02-11 09:36:48','2023-02-11 09:36:48'),('2236b2aa-b817-4e1d-96de-f2766fbc4d76','c8a7cf62-13fa-48fb-a91d-fc468f891788','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','asdfasdf',0,'2023-04-13 11:34:31','2023-04-13 11:34:31'),('2a803194-f857-4509-ab30-615210f11a43','c6fd29e9-5699-4377-8a0b-b4de30252191','12707e98-5f3f-4c4e-a40a-013aee491e88','nQZiMrIrvI','hi world',0,'2023-01-28 05:12:24','2023-01-28 05:12:24'),('2d79f0a4-4818-4a7a-a0fb-080fab0b889d','facda5b1-3ca6-4cd7-bdc5-b51207af820e','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','O9OE4P5Md2','Eiusmod excepteur et',0,'2023-01-28 05:24:36','2023-01-28 05:24:36'),('2ec0154b-d327-40cd-b5a0-da2f5cd2ef59','c6fd29e9-5699-4377-8a0b-b4de30252191','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','O9OE4P5Md2','i\'m good bro',0,'2023-01-28 05:12:57','2023-01-28 05:12:57'),('3125a094-8fed-4fde-8f9c-d866f068ff4c','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','hello',0,'2023-04-17 15:09:00','2023-04-17 15:09:00'),('44bd065b-7c18-4ca4-9c2b-7beb9b693ca1','96ef70ce-2345-47ac-84e3-f65851d1e7ae','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','O9OE4P5Md2','ah',0,'2023-02-01 17:57:19','2023-02-01 17:57:19'),('4901543e-b9dc-4ce1-87ff-bf96e37b78ea','c6fd29e9-5699-4377-8a0b-b4de30252191','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','hello',0,'2023-02-01 17:45:39','2023-02-01 17:45:39'),('513baefc-2809-4c42-8a80-29b9b3855f43','c6fd29e9-5699-4377-8a0b-b4de30252191','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','boss',0,'2023-02-01 17:48:03','2023-02-01 17:48:03'),('558e3e1f-058c-49a7-8906-c2e4abe807e4','c6fd29e9-5699-4377-8a0b-b4de30252191','12707e98-5f3f-4c4e-a40a-013aee491e88','nQZiMrIrvI','hello world',0,'2023-01-27 16:16:30','2023-01-27 16:16:30'),('5abd39ab-ebc9-4c0d-af5f-03dd5458e7dc','facda5b1-3ca6-4cd7-bdc5-b51207af820e','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','O9OE4P5Md2','how much for your products?',0,'2023-01-27 16:34:01','2023-01-27 16:34:01'),('5debc3b7-71c2-437c-99cd-89999eaaa59b','c8a7cf62-13fa-48fb-a91d-fc468f891788','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','asdf',0,'2023-04-13 11:47:03','2023-04-13 11:47:03'),('7c684731-9cb3-4e60-ba7c-90d1c71c7ee8','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','Hi',0,'2023-02-02 06:45:25','2023-02-02 06:45:25'),('86507cdd-1aa0-46d4-b622-e3d22a9cd310','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','Hello',0,'2023-02-02 06:44:49','2023-02-02 06:44:49'),('87c19013-238c-4978-93a7-4be48fdac8ba','facda5b1-3ca6-4cd7-bdc5-b51207af820e','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','O9OE4P5Md2','alright',0,'2023-01-28 05:03:17','2023-01-28 05:03:17'),('8fadee0b-bd58-43da-b511-dab22c3264ab','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','Hhhhhh',0,'2023-02-02 19:35:16','2023-02-02 19:35:16'),('9e421323-9cc3-4fe8-a6ef-588f1ad7a6e4','c8a7cf62-13fa-48fb-a91d-fc468f891788','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','asdfasdf',0,'2023-04-13 11:34:31','2023-04-13 11:34:31'),('b236f36f-ee38-4431-b95f-d951ffac0384','7e5f1260-5f04-43ff-80ec-3eba5ee1b913','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','Heyo',0,'2023-02-11 09:39:16','2023-02-11 09:39:16'),('c0721f0a-a3e7-453a-bbe8-ebe0f20ebdb9','facda5b1-3ca6-4cd7-bdc5-b51207af820e','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','O9OE4P5Md2','yo',0,'2023-01-28 05:09:33','2023-01-28 05:09:33'),('c67361b1-ae37-4e2f-a375-b59e79657515','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','hello',0,'2023-02-03 10:34:58','2023-02-03 10:34:58'),('c827a60b-b919-436b-bf9b-db24579cf803','96ef70ce-2345-47ac-84e3-f65851d1e7ae','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','O9OE4P5Md2','hello',0,'2023-02-01 18:11:18','2023-02-01 18:11:18'),('dedf9e63-a01b-4faa-8268-c9f8f14145c8','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','hello',0,'2023-02-08 12:31:56','2023-02-08 12:31:56'),('ea1f8795-bd61-40e4-900d-14d1d7595346','96ef70ce-2345-47ac-84e3-f65851d1e7ae','1175a2d8-e149-4302-899b-ce4eacda3ebe','2HzGECNYcX','hello',0,'2023-03-10 14:31:01','2023-03-10 14:31:01'),('f2da3908-cf93-49ef-a50b-e775be05d00b','96ef70ce-2345-47ac-84e3-f65851d1e7ae','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','O9OE4P5Md2','Hello',0,'2023-02-01 17:56:54','2023-02-01 17:56:54'),('f44f459f-99ea-4dbd-bf27-128712c763eb','c6fd29e9-5699-4377-8a0b-b4de30252191','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','O9OE4P5Md2','hello',0,'2023-01-27 16:15:19','2023-01-27 16:15:19');
/*!40000 ALTER TABLE `support_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `equipment_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_notifications_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notifications`
--

LOCK TABLES `user_notifications` WRITE;
/*!40000 ALTER TABLE `user_notifications` DISABLE KEYS */;
INSERT INTO `user_notifications` VALUES ('019c50d8-8f4f-4104-9a6b-52f4fbd4914c','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Product was uploaded successfully','Product(Bulldozer)was uploaded successfully',0,'2023-02-01 09:16:12','2023-02-01 09:16:12',NULL),('028be522-a8ce-4411-8dca-92bf86e5e76a','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Bid for Pipes-30000','Bid for Pipes - 30000 has been placed by Giid Oonye',0,'2023-02-11 09:39:36','2023-02-11 09:39:36',NULL),('042f2205-29b6-463f-a055-c3e1d1564710','23557de8-56ce-4a0f-9f0e-c7824df69ee7','Bid for Nesciunt duis volup declined','Ipsa iusto aliqua declined your bid for Nesciunt duis volup',0,'2023-01-27 16:32:04','2023-01-27 16:32:04',NULL),('0e4297f4-9e8d-4b02-9101-dd53f22cf59a','23557de8-56ce-4a0f-9f0e-c7824df69ee7','Bid for Nesciunt duis volup approved','Ipsa iusto aliqua approved your bid for Nesciunt duis volup',0,'2023-01-27 16:30:19','2023-01-27 16:30:19',NULL),('0ef8fe9f-8502-47f2-aa71-8197533c195c','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Bid for Non ut ut reprehende approved','alabo approved your bid for Non ut ut reprehende',0,'2023-01-27 16:43:01','2023-01-27 16:43:01',NULL),('11bcd801-75f0-4a5f-b613-3d4e7d0fc849','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Bid for Cargo Vessel-30000','Bid for Cargo Vessel - 30000 has been placed by Gideon Onyewuenyi',0,'2023-02-02 06:45:11','2023-02-02 06:45:11',NULL),('13abfdf9-48cf-4a01-94ac-4299011db225','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Product was uploaded successfully','Product(Gideon)was uploaded successfully',0,'2023-01-28 02:57:36','2023-01-28 02:57:36',NULL),('14762bdd-152a-40e9-b1b4-5ed14eb572cb','96ef70ce-2345-47ac-84e3-f65851d1e7ae','New Bid for Truck-1000','New Bid for Truck - 1000 has been placed by Maduabuchi Onyewuenyi',0,'2023-03-10 15:47:12','2023-03-10 15:47:12','d6144c21-b893-4f54-a310-05f0720d642f'),('16fcfdf7-2c3a-4cdd-acac-2eda204d066c','facda5b1-3ca6-4cd7-bdc5-b51207af820e','New Bid for Nesciunt duis volup-50000','New Bid for Nesciunt duis volup - 50000 has been placed by Gideon Onyewuenyi',0,'2023-01-28 03:41:30','2023-01-28 03:41:30','c44d3e78-97cd-4807-b8fb-051b6e5374b0'),('2a2fc95e-18ff-4939-b607-873f1a856ce2','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Product was uploaded successfully','Product(Pipes)was uploaded successfully',0,'2023-02-11 09:32:57','2023-02-11 09:32:57',NULL),('2d08ff93-41a4-4807-ae0b-305ecb5dd81b','96ef70ce-2345-47ac-84e3-f65851d1e7ae','New Bid for Bulldozer-50000','New Bid for Bulldozer - 50000 has been placed by Gideon Onyewuenyi',0,'2023-02-03 10:34:48','2023-02-03 10:34:48','a009a4c1-468f-431b-ab9b-ba30e921aa0c'),('3081c603-c752-49a6-acdf-f9e6fdde1805','c6fd29e9-5699-4377-8a0b-b4de30252191','New Bid for Ipsum ea provident-50000','New Bid for Ipsum ea provident - 50000 has been placed by Rem Voluptate',0,'2023-02-02 19:02:57','2023-02-02 19:02:57','ebd20fa9-1ec8-4646-8034-25fe9819f869'),('31c1ba24-9eb8-4fa9-ba05-2cafd0a5c3fa','c6fd29e9-5699-4377-8a0b-b4de30252191','Product was uploaded successfully','Product(Repellendus Dolorem)was uploaded successfully',0,'2023-02-11 09:42:02','2023-02-11 09:42:02',NULL),('3814c5c9-74fe-49a0-a353-10305e07a0d2','c6fd29e9-5699-4377-8a0b-b4de30252191','Bid for Bulldozer approved','Maduabuchi approved your bid for Bulldozer',0,'2023-04-18 16:54:40','2023-04-18 16:54:40',NULL),('3a4827e9-c1dc-4657-a115-c440c01826d0','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Bid for Bulldozer-30000','Bid for Bulldozer - 30000 has been placed by Giid Oonye',0,'2023-02-06 06:56:55','2023-02-06 06:56:55',NULL),('3afaa22f-a729-4f09-9978-df9f9fdbae44','facda5b1-3ca6-4cd7-bdc5-b51207af820e','New Bid for Nesciunt duis volup-30000','New Bid for Nesciunt duis volup - 30000 has been placed by Gideon Onyewuenyi',0,'2023-01-27 13:42:53','2023-01-27 13:42:53',NULL),('3b6f22a9-7c99-4d8b-a6e3-59aab78a638d','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Product was uploaded successfully','Product(Truck)was uploaded successfully',0,'2023-02-11 09:20:12','2023-02-11 09:20:12',NULL),('4756e3c2-cfb9-4cd3-b5c5-fd869cebe93f','23557de8-56ce-4a0f-9f0e-c7824df69ee7','Bid for Nesciunt duis volup approved','Ipsa iusto aliqua approved your bid for Nesciunt duis volup',0,'2023-01-27 16:32:01','2023-01-27 16:32:01',NULL),('4d3f28bc-a720-4f8f-90b8-4a4b51734c8b','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Bid for Truck-1000','Bid for Truck - 1000 has been placed by Maduabuchi Onyewuenyi',0,'2023-03-10 15:47:09','2023-03-10 15:47:09',NULL),('4ee1389e-dfef-4e80-87e5-7ace11d93c72','96ef70ce-2345-47ac-84e3-f65851d1e7ae','New Bid for Truck-1000','New Bid for Truck - 1000 has been placed by Maduabuchi Onyewuenyi',0,'2023-03-10 15:47:12','2023-03-10 15:47:12','d6144c21-b893-4f54-a310-05f0720d642f'),('502a53f7-69a7-4d32-b3aa-daf1a2fe1a88','c6fd29e9-5699-4377-8a0b-b4de30252191','New Bid for Non ut ut reprehende-50000','New Bid for Non ut ut reprehende - 50000 has been placed by alabo excel',0,'2023-01-27 16:29:20','2023-01-27 16:29:20','60e65a37-3c14-4082-9f90-3f2c08857d3f'),('55a05d76-1ab5-4b00-8618-f1c8b430367e','96ef70ce-2345-47ac-84e3-f65851d1e7ae','New Bid for Truck-1000','New Bid for Truck - 1000 has been placed by Maduabuchi Onyewuenyi',0,'2023-03-10 15:47:12','2023-03-10 15:47:12','d6144c21-b893-4f54-a310-05f0720d642f'),('5bfafce8-c792-4ae3-afbf-0bd5c44d0b36','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','New Bid for Non ut ut reprehende-50000','New Bid for Non ut ut reprehende - 50000 has been placed by Ipsa iusto aliqua Eum aut illum itaqu',0,'2023-01-26 23:06:17','2023-01-26 23:06:17',NULL),('641b7153-97ed-4b67-81db-80de5d655c82','96ef70ce-2345-47ac-84e3-f65851d1e7ae','New Bid for Pipes-1000','New Bid for Pipes - 1000 has been placed by tester seller 1',0,'2023-04-13 11:29:49','2023-04-13 11:29:49','90cbc772-77ca-4413-acdc-463bc3fdf3b3'),('648b61b7-2a9c-4dce-9f4c-08f49d3da385','c6fd29e9-5699-4377-8a0b-b4de30252191','Bid for Quia aut eos id et-30000','Bid for Quia aut eos id et - 30000 has been placed by Gideon Onyewuenyi',0,'2023-02-01 17:04:03','2023-02-01 17:04:03',NULL),('7052191c-50eb-4d9f-a77b-91531a79b80b','c6fd29e9-5699-4377-8a0b-b4de30252191','Product was uploaded successfully','Product(Obcaecati reprehende)was uploaded successfully',0,'2023-02-13 09:04:00','2023-02-13 09:04:00',NULL),('78616f8e-d84e-4dfd-b313-a0a009270877','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Product was uploaded successfully','Product(Bulldozer)was uploaded successfully',0,'2023-02-01 09:33:23','2023-02-01 09:33:23',NULL),('7dde96bd-186a-4e16-931c-791289dbf8b3','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Bid for Truck approved','Maduabuchi approved your bid for Truck',0,'2023-04-18 16:54:44','2023-04-18 16:54:44',NULL),('84aacaeb-7050-490e-8900-2dd2b3072144','facda5b1-3ca6-4cd7-bdc5-b51207af820e','New Bid for Nesciunt duis volup-30000','New Bid for Nesciunt duis volup - 30000 has been placed by alabo excel',0,'2023-01-27 16:29:29','2023-01-27 16:29:29','c44d3e78-97cd-4807-b8fb-051b6e5374b0'),('8c4f8492-3b20-4c49-8564-c067d4fad408','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Bid for Truck approved','Maduabuchi approved your bid for Truck',0,'2023-04-18 16:54:35','2023-04-18 16:54:35',NULL),('8d2827ef-e199-43f1-a103-bdc2af892f91','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Bid for Rerum veritatis in e approved','alabo approved your bid for Rerum veritatis in e',0,'2023-02-02 18:52:15','2023-02-02 18:52:15',NULL),('8ea1076d-85b4-4595-bd59-8425e1dbd876','c6fd29e9-5699-4377-8a0b-b4de30252191','Bid for Rerum veritatis in e-30000','Bid for Rerum veritatis in e - 30000 has been placed by Gideon Onyewuenyi',0,'2023-02-02 16:50:59','2023-02-02 16:50:59',NULL),('8f2563dd-bc75-4b66-b2c8-a152fda90a79','12707e98-5f3f-4c4e-a40a-013aee491e88','New Bid for Nesciunt duis volup-30000','New Bid for Nesciunt duis volup - 30000 has been placed by Ullam ut voluptas si Sit est et et et i',0,'2023-01-26 04:00:40','2023-01-26 04:00:40',NULL),('919d7144-4e6c-4f1d-8ae2-94ea1d22ea5e','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Product was uploaded successfully','Product(Forklift)was uploaded successfully',0,'2023-02-01 12:22:18','2023-02-01 12:22:18',NULL),('91b41dcd-81c0-4b15-9e36-9b42ea82b750','96ef70ce-2345-47ac-84e3-f65851d1e7ae','New Bid for Forklift-50000','New Bid for Forklift - 50000 has been placed by Andrea Chymdii',0,'2023-02-03 08:25:18','2023-02-03 08:25:18','bf9d8812-37ef-48d4-bbaa-fd0d3c3b63c4'),('924c15d6-eb62-466f-bc7b-c8e3ed396ee7','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Product was uploaded successfully','Product(Cargo Vessel)was uploaded successfully',0,'2023-02-01 10:41:32','2023-02-01 10:41:32',NULL),('9f076a67-0f20-4131-a001-950986f35e10','facda5b1-3ca6-4cd7-bdc5-b51207af820e','Bid for Non ut ut reprehende approved','alabo approved your bid for Non ut ut reprehende',0,'2023-01-29 20:20:21','2023-01-29 20:20:21',NULL),('9fb37789-e9f4-4c54-8e23-8af4f7bac64c','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Bid for Bulldozer-50000','Bid for Bulldozer - 50000 has been placed by alabo excel',0,'2023-02-01 16:35:47','2023-02-01 16:35:47',NULL),('a3904728-fe30-4a75-a4d0-5aa67a062b24','c6fd29e9-5699-4377-8a0b-b4de30252191','Bid for Mollit quia ea et fu-10000','Bid for Mollit quia ea et fu - 10000 has been placed by Gideon O',0,'2023-01-31 10:08:40','2023-01-31 10:08:40',NULL),('aa393088-24f1-4604-9c24-a063bfb42abd','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','New Bid for Non ut ut reprehende-30000','New Bid for Non ut ut reprehende - 30000 has been placed by Rerum doloremque rep Necessitatibus illum',0,'2023-01-26 23:11:03','2023-01-26 23:11:03',NULL),('ac2f1ebe-42d0-48aa-9499-69f8600a57c3','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Product was uploaded successfully','Product(Pumps/Hoses)was uploaded successfully',0,'2023-02-01 10:55:03','2023-02-01 10:55:03',NULL),('ac317691-b719-4a90-aac3-002b5dd7b205','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Bid for Forklift-50000','Bid for Forklift - 50000 has been placed by alabo excel',0,'2023-02-01 16:35:31','2023-02-01 16:35:31',NULL),('ae7c3fd9-436f-4b59-a70b-82cbf3882877','12707e98-5f3f-4c4e-a40a-013aee491e88','New Bid for Nesciunt duis volup-50000','New Bid for Nesciunt duis volup - 50000 has been placed by Rerum doloremque rep Necessitatibus illum',0,'2023-01-26 23:10:47','2023-01-26 23:10:47',NULL),('b900ec35-f9d4-43a0-829f-6142a3fc2045','96ef70ce-2345-47ac-84e3-f65851d1e7ae','New Bid for Bulldozer-1000','New Bid for Bulldozer - 1000 has been placed by tester seller 1',0,'2023-04-13 11:32:45','2023-04-13 11:32:45','bd8672fd-ad7b-4fe9-9cbb-e9856f6b3603'),('bf41d03c-c988-4122-9029-4bf5bd0e6dc3','68114c05-2c3c-49da-aebf-6d267fd9cd65','Bid for Ipsum ea provident approved','alabo approved your bid for Ipsum ea provident',0,'2023-02-02 19:03:15','2023-02-02 19:03:15',NULL),('c26edb47-5a2a-411a-878d-ad995bef6d67','c6fd29e9-5699-4377-8a0b-b4de30252191','Product was uploaded successfully','Product(Rerum veritatis in e)was uploaded successfully',0,'2023-02-02 16:50:40','2023-02-02 16:50:40',NULL),('c3783ec5-d400-4234-be22-a1bcd8fabdb3','c6fd29e9-5699-4377-8a0b-b4de30252191','Product was uploaded successfully','Product(Ipsum ea provident)was uploaded successfully',0,'2023-02-02 19:01:22','2023-02-02 19:01:22',NULL),('c8544be5-ebe6-4f0b-a866-81e27e855aca','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Product was uploaded successfully','Product(Yoga)was uploaded successfully',0,'2023-01-31 10:58:03','2023-01-31 10:58:03',NULL),('c9458750-8f2c-47a1-8e63-e7428b81c08d','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','New Bid for Non ut ut reprehende-30000','New Bid for Non ut ut reprehende - 30000 has been placed by Ipsa iusto aliqua Eum aut illum itaqu',0,'2023-01-26 03:56:57','2023-01-26 03:56:57',NULL),('ccaa4926-747f-412c-97ef-e3e83df7a5c3','96ef70ce-2345-47ac-84e3-f65851d1e7ae','New Bid for Pipes-1000','New Bid for Pipes - 1000 has been placed by Maduabuchi Onyewuenyi',0,'2023-04-12 18:42:41','2023-04-12 18:42:41','90cbc772-77ca-4413-acdc-463bc3fdf3b3'),('d36e178d-c0aa-4239-a365-3350cda5ab3c','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Product was uploaded successfully','Product(Bulldozer)was uploaded successfully',0,'2023-02-02 19:21:26','2023-02-02 19:21:26',NULL),('d8b5e47b-0254-42f5-a42a-9c22b3bebf2b','c6fd29e9-5699-4377-8a0b-b4de30252191','Product was uploaded successfully','Product(Quia aut eos id et)was uploaded successfully',0,'2023-02-01 17:01:21','2023-02-01 17:01:21',NULL),('e704c0f2-1ab3-4fbe-90ef-a4b63ebdec87','c6fd29e9-5699-4377-8a0b-b4de30252191','New Bid for Rerum veritatis in e-50000','New Bid for Rerum veritatis in e - 50000 has been placed by Rem Voluptate',0,'2023-02-02 18:51:04','2023-02-02 18:51:04','9c1c2b9c-95a2-4cf4-8a2c-c5cde5da393f'),('eb91a975-5fb4-48cc-8d69-dcba65935203','96ef70ce-2345-47ac-84e3-f65851d1e7ae','Product was uploaded successfully','Product(Bulldozer)was uploaded successfully',0,'2023-02-01 10:00:24','2023-02-01 10:00:24',NULL),('ef77c36e-9d3d-4cba-896f-9ce834d3d1f9','c6fd29e9-5699-4377-8a0b-b4de30252191','Bid for Ipsum ea provident-50000','Bid for Ipsum ea provident - 50000 has been placed by Rem Voluptate',0,'2023-02-02 19:01:36','2023-02-02 19:01:36',NULL),('fcd69154-553f-4fdd-b438-2eefdc3a7570','41cba2a2-f3cf-466f-a94f-04c5e2ad642d','New Bid for Non ut ut reprehende-50000','New Bid for Non ut ut reprehende - 50000 has been placed by Ullam ut voluptas si Sit est et et et i',0,'2023-01-26 04:00:11','2023-01-26 04:00:11',NULL);
/*!40000 ALTER TABLE `user_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `last_login` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('0330c600-ed19-4ca1-9768-cb764cebe4e7','Udokaa','Okuofuu','georgiacharles247@gmail.com','$2y$10$WQayaZvMeQ6t0uyYy6280utbm/tC3nUCbmkq.MsdJiqZKjn8TxmX6','08161340820',NULL,NULL,NULL,NULL,NULL,'admin','2023-04-19',NULL,NULL,'2023-02-03 13:18:47','2023-04-19 14:38:33'),('0419ecc2-19c5-4372-94f4-cc65d0371a30','Ify','Enyia','ifyirondi@gmail.com','$2y$10$suJh5AbcdIY5NTEzvWWegeg7QHjdPZmuX3lLWt/N7Dlv.lZ01pITG','07065382326',NULL,NULL,NULL,NULL,NULL,'user','2023-04-19',NULL,NULL,'2023-01-26 07:13:08','2023-04-19 11:35:07'),('10751e4a-d59f-4d6b-a3e2-8ccdb37b407c','user2','test2','user2@test.com','$2y$10$cKzQKyQFClGvZpqQ3049tOk22Iv9WsrdIJ/dL3YAUAj2CZ3C8bR9.','987542632',NULL,NULL,NULL,NULL,NULL,'user','2023-04-19',NULL,NULL,'2023-04-19 16:58:45','2023-04-19 16:59:04'),('14fb42cd-9ce8-4916-aefb-5103660c65a6','Et veniam duis reru','Recusandae Consequa','admin123@gmail.com','$2y$10$tr3YSEgeOAGj4BJ6lZAoQula1dAPoFVMGeodvMPY/axCvg2PKfRnK','12',NULL,NULL,NULL,NULL,NULL,'admin','2023-02-07',NULL,NULL,'2023-01-29 19:38:50','2023-02-07 16:10:32'),('15c65225-5dcb-412e-8692-c3dac99aab96','Gideon','O','o.gideon@hotmail.com','$2y$10$8g4nYAwtczQSjx3Sl7H8QOzXG/i0Hn3hL8.1F/nDHKGH5JnIm8Lgu','09150853579','545339','https://harbourhub.xyz/images/202301311005gid.jpg',NULL,NULL,NULL,'admin','2023-01-30',NULL,NULL,'2023-01-30 09:45:49','2023-02-02 18:49:29'),('42202bb5-83c0-46e6-9875-8ec2d2cf77d5','Nulla','Sed','Ipsam@yahoo.com','$2y$10$tuebS5HshW4wv12BqOEFfuy/etOaghgkCNAXjFmxch5hdclk./xB6','3',NULL,NULL,NULL,NULL,NULL,'admin',NULL,NULL,NULL,'2023-02-03 10:44:10','2023-02-03 10:44:10'),('5700897b-7e47-4883-8163-cd7aa7dfc997','Ea illum obcaecati','Quo ullam deleniti e','password@gmail.com','$2y$10$JRWqc01VB7yUOA8fNGV/guGBBFWwdAaPcsHpwwBG4PgAQRaURBnN6','73',NULL,NULL,NULL,NULL,NULL,'user',NULL,NULL,NULL,'2023-02-03 07:43:27','2023-02-03 07:43:27'),('68114c05-2c3c-49da-aebf-6d267fd9cd65','Cons','Voluptate','owen@gmail.com','$2y$10$FFDarOpuSYsSgUero7W12OHotlhvScozVMX6Y7VBh8xTjM0Tjvvt6','22',NULL,'https://harbourhub.xyz/images/20230207210900.png','Et nostrum Nam quod',NULL,'Sunt ut tempore exp','user','2023-02-13',NULL,NULL,'2023-02-02 18:42:36','2023-02-13 08:59:16'),('69ab88fa-a037-4a9b-bbcc-ca094f5af440','Roxandra','Akinola','deecox_18@yahoo.com','$2y$10$OTyddpcj14KLS3SVA3VZsemzNy69MYajQgi6AqiGXpNXhvmZSRumW','2348162489652',NULL,NULL,NULL,NULL,NULL,'user','2023-04-19',NULL,NULL,'2023-04-19 21:27:48','2023-04-19 21:28:17'),('754a39cf-698e-4e97-9b57-199049d55b02','Tony','Maduagwu','maduagwu.tony@gmail.com','$2y$10$Au9zAzavrU53mXFD.XYJKeAy8IUGxeS/cexiKWDQ7HHhy/LXjHt/2','08035384467',NULL,NULL,NULL,NULL,NULL,'user','2023-02-17',NULL,NULL,'2023-02-03 09:19:52','2023-02-17 14:41:27'),('776af330-1fdb-44eb-a1a9-3701e2ddd93a','Andrea','Chymdii','chimdinmaukpai@gmail.com','$2y$10$ATEqX3NqDPUW5RcTfMKRF.4uEcB26mRvdi1XjbPuoa3J3I5LJNMGa','08035478008',NULL,NULL,NULL,NULL,NULL,'user','2023-04-18',NULL,NULL,'2023-01-27 12:24:26','2023-04-18 17:44:58'),('7e5f1260-5f04-43ff-80ec-3eba5ee1b913','Giid','Oonye','gideon.onye@pyloop.com','$2y$10$gTtToAstMwi9ZpvVEsmTPOZG8XKrQ2ISjpA/AzcCap6eqVrmFdD6u','08067687101',NULL,'https://harbourhub.xyz/images/2023020419387M2CsRtK_400x400.jpg',NULL,NULL,NULL,'admin','2023-02-11',NULL,NULL,'2023-02-03 10:48:34','2023-02-11 09:38:31'),('81c3d5b6-fa9e-4a49-9c4d-01eb8b2a76dc','Blanditiis aut quae','Sint commodo quo sun','Vitae explicabo In','$2y$10$oyh34/EnRXEMw5OTpx9zQO3cg3HyLGfMxT0VuQeND/eUsYIo3swG2','86',NULL,NULL,NULL,NULL,NULL,'user',NULL,NULL,NULL,'2023-02-07 21:04:12','2023-02-07 21:04:12'),('899d22b8-ea4a-46fc-9290-9616f70c2fba','ADANNAYA','Nnyibe','pizzie09@yahoo.com','$2y$10$/q2k6Ac9glOSbvrLjQplLOz4r0L5g6QjXzP3vV5ec7v/3rtEcXIAO','09098965516',NULL,NULL,NULL,NULL,NULL,'user','2023-04-19',NULL,NULL,'2023-04-19 19:17:50','2023-04-19 19:18:06'),('96ef70ce-2345-47ac-84e3-f65851d1e7ae','Maduabuchi','Onyewuenyi','gonyewuenyi@gmail.com','$2y$10$DOnQqpQD7COczWu9JuMFVuKcLIiK8y5VpDeyxGiTsgG6PEtLotLxS','08107234020','814278','https://harbourhub.xyz/images/202302010940IMG_20210628_222043_243.jpg',NULL,NULL,NULL,'seller','2023-04-11',NULL,NULL,'2023-01-26 00:52:33','2023-04-11 06:02:13'),('c6fd29e9-5699-4377-8a0b-b4de30252191','alabo','excel','alaboexcel@gmail.com','$2y$10$wd1pWpsCFug5d0fFyL.M2eqy9GxJq6QE8UX9G.qh//rd3Hi72QY76','333333',NULL,'https://harbourhub.xyz/images/202301311306error.PNG','Et dolorum tempora r',NULL,'Tempore repudiandae','seller','2023-03-10',NULL,NULL,'2023-01-25 19:17:55','2023-03-10 15:27:58'),('c8a7cf62-13fa-48fb-a91d-fc468f891788','tester','seller 1','seller_1@test.com','$2y$10$0NYr6suQBWaquq8pvjXyEuxK8cqN/Hy7OuLekP1GI432zfCrtpwiO','123456789',NULL,'https://harbourhub.xyz/images/202304131143floki.png','asdfasdfasdf','aa','asfas','user','2023-04-13',NULL,NULL,'2023-04-13 07:49:35','2023-04-13 11:44:34'),('d99350aa-a84d-41ae-852d-f2db9aa14882','Udoka','Okuofu','udoka.okuofu@yahoo.com','$2y$10$qAk02j60doJUXPJjQE410uVBmLfuD6MEPhKsw4PepJGKFRwBO4nFG','08089689138',NULL,NULL,NULL,NULL,NULL,'user','2023-04-20',NULL,NULL,'2023-02-03 08:41:35','2023-04-20 15:22:04');
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

-- Dump completed on 2023-04-21 12:11:09
