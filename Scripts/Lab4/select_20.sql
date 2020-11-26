use towerdefensemain;
-- EVENTS(3)
-- Показать таблицу с событиями(евентами)
SELECT * FROM events;
-- Показать евенты где 3 условия И награда выше 5000
SELECT * FROM events
WHERE countofconditions=3 AND reward>5000;
-- Показать имена событий, даты их начала, награды, переименовав столбцы
SELECT name AS "Название события", datestart AS "Дата начала", reward AS "Награда" FROM events;

-- HEROES(3)
-- Показать всех героев с ближним боем
SELECT * FROM heroes
WHERE typeoffight = "Ближний";
-- Показать всех героев, которые имеют ближни или дальний бой и требуемый уровень которых меньше 20
SELECT * FROM heroes
WHERE typeoffight IN ("Ближний", "Дальний") AND levelnumber<20;
-- Вывести все уникальные значения тип атаки у героев назвав столбец "Типы атаки"
SELECT DISTINCT typeoffight AS "Типы атаки" FROM heroes;

-- USERS(4)
-- Показать только имена(ники) пользователей дав название столбцу "Пользователи"
SELECT name  AS Пользователи FROM users;
-- Вывести имена и статус(isadmin) всех пользователей отсортировав их по статусу(сначала админы)+переименовать столбцы
SELECT name AS "Имя", isadmin AS "Админстратор" FROM users ORDER BY isadmin DESC;
-- Вывести всех пользователей у которых есть башня с айди 1, переименовав при этом столбец в "Пользователи с башней 1"
SELECT name  AS "Пользователи с башней 1" FROM users, users_to_towers
WHERE users.id=users_to_towers.user_id and users_to_towers.tower_id=1;
-- Показать пользователей, у которых уровень >= 50
SELECT users.id, users.name, users_to_levels.level_id AS "Уровень"  FROM users, users_to_levels
WHERE users.id=users_to_levels.user_ID AND users_to_levels.level_id>=50;

-- GOODS(3)
-- Показать товары, цена которых от 100 до 300
SELECT * FROM goods
WHERE price BETWEEN 100 and 300;
-- Показать товары, цена которых ниже 500
SELECT * FROM goods
WHERE price <500;
-- Показать цену 5 товаров каждого вида 
SELECT *, goods.price*5 AS "Цена за 5 товаров" FROM goods;

-- MAPS(3)
-- Вывести названия всех карт отсортировав по алфавиту
SELECT name AS "Название карты" FROM maps ORDER BY name;
-- Вывести все карты которые не содержат количество волн равное 0 и 100 и не требуют уровень 0
SELECT * FROM maps
WHERE waves NOT IN(0, 100) AND NOT levelnumber=0;
-- Вывести все карты доступные на 10 уровне
SELECT * FROM maps
WHERE levelnumber <=10;

-- EQUIPMENTS(3)
-- Вывести экипировку, которая ничего не требует(нет условий использования)
SELECT * FROM equipments
WHERE conditions IS NULL;
-- Вывести всю экипировку где в названии содержится "Амулет"
SELECT * FROM equipments
WHERE name LIKE '%Амулет%';
-- Показать названия предметов (их описание и условия использования), у которых есть условие использования "уровень"
SELECT name, description, conditions FROM equipments
WHERE conditions LIKE '%Уровень:%';

-- USERS_TO_PUMPS(1)
-- Вывести id всех пользователей и id всех прокачек и уровень прокачки. если пользователь прокачал "прокачку" как минимум до 3-го уровня(остортировать по айди пользователя)
SELECT user_id, pump_id, level FROM users_to_pumps
WHERE level>=3 ORDER BY user_id;