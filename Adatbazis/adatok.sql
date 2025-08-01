create database tabloadatok;
use tabloadatok;

-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: tabloadatok
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `diakok`
--

DROP TABLE IF EXISTS `diakok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diakok` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vnev` varchar(50) DEFAULT NULL,
  `knev` varchar(50) DEFAULT NULL,
  `mappa` varchar(30) DEFAULT NULL,
  `keppng` varchar(50) DEFAULT NULL,
  `kepjpg` varchar(50) DEFAULT NULL,
  `eng` tinyint(1) DEFAULT NULL,
  `van` tinyint(1) DEFAULT NULL,
  `torol` tinyint(1) DEFAULT NULL,
  `idobelyeg` timestamp NULL DEFAULT NULL,
  `tabid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tabid` (`tabid`),
  CONSTRAINT `diakok_ibfk_1` FOREIGN KEY (`tabid`) REFERENCES `tablok` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diakok`
--

LOCK TABLES `diakok` WRITE;
/*!40000 ALTER TABLE `diakok` DISABLE KEYS */;
INSERT INTO `diakok` VALUES (1,'Amatics','Teréz','kepek/diakok/196419682/','Amatics_Teréz.png','Amatics_Teréz.jpg',1,1,0,'2023-03-07 11:04:00',196419682),(2,'Csekli','Ilona','kepek/diakok/196419682/','Csekli_Ilona.png','Csekli_Ilona.jpg',1,1,0,'2023-03-07 11:04:50',196419682),(3,'Csillag','László','kepek/diakok/196419682/','Csillag_László.png','Csillag_László.jpg',1,1,0,'2023-03-07 11:05:09',196419682),(4,'Dröszler','Mária','kepek/diakok/196419682/','Dröszler_Mária.png','Dröszler_Mária.jpg',1,1,0,'2023-03-07 11:05:29',196419682),(5,'Gerencsér','Ildikó','kepek/diakok/196419682/','Gerencsér_Ildikó.png','Gerencsér_Ildikó.jpg',1,1,0,'2023-03-07 11:05:46',196419682),(6,'Gerse','Lajos','kepek/diakok/196419682/','Gerse_Lajos.png','Gerse_Lajos.jpg',1,1,0,'2023-03-07 11:06:04',196419682),(7,'Gyűrűs','Anna','kepek/diakok/196419682/','Gyűrűs_Anna.png','Gyűrűs_Anna.jpg',1,1,0,'2023-03-07 11:11:54',196419682),(8,'Halwachs','Katalin','kepek/diakok/196419682/','Halwachs_Katalin.png','Halwachs_Katalin.jpg',1,1,0,'2023-03-13 15:58:13',196419682),(9,'Harangozó','Borbála','kepek/diakok/196419682/','Harangozó_Borbála.png','Harangozó_Borbála.jpg',1,1,0,'2023-03-07 11:12:53',196419682),(10,'Havlik','Teréz','kepek/diakok/196419682/','Havlik_Teréz.png','Havlik_Teréz.jpg',1,1,0,'2023-03-07 11:13:10',196419682),(11,'Hets','Ilona','kepek/diakok/196419682/','Hets_Ilona.png','Hets_Ilona.jpg',1,1,0,'2023-03-07 11:13:50',196419682),(12,'Horváth','László','kepek/diakok/196419682/','Horváth_László.png','Horváth_László.jpg',1,1,0,'2023-03-07 11:14:12',196419682),(13,'Horváth','Zoltán','kepek/diakok/196419682/','Horváth_Zoltán.png','Horváth_Zoltán.jpg',1,1,0,'2023-03-07 11:17:29',196419682),(14,'Horváth','Zsuzsa','kepek/diakok/196419682/','Horváth_Zsuzsa.png','Horváth_Zsuzsa.jpg',1,1,0,'2023-03-07 11:17:59',196419682),(15,'Kelemen','Margit','kepek/diakok/196419682/','Kelemen_Margit.png','Kelemen_Margit.jpg',1,1,0,'2023-03-07 11:18:23',196419682),(16,'Kéthelyi','Imre','kepek/diakok/196419682/','Kéthelyi_Imre.png','Kéthelyi_Imre.jpg',1,1,0,'2023-03-07 11:18:47',196419682),(17,'Kocsis','Mária','kepek/diakok/196419682/','Kocsis_Mária.png','Kocsis_Mária.jpg',1,1,0,'2023-03-13 15:59:49',196419682),(18,'Kovács','József','kepek/diakok/196419682/','Kovács_József.png','Kovács_József.jpg',1,1,0,'2023-03-07 11:20:22',196419682),(19,'Kuglics','Mária','kepek/diakok/196419682/','Kuglics_Mária.png','Kuglics_Mária.jpg',1,1,0,'2023-03-07 11:20:52',196419682),(20,'Németh','Anna Mária','kepek/diakok/196419682/','Németh_Anna_Mária.png','Németh_Anna_Mária.jpg',1,1,0,'2023-03-13 16:00:37',196419682),(21,'Pék','Éva','kepek/diakok/196419682/','Pék_Éva.png','Pék_Éva.jpg',1,1,0,'2023-03-07 11:21:34',196419682),(22,'Pongrác','Antónia','kepek/diakok/196419682/','Pongrác_Antónia.png','Pongrác_Antónia.jpg',1,1,0,'2023-03-07 11:22:15',196419682),(23,'Rátkai','Vince','kepek/diakok/196419682/','Rátkai_Vince.png','Rátkai_Vince.jpg',1,1,0,'2023-03-07 11:22:44',196419682),(24,'Ruzsa','Erzsébet','kepek/diakok/196419682/','Ruzsa_Erzsébet.png','Ruzsa_Erzsébet.jpg',1,1,0,'2023-03-07 11:23:25',196419682),(25,'Schmalczer','Zsuzsanna','kepek/diakok/196419682/','Schmalczer_Zsuzsanna.png','Schmalczer_Zsuzsanna.jpg',1,1,0,'2023-03-07 11:24:04',196419682),(26,'Simon','Éva','kepek/diakok/196419682/','Simon_Éva.png','Simon_Éva.jpg',1,1,0,'2023-03-07 11:24:37',196419682),(27,'Sipos','Ilona','kepek/diakok/196419682/','Sipos_Ilona.png','Sipos_Ilona.jpg',1,1,0,'2023-03-07 11:24:57',196419682),(28,'Sipos','Piroska','kepek/diakok/196419682/','Sipos_Piroska.png','Sipos_Piroska.jpg',1,1,0,'2023-03-07 11:25:30',196419682),(29,'Szabados','Olga','kepek/diakok/196419682/','Szabados_Olga.png','Szabados_Olga.jpg',1,1,0,'2023-03-07 11:25:54',196419682),(30,'Szabó','Katalin','kepek/diakok/196419682/','Szabó_Katalin.png','Szabó_Katalin.jpg',1,1,0,'2023-03-07 11:26:15',196419682),(31,'Szakály','Mária','kepek/diakok/196419682/','Szakály_Mária.png','Szakály_Mária.jpg',1,1,0,'2023-03-07 11:26:40',196419682),(32,'Szakasics','Julianna','kepek/diakok/196419682/','Szakasics_Julianna.png','Szakasics_Julianna.jpg',1,1,0,'2023-03-07 11:27:54',196419682),(33,'Ujhegyi','Ildikó','kepek/diakok/196419682/','Ujhegyi_Ildikó.png','Ujhegyi_Ildikó.jpg',1,1,0,'2023-03-07 11:28:37',196419682),(34,'Varga','Gizella','kepek/diakok/196419682/','Varga_Gizella.png','Varga_Gizella.jpg',1,1,0,'2023-03-07 11:28:58',196419682),(35,'Varga','Irma','kepek/diakok/196419682/','Varga_Irma.png','Varga_Irma.jpg',1,1,0,'2023-03-07 11:29:14',196419682),(36,'Veres','Magdolna','kepek/diakok/196419682/','Veres_Magdolna.png','Veres_Magdolna.jpg',1,1,0,'2023-03-07 11:29:37',196419682),(37,'Vodenicsár','Judit','kepek/diakok/196419682/','Vodenicsár_Judit.png','Vodenicsár_Judit.jpg',1,1,0,'2023-03-07 11:30:03',196419682),(38,'Zsoldos','Piroska','kepek/diakok/196419682/','Zsoldos_Piroska.png','Zsoldos_Piroska.jpg',1,1,0,'2023-03-07 11:30:28',196419682),(39,'Angler','Ildikó','kepek/diakok/197019721/','Angler_Ildikó.png','Angler_Ildikó.jpg',1,1,0,'2023-03-08 06:16:00',197019721),(40,'Baldauf','Mária','kepek/diakok/197019721/','Baldauf_Mária.png','Baldauf_Mária.jpg',1,1,0,'2023-03-08 06:16:31',197019721),(41,'Balogh','Márta','kepek/diakok/197019721/','Balogh_Márta.png','Balogh_Márta.jpg',1,1,0,'2023-03-08 06:16:56',197019721),(42,'Bodorics','Ilona','kepek/diakok/197019721/','Bodorics_Ilona.png','Bodorics_Ilona.jpg',1,1,0,'2023-03-08 06:17:18',197019721),(43,'Bognár','Éva','kepek/diakok/197019721/','Bognár_Éva.png','Bognár_Éva.jpg',1,1,0,'2023-03-08 06:17:43',197019721),(44,'Cvitkovics','Katalin','kepek/diakok/197019721/','Cvitkovics_Katalin.png','Cvitkovics_Katalin.jpg',1,1,0,'2023-03-13 16:07:25',197019721),(45,'Csikós','Margit','kepek/diakok/197019721/','Csikós_Margit.png','Csikós_Margit.jpg',1,1,0,'2023-03-08 06:18:39',197019721),(46,'Dávid','Mária','kepek/diakok/197019721/','Dávid_Mária.png','Dávid_Mária.jpg',1,1,0,'2023-03-08 06:19:47',197019721),(47,'Domiter','Erzsébet','kepek/diakok/197019721/','Domiter_Erzsébet.png','Domiter_Erzsébet.jpg',1,1,0,'2023-03-08 06:20:09',197019721),(50,'Donácz','Matild','kepek/diakok/197019721/','Donácz_Matild.png','Donácz_Matild.jpg',1,1,0,'2023-03-08 06:22:51',197019721),(51,'Gránitz','Éva','kepek/diakok/197019721/','Gránitz_Éva.png','Gránitz_Éva.jpg',1,1,0,'2023-03-08 06:23:21',197019721),(52,'Herczeg','Anna','kepek/diakok/197019721/','Herczeg_Anna.png','Herczeg_Anna.jpg',1,1,0,'2023-03-08 06:23:46',197019721),(53,'Horváth','Mária','kepek/diakok/197019721/','Horváth_Mária.png','Horváth_Mária.jpg',1,1,0,'2023-03-08 06:24:07',197019721),(54,'Horváth','Zsuzsanna','kepek/diakok/197019721/','Horváth_Zsuzsanna.png','Horváth_Zsuzsanna.jpg',1,1,0,'2023-03-08 06:24:39',197019721),(55,'Huber','Valéria','kepek/diakok/197019721/','Huber_Valéria.png','Huber_Valéria.jpg',1,1,0,'2023-03-08 06:26:08',197019721),(56,'Kajcsos','Anna','kepek/diakok/197019721/','Kajcsos_Anna.png','Kajcsos_Anna.jpg',1,1,0,'2023-03-08 06:26:26',197019721),(57,'Lőrincz','Erzsébet','kepek/diakok/197019721/','Lőrincz_Erzsébet.png','Lőrincz_Erzsébet.jpg',1,1,0,'2023-03-08 06:26:51',197019721),(58,'Molnár','Katalin','kepek/diakok/197019721/','Molnár_Katalin.png','Molnár_Katalin.jpg',1,1,0,'2023-03-08 06:27:08',197019721),(59,'Nagy','Gizella','kepek/diakok/197019721/','Nagy_Gizella.png','Nagy_Gizella.jpg',1,1,0,'2023-03-08 06:27:32',197019721),(60,'Nagy','Magdolna','kepek/diakok/197019721/','Nagy_Magdolna.png','Nagy_Magdolna.jpg',1,1,0,'2023-03-08 06:27:50',197019721),(61,'Nándorfalvi','Klára','kepek/diakok/197019721/','Nándorfalvi_Klára.png','Nándorfalvi_Klára.jpg',1,1,0,'2023-03-13 16:09:38',197019721),(62,'Németh','Mária','kepek/diakok/197019721/','Németh_Mária.png','Németh_Mária.jpg',1,1,0,'2023-03-08 06:29:04',197019721),(63,'Simony','Ibolya','kepek/diakok/197019721/','Simony_Ibolya.png','Simony_Ibolya.jpg',1,1,0,'2023-03-08 06:29:32',197019721),(64,'Somogyi','Judit','kepek/diakok/197019721/','Somogyi_Judit.png','Somogyi_Judit.jpg',1,1,0,'2023-03-08 06:30:00',197019721),(65,'Sövegjártó','Mária','kepek/diakok/197019721/','Sövegjártó_Mária.png','Sövegjártó_Mária.jpg',1,1,0,'2023-03-08 06:30:45',197019721),(66,'Szabó','Ágnes','kepek/diakok/197019721/','Szabó_Ágnes.png','Szabó_Ágnes.jpg',1,1,0,'2023-03-08 06:31:03',197019721),(67,'Szabó','Emerencia','kepek/diakok/197019721/','Szabó_Emerencia.png','Szabó_Emerencia.jpg',1,1,0,'2023-03-08 06:31:31',197019721),(68,'Szakács','Katalin','kepek/diakok/197019721/','Szakács_Katalin.png','Szakács_Katalin.jpg',1,1,0,'2023-03-08 06:31:51',197019721),(69,'Takács','Jolán','kepek/diakok/197019721/','Takács_Jolán.png','Takács_Jolán.jpg',1,1,0,'2023-03-08 06:32:05',197019721),(70,'Tamaska','Jolán','kepek/diakok/197019721/','Tamaska_Jolán.png','Tamaska_Jolán.jpg',1,1,0,'2023-03-08 06:32:20',197019721),(71,'Baumann','Anna','kepek/diakok/197019744/','Baumann_Anna.png','Baumann_Anna.jpg',1,1,0,'2023-03-08 09:40:00',197019744),(72,'Baumgartner','Zsuzsanna','kepek/diakok/197019744/','Baumgartner_Zsuzsanna.png','Baumgartner_Zsuzsanna.jpg',1,1,0,'2023-03-08 09:40:37',197019744),(73,'Bedics','Mária','kepek/diakok/197019744/','Bedics_Mária.png','Bedics_Mária.jpg',1,1,0,'2023-03-08 09:41:06',197019744),(74,'Czenki','Zsuzsanna','kepek/diakok/197019744/','Czenki_Zsuzsanna.png','Czenki_Zsuzsanna.jpg',1,1,0,'2023-03-08 09:41:33',197019744),(75,'Drimmer','Zsuzsa','kepek/diakok/197019744/','Drimmer_Zsuzsa.png','Drimmer_Zsuzsa.jpg',1,1,0,'2023-03-08 09:41:49',197019744),(76,'Feltzner','Attila','kepek/diakok/197019744/','Feltzner_Attila.png','Feltzner_Attila.jpg',1,1,0,'2023-03-08 09:42:42',197019744),(77,'Friedl','Éva','kepek/diakok/197019744/','Friedl_Éva.png','Friedl_Éva.jpg',1,1,0,'2023-04-14 18:58:17',197019744),(78,'Fülöp','Vilmos','kepek/diakok/197019744/','Fülöp_Vilmos.png','Fülöp_Vilmos.jpg',1,1,0,'2023-03-08 09:43:43',197019744),(79,'Geröly','Anna','kepek/diakok/197019744/','Geröly_Anna.png','Geröly_Anna.jpg',1,1,0,'2023-03-08 09:44:09',197019744),(80,'Hajszán','Ágnes','kepek/diakok/197019744/','Hajszán_Ágnes.png','Hajszán_Ágnes.jpg',1,1,0,'2023-03-08 09:44:41',197019744),(81,'Horváth','Judit','kepek/diakok/197019744/','Horváth_Judit.png','Horváth_Judit.jpg',1,1,0,'2023-03-08 09:45:11',197019744),(82,'Horváth','Katalin','kepek/diakok/197019744/','Horváth_Katalin.png','Horváth_Katalin.jpg',1,1,0,'2023-03-08 09:45:32',197019744),(83,'Jánosi','Etelka','kepek/diakok/197019744/','Jánosi_Etelka.png','Jánosi_Etelka.jpg',1,1,0,'2023-03-08 09:46:09',197019744),(84,'Juanics','Györgyi','kepek/diakok/197019744/','Juanics_Györgyi.png','Juanics_Györgyi.jpg',1,1,0,'2023-03-08 09:46:34',197019744),(85,'Kiss','Ágnes Erika','kepek/diakok/197019744/','Kiss_Ágnes_Erika.png','Kiss_Ágnes_Erika.jpg',1,1,0,'2023-03-09 13:54:58',197019744),(86,'Kiss','Éva','kepek/diakok/197019744/','Kiss_Éva.png','Kiss_Éva.jpg',1,1,0,'2023-03-08 09:47:57',197019744),(87,'Koller','Mária','kepek/diakok/197019744/','Koller_Mária.png','Koller_Mária.jpg',1,1,0,'2023-03-08 09:48:17',197019744),(88,'Koperecz','Éva','kepek/diakok/197019744/','Koperecz_Éva.png','Koperecz_Éva.jpg',1,1,0,'2023-03-08 09:48:40',197019744),(89,'Kőhalmi','Éva','kepek/diakok/197019744/','Kőhalmi_Éva.png','Kőhalmi_Éva.jpg',1,1,0,'2023-03-08 09:49:11',197019744),(90,'Magyar','Erika','kepek/diakok/197019744/','Magyar_Erika.png','Magyar_Erika.jpg',1,1,0,'2023-03-08 09:49:28',197019744),(91,'Marisits','Ilona','kepek/diakok/197019744/','Marisits_Ilona.png','Marisits_Ilona.jpg',1,1,0,'2023-03-08 09:49:52',197019744),(92,'Mazzag','Lívia','kepek/diakok/197019744/','Mazzag_Lívia.png','Mazzag_Lívia.jpg',1,1,0,'2023-03-08 09:50:37',197019744),(93,'Mihók','Teréz','kepek/diakok/197019744/','Mihók_Teréz.png','Mihók_Teréz.jpg',1,1,0,'2023-03-08 09:51:00',197019744),(94,'Nádasy','Éva','kepek/diakok/197019744/','Nádasy_Éva.png','Nádasy_Éva.jpg',1,1,0,'2023-03-08 09:51:16',197019744),(95,'Németh','Emma','kepek/diakok/197019744/','Németh_Emma.png','Németh_Emma.jpg',1,1,0,'2023-03-08 09:51:38',197019744),(96,'Németh','Erzsébet','kepek/diakok/197019744/','Németh_Erzsébet.png','Németh_Erzsébet.jpg',1,1,0,'2023-03-08 09:51:56',197019744),(97,'Németh','Katalin','kepek/diakok/197019744/','Németh_Katalin.png','Németh_Katalin.jpg',1,1,0,'2023-03-08 09:52:22',197019744),(98,'Palik','Erzsébet','kepek/diakok/197019744/','Palik_Erzsébet.png','Palik_Erzsébet.jpg',1,1,0,'2023-03-08 09:52:39',197019744),(99,'Pálos','Zsuzsa','kepek/diakok/197019744/','Pálos_Zsuzsa.png','Pálos_Zsuzsa.jpg',1,1,0,'2023-03-08 09:52:56',197019744),(100,'Pintér','László','kepek/diakok/197019744/','Pintér_László.png','Pintér_László.jpg',1,1,0,'2023-03-08 09:53:16',197019744),(101,'Poór','Veronika','kepek/diakok/197019744/','Poór_Veronika.png','Poór_Veronika.jpg',1,1,0,'2023-03-08 09:53:46',197019744),(102,'Szabó','Anna','kepek/diakok/197019744/','Szabó_Anna.png','Szabó_Anna.jpg',1,1,0,'2023-03-08 09:54:00',197019744),(103,'Szakács','Annamária','kepek/diakok/197019744/','Szakács_Annamária.png','Szakács_Annamária.jpg',1,1,0,'2023-03-13 16:15:59',197019744),(104,'Szakály','Éva','kepek/diakok/197019744/','Szakály_Éva.png','Szakály_Éva.jpg',1,1,0,'2023-03-08 09:54:44',197019744),(105,'Szekeres','Katalin','kepek/diakok/197019744/','Szekeres_Katalin.png','Szekeres_Katalin.jpg',1,1,0,'2023-03-08 09:55:04',197019744),(106,'Taletovits','Klára','kepek/diakok/197019744/','Taletovits_Klára.png','Taletovits_Klára.jpg',1,1,0,'2023-03-08 09:55:31',197019744),(107,'Tarlacz','Erzsébet','kepek/diakok/197019744/','Tarlacz_Erzsébet.png','Tarlacz_Erzsébet.jpg',1,1,0,'2023-03-08 09:55:54',197019744),(108,'Vörös','Judit','kepek/diakok/197019744/','Vörös_Judit.png','Vörös_Judit.jpg',1,1,0,'2023-03-08 09:56:12',197019744),(109,'Balázs','Bianka','kepek/diakok/201420181/','Balázs_Bianka.png','Balázs_Bianka.jpg',1,1,0,'2023-03-08 11:08:49',201420181),(110,'Baráth','Ferenc','kepek/diakok/201420181/','Baráth_Ferenc.png','Baráth_Ferenc.jpg',1,1,0,'2023-03-08 11:09:11',201420181),(111,'Bognár','Kíra Eszter','kepek/diakok/201420181/','Bognár_Kíra_Eszter.png','Bognár_Kíra_Eszter.jpg',1,1,0,'2023-03-13 16:17:07',201420181),(112,'Czöndör','Dániel Miklós','kepek/diakok/201420181/','Czöndör_Dániel_Miklós.png','Czöndör_Dániel_Miklós.jpg',1,1,0,'2023-03-13 16:17:37',201420181),(113,'Ecker','Ninett','kepek/diakok/201420181/','Ecker_Ninett.png','Ecker_Ninett.jpg',1,1,0,'2023-03-08 11:10:06',201420181),(114,'Farkas','Jázmin','kepek/diakok/201420181/','Farkas_Jázmin.png','Farkas_Jázmin.jpg',1,1,0,'2023-03-08 11:10:21',201420181),(115,'Fendrik','Dávid','kepek/diakok/201420181/','Fendrik_Dávid.png','Fendrik_Dávid.jpg',1,1,0,'2023-03-08 11:10:47',201420181),(116,'Géczi','Klaudia','kepek/diakok/201420181/','Géczi_Klaudia.png','Géczi_Klaudia.jpg',1,1,0,'2023-03-13 16:22:08',201420181),(117,'Horváth','Zsófi','kepek/diakok/201420181/','Horváth_Zsófi.png','Horváth_Zsófi.jpg',1,1,0,'2023-03-08 11:11:36',201420181),(118,'Kiss','Boglárka','kepek/diakok/201420181/','Kiss_Boglárka.png','Kiss_Boglárka.jpg',1,1,0,'2023-03-08 11:11:54',201420181),(119,'Kóczán','Martina','kepek/diakok/201420181/','Kóczán_Martina.png','Kóczán_Martina.jpg',1,1,0,'2023-03-08 11:12:15',201420181),(120,'Kossuth','Virág','kepek/diakok/201420181/','Kossuth_Virág.png','Kossuth_Virág.jpg',1,1,0,'2023-03-08 11:12:36',201420181),(121,'Krémer','Vivien Edit','kepek/diakok/201420181/','Krémer_Vivien_Edit.png','Krémer_Vivien_Edit.jpg',1,1,0,'2023-03-13 16:22:53',201420181),(122,'Mukics','Erzsébet Éva','kepek/diakok/201420181/','Mukics_Erzsébet_Éva.png','Mukics_Erzsébet_Éva.jpg',1,1,0,'2023-03-13 16:23:13',201420181),(123,'Németh','Dániel Zsolt','kepek/diakok/201420181/','Németh_Dániel_Zsolt.png','Németh_Dániel_Zsolt.jpg',1,1,0,'2023-03-13 16:23:43',201420181),(124,'Porga','Stella','kepek/diakok/201420181/','Porga_Stella.png','Porga_Stella.jpg',1,1,0,'2023-03-08 11:14:40',201420181),(125,'Pörge','Daniella','kepek/diakok/201420181/','Pörge_Daniella.png','Pörge_Daniella.jpg',1,1,0,'2023-03-08 11:15:07',201420181),(126,'Rammer','Gergely','kepek/diakok/201420181/','Rammer_Gergely.png','Rammer_Gergely.jpg',1,1,0,'2023-03-08 11:15:26',201420181),(127,'Szabó','Eszter','kepek/diakok/201420181/','Szabó_Eszter.png','Szabó_Eszter.jpg',1,1,0,'2023-03-08 11:15:47',201420181),(128,'Sztaracsek','Bátor Ábel','kepek/diakok/201420181/','Sztaracsek_Bátor_Ábel.png','Sztaracsek_Bátor_Ábel.jpg',1,1,0,'2023-03-13 16:24:38',201420181),(129,'Taletovits','Martin','kepek/diakok/201420181/','Taletovits_Martin.png','Taletovits_Martin.jpg',1,1,0,'2023-03-08 11:16:43',201420181),(130,'Tóth','Bence','kepek/diakok/201420181/','Tóth_Bence.png','Tóth_Bence.jpg',1,1,0,'2023-03-13 16:25:04',201420181),(131,'Tóth','Sára','kepek/diakok/201420181/','Tóth_Sára.png','Tóth_Sára.jpg',1,1,0,'2023-03-08 11:17:27',201420181),(132,'Várallai','Kitti','kepek/diakok/201420181/','Várallai_Kitti.png','Várallai_Kitti.jpg',1,1,0,'2023-03-08 11:17:41',201420181),(133,'Wéber','Stefánia Mária','kepek/diakok/201420181/','Wéber_Stefánia_Mária.png','Wéber_Stefánia_Mária.jpg',1,1,0,'2023-03-13 16:25:29',201420181),(134,'Zelkó','Alex','kepek/diakok/201420181/','Zelkó_Alex.png','Zelkó_Alex.jpg',1,1,0,'2023-03-08 11:20:21',201420181),(135,'Zergi','Dániel','kepek/diakok/201420181/','Zergi_Dániel.png','Zergi_Dániel.jpg',1,1,0,'2023-03-13 16:26:01',201420181);
/*!40000 ALTER TABLE `diakok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `felhasznalok`
--

DROP TABLE IF EXISTS `felhasznalok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `felhasznalok` (
  `fnev` varchar(10) NOT NULL,
  `jelszo` varchar(40) NOT NULL,
  PRIMARY KEY (`fnev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `felhasznalok`
--

LOCK TABLES `felhasznalok` WRITE;
/*!40000 ALTER TABLE `felhasznalok` DISABLE KEYS */;
INSERT INTO `felhasznalok` VALUES ('a','356a192b7913b04c54574d18c28d46e6395428ab');
/*!40000 ALTER TABLE `felhasznalok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablok`
--

DROP TABLE IF EXISTS `tablok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablok` (
  `id` int NOT NULL,
  `kezdet` smallint DEFAULT NULL,
  `veg` smallint DEFAULT NULL,
  `osztaly` tinyint DEFAULT NULL,
  `helye` tinyint DEFAULT NULL,
  `keppng` varchar(50) DEFAULT NULL,
  `kepjpg` varchar(50) DEFAULT NULL,
  `eng` tinyint(1) DEFAULT NULL,
  `van` tinyint(1) DEFAULT NULL,
  `torol` tinyint(1) DEFAULT NULL,
  `idobelyeg` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablok`
--

LOCK TABLES `tablok` WRITE;
/*!40000 ALTER TABLE `tablok` DISABLE KEYS */;
INSERT INTO `tablok` VALUES (196419682,1964,1968,2,50,'kepek/tablok/196419682.png','kepek/tablok/196419682.jpg',1,1,0,'2023-03-07 10:59:14'),(197019721,1970,1972,1,50,'kepek/tablok/197019721.png','kepek/tablok/197019721.jpg',1,1,0,'2023-03-08 06:14:34'),(197019744,1970,1974,4,50,'kepek/tablok/197019744.png','kepek/tablok/197019744.jpg',1,1,0,'2023-03-08 09:38:34'),(201420181,2014,2018,1,23,'kepek/tablok/201420181.png','kepek/tablok/201420181.jpg',1,1,0,'2023-03-08 11:07:50');
/*!40000 ALTER TABLE `tablok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tanarkepek`
--

DROP TABLE IF EXISTS `tanarkepek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tanarkepek` (
  `id` int NOT NULL AUTO_INCREMENT,
  `beosztas` varchar(30) DEFAULT NULL,
  `mappa` varchar(35) DEFAULT NULL,
  `keppng` varchar(50) DEFAULT NULL,
  `kepjpg` varchar(50) DEFAULT NULL,
  `eng` tinyint(1) DEFAULT NULL,
  `van` tinyint(1) DEFAULT NULL,
  `torol` tinyint(1) DEFAULT NULL,
  `idobelyeg` timestamp NULL DEFAULT NULL,
  `tanarid` int DEFAULT NULL,
  `tabid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tanarid` (`tanarid`),
  KEY `tabid` (`tabid`),
  CONSTRAINT `tanarkepek_ibfk_1` FOREIGN KEY (`tanarid`) REFERENCES `tanarok` (`id`),
  CONSTRAINT `tanarkepek_ibfk_2` FOREIGN KEY (`tabid`) REFERENCES `tablok` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tanarkepek`
--

LOCK TABLES `tanarkepek` WRITE;
/*!40000 ALTER TABLE `tanarkepek` DISABLE KEYS */;
INSERT INTO `tanarkepek` VALUES (1,'tanár​','kepek/tanarok/196419682/','Cserjési_Károlyné.png','Cserjési_Károlyné.jpg',1,1,0,'2023-03-07 17:59:52',1,196419682),(2,'osztályfőnök','kepek/tanarok/196419682/','dr_Kamarás_Béla.png','dr_Kamarás_Béla.jpg',1,1,0,'2023-03-09 15:38:21',2,196419682),(3,'tanár​','kepek/tanarok/196419682/','Ember_Tivadar.png','Ember_Tivadar.jpg',1,1,0,'2023-03-07 18:08:02',3,196419682),(4,'tanár​','kepek/tanarok/196419682/','Farkas_Gellértné.png','Farkas_Gellértné.jpg',1,1,0,'2023-03-07 18:08:46',4,196419682),(5,'tanár​','kepek/tanarok/196419682/','Kiss_Gyuláné.png','Kiss_Gyuláné.jpg',1,1,0,'2023-03-07 18:10:11',5,196419682),(6,'tanár​','kepek/tanarok/196419682/','Kovács_Ferenc.png','Kovács_Ferenc.jpg',1,1,0,'2023-03-07 18:10:38',6,196419682),(7,'tanár​','kepek/tanarok/196419682/','Palánk_István.png','Palánk_István.jpg',1,1,0,'2023-03-07 18:11:01',7,196419682),(8,'tanár​','kepek/tanarok/196419682/','Palánk_Istvánné.png','Palánk_Istvánné.jpg',1,1,0,'2023-03-07 18:11:28',8,196419682),(9,'tanár​','kepek/tanarok/196419682/','Pünkösthy_Botond.png','Pünkösthy_Botond.jpg',1,1,0,'2023-03-13 16:35:36',9,196419682),(10,'tanár​','kepek/tanarok/196419682/','Reichard_Imre.png','Reichard_Imre.jpg',1,1,0,'2023-03-07 18:12:26',10,196419682),(11,'tanár​','kepek/tanarok/196419682/','Tauber_László.png','Tauber_László.jpg',1,1,0,'2023-03-07 18:12:48',11,196419682),(12,'igazgató','kepek/tanarok/196419682/','Ujlaky_Gyula.png','Ujlaky_Gyula.jpg',1,1,0,'2023-03-07 18:13:12',12,196419682),(13,'tanár​','kepek/tanarok/197019721/','Czeczeli_Józsefné.png','Czeczeli_Józsefné.jpg',1,1,0,'2023-03-08 08:03:50',13,197019721),(14,'igazgató','kepek/tanarok/197019721/','Dr_Lábdy_Lajos.png','Dr_Lábdy_Lajos.jpg',1,1,0,'2023-03-09 15:38:54',14,197019721),(15,'tanár​','kepek/tanarok/197019721/','Mészáros_Erzsébet.png','Mészáros_Erzsébet.jpg',1,1,0,'2023-03-08 08:06:14',15,197019721),(16,'osztályfőnök','kepek/tanarok/197019721/','Szabó_Erzsébet.png','Szabó_Erzsébet.jpg',1,1,0,'2023-03-08 08:06:49',16,197019721),(17,'tanár​','kepek/tanarok/197019744/','Cserjési_Károly.png','Cserjési_Károly.jpg',1,1,0,'2023-03-08 10:00:44',17,197019744),(18,'tanár​','kepek/tanarok/197019744/','Csuti_Sándorné.png','Csuti_Sándorné.jpg',1,1,0,'2023-03-08 10:18:43',18,197019744),(19,'tanár​','kepek/tanarok/197019744/','Dr_Fodor_Henrik.png','Dr_Fodor_Henrik.jpg',1,1,0,'2023-03-09 15:38:35',19,197019744),(20,'tanár​','kepek/tanarok/197019744/','Dr_Reichardt_Imre.png','Dr_Reichardt_Imre.jpg',1,1,0,'2023-03-09 15:38:44',20,197019744),(21,'tanár​','kepek/tanarok/197019744/','Gyuk_Mihály.png','Gyuk_Mihály.jpg',1,1,0,'2023-03-08 10:20:35',21,197019744),(22,'igazgató','kepek/tanarok/197019744/','Horváth_József.png','Horváth_József.jpg',1,1,0,'2023-03-08 10:21:07',22,197019744),(23,'tanár​','kepek/tanarok/197019744/','Horváth_Zsuzsa.png','Horváth_Zsuzsa.jpg',1,1,0,'2023-03-08 10:25:35',23,197019744),(24,'osztályfőnök','kepek/tanarok/197019744/','Kiss_Gyuláné.png','Kiss_Gyuláné.jpg',1,1,0,'2023-03-08 10:32:36',5,197019744),(25,'tanár​','kepek/tanarok/197019744/','Márkus_Mária.png','Márkus_Mária.jpg',1,1,0,'2023-03-08 10:29:34',24,197019744),(26,'tanár​','kepek/tanarok/197019744/','Palánk_István.png','Palánk_István.jpg',1,1,0,'2023-03-08 10:30:02',7,197019744),(27,'tanár​','kepek/tanarok/197019744/','Pünkösthy_Botond.png','Pünkösthy_Botond.jpg',1,1,0,'2023-03-13 16:35:36',9,197019744),(28,'igazgatóhelyettes','kepek/tanarok/197019744/','Tauber_László.png','Tauber_László.jpg',1,1,0,'2023-03-08 10:31:04',11,197019744),(29,'tanár​','kepek/tanarok/197019744/','Vincze_Anna.png','Vincze_Anna.jpg',1,1,0,'2023-03-08 10:31:33',25,197019744),(30,'tanár​','kepek/tanarok/201420181/','Varga_Kató_Anikó.png','Varga_Kató_Anikó.jpg',1,1,0,'2023-03-09 15:40:54',53,201420181),(31,'tanár​','kepek/tanarok/201420181/','Barkovits_Ágnes.png','Barkovits_Ágnes.jpg',1,1,0,'2023-03-09 05:41:08',26,201420181),(32,'tanár​','kepek/tanarok/201420181/','Bedécs_Anikó.png','Bedécs_Anikó.jpg',1,1,0,'2023-03-09 05:41:36',27,201420181),(33,'tanár​','kepek/tanarok/201420181/','Bodáné_Szendrő_Mónika.png','Bodáné_Szendrő_Mónika.jpg',1,1,0,'2023-03-09 15:39:05',28,201420181),(34,'tanár​','kepek/tanarok/201420181/','Dériné_Horváth_Judit.png','Dériné_Horváth_Judit.jpg',1,1,0,'2023-03-09 15:39:14',29,201420181),(35,'tanár​','kepek/tanarok/201420181/','Döbrösy_Ildikó.png','Döbrösy_Ildikó.jpg',1,1,0,'2023-03-09 05:45:15',30,201420181),(36,'tanár​','kepek/tanarok/201420181/','Elek_Rita.png','Elek_Rita.jpg',1,1,0,'2023-03-09 05:45:38',31,201420181),(37,'tanár​','kepek/tanarok/201420181/','Fancsali_András.png','Fancsali_András.jpg',1,1,0,'2023-03-09 05:45:56',32,201420181),(38,'tanár​','kepek/tanarok/201420181/','Glavanics_Krisztina.png','Glavanics_Krisztina.jpg',1,1,0,'2023-03-09 05:46:22',33,201420181),(39,'tanár​','kepek/tanarok/201420181/','Hargitai_Eszter.png','Hargitai_Eszter.jpg',1,1,0,'2023-03-09 05:46:46',34,201420181),(40,'tanár​','kepek/tanarok/201420181/','Házi_Gábor.png','Házi_Gábor.jpg',1,1,0,'2023-03-09 05:47:14',35,201420181),(41,'tanár​','kepek/tanarok/201420181/','Horváth_Judit.png','Horváth_Judit.jpg',1,1,0,'2023-03-09 05:47:41',36,201420181),(42,'tanár​','kepek/tanarok/201420181/','Horváth_Klaudia.png','Horváth_Klaudia.jpg',1,1,0,'2023-03-09 05:48:09',37,201420181),(43,'tanár​','kepek/tanarok/201420181/','Horváth_Noémi.png','Horváth_Noémi.jpg',1,1,0,'2023-03-09 05:48:29',38,201420181),(44,'tanár​','kepek/tanarok/201420181/','Kissné_Süle_Henriett.png','Kissné_Süle_Henriett.jpg',1,1,0,'2023-03-09 15:39:27',39,201420181),(45,'tanár​','kepek/tanarok/201420181/','Kónya_Nóra.png','Kónya_Nóra.jpg',1,1,0,'2023-03-09 05:49:12',40,201420181),(46,'tanár​','kepek/tanarok/201420181/','Kovács_Babos_Éva.png','Kovács_Babos_Éva.jpg',1,1,0,'2023-03-09 15:39:39',41,201420181),(47,'tanár​','kepek/tanarok/201420181/','Kovácsné_Ozsvárth_Mónika.png','Kovácsné_Ozsvárth_Mónika.jpg',1,1,0,'2023-03-09 15:39:50',42,201420181),(48,'tanár​','kepek/tanarok/201420181/','Kulics_György.png','Kulics_György.jpg',1,1,0,'2023-03-09 05:50:17',43,201420181),(49,'tanár​','kepek/tanarok/201420181/','Nagyné_Giczi_Éva.png','Nagyné_Giczi_Éva.jpg',1,1,0,'2023-03-09 15:39:58',44,201420181),(50,'tanár​','kepek/tanarok/201420181/','Novákné_Soós_Judit.png','Novákné_Soós_Judit.jpg',1,1,0,'2023-03-09 15:40:07',45,201420181),(51,'tanár​','kepek/tanarok/201420181/','Orvos_Eszter.png','Orvos_Eszter.jpg',1,1,0,'2023-03-09 05:51:26',46,201420181),(52,'tanár​','kepek/tanarok/201420181/','Pungorné_Lakner_Katalin.png','Pungorné_Lakner_Katalin.jpg',1,1,0,'2023-03-09 15:40:16',47,201420181),(53,'tanár​','kepek/tanarok/201420181/','Riffel_Katalin.png','Riffel_Katalin.jpg',1,1,0,'2023-03-09 05:52:09',48,201420181),(54,'tanár​','kepek/tanarok/201420181/','Stanglné_Pintér_Márta.png','Stanglné_Pintér_Márta.jpg',1,1,0,'2023-03-09 15:40:43',49,201420181),(55,'tanár​','kepek/tanarok/201420181/','dr_Sümegi_István.png','dr_Sümegi_István.jpg',1,1,0,'2023-03-09 15:40:27',50,201420181),(56,'tanár​','kepek/tanarok/201420181/','Szilvágyiné_Lőrincz_Anita.png','Szilvágyiné_Lőrincz_Anita.jpg',1,1,0,'2023-03-09 15:40:35',51,201420181),(57,'tanár​','kepek/tanarok/201420181/','Varga_Tibor.png','Varga_Tibor.jpg',1,1,0,'2023-03-09 05:53:41',52,201420181),(58,'igazgatóhelyettes','kepek/tanarok/201420181/','Bokor_Csaba.png','Bokor_Csaba.jpg',1,1,0,'2023-03-13 16:44:06',54,201420181),(59,'igazgatóhelyettes','kepek/tanarok/201420181/','Hollósi_András.png','Hollósi_András.jpg',1,1,0,'2023-03-13 17:03:03',55,201420181),(60,'osztályfőnök','kepek/tanarok/201420181/','Ihász_Tibor.png','Ihász_Tibor.jpg',1,1,0,'2023-03-13 17:03:37',56,201420181),(61,'igazgató','kepek/tanarok/201420181/','Sági_József.png','Sági_József.jpg',1,1,0,'2023-03-13 17:04:24',57,201420181),(62,'tanár​','kepek/tanarok/201420181/','Varga_Kató_Anikó1.png','Varga_Kató_Anikó1.jpg',1,1,1,'2023-03-14 09:51:47',58,201420181);
/*!40000 ALTER TABLE `tanarkepek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tanarok`
--

DROP TABLE IF EXISTS `tanarok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tanarok` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vnev` varchar(50) DEFAULT NULL,
  `knev` varchar(50) DEFAULT NULL,
  `eng` tinyint(1) DEFAULT NULL,
  `torol` tinyint(1) DEFAULT NULL,
  `idobelyeg` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tanarok`
--

LOCK TABLES `tanarok` WRITE;
/*!40000 ALTER TABLE `tanarok` DISABLE KEYS */;
INSERT INTO `tanarok` VALUES (1,'Cserjési','Károlyné',1,0,'2023-03-07 17:58:47'),(2,'dr Kamarás','Béla',1,0,'2023-03-09 15:38:21'),(3,'Ember','Tivadar',1,0,'2023-03-07 18:01:34'),(4,'Farkas','Gellértné',1,0,'2023-03-07 18:01:59'),(5,'Kiss','Gyuláné',1,0,'2023-03-07 18:02:31'),(6,'Kovács','Ferenc',1,0,'2023-03-07 18:02:51'),(7,'Palánk','István',1,0,'2023-03-07 18:03:15'),(8,'Palánk','Istvánné',1,0,'2023-03-07 18:03:50'),(9,'Pünkösthy','Botond',1,0,'2023-03-13 16:35:36'),(10,'Reichard','Imre',1,0,'2023-03-07 18:04:46'),(11,'Tauber','László',1,0,'2023-03-07 18:05:11'),(12,'Ujlaky','Gyula',1,0,'2023-03-07 18:05:28'),(13,'Czeczeli','Józsefné',1,0,'2023-03-08 08:03:26'),(14,'Dr Lábdy','Lajos',1,0,'2023-03-09 15:38:54'),(15,'Mészáros','Erzsébet',1,0,'2023-03-08 07:59:01'),(16,'Szabó','Erzsébet',1,0,'2023-03-08 07:59:32'),(17,'Cserjési','Károly',1,0,'2023-03-08 10:00:12'),(18,'Csuti','Sándorné',1,0,'2023-03-08 10:01:23'),(19,'Dr Fodor','Henrik',1,0,'2023-03-09 15:38:35'),(20,'Dr Reichardt','Imre',1,0,'2023-03-09 15:38:44'),(21,'Gyuk','Mihály',1,0,'2023-03-08 10:03:28'),(22,'Horváth','József',1,0,'2023-03-08 10:04:06'),(23,'Horváth','Zsuzsa',1,0,'2023-03-08 10:04:42'),(24,'Márkus','Mária',1,0,'2023-03-08 10:16:38'),(25,'Vincze','Anna',1,0,'2023-03-08 10:18:01'),(26,'Barkovits','Ágnes',1,0,'2023-03-09 05:21:37'),(27,'Bedécs','Anikó',1,0,'2023-03-09 05:22:15'),(28,'Bodáné Szendrő','Mónika',1,0,'2023-03-09 15:39:05'),(29,'Dériné Horváth','Judit',1,0,'2023-03-09 15:39:14'),(30,'Döbrösy','Ildikó',1,0,'2023-03-09 05:24:05'),(31,'Elek','Rita',1,0,'2023-03-09 05:24:19'),(32,'Fancsali','András',1,0,'2023-03-09 05:24:39'),(33,'Glavanics','Krisztina',1,0,'2023-03-09 05:25:28'),(34,'Hargitai','Eszter',1,0,'2023-03-09 05:25:53'),(35,'Házi','Gábor',1,0,'2023-03-09 05:26:09'),(36,'Horváth','Judit',1,0,'2023-03-09 05:27:00'),(37,'Horváth','Klaudia',1,0,'2023-03-09 05:27:23'),(38,'Horváth','Noémi',1,0,'2023-03-09 05:27:35'),(39,'Kissné Süle','Henriett',1,0,'2023-03-09 15:39:27'),(40,'Kónya','Nóra',1,0,'2023-03-09 05:28:21'),(41,'Kovács Babos','Éva',1,0,'2023-03-09 15:39:39'),(42,'Kovácsné Ozsvárth','Mónika',1,0,'2023-03-09 15:39:50'),(43,'Kulics','György',1,0,'2023-03-09 05:31:31'),(44,'Nagyné Giczi','Éva',1,0,'2023-03-09 15:39:58'),(45,'Novákné Soós','Judit',1,0,'2023-03-09 15:40:07'),(46,'Orvos','Eszter',1,0,'2023-03-09 05:33:22'),(47,'Pungorné Lakner','Katalin',1,0,'2023-03-09 15:40:16'),(48,'Riffel','Katalin',1,0,'2023-03-09 05:34:22'),(49,'Stanglné Pintér','Márta',1,0,'2023-03-09 15:40:43'),(50,'dr Sümegi','István',1,0,'2023-03-09 15:40:27'),(51,'Szilvágyiné Lőrincz','Anita',1,0,'2023-03-09 15:40:35'),(52,'Varga','Tibor',1,0,'2023-03-09 05:36:33'),(53,'Varga Kató','Anikó',1,0,'2023-03-09 15:40:54'),(54,'Bokor','Csaba',1,0,'2023-03-13 16:43:42'),(55,'Hollósi','András',1,0,'2023-03-13 17:02:47'),(56,'Ihász','Tibor',1,0,'2023-03-13 17:03:22'),(57,'Sági','József',1,0,'2023-03-13 17:04:04'),(58,'Varga Kató','Anikó',1,1,'2023-03-14 09:51:47');
/*!40000 ALTER TABLE `tanarok` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 20:59:09
