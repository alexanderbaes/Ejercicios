CREATE OR REPLACE FUNCTION calcular_valor_pedido(p_idpedido NUMBER)
RETURN NUMBER IS

CURSOR articulos(v_idpedido NUMBER) IS
SELECT pa.cantidad, a.precio
FROM pedidos_articulos pa
INNER JOIN articulos a ON a.idarticulo = pa.idarticulo
WHERE pa.idpedido = v_idpedido;

v_total NUMBER := 0;
v_porcentaje_costo_entrega NUMBER;
v_costo_entrega NUMBER;

BEGIN
    SELECT c.costoentrega
    INTO v_porcentaje_costo_entrega
    FROM canales_venta c
    INNER JOIN pedidos p ON c.idcanalventa = p.idcanalventa
    WHERE p.idpedido = p_idpedido;

    FOR art IN articulos(p_idpedido) LOOP
        v_total := v_total+(art.precio * art.cantidad);
    END LOOP;

    v_costo_entrega := (v_porcentaje_costo_entrega * v_total) / 100;
    
    v_total := v_total + v_costo_entrega;

    RETURN v_total;

EXCEPTION
WHEN OTHERS THEN
    dbms_output.put_line('Hubo un error');

END;



--MIRAMOS SI SIRVE LA FUNCION
SELECT calcular_valor_pedido(2)
FROM DUAL

--VERIFICAMOS QUE LOS DATOS SEAN CORRECTOS Y COLOCAMOS EL COSTO
SELECT P.*, calcular_valor_pedido(p.idpedido)
FROM PEDIDOS p
