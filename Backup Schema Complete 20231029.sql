-- BD Backup 2023-10-29
-- Tablas: Biblioteca, Clientes, Comics, Empleados, Libros, Mangas, Sede, Servicio.

-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES ('C1','COM1','Comics','Terror',1999,'edicionesferrero'),('C2','COM2','Comics','Terror',1999,'edicionesferrero'),('C3','COM3','Comics','Terror',1999,'edicionesferrero'),('L1','COM4','Libros','Suspenso',1999,'edicionesferrero'),('L2','ALQ1','Libros','Suspenso',1999,'edicionesferrero'),('L3','ALQ2','Libros','Romantica',1999,'edicionesferrero'),('M1','ALQ3','Manga','Thriller',1999,'edicionesferrero'),('M2','ALQ4','Manga','Accion',1999,'edicionesferrero');
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (42123456,'COM1','Peter','Parker','Campos 1234','pparker@gmail.com',1134567890),(42123457,'COM2','Thor','Odinson','Campos 1235','todinson@gmail.com',1134567891),(42123458,'COM3','Dominic','Toretto','Campos 1236','dtoretto@gmail.com',1134567892),(42123459,'COM4','Brian','Oconner','Campos 1237','doconner@gmail.com',1134567893),(42123460,'ALQ1','Wade','Wilson','Campos 1238','wwilson@gmail.com',1134567894),(42123461,'ALQ2','Bruce','Wayne','Campos 1239','bwayne@gmail.com',1134567895),(42123462,'ALQ3','Tony','Stark','Campos 1240','tstark@gmail.com',1134567896),(42123463,'ALQ4','Marshall','Matters','Campos 1241','mmatters@gmail.com',1134567897);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comics`
--

LOCK TABLES `comics` WRITE;
/*!40000 ALTER TABLE `comics` DISABLE KEYS */;
INSERT INTO `comics` VALUES (112345,'C1',4,'Marvel Zombies 1','OvniPress','1999-05-10'),(112346,'C2',3,'Marvel Zombies 2','OvniPress','1999-05-11'),(112347,'C3',6,'Marvel Zombies 3','OvniPress','1999-05-12');
/*!40000 ALTER TABLE `comics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (40123456,1,'Roman','Riquelme','rriquelme@biblioteca.com',112345678,'Recepcionista'),(40123457,2,'Guillermo','Schelotto','gschelotto@biblioteca.com',112345679,'Bibliotecario'),(40123458,3,'Gustavo','Schelotto','guschelotto@biblioteca.com',112345680,'Consejero'),(40123459,4,'Martin','Palermo','mpalermo@biblioteca.com',112345681,'Recepcionista'),(40123460,5,'Carlos','Tevez','ctevez@biblioteca.com',112345682,'Consejero'),(40123461,1,'Diego','Maradona','dmaradon@biblioteca.com',112345683,'Bibliotecario'),(40123462,2,'Lionel','Messi','lmessi@biblioteca.com',112345684,'Administrador'),(40123463,3,'Cristiano','Ronaldo','cronaldo@biblioteca.com',112345685,'Bibliotecario');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (123478,'L1',15,'El Club de los Psicopatas','Jhon Mayer','1999-05-10'),(123479,'L2',9,'La Niebla','Jhon Mayer','1999-05-11'),(123480,'L3',7,'Las ventajas de ser Invisible','Stephen King','1999-05-12');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mangas`
--

LOCK TABLES `mangas` WRITE;
/*!40000 ALTER TABLE `mangas` DISABLE KEYS */;
INSERT INTO `mangas` VALUES (892,'M1',2,'Deadman Wonderland','Stephen Hawking','1999-05-10'),(893,'M2',1,'Dragon Ball Z 1','Stephen Hawking','1999-05-11');
/*!40000 ALTER TABLE `mangas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Ramos Mejia 1','Av de Mayo 17'),(2,'Luzuriaga 1','Arieta 25'),(3,'Ramos Mejia 2','Av Rivadavia 14874'),(4,'San Justo 1','Juan Manuel de Rosas 3300'),(5,'Belgrano 1','Av Cabildo 2156');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES ('ALQ1',42123460,40123460,'Alquiler','2023-09-04','Devolver el 04/10/2023'),('ALQ2',42123461,40123461,'Alquiler','2023-09-04','Devolver el 04/10/2023'),('ALQ3',42123462,40123462,'Alquiler','2023-09-04','Devolver el 04/10/2023'),('ALQ4',42123463,40123463,'Alquiler','2023-09-04','Devolver el 04/10/2023'),('COM1',42123456,40123456,'Compra','2023-09-04','sin comentarios'),('COM2',42123457,40123457,'Compra','2023-09-04','sin comentarios'),('COM3',42123458,40123458,'Compra','2023-09-04','sin comentarios'),('COM4',42123459,40123459,'Compra','2023-09-04','sin comentarios');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-29 23:05:49
