DECLARE
    TYPE l_empleados IS
        TABLE OF VARCHAR2(50);
    v_empleados l_empleados := l_empleados('Juan', 'Pedro', 'Carlos');
    v_size      NUMBER;
BEGIN
    v_empleados.extend;
    v_empleados(4) := 'Marcelo';
    v_empleados.extend;
    v_empleados(5) := 'Fernando';
    v_size := v_empleados.count();
    dbms_output.put_line('Tamaño de la coleccion: ' || v_size);
    FOR i IN 1..5 LOOP
        dbms_output.put_line(v_empleados(i));
    END LOOP;

END;

---------------------------------------------------------
---------------------------------------------------------
--OTRAS PROPIEDADES QUE SE LE PUEDEN PEDIR A LA COLECCION
---------------------------------------------------------
---------------------------------------------------------

DECLARE
    TYPE l_empleados IS
        TABLE OF VARCHAR2(50);
    v_empleados l_empleados := l_empleados('Juan', 'Pedro', 'Carlos');
    v_size      NUMBER;
    v_primer_elemento NUMBER;
    v_ultimo_elemento NUMBER;
BEGIN
    v_empleados.extend;
    v_empleados(4) := 'Marcelo';
    v_empleados.extend;
    v_empleados(5) := 'Fernando';
    v_size := v_empleados.count();--funcion count() lo metemos en una variable y mostramos el tamaño
    dbms_output.put_line('Tamaño de la coleccion: ' || v_size);

    v_primer_elemento := v_empleados.first(); --funcion first() para mostrar el primer elemento
    v_ultimo_elemento := v_empleados.last();  --funcion last() para mostrar el ultimo elemento
    dbms_output.put_line('Primer elemento: ' || v_empleados(v_primer_elemento));
    dbms_output.put_line('Ultimo elemento: ' || v_empleados(v_ultimo_elemento));

    FOR i IN v_primer_elemento..v_ultimo_elemento LOOP
        IF v_empleados(i).exists THEN --si el elemento no existe no hacemos nada
        dbms_output.put_line(v_empleados(i));
        END IF;
    END LOOP;

END;


------------------------------------------------------------------------------
------------------------------------------------------------------------------
--PARTE DOS DE COLECCIONES
DECLARE
    TYPE l_empleados IS
        TABLE OF VARCHAR2(50);
    v_empleados       l_empleados := l_empleados();
    v_size            NUMBER;
    v_primer_elemento NUMBER;
    v_ultimo_elemento NUMBER;
BEGIN
    FOR i IN 1..10 LOOP
        v_empleados.extend;

        -- Select rows from a Table
        SELECT
            e.first_name
        INTO
            v_empleados
        (i)
        FROM
            employees e
        WHERE
            e.employee_id = ( 100 + i );

    END LOOP;

    FOR i IN v_empleados.first()..v_empleados.last() LOOP
        dbms_output.put_line(v_empleados(i));
    END LOOP;

END;