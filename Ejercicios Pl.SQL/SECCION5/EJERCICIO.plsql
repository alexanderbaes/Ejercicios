--Utilizando el email, buscar e imprimir ID y apodo de un usuario. Lanzar una exception e imprimir un mensaje si no se encuentra ningún usuario con ese email.

DECLARE
--DECLARAMOS VARIABLE USER, APODO Y EMAIL  
    v_id_usuario NUMBER;
    v_apodo      VARCHAR2(100);
    v_email      VARCHAR2(100) := 'maria@mailejemplo.com';
BEGIN
    --SELECCIONAME EL IDUSUARIO Y EL APODO
    SELECT
        u.idusuario,
        u.apodo
    --VARIABLES A INTRODUCIR DATOS
    INTO
        v_id_usuario,
        v_apodo
    --DE LA TABLA USUARIO
    FROM
        usuario u 
    --EN LA COLUMNA EMAIL
    WHERE
        u.email = v_email;
    --MUESTRAME EL ID Y EL APODO
    dbms_output.put_line('Id: '
                         || v_id_usuario
                         || ' - Apodo: '
                         || v_apodo);
    

EXCEPTION
--LA EXCEPTION POR SI NO EXISTE UN USUARIO CON ESE EMAIL  
    WHEN no_data_found THEN
        dbms_output.put_line('No hay ningun usuario con el email ' || v_email);
END;

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--Continuando con el punto anterior, lanzar una exception e imprimir un mensaje si hay más de un usuario con el mismo email.

DECLARE
--DECLARAMOS VARIABLE USER, APODO Y EMAIL  
    v_id_usuario NUMBER;
    v_apodo      VARCHAR2(100);
    v_email      VARCHAR2(100) := 'familiaperez@mailejemplo.com';
BEGIN
    --SELECCIONAME EL IDUSUARIO Y EL APODO
    SELECT
        u.idusuario,
        u.apodo
    --VARIABLES A INTRODUCIR DATOS
    INTO
        v_id_usuario,
        v_apodo
    --DE LA TABLA USUARIO
    FROM
        usuario u 
    --EN LA COLUMNA EMAIL
    WHERE
        u.email = v_email;
    --MUESTRAME EL ID Y EL APODO
    dbms_output.put_line('Id: '
                         || v_id_usuario
                         || ' - Apodo: '
                         || v_apodo);
    

EXCEPTION
--LA EXCEPTION POR SI NO EXISTE UN USUARIO CON ESE EMAIL  
    WHEN no_data_found THEN
        dbms_output.put_line('No hay ningun usuario con el email: ' || v_email);
    WHEN too_many_rows THEN
        dbms_output.put_line('Hay mas de un usuario con ese mismo email: ' || v_email);
END;

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
--Continuando con el punto anterior, crear una exception personalizada e imprimir un mensaje en caso de que el mail ingresado no tenga un "@" en alguna parte del texto.

DECLARE
--DECLARAMOS VARIABLE USER, APODO Y EMAIL  
    v_id_usuario NUMBER;
    v_apodo      VARCHAR2(100);
    v_email      VARCHAR2(100) := 'josefinamailejemplo.com';
    v_noarroba EXCEPTION;
BEGIN
    --EXCEPTION PERSONALIZADA ANTES DE HACER LA CONSULTA
    IF v_email NOT LIKE '%@%' THEN
        RAISE v_noarroba;
    END IF;
    --SELECCIONAME EL IDUSUARIO Y EL APODO
    SELECT
        u.idusuario,
        u.apodo
    --VARIABLES A INTRODUCIR DATOS
    INTO
        v_id_usuario,
        v_apodo
    --DE LA TABLA USUARIO
    FROM
        usuario u 
    --EN LA COLUMNA EMAIL
    WHERE
        u.email = v_email;
    --MUESTRAME EL ID Y EL APODO SOLO SI CUMPLE LA EXCEPTION PERSONALIZADA
    dbms_output.put_line('Id: '
                         || v_id_usuario
                         || ' - Apodo: '
                         || v_apodo);
EXCEPTION
--LA EXCEPTION POR SI NO EXISTE UN USUARIO CON ESE EMAIL  
    WHEN no_data_found THEN
        dbms_output.put_line('No hay ningun usuario con el email: ' || v_email);
--LA EXCEPTION POR SI HAY MAS DE UN USUARIO CON EL MISMO EMAIL
    WHEN too_many_rows THEN
        dbms_output.put_line('Hay mas de un usuario con ese mismo email: ' || v_email);
--EXCEPTION PERSONALIZADA POR SI NO TIENE EL ARROBA
    WHEN v_noarroba THEN
        dbms_output.put_line('El email no tiene bien el formato: ');
END;