create or replace TRIGGER art_audit AFTER
    DELETE OR INSERT OR UPDATE ON articulos_c

    FOR EACH ROW --CON ESTO MOSTRAMOS EL TRIGGER POR CADA FILA AFECTADA

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