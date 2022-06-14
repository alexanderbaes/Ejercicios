DECLARE
    CURSOR empleados (
        p_desde DATE,
        p_hasta DATE
    ) IS
    SELECT
        e.first_name,
        e.last_name,
        e.hire_date
    FROM
        employees e
    WHERE
        e.hire_date BETWEEN p_desde AND p_hasta;

    v_hasta DATE;
    v_desde DATE;
BEGIN
    v_desde := DATE '2002-01-01';
    v_hasta := DATE '2002-12-31';
    FOR reg IN empleados(v_desde, v_hasta) LOOP
        dbms_output.put_line('Nombre: '
                             || reg.first_name
                             || ' Apellido: '
                             || reg.last_name
                             || ' Contrato: '
                             || reg.hire_date);
    END LOOP;

END;