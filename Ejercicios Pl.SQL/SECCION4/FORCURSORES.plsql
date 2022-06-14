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

BEGIN
    FOR reg IN empleados LOOP
    DBMS_OUTPUT.PUT_LINE('Nombre: ' ||reg.first_name ||' Apellido: ' ||reg.last_name ||' Contrato: ' ||reg.hire_date );
    END LOOP;

END;