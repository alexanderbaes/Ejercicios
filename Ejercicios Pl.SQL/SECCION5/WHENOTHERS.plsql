DECLARE
    v_busqueda employees.first_name%TYPE;
    v_telefono employees.phone_number%TYPE;
    v_cantidad NUMBER;
    v_resultado NUMBER;
    v_codigo_exception NUMBER;
    v_mensaje_exception VARCHAR(50);
BEGIN
    v_busqueda := 'Juan';
    v_resultado := 5/0; --ERROR ZERO_DIVIDE 
    SELECT
        e.phone_number
    INTO v_telefono
    FROM
        employees e
    WHERE
        e.first_name = v_busqueda;

    dbms_output.put_line('El telefono de: '
                         || v_busqueda
                         || ' es: '
                         || v_telefono);
EXCEPTION
    WHEN too_many_rows THEN
        SELECT
            COUNT(*)
        INTO v_cantidad
        FROM
            employees e
        WHERE
            e.first_name = v_busqueda;

        dbms_output.put_line('Hay '
                             || v_cantidad
                             || ' empleados con ese nombre');
    WHEN no_data_found THEN
        dbms_output.put_line('No hay ningun empleado con ese nombre');
  --WHEN zero_divide THEN
      --dbms_output.put_line('No se puede dividir por zero');
    WHEN OTHERS THEN
        v_codigo_exception := SQLCODE;
        v_mensaje_exception := SQLERRM;
        dbms_output.put_line('Hubo un error');
        dbms_output.put_line('Codigo: '||v_codigo_exception);
        dbms_output.put_line('Mensaje: '||v_mensaje_exception);
END;