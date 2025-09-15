-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: moviedb
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `ACTED_IN`
--
DROP DATABASE IF EXISTS `moviedb`;
CREATE SCHEMA `moviedb`;
USE `moviedb`;
DROP TABLE IF EXISTS `ACTED_IN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTED_IN` (
  `Movie_ID` int NOT NULL,
  `Actor_ID` int NOT NULL,
  PRIMARY KEY (`Movie_ID`,`Actor_ID`),
  KEY `Actor_ID` (`Actor_ID`),
  CONSTRAINT `ACTED_IN_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`),
  CONSTRAINT `ACTED_IN_ibfk_2` FOREIGN KEY (`Actor_ID`) REFERENCES `Actor` (`Actor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTED_IN`
--

LOCK TABLES `ACTED_IN` WRITE;
/*!40000 ALTER TABLE `ACTED_IN` DISABLE KEYS */;
INSERT INTO `ACTED_IN` VALUES (1,1),(2,1),(1,2),(2,2),(1,3),(2,3),(1,4),(2,4),(2,5),(2,6),(3,8),(4,8),(5,8),(3,9),(4,9),(5,9),(3,10),(4,10),(3,11),(4,11),(5,11),(3,12),(4,12),(3,13),(4,13),(3,14),(4,14),(5,14),(3,15),(4,15),(5,16),(3,18),(4,19),(4,20),(4,22),(5,23),(5,24),(5,25),(5,26),(6,27),(7,27),(6,28),(7,28),(6,29),(7,29),(6,30),(7,30),(6,31),(7,31),(6,32),(7,32),(8,33),(9,33),(8,34),(9,34),(8,35),(9,35),(8,36),(9,36),(8,37),(8,38),(9,38),(8,39),(9,39),(8,40),(9,40),(9,41),(9,42),(9,43),(9,44),(9,45),(11,47),(11,49);
/*!40000 ALTER TABLE `ACTED_IN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Actor`
--

-- DROP TABLE IF EXISTS `Actor`;

DROP TABLE IF EXISTS `Actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Actor` (
  `Actor_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Nationality` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Actor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actor`
--

LOCK TABLES `Actor` WRITE;
/*!40000 ALTER TABLE `Actor` DISABLE KEYS */;
INSERT INTO `Actor` (`Name`, `Date_of_Birth`, `Nationality`) VALUES
('Shameik Moore','1995-05-04','American'),
('Jake Johnson','1978-05-28','American'),
('Brian Tyree Henry','1982-03-31','American'),
('Hailee Steinfeld','1996-12-11','American'),
('Oscar Isaac','1979-03-09','American'),
('Karan Soni','1989-01-08','Indian'),
('Greta Lee','1983-03-07','American'),
('Robert Downey Jr','1965-04-04','American'),
('Chris Evans','1981-06-13','American'),
('Josh Brolin','1968-02-12','American'),
('Tom Holland','1996-06-01','British'),
('Chris Hemsworth','1983-08-11','Australian'),
('Mark Ruffalo','1967-08-30','American'),
('Scarlett Johansson','1984-11-22','American'),
('Benedict Cumberbatch','1976-07-19','British'),
('Sebastian Stan','1980-10-05','American'),
('Chris Pratt','1979-06-21','American'),
('Paul Bettany','1977-01-26','American'),
('Brie Larson','1989-08-27','American'),
('Jeremy Renner','1971-08-10','American'),
('Tom Hiddlestone','1971-09-12','American'),
('Hayley Atwell','1989-05-21','American'),
('Anthony Mackie','1976-08-10','American'),
('Elizabeth Olsen','1996-02-14','American'),
('Paul Rudd','1961-07-09','American'),
('Daniel Brühl','1978-05-16','German'),
('Prabhas','1979-08-23','Indian'),
('Rana Daggubati','1984-12-04','Indian'),
('Tamannaah Bhatia','1989-12-21','Indian'),
('Anushka Shetty','1981-11-07','Indian'),
('Ramya Krishnan','1970-09-15','Indian'),
('Sathyaraj','1954-10-03','Indian'),
('Daniel Radcliffe','1989-07-23','British'),
('Emma Watson','1988-10-31','British'),
('Rupert Grint','1988-06-22','British'),
('Tom Felton','1988-01-17','British'),
('Alan Rickman','1956-01-22','British'),
('Robbie Coltrane','1948-01-19','British'),
('Richard Harris','1942-11-02','British'),
('Maggie Smith','1970-06-06','British'),
('Kenneth Branagh','1960-06-01','British'),
('Jason Issacs','1950-01-02','British'),
('Christian Coulson','1978-10-03','British'),
('Mark Williams','1959-08-22','British'),
('Toby Jones','1966-09-07','British'),
('Anil Shinde','1982-10-10','Indian'),
('Prithvi Shaw','1999-11-09','Indian'),
('Kunal Nayyar','1986-05-05','British'),
('Sudhir Kumar','1981-02-20','Indian'),
('R Madhavan','1970-06-01','Indian');
/*!40000 ALTER TABLE `Actor` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
/*CREATE TABLE `Actor` (
  `Actor_ID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Nationality` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Actor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;*/
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actor`
--

/*LOCK TABLES `Actor` WRITE;*/
/*!40000 ALTER TABLE `Actor` DISABLE KEYS */;
/*INSERT INTO `Actor` VALUES (1,'Shameik Moore','1995-05-04','American'),(2,'Jake Johnson','1978-05-28','American'),(3,'Brian Tyree Henry','1982-03-31','American'),(4,'Hailee Steinfeld','1996-12-11','American'),(5,'Oscar Isaac','1979-03-09','American'),(6,'Karan Soni','1989-01-08','Indian'),(7,'Greta Lee','1983-03-07','American'),(8,'Robert Downey Jr','1965-04-04','American'),(9,'Chris Evans','1981-06-13','American'),(10,'Josh Brolin','1968-02-12','American'),(11,'Tom Holland','1996-06-01','British'),(12,'Chris Hemsworth','1983-08-11','Australian'),(13,'Mark Ruffalo','1967-08-30','American'),(14,'Scarlett Johansson','1984-11-22','American'),(15,'Benedict Cumberbatch','1976-07-19','British'),(16,'Sebastian Stan','1980-10-05','American'),(17,'Chris Pratt','1979-06-21','American'),(18,'Paul Bettany','1977-01-26','American'),(19,'Brie Larson','1989-08-27','American'),(20,'Jeremy Renner','1971-08-10','American'),(22,'Hayley Atwell','1989-05-21','American'),(23,'Anthony Mackie','1976-08-10','American'),(24,'Elizabeth Olsen','1996-02-14','American'),(25,'Paul Rudd','1961-07-09','American'),(26,'Daniel Brühl','1978-05-16','German'),(27,'Prabhas','1979-08-23','Indian'),(28,'Rana Daggubati','1984-12-04','Indian'),(29,'Tamannaah Bhatia','1989-12-21','Indian'),(30,'Anushka Shetty','1981-11-07','Indian'),(31,'Ramya Krishnan','1970-09-15','Indian'),(32,'Sathyaraj','1954-10-03','Indian'),(33,'Daniel Radcliffe','1989-07-23','British'),(34,'Emma Watson','1988-10-31','British'),(35,'Rupert Grint','1988-06-22','British'),(36,'Tom Felton','1988-01-17','British'),(37,'Alan Rickman','1956-01-22','British'),(38,'Robbie Coltrane','1948-01-19','British'),(39,'Richard Harris','1942-11-02','British'),(40,'Maggie Smith','1970-06-06','British'),(41,'Kenneth Branagh','1960-06-01','British'),(42,'Jason Issacs','1950-01-02','British'),(43,'Christian Coulson','1978-10-03','British'),(44,'Mark Williams','1959-08-22','British'),(45,'Toby Jones','1966-09-07','British'),(46,'Anil shinde','1982-10-10','Indian'),(47,'Prithvi shaw','1999-11-09','Indian'),(48,'Kunal Nayyar','1986-05-05','British'),(49,'Sudhir Kumar','1981-02-20','Indian'),(50,'R Madhavan','1970-06-01','Indian');*/
/*!40000 ALTER TABLE `Actor` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `Animated_Movie`
--

DROP TABLE IF EXISTS `Animated_Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Animated_Movie` (
  `Movie_ID` int NOT NULL,
  `Animation_Style` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Movie_ID`),
  CONSTRAINT `Animated_Movie_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animated_Movie`
--

LOCK TABLES `Animated_Movie` WRITE;
/*!40000 ALTER TABLE `Animated_Movie` DISABLE KEYS */;
INSERT INTO `Animated_Movie` VALUES (1,'3D Animation'),(2,'2D and 3D Animation');
/*!40000 ALTER TABLE `Animated_Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Award`
--

DROP TABLE IF EXISTS `Award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Award` (
  `Award_Name` varchar(255) NOT NULL,
  `Award_Year` int NOT NULL,
  `Movie_ID` int DEFAULT NULL,
  PRIMARY KEY (`Award_Name`,`Award_Year`),
  KEY `Movie_ID` (`Movie_ID`),
  CONSTRAINT `Award_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Award`
--

LOCK TABLES `Award` WRITE;
/*!40000 ALTER TABLE `Award` DISABLE KEYS */;
INSERT INTO `Award` VALUES ('Annie Award for Best Animation',2019,1),('Best Animated Feature Film',2019,1),('Golden Globe Award for Best Animation',2019,1),('AFI movie of the Year',2024,2),('Annie Award for Best Animation',2024,2),('Blimp Award for Best Animated Movie',2024,2),('Kids choce Award for Favorite Hero',2020,3),('MTV Award for Best Hero',2019,3),('MTV Award for Best Villain',2019,3),('Kids choce Award for Favorite Movie',2018,4),('People Choice Award for Favorite Action',2018,4),('People Choice Award for Favorite Movie',2018,4),('Kids choce Award for Favorite Movie',2017,5),('Filmfare Award for Best Cinematography',2016,6),('IIFA Award for Best Movie',2016,6),('National Film Award for Best Movie',2016,6),('Filmfare Award for Best Music',2018,7),('National Film Award for Best Movie',2018,7),('Saturn Award for Best Costume Design',2002,8),('Young Artist Award',2002,8),('Critics Choice Movie Award for Best Score',2003,9),('Award for best Marati Short Film',2024,10);
/*!40000 ALTER TABLE `Award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COLLABORATION`
--

DROP TABLE IF EXISTS `COLLABORATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COLLABORATION` (
  `Movie_ID` int NOT NULL,
  `Actor_ID` int NOT NULL,
  `Technician_ID` int NOT NULL,
  `Studio_ID` int NOT NULL,
  PRIMARY KEY (`Movie_ID`,`Actor_ID`,`Technician_ID`,`Studio_ID`),
  KEY `Actor_ID` (`Actor_ID`),
  KEY `Technician_ID` (`Technician_ID`),
  KEY `Studio_ID` (`Studio_ID`),
  CONSTRAINT `COLLABORATION_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`),
  CONSTRAINT `COLLABORATION_ibfk_2` FOREIGN KEY (`Actor_ID`) REFERENCES `Actor` (`Actor_ID`),
  CONSTRAINT `COLLABORATION_ibfk_3` FOREIGN KEY (`Technician_ID`) REFERENCES `Technician` (`Technician_ID`),
  CONSTRAINT `COLLABORATION_ibfk_4` FOREIGN KEY (`Studio_ID`) REFERENCES `Production_House` (`Studio_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLLABORATION`
--

LOCK TABLES `COLLABORATION` WRITE;
/*!40000 ALTER TABLE `COLLABORATION` DISABLE KEYS */;
INSERT INTO `COLLABORATION` VALUES (1,1,1,1),(1,1,3,1),(2,1,1,1),(2,1,2,1),(2,1,3,1),(1,2,1,1),(1,2,2,1),(2,2,1,1),(2,2,2,1),(2,4,1,1),(2,4,2,1),(2,4,3,1),(2,5,1,1),(2,5,3,1),(3,8,4,2),(3,8,5,2),(4,8,4,2),(4,8,5,2),(4,8,6,2),(5,8,4,2),(5,8,5,2),(5,8,9,2),(3,9,4,2),(3,9,5,2),(4,9,4,2),(4,9,5,2),(4,9,6,2),(5,9,4,2),(5,9,5,2),(5,9,9,2),(3,10,4,2),(3,10,5,2),(4,10,4,2),(4,10,5,2),(4,10,6,2),(3,12,4,2),(3,12,5,2),(4,12,4,2),(4,12,5,2),(4,12,6,2),(4,13,4,2),(4,13,5,2),(4,13,6,2),(4,15,4,2),(4,15,5,2),(4,15,6,2),(5,16,4,2),(5,16,5,2),(5,16,9,2),(4,20,4,2),(4,20,5,2),(4,20,6,2),(5,26,4,2),(5,26,5,2),(5,26,9,2),(6,27,10,3),(6,27,11,3),(6,27,12,3),(6,27,13,3),(7,27,10,3),(7,27,11,3),(7,27,12,3),(7,27,13,3),(6,28,10,3),(6,28,11,3),(6,28,12,3),(6,28,13,3),(7,28,10,3),(7,28,11,3),(7,28,12,3),(7,28,13,3),(8,33,14,4),(8,33,15,4),(8,33,16,4),(9,33,14,4),(9,33,15,4),(9,33,16,4),(9,33,17,4),(8,34,14,4),(8,34,15,4),(8,34,16,4),(9,34,14,4),(9,34,15,4),(9,34,16,4),(9,34,17,4),(8,35,14,4),(8,35,15,4),(8,35,16,4),(9,35,14,4),(9,35,15,4),(9,35,16,4),(9,35,17,4),(8,37,14,4),(8,37,15,4),(8,39,14,4),(8,39,15,4),(9,39,14,4),(9,39,15,4),(9,39,17,4),(8,40,14,4),(8,40,15,4),(9,41,14,4),(9,41,15,4),(9,41,17,4),(9,43,14,4),(9,43,15,4),(9,43,17,4),(9,45,14,4),(9,45,15,4),(9,45,17,4),(11,47,19,5),(11,47,20,5),(11,49,19,5),(11,49,20,5);
/*!40000 ALTER TABLE `COLLABORATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category_Award`
--

DROP TABLE IF EXISTS `Category_Award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category_Award` (
  `Award_Name` varchar(255) NOT NULL,
  `Category` varchar(100) NOT NULL,
  PRIMARY KEY (`Award_Name`,`Category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category_Award`
--

LOCK TABLES `Category_Award` WRITE;
/*!40000 ALTER TABLE `Category_Award` DISABLE KEYS */;
INSERT INTO `Category_Award` VALUES ('AFI movie of the Year','Movie'),('Annie Award for Best Animation','Animation'),('Award for best Marati Short Film','Short Film'),('Best Animated Feature Film','Animation'),('Blimp Award for Best Animated Movie','Animation'),('Critics Choice Movie Award for Best Score','Music'),('Filmfare Award for Best Cinematography','Cinematography'),('Filmfare Award for Best Music','Music'),('Golden Globe Award for Best Animation','Animation'),('IIFA Award for Best Movie','Movie'),('Kids choce Award for Favorite Hero','Protagonist'),('Kids choce Award for Favorite Movie','Movie'),('MTV Award for Best Hero','Protagonist'),('MTV Award for Best Villain','Antagonist'),('National Film Award for Best Movie','Movie'),('People Choice Award for Favorite Action','Action Movie'),('People Choice Award for Favorite Movie','Movie'),('Saturn Award for Best Costume Design','Costume Design'),('Young Artist Award','Young Artist');
/*!40000 ALTER TABLE `Category_Award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Char_acter`
--

DROP TABLE IF EXISTS `Char_acter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Char_acter` (
  `Movie_ID` int NOT NULL,
  `Actor_ID` int NOT NULL,
  `Character_Name` varchar(255) DEFAULT NULL,
  `Role_Type` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Actor_ID`,`Movie_ID`),
  KEY `Movie_ID` (`Movie_ID`),
  CONSTRAINT `Char_acter_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`),
  CONSTRAINT `Char_acter_ibfk_2` FOREIGN KEY (`Actor_ID`) REFERENCES `Actor` (`Actor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Char_acter`
--

LOCK TABLES `Char_acter` WRITE;
/*!40000 ALTER TABLE `Char_acter` DISABLE KEYS */;
INSERT INTO `Char_acter` VALUES (1,1,'Miles Morales','Protagonist','Male'),(2,1,'Miles Morales','Protagonist','Male'),(1,2,'Peter Parker','Supporting','Male'),(2,2,'Peter Parker','Supporting','Male'),(1,3,'Jefferson Davis','Supporting','Male'),(2,3,'Jefferson Davis','Supporting','Male'),(1,4,'Gwen Stacy','Supporting','Female'),(2,4,'Gwen Stacy','Supporting','Female'),(2,5,'Miguel o hara','Antagonist','Male'),(2,6,'Pavitra Prabhakar','Supporting','Male'),(3,8,'Tony Stark','Protagonist','Male'),(4,8,'Tony Stark','Protagonist','Male'),(5,8,'Tony Stark','Protagonist','Male'),(3,9,'Steve Rogers','Protagonist','Male'),(4,9,'Steve Rogers','Protagonist','Male'),(5,9,'Steve Rogers','Protagonist','Male'),(3,10,'Thanos','Antagonist','Male'),(4,10,'Thanos','Antagonist','Male'),(3,11,'Peter Parker','Supporting','Male'),(4,11,'Peter Parker','Supporting','Male'),(5,11,'Peter Parker','Supporting','Male'),(3,12,'Thor','Supporting','Male'),(4,12,'Thor','Supporting','Male'),(3,13,'Bruce Banner','Supporting','Male'),(4,13,'Bruce Banner','Supporting','Male'),(3,14,'Natasha Romanoff','Supporting','Female'),(4,14,'Natasha Romanoff','Supporting','Female'),(5,14,'Natasha Romanoff','Supporting','Female'),(3,15,'Stephen Strange','Supporting','Male'),(4,15,'Stephen Strange','Supporting','Male'),(5,16,'Bucky Barnes','Supporting','Male'),(3,18,'Vision','Supporting','Male'),(4,19,'Carol Danvers','Supporting','Female'),(4,20,'Clint Barton','Supporting','Male'),(4,22,'Peggy Carter','Supporting','Female'),(5,23,'Sam Wilson','Supporting','Male'),(5,24,'Wanda Maximoff','Supporting','Female'),(5,25,'Scott Lang','Supporting','Male'),(5,26,'Helmut Zemo','Antagonist','Male'),(6,27,'Bahubali','Protagonist','Male'),(7,27,'Bahubali','Protagonist','Male'),(6,28,'Bhallaladeva','Antagonist','Male'),(7,28,'Bhallaladeva','Antagonist','Male'),(6,29,'Avanthika','Supporting','Female'),(7,29,'Avanthika','Supporting','Female'),(6,30,'Devasena','Supporting','Female'),(7,30,'Devasena','Supporting','Female'),(6,31,'Shivagami','Supporting','Female'),(7,31,'Shivagami','Supporting','Female'),(6,32,'Kattapa','Supporting','Male'),(7,32,'Kattapa','Supporting','Male'),(8,33,'Harry Potter','Protagonist','Male'),(9,33,'Harry Potter','Protagonist','Male'),(8,34,'Hermione Granger','Supporting','Female'),(9,34,'Hermione Granger','Supporting','Female'),(8,35,'Ron Weasley','Supporting','Male'),(9,35,'Ron Weasley','Supporting','Male'),(8,36,'Draco Malfoy','Supporting','Male'),(9,36,'Draco Malfoy','Supporting','Male'),(8,37,'Severus Snape','Supporting','Male'),(8,38,'Rubeus Hagrid','Supporting','Male'),(9,38,'Rubeus Hagrid','Supporting','Male'),(8,39,'Dumbledore','Supporting','Male'),(9,39,'Dumbledore','Supporting','Male'),(8,40,'McGonagall','Supporting','Female'),(9,40,'McGonagall','Supporting','Female'),(9,41,'Gilderoy Lockhart','Supporting','Male'),(9,42,'Lucius Malfoy','Antagonist','Male'),(9,43,'Tom Marvalo Riddle','Antagonist','Male'),(9,44,'Aurther Weasley','Supporting','Male'),(9,45,'Dobby','Supporting','Male'),(11,47,'Prithvi Shaw','Speaker','Male'),(11,49,'Sudhir Kumar','Speaker','Male');
/*!40000 ALTER TABLE `Char_acter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documentary`
--

DROP TABLE IF EXISTS `Documentary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Documentary` (
  `Movie_ID` int NOT NULL,
  `Topic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Movie_ID`),
  CONSTRAINT `Documentary_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documentary`
--

LOCK TABLES `Documentary` WRITE;
/*!40000 ALTER TABLE `Documentary` DISABLE KEYS */;
INSERT INTO `Documentary` VALUES (11,'2011 Cricket World Cup'),(12,'Spcae Program of INDIA');
/*!40000 ALTER TABLE `Documentary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feature_Film`
--

DROP TABLE IF EXISTS `Feature_Film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Feature_Film` (
  `Movie_ID` int NOT NULL,
  PRIMARY KEY (`Movie_ID`),
  CONSTRAINT `Feature_Film_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feature_Film`
--

LOCK TABLES `Feature_Film` WRITE;
/*!40000 ALTER TABLE `Feature_Film` DISABLE KEYS */;
INSERT INTO `Feature_Film` VALUES (3),(4),(5),(6),(7),(8),(9);
/*!40000 ALTER TABLE `Feature_Film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre_Movie`
--

DROP TABLE IF EXISTS `Genre_Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre_Movie` (
  `Movie_ID` int NOT NULL,
  `Genre` varchar(100) NOT NULL,
  PRIMARY KEY (`Movie_ID`,`Genre`),
  CONSTRAINT `Genre_Movie_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre_Movie`
--

LOCK TABLES `Genre_Movie` WRITE;
/*!40000 ALTER TABLE `Genre_Movie` DISABLE KEYS */;
INSERT INTO `Genre_Movie` VALUES (1,'Action'),(1,'Comedy'),(1,'Superhero'),(2,'Action'),(2,'Adventure'),(2,'Family'),(2,'Superhero'),(3,'Action'),(3,'Science Fiction'),(3,'Superhero'),(4,'Science Fiction'),(4,'Space'),(4,'Superhero'),(5,'Action'),(5,'Superhero'),(6,'Action'),(6,'Drama'),(6,'Period'),(7,'Action'),(7,'Drama'),(7,'Epic'),(8,'Adventure'),(8,'Fantasy'),(9,'Fantasy'),(9,'Mystery'),(10,'Drama'),(11,'Drama'),(12,'Adventure'),(12,'Space');
/*!40000 ALTER TABLE `Genre_Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movie` (
  `Movie_ID` int NOT NULL AUTO_INCREMENT,
  `Movie_Name` varchar(255) DEFAULT NULL,
  `Tag_Name` varchar(255) DEFAULT NULL,
  `Release_Date` date DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  `Budget` bigint DEFAULT NULL,
  `Collections` bigint DEFAULT NULL,
  `Studio_ID` int DEFAULT NULL,
  `Sequel_ID` int DEFAULT NULL,
  PRIMARY KEY (`Movie_ID`),
  KEY `Studio_ID` (`Studio_ID`),
  KEY `Sequel_ID` (`Sequel_ID`),
  CONSTRAINT `Movie_ibfk_1` FOREIGN KEY (`Studio_ID`) REFERENCES `Production_House` (`Studio_ID`),
  CONSTRAINT `Movie_ibfk_2` FOREIGN KEY (`Sequel_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
/*INSERT INTO `Movie` VALUES (1,'Spider-man','into the spider verse','2018-03-15',117,90000000,375540003,1,2),(2,'Spider-man','across the spider verse','2023-05-30',140,100000000,689000000,1,NULL),(3,'Avengers','endgame','2019-04-24',181,2900000000,22000000000,2,NULL),(4,'Avengers','infinity war','2018-04-25',149,2500000000,10800000000,2,3),(5,'Captain America','civil war','2016-04-27',147,1100000000,9750000000,2,NULL),(6,'Bahubali','The Beginning','2015-12-16',157,180000000,586000000,3,7),(7,'Bahubali','The Conclusion','2017-12-16',167,250000000,1800000000,3,NULL),(8,'Harry Potter','The Philosophers Stone','2001-06-16',152,10559525000,84476200000,4,9),(9,'Harry Potter','The Chamber of Secrets','2004-06-16',174,8447758220,81267434076,4,NULL),(10,'Panchvis',NULL,'2024-11-07',20,NULL,NULL,5,NULL),(11,'Beyond All Boundaries','Cricket','2013-05-10',98,15000000,23000000,5,NULL),(12,'The Indian Space Odyssey',NULL,'2021-11-07',60,50000000,80000000,5,NULL);*/

INSERT INTO `Movie` 
(Movie_Name, Tag_Name, Release_Date, Duration, Budget, Collections, Studio_ID, Sequel_ID) 
VALUES 
('Spider-man','into the spider verse','2018-03-15',117,90000000,375540003,1,2),
('Spider-man','across the spider verse','2023-05-30',140,100000000,689000000,1,NULL),
('Avengers','endgame','2019-04-24',181,2900000000,22000000000,2,NULL),
('Avengers','infinity war','2018-04-25',149,2500000000,10800000000,2,3),
('Captain America','civil war','2016-04-27',147,1100000000,9750000000,2,NULL),
('Bahubali','The Beginning','2015-12-16',157,180000000,586000000,3,7),
('Bahubali','The Conclusion','2017-12-16',167,250000000,1800000000,3,NULL),
('Harry Potter','The Philosophers Stone','2001-06-16',152,10559525000,84476200000,4,9),
('Harry Potter','The Chamber of Secrets','2004-06-16',174,8447758220,81267434076,4,NULL),
('Panchvis',NULL,'2024-11-07',20,NULL,NULL,5,NULL),
('Beyond All Boundaries','Cricket','2013-05-10',98,15000000,23000000,5,NULL),
('The Indian Space Odyssey',NULL,'2021-11-07',60,50000000,80000000,5,NULL);

/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Production_House`
--

DROP TABLE IF EXISTS `Production_House`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Production_House` (
  `Studio_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Established_Date` date DEFAULT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `Area` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `PinCode` varchar(10) DEFAULT NULL,
  `Owner_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Studio_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Production_House`
--

LOCK TABLES `Production_House` WRITE;
/*!40000 ALTER TABLE `Production_House` DISABLE KEYS */;
INSERT INTO `Production_House` 
(Name, Established_Date, Street, Area, City, State, PinCode, Owner_Name) 
VALUES 
('Sony Pictures Animations','2002-06-09','West Washington Boulevard','Culver City','Los Angeles','California','400050','Tony Vinciquerra'),
('Marvel Studios','1993-12-07','500 S Buena Vista St','Juhu','Burbank','California','400049','Walt Disney'),
('Arka MediaWorks','2001-07-10','Annapurna Studios Lane','Banjara Hills','Hyderabad','Telangana','500033','Shobu Yarlagadda'),
('Warner Brothers Pictures','1923-04-04','W Olive Ave','RiverSide','Burbank','California','94608','Deepa Gupta'),
('Reliance Entertainment','2005-02-15','Veera Desai Industrial Estate','Andheri West','Mumbai','Maharastra','400058','Anil Ambani');

/*INSERT INTO `Production_House` VALUES (1,'Sony Pictures Animations','2002-06-09','West Washington Boulevard','Culver City','Los Angeles','California','400050','Tony Vinciquerra'),(2,'Marvel Studios','1993-12-07','500 S Buena Vista St','Juhu','Burbank','California','400049','Walt Disney'),(3,'Arka MediaWorks','2001-07-10','Annapurna Studios Lane','Banjara Hills','Hyderabad','Telangana','500033','Shobu Yarlagadda'),(4,'Warner Brothers Pictures','1923-04-04','W Olive Ave','RiverSide','Burbank','California','94608','Deepa Gupta'),(5,'Reliance Entertainment','2005-02-15','Veera Desai Industrial Estate','Andheri West','Mumbai','Maharastra','400058','Anil Ambani');*/
/*!40000 ALTER TABLE `Production_House` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Released_Languages_Movie`
--

DROP TABLE IF EXISTS `Released_Languages_Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Released_Languages_Movie` (
  `Movie_ID` int NOT NULL,
  `ReleasedLanguages` varchar(100) NOT NULL,
  PRIMARY KEY (`Movie_ID`,`ReleasedLanguages`),
  CONSTRAINT `Released_Languages_Movie_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Released_Languages_Movie`
--

LOCK TABLES `Released_Languages_Movie` WRITE;
/*!40000 ALTER TABLE `Released_Languages_Movie` DISABLE KEYS */;
INSERT INTO `Released_Languages_Movie` VALUES (1,'English'),(1,'Spanish'),(2,'English'),(2,'Hindi'),(2,'Spanish'),(3,'English'),(3,'German'),(3,'Hindi'),(3,'Spanish'),(4,'English'),(4,'German'),(4,'Hindi'),(4,'Spanish'),(5,'English'),(5,'Spanish'),(6,'Hindi'),(6,'Tamil'),(6,'Telugu'),(7,'Hindi'),(7,'Kannada'),(7,'Tamil'),(7,'Telugu'),(8,'English'),(8,'Hindi'),(8,'Italian'),(8,'Spanish'),(9,'English'),(9,'Hindi'),(9,'Italian'),(10,'Hindi'),(11,'English'),(12,'English');
/*!40000 ALTER TABLE `Released_Languages_Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Short_Film`
--

DROP TABLE IF EXISTS `Short_Film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Short_Film` (
  `Movie_ID` int NOT NULL,
  PRIMARY KEY (`Movie_ID`),
  CONSTRAINT `Short_Film_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Short_Film`
--

LOCK TABLES `Short_Film` WRITE;
/*!40000 ALTER TABLE `Short_Film` DISABLE KEYS */;
INSERT INTO `Short_Film` VALUES (10);
/*!40000 ALTER TABLE `Short_Film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Technician`
--

DROP TABLE IF EXISTS `Technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Technician` (
  `Technician_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Nationality` varchar(100) DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Technician_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Technician`
--

LOCK TABLES `Technician` WRITE;
/*!40000 ALTER TABLE `Technician` DISABLE KEYS */;
INSERT INTO `Technician` 
(Name, Date_of_Birth, Nationality, Department) 
VALUES 
('Peter Ramsey','1962-12-03','American','Direction'),
('Mark Ackland','1986-07-01','American','Art'),
('Christopher S. Aud','1967-09-04','American','Sound'),
('Joe Russo','1971-07-20','American','Direction'),
('Anthony Russo','1971-07-20','American','Direction'),
('Alan Silvestri','1952-12-25','American','Music'),
('Jeffrey Ford','1968-02-16','American','Editing'),
('Jack Kirby','1917-08-28','American','Writting'),
('Owen Paterson','1954-06-24','Australian','Production Design'),
('SS Rajamouli','1963-08-16','Indian','Direction'),
('MM Keeravani','1961-07-04','Indian','Music'),
('KK Senthil','1974-07-29','Indian','Cinematography'),
('Sabu Cyril','1965-02-08','Indian','Art'),
('Chris Columbus','1958-09-10','American','Direction'),
('JK Rowling','1965-07-31','British','Writting'),
('John Williams','1946-01-01','American','Music'),
('Roger Pratt','1947-02-27','British','Cinematography'),
('Ravindra Virkar','1975-02-08','Indian','Direction'),
('Sushrut Jain','1980-07-31','Indian','Direction'),
('Daniel Walter','1986-04-10','American','Music'),
('Pria Somiah Alva','1969-08-02','Indian','Direction'),
('Joshua Whitehead','1985-01-05','Canadian','Writting');

/*INSERT INTO `Technician` VALUES (1,'Peter Ramsey','1962-12-03','American','Direction'),(2,'Mark Ackland','1986-07-01','American','Art'),(3,'Christopher S. Aud','1967-09-04','American','Sound'),(4,'Joe Russo','1971-07-20','American','Direction'),(5,'Anthony Russo','1971-07-20','American','Direction'),(6,'Alan Silvestri','1952-12-25','American','Music'),(7,'Jeffrey Ford','1968-02-16','American','Editing'),(8,'Jack kirby','1917-08-28','American','Writting'),(9,'Owen Paterson','1954-06-24','Australian','Production Design'),(10,'SS Rajamouli','1963-08-16','Indian','Direction'),(11,'MM keeravani','1961-07-04','Indian','Music'),(12,'KK Senthil','1974-07-29','Indian','Cinematography'),(13,'Sabu Cyril','1965-02-08','Indian','Art'),(14,'Chris Columbus','1958-09-10','American','Direction'),(15,'Jk Rowling','1965-07-31','British','Writting'),(16,'John Williams','1946-01-01','American','Music'),(17,'Roger Pratt','1947-02-27','British','Cinematography'),(18,'Ravindra Virkar','1975-02-08','Indian','Direction'),(19,'Sushrut Jain','1980-07-31','Indian','Direction'),(20,'Daniel Walter','1986-04-10','American','Music'),(21,'Pria Somiah Alva','1969-08-02','Indian','Direction'),(23,'Joshua Whitehead','1985-01-05','Canadian','Writting');*/
/*!40000 ALTER TABLE `Technician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trailer`
--

DROP TABLE IF EXISTS `Trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trailer` (
  `Trailer_ID` int NOT NULL AUTO_INCREMENT,
  `Movie_ID` int DEFAULT NULL,
  `Published_Date` date DEFAULT NULL,
  `URL` varchar(500) DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  `Views` int DEFAULT NULL,
  PRIMARY KEY (`Trailer_ID`),
  KEY `Movie_ID` (`Movie_ID`),
  CONSTRAINT `Trailer_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trailer`
--

LOCK TABLES `Trailer` WRITE;
INSERT INTO `Trailer` 
(Movie_ID, Published_Date, URL, Duration, Views) 
VALUES 
(1, '2018-06-06', 'https://www.youtube.com/watch?v=g4Hbz2jLxvQ', 160, 42403053),
(1, '2017-12-10', 'https://www.youtube.com/watch?v=ii3n7hYQOl4', 82, 17190374),
(2, '2022-12-13', 'https://www.youtube.com/watch?v=cqGjhVJWtEg', 149, 37292418),
(2, '2023-04-04', 'https://www.youtube.com/watch?v=shW9i6k8cB0', 169, 52583538),
(3, '2019-03-14', 'https://www.youtube.com/watch?v=TcMBFSGVi1c', 146, 160262148),
(3, '2018-12-07', 'https://www.youtube.com/watch?v=hA6hldpSTF8', 145, 109789316),
(4, '2017-11-29', 'https://www.youtube.com/watch?v=6ZfuNTqbHE8', 144, 264975402),
(4, '2018-03-16', 'https://www.youtube.com/watch?v=QwievZ1Tx-8', 138, 108254199),
(5, '2015-11-25', 'https://www.youtube.com/watch?v=43NWzay3W4s', 146, 13130759),
(6, '2015-06-01', 'https://www.youtube.com/watch?v=sOEg_YZQsTI', 150, 28939466),
(7, '2017-03-16', 'https://www.youtube.com/watch?v=qD-6d8Wo3do', 144, 66679297),
(8, '2014-02-11', 'https://www.youtube.com/watch?v=VyHV0BRtdxo', 136, 5858821),
(9, '2024-04-10', 'https://www.youtube.com/watch?v=nE11U5iBnH0', 126, 260459),
(11, '2014-08-07', 'https://www.youtube.com/watch?v=NlVoTOEGaV0', 163, 50482);

/*!40000 ALTER TABLE `Trailer` DISABLE KEYS */;
/*INSERT INTO `Trailer` VALUES (1,1,'2018-06-06','https://www.youtube.com/watch?v=g4Hbz2jLxvQ',160,42403053),(2,1,'2017-12-10','https://www.youtube.com/watch?v=ii3n7hYQOl4',82,17190374),(3,2,'2022-12-13','https://www.youtube.com/watch?v=cqGjhVJWtEg',149,37292418),(4,2,'2023-04-04','https://www.youtube.com/watch?v=shW9i6k8cB0',169,52583538),(5,3,'2019-03-14','https://www.youtube.com/watch?v=TcMBFSGVi1c',146,160262148),(6,3,'2018-12-07','https://www.youtube.com/watch?v=hA6hldpSTF8',145,109789316),(7,4,'2017-11-29','https://www.youtube.com/watch?v=6ZfuNTqbHE8',144,264975402),(8,4,'2018-03-16','https://www.youtube.com/watch?v=QwievZ1Tx-8',138,108254199),(9,5,'2015-11-25','https://www.youtube.com/watch?v=43NWzay3W4s',146,13130759),(10,6,'2015-06-01','https://www.youtube.com/watch?v=sOEg_YZQsTI',150,28939466),(11,7,'2017-03-16','https://www.youtube.com/watch?v=qD-6d8Wo3do',144,66679297),(12,8,'2014-02-11','https://www.youtube.com/watch?v=VyHV0BRtdxo',136,5858821),(13,9,'2024-04-10','https://www.youtube.com/watch?v=nE11U5iBnH0',126,260459),(14,11,'2014-08-07','https://www.youtube.com/watch?v=NlVoTOEGaV0',163,50482);*/
/*!40000 ALTER TABLE `Trailer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKS_FOR`
--

DROP TABLE IF EXISTS `WORKS_FOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WORKS_FOR` (
  `Movie_ID` int NOT NULL,
  `Technician_ID` int NOT NULL,
  PRIMARY KEY (`Movie_ID`,`Technician_ID`),
  KEY `Technician_ID` (`Technician_ID`),
  CONSTRAINT `WORKS_FOR_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`),
  CONSTRAINT `WORKS_FOR_ibfk_2` FOREIGN KEY (`Technician_ID`) REFERENCES `Technician` (`Technician_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_FOR`
--

LOCK TABLES `WORKS_FOR` WRITE;
/*!40000 ALTER TABLE `WORKS_FOR` DISABLE KEYS */;
INSERT INTO `WORKS_FOR` VALUES (1,1),(2,1),(1,2),(2,2),(1,3),(2,3),(3,4),(4,4),(5,4),(3,5),(4,5),(5,5),(3,6),(4,6),(3,7),(4,7),(5,7),(3,8),(4,8),(5,8),(5,9),(6,10),(7,10),(6,11),(7,11),(6,12),(7,12),(6,13),(7,13),(8,14),(9,14),(8,15),(9,15),(8,16),(9,16),(9,17),(10,18),(11,19),(11,20),(12,21),(12,22);
/*!40000 ALTER TABLE `WORKS_FOR` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-29 17:27:53
