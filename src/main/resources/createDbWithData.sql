CREATE DATABASE  IF NOT EXISTS `petrol` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `petrol`;
-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (i686)
--
-- Host: 127.0.0.1    Database: petrol
-- ------------------------------------------------------
-- Server version	5.5.58-0+deb8u1

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
-- Table structure for table `Companies`
--

DROP TABLE IF EXISTS `Companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Companies`
--

LOCK TABLES `Companies` WRITE;
/*!40000 ALTER TABLE `Companies` DISABLE KEYS */;
INSERT INTO `Companies` VALUES (14,'ОАО \"РН-Москва\"'),(12,'ООО \"ШЕЛЛ НЕФТЬ\"'),(13,'ООО\"ВАЛАР\"');
/*!40000 ALTER TABLE `Companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gas_stations`
--

DROP TABLE IF EXISTS `Gas_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Gas_stations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gas_station_Company1_idx` (`company_id`),
  CONSTRAINT `fk_gas_station_Company1` FOREIGN KEY (`company_id`) REFERENCES `Companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about gas stations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gas_stations`
--

LOCK TABLES `Gas_stations` WRITE;
/*!40000 ALTER TABLE `Gas_stations` DISABLE KEYS */;
INSERT INTO `Gas_stations` VALUES (10,12,'АЗС 11060 Шелл Каскадная','ул. Каскадная,вл. 21'),(11,13,'АЗС№83 Хамовники','119048,г.Москва,ул.Хамовнический вал,д.40'),(12,14,'МС096 Абрамцево','МО, г.Балашиха, квартал Абрамцево, вл.54 Б'),(13,14,'МС035 Новокосино','г.Москва, ул.Суздальская, вл.15А'),(14,14,'МС320 Гольяново','г.Москва, МКАД, 102 км, вл.20'),(15,14,'MR042','г.Москва, 5 км МКАД, вл. 6'),(16,14,'MR041','г.Москва, пр-т Мира, д.142'),(17,14,'MC157 Волгоградская','г.Москва, Волгоградский пр-т, 24-1');
/*!40000 ALTER TABLE `Gas_stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gas_station_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `gas_type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cost_per_liter` decimal(5,2) unsigned NOT NULL,
  `discount` decimal(5,2) unsigned DEFAULT NULL,
  `amount_liters` decimal(5,3) unsigned NOT NULL,
  `total_cost` decimal(6,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_gas_station_idx` (`gas_station_id`),
  CONSTRAINT `fk_order_gas_station` FOREIGN KEY (`gas_station_id`) REFERENCES `Gas_stations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about order from the check';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (19,10,'2016-03-11','АИ-95',37.49,NULL,26.670,1000.00),(20,11,'2016-07-02','АИ-95',37.68,NULL,40.000,1507.20),(21,11,'2017-08-28','АИ-95',40.78,NULL,24.600,1003.19),(22,11,'2017-05-03','АИ-95',39.98,NULL,25.020,1000.30),(23,12,'2017-07-24','АИ-95',40.99,NULL,24.400,1000.00),(25,13,'2016-12-07','АИ-95',38.39,NULL,26.050,1000.00),(26,14,'2016-02-19','АИ-95',38.09,6.67,30.000,1142.70),(27,13,'2016-06-03','АИ-95',38.09,NULL,43.340,1650.82),(28,14,'2017-09-01','АИ-95',40.89,NULL,24.460,1000.00),(29,12,'2017-09-24','АИ-95',40.99,NULL,24.400,1000.16),(30,12,'2017-07-22','АИ-95',40.99,NULL,24.400,1000.00),(31,12,'2014-12-21','АИ-95',27.94,NULL,35.790,1000.00),(32,13,'2016-06-20','АИ-95',38.09,NULL,26.250,1000.00),(33,13,'2016-11-12','АИ-95',39.17,NULL,38.290,1500.00),(34,14,'2016-08-25','АИ-95',38.99,NULL,25.650,1000.00),(35,15,'2016-04-19','АИ-95',37.30,NULL,26.810,1000.00),(36,16,'2017-09-21','АИ-95',39.90,NULL,37.595,1500.00),(37,17,'2017-10-08','АИ-95',41.49,NULL,24.103,1000.00),(38,13,'2017-06-03','АИ-95',39.99,NULL,25.010,1000.00),(39,16,'2015-12-13','АИ-95',36.60,NULL,40.980,1500.00),(40,14,'2015-10-18','АИ-95',38.09,NULL,26.250,1000.00),(41,16,'2016-09-26','АИ-95',38.20,NULL,26.180,1000.00),(42,13,'2017-02-23','АИ-95',38.99,NULL,38.472,1500.00);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-02 11:17:59
