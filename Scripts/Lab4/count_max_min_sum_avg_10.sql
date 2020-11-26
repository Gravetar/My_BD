/*COUNT, MAX, MIN, SUM, AVG(10)*/
-- Вывести общее количество героев
SELECT COUNT(*) AS "Количество героев" FROM heroes;
-- Вывести количество достижений, награда которых выше или равна 5000
SELECT COUNT(*) AS "Награда выше или равная 5000" FROM achievements WHERE reward>=5000;
-- Вывести количество обычных пользователей
SELECT COUNT(*) AS "Количество обычных пользователей" FROM users WHERE isadmin=false;

-- Вывести карту(ы) с максимальным количеством волн
SELECT * FROM maps WHERE waves=(SELECT MAX(waves) FROM maps);
-- Вывести максимальную награду за евент
SELECT MAX(reward) AS "Максимальная награда за событие" FROM events;

-- Вывести способности с наименшой ценой
SELECT * FROM powers WHERE price=(SELECT MIN(price) FROM powers);

-- Показать общее количество денег, которые сейчас есть у всех пользователей
SELECT SUM(money) AS "Общее кол-во денег у пользователей" FROM users;
-- Показать суммарное количество заданий из ивентов, которые уже можно выполнить
SELECT SUM(countofconditions) FROM events WHERE DateStart<=curdate();

-- Вывести срднее значение уровеня пользователя
SELECT AVG(level_id) AS "Средний уровень пользователя" FROM users_to_levels;
-- Вывести среднее значение награды за евенты с количество заданий равное трем
SELECT AVG(reward) FROM events WHERE countofconditions = 3;
