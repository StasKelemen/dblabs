CREATE DATABASE `Shop`;

CREATE TABLE `Shop`.`Producer` (
  `idProducer` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(99) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `phone` CHAR(10) NOT NULL,
  `contact_person` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idProducer`)
);


CREATE TABLE `Shop`.`Shop` (
  `idShop` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(99) NOT NULL,
  `address` VARCHAR(99) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `phone` CHAR(10) NOT NULL,
  PRIMARY KEY (`idShop`)
);


CREATE TABLE `Shop`.`Storage` (
  `idStorage` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `phone` CHAR(10) NOT NULL,
  `idShop` MEDIUMINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idStorage`),
  CONSTRAINT `Storage_Shop`
    FOREIGN KEY (`idShop`)
    REFERENCES `Shop`.`Shop` (`idShop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE `Shop`.`Order` (
  `idOrder` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_price` INT NOT NULL,
  `order_date` DATETIME NOT NULL,
  `delivery_date` DATETIME NOT NULL,
  `idStorage` MEDIUMINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idOrder`),
  CONSTRAINT `Order_Storage`
    FOREIGN KEY (`idStorage`)
    REFERENCES `Shop`.`Storage` (`idStorage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE `Shop`.`Brand` (
 `idBrand` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idBrand`),
  CONSTRAINT `name_UNIQUE` UNIQUE(`name`)
);


CREATE TABLE `Shop`.`Category` (
  `idCategory` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  number MEDIUMINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCategory`),
  CONSTRAINT `name_UNIQUE` UNIQUE(`name`)
);

CREATE TABLE `Shop`.`Thing_Type` (
  `idThingType` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `number` INT UNSIGNED NOT NULL,
  `idCategory` MEDIUMINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idThingType`),
  CONSTRAINT `name_UNIQUE` UNIQUE(`name`),
  CONSTRAINT `Thing_Type_Category`
    FOREIGN KEY (`idCategory`)
    REFERENCES `Shop`.`Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE `Shop`.`Thing` (
  `idThing` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name_product` VARCHAR(50) NOT NULL,
  `price` INT UNSIGNED NOT NULL,
  `number` INT UNSIGNED NOT NULL,
  `idProducer` MEDIUMINT UNSIGNED NOT NULL,
  `idBrand` MEDIUMINT UNSIGNED NOT NULL,
  `idThingType` MEDIUMINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idThing`),
  CONSTRAINT `Thing_Producer`
    FOREIGN KEY (`idProducer`)
    REFERENCES `Shop`.`Producer` (`idProducer`),
  CONSTRAINT `Thing_Brand`
    FOREIGN KEY (`idBrand`)
    REFERENCES `Shop`.`Brand` (`idBrand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Thing_Thing_Type`
    FOREIGN KEY (`idThingType`)
    REFERENCES `Shop`.`Thing_Type` (`idThingType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE `Shop`.`Order_Thing` (
  `idOrder` MEDIUMINT UNSIGNED NOT NULL,
  `idThing` MEDIUMINT UNSIGNED NOT NULL,
  CONSTRAINT `Order_Thing_Order`
    FOREIGN KEY (`idOrder`)
    REFERENCES `Shop`.`Order` (`idOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Order_Thing_Thing`
    FOREIGN KEY (`idThing`)
    REFERENCES `Shop`.`Thing` (`idThing`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE `Shop`.`Storage_Thing` (
  `idStorage` MEDIUMINT UNSIGNED NOT NULL,
  `idThing` MEDIUMINT UNSIGNED NOT NULL,
  CONSTRAINT `Storage_Thing_Storage`
    FOREIGN KEY (`idStorage`)
    REFERENCES `Shop`.`Storage` (`idStorage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Storage_Thing_Thing`
    FOREIGN KEY (`idThing`)
    REFERENCES `Shop`.`Thing` (`idThing`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
