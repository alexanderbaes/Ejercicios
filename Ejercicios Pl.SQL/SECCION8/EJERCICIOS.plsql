
--Crear un trigger que se dispare ante un INSERT en la tabla de usuarios. Se debe validar que el apodo no esté siendo utilizado por un usuario existente. En caso afirmativo, interrumpir la ejecución de ese INSERT.
CREATE OR REPLACE TRIGGER validacion_de_apodo BEFORE
    INSERT ON usuario
    FOR EACH ROW
DECLARE
    v_apodo_nuevo VARCHAR2(20);
    v_existe      NUMBER;
BEGIN
    v_apodo_nuevo_usuario := :new.apodo;
    SELECT
        COUNT(*)
    INTO v_existe
    FROM
        usuario u
    WHERE
        u.apodo = v_apodo_nuevo;
    
    --condicion con RAISE_APPLICATION_ERROR PARA MOSTRAR QUE SE ENCUENTRA OCUPADO
    IF v_existe > 0 THEN
        raise_application_error(-20000, 'El apodo se encuentra ocupado');
    END IF;
END;

--VERIFICAMOS QUE SIRVE NUESTRO INSERT CON
-- Insert rows in a Table
INSERT INTO usuario (idusuario,apodo,email,password)
VALUES (8,'Maria78',null,null);




-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------


--Crear un trigger que vaya guardando un histórico de las opiniones editadas y borradas.
--Para ello, deberá crear un registro nuevo en la tabla de "opinion_historico".
--En el campo "opinión" se debe guardar el texto de la opinión ANTES de ser borrada/editada
--En el campo "acción" se debe indicar cuál fue la acción realizada sobre la opinión ("Editado" o "Borrado")
--En el campo "usuariomodificacion" se debe guardar el nombre del usuario que realizo el update/delete.
--Se puede obtener mediante la variable especial "USER" En el campo "fechamodificacion"
--se debe guardar la fecha en la que se realizó la acción.

CREATE OR REPLACE TRIGGER guardar_historico_opinion AFTER
    DELETE OR UPDATE ON opinion
    FOR EACH ROW
DECLARE
    v_opinion              VARCHAR2(140);
    v_usuario_modificacion VARCHAR2(20);
    v_fecha_modificacion   DATE;
    v_accion               VARCHAR2(10);
    v_id_opinion_historico NUMBER;
BEGIN
    v_opinion := :old.opinion;
    v_usuario_modificacion := user;
    v_fecha_modificacion := sysdate;
    IF deleting THEN
        v_accion := 'Borrado';
    ELSIF updating THEN
        v_accion := 'Editado';
    END IF;

    SELECT
        nvl(MAX(idopinionhistorico), 0) + 1
    INTO v_id_opinion_historico
    FROM
        opinion_historico;

    INSERT INTO opinion_historico (
        idopinionhistorico,
        opinion,
        accion,
        usuariomodificacion,
        fechamodificacion
    ) VALUES (
        v_id_opinion_historico,
        v_opinion,
        v_accion,
        v_usuario_modificacion,
        v_fecha_modificacion
    );

END;


