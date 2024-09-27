-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema STUDYstics
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema STUDYstics
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `STUDYstics` DEFAULT CHARACTER SET utf8 ;
USE `STUDYstics` ;

-- -----------------------------------------------------
-- Table `STUDYstics`.`JobOpportunity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STUDYstics`.`JobOpportunity` (
  `job_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `junior_salary` DECIMAL(2) NULL,
  `scientific_field` VARCHAR(50) NULL,
  PRIMARY KEY (`job_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STUDYstics`.`University`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STUDYstics`.`University` (
  `university_code` VARCHAR(10) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `country` VARCHAR(50) NULL,
  `city` VARCHAR(50) NULL,
  `rank` INT NULL,
  PRIMARY KEY (`university_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STUDYstics`.`Requirements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STUDYstics`.`Requirements` (
  `requirements_id` INT NOT NULL AUTO_INCREMENT,
  `word_experience` DOUBLE NULL,
  `english_degree` DOUBLE NULL,
  `standarised_tests_score` DOUBLE NULL,
  `recomendation_letters` INT NULL,
  `lowest_bachelor_score` DOUBLE NULL,
  PRIMARY KEY (`requirements_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STUDYstics`.`ApplicationTerms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STUDYstics`.`ApplicationTerms` (
  `application_id` INT NOT NULL AUTO_INCREMENT,
  `deadline` DATE NULL,
  `price` DECIMAL(2) NULL,
  PRIMARY KEY (`application_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STUDYstics`.`MastersProgram`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STUDYstics`.`MastersProgram` (
  `master_id` INT NOT NULL AUTO_INCREMENT,
  `duration` DOUBLE NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `thesis` TINYINT NULL,
  `internship` TINYINT NULL,
  `delivered` ENUM('Online', 'On Campus', 'Hybrid') NULL,
  `price` DECIMAL(2) NOT NULL,
  `university_code` VARCHAR(10) NOT NULL,
  `requirement_id` INT NOT NULL,
  `application_id` INT NOT NULL,
  PRIMARY KEY (`master_id`),
  INDEX `university_code_idx` (`university_code` ASC) VISIBLE,
  INDEX `requirement_id_idx` (`requirement_id` ASC) VISIBLE,
  INDEX `application_id_idx` (`application_id` ASC) VISIBLE,
  CONSTRAINT `university_code`
    FOREIGN KEY (`university_code`)
    REFERENCES `STUDYstics`.`University` (`university_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `requirement_id`
    FOREIGN KEY (`requirement_id`)
    REFERENCES `STUDYstics`.`Requirements` (`requirements_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `application_id`
    FOREIGN KEY (`application_id`)
    REFERENCES `STUDYstics`.`ApplicationTerms` (`application_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STUDYstics`.`Statistics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STUDYstics`.`Statistics` (
  `year` INT NOT NULL AUTO_INCREMENT,
  `university_code` VARCHAR(10) NOT NULL,
  `total_participants` INT NULL,
  `total_males` INT NULL,
  `total_females` INT NULL,
  `others` INT NULL,
  PRIMARY KEY (`year`, `university_code`),
  INDEX `university_code_idx` (`university_code` ASC) VISIBLE,
  CONSTRAINT `university_code`
    FOREIGN KEY (`university_code`)
    REFERENCES `STUDYstics`.`University` (`university_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STUDYstics`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STUDYstics`.`Professor` (
  `professor_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `university_code` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`professor_id`),
  INDEX `university_code_idx` (`university_code` ASC) VISIBLE,
  CONSTRAINT `university_code`
    FOREIGN KEY (`university_code`)
    REFERENCES `STUDYstics`.`University` (`university_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STUDYstics`.`Lesson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STUDYstics`.`Lesson` (
  `lesson_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`lesson_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STUDYstics`.`Professor_Teaches_Lesson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STUDYstics`.`Professor_Teaches_Lesson` (
  `lesson_id` INT NOT NULL AUTO_INCREMENT,
  `professor_id` INT NOT NULL,
  PRIMARY KEY (`lesson_id`, `professor_id`),
  INDEX `professor_id_idx` (`professor_id` ASC) VISIBLE,
  CONSTRAINT `lesson_id`
    FOREIGN KEY (`lesson_id`)
    REFERENCES `STUDYstics`.`Lesson` (`lesson_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `professor_id`
    FOREIGN KEY (`professor_id`)
    REFERENCES `STUDYstics`.`Professor` (`professor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STUDYstics`.`MastersProgram_Brings_JobOpportunity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STUDYstics`.`MastersProgram_Brings_JobOpportunity` (
  `master_id` INT NOT NULL AUTO_INCREMENT,
  `job_id` INT NOT NULL,
  PRIMARY KEY (`master_id`, `job_id`),
  INDEX `job_id_idx` (`job_id` ASC) VISIBLE,
  CONSTRAINT `master_id`
    FOREIGN KEY (`master_id`)
    REFERENCES `STUDYstics`.`MastersProgram` (`master_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `job_id`
    FOREIGN KEY (`job_id`)
    REFERENCES `STUDYstics`.`JobOpportunity` (`job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `STUDYstics`.`MastersProgram_Contains_Lesson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `STUDYstics`.`MastersProgram_Contains_Lesson` (
  `master_id` INT NOT NULL AUTO_INCREMENT,
  `lesson_id` INT NOT NULL,
  `is_core` TINYINT NULL,
  PRIMARY KEY (`master_id`, `lesson_id`),
  INDEX `lesson_id_idx` (`lesson_id` ASC) VISIBLE,
  CONSTRAINT `master_id`
    FOREIGN KEY (`master_id`)
    REFERENCES `STUDYstics`.`MastersProgram` (`master_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `lesson_id`
    FOREIGN KEY (`lesson_id`)
    REFERENCES `STUDYstics`.`Lesson` (`lesson_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
