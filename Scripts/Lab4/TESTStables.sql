
/*ТЕСТОВАЯ ТАБЛИЦА С ТОВАРАМИ
drop table goods_test;

CREATE TABLE IF NOT EXISTS goods_test(
ID int primary key auto_increment,
Name varchar(50) not null,
Price bigint not null);
INSERT INTO goods_test (`id`, `name`, `price`) VALUES ('1', 'Дорожные шипы', '120');
INSERT INTO goods_test (`id`, `name`, `price`) VALUES ('2', 'Баррикада', '100');
INSERT INTO goods_test (`id`, `name`, `price`) VALUES ('3', 'Элитный лучник', '250');
INSERT INTO goods_test (`id`, `name`, `price`) VALUES ('4', 'Тотем усиления', '150');
INSERT INTO goods_test (`id`, `name`, `price`) VALUES ('5', 'Высотка', '200');
INSERT INTO goods_test (`id`, `name`, `price`) VALUES ('6', 'Дерево восполнения', '300');
INSERT INTO goods_test (`id`, `name`, `price`) VALUES ('7', 'Дерево лечения', '500');
INSERT INTO goods_test (`id`, `name`, `price`) VALUES ('8', 'Тотем проклятия', '300');
INSERT INTO goods_test (`id`, `name`, `price`) VALUES ('9', 'Страж', '500');
INSERT INTO goods_test (`id`, `name`, `price`) VALUES ('10', 'Замораживающая ловушка', '200');

select * from goods_test;
*/

/*ТЕСТОВАЯ ТАБЛИЦА ГЕРОЕВ
drop table heroes_test;

CREATE TABLE IF NOT EXISTS heroes_test(
ID int primary key auto_increment,
Name varchar(50) not null,
Feature text not null,
Biography text not null,
LevelNumber int not null,
foreign key(LevelNumber) references levels(Number));

ALTER TABLE heroes_test 
ADD COLUMN `TypeOfFight` VARCHAR(20) NOT NULL DEFAULT 'Ближний' AFTER `Biography`;

INSERT INTO heroes_test (`Name`, `Feature`, `Biography`, `LevelNumber`) VALUES ('Адора', 'Лучница, быстрая стрельба, ядовитые стрелы.', 'Родилась неподалеку от реки «Элебра», любила эту реку, и прилежащий к нему лес. Позже решила защищать реку и лес от незваных гостей', '1');
INSERT INTO heroes_test (`Name`, `Feature`, `Biography`, `LevelNumber`) VALUES ('Аркантус', 'Герой ближнего боя, большой и быстрый урон.', 'Родился в деревне неподалеку от леса, в детстве вредил лесу, срубая ветки с деревьев, в то время сделал себе первое свое копье(именно с ним он сейчас ходит) позже, после того, как он увидел энта, понял что лес живой, и то, что в свое время ему очень вредил, встал на защиту лесных просторов, оставил себе сделанное когда-то копье, в знак напоминания, что ему нужно делать.', '5');
INSERT INTO heroes_test (`Name`, `Feature`, `Biography`, `LevelNumber`) VALUES ('Элизи', 'Ведьма, атакующая на коротком расстоянии, понижает характеристики врагов при атаке', 'Единственная ведьма на весь лес, неизвестно откуда она, и как пришла к такой жизни. Никому не позволит подойти к своему убежищу(Самый старый в лесу Энт) именно поэтому она решила помочь в защите леса.', '10');
INSERT INTO heroes_test (`Name`, `Feature`, `Biography`, `LevelNumber`) VALUES ('Грем', 'Танк, ближний бой, останавливает противников пока дерется с ними, имеет большой запас здоровья.', 'Сын лесоруба. Многие лесные жители его не любят, он был и есть лесоруб, но лесоруб, который не позволит трогать его дереавья, он встал на защиту леса только со своими коварными целями, в любой момент может предать наше дело.', '10');
INSERT INTO heroes_test (`Name`, `Feature`, `Biography`, `LevelNumber`) VALUES ('Ангор', 'Маг, усиливает все башни по близости, атакует быстро на короткое расстояние.', 'Пришел из дальних земель, по его словам, он там оставил приемника защищать те земли, но неизвестно где эти земли, маг издает усиливающую ауру.', '12');
INSERT INTO heroes_test (`Name`, `Feature`, `Biography`, `LevelNumber`) VALUES ('Якс', 'Друид, атакующий магией природы', 'Человек, выросший среди деревьев, воспитанный энтами, без раздумий вставший на защиту леса', '15');
INSERT INTO heroes_test (`Name`, `Feature`, `Biography`, `LevelNumber`) VALUES ('Палон', 'Быстрый лучник с посохом, имеющий как ближний, так и дальний бой', 'Все детство в своей деревне стрелял из лука и дрался с друзьями на палках, в итоге овладел искусством лучника и боя на посохах. Любит природу, и не любит когда ей вредят.', '15');
INSERT INTO heroes_test (`Name`, `Feature`, `Biography`, `LevelNumber`) VALUES ('Эмдал', 'Медленный танк, атакующий по области', 'Кузнец из далеких земель, после потери смысла делать оружие, после долгих поисков дела, решил помочь защищать лес.', '18');
INSERT INTO heroes_test (`Name`, `Feature`, `Biography`, `LevelNumber`) VALUES ('Сейрус', 'Воин, иногда входящий в невидимость', 'Обучался в храме «Дэла», освоил искусство вхождения в невидимость, наемник, брат Кастора', '20');
INSERT INTO heroes_test (`Name`, `Feature`, `Biography`, `LevelNumber`) VALUES ('Кастор', 'Воин, быстро атакующий своими двумя клинками.', 'Обучался в храме «Дэла», обладал наивысшей скоростью атаки в храме, наемник, брат Сейруса.', '25');

UPDATE heroes_test SET `TypeOfFight` = 'Дальний' WHERE (`ID` = '1');
UPDATE heroes_test SET `TypeOfFight` = 'Магия' WHERE (`ID` = '3');
UPDATE heroes_test SET `TypeOfFight` = 'Магия' WHERE (`ID` = '5');
UPDATE heroes_test SET `TypeOfFight` = 'Магия' WHERE (`ID` = '6');
UPDATE heroes_test SET `TypeOfFight` = 'Дальний' WHERE (`ID` = '7');

select * from heroes_test;
*/