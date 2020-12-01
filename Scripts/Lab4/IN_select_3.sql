/*ВЛОЖЕННЫЕ SELECTы(3)*/
-- Вывести пользователей и количество их героев, отсеяв пользователей не имеющих героев
SELECT U.id AS User_ID, (SELECT COUNT(*) FROM users_to_heroes WHERE U.id=users_to_heroes.user_id) AS "CountHeroes" FROM users U
WHERE (SELECT COUNT(*) FROM users_to_heroes WHERE U.id=users_to_heroes.user_id) > 0;

-- Вывести id пользователя(ей) с наибольшим количество уровней
SELECT user_id, level_id FROM users_to_levels WHERE level_id=(SELECT MAX(level_id) FROM users_to_levels);

-- Вывести героев и их экипировка(где экипировка выражена названием)
SELECT heroes.name AS Герой, (SELECT name AS Герой FROM equipments WHERE equipments_to_heroes.equipment_id=id) AS Предмет 
FROM heroes, equipments_to_heroes 
WHERE equipments_to_heroes.hero_id=heroes.id ORDER BY Герой;