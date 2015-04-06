-- MySQL Script generated by MySQL Workbench
-- dom 05 abr 2015 22:14:07 VET
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mybank
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mybank` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mybank` ;

-- -----------------------------------------------------
-- Table `mybank`.`others_bank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`others_bank` (
  `id_banks` INT NOT NULL AUTO_INCREMENT,
  `account_others_banks` INT(20) NOT NULL DEFAULT 00000000000000000000,
  PRIMARY KEY (`id_banks`, `account_others_banks`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`Mybank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`Mybank` (
  `id_banks` INT NOT NULL,
  INDEX `fk_Mybank_table11_idx` (`id_banks` ASC),
  PRIMARY KEY (`id_banks`),
  CONSTRAINT `fk_Mybank_table11`
    FOREIGN KEY (`id_banks`)
    REFERENCES `mybank`.`others_bank` (`id_banks`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`clients` (
  `id_clients` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `credential` INT NOT NULL,
  `mybank` INT NOT NULL,
  PRIMARY KEY (`id_clients`),
  UNIQUE INDEX `id_clients_UNIQUE` (`id_clients` ASC),
  UNIQUE INDEX `credential_UNIQUE` (`credential` ASC),
  INDEX `fk_clients_Mybank1_idx` (`mybank` ASC),
  CONSTRAINT `fk_clients_Mybank1`
    FOREIGN KEY (`mybank`)
    REFERENCES `mybank`.`Mybank` (`id_banks`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`accounts` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `id_client` INT NOT NULL,
  `balance` INT NOT NULL DEFAULT 0,
  `number_acount` INT(20) NOT NULL,
  `type_account` VARCHAR(45) NOT NULL DEFAULT 'corriente',
  UNIQUE INDEX `idcuentas_corrientes_UNIQUE` (`number_acount` ASC),
  INDEX `fk_cuentas_corrientes_clients_idx` (`id_client` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cuentas_corrientes_clients`
    FOREIGN KEY (`id_client`)
    REFERENCES `mybank`.`clients` (`id_clients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`cuentas_ahorros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`cuentas_ahorros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cuentas_ahorros` INT NOT NULL,
  `id_clients_a` INT NOT NULL,
  UNIQUE INDEX `cuentas_ahorros_UNIQUE` (`cuentas_ahorros` ASC),
  INDEX `fk_cuentas_ahorros_clients1_idx` (`id_clients_a` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cuentas_ahorros_clients1`
    FOREIGN KEY (`id_clients_a`)
    REFERENCES `mybank`.`clients` (`id_clients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`movements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`movements` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL DEFAULT 0,
  `origin_account` INT(20) NULL,
  `destiny_account` INT(20) NULL,
  `type_movement` VARCHAR(45) NOT NULL,
  `account_3ro(transfers)` INT(20) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_movements_1_idx` (`account_3ro(transfers)` ASC),
  INDEX `fk_movements_2_idx` (`origin_account` ASC, `destiny_account` ASC),
  CONSTRAINT `fk_movements_1`
    FOREIGN KEY (`account_3ro(transfers)`)
    REFERENCES `mybank`.`others_bank` (`account_others_banks`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movements_2`
    FOREIGN KEY (`origin_account` , `destiny_account`)
    REFERENCES `mybank`.`accounts` (`id` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`movements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`movements` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL DEFAULT 0,
  `origin_account` INT(20) NULL,
  `destiny_account` INT(20) NULL,
  `type_movement` VARCHAR(45) NOT NULL,
  `account_3ro(transfers)` INT(20) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_movements_1_idx` (`account_3ro(transfers)` ASC),
  INDEX `fk_movements_2_idx` (`origin_account` ASC, `destiny_account` ASC),
  CONSTRAINT `fk_movements_1`
    FOREIGN KEY (`account_3ro(transfers)`)
    REFERENCES `mybank`.`others_bank` (`account_others_banks`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movements_2`
    FOREIGN KEY (`origin_account` , `destiny_account`)
    REFERENCES `mybank`.`accounts` (`id` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`operations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`operations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type_operation` VARCHAR(45) NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`id`, `type_operation`, `amount`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`movements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`movements` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL DEFAULT 0,
  `origin_account` INT(20) NULL,
  `destiny_account` INT(20) NULL,
  `type_movement` VARCHAR(45) NOT NULL,
  `account_3ro(transfers)` INT(20) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_movements_1_idx` (`account_3ro(transfers)` ASC),
  INDEX `fk_movements_2_idx` (`origin_account` ASC, `destiny_account` ASC),
  CONSTRAINT `fk_movements_1`
    FOREIGN KEY (`account_3ro(transfers)`)
    REFERENCES `mybank`.`others_bank` (`account_others_banks`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movements_2`
    FOREIGN KEY (`origin_account` , `destiny_account`)
    REFERENCES `mybank`.`accounts` (`id` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`clientes` (
  `idclientes` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `ci.` VARCHAR(12) NOT NULL,
  `movimientos` VARCHAR(45) NULL,
  PRIMARY KEY (`idclientes`),
  UNIQUE INDEX `ci._UNIQUE` (`ci.` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`mybank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`mybank` (
  `idmybank` INT NOT NULL,
  `clientes` VARCHAR(45) NULL,
  `clientes_idclientes` INT NOT NULL,
  PRIMARY KEY (`idmybank`),
  INDEX `fk_mybank_clientes1_idx` (`clientes_idclientes` ASC),
  CONSTRAINT `fk_mybank_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `mybank`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`cuentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`cuentas` (
  `idcuentas` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `nº_cuenta` INT(20) NOT NULL,
  `estado` INT NOT NULL,
  `clientes_idclientes` INT NOT NULL,
  PRIMARY KEY (`idcuentas`),
  INDEX `fk_cuentas_clientes1_idx` (`clientes_idclientes` ASC),
  CONSTRAINT `fk_cuentas_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `mybank`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`depositos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`depositos` (
  `iddepositos` INT NOT NULL,
  `monto` INT NOT NULL,
  `metodo` VARCHAR(45) NOT NULL,
  `nº_cuenta_destino` INT(20) NULL,
  `clientes_idclientes` INT NOT NULL,
  PRIMARY KEY (`iddepositos`),
  INDEX `fk_depositos_clientes1_idx` (`clientes_idclientes` ASC),
  CONSTRAINT `fk_depositos_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `mybank`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`retiros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`retiros` (
  `idretiros` INT NOT NULL,
  `monto` INT NOT NULL,
  `nº_cuenta` INT(20) NOT NULL,
  `clientes_idclientes` INT NOT NULL,
  PRIMARY KEY (`idretiros`),
  INDEX `fk_retiros_clientes1_idx` (`clientes_idclientes` ASC),
  CONSTRAINT `fk_retiros_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `mybank`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`transferencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`transferencias` (
  `idtransferencias` INT NOT NULL,
  `nº_origen` INT(20) NOT NULL COMMENT '		',
  `nº_destino` INT(20) NOT NULL,
  `monto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtransferencias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`clientes_has_transferencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`clientes_has_transferencias` (
  `clientes_idclientes` INT NOT NULL,
  `transferencias_idtransferencias` INT NOT NULL,
  PRIMARY KEY (`clientes_idclientes`, `transferencias_idtransferencias`),
  INDEX `fk_clientes_has_transferencias_transferencias1_idx` (`transferencias_idtransferencias` ASC),
  INDEX `fk_clientes_has_transferencias_clientes1_idx` (`clientes_idclientes` ASC),
  CONSTRAINT `fk_clientes_has_transferencias_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `mybank`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes_has_transferencias_transferencias1`
    FOREIGN KEY (`transferencias_idtransferencias`)
    REFERENCES `mybank`.`transferencias` (`idtransferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`banca_comunitaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`banca_comunitaria` (
  `idbanca_comunitaria` INT NOT NULL,
  `nombre_banco` VARCHAR(45) NULL,
  PRIMARY KEY (`idbanca_comunitaria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`banca_comunitaria_has_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`banca_comunitaria_has_clientes` (
  `banca_comunitaria_idbanca_comunitaria` INT NOT NULL,
  `clientes_idclientes` INT NOT NULL,
  PRIMARY KEY (`banca_comunitaria_idbanca_comunitaria`, `clientes_idclientes`),
  INDEX `fk_banca_comunitaria_has_clientes_clientes1_idx` (`clientes_idclientes` ASC),
  INDEX `fk_banca_comunitaria_has_clientes_banca_comunitaria1_idx` (`banca_comunitaria_idbanca_comunitaria` ASC),
  CONSTRAINT `fk_banca_comunitaria_has_clientes_banca_comunitaria1`
    FOREIGN KEY (`banca_comunitaria_idbanca_comunitaria`)
    REFERENCES `mybank`.`banca_comunitaria` (`idbanca_comunitaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_banca_comunitaria_has_clientes_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `mybank`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
