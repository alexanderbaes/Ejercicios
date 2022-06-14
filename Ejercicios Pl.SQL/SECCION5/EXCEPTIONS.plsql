DECLARE
    v_busqueda employees.first_name%TYPE;
    v_telefono employees.phone_number%TYPE;
    v_cantidad NUMBER;
BEGIN
    v_busqueda := 'Juan';
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
END;