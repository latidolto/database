-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lto_news
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lto_news
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lto_news` DEFAULT CHARACTER SET latin1 ;
USE `lto_news` ;

-- -----------------------------------------------------
-- Table `lto_news`.`red_social`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`red_social` (
  `rso_id` INT(11) NOT NULL,
  `rso_facebook` VARCHAR(45) NULL DEFAULT NULL,
  `rso_twitter` VARCHAR(45) NULL DEFAULT NULL,
  `rso_instagram` VARCHAR(45) NULL DEFAULT NULL,
  `rso_google` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`rso_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`autor` (
  `aut_id` INT(11) NOT NULL,
  `aut_nombre` VARCHAR(60) NOT NULL,
  `rso_id` INT(11) NOT NULL,
  `aut_descripcion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`aut_id`),
  INDEX `AUTRSOFK_idx` (`rso_id` ASC),
  CONSTRAINT `AUTRSOFK`
    FOREIGN KEY (`rso_id`)
    REFERENCES `lto_news`.`red_social` (`rso_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`categoria` (
  `cat_id` INT(11) NOT NULL,
  `cat_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cat_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`noticia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`noticia` (
  `not_id` INT(11) NOT NULL,
  `aut_id` INT(11) NOT NULL,
  `not_titulo` VARCHAR(60) NOT NULL,
  `not_subtitulo` VARCHAR(45) NOT NULL,
  `not_fecha` DATE NOT NULL,
  `not_visitas` VARCHAR(45) NULL DEFAULT NULL,
  `not_contenido` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`not_id`),
  INDEX `NOTAUTFK_idx` (`aut_id` ASC),
  CONSTRAINT `NOTAUTFK`
    FOREIGN KEY (`aut_id`)
    REFERENCES `lto_news`.`autor` (`aut_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`usuario` (
  `usu_id` INT(11) NOT NULL,
  `usu_nombre` VARCHAR(45) NOT NULL,
  `usu_correo` VARCHAR(60) NOT NULL,
  `usu_contrasena` VARCHAR(100) NOT NULL,
  `rol_id` INT(11) NOT NULL,
  PRIMARY KEY (`usu_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`comentario` (
  `com_id` INT(11) NOT NULL,
  `com_noticia` INT(11) NOT NULL,
  `com_usuario` INT(11) NOT NULL,
  `com_contenido` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`com_id`),
  INDEX `COMUSUFK_idx` (`com_usuario` ASC),
  INDEX `COMNOTFK_idx` (`com_noticia` ASC),
  CONSTRAINT `COMNOTFK`
    FOREIGN KEY (`com_noticia`)
    REFERENCES `lto_news`.`noticia` (`not_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `COMUSUFK`
    FOREIGN KEY (`com_usuario`)
    REFERENCES `lto_news`.`usuario` (`usu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`contacto` (
  `con_id` INT(11) NOT NULL,
  `con_titulo` VARCHAR(45) NOT NULL,
  `con_descripcion` VARCHAR(100) NULL DEFAULT NULL,
  `con_direccion` VARCHAR(100) NOT NULL,
  `con_lat` DOUBLE NOT NULL,
  `con_lon` DOUBLE NOT NULL,
  `con_correo` VARCHAR(60) NOT NULL,
  `con_telefono` VARCHAR(45) NULL DEFAULT NULL,
  `rso_id` INT(11) NOT NULL,
  PRIMARY KEY (`con_id`),
  INDEX `CONREDFK_idx` (`rso_id` ASC),
  CONSTRAINT `CONREDFK`
    FOREIGN KEY (`rso_id`)
    REFERENCES `lto_news`.`red_social` (`rso_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`imagen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`imagen` (
  `img_id` INT(11) NOT NULL,
  `img_descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`img_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`noticia_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`noticia_categoria` (
  `nct_id` INT(11) NOT NULL,
  `cat_id` INT(11) NOT NULL,
  `not_id` INT(11) NOT NULL,
  PRIMARY KEY (`nct_id`),
  INDEX `NCANOTFK_idx` (`not_id` ASC),
  INDEX `NCACATFK_idx` (`cat_id` ASC),
  CONSTRAINT `NCACATFK`
    FOREIGN KEY (`cat_id`)
    REFERENCES `lto_news`.`categoria` (`cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `NCANOTFK`
    FOREIGN KEY (`not_id`)
    REFERENCES `lto_news`.`noticia` (`not_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`noticia_imagen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`noticia_imagen` (
  `nim_id` INT(11) NOT NULL,
  `nim_imagen` INT(11) NOT NULL,
  `nim_noticia` INT(11) NOT NULL,
  PRIMARY KEY (`nim_id`),
  INDEX `NIMNOTFK_idx` (`nim_noticia` ASC),
  INDEX `NIMIMGFK_idx` (`nim_imagen` ASC),
  CONSTRAINT `NIMIMGFK`
    FOREIGN KEY (`nim_imagen`)
    REFERENCES `lto_news`.`imagen` (`img_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `NIMNOTFK`
    FOREIGN KEY (`nim_noticia`)
    REFERENCES `lto_news`.`noticia` (`not_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`tag` (
  `tag_id` INT(11) NOT NULL,
  `tag_descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`noticia_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`noticia_tag` (
  `nta_id` INT(11) NOT NULL,
  `tag_id` INT(11) NOT NULL,
  `not_id` INT(11) NOT NULL,
  PRIMARY KEY (`nta_id`),
  INDEX `NTAGNOTFK_idx` (`not_id` ASC),
  INDEX `NTAGTAGFK_idx` (`tag_id` ASC),
  CONSTRAINT `NTAGNOTFK`
    FOREIGN KEY (`not_id`)
    REFERENCES `lto_news`.`noticia` (`not_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `NTAGTAGFK`
    FOREIGN KEY (`tag_id`)
    REFERENCES `lto_news`.`tag` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`opinion_comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`opinion_comentario` (
  `oco_id` INT(11) NOT NULL,
  `com_id` INT(11) NOT NULL,
  `oco_opinion` VARCHAR(300) NULL DEFAULT NULL,
  `usu_id` INT(11) NOT NULL,
  PRIMARY KEY (`oco_id`),
  INDEX `OCOUSUFK_idx` (`usu_id` ASC),
  INDEX `OCOCOMFK_idx` (`com_id` ASC),
  CONSTRAINT `OCOCOMFK`
    FOREIGN KEY (`com_id`)
    REFERENCES `lto_news`.`comentario` (`com_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OCOUSUFK`
    FOREIGN KEY (`usu_id`)
    REFERENCES `lto_news`.`usuario` (`usu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`rol` (
  `rol_id` INT(11) NOT NULL,
  `rol_descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rol_id`),
  CONSTRAINT `ROLUSUFK`
    FOREIGN KEY (`rol_id`)
    REFERENCES `lto_news`.`usuario` (`usu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lto_news`.`sesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lto_news`.`sesion` (
  `ses_id` VARCHAR(50) NOT NULL,
  `usu_id` INT(11) NOT NULL,
  `ses_fecha` DATETIME NOT NULL,
  PRIMARY KEY (`ses_id`),
  INDEX `USUSESPK_idx` (`usu_id` ASC),
  CONSTRAINT `USUSESPK`
    FOREIGN KEY (`usu_id`)
    REFERENCES `lto_news`.`usuario` (`usu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;