# Plan de actividades - G1-P1 Plan de análisis

## 1. Objetivo

Organizar las actividades necesarias para completar el Producto 1 de la Guía de Aprendizaje 1 del Sistema Gestor de Ambulancias (SGA), haciendo explícitos responsables, prioridades, fechas, entregables y relación con la metodología Scrum seleccionada.

## 2. Alcance

Este plan cubre exclusivamente G1-P1: caracterización, comparación y selección metodológica, planificación, matriz requisito-caso de uso, diagrama UML, revisión y publicación. No incluye los artefactos del Producto 2.

## 3. Organización por iteraciones

- **Preparación previa al primer Sprint:** caracterización, comparación, selección y backlog de análisis.
- **Sprint 1 - Modelado funcional:** requisitos, actores, casos de uso, matriz y diagrama inicial.
- **Sprint 2 - Consolidación:** verificación cruzada, ajustes, README y publicación.

Las iteraciones representan la organización propuesta del trabajo. Las fechas indicadas corresponden al cronograma de G1-P1 actualizado al cierre documental del 24/11/2026.

## 4. Plan priorizado de actividades

| ID | Sprint | Prioridad | Actividad | Responsable | Fecha objetivo | Entregable verificable | Estado |
|---|---|---|---|---|---|---|---|
| A01 | Preparación | Alta | Revisar el alcance y las fuentes del proyecto SGA | Líder de análisis / Scrum Master | 22/11/2026 | Inventario de fuentes, alcance y supuestos | Completada |
| A02 | Preparación | Alta | Caracterizar tipo de solución, equipo, estabilidad y disponibilidad de usuarios | Líder de análisis / Scrum Master | 22/11/2026 | Caracterización de cuatro aspectos | Completada |
| A03 | Preparación | Media | Comparar RUP, Scrum, XP y RAD contra las características del SGA | Líder de análisis / Scrum Master | 22-23/11/2026 | Matriz de comparación ponderada | Completada |
| A04 | Preparación | Alta | Seleccionar y justificar el marco de trabajo | Líder de análisis / Scrum Master | 23/11/2026 | Selección de Scrum sustentada en la comparación | Completada |
| A05 | Preparación | Alta | Definir backlog, iteraciones y criterios de cierre para G1-P1 | Líder de análisis / Scrum Master | 23/11/2026 | Plan priorizado de actividades | Completada |
| A06 | Sprint 1 | Alta | Consolidar requisitos funcionales y no funcionales del alcance de ambulancias | Líder de análisis, con revisión del equipo SGA | 23-24/11/2026 | Inventario de 31 RF consolidados, complemento trazado del SRS (secciones 4.6, 4.7 y 4.8), tres RF derivados de casos de uso SRS §6.2 y 14 RNF preliminares y reglas de negocio | Completada |
| A07 | Sprint 1 | Alta | Identificar actores y agrupar objetivos de usuario sin duplicar operaciones CRUD | Líder de análisis | 24/11/2026 | Catálogo de 22 casos de uso alineado con los RF y perfiles del SRS | Completada |
| A08 | Sprint 1 | Alta | Relacionar cada requisito funcional con uno o más casos de uso | Líder de análisis; revisión QA/Tester | 24/11/2026 | Matriz de trazabilidad RF-CU con cobertura calculada | Completada |
| A09 | Sprint 1 | Alta | Elaborar el diagrama UML con frontera, actores y relaciones justificadas | Líder de análisis | 24/11/2026 | Fuente editable y exportación PNG/SVG del diagrama | Completada |
| A10 | Sprint 2 | Alta | Verificar coherencia entre caracterización, comparación, plan, matriz y diagrama | Líder de análisis y QA/Tester | 24/11/2026 | Lista de verificación de G1-P1 y correcciones incorporadas | Completada |
| A11 | Sprint 2 | Alta | Completar README, comprobar enlaces y publicar la revisión final | Autor de la evidencia (`miguel18100`) | 24/11/2026 | README de reutilización, verificación de enlaces y carpeta G1-P1 publicada | Pendiente de publicar esta revisión |
| A12 | Sprint 2 | Alta | Conciliar los requisitos del SRS que corresponden a auditoría y novedades y registrar los módulos con alcance pendiente | Líder de análisis, con revisión del equipo SGA | 24/11/2026 | Matriz complementaria de trazabilidad SRS y acta documental de asuntos pendientes | Completada |
| A13 | Sprint 2 | Alta | Separar los perfiles Paramédico TAB y Paramédico TAM y sincronizar matriz, catálogo y diagrama | Líder de análisis y QA/Tester | 24/11/2026 | Matriz y diagrama con cinco perfiles de usuario y 22 casos de uso consistentes | Completada |

## 5. Criterios de cierre (Definition of Done)

La evidencia G1-P1 se considera lista para revisión cuando:

1. La caracterización documenta explícitamente los cuatro aspectos exigidos por C1.
2. Se comparan al menos tres metodologías con criterios derivados de esas características y se justifica una selección.
3. Cada actividad del plan tiene prioridad, responsable, fecha y entregable, y las actividades se organizan de manera coherente con Scrum.
4. La matriz distingue RF de RNF y cada RF del alcance se relaciona con al menos un caso de uso o cuenta con una justificación de exclusión.
5. El diagrama contiene al menos ocho casos de uso, dos actores primarios, frontera, asociaciones y relaciones `include`/`extend` con dirección y justificación correctas; incluye CU-19 para documentos y protocolos operativos y CU-20 a CU-22 para registro de paciente, intervenciones TAM y cierre; su catálogo, actores y trazabilidad coinciden con la matriz.
6. Se entregan tanto la fuente editable como la imagen exportada del diagrama.
7. El README informa reutilización, ajustes, commits, autoría y uso de IA.

## 6. Seguimiento y responsabilidades

El líder de análisis / Scrum Master consolida el backlog y responde por la planificación documental. Los perfiles de desarrollo aportan conocimiento de los módulos y reglas del SGA; el rol QA/Tester apoya la revisión de consistencia entre requisitos, matriz y modelos. La disponibilidad de usuarios externos no se considera continua: las preguntas de negocio deben acumularse y validarse en sesiones programadas.

## 7. Consideraciones

- Las fechas son las del cronograma de trabajo de G1-P1 y se actualizaron para reflejar que los artefactos están elaborados al cierre del 24/11/2026.
- Los responsables se expresan por rol; el README identifica al autor individual de los ajustes que se entregan.
- La documentación describe análisis preliminar. No afirma implementación, pruebas funcionales ni validación institucional no demostradas en las fuentes.
- Las actividades y los artefactos de Producto 2 se mantienen fuera del alcance de este plan.

## 8. Declaración de uso de inteligencia artificial

Se utilizó inteligencia artificial generativa como apoyo para estructurar y revisar la planificación, proponer una secuencia de actividades y mejorar la redacción. El aprendiz debe verificar el contenido, confirmar responsables y fechas reales, y estar en capacidad de explicar las decisiones del plan.
