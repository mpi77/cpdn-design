-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cpdn-network
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cpdn-network
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cpdn-network` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
-- -----------------------------------------------------
-- Schema cpdn-log
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cpdn-oauth
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cpdn-oauth
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cpdn-oauth` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema cpdn-idp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cpdn-idp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cpdn-idp` ;
USE `cpdn-network` ;

-- -----------------------------------------------------
-- Table `cpdn-network`.`section_calc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-network`.`section_calc` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `current_src_value` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `current_src_phase` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `current_src_ratio` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `current_dst_value` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `current_dst_phase` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `current_dst_ratio` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `power_src_active` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `power_src_reactive` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `power_dst_active` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `power_dst_reactive` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `losses_active` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `losses_reactive` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-network`.`section_spec`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-network`.`section_spec` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `status` ENUM('on', 'off') NULL DEFAULT 'off' COMMENT '',
  `resistance_value` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `resistance_ratio` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `reactance_value` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `reactance_ratio` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `conductance` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `susceptance` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_pri_actual` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_pri_rated` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_sec_actual` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_sec_rated` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_trc_actual` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_trc_rated` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_short_ab` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_short_ac` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_short_bc` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `losses_short_ab` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `losses_short_ac` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `losses_short_bc` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `power_rated_ab` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `power_rated_ac` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `power_rated_bc` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `current_noload` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `losses_noload` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `current_max` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-network`.`scheme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-network`.`scheme` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `description` VARCHAR(45) NULL COMMENT '',
  `version` INT NOT NULL DEFAULT 1 COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-network`.`node_calc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-network`.`node_calc` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `load_active` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `load_reactive` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_drop_kv` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_drop_proc` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_phase` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_value` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-network`.`node_spec`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-network`.`node_spec` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `power_installed` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `power_rated` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_rated` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_level` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_value` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `voltage_phase` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `cos_fi` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `power_active` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `power_reactive` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `reactance_transverse` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `reactance_longitudinal` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `mi` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `lambda_min` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `lambda_max` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-network`.`map_point`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-network`.`map_point` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `x` INT NOT NULL DEFAULT 0 COMMENT '',
  `y` INT NOT NULL DEFAULT 0 COMMENT '',
  `gps_latitude` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `gps_longitude` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `gps_altitude` DOUBLE NULL DEFAULT 0.0 COMMENT '',
  `scheme_id` INT UNSIGNED NOT NULL COMMENT '',
  `node_id` INT UNSIGNED NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_map_point_scheme1_idx` (`scheme_id` ASC)  COMMENT '',
  INDEX `fk_map_point_node1_idx` (`node_id` ASC)  COMMENT '',
  CONSTRAINT `fk_map_point_scheme1`
    FOREIGN KEY (`scheme_id`)
    REFERENCES `cpdn-network`.`scheme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_map_point_node1`
    FOREIGN KEY (`node_id`)
    REFERENCES `cpdn-network`.`node` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-network`.`node`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-network`.`node` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `node_calc_id` INT UNSIGNED NOT NULL COMMENT '',
  `node_spec_id` INT UNSIGNED NOT NULL COMMENT '',
  `scheme_id` INT UNSIGNED NOT NULL COMMENT '',
  `map_point_id` INT UNSIGNED NOT NULL COMMENT '',
  INDEX `fk_node_node_calc1_idx` (`node_calc_id` ASC)  COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_node_node_spec1_idx` (`node_spec_id` ASC)  COMMENT '',
  INDEX `fk_node_scheme1_idx` (`scheme_id` ASC)  COMMENT '',
  INDEX `fk_node_map_point1_idx` (`map_point_id` ASC)  COMMENT '',
  CONSTRAINT `fk_node_node_calc1`
    FOREIGN KEY (`node_calc_id`)
    REFERENCES `cpdn-network`.`node_calc` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_node_node_spec1`
    FOREIGN KEY (`node_spec_id`)
    REFERENCES `cpdn-network`.`node_spec` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_node_scheme1`
    FOREIGN KEY (`scheme_id`)
    REFERENCES `cpdn-network`.`scheme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_node_map_point1`
    FOREIGN KEY (`map_point_id`)
    REFERENCES `cpdn-network`.`map_point` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-network`.`section_node`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-network`.`section_node` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `node_src` INT UNSIGNED NOT NULL COMMENT '',
  `node_dst` INT UNSIGNED NOT NULL COMMENT '',
  `node_trc` INT UNSIGNED NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_section_node_node1_idx` (`node_src` ASC)  COMMENT '',
  INDEX `fk_section_node_node2_idx` (`node_dst` ASC)  COMMENT '',
  INDEX `fk_section_node_node3_idx` (`node_trc` ASC)  COMMENT '',
  CONSTRAINT `fk_section_node_node1`
    FOREIGN KEY (`node_src`)
    REFERENCES `cpdn-network`.`node` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_node_node2`
    FOREIGN KEY (`node_dst`)
    REFERENCES `cpdn-network`.`node` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_node_node3`
    FOREIGN KEY (`node_trc`)
    REFERENCES `cpdn-network`.`node` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-network`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-network`.`section` (
  `id` INT NOT NULL COMMENT '',
  `section_calc_id` INT UNSIGNED NOT NULL COMMENT '',
  `section_spec_id` INT NOT NULL COMMENT '',
  `section_node_id` INT UNSIGNED NOT NULL COMMENT '',
  `scheme_id` INT UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_section_section_calc_idx` (`section_calc_id` ASC)  COMMENT '',
  INDEX `fk_section_section_spec1_idx` (`section_spec_id` ASC)  COMMENT '',
  INDEX `fk_section_scheme1_idx` (`scheme_id` ASC)  COMMENT '',
  INDEX `fk_section_section_node1_idx` (`section_node_id` ASC)  COMMENT '',
  CONSTRAINT `fk_section_section_calc`
    FOREIGN KEY (`section_calc_id`)
    REFERENCES `cpdn-network`.`section_calc` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_section_spec1`
    FOREIGN KEY (`section_spec_id`)
    REFERENCES `cpdn-network`.`section_spec` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_scheme1`
    FOREIGN KEY (`scheme_id`)
    REFERENCES `cpdn-network`.`scheme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_section_node1`
    FOREIGN KEY (`section_node_id`)
    REFERENCES `cpdn-network`.`section_node` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-network`.`path`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-network`.`path` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `src_map_point_id` INT UNSIGNED NOT NULL COMMENT '',
  `dst_map_point_id` INT UNSIGNED NOT NULL COMMENT '',
  `section_id` INT NOT NULL COMMENT '',
  INDEX `fk_path_map_point1_idx` (`src_map_point_id` ASC)  COMMENT '',
  INDEX `fk_path_map_point2_idx` (`dst_map_point_id` ASC)  COMMENT '',
  INDEX `fk_path_section1_idx` (`section_id` ASC)  COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  CONSTRAINT `fk_path_map_point1`
    FOREIGN KEY (`src_map_point_id`)
    REFERENCES `cpdn-network`.`map_point` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_path_map_point2`
    FOREIGN KEY (`dst_map_point_id`)
    REFERENCES `cpdn-network`.`map_point` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_path_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `cpdn-network`.`section` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-network`.`object`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-network`.`object` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `scheme_id` INT UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_object_scheme1_idx` (`scheme_id` ASC)  COMMENT '',
  CONSTRAINT `fk_object_scheme1`
    FOREIGN KEY (`scheme_id`)
    REFERENCES `cpdn-network`.`scheme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-network`.`object_member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-network`.`object_member` (
  `object_id` INT UNSIGNED NOT NULL COMMENT '',
  `node_id` INT UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`object_id`, `node_id`)  COMMENT '',
  INDEX `fk_object_member_node1_idx` (`node_id` ASC)  COMMENT '',
  CONSTRAINT `fk_object_member_object1`
    FOREIGN KEY (`object_id`)
    REFERENCES `cpdn-network`.`object` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_object_member_node1`
    FOREIGN KEY (`node_id`)
    REFERENCES `cpdn-network`.`node` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-idp`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-idp`.`profile` (
  `id` INT NOT NULL COMMENT '',
  `nick` VARCHAR(20) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `nick_UNIQUE` (`nick` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-network`.`scheme_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-network`.`scheme_permissions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `ts_from` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `ts_to` DATETIME NULL COMMENT '',
  `scheme_id` INT UNSIGNED NOT NULL COMMENT '',
  `profile_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_schema_permissions_scheme1_idx` (`scheme_id` ASC)  COMMENT '',
  INDEX `fk_schema_permissions_profile1_idx` (`profile_id` ASC)  COMMENT '',
  CONSTRAINT `fk_schema_permissions_scheme1`
    FOREIGN KEY (`scheme_id`)
    REFERENCES `cpdn-network`.`scheme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schema_permissions_profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `cpdn-idp`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `cpdn-oauth` ;

-- -----------------------------------------------------
-- Table `cpdn-oauth`.`access_tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-oauth`.`access_tokens` (
  `access_token` VARCHAR(40) NOT NULL COMMENT '',
  `client_id` VARCHAR(80) NOT NULL COMMENT '',
  `user_id` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `expires` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `scope` VARCHAR(2000) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`access_token`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cpdn-oauth`.`authorization_codes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-oauth`.`authorization_codes` (
  `authorization_code` VARCHAR(40) NOT NULL COMMENT '',
  `client_id` VARCHAR(80) NOT NULL COMMENT '',
  `user_id` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `redirect_uri` VARCHAR(2000) NULL DEFAULT NULL COMMENT '',
  `expires` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `scope` VARCHAR(2000) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`authorization_code`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cpdn-oauth`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-oauth`.`clients` (
  `client_id` VARCHAR(80) NOT NULL COMMENT '',
  `client_secret` VARCHAR(80) NULL DEFAULT NULL COMMENT '',
  `redirect_uri` VARCHAR(2000) NOT NULL COMMENT '',
  `grant_types` VARCHAR(80) NULL DEFAULT NULL COMMENT '',
  `scope` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `user_id` VARCHAR(80) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`client_id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cpdn-oauth`.`jwt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-oauth`.`jwt` (
  `client_id` VARCHAR(80) NOT NULL COMMENT '',
  `subject` VARCHAR(80) NULL DEFAULT NULL COMMENT '',
  `public_key` VARCHAR(2000) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`client_id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cpdn-oauth`.`refresh_tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-oauth`.`refresh_tokens` (
  `refresh_token` VARCHAR(40) NOT NULL COMMENT '',
  `client_id` VARCHAR(80) NOT NULL COMMENT '',
  `user_id` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `expires` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `scope` VARCHAR(2000) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`refresh_token`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cpdn-oauth`.`scopes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-oauth`.`scopes` (
  `scope` TEXT NULL DEFAULT NULL COMMENT '',
  `is_default` TINYINT(1) NULL DEFAULT NULL COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cpdn-oauth`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-oauth`.`users` (
  `username` VARCHAR(255) NOT NULL COMMENT '',
  `password` VARCHAR(2000) NULL DEFAULT NULL COMMENT '',
  `first_name` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `last_name` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`username`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `cpdn-idp` ;

-- -----------------------------------------------------
-- Table `cpdn-idp`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-idp`.`user` (
  `id` INT NOT NULL COMMENT '',
  `email` VARCHAR(100) NOT NULL COMMENT '',
  `password` VARCHAR(45) NOT NULL COMMENT '',
  `active` INT(1) NOT NULL DEFAULT 1 COMMENT '',
  `banned` INT(1) NOT NULL DEFAULT 0 COMMENT '',
  `suspended` INT(1) NOT NULL DEFAULT 0 COMMENT '',
  `enforce_change_password` INT(1) NOT NULL DEFAULT 0 COMMENT '',
  `ts_create` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `ts_update` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-idp`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-idp`.`group` (
  `id` INT NOT NULL COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-idp`.`membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-idp`.`membership` (
  `membership` INT NOT NULL COMMENT '',
  PRIMARY KEY (`membership`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpdn-idp`.`contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cpdn-idp`.`contact` (
  `id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
