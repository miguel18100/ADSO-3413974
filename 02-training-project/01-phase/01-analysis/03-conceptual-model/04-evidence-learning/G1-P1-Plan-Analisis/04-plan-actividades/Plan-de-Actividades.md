# Plan de actividades - G1-P1 Plan de análisis

## 1. Objetivo

Organizar las actividades necesarias para completar el Producto 1 de la Guía de Aprendizaje 1 del Sistema Gestor de Ambulancias (SGA), haciendo explícitos responsables, prioridades, fechas, entregables verificables y relación con el marco de trabajo Scrum seleccionado.

## 2. Alcance

Este plan cubre exclusivamente G1-P1: caracterización, comparación y selección metodológica, planificación, matriz requisito-caso de uso, diagrama UML, conciliación documental de alcance, revisión y publicación. No incluye los artefactos del Producto 2.

## 3. Organización por iteraciones

- **Preparación:** caracterización, comparación, selección y backlog de análisis.
- **Sprint 1 - Modelado funcional:** requisitos, actores, casos de uso, matriz y diagrama inicial.
- **Sprint 2 - Consolidación y verificación:** conciliación del SRS, correcciones UML, revisión cruzada, README y publicación.

Las iteraciones describen la organización propuesta del trabajo. Las fechas son las del cronograma de G1-P1 y de las correcciones documentales preparadas para revisión el 27/11/2026. El estado «pendiente de publicación» significa que la versión de cierre todavía debe ser aprobada por el aprendiz y publicada antes del vencimiento.

## 4. Plan priorizado de actividades

| ID | Sprint | Prioridad | Actividad | Responsable | Fecha objetivo | Entregable verificable | Estado |
|---|---|---|---|---|---|---|---|
| A01 | Preparación | Alta | Revisar el alcance y las fuentes del proyecto SGA | Aprendiz responsable de G1-P1 | 22/11/2026 | Inventario de fuentes, alcance y supuestos | Completada |
| A02 | Preparación | Alta | Caracterizar tipo de solución, equipo, estabilidad y disponibilidad de usuarios | Aprendiz responsable de G1-P1 | 22/11/2026 | Caracterización de los cuatro aspectos | Completada |
| A03 | Preparación | Media | Comparar RUP, Scrum, XP y RAD contra las características del SGA | Aprendiz responsable de G1-P1 | 22-23/11/2026 | Matriz de comparación ponderada | Completada |
| A04 | Preparación | Alta | Seleccionar y justificar el marco de trabajo | Aprendiz responsable de G1-P1 | 23/11/2026 | Selección de Scrum sustentada en la comparación | Completada |
| A05 | Preparación | Alta | Definir backlog, iteraciones y criterios de cierre para G1-P1 | Aprendiz responsable de G1-P1 | 23/11/2026 | Plan priorizado de actividades | Completada |
| A06 | Sprint 1 | Alta | Consolidar requisitos funcionales y no funcionales del alcance de ambulancias | Aprendiz responsable; consulta de reglas con el equipo SGA | 23-24/11/2026 | Línea base de 31 RF, 14 RNF preliminares y 15 reglas de negocio; complemento de 69 registros SRS en §§4.6-4.8 | Completada |
| A07 | Sprint 1 | Alta | Identificar actores y agrupar objetivos sin duplicar operaciones CRUD | Aprendiz responsable de G1-P1 | 24/11/2026 | Catálogo de 22 casos de uso, cinco perfiles concretos y dos actores abstractos | Completada |
| A08 | Sprint 1 | Alta | Relacionar cada requisito funcional con uno o más casos de uso | Aprendiz responsable de G1-P1; revisión QA/Tester | 24/11/2026 | Matriz RF-CU con cobertura de la línea base calculada | Completada |
| A09 | Sprint 1 | Alta | Elaborar el diagrama UML con frontera, actores y relaciones justificadas | Aprendiz responsable de G1-P1 | 24/11/2026 | Fuente editable y exportaciones PNG/SVG | Completada; corregida en revisión de cierre |
| A10 | Sprint 2 | Alta | Verificar coherencia entre caracterización, comparación, plan, matriz y diagrama | Aprendiz responsable; revisión cruzada propuesta con QA/Tester | 24/11/2026 | Lista de verificación y correcciones incorporadas | Completada |
| A11 | Sprint 2 | Alta | Completar README, comprobar enlaces y publicar la revisión final | Autor de la evidencia (`miguel18100`) | 27/11/2026 | README de reutilización, enlaces a commits verificables y carpeta publicada | Pendiente de revisión, commit y push |
| A12 | Sprint 2 | Alta | Conciliar los registros de SRS 4.1-4.5 que no corresponden al alcance operativo documentado | Aprendiz responsable de G1-P1, con revisión del equipo/instructor | 27/11/2026 | Conciliación de los 44 registros con propuesta de exclusión individual | Completada en borrador; requiere aceptación de alcance |
| A13 | Sprint 2 | Alta | Separar Paramédico TAB y Paramédico TAM y sincronizar matriz, catálogo y diagrama | Aprendiz responsable; revisión cruzada propuesta con QA/Tester | 24/11/2026 | Matriz y diagrama con roles y casos consistentes | Completada |
| A14 | Sprint 2 | Alta | Completar la trazabilidad del módulo de novedades 4.8 | Aprendiz responsable de G1-P1 | 27/11/2026 | 28 registros 4.8 trazados; incorporación de RF-77 (dos apariciones), RF-78 y RF-80 a RF-88 | Completada en esta revisión |
| A15 | Sprint 2 | Alta | Corregir relaciones UML y asociaciones de actores | Aprendiz responsable; revisión cruzada propuesta con QA/Tester | 27/11/2026 | `include` CU-11→CU-07, `extend` CU-14→CU-13, generalizaciones y asociaciones por rol justificadas | Completada en esta revisión |
| A16 | Sprint 2 | Alta | Validar estructura, enlaces, exportaciones y porcentaje prepublicación | Autor de la evidencia (`miguel18100`) | 27/11/2026 | Auditoría prepublicación G1-P1, lista de comprobación y cálculo ponderado | Preparada para revisión antes del push |

## 5. Criterios de cierre (Definition of Done)

1. La caracterización documenta los cuatro aspectos exigidos por C1 y distingue datos acreditados de supuestos.
2. Se comparan al menos tres metodologías con criterios derivados de esas características y se justifica la selección.
3. Cada actividad del plan tiene prioridad, responsable, fecha y entregable; la secuencia es coherente con Scrum.
4. La matriz distingue RF de RNF, mapea los 31 RF de la línea base y presenta el tratamiento individual de los 113 registros del §4 del SRS (69 trazados y 44 propuestas de exclusión por alcance).
5. El diagrama contiene al menos ocho casos, dos actores primarios, frontera, asociaciones correctas, `include`, `extend` y generalizaciones con dirección y justificación correctas.
6. Las cinco perfiles concretos se conectan solo a los casos que les corresponden; las generalizaciones no conceden permisos administrativos a personal de campo.
7. Se entregan fuente editable e imagen exportada legible y coherentes entre sí.
8. El README informa reutilización, tres o más ajustes con enlaces a commits existentes, autoría y uso de IA.
9. Los cambios de cierre se publican en GitHub con commits sustantivos en al menos dos días calendario distintos antes del 28/11/2026 a las 6:00 a. m.; la versión local sin push no cuenta como entrega.

## 6. Seguimiento y responsabilidades

El aprendiz responsable de G1-P1 consolida el backlog y responde por la planificación de esta evidencia. La asignación formal de Product Owner, Scrum Master y QA/Tester deberá acordarse por el equipo antes de iniciar los Sprints; esta evidencia no afirma que esos cargos ya estén designados. La disponibilidad de usuarios externos no se considera continua: las preguntas de negocio deben acumularse y validarse en sesiones programadas.

## 7. Consideraciones y límites

- La documentación describe análisis preliminar; no afirma implementación, pruebas funcionales ni validación institucional no demostradas.
- Los 44 registros de SRS 4.1-4.5 están preservados con una propuesta de exclusión individual; su aceptación final corresponde al instructor/equipo.
- Los 69 registros de 4.6-4.8 están trazados en la matriz; la numeración duplicada del SRS se conserva tal como aparece en la fuente.
- Las actividades y artefactos de Producto 2 permanecen fuera del alcance de este plan.

## 8. Declaración de uso de inteligencia artificial

Se utilizó inteligencia artificial generativa como apoyo para estructurar y revisar la planificación, conciliar las fuentes, comprobar consistencia entre la matriz y el diagrama y mejorar la redacción. El aprendiz debe revisar el contenido, confirmar el alcance con el instructor/equipo y estar en capacidad de explicar cada decisión. La IA no se presenta como fuente de aprobación institucional ni de validación con usuarios reales.
