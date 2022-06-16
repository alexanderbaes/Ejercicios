CREATE OR REPLACE PROCEDURE agregar_articulo_json (
    p_json_articulo VARCHAR2
) IS

    j_articulo    json_object_t;
    v_nombre      articulos.nombre%TYPE;
    v_descripcion articulos.descripcion%TYPE;
    v_precio      articulos.precio%TYPE;
    v_id_articulo articulos.idarticulo%TYPE;
BEGIN

    j_articulo := json_object_t(p_json_articulo);
    v_nombre := j_articulo.get_string('nombre');
    v_descripcion := j_articulo.get_string('descripcion');
    v_precio := j_articulo.get_number('precio');

    -- Select rows from a Table
    SELECT MAX(idarticulo)+1
    INTO v_id_articulo
    FROM articulos;
    

    -- Insert rows in a Table
INSERT INTO articulos (
    idarticulo,
    nombre,
    descripcion,
    precio
) VALUES (
    v_id_articulo,
    v_nombre,
    v_descripcion,
    v_precio
);

EXCEPTION WHEN OTHERS THEN
     dbms_output.put_line(sqlcode||' - '||sqlerrm);

END;



--EL JSON QUE AGREGAMOS FUE

BEGIN
    agregar_articulo_json('{
                            "nombre": "Aspiradora",
                            "descripcion": "La aspiradora con mas potencia del mercado.",
                            "precio": 250
                            }');
END;


