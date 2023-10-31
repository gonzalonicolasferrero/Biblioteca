-- Trigger 1 de tabla empleados, se modifica el di, la categoria, el genero, el anio y la editorial quedando registro de quien lo hizo, en que fecha y hora. Estas tablas son before.
-- select * from empleados

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
-- insert into empleados values (40123464, 1, 'Dibu', 'Martinez', 'dmartinez@biblioteca.com', 112345686, 'Bibliotecario');
-- select * from empleados_log_i

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
-- update empleados set id_sede = 1, nombre = 'Emiliano' where id_empleado = 40123464;
-- select * from empleados_log_u;

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
-- delete from empleados where id_empleado = 40123464;
-- select * from empleados_log_d





-- Trigger 2 de tabla biblioteca, se modifica el id, la categoria, el genero, el anio y la editorial quedando registro de quien lo hizo, en que fecha y hora. Estas tablas son after.
-- select * from biblioteca

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
-- insert into biblioteca (id_biblioteca, categoria, genero, anio, editorial) values ('M3', 'Manga', 'Drama', 2023, 'Crunchyroll');
-- select * from biblioteca_log_i

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
-- update biblioteca set categoria = 'Comic', genero = 'IT', anio = 2000, editorial = 'Marvel' where id_biblioteca = 'M3';
-- select * from biblioteca_log_u

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
-- delete from biblioteca where id_biblioteca = 'M3';
-- select * from biblioteca_log_d;
