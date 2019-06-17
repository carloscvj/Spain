-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Spain
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Spain
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Spain` DEFAULT CHARACTER SET utf8 ;
USE `Spain` ;

-- -----------------------------------------------------
-- Table `Spain`.`Regiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spain`.`Regiones` (
  `idRegion` INT NOT NULL,
  `Region` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`idRegion`),
  UNIQUE INDEX `idRegiones_UNIQUE` (`idRegion` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spain`.`Provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spain`.`Provincias` (
  `idProvincia` INT NOT NULL,
  `Provincia` VARCHAR(32) NOT NULL,
  `Regiones_idRegion` INT NOT NULL,
  PRIMARY KEY (`idProvincia`),
  UNIQUE INDEX `idProvincia_UNIQUE` (`idProvincia` ASC),
  INDEX `fk_Provincias_Regiones1_idx` (`Regiones_idRegion` ASC),
  CONSTRAINT `fk_Provincias_Regiones1`
    FOREIGN KEY (`Regiones_idRegion`)
    REFERENCES `Spain`.`Regiones` (`idRegion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spain`.`Municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spain`.`Municipios` (
  `idMunicipio` INT NOT NULL,
  `Municipio` VARCHAR(64) NOT NULL,
  `Provincias_idProvincia` INT NOT NULL,
  PRIMARY KEY (`idMunicipio`),
  UNIQUE INDEX `idMunicipio_UNIQUE` (`idMunicipio` ASC),
  INDEX `fk_Municipios_Provincias_idx` (`Provincias_idProvincia` ASC),
  CONSTRAINT `fk_Municipios_Provincias`
    FOREIGN KEY (`Provincias_idProvincia`)
    REFERENCES `Spain`.`Provincias` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
