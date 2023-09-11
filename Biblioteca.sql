create schema biblioteca;

use biblioteca;

-- Tabla Sede
create table if not exists sede (
id_sede int primary key auto_increment not null,
nombre varchar (50) not null);


-- Tabla Empleados
create table if not exists empleados (
id_empleado int primary key auto_increment not null,
id_sede int not null,
puesto text (30),
descripcion_puesto varchar (45)); 
	ALTER TABLE empleados
	ADD FOREIGN KEY (id_sede) references sede (id_sede);


-- Tabla Accion
create table if not exists accion (
id_accion varchar(50) primary key not null,
id_cliente int not null,
id_categoria INT not null,
id_empleado INT not null, 
factura INT );
	ALTER TABLE accion
	ADD FOREIGN KEY (id_cliente) references clientes (id_cliente);
	ALTER TABLE accion
	ADD FOREIGN KEY (id_categoria) references Categoria (id_categoria);
	ALTER TABLE accion
	ADD FOREIGN KEY (id_empleado) references Empleados (id_empleado);


-- Tabla Clientes
create table if not exists clientes (
id_cliente int primary key auto_increment not null,
id_categoria INT,
nombre text (20),
apellido text (20),
direccion varchar (40),
email varchar (40),
telefono INT,
DNI INT);
	ALTER TABLE clientes
	ADD FOREIGN KEY (id_categoria) references categoria (id_categoria);


-- Tabla Categoria
create table if not exists categoria (
id_categoria int primary key auto_increment not null,
tipo int not null,
id_accion varchar (50) not null,
id_isbn INT not null,
cantidad_copias INT,
genero text (20),
anio date, 
editorial varchar (30));
	ALTER TABLE categoria
	ADD FOREIGN KEY (id_accion) references accion (id_accion);
    ALTER TABLE categoria
	ADD FOREIGN KEY (id_isbn) references libros (id_isbn);
	ALTER TABLE categoria
	ADD FOREIGN KEY (id_isbn) references manga (id_isbn);
    ALTER TABLE categoria
	ADD FOREIGN KEY (id_isbn) references comics (id_isbn);
    
    
-- Tabla Libros
create table if not exists libros (
id_isbn int primary key not null,
tipo varchar (20),
cantidad_copias INT,
estado text (10),
titulo varchar(30),
autor text (50),
fecha_publicacion date);


-- Tabla Manga
create table if not exists manga (
id_isbn int primary key not null,
tipo varchar (20),
cantidad_copias INT,
estado text (10),
titulo varchar(30),
autor text (50),
fecha_publicacion date);


-- Tabla Comics
create table if not exists comics (
id_isbn int primary key not null,
tipo varchar (20),
cantidad_copias INT,
estado text (10),
titulo varchar(30),
autor text (50),
fecha_publicacion date);
