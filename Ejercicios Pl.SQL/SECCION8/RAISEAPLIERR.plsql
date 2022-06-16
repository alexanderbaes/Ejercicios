CREATE OR REPLACE TRIGGER clientes_credito BEFORE
    INSERT ON clientes
    FOR EACH ROW
DECLARE
    v_nuevo_limite NUMBER;
BEGIN

    v_nuevo_limite := :new.limitecredito;
    IF v_nuevo_limite >= 15000 THEN
        raise_application_error(-20000, 'El limite es mayor a 15000');
    END IF;

END;



--VERIFICAMOS QUE SIRVA NUESTRO TRIGGER DE ERROR_LIMITE DE CREDITO

--AQUI SIRVE
INSERT INTO clientes(idcliente,nombre,apellido,limitecredito,documento)
VALUES (6,'Federico','Jimenez',12000,'999888523')

--AQUI MANDA NUESTRO ERROR
INSERT INTO clientes(idcliente,nombre,apellido,limitecredito,documento)
VALUES (6,'Federico','Jimenez',18000,'999888523')