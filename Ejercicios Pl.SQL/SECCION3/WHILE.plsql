DECLARE

v_contador NUMBER := 0;

BEGIN

WHILE v_contador < 7 LOOP
    
    v_contador := v_contador+1;
    DBMS_OUTPUT.PUT_LINE('El numero es: ' || v_contador);

END LOOP;

END;