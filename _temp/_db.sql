-- MySQL Script generated by MySQL Workbench
-- 10/10/15 01:28:30
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema armitxes
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `armitxes` ;

-- -----------------------------------------------------
-- Schema armitxes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `armitxes` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `armitxes` ;

-- -----------------------------------------------------
-- Table `armitxes`.`accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `armitxes`.`accounts` ;

CREATE TABLE IF NOT EXISTS `armitxes`.`accounts` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `uname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `passwd` VARCHAR(60) NOT NULL,
  `staff_rank` INT(8) NOT NULL DEFAULT 0,
  `donations` DECIMAL(35,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `banned` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `armitxes`.`projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `armitxes`.`projects` ;

CREATE TABLE IF NOT EXISTS `armitxes`.`projects` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `armitxes`.`rights`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `armitxes`.`rights` ;

CREATE TABLE IF NOT EXISTS `armitxes`.`rights` (
  `web_accounts_id` INT UNSIGNED NOT NULL,
  `projects_id` INT UNSIGNED NOT NULL,
  `rank` INT(8) UNSIGNED NOT NULL DEFAULT 0,
  INDEX `fk_rights_web_accounts_idx` (`web_accounts_id` ASC),
  INDEX `fk_rights_projects1_idx` (`projects_id` ASC),
  CONSTRAINT `fk_rights_web_accounts`
    FOREIGN KEY (`web_accounts_id`)
    REFERENCES `armitxes`.`accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rights_projects1`
    FOREIGN KEY (`projects_id`)
    REFERENCES `armitxes`.`projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `armitxes`.`AL_groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `armitxes`.`AL_groups` ;

CREATE TABLE IF NOT EXISTS `armitxes`.`AL_groups` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `type` INT(7) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `armitxes`.`AL_accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `armitxes`.`AL_accounts` ;

CREATE TABLE IF NOT EXISTS `armitxes`.`AL_accounts` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `web_id` INT UNSIGNED NULL,
  `pid` VARCHAR(30) NOT NULL,
  `bank` INT(80) UNSIGNED NOT NULL DEFAULT 350,
  `cash` INT(80) UNSIGNED NOT NULL DEFAULT 50,
  `inventory` TEXT NULL,
  `licenses` VARCHAR(60) NULL DEFAULT '[]',
  `position` VARCHAR(30) NOT NULL DEFAULT '[0,0,0]',
  `nation` INT(4) UNSIGNED NOT NULL DEFAULT 0,
  `faction` INT(8) UNSIGNED NOT NULL DEFAULT 0,
  `rank` INT(8) UNSIGNED NOT NULL DEFAULT 0,
  `bounty` INT(20) UNSIGNED NOT NULL DEFAULT 0,
  `nutrition` INT(7) UNSIGNED NOT NULL DEFAULT 100,
  `vip` INT(4) UNSIGNED NOT NULL DEFAULT 0,
  `name` VARCHAR(45) NOT NULL,
  `group` INT UNSIGNED NOT NULL,
  `online` CHAR(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_AL_accounts_web_accounts1_idx` (`web_id` ASC),
  UNIQUE INDEX `web_id_UNIQUE` (`web_id` ASC),
  INDEX `fk_AL_accounts_groups1_idx` (`group` ASC),
  UNIQUE INDEX `pid_UNIQUE` (`pid` ASC),
  CONSTRAINT `fk_AL_accounts_web_accounts1`
    FOREIGN KEY (`web_id`)
    REFERENCES `armitxes`.`accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AL_accounts_groups1`
    FOREIGN KEY (`group`)
    REFERENCES `armitxes`.`AL_groups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `armitxes`.`AL_storages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `armitxes`.`AL_storages` ;

CREATE TABLE IF NOT EXISTS `armitxes`.`AL_storages` (
  `AL_account` INT UNSIGNED NOT NULL,
  `storage` TEXT NULL,
  PRIMARY KEY (`AL_account`),
  UNIQUE INDEX `AL_account_UNIQUE` (`AL_account` ASC),
  CONSTRAINT `fk_storages_AL_accounts1`
    FOREIGN KEY (`AL_account`)
    REFERENCES `armitxes`.`AL_accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `armitxes`.`AL_garages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `armitxes`.`AL_garages` ;

CREATE TABLE IF NOT EXISTS `armitxes`.`AL_garages` (
  `AL_account` INT UNSIGNED NOT NULL,
  `garage` TEXT NULL,
  PRIMARY KEY (`AL_account`),
  CONSTRAINT `fk_garages_AL_accounts1`
    FOREIGN KEY (`AL_account`)
    REFERENCES `armitxes`.`AL_accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `armitxes`.`AL_server_vars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `armitxes`.`AL_server_vars` ;

CREATE TABLE IF NOT EXISTS `armitxes`.`AL_server_vars` (
  `var_name` VARCHAR(20) NOT NULL,
  `var_value` TEXT NULL,
  PRIMARY KEY (`var_name`),
  UNIQUE INDEX `var_name_UNIQUE` (`var_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `armitxes`.`web_changelogs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `armitxes`.`web_changelogs` ;

CREATE TABLE IF NOT EXISTS `armitxes`.`web_changelogs` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `author` INT UNSIGNED NOT NULL,
  `project` INT UNSIGNED NOT NULL DEFAULT 0,
  `date` DATE NOT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `content` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_changelogs_web_accounts1_idx` (`author` ASC),
  INDEX `fk_changelogs_projects1_idx` (`project` ASC),
  CONSTRAINT `fk_changelogs_web_accounts1`
    FOREIGN KEY (`author`)
    REFERENCES `armitxes`.`accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_changelogs_projects1`
    FOREIGN KEY (`project`)
    REFERENCES `armitxes`.`projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `armitxes`.`web_banner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `armitxes`.`web_banner` ;

CREATE TABLE IF NOT EXISTS `armitxes`.`web_banner` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(16) NULL DEFAULT NULL,
  `text` VARCHAR(128) NULL DEFAULT NULL,
  `href` VARCHAR(45) NULL DEFAULT NULL,
  `visible` CHAR(0) NULL DEFAULT NULL,
  `image` VARCHAR(45) NULL DEFAULT NULL,
  `width` INT(12) NULL DEFAULT NULL,
  `height` INT(12) NULL DEFAULT NULL,
  `margin` INT(12) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;

USE `armitxes` ;

-- -----------------------------------------------------
-- procedure getALPlayer
-- -----------------------------------------------------

USE `armitxes`;
DROP procedure IF EXISTS `armitxes`.`getALPlayer`;

DELIMITER $$
USE `armitxes`$$
CREATE PROCEDURE `getALPlayer` ( IN pid VARCHAR(30) )
BEGIN
	SELECT
		acc.id, acc.bank, acc.cash, acc.inventory,
        acc.licenses, acc.position, acc.nation,
        acc.faction, acc.rank, acc.bounty, acc.nutrition,
        rights.rank as admin, acc.vip, acc.name, groups.name
    FROM AL_accounts as acc, rights, groups
    WHERE rights.projects_id = acc.id AND rights.projects_id = 2;
END
$$

DELIMITER ;
SET SQL_MODE = '';
GRANT USAGE ON *.* TO AL_Server;
 DROP USER AL_Server;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'AL_Server' IDENTIFIED BY '$2y$10$azGmcvi9L9WA8jzoLscNx.7JinQruCmwm6HSEIUpvLqwrweIbLGsq';

GRANT EXECUTE ON procedure `armitxes`.`getALPlayer` TO 'AL_Server';
SET SQL_MODE = '';
GRANT USAGE ON *.* TO webserver;
 DROP USER webserver;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'webserver';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
