-- Averiguar el nombre del comic mediante el ISBN
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

select Function1 (112345) as NombreComic;


-- Seleccionar nombre y apellido del cliente mediante el id_cliente
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

select Function2 (42123456) as NombreCliente;