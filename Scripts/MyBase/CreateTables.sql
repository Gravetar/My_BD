CREATE DATABASE IF NOT EXISTS towerdefensemain;

use towerdefensemain;

CREATE TABLE IF NOT EXISTS goods(
ID int primary key auto_increment,
Name varchar(50) not null,
Price bigint not null);

CREATE TABLE IF NOT EXISTS powers(
ID int primary key auto_increment,
Name varchar(50) not null,
Feature text not null,
Price bigint not null);

CREATE TABLE IF NOT EXISTS equipments(
ID int primary key auto_increment,
Name varchar(50) not null,
Description text not null,
Conditions text not null);

CREATE TABLE IF NOT EXISTS characteristic(
ID int primary key auto_increment,
Name varchar(50) not null);

CREATE TABLE IF NOT EXISTS users(
ID int primary key auto_increment,
Name varchar(20) not null,
IsAdmin bool not null,
Money bigint not null);

CREATE TABLE IF NOT EXISTS enemies(
ID int primary key auto_increment,
ModelURL varchar(1000) not null);

CREATE TABLE IF NOT EXISTS pumps(
ID int primary key auto_increment,
Name varchar(50) not null,
Price bigint not null,
Level bigint not null);

CREATE TABLE IF NOT EXISTS levels(
Number int primary key);

CREATE TABLE IF NOT EXISTS events(
ID int primary key auto_increment,
Description text not null,
Conditions text not null,
CountOFConditions int not null,
Reward bigint not null,
Name varchar(50) not null,
DateStart date not null);

CREATE TABLE IF NOT EXISTS heroes(
ID int primary key auto_increment,
Name varchar(50) not null,
Feature text not null,
Biography text not null,
LevelNumber int not null,
foreign key(LevelNumber) references levels(Number));

CREATE TABLE IF NOT EXISTS maps(
ID int primary key auto_increment,
Name varchar(50) not null,
Waves bigint not null,
LevelNumber int not null,
foreign key(LevelNumber) references levels(Number));

CREATE TABLE IF NOT EXISTS achievements(
ID int primary key auto_increment,
Name varchar(50) not null,
Reward bigint not null,
LevelNumber int not null,
foreign key(LevelNumber) references levels(Number));

CREATE TABLE IF NOT EXISTS towers(
ID int primary key auto_increment,
Name varchar(50) not null,
ModelURL varchar(1000) not null,
ImageURL varchar(1000) not null,
LevelNumber int not null,
foreign key(LevelNumber) references levels(Number));

CREATE TABLE IF NOT EXISTS valuesofcharacteristic(
Value bigint primary key,
Characteristic_ID int not null,
Power_ID int,
Equipment_ID int,
Hero_ID int,
Enemy_ID int,
Tower_ID int,
foreign key(Characteristic_ID) references characteristic(ID),
foreign key(Power_ID) references powers(ID),
foreign key(Equipment_ID) references Equipments(ID),
foreign key(Hero_ID) references heroes(ID),
foreign key(Enemy_ID) references enemies(ID),
foreign key(Tower_ID) references towers(ID));

CREATE TABLE IF NOT EXISTS users_to_goods(
ID int primary key auto_increment,
user_ID int not null,
good_ID int not null,
foreign key(user_ID) references users(ID),
foreign key(good_ID) references goods(ID)
);

CREATE TABLE IF NOT EXISTS users_to_powers(
ID int primary key auto_increment,
user_ID int not null,
power_ID int not null,
foreign key(user_ID) references users(ID),
foreign key(power_ID) references powers(ID)
);

CREATE TABLE IF NOT EXISTS users_to_heroes(
ID int primary key auto_increment,
user_ID int not null,
hero_ID int not null,
foreign key(user_ID) references users(ID),
foreign key(hero_ID) references heroes(ID)
);

CREATE TABLE IF NOT EXISTS users_to_pumps(
ID int primary key auto_increment,
user_ID int not null,
pump_ID int not null,
foreign key(user_ID) references users(ID),
foreign key(pump_ID) references pumps(ID)
);

CREATE TABLE IF NOT EXISTS users_to_events(
ID int primary key auto_increment,
user_ID int not null,
event_ID int not null,
foreign key(user_ID) references users(ID),
foreign key(event_ID) references events(ID)
);

CREATE TABLE IF NOT EXISTS users_to_towers(
ID int primary key auto_increment,
user_ID int not null,
tower_ID int not null,
foreign key(user_ID) references users(ID),
foreign key(tower_ID) references towers(ID)
);

CREATE TABLE IF NOT EXISTS users_to_levels(
ID int primary key auto_increment,
user_ID int not null,
level_ID int not null,
foreign key(user_ID) references users(ID),
foreign key(level_ID) references levels(Number)
);

CREATE TABLE IF NOT EXISTS enemies_to_maps(
ID int primary key auto_increment,
enemy_ID int not null,
map_ID int not null,
foreign key(enemy_ID) references enemies(ID),
foreign key(map_ID) references maps(ID)
);

CREATE TABLE IF NOT EXISTS equipments_to_heroes(
ID int primary key auto_increment,
equipment_ID int not null,
hero_ID int not null,
foreign key(equipment_ID) references equipments(ID),
foreign key(hero_ID) references heroes(ID)
);

-- Исправление ошибок
ALTER TABLE `towerdefensemain`.`valuesofcharacteristic` 
DROP PRIMARY KEY,
ADD PRIMARY KEY (`Characteristic_ID`);
;

UPDATE `towerdefensemain`.`users_to_pumps` SET `level` = '1' WHERE (`ID` = '1');
UPDATE `towerdefensemain`.`users_to_pumps` SET `level` = '3' WHERE (`ID` = '2');
UPDATE `towerdefensemain`.`users_to_pumps` SET `level` = '2' WHERE (`ID` = '3');
UPDATE `towerdefensemain`.`users_to_pumps` SET `level` = '5' WHERE (`ID` = '4');
UPDATE `towerdefensemain`.`users_to_pumps` SET `level` = '3' WHERE (`ID` = '5');
UPDATE `towerdefensemain`.`users_to_pumps` SET `level` = '2' WHERE (`ID` = '6');
UPDATE `towerdefensemain`.`users_to_pumps` SET `level` = '1' WHERE (`ID` = '7');
UPDATE `towerdefensemain`.`users_to_pumps` SET `level` = '3' WHERE (`ID` = '8');
UPDATE `towerdefensemain`.`users_to_pumps` SET `level` = '2' WHERE (`ID` = '9');
UPDATE `towerdefensemain`.`users_to_pumps` SET `level` = '2' WHERE (`ID` = '10');