-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: shopmedb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `state` varchar(45) NOT NULL,
  `default_address` bit(1) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn3sth7s3kur1rafwbbrqqnswt` (`country_id`),
  KEY `FKhrpf5e8dwasvdc5cticysrt2k` (`customer_id`),
  CONSTRAINT `FKhrpf5e8dwasvdc5cticysrt2k` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKn3sth7s3kur1rafwbbrqqnswt` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(128) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_oce3937d2f4mpfqrycbr0l93m` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'logo-4.png','CocaCoLa'),(2,'pepsi.jpg','pepsi'),(3,'7-Up.jpg','7-Up'),(4,'Sprite.jpg','Sprite'),(5,'Mirinda.jpg','MiRinDa'),(6,'logo.png','50 Chickens');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands_categories`
--

DROP TABLE IF EXISTS `brands_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brands_categories` (
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`brand_id`,`category_id`),
  KEY `FK6x68tjj3eay19skqlhn7ls6ai` (`category_id`),
  CONSTRAINT `FK58ksmicdguvu4d7b6yglgqvxo` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `FK6x68tjj3eay19skqlhn7ls6ai` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands_categories`
--

LOCK TABLES `brands_categories` WRITE;
/*!40000 ALTER TABLE `brands_categories` DISABLE KEYS */;
INSERT INTO `brands_categories` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(6,2),(6,5),(6,6),(6,7),(6,8),(6,9);
/*!40000 ALTER TABLE `brands_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdagcsk6v6x4n1kxw3rkp57921` (`customer_id`),
  KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`),
  CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKdagcsk6v6x4n1kxw3rkp57921` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `alias` varchar(64) NOT NULL,
  `image` varchar(128) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `all_parent_ids` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jx1ptm0r46dop8v0o7nmgfbeq` (`alias`),
  UNIQUE KEY `UK_t8o6pivur7nn124jehx7cygw5` (`name`),
  KEY `FKsaok720gsu4u2wrgbk10b5n8d` (`parent_id`),
  CONSTRAINT `FKsaok720gsu4u2wrgbk10b5n8d` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Nước Có Gas','Nước có Gas','drink.jpg',_binary '',NULL,NULL),(2,'ComBo 2 Người','ComBo 2 Người','24b886c205e456b301530b4a66da3950.png',_binary '',NULL,NULL),(4,'50 Chickens','50 Chickens','logo.png',_binary '',4,'-2-4-'),(5,'Món Gà rán','Món Gà rán','garan.jpg',_binary '',NULL,NULL),(6,'Món Mì ý','Món Mì ý','miY.jpg',_binary '',NULL,NULL),(7,'Món Kem','Món Kem','kem.jpg',_binary '',NULL,NULL),(8,'Món Hamburger','Món Hamburger','hamburger.jpg',_binary '',NULL,NULL),(9,'Combo 1 Người','Combo 1 Người','6.jpg',_binary '',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `code` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (242,'Vietnam','VN'),(251,'Lao','DN');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(4) NOT NULL,
  `name` varchar(64) NOT NULL,
  `symbol` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'USD','United States Dollar','$'),(4,'EUR','Euro','€'),(9,'AUD','Australian Dollar','$'),(11,'VND','Vietnamese đồng ','₫');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `authentication_type` varchar(10) DEFAULT NULL,
  `reset_password_token` varchar(30) DEFAULT NULL,
  `verification_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rfbvkrffamfql7cjmen8v976v` (`email`),
  KEY `FK7b7p2myt0y31l4nyj1p7sk0b1` (`country_id`),
  CONSTRAINT `FK7b7p2myt0y31l4nyj1p7sk0b1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (2,'tantdps12745@fpt.edu.vn','$2a$10$najndYMObPew7tOsd6hrNenM.S9E3dME1QkHX5FlFOaJpJfM6GFVO','trAN','duy','0303030030','Chu se','','chư sê','Gia Lai',242,'2022-04-01 08:08:31.356000','333',_binary '','GOOGLE',NULL,NULL),(5,'nguyendkps10444@fpt.edu.vn','$2a$10$oG.pOukPzC.5jZJmAGX/nOEG7LLGqRrN7.wWcUaQgnSwzoSvW3.mi','tan','ddddddsss','0303030030','9393dashdasd a','dáhdjashd','chư sê','Can Tho',242,'2022-04-16 10:39:07.106000',NULL,_binary '','DATABASE',NULL,'K4YqZQP4PwsX0nZwvSWamOHMrnPugiFOICQq1gLWVpMIPSfhQMzr8RFxPtukxUFZ'),(9,'tranduytan.220300@gmail.com','$2a$10$.I79pY1fAHD1WsKYr5oMLO7a4H0QRJ.re3dYqGkNXmmyHJNEul/XK','Tran','Tan','0379691867','Quan 12','','Bac Lieu','Bac Lieu',242,'2022-04-23 23:43:04.572000',NULL,_binary '','GOOGLE',NULL,NULL),(10,'khanhtoantran1101@gmail.com','','Trần','Khánh Toàn','034000339','dđewqewq','','sdfad','Bac Lieu',242,'2022-04-24 20:26:50.961000','333',_binary '','GOOGLE',NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_cost` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `shipping_cost` float NOT NULL,
  `subtotal` float NOT NULL,
  `unit_price` float NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (39,0,1,0,0.9,0.9,24,1),(40,0,1,0,18.81,18.81,25,3),(41,0,1,0,9.9,9.9,26,8),(42,0,1,0,18.81,18.81,27,13),(43,0,1,0,5.94,5.94,28,14);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_track`
--

DROP TABLE IF EXISTS `order_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notes` varchar(256) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK31jv1s212kajfn3kk1ksmnyfl` (`order_id`),
  CONSTRAINT `FK31jv1s212kajfn3kk1ksmnyfl` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_track`
--

LOCK TABLES `order_track` WRITE;
/*!40000 ALTER TABLE `order_track` DISABLE KEYS */;
INSERT INTO `order_track` VALUES (49,'Order was placed by the customer','NEW','2022-04-24 20:36:46.421000',24),(50,'Order was placed by the customer','NEW','2022-04-24 22:21:48.895000',25),(51,'Order was placed by the customer','NEW','2022-04-24 22:45:33.394000',26),(52,'Order was placed by the customer','NEW','2022-04-24 23:10:56.346000',27),(53,'Order was placed by the customer','NEW','2022-04-24 11:13:01.000000',28),(54,'Shipper is delivering the package','SHIPPING','2022-04-24 23:20:48.000000',28);
/*!40000 ALTER TABLE `order_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `deliver_date` datetime(6) DEFAULT NULL,
  `deliver_days` int(11) NOT NULL,
  `order_time` datetime(6) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `product_cost` float NOT NULL,
  `shipping_cost` float NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `subtotal` float NOT NULL,
  `tax` float NOT NULL,
  `total` float NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpxtb8awmi0dk6smoh2vp1litg` (`customer_id`),
  CONSTRAINT `FKpxtb8awmi0dk6smoh2vp1litg` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (24,'dđewqewq','','sdfad','Trần','Khánh Toàn','034000339','333','Bac Lieu','Vietnam','2022-04-24 20:36:46.421000',0,'2022-04-24 20:36:46.421000','COD',0,0,'NEW',0.9,0,0.9,10),(25,'dđewqewq','','sdfad','Trần','Khánh Toàn','034000339','333','Bac Lieu','Vietnam','2022-04-24 22:21:48.895000',0,'2022-04-24 22:21:48.895000','PAYPAL',0,0,'PAID',18.81,0,18.81,10),(27,'dđewqewq','','sdfad','Trần','Khánh Toàn','034000339','333','Bac Lieu','Vietnam','2022-04-24 23:10:56.346000',0,'2022-04-24 23:10:56.346000','PAYPAL',0,0,'PAID',18.81,0,18.81,10),(28,'dđewqewq','','sdfad','Trần','Khánh Toàn','034000339','333','Bac Lieu','Vietnam','2022-04-24 00:00:00.000000',0,'2022-04-24 23:13:01.174000','COD',0,0,'NEW',5.94,0,5.94,10);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnfvvq3meg4ha3u1bju9k4is3r` (`product_id`),
  CONSTRAINT `FKnfvvq3meg4ha3u1bju9k4is3r` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (1,'NGày sản xuất','2020',1);
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`),
  CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'coca.jpg',1),(2,'tải xuống.jpg',2),(3,'tải xuống (1).jpg',2),(4,'7f56fb56b36a0ca8535a3d92f6aa6221_tn.jpg',2),(5,'61565dc5620c9d3abf6a99b76c0d8e94.jpg',2),(6,'61565dc5620c9d3abf6a99b76c0d8e94.jpg',3),(7,'tải xuống (2).jpg',3),(8,'tải xuống.jpg',3),(9,'1.jpg',4),(10,'2.jpg',5),(12,'4.jpg',7),(13,'3.jpg',8),(14,'2.jpg',8),(15,'2.jpg',9),(16,'3.jpg',9),(19,'2.jpg',11),(20,'3.jpg',11),(21,'2.jpg',12),(22,'3.jpg',12),(23,'tải xuống.jpg',13),(24,'61565dc5620c9d3abf6a99b76c0d8e94.jpg',13),(25,'7f56fb56b36a0ca8535a3d92f6aa6221_tn.jpg',13),(26,'tải xuống (1).jpg',13),(27,'2.jpg',14),(28,'3.jpg',14),(29,'2.jpg',15),(30,'3.jpg',15),(31,'4.jpg',15),(32,'2.jpg',16),(33,'3.jpg',16),(34,'3.jpg',17),(35,'2.jpg',17),(36,'2.jpg',18),(37,'3.jpg',18),(38,'mi-Y-xuc-xich.jpg',19),(39,'3.jpg',19),(40,'2.jpg',20),(41,'3.jpg',20),(42,'2.jpg',21),(43,'3.jpg',22),(44,'2.jpg',22),(45,'3.jpg',23),(46,'2.jpg',23),(47,'2.jpg',24),(48,'3.jpg',24),(49,'2.jpg',25),(50,'3.jpg',25),(51,'7f56fb56b36a0ca8535a3d92f6aa6221_tn.jpg',26),(52,'2.jpg',26),(53,'tải xuống (1).jpg',26),(54,'bi-quyet-chien-khoai-tay-thom-ngon-gion-rum-an-hoai-khong-chan-2.jpg',27),(55,'1.jpg',27),(56,'z3365762020680_7a8918fa3025bd8a0eefebb3bac0d6a6.jpg',27),(57,'tải xuống (1).jpg',27),(58,'9e5d1ec7338da0d6b230ef7db6827111.jpeg',27),(59,'download.jpg',27);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `alias` varchar(256) NOT NULL,
  `short_description` varchar(512) NOT NULL,
  `full_description` varchar(4096) NOT NULL,
  `main_image` varchar(255) NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `in_stock` bit(1) DEFAULT NULL,
  `cost` float NOT NULL,
  `price` float NOT NULL,
  `discount_percent` float DEFAULT NULL,
  `length` float NOT NULL,
  `width` float NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `average_rating` float NOT NULL,
  `review_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8qwq8q3hk7cxkp9gruxupnif5` (`alias`),
  UNIQUE KEY `UK_o61fmio5yukmmiqgnxf8pnavn` (`name`),
  KEY `FKa3a4mpsfdf4d2y6r8ra3sc8mv` (`brand_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  FULLTEXT KEY `products_FTS` (`name`,`short_description`,`full_description`),
  CONSTRAINT `FKa3a4mpsfdf4d2y6r8ra3sc8mv` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Nước Có Gas CoCaCoLa','Nước-Có-Gas-CoCaCoLa','<div>Nước có gas</div>','<div>Nước có gas<br><br><div class=\"videoEmbed\" style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube-nocookie.com/embed/8VGx4AjB3fw?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" webkitallowfullscreen=\"\" mozallowfullscreen=\"\" allowfullscreen=\"\"></iframe></div><br><br><br></div>','logo-4.png',NULL,'2022-04-24 14:39:51.998000',_binary '',_binary '',0,1,10,0,0,0,0,1,1,0,0),(3,'Combo cho 2 Người ','Combo-2-Người','<div>ComBo dành cho 2 người</div>','<div><br></div>','ef541993a629e3e86c39de1ed595909a.png',NULL,'2022-04-24 22:19:54.046000',_binary '',_binary '',0,19,1,0,0,0,0,6,2,0,0),(4,'Nước có Gas Pepsi','Nước-có-Gas-Pepsi','<div>Nước có Gas</div>','<div><br><br><div class=\"videoEmbed\" style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube-nocookie.com/embed/AszDed_77A4?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" webkitallowfullscreen=\"\" mozallowfullscreen=\"\" allowfullscreen=\"\"></iframe></div><br><br><br></div>','pepsi.jpg',NULL,'2022-04-24 21:15:58.969000',_binary '',_binary '',0,1,1,0,0,0,0,2,1,0,0),(5,'Nước có Gas Sprite','Nước-có-Gas-Sprite','<div>Nước có Gas</div>','<div><br><br><div class=\"videoEmbed\" style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube-nocookie.com/embed/Xz389Dsx6Ws?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" webkitallowfullscreen=\"\" mozallowfullscreen=\"\" allowfullscreen=\"\"></iframe></div><br><br><br></div>','Sprite.jpg','2022-04-24 21:18:35.615000','2022-04-24 21:18:35.615000',_binary '',_binary '',0,1,1,0,0,0,0,4,1,0,0),(7,'Nước có Gas 7-Up','Nước-có-Gas-7-Up','<div>Nước có Gas</div>','<div><br><br><div class=\"videoEmbed\" style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube-nocookie.com/embed/OV96S4Kjc5M?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" webkitallowfullscreen=\"\" mozallowfullscreen=\"\" allowfullscreen=\"\"></iframe></div><br><br><br></div>','7-Up.jpg','2022-04-24 21:21:26.942000','2022-04-24 21:21:26.942000',_binary '',_binary '',0,1,1,0,0,0,0,3,1,0,0),(9,'Gà rán sốt tiêu','Gà-rán-sốt-tiêu','<div>Gà rán sốt tiêu</div>','<div><br></div>','1.jpg','2022-04-24 21:35:01.178000','2022-04-24 21:35:01.178000',_binary '',_binary '',0,10,1,0,0,0,0,6,5,0,0),(11,'Hamburger Bò','Hamburger-Bò','<div>Humberger Bò</div>','<div><br></div>','1.jpg','2022-04-24 21:41:12.853000','2022-04-24 21:41:12.853000',_binary '',_binary '',0,5,1,0,0,0,0,6,8,0,0),(12,'Hamburger Gà','Hamburger-Gà','Hamburger Gà','<div><br></div>','1.jpg','2022-04-24 21:41:54.775000','2022-04-24 21:41:54.775000',_binary '',_binary '',0,5,1,0,0,0,0,6,8,0,0),(13,'Com bo cho 2 người loại 2','Com-bo-cho-2-người-loại-2','<div>Combo dành cho 2 người loại 2</div>','<div><br></div>','24b886c205e456b301530b4a66da3950.png','2022-04-24 22:25:23.408000','2022-04-24 22:25:23.409000',_binary '',_binary '',0,19,1,0,0,0,0,6,2,0,0),(14,'Mì Ý Hải Sản','Mì-Ý-Hải-Sản','<div>Mì Ý Hải Sản</div>','<div><br></div>','1.jpg','2022-04-24 22:27:21.176000','2022-04-24 22:27:21.176000',_binary '',_binary '',0,6,1,0,0,0,0,6,6,0,0),(15,'Mí Ý Rau Củ','Mí-Ý-Rau-Củ','<div>Mí Ý Sốt Rau Củ</div>','<div><br></div>','1.jpg','2022-04-24 22:30:59.828000','2022-04-24 22:30:59.828000',_binary '',_binary '',0,5,1,0,0,0,0,6,6,0,0),(16,'Mí Ý Sốt Kem','Mí-Ý-Sốt-Kem','<div>Mì Ý Sốt Kem</div>','<div><br></div>','1.jpg','2022-04-24 22:31:57.892000','2022-04-24 22:31:57.892000',_binary '',_binary '',0,5,1,0,0,0,0,6,6,0,0),(17,'Gà Rán Giòn','Gà-Rán-Giòn','<div>Gà Rán Giòn</div>','<div><br></div>','1.jpg','2022-04-24 22:33:32.706000','2022-04-24 22:33:32.707000',_binary '',_binary '',0,10,1,0,0,0,0,6,5,0,0),(18,'Mì Ý Sốt Bò Bằm','Mì-Ý-Sốt-Bò-Bằm','<div>Mì Ý Sốt Bò Bằm</div>','<div><br></div>','1.jpg','2022-04-24 22:35:46.134000','2022-04-24 22:35:46.134000',_binary '',_binary '',0,5,1,0,0,0,0,6,6,0,0),(19,'Mì Ý Xúc Xích','Mì-Ý-Xúc-Xích','<div>Mì Ý Ăn Kèm Xúc Xích</div>','<div><br></div>','2.jpg','2022-04-24 22:37:05.895000','2022-04-24 22:37:05.895000',_binary '',_binary '',0,5,1,0,0,0,0,6,6,0,0),(20,'Kem Matcha','Kem-Matcha','<div>Kem MatCha Trà Xanh</div>','<div><br></div>','1.jpg','2022-04-24 22:38:42.395000','2022-04-24 22:38:42.395000',_binary '',_binary '',0,3,1,0,0,0,0,6,7,0,0),(21,'Nước Có Gas MiRinDa','Nước-Có-Gas-MiRinDa','<div>Nước có Gas</div>','<div><br></div>','Mirinda.jpg','2022-04-24 22:40:39.427000','2022-04-24 22:40:39.427000',_binary '',_binary '',0,1,1,0,0,0,0,5,1,0,0),(22,'Kem SoCoLa','Kem-SoCoLa','<div>Kem Socola</div>','<div><br></div>','1.jpg','2022-04-24 22:41:59.654000','2022-04-24 22:41:59.654000',_binary '',_binary '',0,2.5,1,0,0,0,0,6,7,0,0),(23,'Kem Dâu','Kem-Dâu','<div>Kem Vị Dâu&nbsp;</div>','<div><br></div>','1.jpg','2022-04-24 22:42:55.498000','2022-04-24 22:42:55.498000',_binary '',_binary '',0,2,1,0,0,0,0,6,7,0,0),(24,'Kem Vani','Kem-Vani','Kem vị Vani','<div><br></div>','1.jpg','2022-04-24 22:43:43.618000','2022-04-24 22:43:43.618000',_binary '',_binary '',0,2,1,0,0,0,0,6,7,0,0),(25,'Gà Rán Sốt Cay','Gà-Rán-Sốt-Cay','<div>Gà Rán Sốt Cay</div>','<div><br></div>','1.jpg','2022-04-24 22:49:07.967000','2022-04-24 22:49:07.967000',_binary '',_binary '',0,10,1,0,0,0,0,6,5,0,0),(26,'Combo cho 1 Người','Combo-cho-1-Người','<div>Combo dành cho 1 người</div>','<div><br></div>','6.jpg','2022-04-24 22:53:50.846000','2022-04-24 22:53:50.846000',_binary '',_binary '',0,5,1,0,0,0,0,6,9,0,0),(27,'Combo cho 1 Người loại 2','Combo-cho-1-Người-loại-2','<div>Combo dành cho 1 người loại 2</div>','<div><br></div>','4.jpg',NULL,'2022-04-24 23:01:45.992000',_binary '',_binary '',0,5,1,0,0,0,0,6,9,0,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(300) NOT NULL,
  `headline` varchar(128) NOT NULL,
  `rating` int(11) NOT NULL,
  `review_time` datetime(6) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `votes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4sm0k8kw740iyuex3vwwv1etu` (`customer_id`),
  KEY `FKpl51cejpw4gy5swfar8br9ngi` (`product_id`),
  CONSTRAINT `FK4sm0k8kw740iyuex3vwwv1etu` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKpl51cejpw4gy5swfar8br9ngi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','manage everything'),(2,'Salesperson','manage product price, customers, shipping, orders and sales report'),(3,'Editor','manage categories, brands, products, articles and menus'),(4,'Shipper','view products, view orders and update order status'),(5,'Assistant','manage questions and reviews');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `settings` (
  `key` varchar(128) NOT NULL,
  `value` varchar(1024) NOT NULL,
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('COPYRIGHT','copy','GENERAL'),('CURRENCY_ID','1','CURRENCY'),('CURRENCY_SYMBOL','$','CURRENCY'),('CURRENCY_SYMBOL_POSITION','Before price','CURRENCY'),('CUSTOMER_VERIFY_CONTENT','Xin chào bạn :<font face=\"Arial Black\">[[name]]</font><div>Vui lòng&nbsp; click vào link dưới mô tả để xác nhận là thành viên của web.</div><div><div><a href=\"[[URL]]\" target=\"_self\" style=\"font-size: 1rem; background-color: rgb(255, 255, 255);\">VERIFY</a><div></div></div></div><div>Chúc bạn thành công.</div><div><br></div><div><br></div>','MAIL_TEMPLATES'),('CUSTOMER_VERIFY_SUBJECT','Vui Lòng nhấn vào Link để xác nhận đăng kí tài khoản tại 50Chickens','MAIL_TEMPLATES'),('DECIMAL_DIGITS','2','CURRENCY'),('DECIMAL_POINT_TYPE','COMMA','CURRENCY'),('MAIL_FROM','tantdps12745@fpt.edu.vn','MAIL_SERVER'),('MAIL_HOST','smtp.gmail.com','MAIL_SERVER'),('MAIL_PASSWORD','bitkpzxjwwwhmfry','MAIL_SERVER'),('MAIL_PORT','587','MAIL_SERVER'),('MAIL_SENDER_NAME','50Chickens','MAIL_SERVER'),('MAIL_USERNAME','tantdps12745@fpt.edu.vn','MAIL_SERVER'),('ORDER_CONFIRMATION_CONTENT','<div><b>Cảm ơn quý khách đã mua sản phẩm bên chúng tôi</b></div><div><b>Tổng giá trị sản phẩm của quý khách phải thanh toán là :&nbsp;<span style=\"font-size: 1rem;\">[[total]]</span></b></div><div><span style=\"font-size: 1rem;\"><b>Quý đã thanh toán thành công và vui lòng chờ ít phút để Shipper bên chúng tôi giao hàng cho quý khách.</b></span></div><div><span style=\"font-size: 1rem;\"><b>Chúc quý khách sử dụng sản phẩm ngon miệng.</b></span></div><div><b><span style=\"font-size: 1rem;\">Nếu sản phẩm bị lỗi hoặc có vấn đề gì quý khách vui lòng liên hệ qua Email :&nbsp;</span>tantdps12745@fpt.edu.vn</b></div><div><b>Hoặc thông qua SĐT:0962 104 773</b></div><div><br></div><div><br></div>','MAIL_TEMPLATES'),('ORDER_CONFIRMATION_SUBJECT','Mã đơn hàng #[[orderId]] đến từ 50Chickens Web','MAIL_TEMPLATES'),('PAYPAL_API_BASE_URL','https://api.sandbox.paypal.com','PAYMENT'),('PAYPAL_API_CLIENT_ID','AeX-bW2FEN5TV_NY58rv_f-XAbikmco3W18gcG_0WLYqQQUyTglbtfevf8zf9AwMAZ1dpjrq5FBCGuUy','PAYMENT'),('PAYPAL_API_CLIENT_SECRET','ELliZ3cTmKzd0FMTNJ72PioLErC5tySvSYa6iXMKUCefq25-SXoV76hgUfYLvk-nYmdnY_uIc3F2q0lx','PAYMENT'),('SITE_LOGO','/site-logo/logo.png','GENERAL'),('SITE_NAME','50Chickens','GENERAL'),('SMTP_AUTH','true','MAIL_SERVER'),('SMTP_SECURED','true','MAIL_SERVER'),('THOUSANDS_POINT_TYPE','POINT','CURRENCY');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_rates`
--

DROP TABLE IF EXISTS `shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipping_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_supported` bit(1) DEFAULT NULL,
  `days` int(11) NOT NULL,
  `rate` float NOT NULL,
  `state` varchar(45) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKef7sfgeybt3xn13nlt2j6sljw` (`country_id`),
  CONSTRAINT `FKef7sfgeybt3xn13nlt2j6sljw` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_rates`
--

LOCK TABLES `shipping_rates` WRITE;
/*!40000 ALTER TABLE `shipping_rates` DISABLE KEYS */;
INSERT INTO `shipping_rates` VALUES (2,_binary '',0,0,'Bac Lieu',242);
/*!40000 ALTER TABLE `shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKskkdphjml9vjlrqn4m5hi251y` (`country_id`),
  CONSTRAINT `FKskkdphjml9vjlrqn4m5hi251y` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Ha Noi',242),(2,'Da Nang',242),(5,'Ho Chi Minh City',242),(6,'Hai Phong',242),(7,'Bac Giang',242),(8,'Son La',242),(9,'Quang Ninh',242),(10,'Nghe An',242),(20,'Can Tho',242),(22,'Binh Duong',242),(23,'Thanh Hoa',242),(38,'Bac Ninh',242),(40,'Ha Tinh',242),(41,'Hue',242),(42,'Binh Dinh',242),(43,'An Giang',242),(51,'Lang Son',242),(109,'Nam Dinh',242),(110,'Khanh Hoa',242),(112,'Tay Ninh',242),(113,'Kien Giang',242),(114,'Lai Chau',242),(115,'Lao Cai',242),(116,'Ha Giang',242),(117,'Hoa Binh',242),(118,'Thai Binh',242),(119,'Dong Nai',242),(120,'Soc Trang',242),(121,'Bac Lieu',242),(123,'Ca Mau',242),(124,'Quang Binh',242),(125,'Quang Tri',242),(126,'Quang Nam',242),(127,'Quang Ngai',242),(128,'Gia Lai',242),(129,'Vinh Phuc',242),(130,'Lam Dong',242),(131,'Dak Lak',242),(132,'Phu Yen',242),(133,'Binh Phuoc',242),(134,'Dak Nong',242),(135,'Dong Thap',242),(136,'Hau Giang',242),(137,'Ba Ria Vung Tau',242),(138,'Binh Thuan',242),(139,'Hai Duong',242),(140,'Hung Yen',242),(141,'Thai Nguyen',242),(142,'Long An',242),(143,'Ben Tre',242),(144,'Bac Kan',242),(145,'Ninh Binh',242),(146,'Kon Tum',242),(147,'Tra Vinh',242),(148,'Yen Bai',242),(149,'Tuyen Quang',242),(150,'Phu Tho',242),(151,'Vinh Long',242);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `photos` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (33,'tan@admin.com',_binary '','Trần','Duy Tân','$2a$10$IharyP84xC9XbVEX8DZq1.7mwV80Ef3aAyxv.y7xtcFvHJ5Lj3fli',NULL),(34,'tan@assistant.com',_binary '','Trần','Duy','$2a$10$JswNpc1dqN72zBlMVwpSnukM/QnWfrNDsi42aA75Fy2toox2pOroG',NULL),(35,'tan@shipper.com',_binary '','tan','Duy','$2a$10$XPN8C6Hn0T1c9FJ9r85aTO4geJIlEVZoL2wkha0tgazUEWDrKdEDa',NULL),(36,'nam@codejava.net',_binary '','Tran','Tan','$2a$10$RPdGIKXI4YDAFf6lUbCWdOmu/kOU0a2U1g872RYO0wNAijblv6nSK',NULL),(37,'tantdps12745@fpt.edu.vn',_binary '','Tran','Tans','$2a$10$xBNjl.C.LrXgl0mJD.oLoeoNnHf5XY1b1u9MMG.wM0zEOI2gdfUMi','coca.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (33,1),(37,1),(36,2),(35,4),(34,5),(37,5);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 14:42:28
