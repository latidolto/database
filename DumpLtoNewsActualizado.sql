-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: lto_news
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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `aut_id` int(11) NOT NULL,
  `aut_nombre` varchar(60) NOT NULL,
  `rso_id` int(11) NOT NULL,
  `aut_descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`aut_id`),
  KEY `AUTRSOFK_idx` (`rso_id`),
  CONSTRAINT `AUTRSOFK` FOREIGN KEY (`rso_id`) REFERENCES `red_social` (`rso_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `com_id` int(11) NOT NULL,
  `com_noticia` int(11) NOT NULL,
  `com_usuario` int(11) NOT NULL,
  `com_contenido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`com_id`),
  KEY `COMUSUFK_idx` (`com_usuario`),
  KEY `COMNOTFK_idx` (`com_noticia`),
  CONSTRAINT `COMNOTFK` FOREIGN KEY (`com_noticia`) REFERENCES `noticia` (`not_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `COMUSUFK` FOREIGN KEY (`com_usuario`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto` (
  `con_id` int(11) NOT NULL,
  `con_titulo` varchar(45) NOT NULL,
  `con_descripcion` varchar(100) DEFAULT NULL,
  `con_direccion` varchar(100) NOT NULL,
  `con_lat` double NOT NULL,
  `con_lon` double NOT NULL,
  `con_correo` varchar(60) NOT NULL,
  `con_telefono` varchar(45) DEFAULT NULL,
  `rso_id` int(11) NOT NULL,
  PRIMARY KEY (`con_id`),
  KEY `CONREDFK_idx` (`rso_id`),
  CONSTRAINT `CONREDFK` FOREIGN KEY (`rso_id`) REFERENCES `red_social` (`rso_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `imagen`
--

DROP TABLE IF EXISTS `imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagen` (
  `img_id` int(11) NOT NULL,
  `img_descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen`
--

LOCK TABLES `imagen` WRITE;
/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticia`
--

DROP TABLE IF EXISTS `noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticia` (
  `not_id` int(11) NOT NULL,
  `aut_id` int(11) NOT NULL,
  `not_titulo` varchar(60) NOT NULL,
  `not_subtitulo` varchar(45) NOT NULL,
  `not_fecha` date NOT NULL,
  `not_visitas` varchar(45) DEFAULT NULL,
  `not_contenido` varchar(500) NOT NULL,
  PRIMARY KEY (`not_id`),
  KEY `NOTAUTFK_idx` (`aut_id`),
  CONSTRAINT `NOTAUTFK` FOREIGN KEY (`aut_id`) REFERENCES `autor` (`aut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia`
--

LOCK TABLES `noticia` WRITE;
/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticia_categoria`
--

DROP TABLE IF EXISTS `noticia_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticia_categoria` (
  `nct_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `not_id` int(11) NOT NULL,
  PRIMARY KEY (`nct_id`),
  KEY `NCANOTFK_idx` (`not_id`),
  KEY `NCACATFK_idx` (`cat_id`),
  CONSTRAINT `NCACATFK` FOREIGN KEY (`cat_id`) REFERENCES `categoria` (`cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `NCANOTFK` FOREIGN KEY (`not_id`) REFERENCES `noticia` (`not_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia_categoria`
--

LOCK TABLES `noticia_categoria` WRITE;
/*!40000 ALTER TABLE `noticia_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticia_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticia_imagen`
--

DROP TABLE IF EXISTS `noticia_imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticia_imagen` (
  `nim_id` int(11) NOT NULL,
  `nim_imagen` int(11) NOT NULL,
  `nim_noticia` int(11) NOT NULL,
  PRIMARY KEY (`nim_id`),
  KEY `NIMNOTFK_idx` (`nim_noticia`),
  KEY `NIMIMGFK_idx` (`nim_imagen`),
  CONSTRAINT `NIMIMGFK` FOREIGN KEY (`nim_imagen`) REFERENCES `imagen` (`img_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `NIMNOTFK` FOREIGN KEY (`nim_noticia`) REFERENCES `noticia` (`not_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia_imagen`
--

LOCK TABLES `noticia_imagen` WRITE;
/*!40000 ALTER TABLE `noticia_imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticia_imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticia_tag`
--

DROP TABLE IF EXISTS `noticia_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticia_tag` (
  `nta_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `not_id` int(11) NOT NULL,
  PRIMARY KEY (`nta_id`),
  KEY `NTAGNOTFK_idx` (`not_id`),
  KEY `NTAGTAGFK_idx` (`tag_id`),
  CONSTRAINT `NTAGNOTFK` FOREIGN KEY (`not_id`) REFERENCES `noticia` (`not_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `NTAGTAGFK` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia_tag`
--

LOCK TABLES `noticia_tag` WRITE;
/*!40000 ALTER TABLE `noticia_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticia_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opinion_comentario`
--

DROP TABLE IF EXISTS `opinion_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opinion_comentario` (
  `oco_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `oco_opinion` varchar(300) DEFAULT NULL,
  `usu_id` int(11) NOT NULL,
  PRIMARY KEY (`oco_id`),
  KEY `OCOUSUFK_idx` (`usu_id`),
  KEY `OCOCOMFK_idx` (`com_id`),
  CONSTRAINT `OCOCOMFK` FOREIGN KEY (`com_id`) REFERENCES `comentario` (`com_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `OCOUSUFK` FOREIGN KEY (`usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinion_comentario`
--

LOCK TABLES `opinion_comentario` WRITE;
/*!40000 ALTER TABLE `opinion_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `opinion_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `red_social`
--

DROP TABLE IF EXISTS `red_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `red_social` (
  `rso_id` int(11) NOT NULL,
  `rso_facebook` varchar(45) DEFAULT NULL,
  `rso_twitter` varchar(45) DEFAULT NULL,
  `rso_instagram` varchar(45) DEFAULT NULL,
  `rso_google` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `red_social`
--

LOCK TABLES `red_social` WRITE;
/*!40000 ALTER TABLE `red_social` DISABLE KEYS */;
/*!40000 ALTER TABLE `red_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `rol_id` int(11) NOT NULL,
  `rol_descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`rol_id`),
  CONSTRAINT `ROLUSUFK` FOREIGN KEY (`rol_id`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'admin');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesion` (
  `ses_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL,
  `ses_fecha` datetime NOT NULL,
  PRIMARY KEY (`ses_id`),
  KEY `USUSESPK_idx` (`usu_id`),
  CONSTRAINT `USUSESPK` FOREIGN KEY (`usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
INSERT INTO `sesion` VALUES (1,1,'2017-03-02 09:01:13');
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL,
  `tag_descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_nombre` varchar(45) NOT NULL,
  `usu_correo` varchar(60) NOT NULL,
  `usu_contrasena` varchar(100) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`usu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Gustavo','g@gmail.com','123',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-22 19:18:23
