-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Sam 31 Mars 2018 à 12:44
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
-- Structure de la table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `shops`
--

INSERT INTO `shops` (`id`, `name`, `item`, `price`) VALUES
(1, 'TwentyFourSeven', 'bread', 1),
(2, 'TwentyFourSeven', 'water', 1),
(3, 'RobsLiquor', 'bread', 1),
(4, 'RobsLiquor', 'water', 1),
(5, 'LTDgasoline', 'bread', 1),
(6, 'LTDgasoline', 'water', 1),
(8, 'Bar', 'beer', 5),
(9, 'Bar', 'vodka', 10),
(10, 'TwentyFourSeven', 'chocolate', 1),
(11, 'RobsLiquor', 'chocolate', 1),
(12, 'LTDgasoline', 'chocolate', 1),
(13, 'TwentyFourSeven', 'sandwich', 4),
(14, 'RobsLiquor', 'sandwich', 4),
(15, 'LTDgasoline', 'sandwich', 4),
(16, 'TwentyFourSeven', 'hamburger', 6),
(17, 'RobsLiquor', 'hamburger', 6),
(18, 'LTDgasoline', 'hamburger', 6),
(19, 'Bar', 'tequila', 10),
(20, 'Bar', 'whisky', 10),
(21, 'TwentyFourSeven', 'cupcake', 1),
(22, 'RobsLiquor', 'cupcake', 1),
(23, 'LTDgasoline', 'cupcake', 1),
(24, 'TwentyFourSeven', 'cocacola', 2),
(25, 'RobsLiquor', 'cocacola', 2),
(26, 'LTDgasoline', 'cocacola', 2),
(27, 'TwentyFourSeven', 'icetea', 2),
(28, 'RobsLiquor', 'icetea', 2),
(29, 'LTDgasoline', 'icetea', 2),
(30, 'TwentyFourSeven', 'redbull', 5),
(31, 'RobsLiquor', 'redbull', 5),
(32, 'LTDgasoline', 'redbull', 5),
(33, 'Flics', 'donuts', 2),
(34, 'Flics', 'coffee', 1),
(35, 'Accessoires', 'silencieux', 1000),
(36, 'Accessoires', 'flashlight', 500),
(37, 'Accessoires', 'grip', 1000),
(38, 'Accessoires', 'yusuf', 5000),
(39, 'LTDgasoline', 'beer', 5),
(41, 'LTDgasoline', 'vodka', 10),
(42, 'LTDgasoline', 'tequila', 10),
(43, 'LTDgasoline', 'whisky', 15),
(44, 'RobsLiquor', 'beer', 5),
(46, 'RobsLiquor', 'vodka', 8),
(47, 'RobsLiquor', 'tequila', 10),
(48, 'RobsLiquor', 'whisky', 15),
(49, 'TwentyFourSeven', 'lighter', 2),
(50, 'RobsLiquor', 'lighter', 2),
(51, 'LTDgasoline', 'lighter', 2),
(52, 'LTDgasoline', 'cigarett', 1),
(53, 'Accessoires', 'blackberry', 10000);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
