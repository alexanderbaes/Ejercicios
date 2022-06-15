--Ejercicio 1) Crear una function que reciba por parámetro un id de película.
--Se debe retornar nombre de la película, la calificación promedio numérica y calificación en texto (Entre 1 y 2: Mala - entre 3 y 4: Buena - Mayor a 4: Excelente) y el número de calificaciones, todo en un mismo texto.
--Ejemplo: "Power Rangers - Calificación: Buena (3,2) - Basada en 7 puntuaciónes".

CREATE OR REPLACE FUNCTION puntuacion_pelicula (
    p_id_pelicula NUMBER
) RETURN VARCHAR2 IS

    v_titulo_pelicula       VARCHAR2(50);
    v_puntuacion_promedio   NUMBER(10, 2);
    v_calificacion          VARCHAR2(10);
    v_cantidad_puntuaciones NUMBER(10);
    v_texto_respuesta       VARCHAR2(255);
BEGIN
    --SACAMOS LOS TITULOS DE LA TABLA PELICULAS
    SELECT
        p.titulo
    INTO v_titulo_pelicula
    FROM
        pelicula p
    WHERE
        p.idpelicula = p_id_pelicula;

    --SACAMOS EL PROMEDIO DE PUNTUACION DE LAS OPINIONES
    SELECT
        AVG(o.puntuacion)
    INTO v_puntuacion_promedio
    FROM
        opinion o
    WHERE
        o.idpelicula = p_id_pelicula;
    
    --CONDICION PARA AGREGAR CALIFICACION A NUESTRA VARIABLE DEPENDIENDO DE LA PUNTUACION
    IF v_puntuacion_promedio BETWEEN 1 AND 2 THEN
        v_calificacion := 'Mala';
    ELSIF v_puntuacion_promedio BETWEEN 3 AND 4 THEN
        v_calificacion := 'Buena';
    ELSIF v_puntuacion_promedio > 4 THEN
        v_calificacion := 'Excelente';
    END IF;
    
    --SACAMOS EL NUMERO DE CALIFICACIONES
    SELECT
        COUNT(*)
    INTO v_cantidad_puntuaciones
    FROM
        opinion o
    WHERE
        o.idpelicula = p_id_pelicula;
    
    --MOSTRAMOS DE RESPUESTA ESTO
    v_texto_respuesta := v_titulo_pelicula
                         || ' - Calificación: '
                         || v_calificacion
                         || ' ('
                         || v_puntuacion_promedio
                         || ') - Basada en '
                         || v_cantidad_puntuaciones
                         || ' puntuaciónes';

    --RETORNAMOS LA VARIABLE
    RETURN v_texto_respuesta;

--EXCEPTION     
EXCEPTION
    WHEN no_data_found THEN
        v_texto_respuesta := 'No existe la pelicula';
        RETURN v_texto_respuesta;
END;


--PARA PROBAR SI SIRVE LA FUNCTION
SELECT puntuacion_pelicula(2)
FROM DUAL 


--Ejercicio 2) Crear un procedure para el login de usuario.
--Se deben recibir 2 parámetros: p_apodo y p_password. Se debe chequear que el nombre de usuario existe y que la password sea válida.
--En caso de ser datos válidos, se deben devolver datos en 4 variables OUT: v_mensaje(con el mensaje "Login correcto"), v_id_usuario, v_apodo,v_email.
--En caso de ser datos inválidos, se deben devolver las 4 mismas variables OUT: v_mensaje (con el mensaje "Usuario no existente" o "Password incorrecta", según corresponda). El resto de las variables deben ser "null".

CREATE OR REPLACE PROCEDURE login_para_usuarios (
    p_apodo      IN VARCHAR2,
    p_password   IN VARCHAR2,
    v_mensaje    OUT VARCHAR2,
    v_id_usuario OUT NUMBER,
    v_apodo      OUT VARCHAR2,
    v_email      OUT VARCHAR2
) IS
    v_password_hash VARCHAR2(255);
    v_datos_validos NUMBER(10);
BEGIN
    --DE LA TABLA USUARIO SELECCIONAMOS IDUSURIO Y LE INTRODUCIMOS LOS DATOS A LA VARIABLE
    SELECT
        u.idusuario
    INTO v_id_usuario
    FROM
        usuario u
    WHERE
        u.apodo = p_apodo;

    --UTILIZAMOS LA FUNCION STANDARD_HASH CON CRIPTOGRAFIA MD5
    --PARA DESENCRIPTAR LA CONTRASEÑA
    SELECT
        standard_hash(p_password, 'MD5')
    INTO v_password_hash
    FROM
        dual;

    --CONTAMOS TODOS LOS REGISTROS DE LA TABLA USUARIOS DE LAS COLUMNAS IDUSUARIO Y PASSWORD
    --Y LO INTRODUCIMOS EN NUSTRA VARIABLE DE DATOS VALIDOS
    SELECT
        COUNT(*)
    INTO v_datos_validos
    FROM
        usuario u
    WHERE
            u.idusuario = v_id_usuario
        AND v_password_hash = u.password;
    
    --CONDICION PARA LOS USUARIOS INVALIDOS
    IF v_datos_validos > 0 THEN
        --SELECCIONAMOS TABLA USURIOS Y LE INTRODUCIMOS LOS DATOS EN NUESTRAS VARIABLES
        SELECT
            u.idusuario,
            u.apodo,
            u.email
        INTO
            v_id_usuario,
            v_apodo,
            v_email
        FROM
            usuario u
        WHERE
            u.idusuario = v_id_usuario;

        v_mensaje := 'Login correcto';
    
    --SI NO ES EL USURIO ES LA CONTRASEÑA INCORRECTA
    ELSE
        v_mensaje := 'Password incorrecta';
        v_id_usuario := NULL;
        v_apodo := NULL;
        v_email := NULL;
    END IF;

--POR SI NO EXISTE EL USUARIO
EXCEPTION
    WHEN no_data_found THEN
        v_mensaje := 'Usuario no existente';
        v_id_usuario := NULL;
        v_apodo := NULL;
        v_email := NULL;
END;


------------------------------------------------------------------------------
------------------------------------------------------------------------------
--PARA PROBAR SI EL PROCEDURE SIRVE
DECLARE
    v_apodo_p   VARCHAR2(20);
    v_password_p VARCHAR2(100);
    v_mensaje            VARCHAR2(255);
    v_id_usuario         NUMBER(10);
    v_apodo              VARCHAR2(20);
    v_email              VARCHAR2(320);
BEGIN
    v_apodo_p := 'Maria789';
    v_password_p := 'ghi789';
    login_para_usuarios(v_apodo_p, v_password_p, v_mensaje, v_id_usuario, v_apodo,
                 v_email);
    dbms_output.put_line('Mensaje: ' || v_mensaje);
    dbms_output.put_line('Id Usuario: ' || v_id_usuario);
    dbms_output.put_line('Apodo: ' || v_apodo);
    dbms_output.put_line('Email: ' || v_email);
END;
 

    
