-- Заполнение таблиц данными
use bdclinic;

insert into address(region, settlement, district, street, house_number, flat_number) values
("Волгоградская область", "Волгоград", "Ворошиловский", "улица Читинская", 56, null),
("Краснодарский край", "Краснодар", "Центральный", "улица Быкова", 5, 7);

insert into people(surname, firstname, patrynymic, sex, birthday) values
("Петров", "Иван", "Петрович", 'М', '2000-10-05');

insert into doctor(speciality, experience, lotNumber) values
("Хирург", 5, 3), ("Терапевт", 1, 5);

insert into cabinet(number) values
('123'), ('53');

insert into clinic(firstname, phone_number, license) values
("Клиника имени Иванова", '345-12-56-4', "QWER License..."),
("Центральная государственная больница", '567-32-81-9', "CENTR License...");


insert into schedule(days_of_week, hours_start, hours_end) values
('01', '12:00:00', '16:00:00'), ('05', '16:00:00', '21:30:00');

rename table doctor to doctors;
rename table visit to visitors;
