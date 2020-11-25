use towerdefensemain;
-- UPDATE(7)
-- Обновить количество волн у карты с названием Ведьмины острова
UPDATE maps
SET waves=20
WHERE name="Ведьмины острова" limit 1;

-- Обновить количество волн у карт с количеством волн 10 и установить им количество волн 20 и levelnumber=10
UPDATE maps
SET waves=20, levelnumber=10
WHERE waves=10 limit 5;

-- Добавить 10 волн ко всем картам в которых есть название "Дерево"
UPDATE maps
SET waves=maps.waves+10
WHERE name LIKE '%Дерево%' limit 10;

-- Установим всем товарам в тестовой таблице минимальную цену товара равным 200.
UPDATE goods_test
SET price=200
WHERE price<200 limit 10;

-- Изменить цену товаров по айди 1 5 8 на +50 и изменить их название на (старое название + символ плюса)
UPDATE goods_test
SET 
price=goods_test.price+50,
name = CONCAT(goods_test.name, '+')
WHERE id=1 or id=5 or id=8;

-- Понизить все цены товаров на 10%
UPDATE goods_test
SET 
price=goods_test.price*(1-10/100)
WHERE id=goods_test.id limit 10;

-- Установить скидку 50% на последние 5 товаров
UPDATE goods_test
SET 
price=goods_test.price*(1-50/100)
WHERE id=goods_test.id order by id DESC limit 5;

