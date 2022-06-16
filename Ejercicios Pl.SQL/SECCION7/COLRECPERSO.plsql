DECLARE
TYPE datos_empleado IS RECORD (
    apellido VARCHAR(50),
    nombre   VARCHAR(50),
    pais     VARCHAR(50)
);

TYPE e_list IS TABLE OF datos_empleado;

v_empleado datos_empleado;
lista e_list := e_list();

BEGIN

    FOR i IN 1..4 LOOP
    -- Select rows from a Table
    SELECT
        e.last_name,
        e.first_name,
        c.country_name
    INTO v_empleado
    FROM
             employees e
        INNER JOIN departments d ON e.department_id = d.department_id
        INNER JOIN locations   l ON d.location_id = l.location_id
        INNER JOIN countries   c ON l.country_id = c.country_id
    WHERE
        employee_id = (i+100);
    
    lista.extend;
    lista(i) := v_empleado;

    END LOOP;

    dbms_output.put_line(lista(1).apellido ||' '|| lista(1).nombre ||' '|| lista(1).pais);
    dbms_output.put_line(lista(2).apellido ||' '|| lista(2).nombre ||' '|| lista(2).pais);
    dbms_output.put_line(lista(3).apellido ||' '|| lista(3).nombre ||' '|| lista(3).pais);
    dbms_output.put_line(lista(4).apellido ||' '|| lista(4).nombre ||' '|| lista(4).pais);

    --SI QUEREMOS AGREGARLO MANUALMENTE SERIA ASI
    
    lista.extend;
    lista(5) := datos_empleado('Barraza', 'Alexander','Colombia');
    dbms_output.put_line(lista(5).apellido ||' '|| lista(5).nombre ||' '|| lista(5).pais);

END;