-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 05, 2023 at 12:18 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `urban_commute`
--

-- --------------------------------------------------------

--
-- Table structure for table `adherebus`
--

DROP TABLE IF EXISTS `adherebus`;
CREATE TABLE IF NOT EXISTS `adherebus` (
  `BusId` int NOT NULL,
  `LigneId` int NOT NULL,
  `DateAdhesion` date NOT NULL,
  `DateSortie` date DEFAULT NULL,
  PRIMARY KEY (`BusId`,`LigneId`,`DateAdhesion`),
  UNIQUE KEY `uc_BusId_DateAdhesion` (`BusId`,`DateAdhesion`),
  KEY `LigneId` (`LigneId`)
) ;

--
-- Dumping data for table `adherebus`
--

INSERT INTO `adherebus` (`BusId`, `LigneId`, `DateAdhesion`, `DateSortie`) VALUES
(8, 1, '2023-12-04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adheretaxi`
--

DROP TABLE IF EXISTS `adheretaxi`;
CREATE TABLE IF NOT EXISTS `adheretaxi` (
  `TaxiId` int NOT NULL,
  `LigneId` int NOT NULL,
  `DateAdhesiont` date NOT NULL,
  `DateSortiet` date DEFAULT NULL,
  PRIMARY KEY (`TaxiId`,`LigneId`,`DateAdhesiont`),
  UNIQUE KEY `TaxiId` (`TaxiId`,`DateAdhesiont`),
  KEY `LigneId` (`LigneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `a_bus`
--

DROP TABLE IF EXISTS `a_bus`;
CREATE TABLE IF NOT EXISTS `a_bus` (
  `idAssistant` int NOT NULL,
  PRIMARY KEY (`idAssistant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `a_bus`
--

INSERT INTO `a_bus` (`idAssistant`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

DROP TABLE IF EXISTS `buses`;
CREATE TABLE IF NOT EXISTS `buses` (
  `IdBus` int NOT NULL AUTO_INCREMENT,
  `brandBus` varchar(30) NOT NULL,
  `matricule` varchar(12) NOT NULL,
  `IdOwner` int NOT NULL,
  `IdDriver` int NOT NULL,
  `IdAssistant` int NOT NULL,
  PRIMARY KEY (`IdBus`),
  UNIQUE KEY `matricule` (`matricule`),
  UNIQUE KEY `IdDriver` (`IdDriver`),
  KEY `IdOwner` (`IdOwner`),
  KEY `IdAssistant` (`IdAssistant`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`IdBus`, `brandBus`, `matricule`, `IdOwner`, `IdDriver`, `IdAssistant`) VALUES
(8, 'toyota', '5435152', 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `chauffeur`
--

DROP TABLE IF EXISTS `chauffeur`;
CREATE TABLE IF NOT EXISTS `chauffeur` (
  `IdChauffeur` int NOT NULL,
  `TypeChaffeur` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NumPermis` varchar(9) NOT NULL,
  PRIMARY KEY (`IdChauffeur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chauffeur`
--

INSERT INTO `chauffeur` (`IdChauffeur`, `TypeChaffeur`, `NumPermis`) VALUES
(1, 'Taxi', 'A71531'),
(2, 'Bus', '256'),
(8, 'Bus ( ville )', 's');

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `IdEmp` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `hash` varchar(256) NOT NULL,
  PRIMARY KEY (`IdEmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`IdEmp`, `username`, `hash`) VALUES
(1, 'hamza', 'shs'),
(2, 'admin', '$argon2id$v=19$m=15360,t=2,p=1$oG1Wjy4$hQBP6n0/vTJCiOiZ7W6JFLiWgrjAilgh61KLcGynRrI');

-- --------------------------------------------------------

--
-- Table structure for table `lignet`
--

DROP TABLE IF EXISTS `lignet`;
CREATE TABLE IF NOT EXISTS `lignet` (
  `IdLigne` int NOT NULL AUTO_INCREMENT,
  `TypeLigne` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `departL` varchar(25) NOT NULL,
  `finL` varchar(25) NOT NULL,
  `NumQuai` int NOT NULL,
  `Arrets` varchar(150) NOT NULL,
  PRIMARY KEY (`IdLigne`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lignet`
--

INSERT INTO `lignet` (`IdLigne`, `TypeLigne`, `departL`, `finL`, `NumQuai`, `Arrets`) VALUES
(1, 'Bus ( ville )', 'bejaia', 'TiziOuzu', 4, 'amizour'),
(5, 'Bus ( ville )', 'Tifritine', 'bejaia', 7, 'sahra'),
(12, 'Taxi ( locale ) ', 'bejaia', 'aqbou', 78, 'amizour'),
(13, 'Bus ( ville )', 'Garre routière', 'Porte Sarasine', 99, 'patter');

-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `IdPersonne` int NOT NULL AUTO_INCREMENT,
  `NomP` varchar(20) NOT NULL,
  `PrenomP` varchar(20) NOT NULL,
  `AdresseP` varchar(120) NOT NULL,
  `ContactP` varchar(25) NOT NULL,
  `Datenaissance` date NOT NULL,
  PRIMARY KEY (`IdPersonne`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personne`
--

INSERT INTO `personne` (`IdPersonne`, `NomP`, `PrenomP`, `AdresseP`, `ContactP`, `Datenaissance`) VALUES
(1, 'Aghouiles', 'ilyes', 'feraoun centre', '055225654', '2003-05-02'),
(2, 'tes', 'tes', 'tes', 'tes', '0000-00-00'),
(3, ' s ', ' s ', ' s ', ' s ', '2000-12-16'),
(4, ' s', ' s ', ' s ', ' ds ', '2000-01-12'),
(5, 's', 's', 's', 's', '2000-04-26'),
(6, 's', 's', 'ss', 's', '2000-12-12'),
(7, 's', 's', 's', 's', '2000-10-10'),
(8, 's', 's', 's', 's', '2000-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `proprietairev`
--

DROP TABLE IF EXISTS `proprietairev`;
CREATE TABLE IF NOT EXISTS `proprietairev` (
  `Idproprio` int NOT NULL,
  `nbrVehicule` int NOT NULL,
  PRIMARY KEY (`Idproprio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `proprietairev`
--

INSERT INTO `proprietairev` (`Idproprio`, `nbrVehicule`) VALUES
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `idreservation` int NOT NULL AUTO_INCREMENT,
  `numplace` int NOT NULL,
  `trajet` int NOT NULL,
  PRIMARY KEY (`idreservation`),
  KEY `trajet` (`trajet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxis`
--

DROP TABLE IF EXISTS `taxis`;
CREATE TABLE IF NOT EXISTS `taxis` (
  `IdTaxi` int NOT NULL AUTO_INCREMENT,
  `TaxiBrand` varchar(30) NOT NULL,
  `MatriculeT` varchar(12) NOT NULL,
  `IdTaxiOwner` int NOT NULL,
  `IdTaxiDriver` int NOT NULL,
  PRIMARY KEY (`IdTaxi`),
  KEY `IdTaxiOwner` (`IdTaxiOwner`),
  KEY `IdTaxiDriver` (`IdTaxiDriver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trajets`
--

DROP TABLE IF EXISTS `trajets`;
CREATE TABLE IF NOT EXISTS `trajets` (
  `IdTrajet` int NOT NULL,
  `DateTrajet` date NOT NULL,
  `HeureTrajet` varchar(10) NOT NULL,
  `busId` int NOT NULL,
  PRIMARY KEY (`IdTrajet`),
  KEY `busId` (`busId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adherebus`
--
ALTER TABLE `adherebus`
  ADD CONSTRAINT `adherebus_ibfk_1` FOREIGN KEY (`BusId`) REFERENCES `buses` (`IdBus`),
  ADD CONSTRAINT `adherebus_ibfk_2` FOREIGN KEY (`LigneId`) REFERENCES `lignet` (`IdLigne`);

--
-- Constraints for table `adheretaxi`
--
ALTER TABLE `adheretaxi`
  ADD CONSTRAINT `adheretaxi_ibfk_1` FOREIGN KEY (`TaxiId`) REFERENCES `taxis` (`IdTaxi`),
  ADD CONSTRAINT `adheretaxi_ibfk_2` FOREIGN KEY (`LigneId`) REFERENCES `lignet` (`IdLigne`);

--
-- Constraints for table `a_bus`
--
ALTER TABLE `a_bus`
  ADD CONSTRAINT `a_bus_ibfk_1` FOREIGN KEY (`idAssistant`) REFERENCES `personne` (`IdPersonne`);

--
-- Constraints for table `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `buses_ibfk_1` FOREIGN KEY (`IdOwner`) REFERENCES `proprietairev` (`Idproprio`),
  ADD CONSTRAINT `buses_ibfk_2` FOREIGN KEY (`IdDriver`) REFERENCES `chauffeur` (`IdChauffeur`),
  ADD CONSTRAINT `buses_ibfk_3` FOREIGN KEY (`IdAssistant`) REFERENCES `a_bus` (`idAssistant`);

--
-- Constraints for table `chauffeur`
--
ALTER TABLE `chauffeur`
  ADD CONSTRAINT `chauffeur_ibfk_1` FOREIGN KEY (`IdChauffeur`) REFERENCES `personne` (`IdPersonne`);

--
-- Constraints for table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`IdEmp`) REFERENCES `personne` (`IdPersonne`);

--
-- Constraints for table `proprietairev`
--
ALTER TABLE `proprietairev`
  ADD CONSTRAINT `proprietairev_ibfk_1` FOREIGN KEY (`Idproprio`) REFERENCES `personne` (`IdPersonne`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`trajet`) REFERENCES `trajets` (`IdTrajet`);

--
-- Constraints for table `taxis`
--
ALTER TABLE `taxis`
  ADD CONSTRAINT `taxis_ibfk_1` FOREIGN KEY (`IdTaxiOwner`) REFERENCES `proprietairev` (`Idproprio`),
  ADD CONSTRAINT `taxis_ibfk_2` FOREIGN KEY (`IdTaxiDriver`) REFERENCES `chauffeur` (`IdChauffeur`);

--
-- Constraints for table `trajets`
--
ALTER TABLE `trajets`
  ADD CONSTRAINT `trajets_ibfk_1` FOREIGN KEY (`busId`) REFERENCES `buses` (`IdBus`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
