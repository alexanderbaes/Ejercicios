CREATE OR REPLACE TRIGGER art_aud_precio
AFTER UPDATE ON articulos_c
FOR EACH ROW

DECLARE

v_idarticuloaud NUMBER;


BEGIN
    IF updating ('precio') THEN

        SELECT nvl(MAX(idarticuloaud)+1,1)
        INTO v_idarticuloaud
        FROM articulos_auditoria;

        -- Insert rows in a Table
        
        INSERT INTO articulos_auditoria 
        (
          idarticuloaud,
          idarticulo,
          precioanterior,
          precionuevo,
          fecha,
          usuario
        )
        VALUES
        (
          v_idarticuloaud,
          :old.idarticulo,
          :old.precio,
          :new.precio,
          sysdate,
          user
        );

    END IF;

END;


--PROBAMOS NUESTRO TRIGGER

SELECT * FROM articulos_c

--VERIFICAMOS LOS ARTICULOS AUDITORIA
SELECT * FROM articulos_auditoria

--PROBAMOS CON UN UPDATE
-- Update rows in a Table
Update articulos_c
  SET precio = precio/2
