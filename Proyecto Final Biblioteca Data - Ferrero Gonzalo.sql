/* Importacion de data: */

-- Tabla de Biblioteca:
insert into biblioteca values ('C1', 'COM1', 'Comics', 'Terror', 1999, 'edicionesferrero');
insert into biblioteca values ('C2', 'COM2', 'Comics', 'Terror', 1999, 'edicionesferrero');
insert into biblioteca values ('C3', 'COM3', 'Comics', 'Terror', 1999, 'edicionesferrero');
insert into biblioteca values ('L1', 'COM4', 'Libros', 'Suspenso', 1999, 'edicionesferrero');
insert into biblioteca values ('L2', 'ALQ1', 'Libros', 'Suspenso', 1999, 'edicionesferrero');
insert into biblioteca values ('L3', 'ALQ2', 'Libros', 'Romantica', 1999, 'edicionesferrero');
insert into biblioteca values ('M1', 'ALQ3', 'Manga', 'Thriller', 1999, 'edicionesferrero');
insert into biblioteca values ('M2', 'ALQ4', 'Manga', 'Accion', 1999, 'edicionesferrero');

-- Tabla de Clientes:
insert into clientes values (42123456, 'COM1', 'Peter', 'Parker', 'Campos 1234', 'pparker@gmail.com', 1134567890);
insert into clientes values (42123457, 'COM2', 'Thor', 'Odinson', 'Campos 1235', 'todinson@gmail.com', 1134567891);
insert into clientes values (42123458, 'COM3', 'Dominic', 'Toretto', 'Campos 1236', 'dtoretto@gmail.com', 1134567892);
insert into clientes values (42123459, 'COM4', 'Brian', 'Oconner', 'Campos 1237', 'boconner@gmail.com', 1134567893);
insert into clientes values (42123460, 'ALQ1', 'Wade', 'Wilson', 'Campos 1238', 'wwilson@gmail.com', 1134567894);
insert into clientes values (42123461, 'ALQ2', 'Bruce', 'Wayne', 'Campos 1239', 'bwayne@gmail.com', 1134567895);
insert into clientes values (42123462, 'ALQ3', 'Tony', 'Stark', 'Campos 1240', 'tstark@gmail.com', 1134567896);
insert into clientes values (42123463, 'ALQ4', 'Marshall', 'Matters', 'Campos 1241', 'mmatters@gmail.com', 1134567897);

-- Tabla de Comics:
insert into comics values (112345, 'C1', 4, 'Marvel Zombies 1', 'OvniPress', '1999-05-10');
insert into comics values (112346, 'C2', 3, 'Marvel Zombies 2', 'OvniPress', '1999-05-11');
insert into comics values (112347, 'C3', 6, 'Marvel Zombies 3', 'OvniPress', '1999-05-12');

-- Tabla de Empleados:
insert into empleados values (40123456, 1, 'Roman', 'Riquelme', 'rriquelme@biblioteca.com', 112345678, 'Recepcionista');
insert into empleados values (40123457, 2, 'Guillermo', 'Schelotto', 'gschelotto@biblioteca.com', 112345679, 'Bibliotecario');
insert into empleados values (40123458, 3, 'Gustavo', 'Schelotto', 'guschelotto@biblioteca.com', 112345680, 'Consejero');
insert into empleados values (40123459, 4, 'Martin', 'Palermo', 'mpalermo@biblioteca.com', 112345681, 'Recepcionista');
insert into empleados values (40123460, 5, 'Carlos', 'Tevez', 'ctevez@biblioteca.com', 112345682, 'Consejero');
insert into empleados values (40123461, 1, 'Diego', 'Maradona', 'dmaradona@biblioteca.com', 112345683, 'Bibliotecario');
insert into empleados values (40123462, 2, 'Lionel', 'Messi', 'lmessi@biblioteca.com', 112345684, 'Administrador');
insert into empleados values (40123463, 3, 'Cristiano', 'Ronaldo', 'cronaldo@biblioteca.com', 112345685, 'Bibliotecario');

-- Tabla de Libros:
insert into libros values (123478, 'L1', 15, 'El Club de los Psicopatas', 'Jhon Mayer', '1999-05-10');
insert into libros values (123479, 'L2', 9, 'La Niebla', 'Jhon Mayer', '1999-05-11');
insert into libros values (123480, 'L3', 7, 'Las Ventajas de ser Invisible', 'Stephen King', '1999-05-12');

-- Tabla de Mangas:
insert into mangas values (892, 'M1', 2, ' Deadman Wonderland', 'Stephen Hawking', '1999-05-10');
insert into mangas values (893, 'M2', 1, ' Dragon Ball Z 1', 'Stephen Hawking', '1999-05-11');

-- Tabla de Sede:
insert into sede values (1, 'Ramos Mejia 1', 'Av de Mayo 17');
insert into sede values (2, 'Luzuriaga 1', 'Arieta 25');
insert into sede values (3, 'Ramos Mejia 2', 'Av Rivadavia 14874');
insert into sede values (4, 'San Justo 1', 'Juan Manuel de Rosas 3300');
insert into sede values (5, 'Belgrano 1', 'Av Cabildo 2156');

-- Tabla de Servicio:
insert into servicio values ('COM1', 42123456, 40123456, 'Compra', '2023-09-04', 'sin comentarios');
insert into servicio values ('COM2', 42123457, 40123457, 'Compra', '2023-09-04', 'sin comentarios');
insert into servicio values ('COM3', 42123458, 40123458, 'Compra', '2023-09-04', 'sin comentarios');
insert into servicio values ('COM4', 42123459, 40123459, 'Compra', '2023-09-04', 'sin comentarios');
insert into servicio values ('ALQ1', 42123460, 40123460, 'Alquiler', '2023-09-04', 'Devolver el 04/10/2023');
insert into servicio values ('ALQ2', 42123461, 40123461, 'Alquiler', '2023-09-04', 'Devolver el 04/10/2023');
insert into servicio values ('ALQ3', 42123462, 40123462, 'Alquiler', '2023-09-04', 'Devolver el 04/10/2023');
insert into servicio values ('ALQ4', 42123463, 40123463, 'Alquiler', '2023-09-04', 'Devolver el 04/10/2023');
