DECLARE
    CURSOR empleados IS
    SELECT
        e.first_name,
        e.last_name,
        e.hire_date
    FROM
        employees e
    WHERE
        e.hire_date BETWEEN DATE '2002-01-01' AND DATE '2002-12-31';

    v_nombre       VARCHAR(25);
    v_apellido     VARCHAR(25);
    v_contratacion DATE;
BEGIN
    OPEN empleados;
    LOOP
        FETCH empleados INTO
            v_nombre,
            v_apellido,
            v_contratacion;
        EXIT WHEN empleados%notfound;
        dbms_output.put_line('Nombre: '
                             || v_nombre
                             || ' Apellido: '
                             || v_apellido
                             || ' Contrato: '
                             || v_contratacion);

    END LOOP;

    CLOSE empleados;
    
END;



