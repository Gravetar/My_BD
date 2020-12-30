CREATE DATABASE  IF NOT EXISTS `towerdefensemain` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `towerdefensemain`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: towerdefensemain
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievements` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Reward` bigint NOT NULL,
  `LevelNumber` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `LevelNumber` (`LevelNumber`),
  CONSTRAINT `achievements_ibfk_1` FOREIGN KEY (`LevelNumber`) REFERENCES `levels` (`Number`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES (1,'Пройти все карты',100000,0),(2,'Открыть всех героев',3000,0),(3,'Пройти 3 эвента',1000,3),(4,'Пройти 5 эвентов',3000,3),(5,'Уничтожить 5000 врагов',5000,5),(6,'Экипировать одного героя',1000,0),(7,'Использовать все способности по 1 разу',3000,0),(8,'Повысить один из видов прокачки до 5 уровня',14000,0),(9,'Использовать одну из способностей 10 раз',10000,5),(10,'Прокачать любого из героев до уровня 30',10000,7),(11,'Получить 1000000 игровой валюты',10000,0),(12,'Получить уровень аккаунт 100',20000,0),(13,'Приобрести как минум 1 товар каждого вида',15000,10);
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `allhaveuser`
--

DROP TABLE IF EXISTS `allhaveuser`;
/*!50001 DROP VIEW IF EXISTS `allhaveuser`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `allhaveuser` AS SELECT 
 1 AS `ID`,
 1 AS `Достижения`,
 1 AS `Пройденные_евенты`,
 1 AS `Уровень`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `characteristic`
--

DROP TABLE IF EXISTS `characteristic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characteristic` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characteristic`
--

LOCK TABLES `characteristic` WRITE;
/*!40000 ALTER TABLE `characteristic` DISABLE KEYS */;
INSERT INTO `characteristic` VALUES (1,'Защита'),(2,'Количество'),(3,'Сила'),(4,'Здоровье'),(5,'Дальность атаки'),(6,'Урон'),(7,'Скорость атаки'),(8,'Ловкость'),(9,'Скорость'),(10,'Атака'),(11,'Интеллект');
/*!40000 ALTER TABLE `characteristic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enemies`
--

DROP TABLE IF EXISTS `enemies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enemies` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ModelURL` varchar(1000) NOT NULL,
  `Health` bigint NOT NULL DEFAULT '100',
  `Speed` float NOT NULL DEFAULT '1',
  `Reward` bigint NOT NULL DEFAULT '50',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enemies`
--

LOCK TABLES `enemies` WRITE;
/*!40000 ALTER TABLE `enemies` DISABLE KEYS */;
INSERT INTO `enemies` VALUES (1,'/models/enemy1.png',100,1,50),(2,'/models/enemy2.png',150,1.5,100),(3,'/models/enemy3.png',300,0.5,150),(4,'/models/enemy4.png',350,0.5,200),(5,'/models/enemy5.png',120,2.5,150),(6,'/models/enemy6.png',420,0.7,200),(7,'/models/enemy7.png',500,0.5,250),(8,'/models/enemy8.png',1500,1,500),(9,'/models/enemy9.png',3500,1,800),(10,'/models/enemy10.png',2000,1,600);
/*!40000 ALTER TABLE `enemies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enemies_to_maps`
--

DROP TABLE IF EXISTS `enemies_to_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enemies_to_maps` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `enemy_ID` int NOT NULL,
  `map_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `map_ID` (`map_ID`),
  KEY `enemies_maps` (`enemy_ID`),
  CONSTRAINT `enemies_to_maps_ibfk_1` FOREIGN KEY (`enemy_ID`) REFERENCES `enemies` (`ID`),
  CONSTRAINT `enemies_to_maps_ibfk_2` FOREIGN KEY (`map_ID`) REFERENCES `maps` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enemies_to_maps`
--

LOCK TABLES `enemies_to_maps` WRITE;
/*!40000 ALTER TABLE `enemies_to_maps` DISABLE KEYS */;
INSERT INTO `enemies_to_maps` VALUES (1,1,1),(2,2,2),(3,2,3),(4,4,1),(5,4,2),(6,5,8),(7,6,3),(8,6,6),(9,6,9),(10,7,2);
/*!40000 ALTER TABLE `enemies_to_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipments`
--

DROP TABLE IF EXISTS `equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipments` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  `Conditions` text,
  PRIMARY KEY (`ID`),
  KEY `name_equip` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipments`
--

LOCK TABLES `equipments` WRITE;
/*!40000 ALTER TABLE `equipments` DISABLE KEYS */;
INSERT INTO `equipments` VALUES (1,'Деревянный лук','Обычный деревянный лук для Адоры, чуть сильнее ее изначального оружия','Уровень: 5; Только для Адоры'),(2,'Железный топор','Намного сильнее первоначального деревянного оружия Грема, есть шанс нанести крит. Удар.','Уровень: 5; Сила: 10; Только для Грема'),(3,'Кожаная броня','Средняя броня для любого героя, немного повышает защиту от физических атак.',NULL),(4,'Посох огня','Продвинутый посох мага, увеличивает урон башен вокруг, атакует огненными шарами.','Уровень: 12; Интеллект: 10; Только для Ангора'),(5,'Амулет силы','Повышает силу на 2 у любого героя','Уровень: 10; Интеллект: 5'),(6,'Стальная броня','Повышает защиту от физических атак, но уменьшает скорость передвижения на 10%','Уровень: 20; Сила: 20'),(7,'Стальной посох','Увеличивает стандартный урон на 10','Уровень: 10; Интеллект: 5; Сила: 10; Только для Палона'),(8,'Лиственный плащ','Повышает все характеристики на 10','Уровень: 30; Интеллект: 5; Только для Якса'),(9,'Ледяной молот','Бонус к урону, также ненадолго замораживает врагов','Уровень: 30; Сила: 30; Только для Эмдала'),(10,'Амулет атаки','Бонус к урону +50% от текущего.','Уровень: 30'),(11,'Амулет ловкости','Дает небольшую прибавку к ловкости',NULL),(12,'Лук яда','Лук, отравляющий стрелы Адоры, которые впоследствии наносят дополнительный урон врагам','Уровень: 15; Ловкость: 50; Только для Адоры'),(13,'Утреняя звезда','Лугкая булава для Эмдала, немного лучше стандартного оружия Эмдала','Уровень: 3; Сила: 15; Только для Эмдала'),(14,'Амулет отваги','Амулет, немного повышающий все характеристики героя','Уровень: 10; Интеллект: 15'),(15,'Кольцо малой силы','Немного повышает силу у героя',NULL),(16,'Кольцо малой защиты','Немного увеличивает защиту у героя',NULL);
/*!40000 ALTER TABLE `equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipments_to_heroes`
--

DROP TABLE IF EXISTS `equipments_to_heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipments_to_heroes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `equipment_ID` int NOT NULL,
  `hero_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `hero_ID` (`hero_ID`),
  KEY `equip_hero` (`equipment_ID`),
  CONSTRAINT `equipments_to_heroes_ibfk_1` FOREIGN KEY (`equipment_ID`) REFERENCES `equipments` (`ID`),
  CONSTRAINT `equipments_to_heroes_ibfk_2` FOREIGN KEY (`hero_ID`) REFERENCES `heroes` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipments_to_heroes`
--

LOCK TABLES `equipments_to_heroes` WRITE;
/*!40000 ALTER TABLE `equipments_to_heroes` DISABLE KEYS */;
INSERT INTO `equipments_to_heroes` VALUES (1,1,1),(2,10,3),(3,4,5),(4,5,4),(5,5,3),(6,6,2),(7,2,4),(8,8,6),(9,14,2),(10,3,10);
/*!40000 ALTER TABLE `equipments_to_heroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Description` text NOT NULL,
  `Conditions` text NOT NULL,
  `CountOFConditions` int NOT NULL,
  `Reward` bigint NOT NULL,
  `Name` varchar(50) NOT NULL,
  `DateStart` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Вредители вторгаются в наш лес, уничтожим их.','1)Пройти карту «Лесная опушка» менее чем за 10 минут 2)Уничтожить противника «вредитель» 10 шт. 3)Использовать товар «тотем усиления» 1 раз',3,2500,'Вторжение вредителей','2020-10-05'),(2,'В нашем лесу сейчас стоят великие деревья «энты» их древесина магическая, многие хотели бы ее заполучить, нельзя позволить уничтожить эти великие создания','1)Пройти карту «Лес» не используя башню типа «Энт» 2)Пройти карту «Лесная опушка» менее чем за 15 минут 3)Использовать башню «Лесничий» 10 раз',3,5000,'Великий лес','2020-12-07'),(3,'Некоторые злые личности хотят построить платину, заблокировав тем самый свободный ход реки, не позволим разрушать то, что создала природа!','1)Пройти карту «Элебра» 2)Использовать способность «Щит» 3 раза 3)Получить героя «Адора»',3,12500,'Река Элебра','2021-07-02'),(4,'Правильные грибники знают как важно беречь лес, знают как получить то, что им надо не повредив природу, есть также неправильные грибники, которые только и знают, что вредить природе, пусть же их научат уму разуму.','1)Использовать башню «Грибник» 25 раз 2)Пройти карту «Лес» используя как минимум 2 башни «Грибник» 3)Использовать способность «Ударная волна» 1 раз',3,7500,'Грибники','2021-12-05'),(5,'Много героев защищают наш лес, так поможем же им.','1)Пройти карту «Лесная опушка»  2)Пройти карту «Лес» 3)Пройти карту «Элебра» 4)Получить героя «Аркантус» 5)Получить героя «Элизи»',5,15000,'Защитники леса','2020-03-02'),(6,'Грем-лесоруб вдруг решил защищать наш лес, надо бы помочь ему в этом деле.','1)Получить героя «Грем» 2)Пройти карту «Лес» 3)Уничтожить 300 противников',3,5000,'Добро есть в зле','2020-09-05'),(7,'На наш лес снова напали, благо к нам на помощь пришел новый герой-маг.','1)Получить героя «Ангор» 2)Пройти карту «Элебра» 3)Использовать способность «Волна заморозки» 1 раз',3,5000,'Магия с нами','2022-12-12'),(8,'Сотни врагов наступают, на защиту!!!','1)Пройти карту «Лес» и уничтожить на ней 100 врагов 2)Пройти карту «Элебра» и уничтожить на ней 100 врагов 3)Пройти карту «Лесная опушка» и уничтожить на ней 100 врагов',3,10000,'Волны врагов','2023-01-01'),(9,'Поддержка великих шаманов нам необходима, это поможет нам лучше переживать эти трудные времена','1)Использовать способность «Колючая лоза» 3 раза 2)Использовать способность «Проклятье» 3 раза',2,12000,'Дополнительная поддержка','2023-03-05'),(10,'Нельзя стоять на месте, мы должны становиться сильнее!','1)Получить прокачку«Щит в начале раунда» первого уровня 2)Получить прокачку«Увеличенная дальность башен» первого уровня',2,10000,'Укрепляем позиции','2023-07-07');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventsnew`
--

DROP TABLE IF EXISTS `eventsnew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventsnew` (
  `id` int DEFAULT NULL,
  `description` text,
  `conditions` text,
  `CountOfConditions` int DEFAULT NULL,
  `Reward` int DEFAULT NULL,
  `Name` text,
  `DateStart` text,
  KEY `reward_event` (`Reward`),
  KEY `countofconditions_event` (`CountOfConditions`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventsnew`
--

LOCK TABLES `eventsnew` WRITE;
/*!40000 ALTER TABLE `eventsnew` DISABLE KEYS */;
INSERT INTO `eventsnew` VALUES (1,'We need to increase our strength let\'s do it!','Get the hero Adora',5,12176,'Alpha','2/1/2020'),(2,'We must protect our forest by all means whatever it takes','Get the hero Adora',2,17197,'Solarbreeze','12/16/2019'),(3,'New hero! we need to try it out','use the Prickly vine ability',3,16746,'Opela','5/23/2020'),(4,'New hero! we need to try it out','Get the tower range upgrade',1,2816,'Stim','4/23/2020'),(5,'We must protect our forest by all means whatever it takes','Get the tower range upgrade',5,6123,'Pannier','8/29/2020'),(6,'We must protect our forest by all means whatever it takes','Get the tower range upgrade',1,5499,'Kanlam','7/16/2020'),(7,'We must protect our forest by all means whatever it takes','Go through the Forest edge map',5,5642,'Solarbreeze','11/30/2020'),(8,'We need to increase our strength let\'s do it!','use the Prickly vine ability',3,18975,'Alpha','7/29/2020'),(9,'We must protect our forest by all means whatever it takes','use the Prickly vine ability',2,7587,'Asoka','8/4/2020'),(10,'New hero! we need to try it out','use the Prickly vine ability',4,3169,'Viva','4/1/2020'),(11,'New hero! we need to try it out','Get the hero Adora',3,12808,'Alphazap','1/30/2020'),(12,'We need to increase our strength let\'s do it!','Get the tower range upgrade',1,19955,'Bigtax','7/5/2020'),(13,'We need to increase our strength let\'s do it!','Get the hero Adora',3,11994,'Daltfresh','4/17/2020'),(14,'We must protect our forest by all means whatever it takes','use the Prickly vine ability',5,4726,'Temp','12/14/2019'),(15,'We need to increase our strength let\'s do it!','Get the hero Adora',4,8100,'Pannier','12/31/2019'),(16,'We must protect our forest by all means whatever it takes','use the Prickly vine ability',3,5675,'Konklux','12/26/2019'),(17,'We must protect our forest by all means whatever it takes','Get the hero Adora',5,8316,'Matsoft','3/27/2020'),(18,'We must protect our forest by all means whatever it takes','Get the tower range upgrade',4,16974,'Vagram','12/2/2020'),(19,'New hero! we need to try it out','use the Prickly vine ability',1,4885,'Bamity','3/12/2020'),(20,'New hero! we need to try it out','Go through the Forest edge map',4,4859,'Lotlux','6/3/2020'),(21,'We need to increase our strength let\'s do it!','Get the hero Adora',2,11750,'Redhold','11/27/2020'),(22,'New hero! we need to try it out','Get the tower range upgrade',3,143,'Alpha','12/13/2020'),(23,'We must protect our forest by all means whatever it takes','Go through the Forest edge map',5,924,'Matsoft','2/22/2020'),(24,'We need to increase our strength let\'s do it!','Get the tower range upgrade',5,12341,'Ronstring','4/5/2020'),(25,'We need to increase our strength let\'s do it!','Get the hero Adora',4,19796,'Ronstring','9/17/2020'),(26,'New hero! we need to try it out','Get the tower range upgrade',4,10224,'Sonsing','9/16/2020'),(27,'We need to increase our strength let\'s do it!','use the Prickly vine ability',1,18860,'Treeflex','2/13/2020'),(28,'We must protect our forest by all means whatever it takes','use the Prickly vine ability',5,15748,'Redhold','1/16/2020'),(29,'We need to increase our strength let\'s do it!','Get the tower range upgrade',2,1002,'Bamity','8/30/2020'),(30,'We need to increase our strength let\'s do it!','Get the tower range upgrade',3,6231,'Zoolab','4/22/2020'),(31,'We must protect our forest by all means whatever it takes','Get the tower range upgrade',5,3288,'Overhold','11/29/2020'),(32,'New hero! we need to try it out','Get the hero Adora',5,17317,'Bamity','10/1/2020'),(33,'We need to increase our strength let\'s do it!','Get the tower range upgrade',4,11079,'Pannier','4/2/2020'),(34,'We must protect our forest by all means whatever it takes','Go through the Forest edge map',3,19277,'Zoolab','4/9/2020'),(35,'We need to increase our strength let\'s do it!','Get the hero Adora',3,8329,'Trippledex','3/29/2020'),(36,'We must protect our forest by all means whatever it takes','Get the tower range upgrade',1,18434,'Regrant','1/2/2020'),(37,'New hero! we need to try it out','use the Prickly vine ability',5,10664,'Andalax','1/10/2020'),(38,'We need to increase our strength let\'s do it!','Get the hero Adora',3,4017,'Duobam','6/15/2020'),(39,'We must protect our forest by all means whatever it takes','Get the hero Adora',3,11306,'Tresom','4/15/2020'),(40,'New hero! we need to try it out','Go through the Forest edge map',2,13835,'Subin','7/7/2020'),(41,'We need to increase our strength let\'s do it!','Get the tower range upgrade',3,18996,'Regrant','11/24/2020'),(42,'We must protect our forest by all means whatever it takes','use the Prickly vine ability',2,18827,'Lotstring','6/21/2020'),(43,'New hero! we need to try it out','use the Prickly vine ability',2,11032,'Rank','8/29/2020'),(44,'New hero! we need to try it out','Get the tower range upgrade',4,4681,'Quo Lux','5/8/2020'),(45,'We must protect our forest by all means whatever it takes','Get the hero Adora',1,4850,'Viva','8/4/2020'),(46,'We need to increase our strength let\'s do it!','Get the hero Adora',2,9448,'Span','3/20/2020'),(47,'New hero! we need to try it out','Get the tower range upgrade',2,16982,'Voyatouch','10/28/2020'),(48,'We need to increase our strength let\'s do it!','Get the tower range upgrade',1,8491,'Toughjoyfax','7/14/2020'),(49,'New hero! we need to try it out','Go through the Forest edge map',2,19007,'Toughjoyfax','12/24/2019'),(50,'New hero! we need to try it out','use the Prickly vine ability',5,11954,'Viva','2/25/2020'),(51,'New hero! we need to try it out','Go through the Forest edge map',4,4356,'Latlux','9/12/2020'),(52,'We need to increase our strength let\'s do it!','Get the hero Adora',3,3658,'Viva','8/22/2020'),(53,'We need to increase our strength let\'s do it!','use the Prickly vine ability',2,6857,'Viva','2/12/2020'),(54,'We need to increase our strength let\'s do it!','Get the hero Adora',4,15715,'Bamity','4/5/2020'),(55,'We need to increase our strength let\'s do it!','Go through the Forest edge map',3,17305,'Flowdesk','1/11/2020'),(56,'We must protect our forest by all means whatever it takes','Get the hero Adora',2,19567,'Sonsing','4/27/2020'),(57,'We must protect our forest by all means whatever it takes','Go through the Forest edge map',5,4686,'Zontrax','6/20/2020'),(58,'We need to increase our strength let\'s do it!','Get the tower range upgrade',5,16029,'Konklab','5/16/2020'),(59,'We need to increase our strength let\'s do it!','Get the hero Adora',2,19589,'Fixflex','9/15/2020'),(60,'New hero! we need to try it out','use the Prickly vine ability',1,18300,'Hatity','11/3/2020'),(61,'We must protect our forest by all means whatever it takes','Get the tower range upgrade',4,327,'Flexidy','3/23/2020'),(62,'We must protect our forest by all means whatever it takes','use the Prickly vine ability',5,11664,'Sonsing','10/31/2020'),(63,'We need to increase our strength let\'s do it!','Get the tower range upgrade',4,16890,'Keylex','6/14/2020'),(64,'New hero! we need to try it out','Get the tower range upgrade',2,13801,'Quo Lux','1/4/2020'),(65,'We need to increase our strength let\'s do it!','Go through the Forest edge map',2,2468,'Toughjoyfax','4/3/2020'),(66,'We need to increase our strength let\'s do it!','Get the tower range upgrade',2,17767,'Latlux','6/8/2020'),(67,'We need to increase our strength let\'s do it!','Get the tower range upgrade',2,5037,'Zaam-Dox','11/6/2020'),(68,'We must protect our forest by all means whatever it takes','use the Prickly vine ability',3,7257,'Latlux','2/24/2020'),(69,'We must protect our forest by all means whatever it takes','Go through the Forest edge map',2,6532,'Bamity','8/11/2020'),(70,'New hero! we need to try it out','use the Prickly vine ability',1,17036,'Tampflex','9/15/2020'),(71,'We must protect our forest by all means whatever it takes','Go through the Forest edge map',5,11376,'Fix San','9/13/2020'),(72,'We must protect our forest by all means whatever it takes','Get the tower range upgrade',3,13431,'Redhold','2/28/2020'),(73,'We need to increase our strength let\'s do it!','Get the tower range upgrade',4,15447,'Zontrax','8/10/2020'),(74,'We must protect our forest by all means whatever it takes','Get the hero Adora',2,4035,'Fintone','10/20/2020'),(75,'New hero! we need to try it out','Get the tower range upgrade',5,4147,'Home Ing','10/19/2020'),(76,'We need to increase our strength let\'s do it!','Go through the Forest edge map',1,19356,'Fintone','6/18/2020'),(77,'We must protect our forest by all means whatever it takes','Go through the Forest edge map',5,9408,'Biodex','3/3/2020'),(78,'We need to increase our strength let\'s do it!','Get the hero Adora',2,13213,'Lotstring','2/14/2020'),(79,'New hero! we need to try it out','use the Prickly vine ability',2,12428,'Konklab','2/3/2020'),(80,'New hero! we need to try it out','use the Prickly vine ability',2,5467,'Pannier','6/27/2020'),(81,'We must protect our forest by all means whatever it takes','use the Prickly vine ability',2,11084,'Hatity','2/1/2020'),(82,'We must protect our forest by all means whatever it takes','Get the tower range upgrade',1,7358,'Duobam','4/27/2020'),(83,'New hero! we need to try it out','Get the tower range upgrade',5,18168,'Flexidy','7/24/2020'),(84,'New hero! we need to try it out','use the Prickly vine ability',5,15421,'Toughjoyfax','6/9/2020'),(85,'We must protect our forest by all means whatever it takes','Go through the Forest edge map',1,4760,'Regrant','2/1/2020'),(86,'We need to increase our strength let\'s do it!','Get the hero Adora',3,15589,'Konklux','5/28/2020'),(87,'New hero! we need to try it out','Get the tower range upgrade',4,11648,'Tin','5/21/2020'),(88,'New hero! we need to try it out','use the Prickly vine ability',3,19519,'Tres-Zap','5/7/2020'),(89,'We need to increase our strength let\'s do it!','Get the hero Adora',3,15636,'Tin','4/3/2020'),(90,'We must protect our forest by all means whatever it takes','Get the tower range upgrade',5,4972,'Flowdesk','10/7/2020'),(91,'New hero! we need to try it out','Go through the Forest edge map',4,7320,'Ronstring','2/8/2020'),(92,'We must protect our forest by all means whatever it takes','use the Prickly vine ability',5,12855,'Tempsoft','9/28/2020'),(93,'We need to increase our strength let\'s do it!','Go through the Forest edge map',3,12200,'Matsoft','9/5/2020'),(94,'We need to increase our strength let\'s do it!','use the Prickly vine ability',2,4329,'Veribet','2/8/2020'),(95,'New hero! we need to try it out','use the Prickly vine ability',5,15491,'It','1/27/2020'),(96,'We must protect our forest by all means whatever it takes','use the Prickly vine ability',4,14923,'Flexidy','4/28/2020'),(97,'We must protect our forest by all means whatever it takes','use the Prickly vine ability',3,15720,'Y-Solowarm','12/28/2019'),(98,'We must protect our forest by all means whatever it takes','use the Prickly vine ability',3,1377,'Tres-Zap','5/9/2020'),(99,'New hero! we need to try it out','Get the hero Adora',1,10750,'Trippledex','10/10/2020'),(100,'New hero! we need to try it out','use the Prickly vine ability',1,12043,'Flexidy','11/2/2020');
/*!40000 ALTER TABLE `eventsnew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'Баррикада',100),(2,'Элитный лучник',250),(3,'Тотем усиления',150),(4,'Высотка',200),(5,'Дерево восполнения',300),(6,'Дерево лечения',500),(7,'Тотем проклятия',300),(8,'Страж',500),(9,'Замораживающая ловушка',200),(10,'Дорожные шипы',120);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_test`
--

DROP TABLE IF EXISTS `goods_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_test` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Price` bigint NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_test`
--

LOCK TABLES `goods_test` WRITE;
/*!40000 ALTER TABLE `goods_test` DISABLE KEYS */;
INSERT INTO `goods_test` VALUES (1,'Дорожные шипы',120),(2,'Баррикада',100),(3,'Элитный лучник',250),(4,'Тотем усиления',150),(5,'Высотка',200),(6,'Дерево восполнения',300),(7,'Дерево лечения',500),(8,'Тотем проклятия',300),(9,'Страж',500),(10,'Замораживающая ловушка',200);
/*!40000 ALTER TABLE `goods_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodsnew`
--

DROP TABLE IF EXISTS `goodsnew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodsnew` (
  `id` int DEFAULT NULL,
  `name` text,
  `price` int DEFAULT NULL,
  KEY `goods_price` (`price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsnew`
--

LOCK TABLES `goodsnew` WRITE;
/*!40000 ALTER TABLE `goodsnew` DISABLE KEYS */;
INSERT INTO `goodsnew` VALUES (1,'Zamit',9086),(2,'Stim',4773),(3,'Tin',8550),(4,'Vagram',3842),(5,'Bigtax',8107),(6,'Konklux',6548),(7,'Matsoft',6488),(8,'Holdlamis',3011),(9,'Prodder',5134),(10,'Bigtax',4230),(11,'Tres-Zap',2995),(12,'Greenlam',3605),(13,'Sub-Ex',8794),(14,'Andalax',1969),(15,'Alpha',9313),(16,'Temp',3035),(17,'Cardify',3911),(18,'Treeflex',2706),(19,'Zaam-Dox',3771),(20,'Duobam',6742),(21,'Overhold',3700),(22,'Bytecard',5238),(23,'Ventosanzap',3688),(24,'Regrant',5981),(25,'Cardify',5086),(26,'Bytecard',7871),(27,'Fintone',6113),(28,'Opela',6405),(29,'Prodder',4869),(30,'Ventosanzap',7508),(31,'Ronstring',3658),(32,'Redhold',5813),(33,'Asoka',9879),(34,'It',7011),(35,'Tresom',8394),(36,'Cookley',1664),(37,'Domainer',6778),(38,'Zathin',5548),(39,'Bigtax',263),(40,'Domainer',1664),(41,'Overhold',6278),(42,'Namfix',4706),(43,'Zontrax',8743),(44,'Gembucket',3074),(45,'Cardify',7578),(46,'It',7425),(47,'Latlux',8421),(48,'Tin',7553),(49,'Prodder',6812),(50,'Rank',227),(51,'Tin',9556),(52,'Kanlam',5141),(53,'Bamity',7520),(54,'It',6093),(55,'Wrapsafe',4683),(56,'Zathin',6376),(57,'Zoolab',4344),(58,'Tampflex',3980),(59,'Keylex',9637),(60,'Tresom',5140),(61,'Voltsillam',6326),(62,'Konklux',5753),(63,'Toughjoyfax',7581),(64,'Solarbreeze',2594),(65,'Sonair',894),(66,'Y-find',8956),(67,'Redhold',1167),(68,'Home Ing',8601),(69,'Job',1878),(70,'Tresom',9032),(71,'Subin',1497),(72,'Cardify',8244),(73,'Greenlam',3617),(74,'Tresom',8986),(75,'Vagram',3909),(76,'Holdlamis',4694),(77,'Zathin',1053),(78,'Bamity',1042),(79,'Lotlux',4438),(80,'Daltfresh',4779),(81,'Latlux',2576),(82,'Konklux',3955),(83,'Cookley',5377),(84,'Ronstring',8011),(85,'Opela',5191),(86,'Veribet',1846),(87,'Prodder',8264),(88,'Matsoft',215),(89,'Zathin',5295),(90,'Duobam',166),(91,'Latlux',9742),(92,'Stronghold',6126),(93,'Quo Lux',894),(94,'Zathin',2404),(95,'Viva',290),(96,'Alpha',3832),(97,'Treeflex',2724),(98,'Cardify',4440),(99,'Overhold',3541),(100,'Tresom',7889),(101,'Home Ing',5326),(102,'Veribet',8317),(103,'Fix San',980),(104,'Voltsillam',3969),(105,'Cookley',9553),(106,'Gembucket',6713),(107,'Job',4852),(108,'Rank',9092),(109,'Toughjoyfax',2783),(110,'Span',5763),(111,'Lotstring',2208),(112,'Treeflex',5747),(113,'Rank',3041),(114,'Trippledex',9336),(115,'Zoolab',9607),(116,'Stim',3426),(117,'Rank',2688),(118,'Y-find',8782),(119,'Alphazap',7862),(120,'Veribet',5816),(121,'Cookley',2394),(122,'Y-find',5925),(123,'Zamit',6454),(124,'Zamit',665),(125,'Subin',4927),(126,'Temp',4607),(127,'Home Ing',4866),(128,'Ronstring',7164),(129,'Rank',1844),(130,'Konklab',3068),(131,'Opela',8024),(132,'Bamity',8949),(133,'Cookley',793),(134,'Tempsoft',6714),(135,'Fix San',7167),(136,'Cookley',4671),(137,'Cardify',854),(138,'Cardguard',7380),(139,'Matsoft',8237),(140,'Duobam',9180),(141,'Cardify',6848),(142,'Matsoft',747),(143,'Pannier',4494),(144,'Bitchip',9977),(145,'Cardify',8648),(146,'Bitchip',1992),(147,'Daltfresh',2699),(148,'Rank',4702),(149,'Treeflex',478),(150,'Lotlux',9850),(151,'Solarbreeze',6662),(152,'Lotlux',4166),(153,'Tres-Zap',5246),(154,'Asoka',8603),(155,'Tresom',6285),(156,'Konklab',6263),(157,'Duobam',1249),(158,'Kanlam',3046),(159,'Y-Solowarm',8868),(160,'Bytecard',2138),(161,'Domainer',7554),(162,'Prodder',7978),(163,'Regrant',5754),(164,'Wrapsafe',5221),(165,'Y-find',8123),(166,'Opela',9017),(167,'Kanlam',3372),(168,'Tin',1551),(169,'It',8008),(170,'Redhold',8617),(171,'Kanlam',3397),(172,'Rank',6541),(173,'Vagram',5140),(174,'Tin',316),(175,'Matsoft',2450),(176,'Stim',3226),(177,'Tres-Zap',8675),(178,'Zontrax',8690),(179,'Konklab',3816),(180,'Y-Solowarm',798),(181,'Y-Solowarm',2458),(182,'Flowdesk',8379),(183,'Lotlux',6898),(184,'Ventosanzap',4304),(185,'Duobam',2706),(186,'Tampflex',4926),(187,'Lotlux',1701),(188,'Kanlam',758),(189,'Tin',4841),(190,'Zoolab',1397),(191,'Tres-Zap',4140),(192,'Namfix',1562),(193,'Daltfresh',1882),(194,'Kanlam',1723),(195,'Konklux',9373),(196,'Quo Lux',2257),(197,'Konklab',5127),(198,'Trippledex',1655),(199,'Rank',2383),(200,'Quo Lux',8994),(201,'Toughjoyfax',1870),(202,'Ventosanzap',7905),(203,'Matsoft',1893),(204,'Opela',9333),(205,'Gembucket',2432),(206,'Daltfresh',5998),(207,'Fixflex',7794),(208,'Latlux',7564),(209,'Keylex',9194),(210,'Lotstring',2052),(211,'Wrapsafe',5955),(212,'Subin',6397),(213,'Home Ing',257),(214,'Duobam',4233),(215,'Konklux',801),(216,'Zamit',1959),(217,'Subin',9999),(218,'Cookley',5912),(219,'Subin',546),(220,'Voyatouch',1596),(221,'Zoolab',1156),(222,'Otcom',1401),(223,'Zaam-Dox',5007),(224,'Redhold',9526),(225,'Daltfresh',1917),(226,'Temp',3053),(227,'Stringtough',1057),(228,'Veribet',6059),(229,'Lotstring',6175),(230,'Regrant',1575),(231,'Zamit',9879),(232,'Ventosanzap',5515),(233,'Otcom',1516),(234,'Prodder',7092),(235,'Tampflex',9451),(236,'Zamit',6169),(237,'Lotlux',3379),(238,'Stringtough',9195),(239,'Wrapsafe',4940),(240,'Home Ing',8302),(241,'Fix San',8584),(242,'Cookley',5419),(243,'Alphazap',5947),(244,'Hatity',397),(245,'Konklux',6808),(246,'Fixflex',1346),(247,'Bytecard',5137),(248,'Biodex',6457),(249,'Sonair',4953),(250,'Flowdesk',5581),(251,'Subin',7085),(252,'Konklux',686),(253,'Fix San',9623),(254,'Sub-Ex',6829),(255,'Tresom',674),(256,'Treeflex',2698),(257,'Alpha',8179),(258,'Temp',9248),(259,'Zaam-Dox',9163),(260,'Cardify',3122),(261,'Solarbreeze',5295),(262,'Alpha',7997),(263,'Kanlam',9502),(264,'Trippledex',8201),(265,'Subin',4210),(266,'Fixflex',7792),(267,'Overhold',1206),(268,'Tampflex',1464),(269,'Rank',720),(270,'Y-Solowarm',1437),(271,'Holdlamis',6150),(272,'Wrapsafe',8427),(273,'Cardify',5325),(274,'Ventosanzap',6740),(275,'Temp',3622),(276,'Solarbreeze',8763),(277,'Konklux',8189),(278,'Zamit',8015),(279,'Wrapsafe',1854),(280,'Aerified',3852),(281,'Daltfresh',7425),(282,'Tres-Zap',7701),(283,'Home Ing',6753),(284,'Biodex',2509),(285,'Bytecard',8830),(286,'Cardify',6752),(287,'Ronstring',1979),(288,'Pannier',1844),(289,'Zontrax',5754),(290,'Zaam-Dox',8986),(291,'Vagram',8100),(292,'Alpha',4738),(293,'Stim',5482),(294,'Keylex',8807),(295,'Fintone',9266),(296,'Konklux',4174),(297,'Vagram',6908),(298,'Flowdesk',7712),(299,'Treeflex',4259),(300,'Ventosanzap',7337),(301,'Sonsing',6247),(302,'It',4200),(303,'Gembucket',829),(304,'Voyatouch',9303),(305,'It',1944),(306,'Ronstring',1448),(307,'Cardify',9357),(308,'Zathin',5075),(309,'Ventosanzap',8310),(310,'Latlux',8142),(311,'Veribet',9887),(312,'Zoolab',8470),(313,'Cardguard',3412),(314,'Regrant',2258),(315,'Sonair',8754),(316,'Gembucket',7954),(317,'Transcof',614),(318,'Cardify',6652),(319,'Matsoft',9388),(320,'Daltfresh',2167),(321,'Vagram',6144),(322,'Treeflex',9020),(323,'Bitchip',574),(324,'Quo Lux',1776),(325,'Tempsoft',1110),(326,'Zaam-Dox',934),(327,'Flowdesk',6208),(328,'Duobam',4658),(329,'Biodex',1453),(330,'Home Ing',3699),(331,'Hatity',3404),(332,'Trippledex',747),(333,'Toughjoyfax',2476),(334,'Andalax',6403),(335,'Cookley',4980),(336,'Vagram',896),(337,'Domainer',5133),(338,'Prodder',3235),(339,'Alpha',2339),(340,'Overhold',8135),(341,'Opela',1866),(342,'Toughjoyfax',3569),(343,'Daltfresh',4775),(344,'Tempsoft',1145),(345,'Treeflex',4030),(346,'Konklux',7068),(347,'Regrant',2184),(348,'Voltsillam',7893),(349,'Daltfresh',2460),(350,'Wrapsafe',882),(351,'Asoka',942),(352,'Fix San',6134),(353,'Overhold',5373),(354,'Alphazap',846),(355,'Cardguard',327),(356,'Flowdesk',399),(357,'Voyatouch',6178),(358,'Tres-Zap',241),(359,'Kanlam',6822),(360,'Overhold',577),(361,'Bytecard',1614),(362,'Stronghold',7998),(363,'Zontrax',6998),(364,'Biodex',2524),(365,'Tin',9810),(366,'Trippledex',3035),(367,'Voyatouch',8724),(368,'Viva',2732),(369,'Zaam-Dox',2013),(370,'Namfix',9399),(371,'Stronghold',6940),(372,'Sonair',7616),(373,'Opela',4100),(374,'Stronghold',4785),(375,'Opela',8164),(376,'Sonsing',4210),(377,'Veribet',3341),(378,'Treeflex',8293),(379,'Konklab',4157),(380,'Wrapsafe',3952),(381,'Tres-Zap',2477),(382,'Lotstring',9665),(383,'Subin',6719),(384,'Trippledex',3348),(385,'Fix San',9482),(386,'Domainer',2839),(387,'Pannier',649),(388,'Lotlux',7554),(389,'Trippledex',3557),(390,'Sonsing',6512),(391,'Wrapsafe',4922),(392,'Tres-Zap',3731),(393,'Pannier',2610),(394,'Zaam-Dox',4833),(395,'Redhold',1340),(396,'Fixflex',2662),(397,'Bamity',9636),(398,'Zathin',1737),(399,'Home Ing',3758),(400,'Cardify',3237),(401,'Stronghold',9302),(402,'Duobam',7895),(403,'Bitwolf',6680),(404,'Job',4461),(405,'Vagram',7431),(406,'Cardify',2303),(407,'Zoolab',1807),(408,'Zontrax',9052),(409,'Prodder',961),(410,'Bitchip',9783),(411,'Voyatouch',2341),(412,'Tresom',2949),(413,'Konklab',6153),(414,'Lotstring',1416),(415,'Asoka',4412),(416,'Bytecard',293),(417,'Bitwolf',9596),(418,'Namfix',2366),(419,'Y-Solowarm',1462),(420,'Alphazap',8879),(421,'Konklab',7449),(422,'Matsoft',4291),(423,'Holdlamis',5687),(424,'Prodder',5246),(425,'Fintone',3977),(426,'Voltsillam',3722),(427,'Home Ing',3591),(428,'Cardify',7562),(429,'Otcom',8627),(430,'Sonair',4609),(431,'Otcom',1321),(432,'Keylex',1923),(433,'Otcom',5666),(434,'Alpha',5518),(435,'Stim',4110),(436,'Trippledex',8308),(437,'Fixflex',3011),(438,'Flexidy',6855),(439,'Flowdesk',147),(440,'Home Ing',1969),(441,'Asoka',7788),(442,'Home Ing',3555),(443,'Zamit',5549),(444,'Mat Lam Tam',9484),(445,'Fintone',5422),(446,'Lotlux',9062),(447,'Opela',1457),(448,'Flexidy',853),(449,'Fixflex',4183),(450,'Regrant',9534),(451,'Zoolab',143),(452,'Redhold',5315),(453,'Cardify',9723),(454,'Flowdesk',1297),(455,'Domainer',8702),(456,'Keylex',3199),(457,'Greenlam',8286),(458,'Quo Lux',7373),(459,'Bitchip',9695),(460,'Veribet',2687),(461,'Flowdesk',3556),(462,'Bigtax',9208),(463,'Mat Lam Tam',1188),(464,'Home Ing',281),(465,'Flexidy',8754),(466,'Latlux',8960),(467,'Zoolab',9290),(468,'Bytecard',4120),(469,'Cookley',4912),(470,'Tin',5269),(471,'Otcom',4081),(472,'Rank',422),(473,'Y-find',6641),(474,'Greenlam',8042),(475,'Matsoft',6401),(476,'Tin',7759),(477,'Fix San',5952),(478,'Zaam-Dox',4457),(479,'Tin',1735),(480,'Y-Solowarm',4155),(481,'Cardguard',1073),(482,'Tres-Zap',4761),(483,'Keylex',5296),(484,'Duobam',4315),(485,'Span',2649),(486,'Latlux',3610),(487,'Duobam',4113),(488,'Fintone',810),(489,'Duobam',4283),(490,'Y-find',604),(491,'Tres-Zap',3176),(492,'Duobam',5517),(493,'Zaam-Dox',8793),(494,'Viva',3695),(495,'Alphazap',1220),(496,'Opela',7358),(497,'Zontrax',5190),(498,'Fixflex',1932),(499,'Home Ing',5221),(500,'Lotstring',7524),(501,'Fix San',4007),(502,'Pannier',3740),(503,'Flowdesk',4340),(504,'Treeflex',2106),(505,'Holdlamis',6213),(506,'Veribet',4568),(507,'Viva',1082),(508,'Viva',6693),(509,'Lotlux',3252),(510,'Sonair',6073),(511,'Quo Lux',8028),(512,'Y-find',9189),(513,'Veribet',3458),(514,'Latlux',8888),(515,'Tresom',1647),(516,'Cardify',2681),(517,'Stim',2713),(518,'Bamity',9877),(519,'Zaam-Dox',2435),(520,'Bitwolf',5839),(521,'Veribet',9438),(522,'Zoolab',6411),(523,'Zamit',4293),(524,'Job',1918),(525,'Lotlux',6993),(526,'Stringtough',4754),(527,'Toughjoyfax',2013),(528,'Biodex',4688),(529,'Latlux',5222),(530,'Mat Lam Tam',4867),(531,'Alpha',7906),(532,'Duobam',4466),(533,'Matsoft',5662),(534,'Tresom',4517),(535,'It',287),(536,'Y-find',4576),(537,'Mat Lam Tam',4317),(538,'Home Ing',3434),(539,'Keylex',5114),(540,'It',1417),(541,'Lotlux',8392),(542,'Flexidy',4566),(543,'Keylex',7374),(544,'Sub-Ex',8256),(545,'Fix San',2014),(546,'Tempsoft',1120),(547,'Ronstring',7088),(548,'Flexidy',8701),(549,'Fintone',3267),(550,'Namfix',779),(551,'Prodder',8870),(552,'Trippledex',103),(553,'Bitwolf',7985),(554,'Bytecard',6977),(555,'Y-Solowarm',8640),(556,'Viva',5874),(557,'Hatity',6209),(558,'Y-Solowarm',6549),(559,'Y-Solowarm',2800),(560,'Alpha',2120),(561,'Flowdesk',7095),(562,'Hatity',7818),(563,'Daltfresh',4126),(564,'Y-Solowarm',2974),(565,'Bamity',6590),(566,'Sub-Ex',3013),(567,'Wrapsafe',9126),(568,'Sub-Ex',2281),(569,'Zoolab',1357),(570,'Cardguard',1172),(571,'Konklux',5291),(572,'Rank',7967),(573,'Sonsing',7046),(574,'Daltfresh',741),(575,'Latlux',7248),(576,'Cardify',7070),(577,'Asoka',2605),(578,'Pannier',8049),(579,'Zamit',6630),(580,'Redhold',9198),(581,'Alpha',8839),(582,'Treeflex',6996),(583,'Y-find',4498),(584,'Subin',9718),(585,'Vagram',7050),(586,'Voltsillam',5654),(587,'Stronghold',5365),(588,'Sonair',5467),(589,'Daltfresh',9771),(590,'Bamity',7481),(591,'Viva',5110),(592,'Transcof',7822),(593,'Bitchip',6728),(594,'Tres-Zap',3094),(595,'Domainer',5436),(596,'Fintone',6657),(597,'Regrant',4829),(598,'Matsoft',7554),(599,'Tempsoft',2535),(600,'Stringtough',2211),(601,'Stim',1259),(602,'Subin',449),(603,'Andalax',4809),(604,'Trippledex',6505),(605,'Stringtough',980),(606,'Greenlam',7870),(607,'Trippledex',9522),(608,'Fixflex',6923),(609,'Flowdesk',7203),(610,'Lotstring',4237),(611,'Overhold',9606),(612,'Job',3930),(613,'Rank',5280),(614,'Andalax',5374),(615,'Stim',5206),(616,'Aerified',699),(617,'Domainer',2824),(618,'Y-Solowarm',4458),(619,'Solarbreeze',3959),(620,'Redhold',1161),(621,'Sonsing',1065),(622,'Treeflex',8569),(623,'Sub-Ex',8808),(624,'Zathin',6356),(625,'Bitwolf',2900),(626,'Mat Lam Tam',9464),(627,'Redhold',9137),(628,'Zaam-Dox',990),(629,'Stim',892),(630,'Stronghold',8659),(631,'Konklux',3587),(632,'Vagram',2221),(633,'Lotstring',2537),(634,'Transcof',6841),(635,'Vagram',9094),(636,'Zathin',6271),(637,'Flexidy',911),(638,'Voltsillam',8835),(639,'Job',3988),(640,'Latlux',9363),(641,'Mat Lam Tam',7089),(642,'Namfix',6002),(643,'Stim',1922),(644,'Home Ing',8477),(645,'Tresom',4249),(646,'Quo Lux',7750),(647,'Flowdesk',6865),(648,'Stronghold',9165),(649,'Sonsing',102),(650,'Cookley',9253),(651,'Voltsillam',8314),(652,'Y-find',4308),(653,'Duobam',6732),(654,'Overhold',1108),(655,'Trippledex',1650),(656,'Bitwolf',4253),(657,'Biodex',2897),(658,'Stim',6848),(659,'Stim',5820),(660,'Temp',7612),(661,'Namfix',7788),(662,'Tempsoft',3906),(663,'Zamit',1084),(664,'Holdlamis',6698),(665,'Cardguard',8610),(666,'Flexidy',7085),(667,'Bamity',6461),(668,'Holdlamis',2147),(669,'Quo Lux',2875),(670,'Y-find',6764),(671,'Job',5331),(672,'Flowdesk',6563),(673,'Tin',4678),(674,'Sub-Ex',3332),(675,'Cardguard',8852),(676,'Biodex',7161),(677,'Wrapsafe',5797),(678,'Zaam-Dox',9449),(679,'Tres-Zap',3568),(680,'Stronghold',1568),(681,'Stronghold',2686),(682,'Stim',8265),(683,'Flowdesk',3765),(684,'Domainer',3402),(685,'Fintone',2885),(686,'Holdlamis',6300),(687,'Veribet',137),(688,'Kanlam',9592),(689,'Biodex',5109),(690,'Mat Lam Tam',1679),(691,'Tres-Zap',2987),(692,'Flexidy',7179),(693,'Fixflex',4267),(694,'Span',561),(695,'Bytecard',7561),(696,'Zathin',9942),(697,'Bigtax',9530),(698,'Domainer',7364),(699,'Zathin',3720),(700,'Alpha',9479),(701,'Bamity',3254),(702,'Fix San',1601),(703,'Fixflex',845),(704,'Solarbreeze',2456),(705,'Subin',1431),(706,'Treeflex',7881),(707,'Viva',1793),(708,'Kanlam',3863),(709,'Tres-Zap',5618),(710,'Regrant',640),(711,'Tempsoft',3492),(712,'Latlux',1268),(713,'Zathin',2310),(714,'Sonair',8314),(715,'Latlux',2518),(716,'Prodder',1559),(717,'Regrant',5305),(718,'Fintone',8569),(719,'Pannier',491),(720,'Y-find',9971),(721,'Fix San',662),(722,'Konklab',354),(723,'Wrapsafe',5843),(724,'Cardify',9148),(725,'Viva',8010),(726,'Cardguard',5644),(727,'Daltfresh',2368),(728,'It',3525),(729,'Prodder',8698),(730,'Ronstring',9133),(731,'Span',5217),(732,'Bamity',1816),(733,'Gembucket',9037),(734,'Y-Solowarm',6690),(735,'Namfix',439),(736,'Voltsillam',6629),(737,'Daltfresh',9445),(738,'Tempsoft',5138),(739,'Greenlam',3300),(740,'Zamit',3712),(741,'Flexidy',8350),(742,'Bamity',6343),(743,'Matsoft',6672),(744,'Sub-Ex',7001),(745,'Opela',1483),(746,'Stronghold',3596),(747,'Asoka',9757),(748,'Konklab',1186),(749,'Zathin',3685),(750,'Treeflex',4263),(751,'Lotstring',572),(752,'Home Ing',3248),(753,'It',7237),(754,'Viva',7175),(755,'Bitchip',900),(756,'Zontrax',370),(757,'Treeflex',2174),(758,'Wrapsafe',8233),(759,'Y-Solowarm',3998),(760,'Veribet',9444),(761,'Span',6274),(762,'Prodder',9424),(763,'Opela',4438),(764,'Veribet',4816),(765,'Stringtough',2885),(766,'Bytecard',5034),(767,'Y-find',2219),(768,'Lotlux',8824),(769,'Andalax',644),(770,'Sonair',2992),(771,'Stronghold',6303),(772,'Tin',466),(773,'Sonair',2537),(774,'Treeflex',8916),(775,'It',2182),(776,'Lotstring',3321),(777,'Fixflex',2256),(778,'Ventosanzap',4267),(779,'Bytecard',7695),(780,'Flexidy',1730),(781,'Fintone',7592),(782,'Holdlamis',5558),(783,'Veribet',1277),(784,'Ventosanzap',5079),(785,'Tresom',146),(786,'Rank',8598),(787,'Wrapsafe',7395),(788,'Wrapsafe',262),(789,'Aerified',5807),(790,'Zathin',1162),(791,'Vagram',7533),(792,'Duobam',3252),(793,'Asoka',8242),(794,'Viva',1998),(795,'Bitwolf',3976),(796,'Stringtough',5832),(797,'Keylex',7872),(798,'It',9795),(799,'Tempsoft',575),(800,'Toughjoyfax',9047),(801,'Cookley',1151),(802,'Fix San',9217),(803,'Alphazap',2487),(804,'Flexidy',7929),(805,'Toughjoyfax',5521),(806,'Toughjoyfax',6717),(807,'Wrapsafe',9180),(808,'Y-find',4362),(809,'Stronghold',857),(810,'Domainer',1423),(811,'Wrapsafe',4814),(812,'Alpha',1389),(813,'Zoolab',6699),(814,'Bamity',3462),(815,'Veribet',8109),(816,'Home Ing',6267),(817,'Wrapsafe',1693),(818,'Quo Lux',7418),(819,'Tin',6878),(820,'Duobam',1408),(821,'Sub-Ex',3725),(822,'Opela',2678),(823,'Aerified',5666),(824,'Zoolab',6037),(825,'Konklux',6805),(826,'Quo Lux',3426),(827,'Zamit',5160),(828,'Cardify',6827),(829,'Stringtough',7073),(830,'Mat Lam Tam',3270),(831,'Voyatouch',9754),(832,'Zaam-Dox',354),(833,'Solarbreeze',5326),(834,'Ventosanzap',4061),(835,'Keylex',971),(836,'Tempsoft',8825),(837,'Toughjoyfax',5979),(838,'Lotlux',6376),(839,'Tin',5583),(840,'Viva',3082),(841,'Trippledex',4708),(842,'Veribet',4264),(843,'Home Ing',9997),(844,'Kanlam',748),(845,'Tempsoft',1142),(846,'It',2585),(847,'Zontrax',4387),(848,'Y-Solowarm',9510),(849,'Kanlam',3897),(850,'Greenlam',7822),(851,'Prodder',3341),(852,'Sonsing',214),(853,'Kanlam',8625),(854,'Solarbreeze',2236),(855,'It',8185),(856,'Cardify',8068),(857,'Konklab',5321),(858,'Flexidy',7779),(859,'Prodder',2179),(860,'Quo Lux',8203),(861,'Viva',2312),(862,'Alphazap',7781),(863,'Stim',1634),(864,'Zoolab',2793),(865,'Treeflex',6868),(866,'Lotlux',6194),(867,'Daltfresh',3517),(868,'Veribet',7952),(869,'Toughjoyfax',6388),(870,'Trippledex',8114),(871,'Latlux',6646),(872,'Otcom',6661),(873,'Zoolab',9114),(874,'Namfix',9901),(875,'Kanlam',8389),(876,'Toughjoyfax',2631),(877,'Bamity',2996),(878,'Stringtough',4864),(879,'Wrapsafe',4064),(880,'Konklab',7768),(881,'Biodex',6266),(882,'Prodder',8210),(883,'Rank',5841),(884,'Subin',5187),(885,'Prodder',1882),(886,'Overhold',4952),(887,'Tempsoft',7705),(888,'Fix San',6085),(889,'Asoka',2395),(890,'Wrapsafe',7991),(891,'Gembucket',1642),(892,'Subin',6063),(893,'Home Ing',7304),(894,'Lotlux',4092),(895,'Cardify',2370),(896,'Opela',5377),(897,'Bitwolf',1960),(898,'Bitwolf',6739),(899,'Asoka',2526),(900,'Fixflex',2212),(901,'Redhold',6787),(902,'Zontrax',517),(903,'Ronstring',2044),(904,'Gembucket',6381),(905,'Tampflex',9312),(906,'Treeflex',8093),(907,'Duobam',5595),(908,'Tres-Zap',8075),(909,'Bitwolf',6149),(910,'Redhold',475),(911,'Gembucket',4482),(912,'Sub-Ex',9417),(913,'Latlux',4303),(914,'Konklab',575),(915,'Vagram',8196),(916,'Gembucket',3486),(917,'Veribet',9702),(918,'Fintone',4476),(919,'Zamit',3248),(920,'Bigtax',996),(921,'Daltfresh',503),(922,'Rank',5820),(923,'Zamit',3619),(924,'Greenlam',4567),(925,'Daltfresh',2346),(926,'Biodex',2639),(927,'Bamity',9030),(928,'Biodex',8769),(929,'Sonair',624),(930,'Prodder',8929),(931,'Bamity',152),(932,'Ronstring',6145),(933,'Zoolab',5346),(934,'Tin',5644),(935,'Voltsillam',9394),(936,'Stim',4438),(937,'Toughjoyfax',6858),(938,'Cardguard',8840),(939,'Home Ing',9654),(940,'Solarbreeze',2283),(941,'Y-Solowarm',9553),(942,'Holdlamis',7037),(943,'Vagram',9469),(944,'Stringtough',2941),(945,'Holdlamis',7800),(946,'Tresom',5879),(947,'Fixflex',7237),(948,'Temp',6268),(949,'Overhold',6898),(950,'Tresom',5470),(951,'Prodder',7392),(952,'Y-find',7002),(953,'Tempsoft',1821),(954,'Fix San',3936),(955,'Biodex',9916),(956,'Overhold',5706),(957,'Redhold',8422),(958,'Kanlam',9992),(959,'Y-Solowarm',1858),(960,'Domainer',7824),(961,'Tempsoft',7754),(962,'It',1846),(963,'Biodex',9910),(964,'Matsoft',2949),(965,'Bamity',3380),(966,'Quo Lux',9817),(967,'Rank',3402),(968,'Kanlam',8020),(969,'Ventosanzap',592),(970,'Stim',2614),(971,'Latlux',3341),(972,'Hatity',3152),(973,'Bytecard',689),(974,'Gembucket',4118),(975,'Wrapsafe',4793),(976,'Tempsoft',6297),(977,'Stronghold',5720),(978,'Greenlam',5794),(979,'Tres-Zap',4360),(980,'Veribet',6805),(981,'Veribet',1675),(982,'Veribet',3245),(983,'Stim',2991),(984,'Konklux',6099),(985,'Matsoft',8905),(986,'Holdlamis',2553),(987,'Konklux',6932),(988,'Subin',4156),(989,'Bitchip',256),(990,'Bamity',6394),(991,'Zoolab',5546),(992,'Keylex',6449),(993,'Ronstring',6566),(994,'Pannier',6513),(995,'Kanlam',6356),(996,'Transcof',9710),(997,'Biodex',5409),(998,'Kanlam',9989),(999,'Voyatouch',504),(1000,'Tempsoft',2967);
/*!40000 ALTER TABLE `goodsnew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `heroandtheirequip`
--

DROP TABLE IF EXISTS `heroandtheirequip`;
/*!50001 DROP VIEW IF EXISTS `heroandtheirequip`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `heroandtheirequip` AS SELECT 
 1 AS `Имя_Героя`,
 1 AS `Особенность_Героя`,
 1 AS `Название_предмета`,
 1 AS `Описание_предмета`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `heroes`
--

DROP TABLE IF EXISTS `heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heroes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Feature` text NOT NULL,
  `Biography` text NOT NULL,
  `TypeOfFight` varchar(20) NOT NULL DEFAULT 'Ближний',
  `LevelNumber` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `LevelNumber` (`LevelNumber`),
  KEY `typeoffight_hero` (`TypeOfFight`),
  CONSTRAINT `heroes_ibfk_1` FOREIGN KEY (`LevelNumber`) REFERENCES `levels` (`Number`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroes`
--

LOCK TABLES `heroes` WRITE;
/*!40000 ALTER TABLE `heroes` DISABLE KEYS */;
INSERT INTO `heroes` VALUES (1,'Адора','Лучница, быстрая стрельба, ядовитые стрелы.','Родилась неподалеку от реки «Элебра», любила эту реку, и прилежащий к нему лес. Позже решила защищать реку и лес от незваных гостей','Дальний',1),(2,'Аркантус','Герой ближнего боя, большой и быстрый урон.','Родился в деревне неподалеку от леса, в детстве вредил лесу, срубая ветки с деревьев, в то время сделал себе первое свое копье(именно с ним он сейчас ходит) позже, после того, как он увидел энта, понял что лес живой, и то, что в свое время ему очень вредил, встал на защиту лесных просторов, оставил себе сделанное когда-то копье, в знак напоминания, что ему нужно делать.','Ближний',5),(3,'Элизи','Ведьма, атакующая на коротком расстоянии, понижает характеристики врагов при атаке','Единственная ведьма на весь лес, неизвестно откуда она, и как пришла к такой жизни. Никому не позволит подойти к своему убежищу(Самый старый в лесу Энт) именно поэтому она решила помочь в защите леса.','Магия',10),(4,'Грем','Танк, ближний бой, останавливает противников пока дерется с ними, имеет большой запас здоровья.','Сын лесоруба. Многие лесные жители его не любят, он был и есть лесоруб, но лесоруб, который не позволит трогать его дереавья, он встал на защиту леса только со своими коварными целями, в любой момент может предать наше дело.','Ближний',10),(5,'Ангор','Маг, усиливает все башни по близости, атакует быстро на короткое расстояние.','Пришел из дальних земель, по его словам, он там оставил приемника защищать те земли, но неизвестно где эти земли, маг издает усиливающую ауру.','Магия',12),(6,'Якс','Друид, атакующий магией природы','Человек, выросший среди деревьев, воспитанный энтами, без раздумий вставший на защиту леса','Магия',15),(7,'Палон','Быстрый лучник с посохом, имеющий как ближний, так и дальний бой','Все детство в своей деревне стрелял из лука и дрался с друзьями на палках, в итоге овладел искусством лучника и боя на посохах. Любит природу, и не любит когда ей вредят.','Дальний',15),(8,'Эмдал','Медленный танк, атакующий по области','Кузнец из далеких земель, после потери смысла делать оружие, после долгих поисков дела, решил помочь защищать лес.','Ближний',18),(9,'Сейрус','Воин, иногда входящий в невидимость','Обучался в храме «Дэла», освоил искусство вхождения в невидимость, наемник, брат Кастора','Ближний',20),(10,'Кастор','Воин, быстро атакующий своими двумя клинками.','Обучался в храме «Дэла», обладал наивысшей скоростью атаки в храме, наемник, брат Сейруса.','Ближний',25),(11,'Купер','Новый воин','Биография нового воина','Ближний',20);
/*!40000 ALTER TABLE `heroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroes_test`
--

DROP TABLE IF EXISTS `heroes_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heroes_test` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Feature` text NOT NULL,
  `Biography` text NOT NULL,
  `TypeOfFight` varchar(20) NOT NULL DEFAULT 'Ближний',
  `LevelNumber` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `LevelNumber` (`LevelNumber`),
  CONSTRAINT `heroes_test_ibfk_1` FOREIGN KEY (`LevelNumber`) REFERENCES `levels` (`Number`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroes_test`
--

LOCK TABLES `heroes_test` WRITE;
/*!40000 ALTER TABLE `heroes_test` DISABLE KEYS */;
INSERT INTO `heroes_test` VALUES (1,'Адора','Лучница, быстрая стрельба, ядовитые стрелы.','Родилась неподалеку от реки «Элебра», любила эту реку, и прилежащий к нему лес. Позже решила защищать реку и лес от незваных гостей','Дальний',1),(2,'Аркантус','Герой ближнего боя, большой и быстрый урон.','Родился в деревне неподалеку от леса, в детстве вредил лесу, срубая ветки с деревьев, в то время сделал себе первое свое копье(именно с ним он сейчас ходит) позже, после того, как он увидел энта, понял что лес живой, и то, что в свое время ему очень вредил, встал на защиту лесных просторов, оставил себе сделанное когда-то копье, в знак напоминания, что ему нужно делать.','Ближний',5),(4,'Грем','Танк, ближний бой, останавливает противников пока дерется с ними, имеет большой запас здоровья.','Сын лесоруба. Многие лесные жители его не любят, он был и есть лесоруб, но лесоруб, который не позволит трогать его дереавья, он встал на защиту леса только со своими коварными целями, в любой момент может предать наше дело.','Ближний',10),(8,'Эмдал','Медленный танк, атакующий по области','Кузнец из далеких земель, после потери смысла делать оружие, после долгих поисков дела, решил помочь защищать лес.','Ближний',18),(9,'Сейрус','Воин, иногда входящий в невидимость','Обучался в храме «Дэла», освоил искусство вхождения в невидимость, наемник, брат Кастора','Ближний',20),(10,'Кастор','Воин, быстро атакующий своими двумя клинками.','Обучался в храме «Дэла», обладал наивысшей скоростью атаки в храме, наемник, брат Сейруса.','Ближний',25),(11,'Адора','Лучница, быстрая стрельба, ядовитые стрелы.','Родилась неподалеку от реки «Элебра», любила эту реку, и прилежащий к нему лес. Позже решила защищать реку и лес от незваных гостей','Дальний',1),(12,'Аркантус','Герой ближнего боя, большой и быстрый урон.','Родился в деревне неподалеку от леса, в детстве вредил лесу, срубая ветки с деревьев, в то время сделал себе первое свое копье(именно с ним он сейчас ходит) позже, после того, как он увидел энта, понял что лес живой, и то, что в свое время ему очень вредил, встал на защиту лесных просторов, оставил себе сделанное когда-то копье, в знак напоминания, что ему нужно делать.','Ближний',5),(13,'Элизи','Ведьма, атакующая на коротком расстоянии, понижает характеристики врагов при атаке','Единственная ведьма на весь лес, неизвестно откуда она, и как пришла к такой жизни. Никому не позволит подойти к своему убежищу(Самый старый в лесу Энт) именно поэтому она решила помочь в защите леса.','Магия',10),(14,'Грем','Танк, ближний бой, останавливает противников пока дерется с ними, имеет большой запас здоровья.','Сын лесоруба. Многие лесные жители его не любят, он был и есть лесоруб, но лесоруб, который не позволит трогать его дереавья, он встал на защиту леса только со своими коварными целями, в любой момент может предать наше дело.','Ближний',10),(15,'Ангор','Маг, усиливает все башни по близости, атакует быстро на короткое расстояние.','Пришел из дальних земель, по его словам, он там оставил приемника защищать те земли, но неизвестно где эти земли, маг издает усиливающую ауру.','Магия',12),(16,'Якс','Друид, атакующий магией природы','Человек, выросший среди деревьев, воспитанный энтами, без раздумий вставший на защиту леса','Магия',15),(17,'Палон','Быстрый лучник с посохом, имеющий как ближний, так и дальний бой','Все детство в своей деревне стрелял из лука и дрался с друзьями на палках, в итоге овладел искусством лучника и боя на посохах. Любит природу, и не любит когда ей вредят.','Дальний',15),(18,'Эмдал','Медленный танк, атакующий по области','Кузнец из далеких земель, после потери смысла делать оружие, после долгих поисков дела, решил помочь защищать лес.','Ближний',18),(19,'Сейрус','Воин, иногда входящий в невидимость','Обучался в храме «Дэла», освоил искусство вхождения в невидимость, наемник, брат Кастора','Ближний',20),(20,'Кастор','Воин, быстро атакующий своими двумя клинками.','Обучался в храме «Дэла», обладал наивысшей скоростью атаки в храме, наемник, брат Сейруса.','Ближний',25),(21,'Купер','Новый воин','Биография нового воина','Ближний',20),(26,'Адора','Лучница, быстрая стрельба, ядовитые стрелы.','Родилась неподалеку от реки «Элебра», любила эту реку, и прилежащий к нему лес. Позже решила защищать реку и лес от незваных гостей','Дальний',1),(27,'Аркантус','Герой ближнего боя, большой и быстрый урон.','Родился в деревне неподалеку от леса, в детстве вредил лесу, срубая ветки с деревьев, в то время сделал себе первое свое копье(именно с ним он сейчас ходит) позже, после того, как он увидел энта, понял что лес живой, и то, что в свое время ему очень вредил, встал на защиту лесных просторов, оставил себе сделанное когда-то копье, в знак напоминания, что ему нужно делать.','Ближний',5),(28,'Элизи','Ведьма, атакующая на коротком расстоянии, понижает характеристики врагов при атаке','Единственная ведьма на весь лес, неизвестно откуда она, и как пришла к такой жизни. Никому не позволит подойти к своему убежищу(Самый старый в лесу Энт) именно поэтому она решила помочь в защите леса.','Магия',10),(29,'Грем','Танк, ближний бой, останавливает противников пока дерется с ними, имеет большой запас здоровья.','Сын лесоруба. Многие лесные жители его не любят, он был и есть лесоруб, но лесоруб, который не позволит трогать его дереавья, он встал на защиту леса только со своими коварными целями, в любой момент может предать наше дело.','Ближний',10),(30,'Ангор','Маг, усиливает все башни по близости, атакует быстро на короткое расстояние.','Пришел из дальних земель, по его словам, он там оставил приемника защищать те земли, но неизвестно где эти земли, маг издает усиливающую ауру.','Магия',12),(31,'Якс','Друид, атакующий магией природы','Человек, выросший среди деревьев, воспитанный энтами, без раздумий вставший на защиту леса','Магия',15),(32,'Палон','Быстрый лучник с посохом, имеющий как ближний, так и дальний бой','Все детство в своей деревне стрелял из лука и дрался с друзьями на палках, в итоге овладел искусством лучника и боя на посохах. Любит природу, и не любит когда ей вредят.','Дальний',15),(33,'Эмдал','Медленный танк, атакующий по области','Кузнец из далеких земель, после потери смысла делать оружие, после долгих поисков дела, решил помочь защищать лес.','Ближний',18),(34,'Сейрус','Воин, иногда входящий в невидимость','Обучался в храме «Дэла», освоил искусство вхождения в невидимость, наемник, брат Кастора','Ближний',20),(35,'Кастор','Воин, быстро атакующий своими двумя клинками.','Обучался в храме «Дэла», обладал наивысшей скоростью атаки в храме, наемник, брат Сейруса.','Ближний',25),(36,'Купер','Новый воин','Биография нового воина','Ближний',20);
/*!40000 ALTER TABLE `heroes_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels` (
  `Number` int NOT NULL,
  PRIMARY KEY (`Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (0),(1),(2),(3),(4),(5),(6),(7),(10),(12),(13),(14),(15),(18),(20),(23),(25),(30),(40),(45),(50),(56),(87),(100),(123),(150);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maps`
--

DROP TABLE IF EXISTS `maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maps` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Waves` bigint NOT NULL,
  `LevelNumber` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `LevelNumber` (`LevelNumber`),
  KEY `waves_maps` (`Waves`),
  CONSTRAINT `maps_ibfk_1` FOREIGN KEY (`LevelNumber`) REFERENCES `levels` (`Number`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maps`
--

LOCK TABLES `maps` WRITE;
/*!40000 ALTER TABLE `maps` DISABLE KEYS */;
INSERT INTO `maps` VALUES (1,'Лесная опушка',20,0),(2,'Лес',50,10),(3,'Река Элебра',80,3),(4,'Старейший Энт',30,6),(5,'Деревня',50,10),(6,'Тропа в лес',0,10),(7,'Храм Дэла',100,12),(8,'Холм Агарот',120,15),(9,'Мост Элебры',50,20),(10,'Поле',0,25),(11,'Великий холм',30,10),(12,'Гиблое болото',15,10),(13,'Зеленая топь',125,30),(14,'Темный ручей',150,50),(15,'Ведьмины острова',20,40),(20,'Тестовая карта_1',100,100),(21,'Дерево Бро',40,40),(22,'Дерево Корта',60,20),(25,'qwer',20,100);
/*!40000 ALTER TABLE `maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `powers`
--

DROP TABLE IF EXISTS `powers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `powers` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Feature` text NOT NULL,
  `Price` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `price_powers` (`Price`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `powers`
--

LOCK TABLES `powers` WRITE;
/*!40000 ALTER TABLE `powers` DISABLE KEYS */;
INSERT INTO `powers` VALUES (1,'Щит','Дает щит, увеличивающий общее количество здоровья в данной игре.',150),(2,'Пополнение счета','Один раз дает валюту в размере 20% от текущей в данной игре',500),(3,'Ударная волна','Наносит один раз урон всем противникам',250),(4,'Усиление','На 10% повышает все характеристики башен в данной игре',400),(5,'Проклятье','Замедляет и отравляет всех врагов в текущей волне',150),(6,'Мешок золота','Дает +50% валюты, исходя из текущей',500),(7,'Сапоги-скороходы','На 15% повышает скорость передвижения героя в данной игре',300),(8,'Колючая лоза','Наносит повреждения вышедшим врагам, в размере 10% от общего их здоровья',500),(9,'Дорога слабости','Все враги наносят на 10% меньше урона при выходе.',400),(10,'Волна заморозки','Останавливает всех врагов на 3 сек',300);
/*!40000 ALTER TABLE `powers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pumps`
--

DROP TABLE IF EXISTS `pumps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pumps` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Price` bigint NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pumps`
--

LOCK TABLES `pumps` WRITE;
/*!40000 ALTER TABLE `pumps` DISABLE KEYS */;
INSERT INTO `pumps` VALUES (1,'Увеличенный урон башен',1500),(2,'Увеличенная дальность башен',1000),(3,'Все товары дешевле',3285),(4,'Урон всех героев выше',1125),(5,'Щит в начале раунда',850),(6,'Больше денег с врагов',1000),(7,'Больше бонус с товаров',1200),(8,'Больше жизней в каждой игре',200),(9,'Герои сильнее',820),(10,'Все награды выше',600),(11,'Все товары эффективней',350),(12,'Увеличен опыт за прохождение карт',1000),(13,'Увеличенный шанс найти магический предмет',500);
/*!40000 ALTER TABLE `pumps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `towers`
--

DROP TABLE IF EXISTS `towers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `towers` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `ModelURL` varchar(1000) NOT NULL,
  `ImageURL` varchar(1000) NOT NULL,
  `LevelNumber` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `LevelNumber` (`LevelNumber`),
  CONSTRAINT `towers_ibfk_1` FOREIGN KEY (`LevelNumber`) REFERENCES `levels` (`Number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towers`
--

LOCK TABLES `towers` WRITE;
/*!40000 ALTER TABLE `towers` DISABLE KEYS */;
INSERT INTO `towers` VALUES (1,'Лесничий','/models/tower1.png','/images/tower1.png',1),(2,'Грибник','/models/tower2.jpg','/images/tower2.png',2),(3,'Древень','/models/tower3.png','/images/tower3.png',5),(4,'Маг','/models/tower4.png','/images/tower4.png',10),(5,'Алхимик','/models/tower5.png','/images/tower5.png',15),(6,'Друид','/models/tower6.jpg','/images/tower6.png',15),(7,'Эмп','/models/tower7.png','/images/tower7.png',20),(8,'Дриада','/models/tower8.png','/images/tower8.png',25),(9,'Энт','/models/tower9.jpg','/images/tower9.png',25),(10,'Эльф','/models/tower10.png','/images/tower10.png',30);
/*!40000 ALTER TABLE `towers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `IsAdmin` tinyint(1) NOT NULL,
  `Money` bigint NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Gravet',1,400),(2,'Yarglek',0,1500),(3,'Vanya',1,12300),(4,'SuperLord',0,2500),(5,'qwerty112345',1,1234),(6,'Kraken',0,1200),(7,'Petya',1,120),(8,'Geroy',0,17584),(9,'Irtek',0,0),(10,'Ray',0,230),(12,'Qusannca',0,1300),(13,'Onerifri',1,250000),(14,'Herod',0,340),(15,'Donananor',0,100320),(16,'Qustoy',1,0),(22,'Grado',0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `users_heroes_towers_count`
--

DROP TABLE IF EXISTS `users_heroes_towers_count`;
/*!50001 DROP VIEW IF EXISTS `users_heroes_towers_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `users_heroes_towers_count` AS SELECT 
 1 AS `ID`,
 1 AS `TOWERS`,
 1 AS `HEROES`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users_to_achievements`
--

DROP TABLE IF EXISTS `users_to_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_to_achievements` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `user_ID` int NOT NULL,
  `achievment_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_ID` (`user_ID`),
  KEY `achievment_ID` (`achievment_ID`),
  CONSTRAINT `users_to_achievements_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `users_to_achievements_ibfk_2` FOREIGN KEY (`achievment_ID`) REFERENCES `achievements` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_to_achievements`
--

LOCK TABLES `users_to_achievements` WRITE;
/*!40000 ALTER TABLE `users_to_achievements` DISABLE KEYS */;
INSERT INTO `users_to_achievements` VALUES (1,1,1),(2,2,3),(3,3,5),(4,4,6),(5,5,2),(6,6,3),(7,7,1),(8,8,6),(9,9,7),(10,10,5),(11,1,3),(12,2,4),(13,3,2),(14,4,8),(15,5,1),(16,6,5),(17,7,8),(18,8,4),(19,9,3),(20,10,3);
/*!40000 ALTER TABLE `users_to_achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_to_events`
--

DROP TABLE IF EXISTS `users_to_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_to_events` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `user_ID` int NOT NULL,
  `event_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_ID` (`user_ID`),
  KEY `event_ID` (`event_ID`),
  CONSTRAINT `users_to_events_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `users_to_events_ibfk_2` FOREIGN KEY (`event_ID`) REFERENCES `events` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_to_events`
--

LOCK TABLES `users_to_events` WRITE;
/*!40000 ALTER TABLE `users_to_events` DISABLE KEYS */;
INSERT INTO `users_to_events` VALUES (1,1,1),(2,2,3),(3,4,4),(4,4,2),(5,5,5),(6,6,2),(7,7,7),(8,7,9),(9,8,4),(10,8,8);
/*!40000 ALTER TABLE `users_to_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_to_goods`
--

DROP TABLE IF EXISTS `users_to_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_to_goods` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `user_ID` int NOT NULL,
  `good_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_ID` (`user_ID`),
  KEY `good_ID` (`good_ID`),
  CONSTRAINT `users_to_goods_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `users_to_goods_ibfk_2` FOREIGN KEY (`good_ID`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_to_goods`
--

LOCK TABLES `users_to_goods` WRITE;
/*!40000 ALTER TABLE `users_to_goods` DISABLE KEYS */;
INSERT INTO `users_to_goods` VALUES (11,1,5),(12,2,2),(13,4,2),(14,4,1),(15,5,4),(16,6,8),(17,6,10),(18,8,6),(19,10,2),(20,10,6);
/*!40000 ALTER TABLE `users_to_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_to_heroes`
--

DROP TABLE IF EXISTS `users_to_heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_to_heroes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `user_ID` int NOT NULL,
  `hero_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `hero_ID` (`hero_ID`),
  KEY `users_heroes` (`user_ID`),
  CONSTRAINT `users_to_heroes_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `users_to_heroes_ibfk_2` FOREIGN KEY (`hero_ID`) REFERENCES `heroes` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_to_heroes`
--

LOCK TABLES `users_to_heroes` WRITE;
/*!40000 ALTER TABLE `users_to_heroes` DISABLE KEYS */;
INSERT INTO `users_to_heroes` VALUES (1,1,1),(2,3,2),(3,4,5),(4,4,3),(5,5,1),(6,6,1),(7,7,2),(8,7,8),(9,8,2),(10,9,4);
/*!40000 ALTER TABLE `users_to_heroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_to_levels`
--

DROP TABLE IF EXISTS `users_to_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_to_levels` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `user_ID` int NOT NULL,
  `level_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_ID` (`user_ID`),
  KEY `level_ID` (`level_ID`),
  CONSTRAINT `users_to_levels_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `users_to_levels_ibfk_2` FOREIGN KEY (`level_ID`) REFERENCES `levels` (`Number`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_to_levels`
--

LOCK TABLES `users_to_levels` WRITE;
/*!40000 ALTER TABLE `users_to_levels` DISABLE KEYS */;
INSERT INTO `users_to_levels` VALUES (1,1,13),(2,2,45),(3,3,13),(4,4,87),(5,5,12),(6,6,10),(7,7,150),(8,8,20),(9,9,20),(10,10,123),(11,12,20);
/*!40000 ALTER TABLE `users_to_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_to_powers`
--

DROP TABLE IF EXISTS `users_to_powers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_to_powers` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `user_ID` int NOT NULL,
  `power_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_ID` (`user_ID`),
  KEY `power_ID` (`power_ID`),
  CONSTRAINT `users_to_powers_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `users_to_powers_ibfk_2` FOREIGN KEY (`power_ID`) REFERENCES `powers` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_to_powers`
--

LOCK TABLES `users_to_powers` WRITE;
/*!40000 ALTER TABLE `users_to_powers` DISABLE KEYS */;
INSERT INTO `users_to_powers` VALUES (1,1,3),(2,2,4),(3,2,5),(4,4,5),(5,5,2),(6,6,2),(7,7,3),(8,7,6),(9,8,7),(10,8,9),(11,1,5),(12,1,7),(13,2,2),(14,3,8),(15,4,2),(16,5,7),(17,5,8),(18,6,4),(19,6,9);
/*!40000 ALTER TABLE `users_to_powers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_to_pumps`
--

DROP TABLE IF EXISTS `users_to_pumps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_to_pumps` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `user_ID` int NOT NULL,
  `pump_ID` int NOT NULL,
  `level` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `user_ID` (`user_ID`),
  KEY `pump_ID` (`pump_ID`),
  CONSTRAINT `users_to_pumps_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `users_to_pumps_ibfk_2` FOREIGN KEY (`pump_ID`) REFERENCES `pumps` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_to_pumps`
--

LOCK TABLES `users_to_pumps` WRITE;
/*!40000 ALTER TABLE `users_to_pumps` DISABLE KEYS */;
INSERT INTO `users_to_pumps` VALUES (1,1,3,1),(2,2,4,3),(3,3,5,2),(4,3,4,5),(5,5,5,3),(6,6,3,2),(7,6,5,1),(8,6,6,3),(9,7,2,2),(10,8,2,2);
/*!40000 ALTER TABLE `users_to_pumps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_to_towers`
--

DROP TABLE IF EXISTS `users_to_towers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_to_towers` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `user_ID` int NOT NULL,
  `tower_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `tower_ID` (`tower_ID`),
  KEY `users_towers` (`user_ID`),
  CONSTRAINT `users_to_towers_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `users_to_towers_ibfk_2` FOREIGN KEY (`tower_ID`) REFERENCES `towers` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_to_towers`
--

LOCK TABLES `users_to_towers` WRITE;
/*!40000 ALTER TABLE `users_to_towers` DISABLE KEYS */;
INSERT INTO `users_to_towers` VALUES (1,1,1),(2,2,5),(3,3,2),(4,3,1),(5,5,1),(6,6,1),(7,6,4),(8,7,3),(9,8,3),(10,9,8);
/*!40000 ALTER TABLE `users_to_towers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersnew`
--

DROP TABLE IF EXISTS `usersnew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersnew` (
  `id` int DEFAULT NULL,
  `name` text,
  `IsAdmin` text,
  `Money` int DEFAULT NULL,
  KEY `users_name` (`Money`),
  KEY `money_index` (`Money`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersnew`
--

LOCK TABLES `usersnew` WRITE;
/*!40000 ALTER TABLE `usersnew` DISABLE KEYS */;
INSERT INTO `usersnew` VALUES (1,'Isabella','false',47244),(2,'Patin','true',87617),(3,'Shelby','true',54313),(4,'Bern','true',7859),(5,'Consuelo','true',12336),(6,'Thekla','true',72159),(7,'Hesther','false',97136),(8,'Grantley','true',96637),(9,'Yank','false',19592),(10,'Isa','true',60817),(11,'Loy','true',40164),(12,'Ulrick','false',9178),(13,'Allina','false',77989),(14,'Verina','true',81289),(15,'Gustav','false',25008),(16,'Rodge','false',94),(17,'Bradley','true',19021),(18,'Rivalee','false',97859),(19,'Raphaela','true',46149),(20,'Lefty','false',8698),(21,'Tabina','false',56260),(22,'Hulda','true',29168),(23,'Cecelia','false',43498),(24,'Webster','true',5431),(25,'Jane','true',48336),(26,'Gilbert','true',22601),(27,'Issie','false',9672),(28,'Waylan','true',30424),(29,'Valentino','false',17203),(30,'Dory','true',93858),(31,'Anatollo','false',65071),(32,'Dedie','false',13706),(33,'Dina','false',46463),(34,'Israel','true',20807),(35,'Averill','false',46459),(36,'Kimberley','true',59276),(37,'Wittie','true',99412),(38,'Vita','true',57647),(39,'Effie','false',94043),(40,'Maurine','false',27610),(41,'Enrica','false',82708),(42,'Gilles','false',56473),(43,'Biron','true',22359),(44,'Eachelle','true',80532),(45,'Paco','false',78533),(46,'Myrtie','true',10393),(47,'Lolita','true',17436),(48,'Giselbert','false',34139),(49,'Wash','false',41038),(50,'Anneliese','true',66974),(51,'Leonanie','false',66488),(52,'Yanaton','false',17531),(53,'Christoforo','true',41374),(54,'Mal','false',8303),(55,'Peyter','false',26798),(56,'Chandler','false',49685),(57,'Hilly','false',60878),(58,'Leta','true',66593),(59,'Cindelyn','false',55578),(60,'Taddeusz','true',35955),(61,'Susan','true',7187),(62,'Elisha','true',24228),(63,'Ignacius','true',82723),(64,'Sandro','false',70290),(65,'Angele','false',94064),(66,'Nance','true',66118),(67,'Arv','false',96544),(68,'Chase','true',16220),(69,'Linc','true',7100),(70,'Kristien','true',37316),(71,'Abigael','true',29204),(72,'Karrah','true',4533),(73,'Gipsy','true',36533),(74,'Forrester','true',94974),(75,'Nathanil','false',75308),(76,'Hamil','false',62735),(77,'Natalee','false',3721),(78,'Alonzo','false',26070),(79,'Blisse','false',11846),(80,'Matthieu','false',24980),(81,'Geri','true',95226),(82,'Isa','false',91809),(83,'Andy','false',37879),(84,'Junie','false',1852),(85,'Sidney','false',29344),(86,'Puff','true',5599),(87,'Kerby','false',66454),(88,'Rory','true',86000),(89,'Jany','true',32371),(90,'Barri','false',2343),(91,'Charla','true',69306),(92,'Vale','false',90198),(93,'Hasty','true',97467),(94,'Packston','true',87207),(95,'Prissie','true',9216),(96,'Elisabetta','true',15771),(97,'Timmi','false',65345),(98,'Galen','false',19844),(99,'Trude','true',39486),(100,'Westbrooke','true',23048);
/*!40000 ALTER TABLE `usersnew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuesofcharacteristic`
--

DROP TABLE IF EXISTS `valuesofcharacteristic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valuesofcharacteristic` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Value` bigint DEFAULT NULL,
  `Characteristic_ID` int NOT NULL,
  `Power_ID` int DEFAULT NULL,
  `Equipment_ID` int DEFAULT NULL,
  `Hero_ID` int DEFAULT NULL,
  `Enemy_ID` int DEFAULT NULL,
  `Tower_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Characteristic_ID` (`Characteristic_ID`),
  KEY `Power_ID` (`Power_ID`),
  KEY `Equipment_ID` (`Equipment_ID`),
  KEY `Hero_ID` (`Hero_ID`),
  KEY `Enemy_ID` (`Enemy_ID`),
  KEY `Tower_ID` (`Tower_ID`),
  CONSTRAINT `valuesofcharacteristic_ibfk_1` FOREIGN KEY (`Characteristic_ID`) REFERENCES `characteristic` (`ID`),
  CONSTRAINT `valuesofcharacteristic_ibfk_2` FOREIGN KEY (`Power_ID`) REFERENCES `powers` (`ID`),
  CONSTRAINT `valuesofcharacteristic_ibfk_3` FOREIGN KEY (`Equipment_ID`) REFERENCES `equipments` (`ID`),
  CONSTRAINT `valuesofcharacteristic_ibfk_4` FOREIGN KEY (`Hero_ID`) REFERENCES `heroes` (`ID`),
  CONSTRAINT `valuesofcharacteristic_ibfk_5` FOREIGN KEY (`Enemy_ID`) REFERENCES `enemies` (`ID`),
  CONSTRAINT `valuesofcharacteristic_ibfk_6` FOREIGN KEY (`Tower_ID`) REFERENCES `towers` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuesofcharacteristic`
--

LOCK TABLES `valuesofcharacteristic` WRITE;
/*!40000 ALTER TABLE `valuesofcharacteristic` DISABLE KEYS */;
INSERT INTO `valuesofcharacteristic` VALUES (1,50,8,NULL,NULL,8,NULL,NULL),(2,150,1,NULL,1,NULL,NULL,NULL),(3,50,2,2,NULL,NULL,NULL,NULL),(4,20,3,NULL,NULL,3,NULL,NULL),(5,300,4,NULL,NULL,NULL,4,NULL),(6,15,5,NULL,NULL,NULL,NULL,5),(7,20,6,6,NULL,NULL,NULL,NULL),(8,100,7,NULL,NULL,NULL,NULL,10),(9,70,9,NULL,NULL,NULL,7,NULL),(10,50,10,NULL,9,NULL,NULL,NULL),(11,50,3,NULL,NULL,2,NULL,NULL),(12,120,8,NULL,NULL,2,NULL,NULL),(13,30,11,NULL,NULL,2,NULL,NULL);
/*!40000 ALTER TABLE `valuesofcharacteristic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'towerdefensemain'
--
/*!50003 DROP FUNCTION IF EXISTS `UserAdminMon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `UserAdminMon`(userid int, mon int) RETURNS tinyint(1)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UserGoods` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `UserGoods`(mon int, go int) RETURNS varchar(255) CHARSET utf8mb4
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UserPump` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `UserPump`(lvl int) RETURNS varchar(255) CHARSET utf8mb4
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CanBuyGood` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CanBuyGood`(in HaveMoney int)
BEGIN
SELECT * FROM goods
WHERE price<=HaveMoney
ORDER BY price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CanByGood` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CanByGood`(in HaveMoney int)
BEGIN
SELECT * FROM goods
WHERE price<=HaveMoney
ORDER BY price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ShowEquipByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowEquipByName`(in word varchar(50))
BEGIN
SELECT * FROM equipments
WHERE name LIKE (CONCAT("%", word, "%"));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ShowHeroesByType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowHeroesByType`(in TypeFight varchar(50))
BEGIN
SELECT * FROM heroes
WHERE TypeOfFight=TypeFight;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Show_T_byLevel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Show_T_byLevel`(in level int)
BEGIN
SELECT * FROM towers
WHERE levelnumber<=level;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `allhaveuser`
--

/*!50001 DROP VIEW IF EXISTS `allhaveuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `allhaveuser` AS select `u`.`ID` AS `ID`,`uta`.`achievment_ID` AS `Достижения`,`ute`.`event_ID` AS `Пройденные_евенты`,`utl`.`level_ID` AS `Уровень` from (((`users` `u` left join `users_to_achievements` `uta` on((`uta`.`user_ID` = `u`.`ID`))) left join `users_to_events` `ute` on((`ute`.`user_ID` = `u`.`ID`))) left join `users_to_levels` `utl` on((`utl`.`user_ID` = `u`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `heroandtheirequip`
--

/*!50001 DROP VIEW IF EXISTS `heroandtheirequip`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `heroandtheirequip` AS select `h`.`Name` AS `Имя_Героя`,`h`.`Feature` AS `Особенность_Героя`,`e`.`Name` AS `Название_предмета`,`e`.`Description` AS `Описание_предмета` from ((`heroes` `h` join `equipments_to_heroes` `eth` on((`eth`.`hero_ID` = `h`.`ID`))) join `equipments` `e` on((`e`.`ID` = `eth`.`equipment_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_heroes_towers_count`
--

/*!50001 DROP VIEW IF EXISTS `users_heroes_towers_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_heroes_towers_count` AS select `u`.`ID` AS `ID`,(select count(0) from `users_to_towers` where (`users_to_towers`.`user_ID` = `utt`.`user_ID`)) AS `TOWERS`,(select count(0) from `users_to_heroes` where (`users_to_heroes`.`user_ID` = `uth`.`user_ID`)) AS `HEROES` from ((`users` `u` left join `users_to_heroes` `uth` on((`uth`.`user_ID` = `u`.`ID`))) left join `users_to_towers` `utt` on((`utt`.`user_ID` = `u`.`ID`))) group by `u`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-30 12:25:51
