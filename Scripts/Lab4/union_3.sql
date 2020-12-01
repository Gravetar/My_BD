/*UNION(3)*/
-- Вывести все товары и прокачки(название и цена)
SELECT name, price FROM goods
UNION SELECT name, price FROM pumps;

-- Вывести все записи героев из двух таблиц(вывод без айди)
SELECT name, feature, biography, typeoffight, levelnumber FROM heroes
UNION ALL SELECT name, feature, biography, typeoffight, levelnumber FROM heroes_test;

-- Вывести все УНИКАЛЬНЫЕ записи героев из двух таблиц(вывод без айди)
SELECT name, feature, biography, typeoffight, levelnumber FROM heroes
UNION SELECT name, feature, biography, typeoffight, levelnumber FROM heroes_test;