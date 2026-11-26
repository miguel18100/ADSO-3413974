# A2 - Diseño preliminar del diagrama de clases

**Proyecto:** SIGMAVITAL - Sistema Gestor de Ambulancias (SGA)
**Evidencia:** G2-P1 Arquitectura
**Criterio:** A2
**Estado:** Diagrama elaborado, revisado y validado a nivel de diseño UML.

## 1. Objetivo

Diseñar un diagrama de clases UML que represente las principales responsabilidades del sistema SIGMAVITAL, sus atributos, operaciones, relaciones, multiplicidades y mecanismos de abstracción, tomando como base los requisitos seleccionados en A1 y los artefactos previos de análisis.

## 2. Criterios de diseño

- Incluir al menos ocho clases.
- Definir atributos con tipos de datos.
- Representar visibilidad de atributos y operaciones.
- Especificar operaciones con parámetros y tipos de retorno cuando corresponda.
- Definir multiplicidades en las asociaciones.
- Representar composición o agregación cuando exista una relación estructural justificable.
- Representar herencia o una interfaz con al menos dos implementaciones.
- Relacionar las clases con requisitos funcionales.
- Evitar responsabilidades duplicadas.
- Mantener cohesión y reducir acoplamiento.
- Evitar que una clase asuma responsabilidades de diferentes áreas funcionales sin justificación.

## 3. Fuente de diseño

Se reutilizan como fuentes de análisis:

- Matriz de requisitos y casos de uso de G1-P1.
- Modelo conceptual MD-01.
- Diagramas de actividad DA-01, DA-02 y DA-03.
- Evidencia de prototipo de G1.
- Documento A1 de G2-P1.

## 4. Validaciones realizadas

- [x] Se incluyen más de ocho clases.
- [x] Se definieron atributos tipados.
- [x] Se representó la visibilidad de atributos y operaciones.
- [x] Se incluyeron operaciones en las clases.
- [x] Se definieron multiplicidades en las relaciones representadas.
- [x] Se justificaron las composiciones propuestas.
- [x] Se incorporó la interfaz StrategyAsignacion con dos implementaciones.
- [x] Se documentó la trazabilidad de clases hacia requisitos funcionales.
- [x] Se revisaron las responsabilidades de las clases.
- [x] Se revisaron las decisiones de abstracción y asignación.
- [x] Se incorporó la asociación Paciente - Servicio con base en RF-29.
- [x] Se conserva el archivo editable PlantUML (.puml).
- [x] Se generó la representación PNG.
- [x] Se generó la representación SVG.
- [x] Se revisó visualmente el diagrama generado.

## 5. Artefactos asociados

- A2-Clases-Detalle-Parte1.md
- A2-Clases-Detalle-Parte2.md
- A2-Decision-Abstraccion.md
- A2-Decision-Paciente-Servicio.md
- A2-Diagrama-Clases.puml
- A2-Diagrama-Clases.png
- A2-Diagrama-Clases.svg
- A2-Propuesta-Clases.md
- A2-Relaciones-Multiplicidades.md
- A2-Strategy-Asignacion.md
- A2-Trazabilidad-Clases-Requisitos.md

## 6. Decisiones de diseño destacadas

### Estrategia de asignación

Se utiliza la abstracción StrategyAsignacion con implementaciones para asignación urgente y general. La estructura representa una propuesta de diseño UML y no implica que los algoritmos de asignación estén implementados.

### Asociación Paciente - Servicio

Se incorpora la asociación simple:

`Paciente "1" -- "0..*" Servicio : recibe atención`

La decisión se fundamenta en RF-29, que establece la vinculación de los datos básicos del paciente con el servicio prehospitalario. Se documenta como asociación simple, no composición, dado que el paciente mantiene su identidad independientemente de los servicios registrados.

La validación corresponde al diseño UML y no implica que la persistencia o el modelo físico de datos se encuentren implementados.

## 7. Alcance y limitaciones

El diagrama representa el diseño preliminar de arquitectura y clases de SIGMAVITAL. Las decisiones se encuentran documentadas y contrastadas con los requisitos seleccionados y los artefactos de análisis revisados.

La validación realizada corresponde al nivel de diseño UML. La implementación, persistencia, validación física de datos y comprobación de reglas operativas definitivas corresponden a etapas posteriores del desarrollo.

## 8. Estado

A2 cuenta con diagrama de clases elaborado, editable y exportado a PNG y SVG. Se revisaron las clases, relaciones, multiplicidades, composición, estrategia de asignación, trazabilidad y asociación Paciente - Servicio, manteniendo la coherencia documental con los requisitos funcionales seleccionados.
