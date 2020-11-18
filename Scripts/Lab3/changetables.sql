use  bdclinic;

-- Будем работать с таблицей complaint
-- Сначала удалим ее.
 drop table complaint;

-- Таблица которая должна быть
/*
CREATE TABLE complaint(
id_of_complaint int primary key auto_increment,
place varchar(30) not null,
type_of_pain varchar(30),
prerequisites varchar(30),
id_of_visit int,
foreign key(id_of_visit) references visit(id_of_visit)
);
*/

-- Создадим таблицу с ошибками
CREATE TABLE complaint_error( -- Ошибочное имя таблицы
id_of_complaintqwe int primary key auto_increment, -- Ошибочный столбец 
placeque varchar(30) not null, -- Ошибочное имя столбца
-- Отсутствует столбец
prerequisites varchar(30),
id_of_visit int,
foreign key(id_of_visit) references patient(id_of_patient) -- Ошибочный внешний ключ
);
-- 1) Переименуем Ошибочное имя таблицы в правильное
alter table complaint_error
rename to complaint;

-- 2) Исправим  Ошибочный столбец путем удаления столбца и последующим созданием правильного
alter table complaint 
drop column id_of_complaintqwe,
add id_of_complaint int primary key auto_increment first;

-- 3) Переименнуем Ошибочное имя столбца в правильное
alter table complaint
change placeque place varchar(30) not null;

-- 4) Добавим колонку с неправильным типом
alter table complaint 
add type_of_pain int not null;

-- Изменим колонку на правильный тип
alter table complaint
modify type_of_pain varchar(30);

-- 5) Удалим ошибочный внешний ключ (FK) 
alter table complaint
drop CONSTRAINT complaint_ibfk_1;

-- 6) Добавим внешний ключ(FK)
alter table complaint
add foreign key(id_of_visit) references visit(id_of_visit);

-- Работа с другой таблицей
-- 7)Создадим несколько колонок в другой таблице(patient)
alter table patient
add(age int not null, work char(50), medical_card char(10) not null);

-- 8)Изменим несколько колонок в другой таблице(patient)
alter table patient
modify age bigint,
modify work varchar(50),
modify medical_card char(20);

-- 9) Поставим колонку age после work
alter table patient
modify column age bigint after work;

-- 10)Удалим несколько колонок в другой таблице(patient)
alter table patient
drop column age,
drop column work,
drop column medical_card;