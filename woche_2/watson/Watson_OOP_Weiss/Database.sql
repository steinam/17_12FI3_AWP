CREATE DATABASE drwatson;

USE drwatson;

CREATE TABLE `drwatson`.`user` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userID`));


CREATE TABLE `drwatson`.`computer` (
  `computerID` INT NOT NULL AUTO_INCREMENT,
  `mac` VARCHAR(17) NOT NULL,
  `os` VARCHAR(45) NOT NULL,
  `hostname` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`computerID`));
  
  CREATE TABLE `drwatson`.`report` (
  `reportID` VARCHAR(50) NOT NULL,
  `reportType` INT NOT NULL,
  `eventTime` VARCHAR(45) NOT NULL,
  `bucketID` VARCHAR(45) NOT NULL,
  `appName` VARCHAR(50) NOT NULL,
  `userID` INT NOT NULL,
  `computerID` INT NOT NULL,
  PRIMARY KEY (`reportID`),
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `drwatson`.`user` (`userID`),
  CONSTRAINT `computerID`
    FOREIGN KEY (`computerID`)
    REFERENCES `drwatson`.`computer` (`computerID`));
