-- Пересоздание базы данных
drop database bdclinic;
create database bdclinic;

-- Создание таблиц
use bdclinic;
CREATE TABLE schedule(
id_of_schedule int primary key auto_increment,
days_of_week varchar(2),
hours_start time,
hours_end time);

CREATE TABLE address(
id_of_address int primary key auto_increment,
region varchar(50) not null,
settlement varchar(30) not null,
district varchar(30),
street varchar(30) not null,
house_number varchar(30) not null,
flat_number int
);

CREATE TABLE clinic(
id_of_clinic int primary key auto_increment,
firstname varchar(50) not null,
phone_number char(11) not null,
license varchar(30) not null,
id_of_address int,
foreign key(id_of_address) references address(id_of_address)
);

CREATE TABLE department(
id_of_department int primary key auto_increment,
phone_number char(11) not null,
firstname varchar(50) not null,
id_of_clinic int,
foreign key(id_of_clinic) references clinic(id_of_clinic)
);

CREATE TABLE people(
id_of_people int primary key auto_increment,
surname varchar(30) not null,
firstname varchar(30) not null,
patrynymic varchar(30),
sex char(1) not null,
birthday date not null
);

CREATE TABLE patient(
id_of_patient int primary key auto_increment,
polis char(16) not null,
snils char(11) not null,
pastlinesses varchar(30),
id_of_address int,
id_of_people int,
foreign key(id_of_address) references address(id_of_address),
foreign key(id_of_people) references people(id_of_people)
);

CREATE TABLE visit(
id_of_visit int primary key auto_increment,
date_visit datetime not null,
date_of_recording date,
diagnosus varchar(30),
id_of_patient int not null auto_increment,
foreign key(id_of_patient) references patient(id_of_patient)
);

CREATE TABLE complaint(
id_of_complaint int primary key auto_increment,
place varchar(30) not null,
type_of_pain varchar(30),
prerequisites varchar(30),
id_of_visit int,
foreign key(id_of_visit) references visit(id_of_visit)
);

CREATE TABLE doctor(
id_of_doctor int primary key auto_increment,
speciality varchar(30),
experience int not null,
lotNumber int,
id_of_department int,
id_of_people int,
foreign key(id_of_department) references department(id_of_department),
foreign key(id_of_people) references people(id_of_people)
);

CREATE TABLE cabinet(
id_of_cabinet int primary key auto_increment,
number char(8)
);

CREATE TABLE doc_sch_cab_vis(
id_of_doc_sch_cab_vis int primary key auto_increment,
id_of_doctor int not null,
id_of_schedule int not null,
id_of_cabinet int not null,
id_of_visit int not null,
foreign key(id_of_doctor) references doctor(id_of_doctor),
foreign key(id_of_schedule) references schedule(id_of_schedule),
foreign key(id_of_cabinet) references cabinet(id_of_cabinet),
foreign key(id_of_visit) references visit(id_of_visit)
);