-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Sam 31 Mars 2018 à 12:47
-- Version du serveur :  10.0.34-MariaDB-0ubuntu0.16.04.1
-- Version de PHP :  7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `virtuality`
--

-- --------------------------------------------------------

--
-- Structure de la table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Circulation à contre sens', 250, 0),
(2, 'Non respect des feux', 150, 0),
(3, 'Circulation hors route', 250, 0),
(4, 'Stationnement interdit ou genant', 100, 0),
(5, 'Circulation hors-route', 170, 0),
(6, 'Delit de fuite', 1500, 0),
(7, 'Petit exces de vitesse', 150, 0),
(8, 'Gros exces de vitesse', 300, 0),
(9, 'Conduite dangereuse', 500, 0),
(10, 'Conduite en etat d\'ivresse', 150, 0),
(15, 'Conduite sans permis', 1500, 0),
(21, 'Trouble à l\'ordre public', 150, 1),
(22, 'Dégradation de la voie publique', 150, 1),
(23, 'Outrage à agent', 1000, 1),
(24, 'Menace sur agent', 2000, 1),
(25, 'Menace sur civil', 1000, 1),
(26, 'Tentative de corruption', 10000, 1),
(27, 'Arme sortie en ville', 300, 1),
(28, 'Vol de voiture', 2000, 1),
(29, 'Port d\'arme illegal', 5000, 1),
(31, 'Prise d\'otage civil', 30000, 2),
(32, 'Prise d\'otage agent de l\'etat', 50000, 2),
(33, 'Braquage d\'un civil', 3000, 2),
(34, 'Braquage magasin', 5000, 2),
(35, 'Braquage banque', 125000, 2),
(55, 'Trafic Faux Papiers', 15000, 4),
(54, 'Trafic Coke', 12000, 4),
(53, 'Trafic Meth', 10000, 4),
(52, 'Trafic Cannabis', 4000, 4),
(46, 'Tir sur agent de l\'état', 10000, 3),
(47, 'Tentative de meurtre sur agent', 20000, 3),
(48, 'Tentative de meurtre sur civil', 10000, 3),
(49, 'Meurtre sur civil', 10000, 3),
(50, 'Meurtre (mort rp)', 100000, 3),
(51, 'Tentative meurtre involontaire', 5000, 3),
(56, 'Trafic Organes', 40000, 4);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
