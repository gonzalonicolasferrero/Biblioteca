-- Create SP 1
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

-- Llamar SP
-- CALL OrdenarLibros('Biblioteca', 'id_biblioteca', 'ASC'); -- Orden ascendente





-- Create SP 2
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

-- Llamar SP
-- call InsertarComic('112348', 'C4', '12', 'Secret Wars 1', 'Marvel', '2023-01-01');