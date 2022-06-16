DECLARE
    TYPE datos_empleado IS RECORD (
        apellido VARCHAR(50),
        nombre   VARCHAR(50),
        pais     VARCHAR(50)
    );
    empleado datos_empleado;
BEGIN
-- Select rows from a Table
    SELECT
        e.last_name,
        e.first_name,
        c.country_name
    INTO empleado
    FROM
             employees e
        INNER JOIN departments d ON e.department_id = d.department_id
        INNER JOIN locations   l ON d.location_id = l.location_id
        INNER JOIN countries   c ON l.country_id = c.country_id
    WHERE
        employee_id = 100;

    dbms_output.put_line(empleado.apellido);
    dbms_output.put_line(empleado.nombre);
    dbms_output.put_line(empleado.pais);
END;