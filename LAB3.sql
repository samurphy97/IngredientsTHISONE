-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: Foods
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Current Database: `Foods`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Foods` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `Foods`;

--
-- Table structure for table `compare`
--

DROP TABLE IF EXISTS `compare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compare` (
  `foodID` int(11) DEFAULT NULL,
  `ingredientID` int(11) DEFAULT NULL,
  `compareMetadata` blob,
  UNIQUE KEY `pkCompare` (`foodID`,`ingredientID`),
  KEY `ingredientID` (`ingredientID`),
  CONSTRAINT `compare_ibfk_1` FOREIGN KEY (`foodID`) REFERENCES `foods` (`foodID`),
  CONSTRAINT `compare_ibfk_2` FOREIGN KEY (`ingredientID`) REFERENCES `ingredients` (`ingredientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare`
--

LOCK TABLES `compare` WRITE;
/*!40000 ALTER TABLE `compare` DISABLE KEYS */;
INSERT INTO `compare` VALUES (1,1,NULL),(1,3,NULL),(2,1,NULL),(2,4,NULL),(3,2,NULL);
/*!40000 ALTER TABLE `compare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eats`
--

DROP TABLE IF EXISTS `eats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eats` (
  `eatsID` int(11) NOT NULL AUTO_INCREMENT,
  `eatsName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`eatsID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eats`
--

LOCK TABLES `eats` WRITE;
/*!40000 ALTER TABLE `eats` DISABLE KEYS */;
INSERT INTO `eats` VALUES (1,'yummy'),(2,'delicious');
/*!40000 ALTER TABLE `eats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foods` (
  `foodID` int(11) NOT NULL AUTO_INCREMENT,
  `foodName` varchar(25) DEFAULT NULL,
  `foodDescription` varchar(255) DEFAULT NULL,
  `eatsID` int(11) DEFAULT NULL,
  PRIMARY KEY (`foodID`),
  KEY `eatsID` (`eatsID`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`eatsID`) REFERENCES `eats` (`eatsID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'Pizza','Italian',1),(2,'Tacos','Mexican',2),(3,'Egg Rolls','Chinese',2);
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `ingredientID` int(11) NOT NULL AUTO_INCREMENT,
  `ingredientName` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`ingredientID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'cheese'),(2,'crab meat'),(3,'pizza dough'),(4,'salsa');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-19 20:41:26
