/*GROUP BY, HAVING(5)*/
-- Количество пользователей имеющик башни
SELECT tower_id AS "Башня", COUNT(user_id) AS "Количество пользователей" from users_to_towers
GROUP BY tower_id;

-- Количество товаров по ценам от 100 до 300-> до 500
SELECT price AS "Цена", COUNT(*) AS "Количество" FROM goods
GROUP BY price<300,  price<500;

-- Количество героев по типам атаки +Отсортировать по количеству
SELECT typeoffight AS "Тип атаки", COUNT(typeoffight) AS "Количество героев" FROM heroes
GROUP BY typeoffight="Ближний", typeoffight="Дальний", typeoffight="Магия" ORDER BY COUNT(typeoffight) DESC;

-- Вывести способности сгруппированые по количеству у пользоватилей и отсеять способности, которые используются более 2 раз
SELECT power_id AS "Айди способности", COUNT(power_id) AS Количество FROM users_to_powers
GROUP BY power_id HAVING Количество<=2 ORDER BY Количество DESC;

-- Группировка евентов по последющим годам
SELECT DATE_FORMAT(datestart, '%Y') AS Дата, COUNT(datestart) AS "Кол-во с кол-во заданий=3" FROM events
GROUP BY DATE_FORMAT(datestart, '%Y') HAVING Дата>DATE_FORMAT(curdate(), '%Y');

