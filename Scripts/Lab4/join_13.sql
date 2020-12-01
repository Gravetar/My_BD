/*JOIN(13)*/
-- Показать всех пользователей и количество товаров, которые они имеют
SELECT users.name AS "Пользователь", COUNT(users_to_goods.user_id) AS Товары FROM users
LEFT JOIN users_to_goods
ON users_to_goods.user_ID=users.id
GROUP BY users_to_goods.user_id
ORDER BY Товары DESC;

-- Показать какие способности может купить пользователь
SELECT u.name, u. money, p.name, p.price FROM users AS u
INNER JOIN powers AS p
ON p.Price<u.Money;

-- Показать башни и пользователей, которые их имеют
SELECT utt.tower_id AS Башня, u.name AS Пользователь FROM users_to_towers AS utt
LEFT OUTER JOIN users AS u
ON u.id=utt.user_id
ORDER BY utt.tower_ID;

-- Показать все возможные сочетания goods и powers
SELECT * FROM goods
CROSS JOIN powers;

-- Показать всех пользователей у которых есть набор способность+прокачка
SELECT user_id, power_id, pump_id from users_to_powers AS utpo
NATURAL JOIN users_to_pumps AS utpu;

-- Вывести все способности, которые не имеет ни один из пользователей
SELECT * FROM users_to_powers
RIGHT OUTER JOIN powers
ON powers.id=users_to_powers.power_ID
WHERE power_ID IS NULL
ORDER BY power_ID;

-- Вывести все карты не имеющие врагов
SELECT * FROM enemies_to_maps
RIGHT OUTER JOIN maps
ON maps.id=enemies_to_maps.map_ID
WHERE enemy_ID IS NULL;

-- Вывести всех пользователей и товары, которые они имеют, отсортировать по товарам
SELECT u.name AS Пользователь, g.name AS Товар FROM users_to_goods AS utg
INNER JOIN goods AS g
ON g.id=utg.good_id
RIGHT OUTER JOIN users AS u
ON utg.user_ID=u.id
ORDER BY g.name;

-- Вывести всех пользователей по именам, и способности, которые они имеют(по айди)
SELECT u.name, utp.power_ID FROM users_to_powers AS utp
RIGHT JOIN users AS u
ON utp.user_ID=u.id;

-- Вывести все события и пользователей, которые прошли эти события
SELECT e.name, ute.user_ID, u.name FROM events AS e
LEFT OUTER JOIN users_to_events AS ute
ON ute.event_ID=e.id
LEFT OUTER JOIN users AS u
ON ute.user_ID=u.id;

-- Вывести врагов на карте и все карты
SELECT * FROM enemies_to_maps
RIGHT OUTER JOIN maps
ON maps.id=enemies_to_maps.map_ID
ORDER BY enemy_ID;

-- Вывести экипировки(название) и героев, владеющие этой экипировкой
SELECT e.name, eth.hero_ID FROM equipments AS e
INNER JOIN equipments_to_heroes AS eth
ON e.id=eth.equipment_ID
ORDER BY eth.hero_id;

-- Вывести героев и количество предметов, которые они имеют
SELECT h.name AS "Имя героя", COUNT(*) AS "Количество предметов" FROM equipments AS e
INNER JOIN equipments_to_heroes AS eth
INNER JOIN heroes AS h
ON e.id=eth.hero_ID AND eth.hero_ID=h.id
GROUP BY e.id;