DECLARE

v_contador NUMBER :=0;

BEGIN

LOOP
    v_contador := v_contador+1;
    DBMS_OUTPUT.PUT_LINE('El  numero es: ' || v_contador);

    EXIT WHEN v_contador = 7;


END LOOP;
    

END;