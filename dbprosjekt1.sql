-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: dbprosjekt1
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `anmeldelse`
--

DROP TABLE IF EXISTS `anmeldelse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anmeldelse` (
  `AnmeldelseID` int NOT NULL AUTO_INCREMENT,
  `Bedoommelse` int DEFAULT NULL,
  `Text` varchar(700) DEFAULT NULL,
  PRIMARY KEY (`AnmeldelseID`),
  CONSTRAINT `bedoommelsesjekk` CHECK (((11 > `Bedoommelse`) and (`Bedoommelse` > 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anmeldelse`
--

LOCK TABLES `anmeldelse` WRITE;
/*!40000 ALTER TABLE `anmeldelse` DISABLE KEYS */;
/*!40000 ALTER TABLE `anmeldelse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anmeldelseavproduksjon`
--

DROP TABLE IF EXISTS `anmeldelseavproduksjon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anmeldelseavproduksjon` (
  `AnmeldelseID` int NOT NULL,
  `MP` int NOT NULL,
  KEY `AnmeldelseAvProduksjonFK1` (`AnmeldelseID`),
  KEY `AnmeldelseAvProduksjonFK2` (`MP`),
  CONSTRAINT `AnmeldelseAvProduksjonFK1` FOREIGN KEY (`AnmeldelseID`) REFERENCES `anmeldelse` (`AnmeldelseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AnmeldelseAvProduksjonFK2` FOREIGN KEY (`MP`) REFERENCES `medieproduksjon` (`MP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anmeldelseavproduksjon`
--

LOCK TABLES `anmeldelseavproduksjon` WRITE;
/*!40000 ALTER TABLE `anmeldelseavproduksjon` DISABLE KEYS */;
/*!40000 ALTER TABLE `anmeldelseavproduksjon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `personID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`personID`),
  CONSTRAINT `personNummerArtist` FOREIGN KEY (`personID`) REFERENCES `bidragsyter` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidragsyter`
--

DROP TABLE IF EXISTS `bidragsyter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bidragsyter` (
  `PersonID` int NOT NULL AUTO_INCREMENT,
  `Navn` varchar(50) DEFAULT NULL,
  `Fødselsår` int DEFAULT NULL,
  `Fødselsland` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PersonID`),
  CONSTRAINT `aldersjekk` CHECK ((`Fødselsår` < 2021))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidragsyter`
--

LOCK TABLES `bidragsyter` WRITE;
/*!40000 ALTER TABLE `bidragsyter` DISABLE KEYS */;
INSERT INTO `bidragsyter` VALUES (1,'Usman Zarar',1999,'Norge'),(2,'Tom Hanks',1950,'USA'),(3,'Shahrukh Khan',1960,'India'),(4,'Martin Freeman',1955,'England'),(5,'Peder Kjøs',1962,'Norge'),(6,'Ted Danson',1920,'USA'),(7,'J-Lo',1970,'USA'),(8,'Heath Legder',1959,'USA'),(9,'Christian Bale',1968,'USA'),(10,'Anne Hathaway',1971,'USA'),(11,'Salman Khan',1978,'India');
/*!40000 ALTER TABLE `bidragsyter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bruker`
--

DROP TABLE IF EXISTS `bruker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bruker` (
  `brukernavn` varchar(30) NOT NULL,
  PRIMARY KEY (`brukernavn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bruker`
--

LOCK TABLES `bruker` WRITE;
/*!40000 ALTER TABLE `bruker` DISABLE KEYS */;
INSERT INTO `bruker` VALUES ('usafza');
/*!40000 ALTER TABLE `bruker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brukeranmelder`
--

DROP TABLE IF EXISTS `brukeranmelder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brukeranmelder` (
  `AnmeldelseID` int NOT NULL,
  `brukernavn` varchar(30) NOT NULL,
  KEY `BrukerAnmeldernFK1` (`AnmeldelseID`),
  KEY `BrukerAnmeldernFK2` (`brukernavn`),
  CONSTRAINT `BrukerAnmeldernFK1` FOREIGN KEY (`AnmeldelseID`) REFERENCES `anmeldelse` (`AnmeldelseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BrukerAnmeldernFK2` FOREIGN KEY (`brukernavn`) REFERENCES `bruker` (`brukernavn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brukeranmelder`
--

LOCK TABLES `brukeranmelder` WRITE;
/*!40000 ALTER TABLE `brukeranmelder` DISABLE KEYS */;
/*!40000 ALTER TABLE `brukeranmelder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode` (
  `episodeNummer` int NOT NULL AUTO_INCREMENT,
  `tittel` varchar(50) DEFAULT NULL,
  `varighet` int DEFAULT NULL,
  `lanseringsDato` date DEFAULT NULL,
  `storyLine` varchar(400) DEFAULT NULL,
  `utgittPåVideo` tinyint(1) DEFAULT NULL,
  `sesongNummer` int DEFAULT NULL,
  `MP` int DEFAULT NULL,
  PRIMARY KEY (`episodeNummer`),
  KEY `episodeISesong` (`sesongNummer`),
  KEY `surrogatnøkkelEpisode` (`MP`),
  CONSTRAINT `episodeISesong` FOREIGN KEY (`sesongNummer`) REFERENCES `sesong` (`sesongNummer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `surrogatnøkkelEpisode` FOREIGN KEY (`MP`) REFERENCES `medieproduksjon` (`MP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,'Intro',30,'2015-02-02','Peder i gruppeterapi',0,1,10);
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `filmID` int NOT NULL AUTO_INCREMENT,
  `varighet` int DEFAULT NULL,
  `utgivelsesår` int DEFAULT NULL,
  `utgivelsesdato` date DEFAULT NULL,
  `tittel` varchar(50) DEFAULT NULL,
  `storyline` varchar(400) DEFAULT NULL,
  `utgivelsesmedium` varchar(50) DEFAULT NULL,
  `utgittPåVideo` tinyint(1) DEFAULT NULL,
  `MP` int DEFAULT NULL,
  PRIMARY KEY (`filmID`),
  KEY `surrogatnøkkelFilm` (`MP`),
  CONSTRAINT `surrogatnøkkelFilm` FOREIGN KEY (`MP`) REFERENCES `medieproduksjon` (`MP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,128,2019,'2019-02-02','Story of Usman','Fantastisk fortelling om livet mitt','Kino',0,1),(2,169,2009,'2009-03-04','Three Idiots','Tre stykker går på skole','Kino',1,2),(3,119,2017,'2017-07-08','The dark Knight Rises','Batman står opp igjen','Kino',0,3),(4,98,2005,'2005-09-07','American Psycho','Psykopat i USA','Kino',0,4),(5,20,2020,'2020-02-02','20 minutes','20 minutter med skumle ting','Streaming',0,5),(6,129,2020,'2020-03-03','Story of Usman: But scarier','Skummel fortelling om livet mitt','TV',1,6),(7,200,2002,'2002-01-01','IRobot','Robot tar over ish','TV',0,7);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fremførtav`
--

DROP TABLE IF EXISTS `fremførtav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fremførtav` (
  `personID` int NOT NULL,
  `musikkID` int NOT NULL,
  KEY `artistFK` (`personID`),
  KEY `musikkFKartist` (`musikkID`),
  CONSTRAINT `artistFK` FOREIGN KEY (`personID`) REFERENCES `komponist` (`personID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `musikkFKartist` FOREIGN KEY (`musikkID`) REFERENCES `musikk` (`musikkID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fremførtav`
--

LOCK TABLES `fremførtav` WRITE;
/*!40000 ALTER TABLE `fremførtav` DISABLE KEYS */;
/*!40000 ALTER TABLE `fremførtav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komponist`
--

DROP TABLE IF EXISTS `komponist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `komponist` (
  `personID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`personID`),
  CONSTRAINT `personNummerKomponist` FOREIGN KEY (`personID`) REFERENCES `bidragsyter` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komponist`
--

LOCK TABLES `komponist` WRITE;
/*!40000 ALTER TABLE `komponist` DISABLE KEYS */;
/*!40000 ALTER TABLE `komponist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manusforfatteriproduksjon`
--

DROP TABLE IF EXISTS `manusforfatteriproduksjon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manusforfatteriproduksjon` (
  `PersonID` int NOT NULL,
  `MP` int NOT NULL,
  KEY `ManusforfatterIProduksjonFK1` (`PersonID`),
  KEY `ManusforfatterIProduksjonFK2` (`MP`),
  CONSTRAINT `ManusforfatterIProduksjonFK1` FOREIGN KEY (`PersonID`) REFERENCES `mausforfatter` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ManusforfatterIProduksjonFK2` FOREIGN KEY (`MP`) REFERENCES `medieproduksjon` (`MP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manusforfatteriproduksjon`
--

LOCK TABLES `manusforfatteriproduksjon` WRITE;
/*!40000 ALTER TABLE `manusforfatteriproduksjon` DISABLE KEYS */;
INSERT INTO `manusforfatteriproduksjon` VALUES (1,1),(1,2),(9,3),(9,4),(11,5),(11,6);
/*!40000 ALTER TABLE `manusforfatteriproduksjon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mausforfatter`
--

DROP TABLE IF EXISTS `mausforfatter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mausforfatter` (
  `PersonID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PersonID`),
  CONSTRAINT `personNummerManusForfatter` FOREIGN KEY (`PersonID`) REFERENCES `bidragsyter` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mausforfatter`
--

LOCK TABLES `mausforfatter` WRITE;
/*!40000 ALTER TABLE `mausforfatter` DISABLE KEYS */;
INSERT INTO `mausforfatter` VALUES (1),(9),(11);
/*!40000 ALTER TABLE `mausforfatter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medieproduksjon`
--

DROP TABLE IF EXISTS `medieproduksjon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medieproduksjon` (
  `MP` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`MP`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medieproduksjon`
--

LOCK TABLES `medieproduksjon` WRITE;
/*!40000 ALTER TABLE `medieproduksjon` DISABLE KEYS */;
INSERT INTO `medieproduksjon` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `medieproduksjon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musikk`
--

DROP TABLE IF EXISTS `musikk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musikk` (
  `musikkID` int NOT NULL AUTO_INCREMENT,
  `tittel` varchar(50) DEFAULT NULL,
  `varighet` int DEFAULT NULL,
  PRIMARY KEY (`musikkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musikk`
--

LOCK TABLES `musikk` WRITE;
/*!40000 ALTER TABLE `musikk` DISABLE KEYS */;
/*!40000 ALTER TABLE `musikk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musikkforproduksjon`
--

DROP TABLE IF EXISTS `musikkforproduksjon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musikkforproduksjon` (
  `PersonID` int NOT NULL,
  `MP` int NOT NULL,
  KEY `MusikkForProduksjonFK1` (`PersonID`),
  KEY `MusikkForProduksjonFK2` (`MP`),
  CONSTRAINT `MusikkForProduksjonFK1` FOREIGN KEY (`PersonID`) REFERENCES `regissør` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MusikkForProduksjonFK2` FOREIGN KEY (`MP`) REFERENCES `medieproduksjon` (`MP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musikkforproduksjon`
--

LOCK TABLES `musikkforproduksjon` WRITE;
/*!40000 ALTER TABLE `musikkforproduksjon` DISABLE KEYS */;
/*!40000 ALTER TABLE `musikkforproduksjon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produsertav`
--

DROP TABLE IF EXISTS `produsertav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produsertav` (
  `personID` int NOT NULL,
  `musikkID` int NOT NULL,
  KEY `komponistFK` (`personID`),
  KEY `musikkFKkomponist` (`musikkID`),
  CONSTRAINT `komponistFK` FOREIGN KEY (`personID`) REFERENCES `komponist` (`personID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `musikkFKkomponist` FOREIGN KEY (`musikkID`) REFERENCES `musikk` (`musikkID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produsertav`
--

LOCK TABLES `produsertav` WRITE;
/*!40000 ALTER TABLE `produsertav` DISABLE KEYS */;
/*!40000 ALTER TABLE `produsertav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regissør`
--

DROP TABLE IF EXISTS `regissør`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regissør` (
  `PersonID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PersonID`),
  CONSTRAINT `personNummerregissør` FOREIGN KEY (`PersonID`) REFERENCES `bidragsyter` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regissør`
--

LOCK TABLES `regissør` WRITE;
/*!40000 ALTER TABLE `regissør` DISABLE KEYS */;
INSERT INTO `regissør` VALUES (1),(3);
/*!40000 ALTER TABLE `regissør` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regissøriproduksjon`
--

DROP TABLE IF EXISTS `regissøriproduksjon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regissøriproduksjon` (
  `PersonID` int NOT NULL,
  `MP` int NOT NULL,
  KEY `RegissørIProduksjonFK1` (`PersonID`),
  KEY `RegissørIProduksjonFK2` (`MP`),
  CONSTRAINT `RegissørIProduksjonFK1` FOREIGN KEY (`PersonID`) REFERENCES `regissør` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RegissørIProduksjonFK2` FOREIGN KEY (`MP`) REFERENCES `medieproduksjon` (`MP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regissøriproduksjon`
--

LOCK TABLES `regissøriproduksjon` WRITE;
/*!40000 ALTER TABLE `regissøriproduksjon` DISABLE KEYS */;
INSERT INTO `regissøriproduksjon` VALUES (1,1),(1,2),(1,3),(1,4),(3,5),(3,6);
/*!40000 ALTER TABLE `regissøriproduksjon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selskap`
--

DROP TABLE IF EXISTS `selskap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selskap` (
  `SelskapsID` int NOT NULL AUTO_INCREMENT,
  `URL` varchar(100) DEFAULT NULL,
  `Adresse` varchar(100) DEFAULT NULL,
  `Land` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SelskapsID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selskap`
--

LOCK TABLES `selskap` WRITE;
/*!40000 ALTER TABLE `selskap` DISABLE KEYS */;
INSERT INTO `selskap` VALUES (1,'httpgoogle','Wallstrt','Sverige'),(2,'Disney.com','USAish','USA'),(3,'Skrekkfilmlagerne.boo','Transylvania','Romania'),(4,'Bollywood','Bombay','India'),(5,'globalhealth2020.no','G20','Norge');
/*!40000 ALTER TABLE `selskap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selskapiproduksjon`
--

DROP TABLE IF EXISTS `selskapiproduksjon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selskapiproduksjon` (
  `SelskapsID` int NOT NULL,
  `MP` int NOT NULL,
  KEY `SelskapForProduksjonFK1` (`SelskapsID`),
  KEY `SelskapForProduksjonFK2` (`MP`),
  CONSTRAINT `SelskapForProduksjonFK1` FOREIGN KEY (`SelskapsID`) REFERENCES `selskap` (`SelskapsID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SelskapForProduksjonFK2` FOREIGN KEY (`MP`) REFERENCES `medieproduksjon` (`MP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selskapiproduksjon`
--

LOCK TABLES `selskapiproduksjon` WRITE;
/*!40000 ALTER TABLE `selskapiproduksjon` DISABLE KEYS */;
INSERT INTO `selskapiproduksjon` VALUES (5,1),(4,2),(5,6),(2,3),(3,4),(3,5),(4,7);
/*!40000 ALTER TABLE `selskapiproduksjon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serie`
--

DROP TABLE IF EXISTS `serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serie` (
  `SerieID` int NOT NULL AUTO_INCREMENT,
  `Startaar` int DEFAULT NULL,
  `Navn` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SerieID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serie`
--

LOCK TABLES `serie` WRITE;
/*!40000 ALTER TABLE `serie` DISABLE KEYS */;
INSERT INTO `serie` VALUES (1,2015,'Jeg mmot meg');
/*!40000 ALTER TABLE `serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesong`
--

DROP TABLE IF EXISTS `sesong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesong` (
  `sesongNummer` int NOT NULL AUTO_INCREMENT,
  `serieID` int DEFAULT NULL,
  PRIMARY KEY (`sesongNummer`),
  KEY `sesongISerie` (`serieID`),
  CONSTRAINT `sesongISerie` FOREIGN KEY (`serieID`) REFERENCES `serie` (`SerieID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesong`
--

LOCK TABLES `sesong` WRITE;
/*!40000 ALTER TABLE `sesong` DISABLE KEYS */;
INSERT INTO `sesong` VALUES (1,1);
/*!40000 ALTER TABLE `sesong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sjanger`
--

DROP TABLE IF EXISTS `sjanger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sjanger` (
  `SjangerID` int NOT NULL AUTO_INCREMENT,
  `Navn` varchar(50) DEFAULT NULL,
  `Beskrivelse` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`SjangerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sjanger`
--

LOCK TABLES `sjanger` WRITE;
/*!40000 ALTER TABLE `sjanger` DISABLE KEYS */;
INSERT INTO `sjanger` VALUES (1,'Action','Når det skjer mye eksplosjoner og skyting og sånt'),(2,'Komedie','Når du skal le'),(3,'Spenning','Når du skal være spent'),(4,'Thriller','Når du skal være Thrilled'),(5,'Dokumentar','Når du skal være dokumentert');
/*!40000 ALTER TABLE `sjanger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sjangeriproduksjon`
--

DROP TABLE IF EXISTS `sjangeriproduksjon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sjangeriproduksjon` (
  `SjangerID` int NOT NULL,
  `MP` int NOT NULL,
  KEY `SjangerIProduksjonFK1` (`SjangerID`),
  KEY `SjangerIProduksjonFK2` (`MP`),
  CONSTRAINT `SjangerIProduksjonFK1` FOREIGN KEY (`SjangerID`) REFERENCES `sjanger` (`SjangerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SjangerIProduksjonFK2` FOREIGN KEY (`MP`) REFERENCES `medieproduksjon` (`MP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sjangeriproduksjon`
--

LOCK TABLES `sjangeriproduksjon` WRITE;
/*!40000 ALTER TABLE `sjangeriproduksjon` DISABLE KEYS */;
INSERT INTO `sjangeriproduksjon` VALUES (1,1),(2,1),(3,1),(5,1),(2,2),(1,3),(3,3),(4,4),(4,5),(4,6),(5,6),(2,7),(1,7);
/*!40000 ALTER TABLE `sjangeriproduksjon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skuespiller`
--

DROP TABLE IF EXISTS `skuespiller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skuespiller` (
  `PersonID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PersonID`),
  CONSTRAINT `personNummer` FOREIGN KEY (`PersonID`) REFERENCES `bidragsyter` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skuespiller`
--

LOCK TABLES `skuespiller` WRITE;
/*!40000 ALTER TABLE `skuespiller` DISABLE KEYS */;
INSERT INTO `skuespiller` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11);
/*!40000 ALTER TABLE `skuespiller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skuespilleriproduksjon`
--

DROP TABLE IF EXISTS `skuespilleriproduksjon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skuespilleriproduksjon` (
  `PersonID` int NOT NULL,
  `MP` int NOT NULL,
  `Rolle` varchar(45) DEFAULT NULL,
  KEY `SkuespillerIProduksjonFK1` (`PersonID`),
  KEY `SkuespillerIProduksjonFK2` (`MP`),
  CONSTRAINT `SkuespillerIProduksjonFK1` FOREIGN KEY (`PersonID`) REFERENCES `skuespiller` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SkuespillerIProduksjonFK2` FOREIGN KEY (`MP`) REFERENCES `medieproduksjon` (`MP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skuespilleriproduksjon`
--

LOCK TABLES `skuespilleriproduksjon` WRITE;
/*!40000 ALTER TABLE `skuespilleriproduksjon` DISABLE KEYS */;
INSERT INTO `skuespilleriproduksjon` VALUES (1,1,'Protagonist'),(3,2,'Rektor'),(11,2,'Han smarte fattige fyren'),(8,3,'Joker'),(9,3,'Batman/Bruce Wayne'),(10,3,'Catwoman'),(9,4,'Psycho'),(11,7,'Helten'),(3,7,'Roboten');
/*!40000 ALTER TABLE `skuespilleriproduksjon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-06  9:25:07
