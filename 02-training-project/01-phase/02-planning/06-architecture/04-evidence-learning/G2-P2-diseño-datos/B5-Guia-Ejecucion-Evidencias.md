# B5 – Guía de Ejecución y Evidencias Técnicas en Motor Real – SIGMAVITAL

**Fecha de consolidación:** 2026-11-28  
**Responsable:** \`miguel18100\`  
**Motor verificado:** MySQL 8.0 / MariaDB 10.4.32 (motor transaccional \`InnoDB\`, modo estricto \`STRICT_TRANS_TABLES\`, cotejamiento \`utf8mb4_unicode_ci\`)  
**Alcance:** Validación real del esquema físico completo de **25 tablas 3FN**, 35 llaves foráneas, 49 restricciones \`CHECK\`, 4 disparadores de inmutabilidad (\`RN-010\`, \`RN-013\`, \`RN-014\`), pruebas negativas y respaldo/restauración lógica sobre base aislada \`sigmavital_prueba\`.

---

## 1. Ejecución del script DDL maestro

Se ejecutó [B5-Creacion-Base-Datos.sql](B5-Creacion-Base-Datos.sql) en una instancia limpia obteniendo **código de salida \`0\`** y cero errores de sintaxis o integridad.

| Elemento verificado en \`information_schema\` | Resultado real |
|---|---:|
| Tablas físicas creadas (\`InnoDB\`) | **25** |
| Llaves foráneas (\`REFERENTIAL_CONSTRAINTS\`) | **35** |
| Restricciones \`CHECK\` de dominio y reglas \`RN\` | **49** |
| Disparadores de inmutabilidad (\`Auditoria\`, \`Factura\`, \`Documento\`) | **4** |

Evidencia completa: [B5-Evidencia-Ejecucion-MySQL.txt](B5-Evidencia-Ejecucion-MySQL.txt).

---

## 2. Pruebas negativas obligatorias y control transaccional

Se ejecutaron **6 pruebas negativas** sobre datos reales en transacción validando el rechazo efectivo del motor ante violaciones de negocio (\`EXIT=1\` esperado):

1. \`Neg1\`: inserción en \`Asignacion\` con \`asignacion_manual = 1\` sin motivo (\`RN-007\`) -> **RECHAZADA (\`ERROR 4025 chk_asig_rn007\`)**.
2. \`Neg2\`: inserción en \`RegistroCierre\` con \`destino_traslado\` vacío (\`RN-005\`) -> **RECHAZADA (\`ERROR 4025 chk_cie_rn005\`)**.
3. \`Neg3\`: pareja repetida \`(id_asignacion, id_personal)\` en \`AsignacionPersonal\` -> **RECHAZADA (\`ERROR 1062 uq_asignacion_personal\`)**.
4. \`Neg4\`: intento de \`UPDATE\` sobre \`Auditoria\` (\`RN-010\`) -> **RECHAZADA (\`ERROR 1644 trg_auditoria_no_update\`)**.
5. \`Neg5\`: intento de alterar \`Factura.valor_total\` (\`RN-014\`) -> **RECHAZADA (\`ERROR 1644 trg_factura_no_update\`)**.
6. \`Neg6\`: actualización de \`Usuario.estado\` a \`'Fuera de servicio'\` -> **RECHAZADA (\`ERROR 4025 chk_usuario_estado\`)**.

Adicionalmente se comprobó el aislamiento atómico con \`START TRANSACTION\` + \`INSERT\` + \`ROLLBACK\`, verificando que la tabla \`Rol\` mantuvo exactamente sus 3 filas previas sin residuales.

---

## 3. Respaldo lógico consistente y restauración aislada (\`B6 / RNF-029\`)

1. Se exportó el esquema \`sigmavital\` con \`mysqldump --single-transaction --routines --triggers\`, obteniendo un respaldo consistente verificado por firma \`SHA-256\`.
2. Se creó el esquema aislado \`sigmavital_prueba\` y se restauró íntegramente desde el respaldo con código de salida \`0\`, verificando posteriormente **25 tablas**, **35 llaves foráneas** y **4 disparadores** restaurados sin pérdida de registros.

Evidencia completa: [B6-Evidencia-Restauracion-MySQL.txt](B6-Evidencia-Restauracion-MySQL.txt).
