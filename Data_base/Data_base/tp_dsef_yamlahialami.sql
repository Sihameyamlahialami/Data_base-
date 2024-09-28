-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: tp_dsef_yamlahialami
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS clients;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE clients (
  RefClient char(20) NOT NULL,
  NomSociete char(50) DEFAULT NULL,
  ville char(30) DEFAULT NULL,
  CodePostale char(10) DEFAULT NULL,
  PRIMARY KEY (RefClient)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES clients WRITE;
/*!40000 ALTER TABLE clients DISABLE KEYS */;
INSERT INTO clients VALUES ('C1','Acom','Tangier','9000'),('C2','B2C','CASA','40000'),('C3','Tcom','Rabat','40000');
/*!40000 ALTER TABLE clients ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS commandes;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE commandes (
  RefCom varchar(20) NOT NULL,
  Societe char(35) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  Somme decimal(10,2) DEFAULT NULL,
  TVA decimal(5,2) DEFAULT NULL,
  RefClient char(20) DEFAULT NULL,
  PRIMARY KEY (RefCom),
  KEY Societe (Societe),
  KEY FK_CommandesClients (RefClient),
  CONSTRAINT FK_CommandesClients FOREIGN KEY (RefClient) REFERENCES clients (RefClient)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commandes`
--

LOCK TABLES commandes WRITE;
/*!40000 ALTER TABLE commandes DISABLE KEYS */;
INSERT INTO commandes VALUES ('CMD101','MarocTelecom','2023-05-01',1200.00,24.00,'C1'),('CMD102','OCP','2023-05-02',1600.50,32.00,'C2'),('CMD103','MarocTelecom','2023-05-03',800.75,16.00,'C1'),('CMD104','RAM','2023-05-04',2100.00,42.00,'C3'),('CMD105','OCP','2023-05-05',350.00,7.00,'C2');
/*!40000 ALTER TABLE commandes ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employes`
--

DROP TABLE IF EXISTS employes;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE employes (
  NumEmploye int NOT NULL AUTO_INCREMENT,
  Nom char(35) DEFAULT NULL,
  `Prénom` char(35) DEFAULT NULL,
  `Tél` char(13) DEFAULT NULL,
  PRIMARY KEY (NumEmploye)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employes`
--

LOCK TABLES employes WRITE;
/*!40000 ALTER TABLE employes DISABLE KEYS */;
INSERT INTO employes VALUES (1,'Radi','FAtima','0626799777'),(15,'yamlahi','Sanae','0690088237'),(111,'Alami','Sihame','0649088277');
/*!40000 ALTER TABLE employes ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-18 13:18:52
