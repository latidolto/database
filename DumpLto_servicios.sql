-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: lto_servicios
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda` (
  `fecha` datetime NOT NULL,
  `estatus` int(11) NOT NULL,
  `costo_final` int(11) DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL,
  `id_persona` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  PRIMARY KEY (`fecha`,`id_persona`,`id_cliente`,`id_servicio`),
  KEY `fk_agenda_persona1_idx` (`id_persona`),
  KEY `fk_agenda_cliente1_idx` (`id_cliente`),
  KEY `fk_agenda_servicio1_idx` (`id_servicio`),
  CONSTRAINT `fk_agenda_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenda_persona1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenda_servicio1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendario` (
  `id_calendario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `usuario_modificacion` varchar(150) NOT NULL,
  PRIMARY KEY (`id_calendario`),
  UNIQUE KEY `id_calendario_UNIQUE` (`id_calendario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `usuario_modificacion` varchar(150) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `idcliente_UNIQUE` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto` (
  `id_contacto` int(11) NOT NULL AUTO_INCREMENT,
  `celular` int(15) NOT NULL,
  `correo_electronico` varchar(150) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `lat_lon` varchar(70) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `cliente_id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_contacto`),
  UNIQUE KEY `id_contacto_UNIQUE` (`id_contacto`),
  KEY `fk_contacto_persona_idx` (`id_persona`),
  KEY `fk_contacto_cliente1_idx` (`cliente_id_cliente`),
  CONSTRAINT `fk_contacto_cliente1` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contacto_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dia_festivo`
--

DROP TABLE IF EXISTS `dia_festivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dia_festivo` (
  `id_dias_festivos` int(11) NOT NULL AUTO_INCREMENT,
  `dia` int(11) NOT NULL,
  `mes` int(11) DEFAULT NULL,
  `id_calendario` int(11) NOT NULL,
  PRIMARY KEY (`id_dias_festivos`,`id_calendario`),
  UNIQUE KEY `id_dias_festivos_UNIQUE` (`id_dias_festivos`),
  KEY `fk_dias_festivos_calendario1_idx` (`id_calendario`),
  CONSTRAINT `fk_dias_festivos_calendario1` FOREIGN KEY (`id_calendario`) REFERENCES `calendario` (`id_calendario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dia_festivo`
--

LOCK TABLES `dia_festivo` WRITE;
/*!40000 ALTER TABLE `dia_festivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `dia_festivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dia_semana`
--

DROP TABLE IF EXISTS `dia_semana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dia_semana` (
  `id_dias_semana` int(11) NOT NULL AUTO_INCREMENT,
  `dia_semana` int(11) NOT NULL,
  `dia_laborable` int(11) NOT NULL,
  `id_calendario` int(11) NOT NULL,
  PRIMARY KEY (`id_dias_semana`,`id_calendario`),
  UNIQUE KEY `id_dias_semana_UNIQUE` (`id_dias_semana`),
  KEY `fk_dias_semana_calendario1_idx` (`id_calendario`),
  CONSTRAINT `fk_dias_semana_calendario1` FOREIGN KEY (`id_calendario`) REFERENCES `calendario` (`id_calendario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dia_semana`
--

LOCK TABLES `dia_semana` WRITE;
/*!40000 ALTER TABLE `dia_semana` DISABLE KEYS */;
/*!40000 ALTER TABLE `dia_semana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galeria`
--

DROP TABLE IF EXISTS `galeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galeria` (
  `id_galeria` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` blob NOT NULL,
  `nombre_archivo` varchar(100) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  PRIMARY KEY (`id_galeria`,`id_servicio`),
  UNIQUE KEY `id_galeria_UNIQUE` (`id_galeria`),
  KEY `fk_galeria_servicio1_idx` (`id_servicio`),
  CONSTRAINT `fk_galeria_servicio1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galeria`
--

LOCK TABLES `galeria` WRITE;
/*!40000 ALTER TABLE `galeria` DISABLE KEYS */;
/*!40000 ALTER TABLE `galeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `inicio` varchar(5) NOT NULL,
  `fin` varchar(5) NOT NULL,
  `horas_comida` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `usuario_modificacion` varchar(150) NOT NULL,
  PRIMARY KEY (`id_horario`),
  UNIQUE KEY `id_horario_UNIQUE` (`id_horario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multivaluada`
--

DROP TABLE IF EXISTS `multivaluada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multivaluada` (
  `id_multivaluada` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(45) NOT NULL,
  `valor` int(11) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `usuario_modificacion` varchar(150) NOT NULL,
  PRIMARY KEY (`id_multivaluada`),
  UNIQUE KEY `id_multivaluada_UNIQUE` (`id_multivaluada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multivaluada`
--

LOCK TABLES `multivaluada` WRITE;
/*!40000 ALTER TABLE `multivaluada` DISABLE KEYS */;
/*!40000 ALTER TABLE `multivaluada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) NOT NULL,
  `clasificacion` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `usuario_modificacion` varchar(150) NOT NULL,
  `id_horario` int(11) NOT NULL,
  PRIMARY KEY (`id_persona`,`id_horario`),
  UNIQUE KEY `id_persona_UNIQUE` (`id_persona`),
  KEY `fk_persona_horario1_idx` (`id_horario`),
  CONSTRAINT `fk_persona_horario1` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id_horario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(450) NOT NULL,
  `costo` double(18,2) NOT NULL,
  `costo_visible` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `usuario_modificacion` varchar(150) NOT NULL,
  PRIMARY KEY (`id_servicio`),
  UNIQUE KEY `id_servicio_UNIQUE` (`id_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'UÃ±as Gelish','Gelish normal',300.00,1,1,'2018-08-20 18:20:30','anonymous'),(2,'UÃ±as Gelish Plus','Gelish con figura o decorado',350.00,1,1,'2018-08-20 18:22:44','anonymous'),(8,'UÃ±as 4 ','UÃ±as 4',450.00,0,0,'2018-08-20 18:14:29','anonymous'),(9,'UÃ±as 3','UÃ±as 3',400.00,1,1,'2018-08-20 18:14:16','anonymous');
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

-- Dump completed on 2019-02-16 12:52:41
