/*SELECT INTO(2)*/
-- Вывести сумму всех цен товаров если каждый из них взять по 5 шт
SELECT SUM(price) INTO @sumGoods FROM goods;
SELECT @sumGoods*5 as "Сумма товаров x5" FROM goods LIMIT 1;

-- Вывести сумму всех цен прокачек если каждый из них взять по 5 шт
SELECT SUM(price) INTO @sumPumps FROM pumps;
SELECT @sumPumps*5 as "Сумма прокачек x5" FROM pumps LIMIT 1; 

-- В Продолжение(Вывести сумму товаров и прокачек(по 5 шт) исходя из предыдущих запросов)
SELECT (@sumGoods+@sumPumps)*5 as "Сумма прокачек и товаров x5" FROM goods, pumps LIMIT 1; 