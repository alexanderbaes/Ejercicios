CREATE OR REPLACE PROCEDURE agregar_articulo (
    p_idarticulo IN NUMBER,
    p_idpedido   IN NUMBER,
    p_cantidad   IN NUMBER,
    p_mensaje    OUT VARCHAR2
) IS
    v_idsucursal         NUMBER;
    v_stock              NUMBER;
    v_idpedidosarticulos NUMBER;
BEGIN
    SELECT
        p.idsucursal
    INTO v_idsucursal
    FROM
        pedidos p
    WHERE
        p.idpedido = p_idpedido;

    SELECT
        a.stock
    INTO v_stock
    FROM
        articulos_sucursales a
    WHERE
            a.idarticulo = p_idarticulo
        AND a.idsucursal = v_idsucursal;

    IF v_stock >= p_cantidad THEN
        --autoincrementado
        SELECT
            MAX(idpedidosarticulos)
        INTO v_idpedidosarticulos
        FROM
            pedidos_articulos;
        -- Insert rows in a Table

        INSERT INTO pedidos_articulos (
            idpedido,
            idarticulo,
            cantidad,
            idpedidosarticulos
        ) VALUES (
            p_idpedido,
            p_idarticulo,
            p_cantidad,
            v_idpedidosarticulos
        );

        p_mensaje := 'Articulo agregado al pedido';
    ELSE
        p_mensaje := 'No hay stock suficientes';
    END IF;

END;

--PROBAMOS EL PROCEDURE CON PARAMETROS

DECLARE

v_mensaje VARCHAR2(50);

BEGIN

    agregar_articulo(8,3,2,v_mensaje);
    dbms_output.put_line(v_mensaje);

END;


--VERIFICAMOS QUE SE HAYAN ECHO LOS CAMBIOS
SELECT * FROM pedidos_articulos


