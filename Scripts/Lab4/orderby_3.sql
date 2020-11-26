/*ORDER BY(3)*/
-- Показать врагов отсортированных по здоровью в порядке возрастания
SELECT * FROM enemies
ORDER BY health ASC;

-- Показать всех врагов в первую очередь в порядке возрастания награды, во вторую очередь в порядке убывания здоровья
SELECT * FROM enemies
ORDER BY reward ASC, health DESC;

-- Отсортируем товары по убыванию цены, при условии что их цена меньше 500
SELECT * FROM goods
WHERE price<500
ORDER BY price DESC;