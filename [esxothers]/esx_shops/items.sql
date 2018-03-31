-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Sam 31 Mars 2018 à 12:34
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
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `items`
--

INSERT INTO `items` (`id`, `name`, `label`, `limit`, `rare`, `can_remove`) VALUES
(1, 'alive_chicken', '🐓 Poulet vivant', -1, 0, 1),
(2, 'slaughtered_chicken', '🐔 Poulet abattu', -1, 0, 1),
(3, 'packaged_chicken', '🍗Poulet en barquette', -1, 0, 1),
(4, 'fish', '🐟Poisson', -1, 0, 1),
(5, 'stone', '🚛 Pierre', -1, 0, 1),
(6, 'washed_stone', '🚛 Pierre Lavée', -1, 0, 1),
(7, 'copper', '🔶 Cuivre', -1, 0, 1),
(8, 'iron', '🎛️ Fer', -1, 0, 1),
(9, 'gold', '🎟️ Or', -1, 0, 1),
(10, 'diamond', '💎Diamant', -1, 0, 1),
(11, 'wood', '📦 Bois', -1, 0, 1),
(12, 'cutted_wood', '📦 Bois coupé', -1, 0, 1),
(13, 'packaged_plank', '📦 Paquet de planches', -1, 0, 1),
(14, 'petrol', '🛢️ Pétrole', -1, 0, 1),
(15, 'petrol_raffin', '🛢️ Pétrole Raffiné', -1, 0, 1),
(16, 'essence', '⛽ Essence', -1, 0, 1),
(17, 'whool', '🐑 Laine', 40, 0, 1),
(18, 'fabric', '👔 Tissu', 40, 0, 1),
(19, 'clothe', '👚Vêtement', 40, 0, 1),
(20, 'gazbottle', 'Bouteille de gaz', -1, 0, 1),
(21, 'fixtool', 'Outils réparation', -1, 0, 1),
(22, 'carotool', 'Outils carosserie', -1, 0, 1),
(23, 'blowpipe', 'Chalumeaux', -1, 0, 1),
(24, 'fixkit', '🔨 Kit réparation', 20, 0, 1),
(25, 'carokit', '🛠️ Kit carosserie', 20, 0, 1),
(26, 'bandage', '🚨 Bandage', 20, 0, 1),
(27, 'medikit', '🚑 Medikit', 20, 0, 1),
(28, 'bread', '🍞 Bread', -1, 0, 1),
(29, 'water', '🥛 Eau', -1, 0, 1),
(30, 'weed', '🌿 Weed', 180, 0, 1),
(31, 'weed_pooch', '🚬 Pochon de weed', 36, 0, 1),
(32, 'coke', '🌿 Coke', 180, 0, 1),
(33, 'coke_pooch', '💨 Pochon de coke', 36, 0, 1),
(34, 'meth', '💊 Pseudoephedrine', 180, 0, 1),
(35, 'meth_pooch', '💊 Pochon de meth', 36, 0, 1),
(36, 'opium', '📋 Faux Papiers', 180, 0, 1),
(37, 'opium_pooch', '🗃️ Carton de faux papiers', 36, 0, 1),
(38, 'wine', '🍷 Vin', 50, 0, 1),
(39, 'beer', '🍺 Bière', 50, 0, 1),
(40, 'vodka', '🍸 Vodka', 50, 0, 1),
(41, 'chocolate', '🍫 Chocolat', -1, 0, 1),
(42, 'sandwich', '🥪 Sandwich', -1, 0, 1),
(43, 'hamburger', '🍔 Hamburger', -1, 0, 1),
(44, 'tequila', '🍹 Tequila', 50, 0, 1),
(45, 'whisky', '🥃 Whisky', 50, 0, 1),
(46, 'cupcake', '🍪 Cupcake', 50, 0, 1),
(47, 'cocacola', '🥤 Coca-Cola', 50, 0, 1),
(48, 'icetea', '🥤 Ice-Tea', 50, 0, 1),
(49, 'redbull', '🥤 Redbull', 50, 0, 1),
(50, 'donuts', '🍩 Donuts', 50, 0, 1),
(51, 'coffee', '☕ Café', 50, 0, 1),
(52, 'clip', '🔫 Chargeur', -1, 0, 1),
(53, 'viande', '🥩 Viande de gibier', -1, 0, 1),
(54, 'cigarett', '🚬 Cigarettes', -1, 0, 1),
(55, 'lighter', '🔥 Zippo', -1, 0, 1),
(207, 'silencieux', 'Silencieux', -1, 0, 1),
(208, 'flashlight', '🔦 Lampe', -1, 0, 1),
(209, 'grip', 'Poignée', -1, 0, 1),
(210, 'yusuf', 'Skin de luxe', -1, 0, 1),
(2011, 'jager', '🍸 Jägermeister', 50, 0, 1),
(2012, 'rhum', '🍸 Rhum', 50, 0, 1),
(2013, 'martini', '🍸 Martini blanc', 50, 0, 1),
(2014, 'soda', '🥤 Soda', 50, 0, 1),
(2015, 'jusfruit', '🥤 Jus de fruits', 50, 0, 1),
(2016, 'energy', '🥤 Energy Drink', 50, 0, 1),
(2017, 'drpepper', '🥤 Dr. Pepper', 50, 0, 1),
(2018, 'limonade', '🥤 Limonade', 50, 0, 1),
(2019, 'bolcacahuetes', '🥨 Bol de cacahuètes', 50, 0, 1),
(2020, 'bolnoixcajou', '🥨 Bol de noix de cajou', 50, 0, 1),
(2021, 'bolpistache', '🥨 Bol de pistaches', 50, 0, 1),
(2022, 'bolchips', '🥨 Bol de chips', 50, 0, 1),
(2023, 'saucisson', '🥓 Saucisson', 50, 0, 1),
(2024, 'grapperaisin', '🍇 Grappe de raisin', 50, 0, 1),
(2025, 'jagerbomb', '🍾 Jägerbomb', 50, 0, 1),
(2026, 'golem', '🍾 Golem', 50, 0, 1),
(2027, 'whiskycoca', '🥃 Whisky-coca', 50, 0, 1),
(2028, 'vodkaenergy', '🍹 Vodka-energy', 50, 0, 1),
(2029, 'vodkafruit', '🍹 Vodka-jus de fruits', 50, 0, 1),
(2030, 'rhumfruit', '🍹 Rhum-jus de fruits', 50, 0, 1),
(2031, 'teqpaf', '🍹 Teq\'paf', 50, 0, 1),
(2032, 'rhumcoca', '🍹 Rhum-coca', 50, 0, 1),
(2033, 'mojito', '🍹 Mojito', 50, 0, 1),
(2034, 'ice', '❄️ Glaçon', 50, 0, 1),
(2035, 'mixapero', '🍱 Mix Apéritif', 50, 0, 1),
(2036, 'metreshooter', '🍾 Mètre de shooter', 50, 0, 1),
(2037, 'jagercerbere', '🍾 Jäger Cerbère', 50, 0, 1),
(2038, 'menthe', '🌱 Feuille de menthe', 50, 0, 1),
(2039, 'raisin', '🍇 Raisin', -1, 0, 1),
(2040, 'jus_raisin', '🍷 Jus de raisin', -1, 0, 1),
(2041, 'grand_cru', '🥂 Grand cru', -1, 0, 1),
(2043, 'poubelle', '🗑️ Poubelle', 100, 0, 1),
(2044, 'cerveau', '🧠 Cerveau', 1, 0, 1),
(2045, 'coeur', '❤️ Coeur', 1, 0, 1),
(2046, 'moelle', 'Grammes de Moelle', 40, 0, 1),
(2047, 'intestin', '🥓 Intestin', 11, 0, 1),
(2048, 'os', '☠️ Os', 206, 0, 1),
(2049, 'organ_pooch', '⚰️ Corps humain', 1, 0, 1),
(2050, 'malt', '🌾 Malt', -1, 0, 1),
(2051, 'melange', 'Mélange', -1, 0, 1),
(2052, 'feuilletabac', '🌱 Feuilles de tabac', -1, 0, 1),
(2053, 'tabac', 'Tabac', -1, 0, 1),
(2054, 'cproducts', '⚗️ Produits Chimiques', -1, 0, 1),
(2055, 'pillz', '💊 Medicaments', -1, 0, 1),
(2056, 'sacbillets', '💰 Sac de Billets', 100, 0, 1),
(2057, 'contrat', '📃 Facture', 100, 0, 1),
(2058, 'blackberry', '💻 Puce cryptée', 1, 0, 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2059;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
