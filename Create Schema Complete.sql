/*
create schema biblioteca;

use biblioteca;
*/

create table sede (
id_sede int not null,
nombre varchar(30),
direccion varchar(50),
primary key (id_sede));

create table empleados (
id_empleado int not null,
id_sede int not null,
nombre text(20),
apellido text(30),
email varchar(50),
telefono int,
puesto text(30),
primary key (id_empleado));

create table servicio (
id_servicio varchar(15),
id_cliente int not null,
id_empleado int not null, 
servicio text(20),
fecha date,
comentarios varchar(60),
primary key(id_servicio));

create table clientes (
id_cliente int not null,
id_servicio varchar(15),
nombre text(20),
apellido text(30),
direccion varchar(50),
email varchar(50),
telefono int,
primary key (id_cliente));

create table biblioteca (
id_biblioteca varchar(15),
id_servicio varchar(15),
categoria text(20),
genero text(20),
anio int,
editorial text(40),
primary key (id_biblioteca));
    
create table mangas (
isbn int not null,
id_biblioteca varchar(15),
cantidad_copias int,
titulo varchar(50),
autor text(50),
fecha_publicacion date,
primary key(isbn));

create table libros (
isbn int not null,
id_biblioteca varchar(15),
cantidad_copias int,
titulo varchar(50),
autor text(50),
fecha_publicacion date,
primary key(isbn));

create table comics (
isbn int not null,
id_biblioteca varchar(15),
cantidad_copias int,
titulo varchar(50),
autor text(50),
fecha_publicacion date,
primary key(isbn));
   
   
-- Foreign Key
	ALTER TABLE empleados
	ADD FOREIGN KEY (id_sede) references sede (id_sede);
	ALTER TABLE servicio
	ADD FOREIGN KEY (id_cliente) references clientes (id_cliente);
    	ALTER TABLE servicio
	ADD FOREIGN KEY (id_empleado) references empleados (id_empleado);
	ALTER TABLE biblioteca
	ADD FOREIGN KEY (id_servicio) references servicio (id_servicio);
	ALTER TABLE mangas
	ADD FOREIGN KEY (id_biblioteca) references biblioteca (id_biblioteca);
	ALTER TABLE libros
	ADD FOREIGN KEY (id_biblioteca) references biblioteca (id_biblioteca);
	ALTER TABLE comics
	ADD FOREIGN KEY (id_biblioteca) references biblioteca (id_biblioteca);    
