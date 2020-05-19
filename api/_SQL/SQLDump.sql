-- MySQL Script generated by MySQL Workbench
-- Mon May 18 23:08:14 2020
-- Model: New Model    Version: 1.0
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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`quakechampions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`quakechampions` ;

CREATE TABLE IF NOT EXISTS `mydb`.`quakechampions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(64) NOT NULL,
  `player1` VARCHAR(48) NOT NULL,
  `player2` VARCHAR(48) NOT NULL,
  `bestof` INT(1) NOT NULL DEFAULT 3,
  `decider` INT(1) NOT NULL DEFAULT 1,
  `format` INT(1) NOT NULL DEFAULT 0,
  `map_ban_1` INT(2) NOT NULL DEFAULT 0,
  `map_ban_2` INT(2) NOT NULL DEFAULT 0,
  `map_pick_1` INT(2) NOT NULL DEFAULT 0,
  `map_pick_2` INT(2) NOT NULL DEFAULT 0,
  `map_pick_3` INT(2) NOT NULL DEFAULT 0,
  `map_pick_4` INT(2) NOT NULL DEFAULT 0,
  `map_ban_3` INT(2) NOT NULL DEFAULT 0,
  `map_ban_4` INT(2) NOT NULL DEFAULT 0,
  `champ_ban_1` INT(2) NOT NULL DEFAULT 0,
  `champ_pick_1` INT(2) NOT NULL DEFAULT 0,
  `champ_pick_2` INT(2) NOT NULL DEFAULT 0,
  `champ_ban_2` INT(2) NOT NULL DEFAULT 0,
  `champ_pick_3` INT(2) NOT NULL DEFAULT 0,
  `champ_pick_4` INT(2) NOT NULL DEFAULT 0,
  `champ_ban_3` INT(2) NOT NULL DEFAULT 0,
  `champ_pick_5` INT(2) NOT NULL DEFAULT 0,
  `champ_pick_6` INT(2) NOT NULL DEFAULT 0,
  `champ_ban_4` INT(2) NOT NULL DEFAULT 0,
  `champ_pick_7` INT(2) NOT NULL DEFAULT 0,
  `champ_pick_8` INT(2) NOT NULL DEFAULT 0,
  `champ_ban_5` INT(2) NOT NULL DEFAULT 0,
  `champ_pick_9` INT(2) NOT NULL DEFAULT 0,
  `champ_pick_10` INT(2) NOT NULL DEFAULT 0,
  `password` VARCHAR(45) NOT NULL DEFAULT 'yousuck',
  `updated` INT NOT NULL DEFAULT 0,
  `finished` INT(1) NOT NULL DEFAULT 0,
  `datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `uuid`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`quakechampions_chat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`quakechampions_chat` ;

CREATE TABLE IF NOT EXISTS `mydb`.`quakechampions_chat` (
  `q_id` INT NOT NULL AUTO_INCREMENT,
  `q_uuid` VARCHAR(64) NOT NULL,
  `q_player` VARCHAR(48) NOT NULL,
  `q_message` BLOB(2000) NOT NULL,
  `q_datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`q_id`),
  UNIQUE INDEX `idquakechampions_chat_UNIQUE` (`q_id` ASC),
  INDEX `fk_quakechampions_chat_quakechampions_idx` (`q_uuid` ASC),
  CONSTRAINT `fk_quakechampions_chat_quakechampions`
    FOREIGN KEY (`q_uuid`)
    REFERENCES `mydb`.`quakechampions` (`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`quakechampions_matchmaking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`quakechampions_matchmaking` ;

CREATE TABLE IF NOT EXISTS `mydb`.`quakechampions_matchmaking` (
  `m_id` INT NOT NULL AUTO_INCREMENT,
  `m_alias` VARCHAR(64) NOT NULL,
  `m_name` VARCHAR(45) NOT NULL DEFAULT 'rapha',
  `m_skillrating` INT(5) NOT NULL DEFAULT 1350,
  `m_region` VARCHAR(4) NOT NULL DEFAULT 'NA',
  `m_updated` INT NOT NULL DEFAULT 0,
  `m_datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `m_id_UNIQUE` (`m_id` ASC),
  PRIMARY KEY (`m_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`quakechampions_grindr`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`quakechampions_grindr` ;

CREATE TABLE IF NOT EXISTS `mydb`.`quakechampions_grindr` (
  `g_id` INT NOT NULL AUTO_INCREMENT,
  `g_player1` VARCHAR(45) NOT NULL,
  `g_player2` VARCHAR(45) NOT NULL,
  `g_serial` INT(6) NOT NULL DEFAULT 000000,
  `g_datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`g_id`),
  UNIQUE INDEX `g_id_UNIQUE` (`g_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`quakechampions_reserved`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`quakechampions_reserved` ;

CREATE TABLE IF NOT EXISTS `mydb`.`quakechampions_reserved` (
  `r_id` INT NOT NULL AUTO_INCREMENT,
  `r_name` VARCHAR(45) NOT NULL,
  `r_pin` VARCHAR(4) NOT NULL,
  `r_datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`r_id`),
  UNIQUE INDEX `r_UNIQUE` (`r_id` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
