CREATE OR REPLACE PROCEDURE imprimir_pedido (
    p_idpedido       IN NUMBER,
    p_resumen_pedido OUT CLOB
) IS

    v_res_pedido        CLOB;
    br                  VARCHAR2(1) := chr(10);
    sep                 VARCHAR2(35) := br
                        || '---------------------------------'
                        || br;
    v_datos_cliente     VARCHAR2(140);
    v_direccion_cliente VARCHAR2(140);
    v_precio_final      NUMBER;
    CURSOR pedidos_articulo (
        id_pedido NUMBER
    ) IS
    SELECT
        p.cantidad,
        a.nombre,
        a.precio
    FROM
             pedidos_articulos p
        INNER JOIN articulos a ON p.idarticulo = a.idarticulo
    WHERE
        p.idpedido = id_pedido;

BEGIN
    v_res_pedido := sep;
    v_res_pedido := v_res_pedido
                    || ' PEDIDO N°: '
                    || p_idpedido;
    v_res_pedido := v_res_pedido || sep;
    SELECT
        c.apellido
        || ', '
        || c.nombre
        || '. DOC: '
        || c.documento,
        d.calle
        || ' '
        || d.numero
        || ' - PISO: '
        || d.piso
        || ' '
        || d.departamento
    INTO
        v_datos_cliente,
        v_direccion_cliente
    FROM
             pedidos p
        INNER JOIN clientes    c ON p.idcliente = c.idcliente
        INNER JOIN direcciones d ON d.idcliente = p.iddireccion
    WHERE
        p.idpedido = p_idpedido;

    v_res_pedido := v_res_pedido
                    || ' CLIENTE: '
                    || v_datos_cliente
                    || br
                    || ' DIRECCION: '
                    || v_direccion_cliente
                    || sep;

    v_res_pedido := v_res_pedido
                    || sep
                    || ' A R T I C U L O S '
                    || sep;
    FOR art IN pedidos_articulo(p_idpedido) LOOP
        v_res_pedido := v_res_pedido
                        || art.nombre
                        || '(x'
                        || art.cantidad
                        || ')........$'
                        || art.precio
                        || br;
    END LOOP;

    v_precio_final := calcular_valor_pedido(p_idpedido);
    v_res_pedido := v_res_pedido
                    || sep
                    || 'TOTAL: $'
                    || v_precio_final
                    || sep;
    p_resumen_pedido := v_res_pedido;
END;


--PROBANDO EL PROCEDURE

DECLARE
    v_resumen   CLOB;
    v_id_pedido NUMBER;
BEGIN
    v_id_pedido := 1;
    imprimir_pedido(v_id_pedido, v_resumen);
    dbms_output.put_line(v_resumen);
END;
