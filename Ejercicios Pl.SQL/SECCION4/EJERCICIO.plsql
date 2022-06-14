--Obtener e imprimir todas las opiniones para la película con ID 5.
DECLARE
--DECLARAMOS EL CURSOS
CURSOR opiniones IS
--SELECCIONAMOS TODO DE LA TABLA OPINION
SELECT o.* 
--LE DAMOS UN ALIAS A OPINION
FROM opinion o
--Devuelve todas las filas cuando hay al menos una coincidencia en ambas tablas
INNER JOIN pelicula p ON o.idpelicula = p.idpelicula 
--DE LA PELICULA CON ID 5
WHERE o.idpelicula = 5;
 
BEGIN
--REGISTRO DE EL FOR ES OP
    FOR op IN opiniones LOOP
        DBMS_OUTPUT.PUT_LINE(op.opinion);
    END LOOP;
END;


--Obtener e imprimir todas las opiniones de un usuario (enviar id de usuario por parámetro al cursor), imprimiendo primero el nombre de la película en mayúsculas y luego la opinión.

DECLARE
--DECLARAMOS EL CURSOR Y LE PONEMOS COMO PARAMETRO NUMBER
CURSOR opiniones(vp_id_usuario NUMBER) IS
--SELECCIONAMOS DE LA TABLA OPINION Y PELICULA LAS COLUMNAS OPINION Y TITULO
SELECT o.opinion, p.titulo
--SELECCIONAMOS TABLA OPINION Y LE DAMOS UN ALIAS
FROM opinion o
--USAMOS UNNER JOIN PARA HAYAR CONCIDENCIA Y A PELICULA LE COLOCAMOS ALIAS
INNER JOIN pelicula p ON o.idpelicula = p.idpelicula
--DE OPINION IDUSUARIO VA A SER IGUAL A NUESTRO PARAMETRO
WHERE o.idusuario = vp_id_usuario;
 
BEGIN
--REGISTRO DE EL FOR ES OP
    FOR op IN opiniones(1) LOOP   
--MOSTRAMOS NUESTRO DATO ALMACENADO EN EL REGISTRO OP (UPPER PARA VOLVER EL RESULTADO EN MAYUS)   
        dbms_output.put_line(upper(op.titulo));
--MOSTRAMOS EL DATO ALMACENADO EN EL REGISTRO OP
        dbms_output.put_line(op.opinion);
    END LOOP;
 
END;

--Cambiar todos los textos de opiniones para la película con ID 4. Modificar concatenando el nombre del usuario delante del texto. Ej: "Juan: Aquí iría la opinión del usuario". Imprimir cuantas filas fueron afectadas utilizando cursor implícito.

DECLARE
--DECLARAMOS EL CURSOR Y LE COLOCAMOS EL PARAMETRO
CURSOR cur_opiniones(vp_id_pelicula NUMBER) IS
--SELECCIONAMOS TODOS LOS DATOS DE LA TABLA OPINION Y LA TABLA USUARIO LA TABLA APODO
SELECT o.*, u.apodo
--DE LA TABLA OPINION Y LE AGREGAMOS ALIAS
FROM opinion o
--TRAEMOS DATOS ASOCIADOS DE LA TABLA USUARIO CON LOS DE LA TABLA OPINION CON INNER JOIN Y A USUARIO LE DAMOS ALIAS
INNER JOIN usuario u ON o.idusuario = u.idusuario
--DE DONDE TABLA OPINION COLUMNA IDPELICULA SERA IGUAL A NUESTRO PARAMETRO
WHERE o.idpelicula = vp_id_pelicula;
--DECLARAMOS DOS VARIABLES PARA ALMACENAR LOS DATOS
v_afectadas NUMBER;
v_nueva_opinion VARCHAR(140);
 
BEGIN
--OP ES EL REGISTRO DEL FOR
    FOR op IN cur_opiniones(4) LOOP
--EN LA VARIABLE NUEVA OPINION SERA IGUAL A LOS DATOS QUE ALMACENE EL REGISTRO
      v_nueva_opinion := op.apodo||': '||op.opinion;
--REALIZAMOS CAMBIO EN OPINION PARA QUE SEA IGUAL A LO ALMACENADO EN NUEVA OPINION    
      UPDATE opinion set opinion = v_nueva_opinion
      WHERE idopinion = op.idopinion;
--PARA VER LOS EFECTOS
      v_afectadas:= SQL%rowcount;
--MOSTRAMOS FILAS AFECTADAS    
      dbms_output.put_line('Afectadas: '||v_Afectadas);
    
    END LOOP;
 
END;