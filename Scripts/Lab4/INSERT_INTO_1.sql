/*INSERT_SELECT(1)*/
-- Вставить героев из таблицы heroes в таблицу heroes_test
INSERT INTO heroes_test(name, feature, biography, TypeOfFight, LevelNumber)
SELECT name, feature, biography, TypeOfFight, LevelNumber FROM heroes;