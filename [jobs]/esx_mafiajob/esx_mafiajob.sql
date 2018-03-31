INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_armurier','Armurier',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_armurier','Armurier',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_armurier', 'Armurier', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('armurier', 'Armurerie', 1);


INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('armurier', 0, 'soldato', 'Recrue', 0, '{}', '{}'),
('armurier', 2, 'mafioso', 'Mafioso', 0, '{}', '{}'),
('armurier', 3, 'capo', 'Capo', 0, '{}', '{}'),
('armurier', 4, 'assassin', 'Assassin', 0, '{}', '{}'),
('armurier', 5, 'consigliere', 'Consigliere', 0, '{}', '{}'),
('armurier', 6, 'boss', 'Patronne', 0, '{}', '{}');