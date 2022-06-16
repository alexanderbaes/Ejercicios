CREATE OR REPLACE TRIGGER pedidos_fecha BEFORE
    INSERT ON pedidos
    FOR EACH ROW
DECLARE
    v_fecha DATE;
BEGIN
    v_fecha := sysdate;
    :new.fechaalta := v_fecha;
END;


--PROBAMOS EL TRIGER CON BEFORE UTILIZANDO UN UPDATE
--ANTES DE PROBAR HAY QUE ELIMINAR LA FILA QUE ESTE EN LA TABLA
INSERT INTO pedidos(idpedido,idcliente,iddireccion,idcanalventa,idsucursal,fechaentregado)
VALUES (4,1,1,2,4,NULL)