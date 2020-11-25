-- DELETE(5)
-- Удалить всех героев с типом атаки "магия"
DELETE FROM heroes_test
WHERE TypeOfFight="Магия" limit 10;

-- Удалить героя с именем Кастор
DELETE FROM heroes_test
WHERE name="Кастор" limit 10;

-- Удалить всех героев с требуемым уровнем выше или равным 15 и ниже или равен 20
DELETE FROM heroes_test
WHERE levelnumber>=15 and levelnumber<=20 limit 10;

-- Удалить последнего героя с дальним боем
DELETE FROM heroes_test
WHERE TypeOfFight="Дальний" order by id desc limit 1;

-- Удалить 4 последних героя с дальним боем или с магией
DELETE FROM heroes_test
WHERE TypeOfFight="Дальний" or TypeOfFight="Магия" order by id desc limit 4;