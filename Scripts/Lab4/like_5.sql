/* LIKE(5) */
-- Вывести все предметы(equipments) которые требуют интеллект
SELECT * FROM equipments WHERE conditions LIKE ("%Интеллект%");
-- Вывести пользователей у которых "десяток" из айди = 1
SELECT * FROM users WHERE id LIKE ("1_");
-- Вывести все события(events), которые в условиях(conditions) не требует проходить карты.
SELECT * FROM events WHERE conditions NOT LIKE ("%Пройти карту%");
-- Найти все способности которые работают в процентном виде
SELECT * FROM powers WHERE Feature LIKE ("%#%%") ESCAPE '#';
-- Вывести всех "атакующих" героев
SELECT * FROM heroes WHERE feature LIKE ("%атакующий%");