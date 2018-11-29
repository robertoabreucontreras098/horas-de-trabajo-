/* INGENIERIA INDUSTRIAL BASE DE DATOS */

create database veterianria
use veterinaria

 /* Tabla del usuario*/ 

create table l_usuario
(
ID_usuario varchar (10) primary key,
nombre varchar (15) not null,
Pass_User Varchar(50) not null,
ID_propietario varchar (10)
);
drop table l_usuario;

/* En esta tabla se insertaran los datos del animal */

create table Datos_animal
(
ID_animal varchar (20) primary key not null,
Raza varchar(10) not null,
sexo varchar(8) not null,
partos varchar (5) not null,
fecha_partos varchar (15) not null,
vacunas varchar (100) not null,
enfermedades varchar (500),
peso varchar (60) not null,
propietario varchar (100) not null,
ID_hijos varchar (10), 
ID_vacunas varchar (15)
);
drop table Datos_animal;

/* Tabla de vacunas */

create table vacunas
(
ID_vacunas varchar (15) primary key,
tipo_vacunas varchar (10) not null,
nobre_vacunas varchar (50) not null,
cantidad varchar (30) not null,
fecha_vacuna varchar (20) not null,
ID_virus varchar (10)
);
drop table vacunas;


create table Datos_hijos
(
ID_hijos varchar (10) primary key,
sexo varchar (8) not null,
peso varchar (30) not null,
fecha_nacimiento varchar (30) not null,
vacunas varchar (100) not null, 
fecha_vacunas varchar (30) not null,
estado varchar (200) not null,
ID_vacunas varchar (15)
);
drop table Datos_hijos;

/* Aqui se insertaran los datos del propietario del animal*/

create table propietario
(
ID_propietario varchar(10) primary key, 
nombre varchar (50) not null,
apellido varchar (50) not null,
telefono varchar (15) not null,
Direccion varchar (250) not null,
correo_electronico varchar (50) not null,
ID_animal varchar (20)
);
drop table propietario; 

/* Esta tabla pertenece solo a las enfermedades*/

create table virus
(
ID_virus varchar (10) primary key,
nombre_virus varchar (200) not null,
cantidad_afectada varchar (20) not null,
codigo_animal_afectado varchar (20) not null,
fecha varchar (15), 
ID_animal varchar (20),
ID_hijos varchar (10)
);
drop table virus;
---------------------------------------------------------------------------------------------------------------
                                          --Relacion--   
---------------------------------------------------------------------------------------------------------------

alter table l_usuario
add constraint fk_l_usuario_propietario foreign key (ID_propietario) references propietario(ID_propietario);


alter table propietario 
add constraint fk_propietario_Datos_animal foreign key (ID_animal) references Datos_animal (ID_animal);


alter table Datos_animal
add constraint fk_Datos_animal_Datos_hijos foreign key (ID_hijos) references Datos_hijos (ID_hijos),
constraint fk_Datos_animal_vacunas foreign key (ID_vacunas) references vacunas (ID_vacunas); 


alter table Datos_hijos
add constraint fk_Datos_hijos_vacunas foreign key (ID_vacunas) references vacunas (ID_vacunas);

alter table vacunas 
add constraint fk_vacunas_virus foreign key (ID_virus) references virus (ID_virus);


alter table virus 
add constraint fk_virus_Datos_animal foreign key (ID_animal) references Datos_animal (ID_animal),
constraint fk_virus_Datos_hijos foreign key (ID_hijos) references Datos_hijos (ID_hijos);

/* CREATED BY ING:ROBERTO ABREU CONTRERAS 