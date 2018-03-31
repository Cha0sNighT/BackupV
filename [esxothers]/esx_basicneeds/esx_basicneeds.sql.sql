--
-- Estrutura da tabela `items`
--

CREATE TABLE IF NOT EXISTS `items` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `limit` int(11) NOT NULL DEFAULT -1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `items`
--

INSERT INTO `items` (`id`, `name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('bread', 'Bread', -1, 0, 1),
('water', 'Water', -1, 0, 1),
('wine', 'Wine', -1, 0, 1),
('beer', 'Beer', -1, 0, 1),
('vodka', 'Vodka', -1, 0, 1),
('chocolate', 'Chocolate', -1, 0, 1),
('sandwich', 'Sandwich', -1, 0, 1),
('hamburger', 'Hamburger', -1, 0, 1),
('tequila', 'Tequila', -1, 0, 1),
('whisky', 'Whisky', -1, 0, 1),
('cupcake', 'Cupcake', -1, 0, 1),
('cocacola', 'Coca-Cola', -1, 0, 1),
('icetea', 'Ice-Tea', -1, 0, 1),
('redbull', 'Coffe', -1, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;

