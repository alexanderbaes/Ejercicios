DECLARE

v_texto VARCHAR(25);

BEGIN

v_texto := 'El valor del numero es: ';
FOR numero IN 1..7 LOOP
   DBMS_OUTPUT.PUT_LINE(v_texto || numero);

END LOOP;

END;