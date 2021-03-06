-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: LATIDO
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
-- Table structure for table `Actividades`
--

DROP TABLE IF EXISTS `Actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Actividades` (
  `idActividades` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `estatus` int(1) NOT NULL,
  `usuCve` varchar(200) NOT NULL,
  `fecMod` date NOT NULL,
  `Plan_idPlan` int(11) NOT NULL,
  PRIMARY KEY (`idActividades`),
  KEY `fk_Actividades_Plan1_idx` (`Plan_idPlan`),
  CONSTRAINT `fk_Actividades_Plan1` FOREIGN KEY (`Plan_idPlan`) REFERENCES `Plan` (`idPlan`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actividades`
--

LOCK TABLES `Actividades` WRITE;
/*!40000 ALTER TABLE `Actividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `Actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documentacion`
--

DROP TABLE IF EXISTS `Documentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Documentacion` (
  `idDocumentacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `mime` varchar(40) NOT NULL,
  `archivo` blob NOT NULL,
  `Prospecto_idProspecto` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecMod` datetime NOT NULL,
  `usuCve` varchar(45) NOT NULL,
  PRIMARY KEY (`idDocumentacion`),
  KEY `fk_Documentacion_Prospecto1_idx` (`Prospecto_idProspecto`),
  CONSTRAINT `fk_Documentacion_Prospecto1` FOREIGN KEY (`Prospecto_idProspecto`) REFERENCES `Prospecto` (`idProspecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documentacion`
--

LOCK TABLES `Documentacion` WRITE;
/*!40000 ALTER TABLE `Documentacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Documentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plan`
--

DROP TABLE IF EXISTS `Plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plan` (
  `idPlan` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `version` int(11) NOT NULL,
  `estatus` int(1) NOT NULL,
  `usuCve` varchar(200) NOT NULL,
  `fecMod` varchar(200) NOT NULL,
  `Prospecto_idProspecto` int(11) NOT NULL,
  PRIMARY KEY (`idPlan`),
  KEY `fk_Plan_Prospecto_idx` (`Prospecto_idProspecto`),
  CONSTRAINT `fk_Plan_Prospecto` FOREIGN KEY (`Prospecto_idProspecto`) REFERENCES `Prospecto` (`idProspecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan`
--

LOCK TABLES `Plan` WRITE;
/*!40000 ALTER TABLE `Plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `Plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prospecto`
--

DROP TABLE IF EXISTS `Prospecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prospecto` (
  `idProspecto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `nombreOrganizacional` varchar(200) NOT NULL,
  `telefono1` varchar(20) NOT NULL,
  `telefono2` varchar(20) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `estatus` int(1) NOT NULL,
  `usuCve` varchar(200) NOT NULL,
  `fecMod` date NOT NULL,
  PRIMARY KEY (`idProspecto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prospecto`
--

LOCK TABLES `Prospecto` WRITE;
/*!40000 ALTER TABLE `Prospecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prospecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacen` (
  `id_almacen` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `fecMod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuCve` varchar(200) NOT NULL,
  `Sistema_idSistema` int(11) NOT NULL,
  PRIMARY KEY (`id_almacen`,`Sistema_idSistema`),
  KEY `fk_Almacen_Sistema1_idx` (`Sistema_idSistema`),
  CONSTRAINT `fk_Almacen_Sistema1` FOREIGN KEY (`Sistema_idSistema`) REFERENCES `sistema` (`idSistema`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,'ALMACEN 1',1,'2018-02-14 17:32:04','MODIFIED',1),(2,'ALMACEN 5',0,'2018-02-15 19:35:37','MODIFIED',1);
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulo` (
  `id_articulo` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(45) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `precio` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `usuCve` varchar(200) NOT NULL,
  `fecMod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Inventario_idInventario` int(11) NOT NULL,
  PRIMARY KEY (`id_articulo`),
  KEY `fk_Articulo_Inventario1_idx` (`Inventario_idInventario`),
  CONSTRAINT `fk_Articulo_Inventario1` FOREIGN KEY (`Inventario_idInventario`) REFERENCES `inventario` (`id_inventario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,'ARTICULO001','ARTICULO 1',1000,1234567890,100,1,'JL101295','2018-02-16 01:57:18',1),(2,'dasd','sdasd',213123123,123123,123123,0,'MODIFIED','2018-02-17 02:15:21',1),(3,'9876543','qwertyuiop',234,234,234,1,'JL101295','2018-02-17 02:15:37',1);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulocategoria`
--

DROP TABLE IF EXISTS `articulocategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulocategoria` (
  `aca_id` int(11) NOT NULL,
  `Articulo_idArticulo` int(11) NOT NULL,
  `Categoria_idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`aca_id`),
  KEY `fk_Articulo_has_Categoria_Categoria1_idx` (`Categoria_idCategoria`),
  KEY `fk_Articulo_has_Categoria_Articulo1_idx` (`Articulo_idArticulo`),
  CONSTRAINT `fk_Articulo_has_Categoria_Articulo1` FOREIGN KEY (`Articulo_idArticulo`) REFERENCES `articulo` (`id_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Articulo_has_Categoria_Categoria1` FOREIGN KEY (`Categoria_idCategoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulocategoria`
--

LOCK TABLES `articulocategoria` WRITE;
/*!40000 ALTER TABLE `articulocategoria` DISABLE KEYS */;
INSERT INTO `articulocategoria` VALUES (0,1,26),(1,1,27),(2,2,29),(3,1,28),(4,3,27),(5,3,30),(6,3,28),(7,3,26),(8,3,29),(9,2,28);
/*!40000 ALTER TABLE `articulocategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articuloproveedor`
--

DROP TABLE IF EXISTS `articuloproveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articuloproveedor` (
  `apr_id` int(11) NOT NULL,
  `Proveedor_idProveedor` int(11) NOT NULL,
  `Articulo_idArticulo` int(11) NOT NULL,
  PRIMARY KEY (`apr_id`),
  KEY `fk_Proveedor_has_Articulo_Articulo1_idx` (`Articulo_idArticulo`),
  KEY `fk_Proveedor_has_Articulo_Proveedor1_idx` (`Proveedor_idProveedor`),
  CONSTRAINT `fk_Proveedor_has_Articulo_Articulo1` FOREIGN KEY (`Articulo_idArticulo`) REFERENCES `articulo` (`id_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proveedor_has_Articulo_Proveedor1` FOREIGN KEY (`Proveedor_idProveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articuloproveedor`
--

LOCK TABLES `articuloproveedor` WRITE;
/*!40000 ALTER TABLE `articuloproveedor` DISABLE KEYS */;
INSERT INTO `articuloproveedor` VALUES (1,1,1);
/*!40000 ALTER TABLE `articuloproveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `fecMod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuCve` varchar(200) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Categoria 1',0,'2018-02-03 19:02:49','1234567890'),(2,'Categoria 2',0,'2018-02-03 19:02:59','ED009038'),(3,'Categoria 33',0,'2018-02-03 20:16:21','ED009038'),(4,'Categoria 2',0,'2018-02-03 20:16:29','ED009038'),(5,'Categoria 4',0,'2018-02-03 19:03:02','ED009038'),(6,'jlhgjv',0,'2018-02-03 20:16:16','JL101295'),(10,'',0,'2018-01-25 03:29:35','JL101295'),(11,'Nombre vrgs',0,'2018-02-03 20:16:19','JL101295'),(12,'kdsokfdsf',0,'2018-02-03 20:16:24','JL101295'),(13,'Holo!',0,'2018-02-03 18:15:08','JL101295'),(14,'Holo!!',0,'2018-02-03 20:17:26','JL101295'),(15,'Jose Luis',0,'2018-02-03 20:16:27','JL101295'),(16,'Luis',0,'2018-02-03 19:40:15','MODIFIED'),(17,'lknsdÃ±nfiasnfoiasnoansosd',0,'2018-02-03 19:54:48','MODIFIED'),(18,'ldasodjapdojkapkxÂ´samxldsdc',0,'2018-02-03 20:05:59','MODIFIED'),(19,'Jose Luis',0,'2018-02-03 20:17:36','MODIFIED'),(20,'CAsasalsanlkxnsaoi<z',0,'2018-02-03 20:22:25','MODIFIED'),(21,'oi<z',0,'2018-02-08 17:34:19','MODIFIED'),(22,'Jose ds',0,'2018-02-08 17:30:53','MODIFIED'),(23,'sdsdsflmÃ±as',0,'2018-02-08 17:34:22','JL101295'),(24,'ldsjknfsdlf sd',0,'2018-02-08 17:34:17','JL101295'),(25,'sk<kjsdsvd',0,'2018-02-08 17:34:13','JL101295'),(26,'CATEGORIA 1',1,'2018-02-08 17:35:12','JL101295'),(27,'CATEGORIA 2',1,'2018-02-08 17:35:17','JL101295'),(28,'CATEGORIA 3',1,'2018-02-08 17:35:23','JL101295'),(29,'CATEGORIA 4',1,'2018-02-08 17:35:28','JL101295'),(30,'CATEGORIA 5',1,'2018-02-08 17:35:38','MODIFIED');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrada` (
  `idEntrada` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estatus` int(11) NOT NULL,
  `usuCve` varchar(200) NOT NULL,
  `fecMod` datetime NOT NULL,
  `Articulo_idArticulo` int(11) NOT NULL,
  `Inventario_idInventario` int(11) NOT NULL,
  PRIMARY KEY (`idEntrada`),
  KEY `fk_Entrada_Articulo1_idx` (`Articulo_idArticulo`),
  KEY `fk_Entrada_Inventario1_idx` (`Inventario_idInventario`),
  CONSTRAINT `fk_Entrada_Articulo1` FOREIGN KEY (`Articulo_idArticulo`) REFERENCES `articulo` (`id_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entrada_Inventario1` FOREIGN KEY (`Inventario_idInventario`) REFERENCES `inventario` (`id_inventario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `fecMod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuCve` varchar(200) NOT NULL,
  `descripcion` text,
  `id_almacen` int(11) NOT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `fk_Inventario_Almacen1_idx` (`id_almacen`),
  CONSTRAINT `fk_Inventario_Almacen1` FOREIGN KEY (`id_almacen`) REFERENCES `almacen` (`id_almacen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,'INVENTARIO 3',1,'2018-03-10 19:58:39','MODIFIED','DESCRIPCIN DE INVENTARIO 1',1),(2,'sakhdoash',0,'2018-03-12 00:12:33','JL101295','snldknsldfs',1),(3,'fdgfdg',0,'2018-03-12 00:12:48','JL101295','fdgfdg',1);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `idMenu` int(11) NOT NULL,
  `etiqueta` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `idMenuPadre` int(11) DEFAULT NULL,
  `usuCve` varchar(200) NOT NULL,
  `fecMod` datetime NOT NULL,
  `idSistema` int(11) NOT NULL,
  PRIMARY KEY (`idMenu`,`idSistema`),
  KEY `fk_Menu_Menu_idx` (`idMenuPadre`),
  KEY `fk_Menu_Sistema1_idx` (`idSistema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Infraestructura','Infraestructura del Sistema de Latido',NULL,'GC160619','2019-01-26 00:00:00',1),(2,'Permisos','Permisos del Sistema de Latido',NULL,'GC160619','2019-01-26 00:00:00',1),(3,'Menu','Menu del Sistema de Mentes con Alas',NULL,'GC160619','2019-01-26 00:00:00',3),(4,'Infraestructura','Menu de Infraestructura del Sistema de Mentes con Alas',3,'GC160619','2019-01-26 00:00:00',3),(5,'Integrantes','Menu de Integrantes del Sistema de Mentes con Alas',3,'GC160619','2019-01-26 00:00:00',3),(6,'Atencion Psicologica','Menu de Atencion Psicologica de Mentes con Alas',3,'GC160619','2019-01-26 00:00:00',3),(7,'Rehabilitacion Fisica y Salud','Menu de Rehabilitacion Fisica y Salud del Sistema Mentes con Alas',3,'GC160619','2019-01-26 00:00:00',3),(8,'Registro y Evaluacion de Programas','Menu de Registro y Evaluacion de Programas del Sistema de Mentes con Alas',3,'GC160619','2019-01-26 00:00:00',3),(9,'Evaluacion de Programas','Menu de Evaluacion de Programas del Sistema de Mentes con Alas',3,'GC160619','2019-01-26 00:00:00',3),(10,'Evaluacion 360º','Menu de Evaluacion 360 del Sistema de Mentes con Alas',3,'GC160619','2019-01-26 00:00:00',3);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multivaluada`
--

DROP TABLE IF EXISTS `multivaluada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multivaluada` (
  `mul_id` int(11) NOT NULL,
  `clave` varchar(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`mul_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multivaluada`
--

LOCK TABLES `multivaluada` WRITE;
/*!40000 ALTER TABLE `multivaluada` DISABLE KEYS */;
INSERT INTO `multivaluada` VALUES (1,'0001',1,'ACTIVO'),(2,'0001',0,'INACTIVO');
/*!40000 ALTER TABLE `multivaluada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `fecMod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuCve` varchar(200) NOT NULL,
  `Sistema_idSistema` int(11) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `fk_Proveedor_Sistema1_idx` (`Sistema_idSistema`),
  CONSTRAINT `fk_Proveedor_Sistema1` FOREIGN KEY (`Sistema_idSistema`) REFERENCES `sistema` (`idSistema`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'NOMBRE 1','1234567890','DIRECCION 1','CORREO1@DOMINIO.COM',0,'2018-02-13 03:59:04','MODIFIED',1),(2,'NOMBRE 2','1234567890','DIRECCION 2','CORREO2@DOMINIO.COM',1,'2018-02-08 19:31:26','1234567890',2),(3,'NOMBRE 3','1234567890','DIRECCION 3','CORREO3@DOMINIO.COM',1,'2018-02-08 19:33:17','1234567890',2),(4,'yyyyy','yy','yy','yyy',0,'2018-02-13 19:51:39','JL101295',2);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `idSistema` int(11) NOT NULL,
  PRIMARY KEY (`idRol`,`idSistema`),
  KEY `fk_Rol_Sistema1_idx` (`idSistema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador',1),(2,'Administrador',3);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roltarea`
--

DROP TABLE IF EXISTS `roltarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roltarea` (
  `idTarea` int(11) NOT NULL,
  `idMenu` int(11) NOT NULL,
  `idSistema` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  PRIMARY KEY (`idTarea`,`idMenu`,`idSistema`,`idRol`),
  KEY `fk_RolTarea_Rol1_idx` (`idRol`,`idSistema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roltarea`
--

LOCK TABLES `roltarea` WRITE;
/*!40000 ALTER TABLE `roltarea` DISABLE KEYS */;
INSERT INTO `roltarea` VALUES (1,1,1,1),(2,1,1,1),(3,1,1,1),(4,1,1,1),(5,2,1,1),(6,2,1,1),(7,4,3,2);
/*!40000 ALTER TABLE `roltarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida`
--

DROP TABLE IF EXISTS `salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salida` (
  `idSalida` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estatus` int(11) NOT NULL,
  `usuCve` varchar(200) NOT NULL,
  `fecMod` datetime NOT NULL,
  `Articulo_idArticulo` int(11) NOT NULL,
  `Inventario_idInventario` int(11) NOT NULL,
  PRIMARY KEY (`idSalida`),
  KEY `fk_Entrada_Articulo1_idx` (`Articulo_idArticulo`),
  KEY `fk_Entrada_Inventario1_idx` (`Inventario_idInventario`),
  CONSTRAINT `fk_Entrada_Articulo10` FOREIGN KEY (`Articulo_idArticulo`) REFERENCES `articulo` (`id_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entrada_Inventario10` FOREIGN KEY (`Inventario_idInventario`) REFERENCES `inventario` (`id_inventario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida`
--

LOCK TABLES `salida` WRITE;
/*!40000 ALTER TABLE `salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema`
--

DROP TABLE IF EXISTS `sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema` (
  `idSistema` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `estatus` int(11) NOT NULL,
  `usuCve` varchar(200) NOT NULL,
  `fecMod` datetime NOT NULL,
  PRIMARY KEY (`idSistema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema`
--

LOCK TABLES `sistema` WRITE;
/*!40000 ALTER TABLE `sistema` DISABLE KEYS */;
INSERT INTO `sistema` VALUES (1,'Latido Configuracion','Sistema Interno de Latido ',1,'JL101295','2018-01-24 00:00:00'),(2,'SISTEMA 2','ESTA ES LA DESCRIPCION DEL SISTEMA 2',1,'1234567890','2018-02-08 06:28:12'),(3,'Mentes con Alas','Comunidad de Vida para Adultos con Parálisis Cerebral',1,'GC160619','2018-02-08 06:28:12');
/*!40000 ALTER TABLE `sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea`
--

DROP TABLE IF EXISTS `tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea` (
  `idTarea` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `urlAyuda` varchar(200) DEFAULT NULL,
  `usuCve` varchar(200) NOT NULL,
  `fecMod` datetime NOT NULL,
  `idMenu` int(11) NOT NULL,
  `idSistema` int(11) NOT NULL,
  PRIMARY KEY (`idTarea`,`idMenu`,`idSistema`),
  KEY `fk_Tarea_Menu1_idx` (`idMenu`,`idSistema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea`
--

LOCK TABLES `tarea` WRITE;
/*!40000 ALTER TABLE `tarea` DISABLE KEYS */;
INSERT INTO `tarea` VALUES (1,'Catalogo de Sistemas','./latido/infra/system.xhtml','.','GC160619','2019-01-26 00:00:00',1,1),(2,'Catalogo de Usuarios','./latido/infra/users.xhtml','.','GC160619','2019-01-26 00:00:00',1,1),(3,'Catalogo de Roles','./latido/infra/role.xhtml','.','GC160619','2019-01-26 00:00:00',1,1),(4,'Configuracion de Menu','./latido/infra/menuConfig.xhtml','.','GC160619','2019-01-26 00:00:00',1,1),(5,'Roles y Tareas','./security/rolResource.xhtml','.','GC160619','2019-01-26 00:00:00',2,1),(6,'Roles y Usuarios','./security/rolUser.xhtml','.','GC160619','2019-01-26 00:00:00',2,1),(8,'Inicio','http://localhost:8080/MentesAlasWeb/inicio.jsp','-','GC160619','2019-01-26 00:00:00',3,3),(9,'Usuarios','http://localhost:8080/MentesAlasWeb/infraestructura/usuarios','.','GC160619','2019-01-26 00:00:00',4,3),(10,'Roles','http://localhost:8080/MentesAlasWeb/infraestructura/roles','.','GC160619','2019-01-26 00:00:00',4,3),(11,'Usuarios y Roles','http://localhost:8080/MentesAlasWeb/infraestructura/userrole','.','GC160619','2019-01-26 00:00:00',4,3),(12,'Roles y Tareas','http://localhost:8080/MentesAlasWeb/infraestructura/rolefunction','.','GC160619','2019-01-26 00:00:00',4,3),(13,'Multivaluada','http://localhost:8080/MentesAlasWeb/infraestructura/multivaluada','.','GC160619','2019-01-26 00:00:00',4,3),(14,'Medico','http://localhost:8080/MentesAlasWeb/infraestructura/medico','.','GC160619','2019-01-26 00:00:00',4,3),(15,'Registro de Prospecto','http://localhost:8080/MentesAlasWeb/expedientes','.','GC160619','2019-01-26 00:00:00',5,3),(16,'Agenda de Entrevista','http://localhost:8080/MentesAlasWeb/agenda','.','GC160619','2019-01-26 00:00:00',5,3),(17,'Entrevista Inicial','http://localhost:8080/MentesAlasWeb/entini','.','GC160619','2019-01-26 00:00:00',5,3),(18,'Estudio Socioeconomico','http://localhost:8080/MentesAlasWeb/faces/expediente/estudioSocioeconomico.jsp','.','GC160619','2019-01-26 00:00:00',5,3),(19,'Registro de Integracion','http://localhost:8080/MentesAlasWeb/faces/expediente/registroIntegrante.jsp','.','GC160619','2019-01-26 00:00:00',5,3),(20,'Historial Clinica','http://localhost:8080/MentesAlasWeb/faces/expediente/historiaClinica.jsp','.','GC160619','2019-01-26 00:00:00',5,3),(21,'Control de Asistencia','http://localhost:8080/MentesAlasWeb/conasi.jsp','.','GC160619','2019-01-26 00:00:00',3,3),(22,'Terapia Psicologica Grupal','http://localhost:8080/MentesAlasWeb/Psicologia/psigrup','.','GC160619','2019-01-26 00:00:00',6,3),(23,'Terapia Psicologica Individual','http://localhost:8080/MentesAlasWeb/Psicologia/psiindi','.','GC160619','2019-01-26 00:00:00',6,3),(24,'Atencion Especializada','http://localhost:8080/MentesAlasWeb/Psicologia/ateesp','.','GC160619','2019-01-26 00:00:00',6,3),(25,'Atencion y Seguimiento Familiar','http://localhost:8080/MentesAlasWeb/Psicologia/seguifam','.','GC160619','2019-01-26 00:00:00',6,3),(26,'Servicio de Enfermeria','http://localhost:8080/MentesAlasWeb/rehabilitacion/enfserv','.','GC160619','2019-01-26 00:00:00',7,3),(27,'Consulta Medica','http://localhost:8080/MentesAlasWeb/rehabilitacion/atencionMedica','.','GC160619','2019-01-26 00:00:00',7,3),(28,'Historial Clinica Medica','http://localhost:8080/MentesAlasWeb/rehabilitacion/fichaMedica','.','GC160619','2019-01-26 00:00:00',7,3),(29,'Fisioterapia','http://localhost:8080/MentesAlasWeb/rehabilitacion/fisio','.','GC160619','2019-01-26 00:00:00',7,3),(30,'Alternativas de Rehabilitacion','http://localhost:8080/MentesAlasWeb/rehabilitacion/alterna','.','GC160619','2019-01-26 00:00:00',7,3),(31,'Fonoaudiologia','http://localhost:8080/MentesAlasWeb/rehabilitacion/fono','.','GC160619','2019-01-26 00:00:00',7,3),(32,'Servicios de Laboratorio','http://localhost:8080/MentesAlasWeb/rehabilitacion/lab','.','GC160619','2019-01-26 00:00:00',7,3),(33,'Registro','http://localhost:8080/MentesAlasWeb/desarrollo/deshab','.','GC160619','2019-01-26 00:00:00',8,3),(34,'Evaluacion','http://localhost:8080/MentesAlasWeb/desarrollo/evaprog','.','GC160619','2019-01-26 00:00:00',8,3),(35,'Catalogo de Preguntas','http://localhost:8080/MentesAlasWeb/pregunta','.','GC160619','2019-01-26 00:00:00',9,3),(36,'Asociar Respuestas a Preguntas','http://localhost:8080/MentesAlasWeb/preguntaRespuesta','.','GC160619','2019-01-26 00:00:00',9,3),(37,'Registro de Programas','http://localhost:8080/MentesAlasWeb/programa','.','GC160619','2019-01-26 00:00:00',9,3),(38,'Asociar Preguntas a Programas','http://localhost:8080/MentesAlasWeb/preg_prog.jsp','.','GC160619','2019-01-26 00:00:00',9,3),(39,'Evaluacion','http://localhost:8080/MentesAlasWeb/evalprog.jsp','.','GC160619','2019-01-26 00:00:00',9,3),(40,'Configuracion de Encuestas','http://localhost:8080/MentesAlasWeb/evaluacion360/configuracion.jsp','.','GC160619','2019-01-26 00:00:00',10,3),(41,'Encuesta Evaluacio 360º','http://localhost:8080/MentesAlasWeb/evaluacion360/encuesta.jsp','.','GC160619','2019-01-26 00:00:00',10,3),(42,'Editar Encuesta Evaluacion 360º','http://localhost:8080/MentesAlasWeb/evaluacion360/editarEncuesta.xhtml','.','GC160619','2019-01-26 00:00:00',10,3),(43,'A la Direcion General','http://localhost:8080/MentesAlasWeb/tressesenta/dirgen','.','GC160619','2019-01-26 00:00:00',10,3),(44,'A Personal Operativo y Administrativo','http://localhost:8080/MentesAlasWeb/tressesenta/peopad','.','GC160619','2019-01-26 00:00:00',10,3),(45,'A consejeros','http://localhost:8080/MentesAlasWeb/tressesenta/conse','.','GC160619','2019-01-26 00:00:00',10,3),(46,'A las Coordinaciones','http://localhost:8080/MentesAlasWeb/tressesenta/coordi','.','GC160619','2019-01-26 00:00:00',10,3),(47,'A la Coordinacion de Voluntariado','http://localhost:8080/MentesAlasWeb/tressesenta/coovol','.','GC160619','2019-01-26 00:00:00',10,3),(48,'A Voluntariado','http://localhost:8080/MentesAlasWeb/tressesenta/volu','.','GC160619','2019-01-26 00:00:00',10,3),(49,'De Integrantes a Mentes con Alas','http://localhost:8080/MentesAlasWeb/tressesenta/intmen','.','GC160619','2019-01-26 00:00:00',10,3),(50,'De Familias a Mentes con Alas','http://localhost:8080/MentesAlasWeb/tressesenta/fammen','.','GC160619','2019-01-26 00:00:00',10,3),(51,'Proyectos','http://localhost:8080/MentesAlasWeb/proyecto','.','GC160619','2019-01-26 00:00:00',3,3);
/*!40000 ALTER TABLE `tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidoPaterno` varchar(100) NOT NULL,
  `apellidoMaterno` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `avatar` blob,
  `estatus` int(11) NOT NULL,
  `usuCve` varchar(200) NOT NULL,
  `fecMod` datetime NOT NULL,
  `idSistema` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`,`idSistema`),
  KEY `fk_Usuario_Sistema1_idx` (`idSistema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'JL101295','Jose Luis','Chavez','Alvarado','202cb962ac59075b964b07152d234b70',NULL,1,'JL101295','2018-01-24 00:00:00',1),(2,'GC160619','Gustavo','Cardenas','Alba','2a16708bd0960f8b215500a426764077',NULL,1,'JL101295','2018-01-24 00:00:00',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usurol`
--

DROP TABLE IF EXISTS `usurol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usurol` (
  `idSistema` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  PRIMARY KEY (`idSistema`,`idUsuario`,`idRol`),
  KEY `fk_UsuRol_Rol1_idx` (`idRol`,`idSistema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usurol`
--

LOCK TABLES `usurol` WRITE;
/*!40000 ALTER TABLE `usurol` DISABLE KEYS */;
INSERT INTO `usurol` VALUES (1,2,1),(3,2,2);
/*!40000 ALTER TABLE `usurol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_articulo_categoria`
--

DROP TABLE IF EXISTS `view_articulo_categoria`;
/*!50001 DROP VIEW IF EXISTS `view_articulo_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_articulo_categoria` AS SELECT 
 1 AS `id_categoria`,
 1 AS `nombre`,
 1 AS `estatus`,
 1 AS `fecMod`,
 1 AS `usuCve`,
 1 AS `Articulo_idArticulo`,
 1 AS `Categoria_idCategoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_articulo_proveedor`
--

DROP TABLE IF EXISTS `view_articulo_proveedor`;
/*!50001 DROP VIEW IF EXISTS `view_articulo_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_articulo_proveedor` AS SELECT 
 1 AS `id_proveedor`,
 1 AS `nombre`,
 1 AS `telefono`,
 1 AS `direccion`,
 1 AS `correo`,
 1 AS `estatus`,
 1 AS `fecMod`,
 1 AS `usuCve`,
 1 AS `Sistema_idSistema`,
 1 AS `apr_id`,
 1 AS `Proveedor_idProveedor`,
 1 AS `Articulo_idArticulo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vusuarioasignacion`
--

DROP TABLE IF EXISTS `vusuarioasignacion`;
/*!50001 DROP VIEW IF EXISTS `vusuarioasignacion`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vusuarioasignacion` AS SELECT 
 1 AS `id_random`,
 1 AS `clave`,
 1 AS `nombre_completo`,
 1 AS `idRol`,
 1 AS `rol_nombre`,
 1 AS `idSistema`,
 1 AS `sis_nombre`,
 1 AS `idTarea`,
 1 AS `tar_nombre`,
 1 AS `idMenu`,
 1 AS `men_nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_articulo_categoria`
--

/*!50001 DROP VIEW IF EXISTS `view_articulo_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_articulo_categoria` AS select `cat`.`id_categoria` AS `id_categoria`,`cat`.`nombre` AS `nombre`,`cat`.`estatus` AS `estatus`,`cat`.`fecMod` AS `fecMod`,`cat`.`usuCve` AS `usuCve`,`aca`.`Articulo_idArticulo` AS `Articulo_idArticulo`,`aca`.`Categoria_idCategoria` AS `Categoria_idCategoria` from (`categoria` `cat` join `articulocategoria` `aca` on((`cat`.`id_categoria` = `aca`.`Categoria_idCategoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_articulo_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `view_articulo_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_articulo_proveedor` AS select `pro`.`id_proveedor` AS `id_proveedor`,`pro`.`nombre` AS `nombre`,`pro`.`telefono` AS `telefono`,`pro`.`direccion` AS `direccion`,`pro`.`correo` AS `correo`,`pro`.`estatus` AS `estatus`,`pro`.`fecMod` AS `fecMod`,`pro`.`usuCve` AS `usuCve`,`pro`.`Sistema_idSistema` AS `Sistema_idSistema`,`apr`.`apr_id` AS `apr_id`,`apr`.`Proveedor_idProveedor` AS `Proveedor_idProveedor`,`apr`.`Articulo_idArticulo` AS `Articulo_idArticulo` from (`proveedor` `pro` join `articuloproveedor` `apr` on((`apr`.`Proveedor_idProveedor` = `pro`.`id_proveedor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vusuarioasignacion`
--

/*!50001 DROP VIEW IF EXISTS `vusuarioasignacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vusuarioasignacion` AS select cast(hex(random_bytes(32)) as char charset utf8) AS `id_random`,`usu`.`clave` AS `clave`,concat(concat(concat(concat(`usu`.`nombre`,' '),`usu`.`apellidoPaterno`),' '),`usu`.`apellidoMaterno`) AS `nombre_completo`,`rol`.`idRol` AS `idRol`,`rol`.`nombre` AS `rol_nombre`,`sis`.`idSistema` AS `idSistema`,`sis`.`nombre` AS `sis_nombre`,`tar`.`idTarea` AS `idTarea`,`tar`.`nombre` AS `tar_nombre`,`men`.`idMenu` AS `idMenu`,`men`.`etiqueta` AS `men_nombre` from ((((((`usuario` `usu` left join `usurol` `ur` on((`ur`.`idUsuario` = `usu`.`idUsuario`))) left join `rol` on((`rol`.`idRol` = `ur`.`idRol`))) left join `sistema` `sis` on((`sis`.`idSistema` = `rol`.`idSistema`))) left join `roltarea` `rt` on(((`rt`.`idRol` = `rol`.`idRol`) and (`rt`.`idSistema` = `rol`.`idSistema`)))) left join `tarea` `tar` on(((`tar`.`idTarea` = `rt`.`idTarea`) and (`tar`.`idSistema` = `rol`.`idSistema`)))) left join `menu` `men` on(((`men`.`idMenu` = `rt`.`idMenu`) and (`men`.`idSistema` = `rol`.`idSistema`)))) */;
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

-- Dump completed on 2019-02-16 12:48:47
