use bdclinic;
ALTER TABLE people
add id_of_patient int,
add constraint Fk_Patient
foreign key (id_of_patient) references patient(id_of_patient)
on delete set null
on update restrict;

use towerdefense;
alter table users_to_heroes
drop column id,
add constraint Fk_PatientSost
primary key (user_id, hero_id);
