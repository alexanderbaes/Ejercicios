create or replace TRIGGER art_audit AFTER
    DELETE OR INSERT OR UPDATE ON articulos_c
DECLARE
    v_mensaje VARCHAR2(255);

    
BEGIN
    --SE UTILIZA LOS TING CUANDO HAY UNA ACCION SOBRE NUESTRIS DE,IN,UP
    IF inserting THEN
        v_mensaje := 'Se ha realizado un INSERT en la tabla articulos_c';
    ELSIF deleting THEN
        v_mensaje := 'Se ha realizado un DELETE en la tabla articulos_c';
    --LE PODEMOS AGREGAR UN PARAMETRO
    ELSIF updating('precio') THEN
        v_mensaje := 'Se ha realizado un UPDATE sobre el precio en la tabla articulos_c';
    ELSIF updating THEN
        v_mensaje := 'Se ha realizado un UPDATE en la tabla articulos_c';
    END IF;    
    
    
    --LOS DATOS QUE INSERTAMOS EN NUESTRA TABLA LOG_AUDITORIA
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

--VERIFICAMOS QUE SIRVA EL TRIGGER

--EL INSERTING('PRECIO') SOLO SE ACTIVA CUANDO AFECTAN A PRECIO
Update articulos_c
  SET precio = precio * 1.10


--PARA MIRAR NUESTRA TABLA LOG_AUDITORIA
SELECT * FROM LOG_AUDITORIA 

--INSERT QUE INGRESAMOS EN LA TABLA ARTICULOS_C
INSERT INTO articulos_c(idarticulo,nombre,precio,descripcion)
VALUES (11,'Art de prueba',15,'este es un articulo de prueba');

--DELETE QUE HACEMOS EN LA TABLA ARTICULOS_C
DELETE FROM  articulos_c
WHERE idarticulo IN (11);

--NUESTRO UPDATING TAMBIEN SIRVE POR SI SE HACE X UPDATE
Update articulos_c
  SET descripcion = descripcion || ' - mod'