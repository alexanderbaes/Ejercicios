CREATE OR REPLACE FUNCTION pedidos_pendientes RETURN VARCHAR2
IS

v_cantidad NUMBER;

BEGIN

SELECT COUNT(*)
INTO v_cantidad
FROM pedidos
WHERE fechaentregado IS NULL;

RETURN v_cantidad;

END;


--PARA LLAMARLA HACEMOS ESTO:
SELECT pedidos_pendientes()
FROM DUAL

--PARA VERIFICAR QUE SI FUNCIONA VERIFICAMOS EN LA TABLE
SELECT * FROM pedidos WHERE fechaentregado IS NULL
