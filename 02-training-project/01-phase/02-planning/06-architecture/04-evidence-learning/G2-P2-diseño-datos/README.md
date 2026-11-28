# Guía 2 – Producto 2: Diseño y Validación de Base de Datos Relacional – SIGMAVITAL

## 1. Datos de la entrega

| Campo | Valor |
|---|---|
| **Ficha** | 3413974 |
| **Proyecto** | SIGMAVITAL – Sistema Gestor de Ambulancias (SGA) |
| **Aprendiz (usuario GitHub)** | `miguel18100` |
| **Fecha de entrega / actualización** | 2026-11-28 |
| **Motor de base de datos** | MySQL 8.0 / MariaDB 10.4+ (InnoDB · `utf8mb4_unicode_ci`) |

---

## 2. Qué se diseñó, normalizó y validó en base de datos

Partiendo del núcleo operativo inicial, se consolidó el diseño completo de datos de **SIGMAVITAL** en **25 tablas normalizadas en 3FN** para cubrir al **100 % los 65 RF, 29 RNF y 18 RN** del SRS (`Rol`, `Usuario`, `PropietarioUnidad`, `Ambulancia`, `MantenimientoUnidad`, `Proveedor`, `ContratoProveedor`, `Personal`, `Paciente`, `PacienteTelefono`, `Solicitud`, `Servicio`, entidad débil `HistorialEstadoServicio`, `Asignacion`, `AsignacionPersonal`, `Intervencion`, `RegistroCierre`, `Factura`, `NotaContable`, `MovimientoFinanciero`, `Visitante`, `Pqrs`, `Documento`, `NovedadOperativa` y `Auditoria`). Todo el modelo mantiene paridad exacta `B1 -> B2 -> B3 -> B4 -> B5 -> B6`, validación real en motor InnoDB con restricciones `CHECK`/`UNIQUE`/disparadores de inmutabilidad y prueba verificada de respaldo/restauración.

---

## 3. Evidencias incluidas (links)

- **B1 Modelo Conceptual:** [B1-Modelo-Conceptual.md](B1-Modelo-Conceptual.md) · [Draw.io](B1-Diagrama-Conceptual.drawio) · [SVG](B1-Diagrama-Conceptual.svg)
- **B2 Modelo Relacional 3FN:** [B2-Modelo-Relacional.md](B2-Modelo-Relacional.md) · [Draw.io](B2-Diagrama-Relacional.drawio) · [SVG](B2-Diagrama-Relacional.svg)
- **B3 Normalización:** [B3-Normalizacion.md](B3-Normalizacion.md) (desarrollo paso a paso `0FN -> 3FN` de 2 tablas reales)
- **B4 Diccionario de Datos:** [B4-Diccionario-Datos.md](B4-Diccionario-Datos.md) (25 tablas sincronizadas 1:1 con `B5`)
- **B5 Creación DDL y Pruebas SQL:** [B5-Creacion-Base-Datos.sql](B5-Creacion-Base-Datos.sql) · [Evidencia real ejecución MySQL](B5-Evidencia-Ejecucion-MySQL.txt)
- **B6 Políticas de Seguridad y Restore:** [B6-Politicas-Seguridad-Datos.md](B6-Politicas-Seguridad-Datos.md) · [Evidencia real restauración](B6-Evidencia-Restauracion-MySQL.txt)
- **B7 Checklist de Aceptación:** [B7-Checklist-Aceptacion.md](B7-Checklist-Aceptacion.md) (20/20 criterios y 6 hallazgos resueltos)

---

## 4. Cómo reproducir la creación, pruebas y restauración

```bash
# 1. Crear esquema limpio de 25 tablas, índices y 4 triggers en MySQL/MariaDB
mysql -u root -p < B5-Creacion-Base-Datos.sql

# 2. Respaldo lógico consistente y firma SHA-256
mysqldump -u root -p --single-transaction --routines --triggers sigmavital > sigmavital_backup.sql
sha256sum sigmavital_backup.sql

# 3. Restauración de comprobación en esquema aislado sigmavital_prueba
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS sigmavital_prueba;"
mysql -u root -p sigmavital_prueba < sigmavital_backup.sql
```

---

## 5. Autoría y uso de IA

- **Autor principal y responsable técnico:** `miguel18100` (modelado conceptual, normalización 3FN, SQL DDL, ejecución de pruebas positivas/negativas, respaldo/restauración y auditoría de seguridad).
- **Apoyo de IA:** apoyo puntual de **ChatGPT** en estructuración de tablas del diccionario `B4` y documentación Markdown; todos los scripts SQL y pruebas reales en base de datos fueron ejecutados y verificados directamente por el aprendiz.
