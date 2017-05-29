-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`type_metadata`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`type_metadata` ;

CREATE TABLE IF NOT EXISTS `mydb`.`type_metadata` (
  `id` INT UNSIGNED NOT NULL COMMENT '',
  `type` VARCHAR(45) NOT NULL COMMENT '',
  `required` TINYINT(1) NOT NULL COMMENT '',
  `multiple` TINYINT(1) NOT NULL COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`metadata`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`metadata` ;

CREATE TABLE IF NOT EXISTS `mydb`.`metadata` (
  `id` INT UNSIGNED NOT NULL COMMENT '',
  `value` VARCHAR(45) NOT NULL COMMENT '',
  `typemetadata` INT UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`id`, `typemetadata`)  COMMENT '',
  INDEX `fk_metadata_type_metadata1_idx` (`typemetadata` ASC)  COMMENT '',
  CONSTRAINT `fk_metadata_type_metadata1`
    FOREIGN KEY (`typemetadata`)
    REFERENCES `mydb`.`type_metadata` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`profile` ;

CREATE TABLE IF NOT EXISTS `mydb`.`profile` (
  `id` INT UNSIGNED NOT NULL COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `login` VARCHAR(45) NOT NULL COMMENT '',
  `pass` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type_action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`type_action` ;

CREATE TABLE IF NOT EXISTS `mydb`.`type_action` (
  `id` INT UNSIGNED NOT NULL COMMENT '',
  `value` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`action` ;

CREATE TABLE IF NOT EXISTS `mydb`.`action` (
  `id` INT UNSIGNED NOT NULL COMMENT '',
  `time` TIME(6) NOT NULL COMMENT '',
  `profile` INT UNSIGNED NOT NULL COMMENT '',
  `typeaction` INT UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`id`, `profile`, `typeaction`)  COMMENT '',
  INDEX `fk_action_profile1_idx` (`profile` ASC)  COMMENT '',
  INDEX `fk_action_type_action1_idx` (`typeaction` ASC)  COMMENT '',
  CONSTRAINT `fk_action_profile1`
    FOREIGN KEY (`profile`)
    REFERENCES `mydb`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_action_type_action1`
    FOREIGN KEY (`typeaction`)
    REFERENCES `mydb`.`type_action` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dataset`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`dataset` ;

CREATE TABLE IF NOT EXISTS `mydb`.`dataset` (
  `id` INT UNSIGNED NOT NULL COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `comment` VARCHAR(45) NOT NULL COMMENT '',
  `metadata` INT UNSIGNED NOT NULL COMMENT '',
  `action` INT UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`id`, `action`, `metadata`)  COMMENT '',
  INDEX `fk_dataset_metadata_idx` (`metadata` ASC)  COMMENT '',
  INDEX `fk_dataset_action1_idx` (`action` ASC)  COMMENT '',
  CONSTRAINT `fk_dataset_metadata`
    FOREIGN KEY (`metadata`)
    REFERENCES `mydb`.`metadata` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dataset_action1`
    FOREIGN KEY (`action`)
    REFERENCES `mydb`.`action` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
