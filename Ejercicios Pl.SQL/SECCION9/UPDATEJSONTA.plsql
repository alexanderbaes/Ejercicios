DECLARE
    v_articulo_esp             articulos.especificaciones%TYPE;
    j_articulo_esp             json_object_t;
    v_articulo_esp_actualizado articulos.especificaciones%TYPE;
BEGIN
    SELECT
        a.especificaciones
    INTO v_articulo_esp
    FROM
        articulos a
    WHERE
        a.idarticulo = 5;

    j_articulo_esp := json_object_t(v_articulo_esp);
    j_articulo_esp.put('redes', '3G, 4G y 5G');
    j_articulo_esp.put('test', 'este es un testeo');
    v_articulo_esp_actualizado := j_articulo_esp.stringify;
    UPDATE articulos
    SET
        especificaciones = v_articulo_esp_actualizado
    WHERE
        idarticulo = 5;

END;


--VERIFICAMOS QUE SIRVA
SELECT a.especificaciones.redes
FROM articulos a
WHERE a.idarticulo = 5;