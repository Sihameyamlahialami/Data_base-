-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: biblio_sihame
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
-- Table structure for table `auteur`
--

DROP TABLE IF EXISTS auteur;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE auteur (
  NumAuteur varchar(10) NOT NULL,
  Nom varchar(30) NOT NULL,
  Adresse varchar(50) DEFAULT NULL,
  PRIMARY KEY (NumAuteur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auteur`
--

LOCK TABLES auteur WRITE;
/*!40000 ALTER TABLE auteur DISABLE KEYS */;
INSERT INTO auteur VALUES ('H','Hakim','Rue 123'),('M','Moujarrib','Rue 456'),('N','Neferiti','Rue 789'),('NumAuteurE','Nom de l’Auteur','Adresse de l’Auteur'),('R','Ramsis','Rue 101'),('T','Tafih','RUE 102');
/*!40000 ALTER TABLE auteur ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editeur`
--

DROP TABLE IF EXISTS editeur;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE editeur (
  NumEditeur varchar(10) NOT NULL,
  Nom varchar(30) NOT NULL,
  Adresse varchar(50) DEFAULT NULL,
  PRIMARY KEY (NumEditeur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editeur`
--

LOCK TABLES editeur WRITE;
/*!40000 ALTER TABLE editeur DISABLE KEYS */;
INSERT INTO editeur VALUES ('DAO','Dar Al-Oujoum','rue abc'),('NP','Nul Part','Av DEF'),('NumEditeur','Nom de l’Éditeur','Adresse de l’Éditeur'),('PLB','Pour les Bêtes','RUE GHI');
/*!40000 ALTER TABLE editeur ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiant`
--

DROP TABLE IF EXISTS etudiant;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE etudiant (
  NumEtudiant int NOT NULL,
  Nom varchar(30) NOT NULL,
  Prenom varchar(30) NOT NULL,
  Age int DEFAULT NULL,
  Ville varchar(30) NOT NULL,
  Tel varchar(20) DEFAULT NULL,
  PRIMARY KEY (NumEtudiant),
  CONSTRAINT CHK_Age CHECK ((`Age` between 15 and 30))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiant`
--

LOCK TABLES etudiant WRITE;
/*!40000 ALTER TABLE etudiant DISABLE KEYS */;
INSERT INTO etudiant VALUES (1,'alami','Sihame',17,'Tanger','0676792260'),(50,'Kaslani','Kassoul',28,'Tanger','065555555'),(51,'Kaslani','Kassoula',27,'Tanger','065555556'),(100,'Abbassi','Abbass',23,'Tanger','070000607'),(101,'Kaddouri','Kaddour',24,'Chefchaouen','077777700'),(102,'Jallouli','Jalloul',23,'Tétouan','066666660'),(103,'Ayyachi','Aicha',22,'Tétouan',NULL),(113,'Slaoui','Salwa',21,'Tanger','060000001'),(202,'Khaldouni','Khalid',22,'Tanger','060000002'),(309,'Karimi','Karim',20,'Casablanca','066600005'),(310,'Karimi','Karima',20,'Casablanca',NULL),(567,'Moussaoui','Moussa',21,'Tanger','050070070'),(580,'Moussi','Moussa',22,'Casablanca',NULL),(998,'Moujtahida','Moujidda',21,'Tanger',NULL),(999,'Moujtahid','Moujidd',21,'Tanger',NULL),(1001,'Hammadi','Hamada',26,'Casablanca','061111111'),(1002,'Tahiri','Tahir',25,'Tanger','066666600'),(1003,'Sallami','Salma',27,'Tanger',NULL),(1004,'Mimouni','Mimoun',24,'Casablanca',NULL);
/*!40000 ALTER TABLE etudiant ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livre`
--

DROP TABLE IF EXISTS livre;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE livre (
  NumLivre varchar(10) NOT NULL,
  Titre varchar(100) NOT NULL,
  NumAuteur varchar(10) NOT NULL,
  NumEditeur varchar(10) NOT NULL,
  NumTheme varchar(10) NOT NULL,
  DateEdition date DEFAULT NULL,
  PRIMARY KEY (NumLivre),
  KEY FK_Livre_Auteur (NumAuteur),
  KEY FK_Livre_Editeur (NumEditeur),
  CONSTRAINT FK_Livre_Auteur FOREIGN KEY (NumAuteur) REFERENCES auteur (NumAuteur) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_Livre_Editeur FOREIGN KEY (NumEditeur) REFERENCES editeur (NumEditeur) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livre`
--

LOCK TABLES livre WRITE;
/*!40000 ALTER TABLE livre DISABLE KEYS */;
INSERT INTO livre VALUES ('BD1','Comment avoir 20 en BD','R','NP','Info','2015-01-01'),('BD2','Tout sur les BD','N','NP','Info','2014-12-01'),('BD3','Maitriser les BD','R','NP','Info','2014-07-07'),('BD4','SGBD Relationnels','R','DAO','Info','2014-01-01'),('BD5','SI et BD','N','DAO','Info','2003-02-04'),('BD6','Les BD : Pour les nuls','R','NP','Info','2014-01-01'),('ECO1','L\'économie du Maroc en l\'an 3050','M','DAO','Eco','2015-04-01'),('Math1','Algèbre','H','NP','Math','2014-09-02'),('Math2','Analyse','H','NP','Math','2014-08-02'),('Math3','Algèbre linéaire','H','DAO','Math','2015-08-02'),('Math4','Aimer les Maths','M','NP','Math','2014-08-04'),('R11','Antigone','NumAuteurE','NumEditeur','NumTheme','2020-01-01'),('SE1','Systèmes d\'exploitation','R','NP','Info','2003-08-06'),('SE2','Maitriser UNIX','R','DAO','Info','2002-10-02'),('SE3','Tout sur les SE','N','NP','Info','2001-08-07'),('TW1','Histoire','T','PLB','Div',NULL),('TW2','Personnes fameuses','T','PLB','Div',NULL),('TW3','Comment devenir un bon joueur en 5 jours et sans coach','T','PLB','Div',NULL);
/*!40000 ALTER TABLE livre ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pret`
--

DROP TABLE IF EXISTS pret;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pret (
  NumEtudiant int NOT NULL,
  NumLivre varchar(10) NOT NULL,
  DatePret date NOT NULL,
  Rendu tinyint(1) DEFAULT '0',
  DateRetour date DEFAULT NULL,
  PRIMARY KEY (NumEtudiant,NumLivre,DatePret),
  UNIQUE KEY UQ_Pret_UniqueDate (NumLivre,DatePret),
  UNIQUE KEY UQ_NumLivre_Rendu_DateRetour (NumLivre,Rendu,DateRetour),
  CONSTRAINT FK_Pret_Etudiant FOREIGN KEY (NumEtudiant) REFERENCES etudiant (NumEtudiant),
  CONSTRAINT FK_Pret_Livre FOREIGN KEY (NumLivre) REFERENCES livre (NumLivre),
  CONSTRAINT CHK_Pret_DateRetour CHECK (((`DateRetour` is null) or ((`DateRetour` >= `DatePret`) and (0 <> `Rendu`))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pret`
--

LOCK TABLES pret WRITE;
/*!40000 ALTER TABLE pret DISABLE KEYS */;
INSERT INTO pret VALUES (50,'BD1','2024-05-01',0,NULL),(100,'BD1','2015-01-10',1,'2015-01-20'),(100,'BD2','2015-02-15',1,'2015-02-25'),(101,'BD2','2024-02-20',1,'2024-03-01'),(202,'BD3','2024-04-20',0,NULL),(102,'BD3','2015-02-15',1,'2015-02-25'),(202,'BD4','2015-01-10',1,'2015-01-20'),(202,'BD5','2015-02-15',1,'2015-02-25'),(102,'ECO1','2015-03-10',1,'2015-03-20'),(202,'ECO1','2015-04-15',1,'2015-04-25'),(51,'ECO1','2024-04-15',1,'2024-05-01'),(100,'Math1','2024-03-10',0,NULL),(100,'Math1','2015-03-10',1,'2015-03-20'),(102,'Math2','2015-04-15',1,'2015-04-25'),(103,'Math3','2015-01-10',1,'2015-01-20'),(202,'Math3','2015-03-10',1,'2015-03-20'),(103,'Math4','2015-02-15',1,'2015-02-25'),(1,'R11','2024-03-01',1,'2024-04-30'),(100,'SE1','2015-04-15',1,'2015-04-25'),(102,'SE1','2024-01-15',1,'2024-02-01'),(103,'SE2','2015-03-10',1,'2015-03-20'),(103,'SE3','2015-04-15',1,'2015-04-25'),(103,'TW1','2024-05-10',0,NULL),(102,'TW1','2015-01-10',1,'2015-01-20');
/*!40000 ALTER TABLE pret ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS theme;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE theme (
  NumTheme varchar(10) NOT NULL,
  IntituleTheme varchar(20) NOT NULL,
  PRIMARY KEY (NumTheme)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES theme WRITE;
/*!40000 ALTER TABLE theme DISABLE KEYS */;
INSERT INTO theme VALUES ('Div','Divers'),('Eco','Economie'),('Info','Informatique'),('Math','Mathématiques'),('T001','roman');
/*!40000 ALTER TABLE theme ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-18 13:19:33
