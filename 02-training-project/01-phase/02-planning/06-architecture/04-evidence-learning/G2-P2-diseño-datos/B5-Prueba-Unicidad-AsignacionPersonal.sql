-- B5 - Prueba propuesta para la unicidad de la pareja Asignacion/Personal
-- Motor previsto: MariaDB / MySQL. Ejecutar únicamente en una base de pruebas.
-- Este archivo es un guion de prueba; no constituye evidencia de ejecución.

START TRANSACTION;

-- Seleccione IDs existentes en el entorno de prueba antes de ejecutar.
-- Sustituya los valores de ejemplo por IDs válidos de Asignacion y Personal.
SET @id_asignacion_prueba = 1;
SET @id_personal_prueba = 1;

INSERT INTO AsignacionPersonal
    (id_asignacion, id_personal, funcion, fecha_vinculacion)
VALUES
    (@id_asignacion_prueba, @id_personal_prueba, 'Prueba unicidad', NOW());

-- La siguiente sentencia debe ser rechazada por uq_asignacionpersonal_asignacion_personal.
-- Ejecutarla como sentencia individual para capturar el error de clave duplicada.
INSERT INTO AsignacionPersonal
    (id_asignacion, id_personal, funcion, fecha_vinculacion)
VALUES
    (@id_asignacion_prueba, @id_personal_prueba, 'Duplicado intencional', NOW());

-- Tras documentar el resultado, revertir la transacción de prueba.
ROLLBACK;

-- Resultado esperado: el primer INSERT se acepta y el segundo falla por UNIQUE.
-- Registrar fecha, versión del motor, IDs usados, mensaje de error y captura de ejecución.
