UPDATE articulos
SET
    especificaciones = '{
  "sistema_operativo": "Android Candy",
  "pantalla": "6.2 pulgadas",
  "redes": "3G y 4G",
  "procesador": "Snapdragon 999",
  "almacenamiento": "64 GB",
  "megapixeles_camara_trasera": 5,
  "meses_garantia": 12,
  "apps_preinstaladas": [
    "Facebook",
    "Twitter",
    "Instagram"
  ]
}'
WHERE
    idarticulo = 5


--MANIPULAMOS EL ARRAY
DECLARE
    v_articulo_esp             articulos.especificaciones%TYPE;
    j_articulo_esp             json_object_t;
    v_articulo_esp_actualizado articulos.especificaciones%TYPE;
    j_apps_array               json_array_t;
BEGIN
    SELECT
        a.especificaciones
    INTO v_articulo_esp
    FROM
        articulos a
    WHERE
        a.idarticulo = 5;

    j_articulo_esp := json_object_t(v_articulo_esp);
    j_apps_array := json_array_t(j_articulo_esp.get('apps_preinstaladas'));
    dbms_output.put_line('Tamaño: ' || j_apps_array.get_size);
    FOR indice IN 0..j_apps_array.get_size - 1 LOOP
        dbms_output.put_line(j_apps_array.get_string(indice));
    END LOOP;

    dbms_output.put_line('Agregamos Snapchat');
    j_apps_array.append('Snapchat');
    dbms_output.put_line(j_apps_array.stringify);
    dbms_output.put_line('Agregamos Telegram');
    j_apps_array.put(1, 'Telegram');
    dbms_output.put_line(j_apps_array.stringify);
    dbms_output.put_line('Removimos Telegram');
    j_apps_array.remove(1);
    dbms_output.put_line(j_apps_array.stringify);
    v_articulo_esp_actualizado := j_articulo_esp.stringify;
    UPDATE articulos
    SET
        especificaciones = v_articulo_esp_actualizado
    WHERE
        idarticulo = 5;

END;