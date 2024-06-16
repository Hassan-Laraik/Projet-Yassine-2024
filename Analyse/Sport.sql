-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema salle_sport3
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `salle_sport3` ;

-- -----------------------------------------------------
-- Schema salle_sport3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `salle_sport3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `salle_sport3` ;

-- -----------------------------------------------------
-- Table `adherents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adherents` ;

CREATE TABLE IF NOT EXISTS `adherents` (
  `cin` VARCHAR(10) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NULL DEFAULT NULL,
  `tele` VARCHAR(45) NULL DEFAULT NULL,
  `sexe` VARCHAR(45) NULL DEFAULT NULL,
  `naissance` DATE NULL DEFAULT NULL,
  `photo` MEDIUMBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`cin`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `tele_UNIQUE` ON `adherents` (`tele` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `sports`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sports` ;

CREATE TABLE IF NOT EXISTS `sports` (
  `idsport` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(45) NOT NULL,
  `tarif` FLOAT(6,2) NOT NULL DEFAULT '100.00',
  `assurance` FLOAT(8,2) NULL DEFAULT '400.00',
  PRIMARY KEY (`idsport`))
ENGINE = InnoDB
AUTO_INCREMENT = 27
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `label` ON `sports` (`label` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `adhesions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adhesions` ;

CREATE TABLE IF NOT EXISTS `adhesions` (
  `cin` VARCHAR(10) NOT NULL,
  `idsport` INT NOT NULL,
  `debut` DATE NOT NULL,
  `fin` DATE NOT NULL,
  `echeance` VARCHAR(12) NOT NULL DEFAULT '1-An',
  `prix` FLOAT(6,2) NOT NULL DEFAULT '200.00',
  `montant` FLOAT NOT NULL DEFAULT '200',
  `assurance` FLOAT(8,2) NULL DEFAULT '400.00',
  PRIMARY KEY (`cin`, `idsport`),
  CONSTRAINT `fk_adherent_has_sports_sports1`
    FOREIGN KEY (`idsport`)
    REFERENCES `sports` (`idsport`),
  CONSTRAINT `fk_adhesion_adherents1`
    FOREIGN KEY (`cin`)
    REFERENCES `adherents` (`cin`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `fk_adherent_has_sports_sports1_idx` ON `adhesions` (`idsport` ASC) VISIBLE;

CREATE INDEX `fk_adhesion_adherents1_idx` ON `adhesions` (`cin` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `paiements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `paiements` ;

CREATE TABLE IF NOT EXISTS `paiements` (
  `Nrecu` INT NOT NULL AUTO_INCREMENT,
  `cin` VARCHAR(10) NOT NULL,
  `idsport` INT NOT NULL,
  `date_paiement` DATE NOT NULL,
  `montant` DECIMAL(6,2) NOT NULL DEFAULT '300.00',
  `label` VARCHAR(45) NULL DEFAULT NULL,
  `solde` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`Nrecu`),
  CONSTRAINT `fk_paiements_adhesions1`
    FOREIGN KEY (`cin` , `idsport`)
    REFERENCES `adhesions` (`cin` , `idsport`))
ENGINE = InnoDB
AUTO_INCREMENT = 66
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `Nreçu_UNIQUE` ON `paiements` (`Nrecu` ASC) VISIBLE;

CREATE INDEX `fk_paiements_adhesions1_idx` ON `paiements` (`cin` ASC, `idsport` ASC) VISIBLE;

USE `salle_sport3` ;

-- -----------------------------------------------------
-- Placeholder table for view `credit_adhesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `credit_adhesion` (`cin` INT, `somme` INT);

-- -----------------------------------------------------
-- Placeholder table for view `debit_adhesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debit_adhesion` (`cin` INT, `somme` INT);

-- -----------------------------------------------------
-- Placeholder table for view `debit_adhesion_sport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debit_adhesion_sport` (`cin` INT, `idsport` INT, `somme` INT, `label` INT);

-- -----------------------------------------------------
-- Placeholder table for view `view_adherents_inscris`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `view_adherents_inscris` (`cin` INT, `nom` INT, `prenom` INT, `adress` INT, `tele` INT, `sexe` INT, `naissance` INT, `photo` INT, `debut` INT, `fin` INT, `label` INT);

-- -----------------------------------------------------
-- View `credit_adhesion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `credit_adhesion`;
DROP VIEW IF EXISTS `credit_adhesion` ;
USE `salle_sport3`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `credit_adhesion` AS select `paiements`.`cin` AS `cin`,sum(`paiements`.`montant`) AS `somme` from `paiements` group by `paiements`.`cin`;

-- -----------------------------------------------------
-- View `debit_adhesion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `debit_adhesion`;
DROP VIEW IF EXISTS `debit_adhesion` ;
USE `salle_sport3`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `debit_adhesion` AS select `adhesions`.`cin` AS `cin`,sum((`adhesions`.`montant` + `adhesions`.`assurance`)) AS `somme` from `adhesions` group by `adhesions`.`cin`;

-- -----------------------------------------------------
-- View `debit_adhesion_sport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `debit_adhesion_sport`;
DROP VIEW IF EXISTS `debit_adhesion_sport` ;
USE `salle_sport3`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `debit_adhesion_sport` AS select `d`.`cin` AS `cin`,`d`.`idsport` AS `idsport`,`d`.`somme` AS `somme`,`sports`.`label` AS `label` from ((select `adhesions`.`cin` AS `cin`,`adhesions`.`idsport` AS `idsport`,sum((`adhesions`.`montant` + `adhesions`.`assurance`)) AS `somme` from `adhesions` group by `adhesions`.`cin`,`adhesions`.`idsport`) `d` left join `sports` on((`d`.`idsport` = `sports`.`idsport`)));

-- -----------------------------------------------------
-- View `view_adherents_inscris`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `view_adherents_inscris`;
DROP VIEW IF EXISTS `view_adherents_inscris` ;
USE `salle_sport3`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_adherents_inscris` AS select `adherents`.`cin` AS `cin`,`adherents`.`nom` AS `nom`,`adherents`.`prenom` AS `prenom`,`adherents`.`adress` AS `adress`,`adherents`.`tele` AS `tele`,`adherents`.`sexe` AS `sexe`,`adherents`.`naissance` AS `naissance`,`adherents`.`photo` AS `photo`,`adhesions`.`debut` AS `debut`,`adhesions`.`fin` AS `fin`,`sports`.`label` AS `label` from ((`adherents` left join `adhesions` on((`adherents`.`cin` = `adhesions`.`cin`))) left join `sports` on((`adhesions`.`idsport` = `sports`.`idsport`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
