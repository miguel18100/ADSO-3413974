# Guía 1 – Producto 2: Casos de Uso Extendidos, Actividades, Dominio, MER y Prototipo UI – SIGMAVITAL

## 1. Datos de la entrega

| Campo | Valor |
|---|---|
| **Ficha** | 3413974 |
| **Proyecto** | SIGMAVITAL – Sistema Gestor de Ambulancias (SGA) |
| **Aprendiz (usuario GitHub)** | `miguel18100` |
| **Fecha de entrega / actualización** | 2026-11-28 |
| **Versión / commit de referencia** | Línea base consolidada posterior a `5ac471a` / `ca43b76` |

---

## 2. Qué se corrigió o completó

Se consolidó la totalidad del Producto 2 de la Guía 1 dentro de esta única carpeta oficial `G1-P2-Modelado-SIGMAVITAL`, unificando los avances previos dispersos, corrigiendo la trazabilidad de `CU-08`, `CU-11` y `CU-14` con el Producto 1 (65/65 RF) y generando las fuentes editables `.drawio` junto con exportaciones vectoriales 1:1 en `.svg` y vistas `.png` para `DA-01`, `DA-02`, `DA-03`, `MD-01` (25 conceptos con herencia TAB/TAM) y `MER-01` (25 entidades Crow's Foot con entidad débil `HistorialEstadoServicio`). Asimismo, se actualizó el prototipo HTML interactivo con etiquetas `P-01`, `P-02` y `P-03` y el informe de análisis final.

---

## 3. Reutilización de material previo

| Artefacto previo | Ubicación / referencia | Qué se tomó de él | Qué se ajustó o completó |
|---|---|---|---|
| Matriz y diagrama de casos de uso | [G1-P1-Plan-Analisis](../G1-P1-Plan-Analisis/05-matriz-requisitos-casos-uso/Matriz-Requisitos-Casos-Uso.md) | Catálogo unificado `CU-01..CU-20` y 65 RF | Se alineó el tercer flujo crítico a `CU-14` (en lugar del antiguo `CU-22`) para mantener coherencia 100 % |
| Plantilla base HTML SIGMAVITAL | Commits `5ac471a` y `ca43b76` en el repositorio | Sistema de diseño azul/ciano, navegación lateral y tablas de ejemplo | Se integraron las etiquetas `P-01`, `P-02`, `P-03`, validación JS para `RN-007`, campos `RN-005` y módulos del SRS completo |
| Borradores iniciales de `MD-01`, `DA` y `CHECKLIST-01` | Commits `5ac471a` y `ca43b76` | Estructura conceptual de 11 entidades base | Se corrigió codificación UTF-8, se amplió a 25 conceptos/entidades y se añadieron archivos `.drawio` + `.svg` reales |

---

## 4. Evidencias incluidas (links)

### 4.1 Casos de uso extendidos
- [CU-08 – Registrar solicitud de servicio y clasificar prioridad](01-casos-uso-extendidos/CU-08-Registrar-Solicitud-Servicio.md)
- [CU-11 – Asignar ambulancia y personal al servicio](01-casos-uso-extendidos/CU-11-Asignar-Ambulancia-Personal.md)
- [CU-14 – Realizar cierre formal del servicio](01-casos-uso-extendidos/CU-14-Cerrar-Servicio.md)

### 4.2 Diagramas de actividades (.md + .drawio + .svg + .png)
- **DA-01 Solicitud (CU-08):** [Documento](02-diagramas-actividades/DA-01-Registrar-Solicitud-CU08.md) · [Draw.io](02-diagramas-actividades/DA-01-Registrar-Solicitud-CU08.drawio) · [SVG](02-diagramas-actividades/DA-01-Registrar-Solicitud-CU08.svg)
- **DA-02 Asignación (CU-11):** [Documento](02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.md) · [Draw.io](02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.drawio) · [SVG](02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.svg)
- **DA-03 Cierre Formal (CU-14):** [Documento](02-diagramas-actividades/DA-03-Cerrar-Servicio-CU14.md) · [Draw.io](02-diagramas-actividades/DA-03-Cerrar-Servicio-CU14.drawio) · [SVG](02-diagramas-actividades/DA-03-Cerrar-Servicio-CU14.svg)

### 4.3 Modelo conceptual de dominio y modelo entidad–relación
- **MD-01 Modelo de Dominio:** [Documento](03-modelo-dominio/MD-01-Modelo-Dominio-SIGMAVITAL.md) · [Draw.io](03-modelo-dominio/MD-01-Modelo-Dominio.drawio) · [SVG](03-modelo-dominio/MD-01-Modelo-Dominio.svg)
- **MER-01 Modelo Entidad–Relación (Crow's Foot):** [Documento](04-modelo-entidad-relacion/MER-01-Modelo-Entidad-Relacion-SIGMAVITAL.md) · [Draw.io](04-modelo-entidad-relacion/MER-01-Modelo-Entidad-Relacion.drawio) · [SVG](04-modelo-entidad-relacion/MER-01-Modelo-Entidad-Relacion.svg)

### 4.4 Prototipo UI, verificación, trazabilidad e informe
- [Prototipo interactivo HTML SIGMAVITAL](05-prototipo-ui/01-mockups/SIGMAVITAL-Prototipo-v01.html) (`P-01`, `P-02`, `P-03` + módulos SRS)
- [Mapa de navegación](05-prototipo-ui/02-mapa-navegacion/MAPA-NAVEGACION-SIGMAVITAL.md) · [Especificación de diseño](05-prototipo-ui/03-especificacion-diseno/ESPECIFICACION-DISENO-SIGMAVITAL.md)
- [REG-01 Registro de iteración visual](05-prototipo-ui/03-especificacion-diseno/REG-01-Registro-Iteracion-Visual.md)
- [CHECKLIST-01 Verificación P2 (24/24)](06-checklist-verificacion/CHECKLIST-01-Verificacion-Evidencias-P2.md)
- [Matriz de trazabilidad completa (65/65 RF)](07-matriz-trazabilidad/MATRIZ-TRAZABILIDAD-P2-SIGMAVITAL.md)
- [Informe ejecutivo de análisis G1-P2](08-informe-analisis/INFORME-ANALISIS-P2-SIGMAVITAL.md)

---

## 5. Cómo verificar que funciona

1. **Paridad de modelos visuales:** abrir los archivos `.svg` y `.drawio` de `DA-01..03`, `MD-01` y `MER-01` confirmando encabezados horizontales legibles, guardas `[...]`, bloques `Fork/Join`, ausencia de métodos SQL en `MD-01` y entidad débil `HistorialEstadoServicio` en `MER-01`.
2. **Prototipo UI funcional:** abrir [SIGMAVITAL-Prototipo-v01.html](05-prototipo-ui/01-mockups/SIGMAVITAL-Prototipo-v01.html) en navegador, navegar entre `P-01`, `P-02` y `P-03` y validar la alerta `RN-007` al elegir asignación manual sin motivo.
3. **Trazabilidad total:** comprobar en [MATRIZ-TRAZABILIDAD-P2-SIGMAVITAL.md](07-matriz-trazabilidad/MATRIZ-TRAZABILIDAD-P2-SIGMAVITAL.md) la cobertura **65 / 65 RF (100 %)**.

---

## 6. Ajustes realizados tras verificación

| # | Desajuste detectado | Corrección ejecutada | Fecha |
|---|---|---|---|
| 1 | Copias previas ubicadas erróneamente bajo la fase `02-planning/05-prototype` con archivos `.bak*` | Consolidado íntegramente en esta carpeta de fase análisis y eliminados todos los temporales y duplicados | 2026-11-28 |
| 2 | Desincronización de `CU-22` vs `CU-14` y textos recortados en carriles de actividad | Renombrado a `CU-14` en G1-P1 y G1-P2 y rediseñados `DA-01..03` con exportación directa desde `.drawio` | 2026-11-28 |
| 3 | Ausencia de diagramas gráficos para `MD-01`/`MER-01` y falta del informe `08-informe-analisis` | Generados `MD-01.drawio/.svg`, `MER-01.drawio/.svg` (25 entidades) e `INFORME-ANALISIS-P2-SIGMAVITAL.md` | 2026-11-28 |

---

## 7. Autoría y uso de IA

- **Autor principal y responsable técnico:** `miguel18100` (modelado conceptual, normalización ER, reglas REPS/SRS, verificación de prototipo y validación de consistencia).
- **Apoyo de IA:** se empleó **ChatGPT** para revisión de redacción técnica, validación de formato en matrices y depuración de diagramas editables; todo artefacto fue verificado visual y funcionalmente por el aprendiz.
