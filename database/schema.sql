-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.40 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- -------------------------------------------------------

CREATE DATABASE IF NOT EXISTS `pharmacymanagement` ;
USE `pharmacymanagement`;

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturerID` int NOT NULL,
  `brandName` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`manufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `medication` (
  `medicationID` int NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `form` varchar(50) NOT NULL DEFAULT '',
  `strength` varchar(50) NOT NULL DEFAULT '',
  `manufacturerID` int NOT NULL,
  PRIMARY KEY (`medicationID`),
  KEY `fk_manufacturerID` (`manufacturerID`) USING BTREE,
  CONSTRAINT `fk_manufacturerID` FOREIGN KEY (`manufacturerID`) REFERENCES `manufacturer` (`manufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `patients` (
  `personID` int NOT NULL AUTO_INCREMENT,
  `insuranceType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `medicationHistory` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`personID`) USING BTREE,
  KEY `personID` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `persons` (
  `personID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DOB` date NOT NULL,
  `phoneNum` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `prescription` (
  `rxNumber` int NOT NULL AUTO_INCREMENT,
  `providerID` int NOT NULL,
  `patientID` int NOT NULL,
  `medicationID` int NOT NULL,
  `dosage` varchar(50) NOT NULL DEFAULT '',
  `prescriptionWritten` date NOT NULL,
  PRIMARY KEY (`rxNumber`),
  KEY `fk_providerID` (`providerID`),
  KEY `fk_patientID` (`patientID`),
  KEY `fk_medicationID` (`medicationID`),
  CONSTRAINT `fk_medicationID` FOREIGN KEY (`medicationID`) REFERENCES `medication` (`medicationID`) ON DELETE CASCADE,
  CONSTRAINT `fk_patientID` FOREIGN KEY (`patientID`) REFERENCES `patients` (`personID`) ON DELETE CASCADE,
  CONSTRAINT `fk_providerID` FOREIGN KEY (`providerID`) REFERENCES `providers` (`personID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `providers` (
  `personID` int NOT NULL AUTO_INCREMENT,
  `licenseNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` enum('Doctor','Dentist','Veterinarian','Other') NOT NULL,
  PRIMARY KEY (`personID`) USING BTREE,
  KEY `personID` (`personID`),
  CONSTRAINT `providerID` FOREIGN KEY (`personID`) REFERENCES `persons` (`personID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
