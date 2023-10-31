-- Creacion de Schema:

create schema biblioteca;
use biblioteca;

/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

-- Creacion de Tablas

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
   
/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */   
   
-- Creacion de Foreign Key:

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

/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

-- Creacion de Funciones:

/* Funcion 1: Averiguar el nombre del comic mediante el ISBN */
delimiter $$
create function Function1 (comicisbn varchar(50))
returns varchar(50)
reads sql data
begin
	declare resultado varchar(50);
    select titulo
    into resultado
    from comics
    where isbn = comicisbn;
return resultado;
end $$ 
delimiter ;
/* select Function1 (112345) as NombreComic; */

/* Funcion 2: Seleccionar nombre y apellido del cliente mediante el id_cliente */
delimiter $$
create function Function2 (clientid varchar(50))
returns varchar(50)
reads sql data
begin
	declare nombre_cliente varchar(30);
    declare apellido_cliente varchar(30);
    declare resultado varchar(50);
    select nombre, apellido
    into nombre_cliente, apellido_cliente
    from clientes
    where id_cliente = clientid;
    set resultado = concat (nombre_cliente, ' ', apellido_cliente);
return resultado;
end $$ 
delimiter ;
 /* select Function2 (42123456) as NombreCliente; */
 
/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

-- Creacion de Sentences:

/* select @@autocommit;
set autocommit = 0; */ 

/* 1er Tabla*/
select * from comics;
start transaction;
delete from comics where isbn = 112347; 
-- insert into comics values (112347, 'C3', 6, 'Marvel Zombies 3', 'OvniPress', '1999-05-12');
-- rollback;
-- commit;

/* 2da Tabla */
select * from clientes;
start transaction;
savepoint parte_0;
insert into clientes values (42123470, 'COM5', 'Philip', 'Morris', 'Campos 1242', 'pmorris@gmail.com', 1134567898);
insert into clientes values (42123471, 'COM6', 'Matthew', 'Perry', 'Campos 1243', 'mperry@gmail.com', 1134567899);
insert into clientes values (42123472, 'COM7', 'Courtney', 'Cox', 'Campos 1244', 'ccox@gmail.com', 1134567900);
insert into clientes values (42123473, 'COM8', 'Samantha', 'Carpenter', 'Campos 1245', 'scarpenter@gmail.com', 1134567901);
savepoint parte_1;
insert into clientes values (42123474, 'ALQ5', 'Michael', 'Myers', 'Campos 1246', 'mmyers@gmail.com', 1134567902);
insert into clientes values (42123475, 'ALQ6', 'Mike', 'Towers', 'Campos 1247', 'mtowers@gmail.com', 1134567903);
insert into clientes values (42123476, 'ALQ7', 'Michael', 'Jackson', 'Campos 1248', 'mjackson@gmail.com', 1134567904);
insert into clientes values (42123477, 'ALQ8', 'Megan', 'Fox', 'Campos 1249', 'mfox@gmail.com', 1134567905);
savepoint parte_2;
-- rollback to parte_1;

/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

-- Creacion de Stored Procedures:

/* SP 1 */
delimiter $$
-- Este sp puede ordenar la columna que desees en ascendente o descendente de la tabla que elijas.
CREATE PROCEDURE OrdenarLibros (
    IN NombreTabla VARCHAR(100),
    IN CampoOrden VARCHAR(100),
    IN OrdenTipo VARCHAR(10))
/*
1. Nombretabla: Seleccionar el nombre de tabla que se desea ordenar.
2. CampoOrden: El campo por el cual deseas ordernar la tabla.
3. OrdenTipo: El tipo de ordenamiento que queres, asc o desc
*/
BEGIN
    SET @query = CONCAT('SELECT * FROM ', NombreTabla, ' ORDER BY ', CampoOrden, ' ', OrdenTipo);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END $$
delimiter ;
/* Llamar SP: CALL OrdenarLibros('Biblioteca', 'id_biblioteca', 'ASC'); */

/* SP 2 */
DELIMITER $$
-- Procedimiento almacenado para insertar registros en la tabla estetica.tabla_ejemplo
CREATE PROCEDURE InsertarComic(
    IN b_isbn INT,
    IN b_id_biblioteca VARCHAR(20),
    IN b_cantidad_copias INT,
    IN b_titulo varchar(50),
    IN b_autor varchar(30),
    IN b_fecha_publicacion date)
BEGIN
    DECLARE mensaje VARCHAR(100);
    -- Intentar insertar un nuevo registro en la tabla
        INSERT INTO comics (isbn, id_biblioteca, cantidad_copias, titulo, autor, fecha_publicacion)
        VALUES (b_isbn, b_id_biblioteca, b_cantidad_copias, b_titulo, b_autor, b_fecha_publicacion);
    -- Comprobar si ocurrió un error durante la inserción
    IF ROW_COUNT() > 0 THEN
        SET mensaje = 'Biblioteca cargada correctamente';
    ELSE
        SET mensaje = 'No se pudo insertar la biblioteca. Corroborar los datos ingresados.';
    END IF;
    -- Mostrar el mensaje
    SELECT mensaje AS Mensaje;
END $$
DELIMITER ;
/* Llamar SP: call InsertarComic('112348', 'C4', '12', 'Secret Wars 1', 'Marvel', '2023-01-01'); */

/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

-- Creacion de Triggers:

/* Trigger 1 de tabla empleados, se modifica el dia, la categoria, el genero, el anio y la editorial quedando registro de quien lo hizo, en que fecha y hora. Estas tablas son before. */
create table empleados_log_i
(id_empleado int,
id_sede int,
nombre text(30),
apellido text(30),
email varchar(50),
telefono int,
puesto text(30),
fechacambio date,
horacambio time,
usercambio varchar(30));
/*
	insert into empleados_log_i values (
	new.id_empleado, new.id_sede, new.nombre, new.apellido, new.email, new.telefono, new.puesto, curdate(), curtime(), user());
*/
/* insert into empleados values (40123464, 1, 'Dibu', 'Martinez', 'dmartinez@biblioteca.com', 112345686, 'Bibliotecario'); */
/* select * from empleados_log_i */

create table empleados_log_u
(id_empleado int,
id_sede int, 
nombre text(30),
apellido text(30),
email varchar(50),
telefono int,
puesto text(30),
fechacambio date,
horacambio time,
usercambio varchar(30));
/*
	insert into empleados_log_u 
    select new.id_empleado, new.id_sede, new.nombre, new.apellido, new.email, new.telefono, new.puesto, curdate(), curtime(), user()
    from empleados;
*/
/* update empleados set id_sede = 1, nombre = 'Emiliano' where id_empleado = 40123464; */
/* select * from empleados_log_u; */

create table empleados_log_d
(id_empleado int,
id_sede int,
nombre text(30),
apellido text(30),
email varchar(50),
telefono int,
puesto text(30),
fechacambio date,
horacambio time,
usercambio varchar(30));
/*
	insert into empleados_log_d 
    select old.id_empleado, old.id_sede, old.nombre, old.apellido, old.email, old.telefono, old.puesto, curdate(), curtime(), user()
    from empleados;
*/
/* delete from empleados where id_empleado = 40123464; */
/* select * from empleados_log_d */


/*  Trigger 2 de tabla biblioteca, se modifica el id, la categoria, el genero, el anio y la editorial quedando registro de quien lo hizo, en que fecha y hora. Estas tablas son after. */
create table biblioteca_log_i
(id_biblioteca varchar(15),
categoria text(30),
genero text(30),
anio int,
editorial varchar(50),
fechacambio date,
horacambio time,
usercambio varchar(30));
/*
	insert into biblioteca_log_i values (
	new.id_biblioteca, new.categoria, new.genero, new.anio, new.editorial, curdate(), curtime(), user());
*/
/* insert into biblioteca (id_biblioteca, categoria, genero, anio, editorial) values ('M3', 'Manga', 'Drama', 2023, 'Crunchyroll'); */
/* select * from biblioteca_log_i */

create table biblioteca_log_u
(id_biblioteca varchar(15),
categoria text(30),
genero text(30),
anio int,
editorial varchar(50),
fechacambio date,
horacambio time,
usercambio varchar(30));
/*
	insert into biblioteca_log_u 
    select new.id_biblioteca, new.categoria, new.genero, new.anio, new.editorial, curdate(), curtime(), user()
    from biblioteca;
*/
/* update biblioteca set categoria = 'Comic', genero = 'IT', anio = 2000, editorial = 'Marvel' where id_biblioteca = 'M3'; */
/* select * from biblioteca_log_u */

create table biblioteca_log_d
(id_biblioteca varchar(15),
categoria text(30),
genero text(30),
anio int,
editorial varchar(50),
fechacambio date,
horacambio time,
usercambio varchar(30));
/*
	insert into biblioteca_log_d 
    select old.id_biblioteca, old.categoria, old.genero, old.anio, old.editorial, curdate(), curtime(), user()
    from biblioteca;
*/
/* delete from biblioteca where id_biblioteca = 'M3'; */
/* select * from biblioteca_log_d; */

/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

-- Creacion de Users:

use mysql;
create user 'UsuarioStgSelect'@'localhost';
/* El usuario creado tendra permisos solamente para lectura. */
alter user 'UsuarioStgSelect'@'localhost' identified by 'stg';
/* Se crea la contraseña del usuario */
grant select on biblioteca.* to 'UsuarioStgSelect'@'localhost';
/* Se le asigna permisos al usuario de solo lectura a la bd biblioteca. */

use mysql;
create user 'UsuarioStg'@'localhost';
/* El usuario creado tendra permisos solamente para lectura. */
alter user 'UsuarioStg'@'localhost' identified by 'stg';
/* Se crea la contraseña del usuario */
grant select, insert, update on biblioteca.* to 'UsuarioStg'@'localhost';
/* Se le asigna permisos al usuario de lectura, insercion y update a la bd biblioteca. */

/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

-- Creacion de Vistas:
/* View1: Que servicio eligio cada cliente */
create view View1 as select s.id_servicio, s.servicio, c.id_cliente, c.nombre, c.apellido from servicio s join clientes c on s.id_servicio = c.id_servicio;
/* select * from View1; */

/* View2: En que sede esta cada empleado */
create view View2 as select s.id_sede, s.nombre as NombreSede, e.id_empleado, e.nombre, e.apellido from sede s join empleados e on s.id_sede = e.id_sede;
/* select * from View2; */

/* View3: Que libros de suspenso hay */
create view View3 as select l.titulo, b.id_biblioteca, b.genero from biblioteca b join libros l on l.id_biblioteca = b.id_biblioteca where b.genero LIKE '%suspenso%';
/*select * from View3; */

/* View 4: Que genero alquilaron los clientes */
create view View4 as select s.servicio, b.genero, c.id_cliente, c.nombre, c.apellido from servicio s join biblioteca b on s.id_servicio = b.id_servicio join clientes c on s.id_servicio = c.id_servicio where s.servicio LIKE '%ALQ%';
/* select * from View4; */

/* View5: Que clientes compraron comics */
create view View5 as select c.id_cliente, c.nombre, c.apellido, b.categoria, s.servicio from clientes c join servicio s on c.id_servicio = s.id_servicio join biblioteca b on s.id_servicio = b.id_servicio where s.servicio LIKE '%COM%';
/* select * from View5; */

/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */