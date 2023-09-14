/*
VISTAS 
*/

-- View1: Que servicio eligio cada cliente
create view View1 as select s.id_servicio, s.servicio, c.id_cliente, c.nombre, c.apellido from servicio s join clientes c on s.id_servicio = c.id_servicio;
select * from View1;

-- View2: En que sede esta cada empleado
create view View2 as select s.id_sede, s.nombre as NombreSede, e.id_empleado, e.nombre, e.apellido from sede s join empleados e on s.id_sede = e.id_sede;
select * from View2;

-- View3: Que libros de suspenso hay
create view View3 as select l.titulo, b.id_biblioteca, b.genero from biblioteca b join libros l on l.id_biblioteca = b.id_biblioteca where b.genero LIKE '%suspenso%';
select * from View3;

-- View 4: Que genero alquilaron los clientes
create view View4 as select s.servicio, b.genero, c.id_cliente, c.nombre, c.apellido from servicio s join biblioteca b on s.id_servicio = b.id_servicio join clientes c on s.id_servicio = c.id_servicio where s.servicio LIKE '%ALQ%';
select * from View4;

-- View5: Que clientes compraron comics
create view View5 as select c.id_cliente, c.nombre, c.apellido, b.categoria, s.servicio from clientes c join servicio s on c.id_servicio = s.id_servicio join biblioteca b on s.id_servicio = b.id_servicio where s.servicio LIKE '%COM%';
select * from View5;