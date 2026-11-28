# B6 – Políticas de Seguridad de Datos, Cifrado, RBAC y Respaldo – SIGMAVITAL

**Proyecto:** SIGMAVITAL (SGA) · **Normas aplicadas:** ISO/IEC 27001, Ley 1581 de 2012 (Habeas Data), Resolución 3100 de 2017

---

## 1. Políticas concretas de Seguridad de la Información (Principios CIA)

### 1.1 Confidencialidad
1. **Protección de credenciales (`Usuario.password_hash`):** almacenamiento obligatorio con algoritmo adaptativo `Argon2id` (o `bcrypt` coste >= 12) con salt único por usuario (`RNF-001`). Prohibido almacenar claves en texto plano o recuperar contraseñas por descifrado reversible; caducidad cada 90 días (`RN-008`) y bloqueo automático 30 minutos al quinto intento fallido (`Usuario.intentos_fallidos`, `Usuario.bloqueado_hasta`, `RN-009`).
2. **Protección de datos sensibles clínicos (`Paciente.identificacion`, `Paciente.estado_clinico_inicial`, `Paciente.antecedentes_relevantes`, `PacienteTelefono.telefono`):** cifrado en reposo bajo AES-256 en almacenamiento InnoDB (`RNF-004`), transporte cifrado exclusivo mediante `HTTPS / TLS 1.3` (`RNF-002`), autorización expresa del titular y restricción estricta de finalidad asistencial conforme a la **Ley 1581 de 2012**.
3. **Clasificación de acceso documental (`Documento.nivel_confidencialidad`):** separación estricta en `Publico`, `Interno` y `Restringido`, registrando cada visualización o descarga en `Auditoria`.

### 1.2 Integridad
1. **Inmutabilidad normativa de auditoría (`Auditoria`):** los registros son estrictamente `append-only` (`INSERT` permitido, `UPDATE` y `DELETE` bloqueados por disparadores SQL `trg_auditoria_no_update` y `trg_auditoria_no_delete`) garantizando retención >= 5 años (`RN-010`, `RNF-021`).
2. **Inmutabilidad financiera y documental (`Factura.valor_total`, `Factura.es_inmutable`, `Documento.hash_sha256`, `Documento.es_oficial`):** las facturas emitidas al cierre no pueden alterarse (correcciones únicamente vía `NotaContable` `Credito/Debito`, `RN-014`); los documentos marcados oficiales quedan protegidos por disparador SQL y validación `SHA-256` (`RN-013`).
3. **Validación transaccional de reglas operativas:** restricciones `CHECK` nativas en base de datos garantizan `RN-005` (`RegistroCierre`), `RN-007` (`Asignacion.motivo_asignacion_manual`), `RN-011` (`Pqrs.respuesta_formal`), `RN-016` (`NovedadOperativa.resolucion`) y `RN-017` (`Visitante.justificacion_manual`).

### 1.3 Disponibilidad
1. **Respaldos diarios automatizados (`RNF-029`):** volcado lógico consistente diario (`mysqldump --single-transaction --routines --triggers`) cifrado en bóveda externa (Nodo 4 de `A6`), con retención mínima de **30 copias consecutivas**, **RTO <= 4 horas** y **RPO <= 24 horas**.
2. **Verificación periódica de restauración (`sigmavital_prueba`):** cada respaldo genera firma criptográfica `SHA-256`, se restaura en instancia aislada y se valida el conteo íntegro de tablas, claves foráneas, restricciones `CHECK` y disparadores antes de certificar la copia.

---

## 2. Matriz RBAC de Privilegios por Rol y Tabla (5 Roles × 25 Tablas)

*(C = Crear, R = Consultar, U = Actualizar, D = Eliminar, — = Sin acceso directo)*

| Tabla física (`B5`) | Administrador | Coordinador Operativo | Paramédico / Tripulación | Vigilante | Usuario / Ciudadano |
|---|---|---|---|---|---|
| `Rol` | CRUD | R | R | — | — |
| `Usuario` | CRUD | R | R | — | — |
| `PropietarioUnidad` | CRUD | R | R | — | — |
| `Ambulancia` | CRUD | R | R | — | — |
| `Proveedor` | CRUD | R | R | — | — |
| `MantenimientoUnidad` | CRUD | R | R | — | — |
| `ContratoProveedor` | CRUD | R | R | — | — |
| `Personal` | CRUD | R | R | — | — |
| `Paciente` | R | CR | CRU (RN Confid.) | — | — |
| `PacienteTelefono` | R | CR | CRU (RN Confid.) | — | — |
| `Solicitud` | R | CRU | RU (Asignados) | — | — |
| `Servicio` | R | CRU | RU (Asignados) | — | — |
| `HistorialEstadoServicio` | R | CRU | RU (Asignados) | — | — |
| `Asignacion` | R | CRU | RU (Asignados) | — | — |
| `AsignacionPersonal` | R | CRU | RU (Asignados) | — | — |
| `Intervencion` | R | CR | CRU (RN Confid.) | — | — |
| `RegistroCierre` | R | CR | CR (RN-005) | — | — |
| `Factura` | CRU estado pago (RN-014) | R | — | — | R (Propias) |
| `NotaContable` | CR (Trazado) | R | R | — | — |
| `MovimientoFinanciero` | CR (Trazado) | R | R | — | — |
| `Visitante` | R | CR (Preaut.) | C (Preaut.) | CRU (RN-017) | C (Preaut.) |
| `Pqrs` | CRU | RU | R | — | CR (Radicado) |
| `Documento` | CR (Versionado RN-013) | R | R (Público/Interno) | R (Público) | R (Público) |
| `NovedadOperativa` | CRU | CRU (RN-016) | CR | C | — |
| `Auditoria` | CR (Inmutable RN-010) | C (Sistema) | C (Sistema) | C (Sistema) | — |

---

## 3. Evidencia verificada de ejecución SQL y prueba real de respaldo/restauración

- **Log de ejecución DDL, DML y pruebas negativas `CHECK/UNIQUE/TRIGGER`:** [B5-Evidencia-Ejecucion-MySQL.txt](B5-Evidencia-Ejecucion-MySQL.txt)
- **Log real de respaldo `mysqldump`, firma SHA-256 y restauración en `sigmavital_prueba`:** [B6-Evidencia-Restauracion-MySQL.txt](B6-Evidencia-Restauracion-MySQL.txt)

> Ambas pruebas fueron ejecutadas directamente contra motor real **MariaDB / MySQL InnoDB (`STRICT_TRANS_TABLES`)** verificando las 25 tablas, llaves foráneas, 4 disparadores y rechazo efectivo de inserciones violatorias de `RN-005`, `RN-007`, `RN-010` y `RN-014`.
