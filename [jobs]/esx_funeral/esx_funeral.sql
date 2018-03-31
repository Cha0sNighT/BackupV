INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('funeral', 'Pompes Funèbres', 0);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('funeral', 0, 'interim', 'Intérimaire', 400, '{}', '{}');

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('organ_pooch', '⚰️ Corps humain', 100, 0, 1);
