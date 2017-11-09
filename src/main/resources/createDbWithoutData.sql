-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema petrol
-- -----------------------------------------------------
-- Shema for my petrol application
DROP SCHEMA IF EXISTS `petrol` ;

-- -----------------------------------------------------
-- Schema petrol
--
-- Shema for my petrol application
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `petrol` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `petrol` ;

-- -----------------------------------------------------
-- Table `petrol`.`Companies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petrol`.`Companies` ;

CREATE TABLE IF NOT EXISTS `petrol`.`Companies` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petrol`.`Gas_stations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petrol`.`Gas_stations` ;

CREATE TABLE IF NOT EXISTS `petrol`.`Gas_stations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` INT UNSIGNED NOT NULL,
  `code` VARCHAR(45) NOT NULL,
  `address` VARCHAR(99) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_gas_station_Company1_idx` (`company_id` ASC),
  CONSTRAINT `fk_gas_station_Company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `petrol`.`Companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Information about gas stations';


-- -----------------------------------------------------
-- Table `petrol`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petrol`.`Orders` ;

CREATE TABLE IF NOT EXISTS `petrol`.`Orders` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `gas_station_id` INT UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  `gas_type` VARCHAR(45) NOT NULL,
  `cost_per_liter` DECIMAL(5,2) UNSIGNED NOT NULL,
  `discount` DECIMAL(5,2) UNSIGNED NULL,
  `amount_liters` DECIMAL(5,3) UNSIGNED NOT NULL,
  `total_cost` DECIMAL(6,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_gas_station_idx` (`gas_station_id` ASC),
  CONSTRAINT `fk_order_gas_station`
    FOREIGN KEY (`gas_station_id`)
    REFERENCES `petrol`.`Gas_stations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Information about order from the check';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

