-- MySQL dump 10.13  Distrib 8.4.9, for Linux (x86_64)
--
-- Host: localhost    Database: laravel
-- ------------------------------------------------------
-- Server version	8.4.9

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
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('slider','promo','sidebar') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'slider',
  `sort_order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'Mongkol Phone',NULL,'banners/01KQMNKFF0E2F4MRPZW94NB2E8.png','https://zandokh.com/index','Buy Now','slider',0,1,NULL,NULL,'2026-05-02 07:17:50','2026-05-20 15:09:49'),(2,'DDD','dftyuiooiugfdsdfghjkl','banners/01KQMPVRCWM48JYC5DSDP2HTWQ.jpg','https://web.facebook.com/?_rdc=1&_rdr#','View now','slider',0,1,NULL,NULL,'2026-05-02 16:03:05','2026-05-20 15:09:25');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'apple','apple','brands/01KQKRS664QKPYH0Y5BFYACH6G.webp',1,'2026-05-02 07:17:24','2026-05-02 07:17:24'),(2,'BMW','bmw','brands/01KQQD8PBB80RA2Y8E3NKRTG7Y.png',1,'2026-05-03 17:13:07','2026-05-03 17:13:07'),(3,'Samsung','samsung','brands/01KS2V3VM8VFBAY95ZWMAVYE7E.jpg',1,'2026-05-20 14:02:29','2026-05-20 14:02:29'),(4,'Oppo','oppo','brands/01KS2WXZQRYTE9V16SJ5Y23P62.png',1,'2026-05-20 14:34:14','2026-05-20 14:34:14'),(5,'vivo','vivo','brands/01KS2XW99P2R69RG7ZXTGPDF6S.webp',1,'2026-05-20 14:50:46','2026-05-20 14:50:46'),(6,'MSI','msi','brands/01KS2XZ6A7N7AYYG95XEZR6439.jpg',1,'2026-05-20 14:52:22','2026-05-20 14:52:22'),(7,'nike','nike','brands/01KS2YDG3ZB7GCQ4DS8DNCCZF6.png',1,'2026-05-20 15:00:11','2026-05-20 15:00:11');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab','i:1;',1779289413),('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer','i:1779289413;',1779289413),('laravel-cache-livewire-rate-limiter:1bda38332fbe875d3898d66b789c7daf81dad762','i:1;',1777862735),('laravel-cache-livewire-rate-limiter:1bda38332fbe875d3898d66b789c7daf81dad762:timer','i:1777862735;',1777862735),('laravel-cache-livewire-rate-limiter:4e77e1f00df39b43a8a74dad60db8ad318758936','i:1;',1779289223),('laravel-cache-livewire-rate-limiter:4e77e1f00df39b43a8a74dad60db8ad318758936:timer','i:1779289223;',1779289223);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'test123',1,9,'2026-05-02 08:23:30','2026-05-02 13:09:28'),(4,'sUwDNLcFOB3tj1TcXrHkkdZ3vIkhq2JphqYvuYbW',1,9,'2026-05-02 14:35:57','2026-05-02 14:35:57'),(5,'oe1aZcHZdr1ZBnZILxmHrH73wZ9nHdR84S2aDOkP',1,99,'2026-05-03 06:20:38','2026-05-03 06:48:26'),(22,'mYKePiq1HhqfiMaq4c7sZY8Rfiscx5JWTNW1WSSm',2,1,'2026-05-03 07:50:40','2026-05-03 07:50:40'),(39,'xunisIkRvICfT3ATed5AqVephkLnou1lE369C7eu',3,1,'2026-05-03 14:17:53','2026-05-03 14:17:53'),(40,'ET5iykuqlaqkbwpU6NGEMv2RVPWgJ7NVqOU9DAYR',3,1,'2026-05-03 14:17:58','2026-05-03 14:17:58'),(41,'huZcX25zJJgvlofB8FAffAhqLx7VCHIwpSYeStkq',3,1,'2026-05-03 14:17:59','2026-05-03 14:17:59'),(42,'JnGR2FAO8AvQaJAe8SZsmKo3VoEslRinhfT3w28r',3,1,'2026-05-03 14:18:09','2026-05-03 14:18:09'),(43,'pxRSCOkGfU0dgjOEJeje6cAp3XvuAL6jM2TO3X8n',3,1,'2026-05-03 14:18:09','2026-05-03 14:18:09'),(44,'mr8epxt4ZFjh6pdhzKlYMLXBY3tLFMAOr9B6PKvv',3,1,'2026-05-03 14:18:10','2026-05-03 14:18:10'),(45,'7ShYxwK3w10J4h6jwapVYhC7fC4Ela4Eu7zDQcnM',3,1,'2026-05-03 14:18:10','2026-05-03 14:18:10'),(46,'WjxWpVc36qMjy605HAO5GFARXHZ2dV7iPQncdtO2',3,1,'2026-05-03 14:18:11','2026-05-03 14:18:11'),(47,'TME6p3W9JBdI9XoJt1BwHifiJZcKpkPd7ybzHFP2',3,1,'2026-05-03 14:18:12','2026-05-03 14:18:12'),(48,'BJfscZkYa67e0GEIrD4MMDFdhvCrquAE15Cd0aLa',3,1,'2026-05-03 14:18:13','2026-05-03 14:18:13'),(49,'PxCCdNaQiISktdWP2uIzQAf2vrG8gofyPq0yq06i',3,1,'2026-05-03 14:18:14','2026-05-03 14:18:14'),(64,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX',4,1,'2026-05-03 17:19:25','2026-05-03 17:19:25'),(65,'doo0oJGfAoxsj0nCViWkq87NRzA3uFngqvH2sICW',1,3,'2026-05-04 02:37:46','2026-05-04 02:37:46'),(66,'B4f2pyLnnl3R8QnWK39kTQcpRhznHd7oTdlom2Qa',1,1,'2026-05-04 02:37:51','2026-05-04 02:37:51'),(67,'FFHJp55ldPJm8x2IeanKEKeBt3kkqH0f04Ue00ZK',4,1,'2026-05-04 02:38:06','2026-05-04 02:38:06'),(68,'SLQVOq8uL3QSh9EWNkUIY7m42TeW99PlOjryHErJ',2,1,'2026-05-04 02:39:36','2026-05-04 02:39:36'),(70,'sXwL0MtaYx3R9V6uOH337O8SLXbKjZmgVHPaR8Zs',2,2,'2026-05-04 02:57:38','2026-05-04 02:57:38'),(71,'sXwL0MtaYx3R9V6uOH337O8SLXbKjZmgVHPaR8Zs',7,4,'2026-05-04 03:18:12','2026-05-04 03:18:35'),(72,'sXwL0MtaYx3R9V6uOH337O8SLXbKjZmgVHPaR8Zs',8,7,'2026-05-04 03:18:53','2026-05-04 03:18:53'),(78,'iRcS56g1aaYRMHJYPTUvyUaY8WsECUecSssIynWe',3,1,'2026-05-20 15:14:03','2026-05-20 15:14:03'),(79,'iRcS56g1aaYRMHJYPTUvyUaY8WsECUecSssIynWe',12,1,'2026-05-20 15:14:51','2026-05-20 15:14:51');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Drink','drink',NULL,'categories/01KQKVS70B083TNC5CSZC82NYB.webp',1,'2026-05-02 08:09:50','2026-05-02 08:09:50'),(2,'Phone','phone',NULL,'categories/01KQMQSCCCQX5HN0PA0GKDGNJB.png',1,'2026-05-02 16:19:16','2026-05-02 16:19:16'),(3,'Car','car',NULL,'categories/01KQQD4DHWKC5JCMGADV5CD8D5.webp',1,'2026-05-03 17:10:47','2026-05-03 17:10:47'),(4,'Bike','bike',NULL,'categories/01KQQD84ST0JR7W802HENPR6EM.jpg',1,'2026-05-03 17:12:49','2026-05-03 17:12:49'),(5,'monitor','monitor',NULL,'categories/01KS2XX08HZ7SA68FPE5CNNS84.jpg',1,'2026-05-20 14:51:10','2026-05-20 14:51:10'),(6,'shoe','shoe',NULL,'categories/01KS2YFPBH6X2P3594TAT5ZZ7C.jpg',1,'2026-05-20 15:01:22','2026-05-20 15:01:22');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (26,'gg','seth@gmail.coom',NULL,'hi',0,'2026-05-04 03:00:32','2026-05-04 03:00:32'),(27,'Jerry Thomas','vokokir@mailinator.com','987654345678','hi bbb',0,'2026-05-20 14:17:46','2026-05-20 14:17:46'),(28,'Dana Garner','qinonujy@mailinator.com','+1 (802) 184-9816','Ad voluptatem aut v',0,'2026-05-20 14:45:24','2026-05-20 14:45:24'),(29,'rith','rith@gmail.com','0987654345','hi brother',0,'2026-05-20 14:54:22','2026-05-20 14:54:22'),(30,'Wylie Trevino','lemudove@mailinator.com','09876543','xxxxxxxxxxxxxxxxxxxxxxxx',0,'2026-05-20 15:03:10','2026-05-20 15:03:10');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_05_02_042455_create_categories_table',1),(5,'2026_05_02_042456_create_brands_table',1),(6,'2026_05_02_042502_create_products_table',1),(7,'2026_05_02_042512_create_banners_table',1),(8,'2026_05_02_061702_create_orders_table',1),(9,'2026_05_02_061707_create_order_items_table',1),(10,'2026_05_02_063147_create_carts_table',2),(11,'2026_05_02_071507_create_personal_access_tokens_table',3),(12,'2026_05_02_084202_add_order_number_to_orders_table',4),(13,'2026_05_02_101314_create_contacts_table',5),(14,'2026_05_02_102239_create_settings_table',5),(15,'2026_05_02_161025_add_is_featured_to_products_table',6),(16,'2026_05_03_085844_add_session_id_to_orders_table',7),(17,'2026_05_03_133043_make_description_nullable_in_products_table',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (2,'2026-05-03 08:34:21','2026-05-03 08:34:21',4,1,1,0.50),(3,'2026-05-03 08:34:21','2026-05-03 08:34:21',4,2,1,1200.00),(4,'2026-05-03 09:01:26','2026-05-03 09:01:26',5,1,1,0.50),(5,'2026-05-03 09:13:21','2026-05-03 09:13:21',6,1,2,0.50),(6,'2026-05-03 09:18:50','2026-05-03 09:18:50',7,2,2,1200.00),(7,'2026-05-03 09:18:50','2026-05-03 09:18:50',7,1,1,0.50),(8,'2026-05-03 13:24:30','2026-05-03 13:24:30',8,2,2,1200.00),(9,'2026-05-03 13:26:01','2026-05-03 13:26:01',9,2,1,1200.00),(10,'2026-05-03 13:43:09','2026-05-03 13:43:09',10,3,1,600.00),(11,'2026-05-03 13:44:21','2026-05-03 13:44:21',11,3,4,600.00),(12,'2026-05-03 13:44:47','2026-05-03 13:44:47',12,3,1,600.00),(13,'2026-05-03 14:04:26','2026-05-03 14:04:26',13,3,2,600.00),(14,'2026-05-03 14:07:29','2026-05-03 14:07:29',14,3,1,600.00),(15,'2026-05-03 14:22:51','2026-05-03 14:22:51',15,3,6,600.00),(16,'2026-05-03 15:23:42','2026-05-03 15:23:42',16,4,1,0.50),(17,'2026-05-03 15:23:42','2026-05-03 15:23:42',16,3,2,600.00),(18,'2026-05-03 15:23:42','2026-05-03 15:23:42',16,2,3,1200.00),(19,'2026-05-03 15:37:02','2026-05-03 15:37:02',17,2,5,1200.00),(20,'2026-05-03 15:37:02','2026-05-03 15:37:02',17,1,4,0.50),(21,'2026-05-03 16:02:38','2026-05-03 16:02:38',18,3,1,600.00),(22,'2026-05-03 16:05:48','2026-05-03 16:05:48',19,3,2,600.00),(23,'2026-05-03 16:21:20','2026-05-03 16:21:20',20,3,1,600.00),(24,'2026-05-03 16:37:08','2026-05-03 16:37:08',21,3,3,600.00),(25,'2026-05-03 16:37:08','2026-05-03 16:37:08',21,2,7,1200.00),(26,'2026-05-03 16:37:08','2026-05-03 16:37:08',21,1,2,0.50),(27,'2026-05-03 17:15:48','2026-05-03 17:15:48',22,5,13,1.00),(28,'2026-05-03 17:15:48','2026-05-03 17:15:48',22,1,1,0.50),(29,'2026-05-04 02:45:14','2026-05-04 02:45:14',23,2,1,1200.00),(30,'2026-05-20 13:52:06','2026-05-20 13:52:06',24,7,10,20000.00),(31,'2026-05-20 14:48:27','2026-05-20 14:48:27',25,8,1,1000.00),(32,'2026-05-20 14:48:27','2026-05-20 14:48:27',25,3,2,600.00),(33,'2026-05-20 14:54:50','2026-05-20 14:54:50',26,2,1,1200.00),(34,'2026-05-20 15:08:40','2026-05-20 15:08:40',27,2,2,1200.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,NULL,'ORD-yI61Rb-1777711685','2026-05-02 08:48:05','2026-05-02 09:28:29','Sorn Piseth','012345678','Phnom Penh, Cambodia',1.00,'cash','completed'),(4,NULL,'ORD-EjPn6B-1777797261','2026-05-03 08:34:21','2026-05-03 08:46:00','Katell Bradshaw','+1 (701) 776-8797','Rerum qui proident',1200.50,'aba','completed'),(5,'Qj228vB4Wb4yIrgnErTregXw5QGdhOlbCThOMyPM','ORD-8EPtD2-1777798886','2026-05-03 09:01:26','2026-05-03 09:01:26','Sorn Piseth','09876543567','Est impedit aliqui',0.50,'bank','pending'),(6,'Qj228vB4Wb4yIrgnErTregXw5QGdhOlbCThOMyPM','ORD-H81NUl-1777799601','2026-05-03 09:13:21','2026-05-03 09:13:38','Abigail Goodwin','+1 (755) 893-4568','Molestiae quia et qu',1.00,'cod','completed'),(7,'Qj228vB4Wb4yIrgnErTregXw5QGdhOlbCThOMyPM','ORD-gh3PfQ-1777799930','2026-05-03 09:18:50','2026-05-03 09:19:15','Ariel Shannon','+1 (252) 851-9366','Cupiditate aut dolor',2400.50,'bank','completed'),(8,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-r8wn0t-1777814670','2026-05-03 13:24:30','2026-05-03 13:24:30','Neil Conner','+1 (584) 387-9066','Maxime illum ad nih',2400.00,'bank','pending'),(9,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-iDG19s-1777814761','2026-05-03 13:26:01','2026-05-03 13:26:01','Allen Martinez','+1 (665) 544-5564','Eos qui in at volupt',1200.00,'cod','pending'),(10,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-T48zu2-1777815789','2026-05-03 13:43:09','2026-05-03 13:43:09','Vanna Moon','+1 (412) 811-4437','Optio pariatur In',600.00,'cod','pending'),(11,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-5i91dM-1777815861','2026-05-03 13:44:21','2026-05-03 13:44:21','Mallory Hoover','+1 (462) 285-5854','Ipsa id vitae volup',2400.00,'aba','pending'),(12,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-LOMHNe-1777815887','2026-05-03 13:44:47','2026-05-03 14:01:15','Medge Mercado','+1 (733) 669-5016','Elit enim ad dolore',600.00,'aba','completed'),(13,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-kh6Lkf-1777817066','2026-05-03 14:04:26','2026-05-03 14:04:54','Sorn Piset','09876543456','takoe',1200.00,'cod','completed'),(14,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-0RFEaK-1777817249','2026-05-03 14:07:29','2026-05-03 14:13:43','Ryder Campbell','+1 (795) 441-5964','Libero ipsum volupta',600.00,'cod','completed'),(15,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-gBjUow-1777818171','2026-05-03 14:22:51','2026-05-03 14:23:08','Grady Frank','+1 (842) 307-6058','Vel eaque sint paria',3600.00,'cod','completed'),(16,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-jZKpKd-1777821822','2026-05-03 15:23:42','2026-05-03 15:23:42','Alyssa Goodman','+1 (862) 562-9388','Sit libero exercitat',4800.50,'bank','pending'),(17,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-2wJPix-1777822622','2026-05-03 15:37:02','2026-05-03 15:37:02','Stewart Sullivan','+1 (446) 411-2871','Sint rem exercitati',6002.00,'bank','pending'),(18,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-dnHpzW-1777824158','2026-05-03 16:02:38','2026-05-03 16:02:38','Abel Eaton','+1 (388) 584-4277','Culpa beatae harum',600.00,'cod','pending'),(19,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-4J5GS1-1777824348','2026-05-03 16:05:48','2026-05-03 16:05:48','Rebekah Harper','+1 (638) 523-5723','Mollit qui sit nemo',1200.00,'aba','pending'),(20,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-R1TUX9-1777825280','2026-05-03 16:21:20','2026-05-03 16:21:20','Irene Morris','+1 (797) 103-6913','Aliqua Velit volupt',600.00,'aba','pending'),(21,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-d96XwW-1777826228','2026-05-03 16:37:08','2026-05-20 14:13:10','Hoyt Porter','+1 (273) 484-9524','Consectetur volupta',10201.00,'bank','cancelled'),(22,'WjKknGOfI0UVHUPt6HAADhCuW6QhH5OTYBO0H7LX','ORD-n1halj-1777828548','2026-05-03 17:15:48','2026-05-03 17:17:22','Plato Fisher','+1 (957) 611-4458','Quaerat accusantium',13.50,'bank','completed'),(23,'sXwL0MtaYx3R9V6uOH337O8SLXbKjZmgVHPaR8Zs','ORD-AIW5ro-1777862714','2026-05-04 02:45:14','2026-05-04 02:45:26','Michelle Ballard','+1 (669) 758-4647','Velit nisi est cons',1200.00,'cod','completed'),(24,'oVMNT4nfDbkeTG0ktLP4x7V5AvfqiDfY9iKZLOTT','ORD-QG39gT-1779285126','2026-05-20 13:52:06','2026-05-20 13:52:06','Mariko Long','+1 (781) 298-6725','Eum iusto cumque vol',200000.00,'aba','pending'),(25,'oVMNT4nfDbkeTG0ktLP4x7V5AvfqiDfY9iKZLOTT','ORD-1wXpsQ-1779288507','2026-05-20 14:48:27','2026-05-20 14:48:39','Paki Greer','+1 (624) 642-2602','Nisi voluptatem Rat',2200.00,'cod','cancelled'),(26,'WE4wwdJm4vJ4y6C0407jTgLayoYVAsrmufkCXFGu','ORD-9LBDKR-1779288890','2026-05-20 14:54:50','2026-05-20 14:55:07','Odette Bush','+1 (904) 189-2547','Quos duis nemo quas',1200.00,'cod','completed'),(27,'iRcS56g1aaYRMHJYPTUvyUaY8WsECUecSssIynWe','ORD-61JL3x-1779289720','2026-05-20 15:08:40','2026-05-20 15:08:56','Avye Fitzgerald','09876543234567','Non dolores ut ea fa',2400.00,'cod','completed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `brand_id` bigint unsigned DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specifications` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Coca','coca','asdfgh',2,4,0.50,0.40,3,'Founded in 2004, OPPO is a leading global smart device innovator known for sleek hardware, premium cameras, and rapid SuperVOOC charging. Explore their current lineup and features on the OPPO Global Site.\n','products/01KQMRS21PS2QPJBBCPPDXDGXY.png',NULL,1,1,'2026-05-02 08:11:02','2026-05-20 14:35:04'),(2,'17 pro max','17-pro-max','PRD-FSCCWBNU',2,1,1200.00,1199.00,90,'The Apple iPhone 17 (released Sept 2025) is a 6.3-inch smartphone featuring a 120Hz ProMotion OLED display, A19 chip, 48MP Dual Fusion camera, and improved 18MP selfie camera with Center Stage. It includes Apple Intelligence, 256GB base storage, and stronger Ceramic Shield. The design has thinner borders, 177g weight, and comes in 5\n\n','products/01KQMRT2Z064GF19YYDWCXZ77F.webp',NULL,1,1,'2026-05-02 16:20:31','2026-05-20 15:08:56'),(3,'oppo2','oppo2','PRD-AOTRTS0X',2,4,600.00,500.00,87,NULL,'products/01KQQ0DDVY0PYFAQ3BT99JV3YP.png',NULL,1,1,'2026-05-03 13:28:30','2026-05-20 14:35:27'),(4,'Coca','coca1','PRD-Z0P3DP8O',1,NULL,0.50,100.00,100,NULL,'products/01KQQ5YVQKWKRGAQXSMVRQ3F3G.webp',NULL,1,0,'2026-05-03 15:05:24','2026-05-20 14:35:50'),(5,'Matcha','matcha','PRD-5O1XJ85V',1,NULL,1.00,0.99,87,NULL,'products/01KQQANQDBJ1S3G2D6PXM6H9ZG.webp',NULL,1,1,'2026-05-03 16:27:48','2026-05-03 17:17:22'),(6,'STO','sto','PRD-2VKIW4DP',3,NULL,500000.00,450000.00,100,NULL,'products/01KQQD60DP13SRK97BWWC7PMZ9.jpg',NULL,1,1,'2026-05-03 17:11:39','2026-05-03 17:12:04'),(7,'S1000rr','s1000rr','PRD-7BUHIRJ7',4,2,20000.00,NULL,10,NULL,'products/01KQQD9XF15M1Z6FV9GMYKRKEQ.jpg',NULL,1,1,'2026-05-03 17:13:47','2026-05-03 17:13:47'),(8,'Houwie','houwie','PRD-ILWJHNF3',2,NULL,1000.00,NULL,100,NULL,'products/01KQQDBN0T83T6X6X8ASAT57TR.jpg',NULL,1,1,'2026-05-03 17:14:44','2026-05-03 17:14:52'),(9,'s10 plus','s10-plus','PRD-ZSCDJ35Z',2,3,500.00,300.00,100,NULL,'products/01KS2V2F6P3A5JCC6M20Y8EBHJ.webp',NULL,1,1,'2026-05-20 14:01:04','2026-05-20 15:13:46'),(10,'Ferrari','ferrari','PRD-UK3WGOCM',3,NULL,300000.00,NULL,1,NULL,'products/01KS2VNTZK937W4R82PBHP357D.jpg',NULL,1,1,'2026-05-20 14:12:18','2026-05-20 14:12:18'),(11,'MSI monitor','msi-monitor','PRD-LH3G1YFU',5,6,500.00,498.00,100,'good','products/01KS2Y0GVXB4ZZBA2JRGH4DS90.jpg',NULL,1,0,'2026-05-20 14:53:05','2026-05-20 14:53:05'),(12,'Air Force !','air-force','PRD-F6VHXGB5',6,7,1000.00,999.00,100,NULL,'products/01KS2YHWD24GWE5PDC711E49E0.jpg',NULL,1,0,'2026-05-20 15:02:10','2026-05-20 15:02:34');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('6CaHVhoBf6iK6IxRvu9FI8Qsi5i7KjkJWL7oZaaj',NULL,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJKTURqZTdiZ1dQank4aGJ3ZGlkWmlXSzdtY0pZYThYSmpvOUNwOXlaIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdCIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1779285024),('iRcS56g1aaYRMHJYPTUvyUaY8WsECUecSssIynWe',1,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJSaGxCVm9UN0ZhV0ZLc3hxZnhQR1oyMXdDYUU3cnJMeHZmMEVUTWtNIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvbG9jYWxob3N0XC9hZG1pblwvb3JkZXJzIiwicm91dGUiOiJmaWxhbWVudC5hZG1pbi5yZXNvdXJjZXMub3JkZXJzLmluZGV4In0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxLCJwYXNzd29yZF9oYXNoX3dlYiI6IjM3ZGRhYTkyOTczYTBmY2RkNmQwZjI4ZGM3YTZiMmYzNjk1MGQyMWY2Mzc0YTA5NjczNzc5MGQzZDdhNWRjNjAiLCJ0YWJsZXMiOnsiN2IxZDgwNmRkNTA0MDA3NjY5ZWMyNWY3MDZhMjJlODhfY29sdW1ucyI6W3sidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJpbWFnZSIsImxhYmVsIjoiSW1hZ2UiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoibmFtZSIsImxhYmVsIjoiUHJvZHVjdCBOYW1lIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InNrdSIsImxhYmVsIjoiU0tVIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InByaWNlIiwibGFiZWwiOiJQcmljZSIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJzdG9jayIsImxhYmVsIjoiU3RvY2siLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiY2F0ZWdvcnkubmFtZSIsImxhYmVsIjoiQ2F0ZWdvcnkiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfV0sIjk1YWM0Y2EyZDAzNGZmMzZhMWMwN2IxZWE0MzQ4MGM4X2NvbHVtbnMiOlt7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoibG9nbyIsImxhYmVsIjoiTG9nbyIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJuYW1lIiwibGFiZWwiOiJOYW1lIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InNsdWciLCJsYWJlbCI6IlNsdWciLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiaXNfYWN0aXZlIiwibGFiZWwiOiJBY3RpdmUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfV0sImRkYzFkMDhlYmVmYTY1MjI5MDNhYjFmMzdjM2NiOGFjX2NvbHVtbnMiOlt7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiaW1hZ2UiLCJsYWJlbCI6IkltYWdlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6Im5hbWUiLCJsYWJlbCI6Ik5hbWUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoic2x1ZyIsImxhYmVsIjoiU2x1ZyIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJkZXNjcmlwdGlvbiIsImxhYmVsIjoiRGVzY3JpcHRpb24iLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiaXNfYWN0aXZlIiwibGFiZWwiOiJBY3RpdmUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfV0sIjhmYWM2ZWIxY2VjMjY4MDNiM2Y3ZmI0NDBhMjcxMTFiX2NvbHVtbnMiOlt7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiaW1hZ2UiLCJsYWJlbCI6IkltYWdlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6Im5hbWUiLCJsYWJlbCI6Ik5hbWUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoic2t1IiwibGFiZWwiOiJTS1UiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiY2F0ZWdvcnkubmFtZSIsImxhYmVsIjoiQ2F0ZWdvcnkiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiYnJhbmQubmFtZSIsImxhYmVsIjoiQnJhbmQiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoicHJpY2UiLCJsYWJlbCI6IlByaWNlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InNhbGVfcHJpY2UiLCJsYWJlbCI6IlNhbGUgUHJpY2UiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoic3RvY2siLCJsYWJlbCI6IlN0b2NrIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImlzX2FjdGl2ZSIsImxhYmVsIjoiQWN0aXZlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH1dLCJmNTYzYTE4NjI1YWZlNzE5MzI0OWQ4ZTBlNmEzM2I3OV9jb2x1bW5zIjpbeyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6Im5hbWUiLCJsYWJlbCI6Ik5hbWUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiZW1haWwiLCJsYWJlbCI6IkVtYWlsIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InBob25lIiwibGFiZWwiOiJQaG9uZSIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJtZXNzYWdlIiwibGFiZWwiOiJNZXNzYWdlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImlzX3JlYWQiLCJsYWJlbCI6IlJlYWQiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiY3JlYXRlZF9hdCIsImxhYmVsIjoiU3VibWl0dGVkIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH1dLCJlNzkzYTI3OWQ1NmU0NTA2MDk3NTQwMjBkNjI3YmVlY19jb2x1bW5zIjpbeyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6Im9yZGVyX251bWJlciIsImxhYmVsIjoiT3JkZXIgbnVtYmVyIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImN1c3RvbWVyX25hbWUiLCJsYWJlbCI6IkN1c3RvbWVyIG5hbWUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoidG90YWwiLCJsYWJlbCI6IlRvdGFsIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InN0YXR1cyIsImxhYmVsIjoiU3RhdHVzIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImNyZWF0ZWRfYXQiLCJsYWJlbCI6IkNyZWF0ZWQgYXQiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfV0sIjlmNmU3MjMyMTM2N2U1Y2IzM2U4OTQzNGQ1ZmQ4ZjBjX2NvbHVtbnMiOlt7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiaW1hZ2UiLCJsYWJlbCI6IkltYWdlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InRpdGxlIiwibGFiZWwiOiJUaXRsZSIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJ0eXBlIiwibGFiZWwiOiJUeXBlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImlzX2FjdGl2ZSIsImxhYmVsIjoiQWN0aXZlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InNvcnRfb3JkZXIiLCJsYWJlbCI6Ik9yZGVyIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InN0YXJ0X2RhdGUiLCJsYWJlbCI6IlN0YXJ0IERhdGUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiZW5kX2RhdGUiLCJsYWJlbCI6IkVuZCBEYXRlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH1dLCJlMjhhNjAyNjRhMjhhMGZjNTljN2RjODZiZmZkODI0OF9jb2x1bW5zIjpbeyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImtleSIsImxhYmVsIjoiS2V5IiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InZhbHVlIiwibGFiZWwiOiJWYWx1ZSIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9XSwiOTc4NmI4NmRkZjE5ZDAzZjliOTYzYzVjMzYyZDg0NjdfY29sdW1ucyI6W3sidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJvcmRlcl9udW1iZXIiLCJsYWJlbCI6Ik9yZGVyIE51bWJlciIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJjdXN0b21lcl9uYW1lIiwibGFiZWwiOiJDdXN0b21lciBOYW1lIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImN1c3RvbWVyX3Bob25lIiwibGFiZWwiOiJDdXN0b21lciBQaG9uZSIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJzdGF0dXMiLCJsYWJlbCI6IlN0YXR1cyIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJjcmVhdGVkX2F0IiwibGFiZWwiOiJQbGFjZWQiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfV19LCJmaWxhbWVudCI6W119',1779290182);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'phone','0998765556','2026-05-02 10:47:49','2026-05-20 15:10:14'),(2,'email','info@mongkolshop.com','2026-05-02 10:47:49','2026-05-02 10:47:49'),(3,'address','Phnom Penh, Cambodia','2026-05-02 10:47:49','2026-05-02 10:47:49'),(4,'facebook','https://facebook.com/mongkolshop','2026-05-02 10:47:49','2026-05-02 10:47:49'),(5,'telegram','https://t.me/mongkolshop','2026-05-02 10:47:49','2026-05-02 10:47:49'),(6,'copyright','© 2026 Mongkol Phone Shop','2026-05-02 10:47:49','2026-05-20 14:56:04'),(8,'location','Phnom Penh','2026-05-02 10:49:05','2026-05-02 10:49:05'),(9,'site_name','APPLE STORE','2026-05-03 06:06:59','2026-05-20 15:10:40'),(10,'business_hours_monday_friday','9am - 6pm','2026-05-03 15:08:33','2026-05-03 15:08:33'),(11,'business_hours_saturday','10am - 4pm','2026-05-03 15:08:33','2026-05-03 15:08:33'),(12,'business_hours_sunday','Closed','2026-05-03 15:08:33','2026-05-03 15:10:56');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@gmail.com',NULL,'$2y$12$tcmEGe5rGsgCVhoGFh0NZuwc36qT5V.8mdYxswjw5j2fPU2FSJZYO','9X5xABcEEKAafFhh1DdQksolBZ52jGPWGEuBDx2xDArGOCw6akPMiwmostUt','2026-05-02 06:20:03','2026-05-02 06:20:03'),(2,'Test User','test@example.com','2026-05-02 10:37:00','$2y$12$F62kUROpdfbWS2XYf8jzuO/tF2Td2gGvAB25dPLoJpw4Tdfdst4Mu','rDW5Mmebt7','2026-05-02 10:37:00','2026-05-02 10:37:00');
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

-- Dump completed on 2026-05-20 15:45:14
