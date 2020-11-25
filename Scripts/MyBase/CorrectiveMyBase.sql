-- Исправления базы
UPDATE `towerdefensemain`.`pumps` SET `Price` = '1125' WHERE (`ID` = '4');
UPDATE `towerdefensemain`.`pumps` SET `Price` = '1000' WHERE (`ID` = '6');
UPDATE `towerdefensemain`.`pumps` SET `Price` = '820' WHERE (`ID` = '9');
UPDATE `towerdefensemain`.`pumps` SET `Price` = '600' WHERE (`ID` = '10');

ALTER TABLE `towerdefensemain`.`heroes` 
ADD COLUMN `TypeOfFight` VARCHAR(20) NOT NULL DEFAULT 'Ближний' AFTER `Biography`;

UPDATE `towerdefensemain`.`heroes` SET `TypeOfFight` = 'Дальний' WHERE (`ID` = '1');
UPDATE `towerdefensemain`.`heroes` SET `TypeOfFight` = 'Магия' WHERE (`ID` = '3');
UPDATE `towerdefensemain`.`heroes` SET `TypeOfFight` = 'Магия' WHERE (`ID` = '5');
UPDATE `towerdefensemain`.`heroes` SET `TypeOfFight` = 'Магия' WHERE (`ID` = '6');
UPDATE `towerdefensemain`.`heroes` SET `TypeOfFight` = 'Дальний' WHERE (`ID` = '7');