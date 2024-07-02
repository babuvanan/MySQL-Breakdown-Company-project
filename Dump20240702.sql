-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: breakdown_company
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `breakdown`
--

DROP TABLE IF EXISTS `breakdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breakdown` (
  `B_ID` int NOT NULL,
  `VehicleReg` varchar(10) DEFAULT NULL,
  `EngineerID` int DEFAULT NULL,
  `B_DATE` date DEFAULT NULL,
  `B_TIME` time DEFAULT NULL,
  `B_Loc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`B_ID`),
  KEY `fk_VehicleReg` (`VehicleReg`),
  KEY `fk_EngineerID` (`EngineerID`),
  CONSTRAINT `breakdown_ibfk_1` FOREIGN KEY (`VehicleReg`) REFERENCES `vehicle` (`VehicleReg`),
  CONSTRAINT `breakdown_ibfk_2` FOREIGN KEY (`EngineerID`) REFERENCES `engineer` (`EngineerID`),
  CONSTRAINT `fk_EngineerID` FOREIGN KEY (`EngineerID`) REFERENCES `engineer` (`EngineerID`),
  CONSTRAINT `fk_VehicleReg` FOREIGN KEY (`VehicleReg`) REFERENCES `vehicle` (`VehicleReg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breakdown`
--

LOCK TABLES `breakdown` WRITE;
/*!40000 ALTER TABLE `breakdown` DISABLE KEYS */;
INSERT INTO `breakdown` VALUES (1,'KS56 YLL',1,'2024-06-01','08:30:00','Greenford'),(2,'TK51 KLM',2,'2024-06-01','13:15:00','Harrow'),(3,'MV15 KSS',3,'2024-06-02','10:00:00','Wembley'),(4,'MG60 YSG',1,'2024-05-15','11:30:00','Wembley'),(5,'MN51 PQR',2,'2024-05-20','12:00:00','Harrow'),(6,'KS56 YLL',3,'2024-06-03','14:00:00','Edgware'),(7,'PQ73 UTS',1,'2024-04-22','12:30:00','Harrow'),(8,'UT59 GRY',2,'2024-04-22','09:45:00','Edgware'),(9,'VW70 LGH',3,'2024-04-24','15:00:00','Greenford'),(10,'TK51 KLM',1,'2024-06-05','18:15:00','Edgware'),(11,'MN51 PQR',2,'2024-06-06','11:15:00','Hounslow'),(12,'MV15 KSS',3,'2024-06-07','11:30:00','Harrow');
/*!40000 ALTER TABLE `breakdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engineer`
--

DROP TABLE IF EXISTS `engineer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engineer` (
  `EngineerID` int NOT NULL,
  `FIRSTName` varchar(20) DEFAULT NULL,
  `LASTName` varchar(20) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  PRIMARY KEY (`EngineerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engineer`
--

LOCK TABLES `engineer` WRITE;
/*!40000 ALTER TABLE `engineer` DISABLE KEYS */;
INSERT INTO `engineer` VALUES (1,'Adam','Williams','2020-01-21'),(2,'Robert','Johnson',NULL),(3,'Charlie','Bruce Lee',NULL);
/*!40000 ALTER TABLE `engineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `ID` int NOT NULL,
  `FIRSTName` varchar(20) DEFAULT NULL,
  `LASTName` varchar(20) DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'John','Doe','Harrow'),(2,'Diana','Johnson','Edgware'),(3,'Tim','Brown','Greenford'),(5,'Bill','Davis','Hounslow');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `VehicleReg` varchar(10) NOT NULL,
  `VehicleMake` varchar(10) DEFAULT NULL,
  `VehicleModel` varchar(10) DEFAULT NULL,
  `MemberID` int DEFAULT NULL,
  PRIMARY KEY (`VehicleReg`),
  KEY `MemberID` (`MemberID`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('KS56 YLL','Toyota','Camry',1),('MG60 YSG','Chevrolet','Malibu',NULL),('MN51 PQR','Nissan','Altima',5),('MV15 KSS','Ford','Focus',3),('PQ73 UTS','Toyota','Corolla',1),('TK51 KLM','Honda','Civic',2),('UT59 GRY','Honda','Accord',2),('VW70 LGH','Ford','Fiesta',3);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-02 15:09:25
