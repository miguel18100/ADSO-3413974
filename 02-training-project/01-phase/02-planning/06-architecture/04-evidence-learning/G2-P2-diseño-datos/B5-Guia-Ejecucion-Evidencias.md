# B5 - Guía de ejecución y evidencias técnicas

**Fecha de consolidación:** 27/11/2026
**Motor verificado:** MySQL 8.0.46
**Entorno:** contenedor Docker aislado `sigmavital-mysql-prueba`, puerto local 13307
**Alcance:** pruebas técnicas del DDL, restricciones, unicidad compuesta y restauración lógica. No representa una puesta en producción.

## 1. Ejecución del DDL principal

Se ejecutó `B5-Creacion-Base-Datos.sql` dentro del contenedor aislado. El archivo local y la copia transferida al contenedor presentaron el mismo SHA-256:

`da784fd90037596ed206531d76f94414d901cad9aff6e1b42664a9083e41cab6`

MySQL terminó la importación con código de salida `0`. La consulta posterior a `information_schema` devolvió:

| Verificación | Resultado |
|---|---:|
| Tablas | 11 |
| Claves foráneas | 12 |
| Restricciones CHECK | 7 |

Evidencia: [B5-Evidencia-DDL-Principal-MySQL-20261127-194248.txt](B5-Evidencia-DDL-Principal-MySQL-20261127-194248.txt).

## 2. Ejecución de la copia de prueba

También se importó `B5-Prueba.sql` en el esquema aislado `sigmavital_prueba`. La ejecución finalizó con código `0` y los conteos reales fueron 11 tablas, 12 claves foráneas y 7 restricciones CHECK.

Evidencia: [B5-Evidencia-Ejecucion-DDL-MySQL-20261127.txt](B5-Evidencia-Ejecucion-DDL-MySQL-20261127.txt).

## 3. Prueba de unicidad compuesta de AsignacionPersonal

Se ejecutó `B5-Prueba-Unicidad-AsignacionPersonal.sql` sobre `sigmavital_prueba` con MySQL 8.0.46. La salida real fue `CUMPLE`; `segundo_insert_rechazado = 1` y `registros_persistidos_en_transaccion = 1`. Después del `ROLLBACK`, los contadores de los cuatro registros ficticios quedaron en `0, 0, 0, 0`.

La prueba confirma que se aceptó la primera pareja `id_asignacion/id_personal` y se rechazó el segundo INSERT duplicado por la restricción UNIQUE. Los datos de prueba no permanecieron en la base.

Evidencia: [B5-Evidencia-Unicidad-AsignacionPersonal-MySQL-20261127.txt](B5-Evidencia-Unicidad-AsignacionPersonal-MySQL-20261127.txt).

## 4. Acciones referenciales del DDL principal

La consulta a `information_schema.REFERENTIAL_CONSTRAINTS` sobre el esquema `sigmavital` devolvió las 12 relaciones. Las 12 usan `ON UPDATE CASCADE`. Para `ON DELETE`, se observaron reglas `CASCADE` en `Asignacion.id_servicio`, `AsignacionPersonal.id_asignacion`, `Intervencion.id_servicio` y `RegistroCierre.id_servicio`; las otras ocho relaciones usan `RESTRICT`.

Evidencia: [B5-Evidencia-Relaciones-MySQL-20261127-194248.txt](B5-Evidencia-Relaciones-MySQL-20261127-194248.txt).

## 5. Respaldo y restauración lógica aislada

Se generó un respaldo lógico de `sigmavital_prueba` mediante `mysqldump`, con `--single-transaction`, `--routines`, `--triggers` y `--events`. El archivo fue copiado al equipo local y su SHA-256 coincidió con el calculado dentro del contenedor:

`189986408cb031b0c25a76983f200887d62602970481a9982f2044a5e473c7ec`

Se eliminó exclusivamente el esquema aislado `sigmavital_prueba`, se restauró desde el SQL y MySQL finalizó la importación sin errores. Tras la restauración se verificaron nuevamente 11 tablas, 12 claves foráneas y 7 restricciones CHECK.

Evidencia: [B6-Evidencia-Restauracion-20261127-193214.txt](B6-Evidencia-Restauracion-20261127-193214.txt).

## 6. Resultado consolidado y alcance

Las verificaciones del DDL principal, la copia de prueba, la UNIQUE compuesta, las 12 acciones referenciales y la restauración lógica aislada cuentan con salidas reales de MySQL 8.0.46 y archivos de evidencia asociados.

Estas pruebas se realizaron dentro de un contenedor local aislado. No acreditan recuperación ante desastre físico, alta disponibilidad, restauración de infraestructura externa, pruebas de carga, seguridad en producción ni despliegue productivo. La prueba UNIQUE se ejecutó sobre `sigmavital_prueba`; el DDL principal `sigmavital` fue verificado por separado en conteos estructurales y acciones referenciales.

## 7. Archivos de evidencia

- `B5-Evidencia-DDL-Principal-MySQL-20261127-194248.txt`
- `B5-Evidencia-Relaciones-MySQL-20261127-194248.txt`
- `B5-Evidencia-Ejecucion-DDL-MySQL-20261127.txt`
- `B5-Evidencia-Unicidad-AsignacionPersonal-MySQL-20261127.txt`
- `B6-Evidencia-Restauracion-20261127-193214.txt`

Las evidencias históricas anteriores se conservan como antecedente y no sustituyen los archivos de ejecución de esta versión.
