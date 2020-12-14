-- ПЕРВАЯ ЧАСТЬ
SELECT MAX(reward) AS "Максимальная награда за событие" FROM eventsnew;
CREATE INDEX reward_event on eventsnew(reward);
-- Показать евенты где 3 условия И награда выше 5000
SELECT * FROM eventsnew
WHERE countofconditions=3 AND reward>5000;
CREATE INDEX countofconditions_event on eventsnew(countofconditions);

-- Показать товары, цена которых ниже 500
SELECT * FROM goodsnew
WHERE price <500;
CREATE INDEX goods_price on goodsnew(price);
DROP INDEX goods_price on goodsnew;

-- Вывести карту(ы) с максимальным количеством волн
SELECT * FROM maps WHERE waves=(SELECT MAX(waves) FROM maps);
CREATE INDEX waves_maps on maps(waves);
DROP INDEX waves_maps on maps;

-- Вывести способности с наименшой ценой
SELECT * FROM powers WHERE price=(SELECT MIN(price) FROM powers);
CREATE INDEX price_powers on powers(price);
DROP INDEX price_powers on powers;

-- Показать всех героев, которые имеют ближний или дальний бой и требуемый уровень которых меньше 20
SELECT * FROM heroes
WHERE typeoffight = "Ближний";
CREATE INDEX typeoffight_hero on heroes(typeoffight);
DROP INDEX typeoffight_hero on heroes;
-- ___________________________________________________
-- Вторая ЧАСТЬ
drop PROCEDURE CanBuyGood;

DELIMITER &&
CREATE PROCEDURE CanBuyGood (in HaveMoney int)
BEGIN
SELECT * FROM goods
WHERE price<=HaveMoney
ORDER BY price;
END&&
DELIMITER ;
CALL CanBuyGood(250);

DELIMITER &&
CREATE PROCEDURE ShowHeroesByType (in TypeFight varchar(50))
BEGIN
SELECT * FROM heroes
WHERE TypeOfFight=TypeFight;
END&&
DELIMITER ;

CALL ShowHeroesByType('Ближний');

-- Вывести башни, доступные на заданном уровне
DELIMITER &&
CREATE PROCEDURE Show_T_byLevel (in level int)
BEGIN
SELECT * FROM towers
WHERE levelnumber<=level;
END&&
DELIMITER ;

CALL Show_T_byLevel(10);
-- Вывести экипировки , которые содержат заданное слово
DELIMITER &&
CREATE PROCEDURE ShowEquipByName (in word varchar(50))
BEGIN
SELECT * FROM equipments
WHERE name LIKE (CONCAT("%", word, "%"));
END&&
DELIMITER ;

CALL  ShowEquipByName('Амулет');
-- ФУНКЦИИ
-- Функция по определению прокаченности(уровня) пользователя
DELIMITER &&
CREATE FUNCTION UserPump(lvl int)
RETURNS varchar(255)
DETERMINISTIC
BEGIN
DECLARE result varchar(255);
if (lvl<50) then
set result='Новичек';
elseif (lvl>=50 and lvl<100) then
set result='Опытный';
elseif (lvl>=100) then
set result='Сверхопытный';
end if;
RETURN(result);
END&&
DELIMITER ;

SELECT u.id as ID, u.name as Имя, utl.level_ID AS Уровень, UserPump(utl.level_ID) AS Статус FROM users as u
INNER JOIN users_to_levels AS utl
ON utl.user_id=u.id;

-- Функция, определяющая может ли пользователь приобрести заданный товар
DELIMITER &&
CREATE FUNCTION UserGoods(mon int, go int)
RETURNS varchar(255)
DETERMINISTIC
BEGIN
DECLARE result varchar(255);
DECLARE goprice int;
set goprice=(SELECT price FROM goods WHERE goods.id=go);
if (mon>=goprice) then
set result='Может приобрести';
else
set result='Не может приобрести';
end if;
RETURN(result);
END&&
DELIMITER ;

SELECT id AS ID,  UserGoods(money, 1) AS Товар_1, UserGoods(money, 8) AS Товар_8 FROM users;

drop FUNCTION UserAdminMon;
-- Функция, показывающая администратор ли заданный пользователь или имеет ли он больше заданной валюты валюты
DELIMITER &&
CREATE FUNCTION UserAdminMon(userid int, mon int)
RETURNS bool
DETERMINISTIC
BEGIN
DECLARE result bool;
DECLARE iauser bool;
DECLARE monuser int;
set iauser=(SELECT isadmin FROM users WHERE users.id=userid);
set monuser=(SELECT money FROM users WHERE users.id=userid);
if (iauser=true OR monuser>=mon) then
set result=true;
else
set result=false;
end if;
RETURN(result);
END&&
DELIMITER ;

SELECT name AS Имя, money AS Валюта, isadmin AS Администратор, UserAdminMon(users.id, 100000) AS IsPriority FROM users;
-- ПРЕДСТАВЛЕНИЯ
-- Представление об имеющиеся достижениях, пройденых евентов, уровне пользователей
drop VIEW AllHaveUser;

CREATE VIEW AllHaveUser
as
SELECT u.ID, uta.achievment_ID AS Достижения, ute.event_ID AS Пройденные_евенты, utl.level_id AS Уровень FROM users as u
LEFT JOIN users_to_achievements as uta
ON uta.user_id=u.id
LEFT JOIN users_to_events as ute
ON ute.user_id=u.id
LEFT JOIN users_to_levels as utl
ON utl.user_id=u.id;

SELECT DISTINCT ID, Уровень FROM AllHaveUser;

-- Представление о героях, и предмета, которые у них есть
CREATE VIEW HeroAndTheirEquip
as
SELECT h.Name AS Имя_Героя, h.Feature AS Особенность_Героя, e.name AS Название_предмета, e.Description AS Описание_предмета FROM heroes as h
JOIN equipments_to_heroes as eth
ON eth.hero_ID=h.id
JOIN equipments as e
ON e.id=eth.equipment_ID;

SELECT Имя_Героя, Название_предмета FROM HeroAndTheirEquip;

-- Представление о количестве открытых башен и героев у пользователей
CREATE VIEW Users_Heroes_Towers_count
as
SELECT u.id AS ID, (select COUNT(*) from users_to_towers where user_id=utt.user_id) as TOWERS, (select COUNT(*) 
from users_to_heroes where user_id=uth.user_id) as HEROES FROM users as u
LEFT JOIN users_to_heroes AS uth
ON uth.user_ID=u.id
LEFT JOIN users_to_towers AS utt
ON utt.user_ID=u.id
GROUP By u.id;

SELECT * FROM Users_Heroes_Towers_count;