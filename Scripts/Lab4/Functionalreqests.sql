use towerdefense;

-- ТРАНЗАКЦИОННЫЕ
-- Добавить нового пользователя
INSERT INTO users VALUES ('10', "Kuper", true, 1000);

-- Изменять данные пользователя
Update users
set money =1000
where ID=0;

-- Удалить пользователя
DELETE FROM users
WHERE ID=10;

-- Дать пользователю административные права
UPDATE users
SET isadmin=true
WHERE id=5;

-- Добавить нового героя
INSERT INTO heroes VALUES (10, "Новый воин", "Биография нового воина", "Купер", 20);

-- Добавить новую карту
INSERT INTO maps VALUES (10, 30, "Великий холм", 10);

-- Добавить новую экипировку
INSERT INTO equipments VALUES (10, "Дает небольшую прибавку к ловкости", "Уровень: 10", "Амулет ловкости");

-- Редактировать героя
UPDATE heroes
SET feature="Это великий новый герой, доступный только избранным",
levelnumber=100
WHERE ID=10;

-- Редактировать карту
UPDATE maps
SET waves=60
WHERE id=5;

-- Редактировать экипировку
UPDATE equipments
SET name="Амулет сильной ловкости"
WHERE id=10;

-- Справочные (оперативные запросы)
-- Показать все достижения доступны до 5 уровня
SELECT * FROM achievements
WHERE number<=5 order by number;

-- Показать карты где надо пройти больше 30 волн
SELECT * FROM maps
WHERE waves>=30;

-- Показать текущие ивенты
SELECT *FROM events
WHERE datestart>=curdate();

-- Показать 3 пользователей с самой большой  игровой валютой
SELECT *FROM users
order by money desc limit 3;

-- Показать евенты с количеством условий равное 3
SELECT *FROM events
WHERE countofconditions=3;

-- Справочные расчетные(аналитические запросы)
-- Показать количество пользователей-администраторов и обычных пользователей
SELECT COUNT(*) AS CountOfUsers_Admin FROM users WHERE IsAdmin=true;

-- Показать количество пользователей, выполнивших  ивент 1
 SELECT COUNT(*) as countsofeventstousers FROM users_to_events WHERE event_id=1;

-- Показать общую награду за все ивенты
SELECT SUM(Reward) as allrewards FROM events;

-- Показать количество открытых башен и героев у пользователей
SELECT DISTINCT (users.id) as ID, (select COUNT(*) from users_to_towers where user_id=users.id) as TOWERS, (select COUNT(*) from users_to_heroes where user_id=users.id) as HEROES
from users, users_to_towers, users_to_heroes
where users.id=users_to_towers.user_id or users.id=users_to_heroes.user_id;

-- Показать общую цену всех товаров
SELECT SUM(price) as allprice FROM goods;

-- Плановые(расчетные задачи)
-- Составить расписание ивентов на 2021 год.
SELECT *FROM events as events
where DATE_FORMAT(datestart, "%Y")=2021;