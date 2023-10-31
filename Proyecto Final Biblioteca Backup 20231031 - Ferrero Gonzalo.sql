CREATE DATABASE  IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `biblioteca`;
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
-- Table structure for table `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca` (
  `id_biblioteca` varchar(15) NOT NULL,
  `id_servicio` varchar(15) DEFAULT NULL,
  `categoria` tinytext,
  `genero` tinytext,
  `anio` int DEFAULT NULL,
  `editorial` tinytext,
  PRIMARY KEY (`id_biblioteca`),
  KEY `id_servicio` (`id_servicio`),
  CONSTRAINT `biblioteca_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES ('C1','COM1','Comics','Terror',1999,'edicionesferrero'),('C2','COM2','Comics','Terror',1999,'edicionesferrero'),('C3','COM3','Comics','Terror',1999,'edicionesferrero'),('L1','COM4','Libros','Suspenso',1999,'edicionesferrero'),('L2','ALQ1','Libros','Suspenso',1999,'edicionesferrero'),('L3','ALQ2','Libros','Romantica',1999,'edicionesferrero'),('M1','ALQ3','Manga','Thriller',1999,'edicionesferrero'),('M2','ALQ4','Manga','Accion',1999,'edicionesferrero');
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `biblioteca_AFTER_INSERT` AFTER INSERT ON `biblioteca` FOR EACH ROW BEGIN
	insert into biblioteca_log_i values (
	new.id_biblioteca, new.categoria, new.genero, new.anio, new.editorial, curdate(), curtime(), user());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `biblioteca_AFTER_UPDATE` AFTER UPDATE ON `biblioteca` FOR EACH ROW BEGIN
	insert into biblioteca_log_u 
    select new.id_biblioteca, new.categoria, new.genero, new.anio, new.editorial, curdate(), curtime(), user()
    from biblioteca;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `biblioteca_AFTER_DELETE` AFTER DELETE ON `biblioteca` FOR EACH ROW BEGIN
	insert into biblioteca_log_d 
    select old.id_biblioteca, old.categoria, old.genero, old.anio, old.editorial, curdate(), curtime(), user()
    from biblioteca;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `biblioteca_log_d`
--

DROP TABLE IF EXISTS `biblioteca_log_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca_log_d` (
  `id_biblioteca` varchar(15) DEFAULT NULL,
  `categoria` tinytext,
  `genero` tinytext,
  `anio` int DEFAULT NULL,
  `editorial` varchar(50) DEFAULT NULL,
  `fechacambio` date DEFAULT NULL,
  `horacambio` time DEFAULT NULL,
  `usercambio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca_log_d`
--

LOCK TABLES `biblioteca_log_d` WRITE;
/*!40000 ALTER TABLE `biblioteca_log_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `biblioteca_log_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca_log_i`
--

DROP TABLE IF EXISTS `biblioteca_log_i`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca_log_i` (
  `id_biblioteca` varchar(15) DEFAULT NULL,
  `categoria` tinytext,
  `genero` tinytext,
  `anio` int DEFAULT NULL,
  `editorial` varchar(50) DEFAULT NULL,
  `fechacambio` date DEFAULT NULL,
  `horacambio` time DEFAULT NULL,
  `usercambio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca_log_i`
--

LOCK TABLES `biblioteca_log_i` WRITE;
/*!40000 ALTER TABLE `biblioteca_log_i` DISABLE KEYS */;
INSERT INTO `biblioteca_log_i` VALUES ('C1','Comics','Terror',1999,'edicionesferrero','2023-10-04','23:38:46','root@localhost'),('C2','Comics','Terror',1999,'edicionesferrero','2023-10-04','23:38:46','root@localhost'),('C3','Comics','Terror',1999,'edicionesferrero','2023-10-04','23:38:46','root@localhost'),('L1','Libros','Suspenso',1999,'edicionesferrero','2023-10-04','23:38:46','root@localhost'),('L2','Libros','Suspenso',1999,'edicionesferrero','2023-10-04','23:38:46','root@localhost'),('L3','Libros','Romantica',1999,'edicionesferrero','2023-10-04','23:38:46','root@localhost'),('M1','Manga','Thriller',1999,'edicionesferrero','2023-10-04','23:38:46','root@localhost'),('M2','Manga','Accion',1999,'edicionesferrero','2023-10-04','23:38:46','root@localhost');
/*!40000 ALTER TABLE `biblioteca_log_i` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca_log_u`
--

DROP TABLE IF EXISTS `biblioteca_log_u`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca_log_u` (
  `id_biblioteca` varchar(15) DEFAULT NULL,
  `categoria` tinytext,
  `genero` tinytext,
  `anio` int DEFAULT NULL,
  `editorial` varchar(50) DEFAULT NULL,
  `fechacambio` date DEFAULT NULL,
  `horacambio` time DEFAULT NULL,
  `usercambio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca_log_u`
--

LOCK TABLES `biblioteca_log_u` WRITE;
/*!40000 ALTER TABLE `biblioteca_log_u` DISABLE KEYS */;
/*!40000 ALTER TABLE `biblioteca_log_u` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `id_servicio` varchar(15) DEFAULT NULL,
  `nombre` tinytext,
  `apellido` tinytext,
  `direccion` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (42123456,'COM1','Peter','Parker','Campos 1234','pparker@gmail.com',1134567890),(42123457,'COM2','Thor','Odinson','Campos 1235','todinson@gmail.com',1134567891),(42123458,'COM3','Dominic','Toretto','Campos 1236','dtoretto@gmail.com',1134567892),(42123459,'COM4','Brian','Oconner','Campos 1237','doconner@gmail.com',1134567893),(42123460,'ALQ1','Wade','Wilson','Campos 1238','wwilson@gmail.com',1134567894),(42123461,'ALQ2','Bruce','Wayne','Campos 1239','bwayne@gmail.com',1134567895),(42123462,'ALQ3','Tony','Stark','Campos 1240','tstark@gmail.com',1134567896),(42123463,'ALQ4','Marshall','Matters','Campos 1241','mmatters@gmail.com',1134567897);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comics`
--

DROP TABLE IF EXISTS `comics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comics` (
  `isbn` int NOT NULL,
  `id_biblioteca` varchar(15) DEFAULT NULL,
  `cantidad_copias` int DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `autor` tinytext,
  `fecha_publicacion` date DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  KEY `id_biblioteca` (`id_biblioteca`),
  CONSTRAINT `comics_ibfk_1` FOREIGN KEY (`id_biblioteca`) REFERENCES `biblioteca` (`id_biblioteca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comics`
--

LOCK TABLES `comics` WRITE;
/*!40000 ALTER TABLE `comics` DISABLE KEYS */;
INSERT INTO `comics` VALUES (112345,'C1',4,'Marvel Zombies 1','OvniPress','1999-05-10'),(112346,'C2',3,'Marvel Zombies 2','OvniPress','1999-05-11'),(112347,'C3',6,'Marvel Zombies 3','OvniPress','1999-05-12');
/*!40000 ALTER TABLE `comics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL,
  `id_sede` int NOT NULL,
  `nombre` tinytext,
  `apellido` tinytext,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `puesto` tinytext,
  PRIMARY KEY (`id_empleado`),
  KEY `id_sede` (`id_sede`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (40123456,1,'Roman','Riquelme','rriquelme@biblioteca.com',112345678,'Recepcionista'),(40123457,2,'Guillermo','Schelotto','gschelotto@biblioteca.com',112345679,'Bibliotecario'),(40123458,3,'Gustavo','Schelotto','guschelotto@biblioteca.com',112345680,'Consejero'),(40123459,4,'Martin','Palermo','mpalermo@biblioteca.com',112345681,'Recepcionista'),(40123460,5,'Carlos','Tevez','ctevez@biblioteca.com',112345682,'Consejero'),(40123461,1,'Diego','Maradona','dmaradon@biblioteca.com',112345683,'Bibliotecario'),(40123462,2,'Lionel','Messi','lmessi@biblioteca.com',112345684,'Administrador'),(40123463,3,'Cristiano','Ronaldo','cronaldo@biblioteca.com',112345685,'Bibliotecario');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `empleados_BEFORE_INSERT` BEFORE INSERT ON `empleados` FOR EACH ROW BEGIN
	insert into empleados_log_i values (
	new.id_empleado, new.id_sede, new.nombre, new.apellido, new.email, new.telefono, new.puesto, curdate(), curtime(), user());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `empleados_BEFORE_UPDATE` BEFORE UPDATE ON `empleados` FOR EACH ROW BEGIN
	insert into empleados_log_u 
    select new.id_empleado, new.id_sede, new.nombre, new.apellido, new.email, new.telefono, new.puesto, curdate(), curtime(), user()
    from empleados;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `empleados_BEFORE_DELETE` BEFORE DELETE ON `empleados` FOR EACH ROW BEGIN
	insert into empleados_log_d 
    select old.id_empleado, old.id_sede, old.nombre, old.apellido, old.email, old.telefono, old.puesto, curdate(), curtime(), user()
    from empleados;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empleados_log_d`
--

DROP TABLE IF EXISTS `empleados_log_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados_log_d` (
  `id_empleado` int DEFAULT NULL,
  `id_sede` int DEFAULT NULL,
  `nombre` tinytext,
  `apellido` tinytext,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `puesto` tinytext,
  `fechacambio` date DEFAULT NULL,
  `horacambio` time DEFAULT NULL,
  `usercambio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados_log_d`
--

LOCK TABLES `empleados_log_d` WRITE;
/*!40000 ALTER TABLE `empleados_log_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados_log_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados_log_i`
--

DROP TABLE IF EXISTS `empleados_log_i`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados_log_i` (
  `id_empleado` int DEFAULT NULL,
  `id_sede` int DEFAULT NULL,
  `nombre` tinytext,
  `apellido` tinytext,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `puesto` tinytext,
  `fechacambio` date DEFAULT NULL,
  `horacambio` time DEFAULT NULL,
  `usercambio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados_log_i`
--

LOCK TABLES `empleados_log_i` WRITE;
/*!40000 ALTER TABLE `empleados_log_i` DISABLE KEYS */;
INSERT INTO `empleados_log_i` VALUES (40123456,1,'Roman','Riquelme','rriquelme@biblioteca.com',112345678,'Recepcionista','2023-10-04','23:36:43','root@localhost'),(40123457,2,'Guillermo','Schelotto','gschelotto@biblioteca.com',112345679,'Bibliotecario','2023-10-04','23:36:43','root@localhost'),(40123458,3,'Gustavo','Schelotto','guschelotto@biblioteca.com',112345680,'Consejero','2023-10-04','23:36:43','root@localhost'),(40123459,4,'Martin','Palermo','mpalermo@biblioteca.com',112345681,'Recepcionista','2023-10-04','23:36:43','root@localhost'),(40123460,5,'Carlos','Tevez','ctevez@biblioteca.com',112345682,'Consejero','2023-10-04','23:36:43','root@localhost'),(40123461,1,'Diego','Maradona','dmaradon@biblioteca.com',112345683,'Bibliotecario','2023-10-04','23:36:43','root@localhost'),(40123462,2,'Lionel','Messi','lmessi@biblioteca.com',112345684,'Administrador','2023-10-04','23:36:43','root@localhost'),(40123463,3,'Cristiano','Ronaldo','cronaldo@biblioteca.com',112345685,'Bibliotecario','2023-10-04','23:36:43','root@localhost');
/*!40000 ALTER TABLE `empleados_log_i` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados_log_u`
--

DROP TABLE IF EXISTS `empleados_log_u`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados_log_u` (
  `id_empleado` int DEFAULT NULL,
  `id_sede` int DEFAULT NULL,
  `nombre` tinytext,
  `apellido` tinytext,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `puesto` tinytext,
  `fechacambio` date DEFAULT NULL,
  `horacambio` time DEFAULT NULL,
  `usercambio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados_log_u`
--

LOCK TABLES `empleados_log_u` WRITE;
/*!40000 ALTER TABLE `empleados_log_u` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados_log_u` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `isbn` int NOT NULL,
  `id_biblioteca` varchar(15) DEFAULT NULL,
  `cantidad_copias` int DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `autor` tinytext,
  `fecha_publicacion` date DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  KEY `id_biblioteca` (`id_biblioteca`),
  CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_biblioteca`) REFERENCES `biblioteca` (`id_biblioteca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (123478,'L1',15,'El Club de los Psicopatas','Jhon Mayer','1999-05-10'),(123479,'L2',9,'La Niebla','Jhon Mayer','1999-05-11'),(123480,'L3',7,'Las ventajas de ser Invisible','Stephen King','1999-05-12');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangas`
--

DROP TABLE IF EXISTS `mangas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangas` (
  `isbn` int NOT NULL,
  `id_biblioteca` varchar(15) DEFAULT NULL,
  `cantidad_copias` int DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `autor` tinytext,
  `fecha_publicacion` date DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  KEY `id_biblioteca` (`id_biblioteca`),
  CONSTRAINT `mangas_ibfk_1` FOREIGN KEY (`id_biblioteca`) REFERENCES `biblioteca` (`id_biblioteca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangas`
--

LOCK TABLES `mangas` WRITE;
/*!40000 ALTER TABLE `mangas` DISABLE KEYS */;
INSERT INTO `mangas` VALUES (892,'M1',2,'Deadman Wonderland','Stephen Hawking','1999-05-10'),(893,'M2',1,'Dragon Ball Z 1','Stephen Hawking','1999-05-11');
/*!40000 ALTER TABLE `mangas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `id_sede` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Ramos Mejia 1','Av de Mayo 17'),(2,'Luzuriaga 1','Arieta 25'),(3,'Ramos Mejia 2','Av Rivadavia 14874'),(4,'San Justo 1','Juan Manuel de Rosas 3300'),(5,'Belgrano 1','Av Cabildo 2156');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id_servicio` varchar(15) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_empleado` int NOT NULL,
  `servicio` tinytext,
  `fecha` date DEFAULT NULL,
  `comentarios` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `servicio_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES ('ALQ1',42123460,40123460,'Alquiler','2023-09-04','Devolver el 04/10/2023'),('ALQ2',42123461,40123461,'Alquiler','2023-09-04','Devolver el 04/10/2023'),('ALQ3',42123462,40123462,'Alquiler','2023-09-04','Devolver el 04/10/2023'),('ALQ4',42123463,40123463,'Alquiler','2023-09-04','Devolver el 04/10/2023'),('COM1',42123456,40123456,'Compra','2023-09-04','sin comentarios'),('COM2',42123457,40123457,'Compra','2023-09-04','sin comentarios'),('COM3',42123458,40123458,'Compra','2023-09-04','sin comentarios'),('COM4',42123459,40123459,'Compra','2023-09-04','sin comentarios');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view1`
--

DROP TABLE IF EXISTS `view1`;
/*!50001 DROP VIEW IF EXISTS `view1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view1` AS SELECT 
 1 AS `id_servicio`,
 1 AS `servicio`,
 1 AS `id_cliente`,
 1 AS `nombre`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view2`
--

DROP TABLE IF EXISTS `view2`;
/*!50001 DROP VIEW IF EXISTS `view2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view2` AS SELECT 
 1 AS `id_sede`,
 1 AS `NombreSede`,
 1 AS `id_empleado`,
 1 AS `nombre`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view3`
--

DROP TABLE IF EXISTS `view3`;
/*!50001 DROP VIEW IF EXISTS `view3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view3` AS SELECT 
 1 AS `titulo`,
 1 AS `id_biblioteca`,
 1 AS `genero`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view4`
--

DROP TABLE IF EXISTS `view4`;
/*!50001 DROP VIEW IF EXISTS `view4`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view4` AS SELECT 
 1 AS `servicio`,
 1 AS `genero`,
 1 AS `id_cliente`,
 1 AS `nombre`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view5`
--

DROP TABLE IF EXISTS `view5`;
/*!50001 DROP VIEW IF EXISTS `view5`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view5` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `categoria`,
 1 AS `servicio`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'biblioteca'
--

--
-- Dumping routines for database 'biblioteca'
--
/*!50003 DROP FUNCTION IF EXISTS `Function1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Function1`(comicisbn varchar(50)) RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
begin
	declare resultado varchar(50);
    select titulo
    into resultado
    from comics
    where isbn = comicisbn;
return resultado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Function2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Function2`(clientid varchar(50)) RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
begin
	declare nombre_cliente varchar(30);
    declare apellido_cliente varchar(30);
    declare resultado varchar(50);
    
    select nombre, apellido
    into nombre_cliente, apellido_cliente
    from clientes
    where id_cliente = clientid;
    set resultado = concat (nombre_cliente, ' ', apellido_cliente);
return resultado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarComic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarComic`(
    IN b_isbn INT,
    IN b_id_biblioteca VARCHAR(20),
    IN b_cantidad_copias INT,
    IN b_titulo varchar(50),
    IN b_autor varchar(30),
    IN b_fecha_publicacion date)
BEGIN
    DECLARE mensaje VARCHAR(100);
    -- Intentar insertar un nuevo registro en la tabla
        INSERT INTO comics (isbn, id_biblioteca, cantidad_copias, titulo, autor, fecha_publicacion)
        VALUES (b_isbn, b_id_biblioteca, b_cantidad_copias, b_titulo, b_autor, b_fecha_publicacion);
    -- Comprobar si ocurrió un error durante la inserción
    IF ROW_COUNT() > 0 THEN
        SET mensaje = 'Biblioteca cargada correctamente';
    ELSE
        SET mensaje = 'No se pudo insertar la biblioteca. Corroborar los datos ingresados.';
    END IF;
    -- Mostrar el mensaje
    SELECT mensaje AS Mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrdenarLibros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrdenarLibros`(
    IN NombreTabla VARCHAR(100),
    IN CampoOrden VARCHAR(100),
    IN OrdenTipo VARCHAR(10))
BEGIN
    SET @query = CONCAT('SELECT * FROM ', NombreTabla, ' ORDER BY ', CampoOrden, ' ', OrdenTipo);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view1`
--

/*!50001 DROP VIEW IF EXISTS `view1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view1` AS select `s`.`id_servicio` AS `id_servicio`,`s`.`servicio` AS `servicio`,`c`.`id_cliente` AS `id_cliente`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido` from (`servicio` `s` join `clientes` `c` on((`s`.`id_servicio` = `c`.`id_servicio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view2`
--

/*!50001 DROP VIEW IF EXISTS `view2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view2` AS select `s`.`id_sede` AS `id_sede`,`s`.`nombre` AS `NombreSede`,`e`.`id_empleado` AS `id_empleado`,`e`.`nombre` AS `nombre`,`e`.`apellido` AS `apellido` from (`sede` `s` join `empleados` `e` on((`s`.`id_sede` = `e`.`id_sede`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view3`
--

/*!50001 DROP VIEW IF EXISTS `view3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view3` AS select `l`.`titulo` AS `titulo`,`b`.`id_biblioteca` AS `id_biblioteca`,`b`.`genero` AS `genero` from (`biblioteca` `b` join `libros` `l` on((`l`.`id_biblioteca` = `b`.`id_biblioteca`))) where (`b`.`genero` like '%suspenso%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view4`
--

/*!50001 DROP VIEW IF EXISTS `view4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view4` AS select `s`.`servicio` AS `servicio`,`b`.`genero` AS `genero`,`c`.`id_cliente` AS `id_cliente`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido` from ((`servicio` `s` join `biblioteca` `b` on((`s`.`id_servicio` = `b`.`id_servicio`))) join `clientes` `c` on((`s`.`id_servicio` = `c`.`id_servicio`))) where (`s`.`servicio` like '%ALQ%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view5`
--

/*!50001 DROP VIEW IF EXISTS `view5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view5` AS select `c`.`id_cliente` AS `id_cliente`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`b`.`categoria` AS `categoria`,`s`.`servicio` AS `servicio` from ((`clientes` `c` join `servicio` `s` on((`c`.`id_servicio` = `s`.`id_servicio`))) join `biblioteca` `b` on((`s`.`id_servicio` = `b`.`id_servicio`))) where (`s`.`servicio` like '%COM%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-31  0:34:02
