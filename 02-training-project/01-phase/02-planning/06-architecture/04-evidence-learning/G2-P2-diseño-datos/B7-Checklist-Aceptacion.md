# B7 – Checklist de Aceptación y Auditoría Técnica – G2-P2 Base de Datos SIGMAVITAL

**Responsable:** `miguel18100` · **Fecha de verificación final:** 2026-11-28 · **Estado:** **24 / 24 Criterios Aprobados (100 %)**

## 1. Lista de verificación verificable (P1 + P2)

| ID | Artefacto | Criterio medible de aceptación | Evidencia | Cumple |
|---|---|---|---|---|
| BD-01 | B1 Conceptual | Cubre las 24 entidades del negocio para los 65 RF e incluye multivaluado (`{telefonos}`) y entidad débil | [B1-Diagrama-Conceptual.svg](B1-Diagrama-Conceptual.svg) | Sí |
| BD-02 | B1 Conceptual | Tabla de participaciones y cardinalidades Origen -> Destino sin inversiones | [B1-Modelo-Conceptual.md](B1-Modelo-Conceptual.md) | Sí |
| BD-03 | B2 Relacional | Incluye cuadro formal completo de reglas de transformación Conceptual -> Relacional (R1..R7) | [B2-Modelo-Relacional.md](B2-Modelo-Relacional.md) | Sí |
| BD-04 | B2 Relacional | Diagrama Crow's Foot exportado 1:1 desde `.drawio` a `.svg` sin cortes ni solapamientos | [B2-Diagrama-Relacional.svg](B2-Diagrama-Relacional.svg) | Sí |
| BD-05 | B3 Normalización | Dos tablas reales documentadas paso a paso `0FN -> 1FN -> 2FN -> 3FN` con dependencias funcionales | [B3-Normalizacion.md](B3-Normalizacion.md) | Sí |
| BD-06 | B3 Normalización | Cero grupos repetitivos, cero dependencias parciales y cero transitivas en las 25 tablas | [B3-Normalizacion.md](B3-Normalizacion.md) | Sí |
| BD-07 | B4 Diccionario | Documenta las 25 tablas con tipos, nulabilidad, PK, FK, UNIQUE, CHECK y dominios válidos | [B4-Diccionario-Datos.md](B4-Diccionario-Datos.md) | Sí |
| BD-08 | B4 ↔ B5 Paridad | Coincidencia exacta 100 % entre columnas, tipos y restricciones de `B4` y `B5-Creacion-Base-Datos.sql` | `B4` / `B5` | Sí |
| BD-09 | B5 Script DDL | Script idempotente sobre MySQL/MariaDB InnoDB con `CREATE DATABASE`, índices y `utf8mb4` | [B5-Creacion-Base-Datos.sql](B5-Creacion-Base-Datos.sql) | Sí |
| BD-10 | B5 Seguridad | `Usuario` incluye `password_hash VARCHAR(255) NOT NULL`, bloqueo 5 intentos y vigencia 90 días | `B5-Creacion-Base-Datos.sql` | Sí |
| BD-11 | B5 Reglas RN | `CHECK` por tabla sin valores cruzados inválidos; valida `Ambulancia`, `RN-005`, `RN-007`, `RN-011`, `RN-016`, `RN-017` | [B5-Evidencia-Ejecucion-MySQL.txt](B5-Evidencia-Ejecucion-MySQL.txt) | Sí |
| BD-12 | B5 Triggers | 4 disparadores activos bloquean `UPDATE/DELETE` en `Auditoria`, alteración de `Factura` y edición documental oficial | `B5-Evidencia-Ejecucion-MySQL.txt` | Sí |
| BD-13 | B5 Prueba Real | Ejecución real DDL + seed + pruebas negativas (`CHECK/UNIQUE/TRIGGER`) + `ROLLBACK` limpio | `B5-Evidencia-Ejecucion-MySQL.txt` | Sí |
| BD-14 | B6 CIA | >= 2 políticas concretas por principio (Confidencialidad, Integridad, Disponibilidad) referenciando columnas exactas | [B6-Politicas-Seguridad-Datos.md](B6-Politicas-Seguridad-Datos.md) | Sí |
| BD-15 | B6 Normativa | Especifica `Argon2id/bcrypt`, `TLS 1.3`, Ley 1581 (autorización/finalidad), `RTO <= 4h`, `RPO <= 24h` | `B6-Politicas-Seguridad-Datos.md` | Sí |
| BD-16 | B6 Matriz RBAC | Matriz completa de privilegios para **5 roles × 25 tablas** alineada con `RN-010` y `RN-014` | `B6-Politicas-Seguridad-Datos.md` | Sí |
| BD-17 | B6 Restore Real | Respaldo real `mysqldump`, verificación `SHA-256` y restauración íntegra en `sigmavital_prueba` sin rutas locales | [B6-Evidencia-Restauracion-MySQL.txt](B6-Evidencia-Restauracion-MySQL.txt) | Sí |
| BD-18 | Consistencia G2 | Alineamiento 100 % con `A2` (`Rol 1 -- 0..* Usuario`), `A4`, `A5` y `A7` (65/65 RF) | `G2-P1-arquitectura` | Sí |
| BD-19 | Limpieza | Cero archivos `.bak*`, `B5-Prueba.sql` residuales o duplicados antiguos | Revisión de carpeta | Sí |
| BD-20 | Privacidad | Cero nombres reales ni rutas locales privadas de equipo en logs y Markdown | Escaneo completo | Sí |

---

## 2. Hallazgos identificados y correcciones cerradas (Antes -> Después)

| # | Hallazgo detectado | Corrección ejecutada | Resultado 2ª verificación |
|---|---|---|---|
| 1 | `B1` tenía la columna de participaciones invertida y cuadros blancos tapando esquinas | Se corrigió la tabla Origen -> Destino y se regeneró `B1-Diagrama-Conceptual.drawio/.svg` sin cajas superpuestas | Verificado |
| 2 | `B2` carecía del cuadro formal de reglas de transformación y su `.svg` no coincidía con el `.drawio` | Se añadió el cuadro `R1..R7` en `B2` y se exportó `B2-Diagrama-Relacional.svg` 1:1 desde el `.drawio` | Verificado |
| 3 | `Usuario` en `B5` carecía de `password_hash`, mezclaba `'Fuera de servicio'` en `CHECK` y `Ambulancia` carecía de restricciones | Se incorporó `password_hash`, `CHECK` limpios por tabla, reglas `RN-005/007/011/016/017` y 4 disparadores | Verificado |
| 4 | `B4` y `B5` cubrían solo 11 tablas dejando sin soporte 34 requisitos SRS de módulos complementarios | Se amplió de forma coherente a **25 tablas 3FN** sincronizadas 1:1 en `B1`, `B2`, `B4` y `B5` | Verificado |
| 5 | `B6.md` contradecía la evidencia diciendo *"No ejecutada todavía"* y logs filtraban ruta local privada de usuario | Se ejecutó prueba real en `sigmavital_prueba` sin rutas locales y se integraron políticas por columna + RBAC 5×25 | Verificado |
| 6 | Persistían 14 archivos `.bak*` y scripts temporales en la raíz de la entrega | Se eliminaron todos los respaldos y se estandarizó `README.md` conforme a la plantilla oficial | Verificado |
