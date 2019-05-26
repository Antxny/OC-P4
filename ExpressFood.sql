-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 26, 2019 at 11:18 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expressfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` char(10) NOT NULL,
  `rue` varchar(255) NOT NULL,
  `numero_rue` varchar(5) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `code_postal` char(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `nom`, `prenom`, `email`, `telephone`, `rue`, `numero_rue`, `ville`, `code_postal`) VALUES
(1, 'Pelland', 'Gaston', 'GastonPelland@domain.com', '0367190839', 'Cours Marechal-Joffre', '93', 'Denain', '59220'),
(2, 'Duperré', 'Langley', 'LangleyDuperre@domain.com', '0393374653', 'Rue Marie De Médicis', '57', 'Cambrai', '59400'),
(3, 'Garcia', 'Stéphane', 'StephaneGarcia@domain.com', '0758952565', 'Cours Marechal-Joffre', '96', 'Dax', '40100'),
(4, 'Dufour', 'Amélie', 'AmelieDufour@domain.com', '0698535254', 'Rue du Clair Bocage', '78', 'La Roche-Sur-Yon', '85000'),
(5, 'Melanson', 'Louis', 'LouisMelanson@domain.com', '0782365951', 'Rue de l\'Epeule', '88', 'Rouen', '76100'),
(6, 'Goddu', 'Océane', 'OceaneGoddu@domain.com', '0625369851', 'Place de la Gare', '75', 'Colmar', '68000'),
(7, 'Devoe', 'Zoé', 'ZoeDevoe@domain.com', '0634519768', 'Avenue du Marechal Juin', '11', 'Saint-Lieu', '97436'),
(8, 'Crête', 'Marlon', 'MarlonCrete@domain.com', '0682359613', 'Rue Gouin de Beauchesne', '46', 'Saint-Paul', '97460');

-- --------------------------------------------------------

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_commande_plat` mediumtext NOT NULL,
  `quantites_plats` mediumtext NOT NULL,
  `id_livreur` int(11) NOT NULL,
  `total_prix` float(5,2) NOT NULL,
  `date_commande` datetime DEFAULT CURRENT_TIMESTAMP,
  `status_paiement` tinyint(1) NOT NULL,
  `status_livraison` tinyint(1) NOT NULL,
  `heure_arrivee` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ClientID` (`id_client`),
  KEY `FK_LivreurID` (`id_livreur`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commandes`
--

INSERT INTO `commandes` (`id`, `id_client`, `id_commande_plat`, `quantites_plats`, `id_livreur`, `total_prix`, `date_commande`, `status_paiement`, `status_livraison`, `heure_arrivee`) VALUES
(1, 4, '4,5,', '1,1,', 3, 10.30, '2019-01-09 20:12:06', 1, 1, '20:31:00'),
(2, 6, '2,3,', '1,2,', 3, 13.20, '2019-01-14 12:19:15', 1, 0, '12:29:00'),
(3, 8, '2,', '1,', 1, 6.60, '2019-01-13 19:58:22', 0, 0, '20:11:00'),
(4, 5, '2,3,6,', '1,1,1,', 2, 14.10, '2019-01-14 15:06:20', 1, 1, '15:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `livreurs`
--

DROP TABLE IF EXISTS `livreurs`;
CREATE TABLE IF NOT EXISTS `livreurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `position` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `livreurs`
--

INSERT INTO `livreurs` (`id`, `nom`, `prenom`, `status`, `position`) VALUES
(1, 'Morneau', 'Leroy', 0, 'Paris'),
(2, 'Bonnet', 'Philippe', 0, 'Créteil'),
(3, 'Marchessault', 'Thierry', 0, 'Lorient');

-- --------------------------------------------------------

--
-- Table structure for table `plats_du_jour`
--

DROP TABLE IF EXISTS `plats_du_jour`;
CREATE TABLE IF NOT EXISTS `plats_du_jour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` float(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plats_du_jour`
--

INSERT INTO `plats_du_jour` (`id`, `type`, `nom`, `prix`) VALUES
(1, 'Indien', 'Poulet Tandoori', 12.50),
(2, 'Indien', 'Poulet Tandoori', 11.60),
(3, 'Japonais', 'Takayoki', 7.60),
(4, 'Japonais', 'Sushi', 5.70),
(5, 'Japonais', 'Karrage', 6.50),
(6, 'Indien', 'Curry de veau', 10.20),
(7, 'Indien', 'Dhal', 8.90),
(8, 'Italien', 'Escalopes milanaises', 6.80),
(9, 'Italien', 'Canelloni', 5.00),
(10, 'Italien', 'Gnocchis', 5.90),
(11, 'test', 'tset', 7.20);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `FK_ClientID` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `FK_LivreurID` FOREIGN KEY (`id_livreur`) REFERENCES `livreurs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
