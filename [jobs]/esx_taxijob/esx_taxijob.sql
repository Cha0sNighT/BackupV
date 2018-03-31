USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_taxi','Taxi',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_taxi','Taxi',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('taxi','Taxi')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('taxi',0,'recrue','Recrue',1000,'{}','{}'),
  ('taxi',1,'novice','Novice',1200,'{}','{}'),
  ('taxi',2,'experimente','Experimente',1400,'{}','{}'),
  ('taxi',3,'boss','Patron',2000,'{}','{}')
;
