CREATE OR REPLACE TRIGGER art_audit AFTER
    UPDATE ON articulos_c
DECLARE
    v_mensaje VARCHAR2(50);
BEGIN
    v_mensaje := 'Se ha realizado un update en la tabla articulos_c';
    INSERT INTO log_auditoria (
        usuario,
        mensaje,
        fecha
    ) VALUES (
        user,
        v_mensaje,
        sysdate
    );

END;

--VERIFICAMOS QUE FUNCIONE NUESTRO TRIGGER

-- Update rows in a Table
Update articulos_c
  SET precio = precio * 1.10

--Verificamos que se haya realizado el UPDATE

SELECT * FROM LOG_AUDITORIA

-- Insert rows in a Table

INSERT INTO articulos_c 
(
  idarticulo,
  nombre,
  precio,
  descripcion
)
VALUES
(
  12,
  'Art de prueba',
  15,
  'este es un articulo de prueba'
);


-- Delete rows from a Table

DELETE FROM  articulos_c
WHERE idarticulo IN (11,12);