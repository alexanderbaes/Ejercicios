CREATE OR REPLACE PROCEDURE ordenar_a_frabrica IS

CURSOR articulos IS

SELECT a.idarticulo, a.stock,a.idsucursal
FROM articulos_sucural a;

v_mejor_precio NUMBER;
v_idfabricante NUMBER;
v_siguiente_id NUMBER;


BEGIN
    FOR art in articulos LOOP
        IF art.stock = 0 THEN
            SELECT MIN(precio)
            INTO v_mejor_precio
            FROM articulos_fabricantes af
            WHERE af.idarticulo = art.idarticulo
            GROUP BY idarticulo;

            SELECT idfabricante
            INTO v_idfabricante
            FROM articulos_fabricantes af
            WHERE af.idarticulo = art.idarticulo AND
            af.precio = v_mejor_precio;

            SELECT MAX(idpedidofabrica)+1
            INTO v_siguiente_id
            FROM pedido_fabrica;

            INSERT INTO pedido_fabrica(idpedidofabrica,idsucursal,idarticulo,idfabricante,fechapedido,cantidad)
            VALUES(v_siguiente_id,art.idsucursal,art.idarticulo,v_idfabricante,sysdate,10);
        END IF;
    END LOOP;
END;


--VERIFICAMOS QUE LA FUNCION SIRVA
--PARA LLAMAR EL PROCEDIMIENTO SE TIENE QUE COLOCAR DENTRO DE UN BLOQUE ANONIMO O OTRO
BEGIN
    ordenar_a_frabrica();
END;

--VERIFICAMOS QUE LA CONSULTA SE REALIZO CORRECTAMENTE
SELECT * FROM pedido_fabrica