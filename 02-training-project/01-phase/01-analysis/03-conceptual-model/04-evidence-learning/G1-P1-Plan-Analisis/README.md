# G1-P1 - Plan de análisis y casos de uso

## 1. Datos de la entrega

- **Producto:** G1-P1 - Plan de análisis y casos de uso.
- **Usuario de GitHub del autor:** `miguel18100`.
- **Caso de estudio:** Sistema Gestor de Ambulancias (SGA).
- **Trabajo de origen:** proyecto formativo SGA elaborado en contexto colaborativo ADSO.
- **Autoría del ajuste de esta evidencia:** individual; los artefactos de origen compartidos se identifican en esta sección.

## 2. Qué reutilicé

| Artefacto | Origen | Naturaleza del origen |
|---|---|---|
| Documento de proyecto y SRS | `02-training-project/01-phase/01-analysis/02-requirements/04-evidence-learning/Guia_Aprendizaje_TIC/593152_Solucion_Tecnologica/Proyecto Sistema Gestor de ambulancia Version 2.docx` y `02-training-project/01-phase/01-analysis/02-requirements/04-evidence-learning/Guia_Aprendizaje_TIC/593152_Solucion_Tecnologica/SGA_SRS.pdf` | Insumos del proyecto formativo para el contexto, alcance, requisitos y casos de uso. El análisis de alcance y la trazabilidad fueron revisados para G1-P1. |
| Instrumentos de levantamiento | `03-execute/08-week/02-optional-activity/Complete-SGA-Instruments/Instrumentos_SGA_Completos (1) (1).docx` | Insumo de consulta para identificar los métodos de levantamiento previstos; no se presentan respuestas ni resultados de campo que el archivo no contiene. |
| Comparación y selección metodológica | Nuevo para G1-P1 | Trabajo individual de análisis y selección, no copia de una plantilla completada. |
| Plan de actividades | Nuevo para G1-P1 | Plan individual con actividades, prioridades, responsables, fechas y entregables. |
| Matriz de requisitos y casos de uso | Derivada del SRS y del documento de proyecto indicados arriba | Consolidación y ajuste individual de requisitos, cobertura, casos y discrepancias de alcance. |
| Diagrama de casos de uso | Diagrama existente del proyecto, revisado como parte de la evidencia | Se conserva sin modificaciones la fuente Draw.io principal, sus exportaciones PNG/SVG y los archivos alternativos que ya estaban en la carpeta original. |

## 3. Qué ajusté (cambios verificables)

| # | Artefacto | Cambio concreto | Commit histórico relacionado |
|---|---|---|---|
| 1 | Caracterización | Se aclararon los cuatro aspectos exigidos: tipo de solución, equipo de cinco integrantes, estabilidad media de requisitos y disponibilidad de usuarios no acreditada como continua. | [Caracterización SGA - b42a5e0](https://github.com/miguel18100/ADSO-3413974/commit/b42a5e0) |
| 2 | Comparación metodológica | Se compararon RUP, Scrum, XP y RAD con criterios derivados de las características del SGA y una ponderación explícita; no se atribuyen roles Scrum al equipo sin designación documentada. | [Comparación - b88c306](https://github.com/miguel18100/ADSO-3413974/commit/b88c306) |
| 3 | Selección y plan | Se justificó Scrum con base en el resultado comparativo y se organizó el plan por preparación e iteraciones, con prioridad, responsable, fecha y entregable. | [Selección - 390f0d4](https://github.com/miguel18100/ADSO-3413974/commit/390f0d4) · [Plan - 0b915a8](https://github.com/miguel18100/ADSO-3413974/commit/0b915a8) |
| 4 | Matriz y diagrama | Se normalizaron los 31 RF de la línea base, los 22 casos y las relaciones entre requisitos y casos de uso. | [Matriz y UML - 07fcc6b](https://github.com/miguel18100/ADSO-3413974/commit/07fcc6b) |

**Correcciones documentales de cierre preparadas para esta revisión:** conciliación de los 113 registros del SRS, incorporación de los 12 registros omitidos de 4.8, revisión de la documentación textual de `include`/`extend`, trazabilidad y auditoría prepublicación. El diagrama y sus exportaciones se conservaron sin modificación. Estas correcciones todavía no están publicadas; el commit nuevo se debe generar después de que el aprendiz revise y apruebe este paquete.

## 4. Artefactos entregados

- [x] Caracterización: `01-caracterizacion-solucion/Caracterizacion-Solucion.md`.
- [x] Comparación de metodologías: `02-comparacion-metodologias/Comparacion-Metodologias.md`.
- [x] Selección justificada: `03-seleccion-metodologia/Seleccion-y-Justificacion-Metodologia.md`.
- [x] Plan de actividades: `04-plan-actividades/Plan-de-Actividades.md`.
- [x] Matriz requisito-caso de uso: `05-matriz-requisitos-casos-uso/Matriz-Requisitos-Casos-Uso.md`.
- [x] Conciliación del SRS: `07-conciliacion-srs/Conciliacion-Alcance-SRS.md`.
- [x] Diagrama editable: `06-diagrama-casos-uso/Diagrama-Casos-Uso.drawio`.
- [x] Diagrama exportado PNG: `06-diagrama-casos-uso/Diagrama-Casos-Uso.drawio.png`.
- [x] Diagrama exportado SVG: `06-diagrama-casos-uso/Diagrama-Casos-Uso.drawio.svg`.
- [x] Se conservaron los diagramas y exportaciones originales de la carpeta, sin redibujarlos ni regenerar sus imágenes. La fuente principal para abrir es `06-diagrama-casos-uso/Diagrama-Casos-Uso.drawio`; los archivos con sufijo `(2)` se mantienen como variantes preexistentes.

## 5. Declaración de autoría y reutilización

Declaro que los documentos de contexto identificados en la sección 2 se utilizaron como insumos del proyecto formativo. La comparación, selección metodológica, planificación, conciliación de alcance y consolidación de la matriz corresponden al trabajo individual de ajuste para esta evidencia. El diagrama original se conserva como insumo visual sin redibujo en esta revisión. Los artefactos de diseño compartidos de origen no se presentan como creación exclusiva del aprendiz.

## 6. Uso de inteligencia artificial

Se utilizó ChatGPT como apoyo para revisar consistencia documental, identificar discrepancias entre las fuentes, proponer correcciones a la matriz y a la documentación UML y preparar comprobaciones técnicas. No se cambió el archivo del diagrama ni sus exportaciones. El aprendiz debe revisar, aprobar y poder explicar cada decisión y cada cambio. La herramienta no realizó entrevistas ni obtuvo aprobación del instructor; tampoco se afirma que la solución esté implementada o validada con usuarios reales.

## 7. Control antes de publicar

- [x] Se verificó la existencia de fuente editable y exportaciones del diagrama.
- [x] Se revisó la matriz frente a los registros visibles del SRS y se registraron los IDs repetidos.
- [x] Se documentaron alcance, supuestos y propuestas de exclusión sin presentarlas como aprobaciones.
- [x] Se incluyeron tres o más ajustes concretos y enlaces a commits históricos verificables.
- [ ] El aprendiz revisa y aprueba esta versión de cierre.
- [ ] El aprendiz realiza un commit sustantivo el 27/11/2026 y lo publica antes del 28/11/2026 a las 6:00 a. m., para acreditar dos días de cambios sustantivos en la carpeta G1-P1.
- [ ] Se confirma en GitHub la fecha de push y que la rama no requiere force-push.

**Importante:** este paquete es una preparación local de correcciones. No se ha hecho commit ni push de esta versión desde esta revisión.

---

**SENA - ADSO - Ficha 3413974**  
**Proyecto:** Sistema Gestor de Ambulancias (SGA)  
**Producto:** G1-P1 - Plan de análisis y casos de uso

## 9. Conservación de diagramas

En esta corrección se modificaron documentos, matriz, README y conciliación de alcance. Los seis archivos originales de `06-diagrama-casos-uso/` se conservaron byte por byte; no se redibujaron, exportaron ni reorganizaron.
