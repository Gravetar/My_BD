/*LIMIT(5)*/
-- Показать 5 пользователей начиная с 10
SELECT * FROM users LIMIT 5 offset 9;
-- ИЛИ похожее(Показать 3 башни начиная с 5)
SELECT * FROM towers LIMIT 4, 3;

-- Показать название одной карты
SELECT name FROM maps LIMIT 1;

-- Показать первые 3 событий у которых награда выше 5000
SELECT * FROM events WHERE reward>5000 LIMIT 3;

-- 5 Самых дорогих товаров
SELECT * FROM goods ORDER BY price DESC LIMIT 5;