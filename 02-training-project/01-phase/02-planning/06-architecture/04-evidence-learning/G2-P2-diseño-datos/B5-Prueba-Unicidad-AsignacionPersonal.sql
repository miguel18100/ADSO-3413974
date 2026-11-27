-- B5 - Prueba automática de unicidad de la pareja Asignacion/Personal
-- Motor: MariaDB / MySQL. Ejecutar SOLO después de importar B5-Prueba.sql
-- La base afectada es sigmavital_prueba. Los datos de prueba se revierten.
-- Este archivo es un guion; no es evidencia de ejecución hasta guardar el log real.

USE sigmavital_prueba;

DROP PROCEDURE IF EXISTS sp_prueba_unicidad_asignacion_personal;
DELIMITER //
CREATE PROCEDURE sp_prueba_unicidad_asignacion_personal()
BEGIN
    DECLARE v_rol INT;
    DECLARE v_usuario INT;
    DECLARE v_solicitud INT;
    DECLARE v_paciente INT;
    DECLARE v_servicio INT;
    DECLARE v_ambulancia INT;
    DECLARE v_asignacion INT;
    DECLARE v_personal INT;
    DECLARE v_rechazo_duplicado TINYINT DEFAULT 0;
    DECLARE v_parejas INT DEFAULT 0;



    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    INSERT INTO Rol (nombre, descripcion)
    VALUES ('QA-UNICIDAD-ROL', 'Registro temporal para prueba de integridad');
    SET v_rol = LAST_INSERT_ID();

    INSERT INTO Usuario (id_rol, nombre, correo, estado)
    VALUES (v_rol, 'QA Unicidad', 'qa-unicidad@example.invalid', 'Activo');
    SET v_usuario = LAST_INSERT_ID();

    INSERT INTO Solicitud (id_usuario, ubicacion_incidente, prioridad, descripcion, estado)
    VALUES (v_usuario, 'Ubicacion de prueba', 'Baja', 'Fixture temporal para prueba UNIQUE', 'Pendiente');
    SET v_solicitud = LAST_INSERT_ID();

    INSERT INTO Paciente (identificacion_referencia, nombre_referencia, informacion_basica)
    VALUES ('QA-TEST', 'Paciente temporal', 'Dato ficticio');
    SET v_paciente = LAST_INSERT_ID();

    INSERT INTO Servicio (id_solicitud, id_paciente, fecha_inicio, estado)
    VALUES (v_solicitud, v_paciente, NOW(), 'Pendiente');
    SET v_servicio = LAST_INSERT_ID();

    INSERT INTO Ambulancia (placa, tipo, estado_operativo, ubicacion_referencia)
    VALUES ('QA-UNIQ-01', 'TAB', 'Disponible', 'Base de prueba');
    SET v_ambulancia = LAST_INSERT_ID();

    INSERT INTO Asignacion (id_servicio, id_ambulancia, fecha_asignacion, estado, observaciones)
    VALUES (v_servicio, v_ambulancia, NOW(), 'Asignado', 'Fixture temporal para UNIQUE');
    SET v_asignacion = LAST_INSERT_ID();

    INSERT INTO Personal (nombre, identificacion_referencia, perfil_operativo, estado, contacto)
    VALUES ('Personal QA', 'QA-PER-01', 'Paramedico', 'Activo', 'sin-contacto');
    SET v_personal = LAST_INSERT_ID();

    -- Primer registro: debe aceptarse.
    INSERT INTO AsignacionPersonal (id_asignacion, id_personal, funcion, fecha_vinculacion)
    VALUES (v_asignacion, v_personal, 'Prueba unicidad', NOW());

    -- Segundo registro de la misma pareja: debe fallar con error 1062 (duplicate key).
    BEGIN
        DECLARE CONTINUE HANDLER FOR 1062
            SET v_rechazo_duplicado = 1;

        INSERT INTO AsignacionPersonal (id_asignacion, id_personal, funcion, fecha_vinculacion)
        VALUES (v_asignacion, v_personal, 'Duplicado intencional', NOW());
    END;

    SELECT COUNT(*) INTO v_parejas
    FROM AsignacionPersonal
    WHERE id_asignacion = v_asignacion AND id_personal = v_personal;

    SELECT
        IF(v_rechazo_duplicado = 1 AND v_parejas = 1, 'CUMPLE', 'NO CUMPLE') AS resultado,
        v_rechazo_duplicado AS segundo_insert_rechazado,
        v_parejas AS registros_persistidos_en_transaccion,
        'Se espera 1 registro y rechazo del segundo por UNIQUE' AS resultado_esperado;

    ROLLBACK;
END//
DELIMITER ;

CALL sp_prueba_unicidad_asignacion_personal();
DROP PROCEDURE sp_prueba_unicidad_asignacion_personal;

-- Resultado esperado del SELECT: resultado=CUMPLE, segundo_insert_rechazado=1, registros=1.
-- La transaccion hace ROLLBACK; ningun fixture debe quedar almacenado.
