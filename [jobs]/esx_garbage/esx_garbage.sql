INSERT INTO `jobs` (`id`, `name`, `label`, `whitelisted`) VALUES
(20, 'eboueur', 'Little Pricks', 0);

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(50, 'eboueur', 0, 'interim', 'Intérimaire', 250, '{}', '{}');

INSERT INTO `items` (`id`, `name`, `label`, `limit`, `height`, `rare`, `can_remove`) VALUES
(2, 'poubelle', '🗑️ Poubelle', 100, 500, 0, 1);
