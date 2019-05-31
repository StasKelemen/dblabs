CREATE DATABASE `Shop` CHARACTER SET utf8;

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


CREATE TABLE `Shop`.`Order` (
  `idOrder` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_price` INT UNSIGNED NOT NULL,
  `order_date` DATETIME NOT NULL,
  `delivery_date` DATETIME NOT NULL,
  `idShop` MEDIUMINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idOrder`),
  CONSTRAINT `Order_Shop`
    FOREIGN KEY (`idShop`)
    REFERENCES `Shop`.`Shop` (`idShop`)
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
  `category_num` MEDIUMINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCategory`),
  CONSTRAINT `name_UNIQUE` UNIQUE(`name`)
);

CREATE TABLE `Shop`.`Type_Thing` (
  `idTypeThing` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `type_num` INT UNSIGNED NOT NULL,
  `idCategory` MEDIUMINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idTypeThing`),
  CONSTRAINT `name_UNIQUE` UNIQUE(`name`),
  CONSTRAINT `Type_Thing__Category`
    FOREIGN KEY (`idCategory`)
    REFERENCES `Shop`.`Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE `Shop`.`Thing` (
  `idThing` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name_product` VARCHAR(50) NOT NULL,
  `price` INT UNSIGNED NOT NULL,
  `total_num` INT UNSIGNED NOT NULL,
  `idProducer` MEDIUMINT UNSIGNED NOT NULL,
  `idBrand` MEDIUMINT UNSIGNED NOT NULL,
  `idTypeThing` MEDIUMINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idThing`),
  CONSTRAINT `Thing_Producer`
    FOREIGN KEY (`idProducer`)
    REFERENCES `Shop`.`Producer` (`idProducer`),
  CONSTRAINT `Thing__Brand`
    FOREIGN KEY (`idBrand`)
    REFERENCES `Shop`.`Brand` (`idBrand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Type_Thing__Thing`
    FOREIGN KEY (`idTypeThing`)
    REFERENCES `Shop`.`Type_Thing` (`idTypeThing`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE `Shop`.`Ordered_Thing` (
  `idOrderedThing` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idOrder` MEDIUMINT UNSIGNED NOT NULL,
  `idThing` MEDIUMINT UNSIGNED NOT NULL,
  `ordered_num` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idOrderedThing`),
  CONSTRAINT `Ordered_Thing__Order`
    FOREIGN KEY (`idOrder`)
    REFERENCES `Shop`.`Order` (`idOrder`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Ordered_Thing__Thing`
    FOREIGN KEY (`idThing`)
    REFERENCES `Shop`.`Thing` (`idThing`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);