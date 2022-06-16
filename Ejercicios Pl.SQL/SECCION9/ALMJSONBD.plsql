--DESPUES DE EDITAR ARTICULOS Y AGREGAR ESPECIFICACIONES HACEMOS ESTO
ALTER TABLE ARTICULOS
ADD CONSTRAINT IS_JSON CHECK (especificaciones IS JSON);

--MIRAMOS LOS ID DE LA TABLA PARA SABER A CUAL AGREGAR ESPECIFICACIONES
SELECT
    a.*
FROM
    articulos a;


--PARA AGREGAR LOS DATOS A LOS CAMPOS NULL
UPDATE articulos
SET
    especificaciones = '{
  "procesador": "Intel Core Basic Edition",
  "placa_madre": "Gigabyte B1",
  "almacenamiento": "500 GB",
  "memoria_ram": "4 GB",
  "placa_grafica": "Integrada",
  "meses_garantia": 18
}
-'
WHERE
    idarticulo = 10;



-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--PARTE 3 DEL VIDEO ALMACENANDO JSON EN LA BASE DE DATOS

CREATE OR REPLACE PROCEDURE extra_info_laptop (
    p_id_articulo    IN NUMBER,
    p_procesador     OUT VARCHAR2,
    p_placa_madre    OUT VARCHAR2,
    p_almacenamiento OUT VARCHAR2,
    p_memoria_ram    OUT VARCHAR2,
    p_placa_grafica  OUT VARCHAR2,
    p_meses_garantia OUT NUMBER
) IS

    v_articulo_especificaciones articulos.especificaciones%TYPE;
    j_articulo_especificaciones json_object_t;
BEGIN
    SELECT
        a.especificaciones
    INTO v_articulo_especificaciones
    FROM
        articulos a
    WHERE
        a.idarticulo = p_id_articulo;

    j_articulo_especificaciones := json_object_t(v_articulo_especificaciones);
    p_procesador := j_articulo_especificaciones.get_string('procesador');
    p_placa_madre := j_articulo_especificaciones.get_string('placa_madre');
    p_almacenamiento := j_articulo_especificaciones.get_string('almacenamiento');
    p_memoria_ram := j_articulo_especificaciones.get_string('memoria_ram');
    p_placa_grafica := j_articulo_especificaciones.get_string('placa_grafica');
    p_meses_garantia := j_articulo_especificaciones.get_number('meses_garantia');
END;



--EJECUTAMOS EL PROCEDIMIENTO EN UN BLOQUE ANONIMO


DECLARE
    v_id_articulo    NUMBER(5);
    v_procesador     VARCHAR2(255);
    v_placa_madre    VARCHAR2(255);
    v_almacenamiento VARCHAR2(255);
    v_memoria_ram    VARCHAR2(255);
    v_placa_grafica  VARCHAR2(255);
    v_meses_garantia NUMBER(5);
BEGIN
    v_id_articulo := 3;
    extra_info_laptop(v_id_articulo, v_procesador, v_placa_madre, v_almacenamiento, v_memoria_ram,
                     v_placa_grafica, v_meses_garantia);
    dbms_output.put_line('Procesador: ' || v_procesador);
    dbms_output.put_line('Placa madre: ' || v_placa_madre);
    dbms_output.put_line('Almacenamiento: ' || v_almacenamiento);
    dbms_output.put_line('Memoria RAM: ' || v_memoria_ram);
    dbms_output.put_line('Placa Grafica: ' || v_placa_grafica);
    dbms_output.put_line('Meses garantia: ' || v_meses_garantia);
END;