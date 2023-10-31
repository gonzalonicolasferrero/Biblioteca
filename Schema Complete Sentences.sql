-- select @@autocommit;

-- set autocommit = 0;

-- 1er Tabla
select * from comics;

start transaction;
delete from comics where isbn = 112347; 
-- insert into comics values (112347, 'C3', 6, 'Marvel Zombies 3', 'OvniPress', '1999-05-12');

-- rollback;

-- commit;



-- 2da Tabla
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
