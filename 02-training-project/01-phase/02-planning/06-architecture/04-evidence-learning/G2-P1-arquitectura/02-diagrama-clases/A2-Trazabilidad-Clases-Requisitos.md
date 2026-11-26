# A2 - Trazabilidad de Clases a Requisitos

**Proyecto:** SIGMAVITAL
**Evidencia:** G2-P1 - Diseño de arquitectura y clases
**Estado:** Propuesta preliminar validada a nivel de diseño

| Clase | Requisitos funcionales relacionados | Justificación |
|---|---|---|
| Usuario | RF-01, RF-03 | Autenticación, gestión de usuarios y datos de acceso. |
| Rol | RF-03 | Gestión de roles y permisos asociados a usuarios. |
| Ambulancia | RF-05, RF-06, RF-16, RF-17 | Gestión de ambulancias, estado operativo, disponibilidad y asignación. |
| Personal | RF-09, RF-10, RF-11, RF-18 | Gestión del personal operativo, perfiles y participación en servicios. |
| Solicitud | RF-12, RF-13, RF-14, RF-15 | Registro, clasificación, actualización y consulta de solicitudes. |
| Servicio | RF-20, RF-31 | Gestión del estado del servicio y su finalización. |
| Asignacion | RF-16, RF-17, RF-19 | Disponibilidad, asignación de ambulancias y consulta de asignaciones. |
| AsignacionPersonal | RF-18 | Asociación del personal operativo a una asignación. |
| Paciente | RF-29 | Registro y consulta de datos básicos del paciente vinculados al servicio de atención. |
| Intervencion | RF-30 | Registro de intervenciones realizadas durante la atención. |
| RegistroCierre | RF-31 | Consolidación de la información de cierre del servicio. |
| EstrategiaAsignacion | RF-16, RF-17 | Abstracción para seleccionar y evaluar ambulancias según criterios de asignación. |
| EstrategiaAsignacionUrgente | RF-16, RF-17 | Implementación de criterios de selección para situaciones urgentes. |
| EstrategiaAsignacionGeneral | RF-16, RF-17 | Implementación de criterios de selección para asignaciones generales. |

## Observaciones de trazabilidad

- La trazabilidad documenta la correspondencia propuesta entre clases y requisitos funcionales a nivel de diseño. Su cobertura integral deberá verificarse posteriormente frente a la matriz oficial de requisitos y la trazabilidad global del proyecto.
- Las estrategias de asignación representan una propuesta de diseño y no implican que los algoritmos estén implementados.
- La asociación Paciente - Servicio se incorpora al diagrama UML A2 y se respalda en RF-29, que establece la vinculación de los datos básicos del paciente con el servicio prehospitalario.
- La asociación Paciente - Servicio se modela como relación simple, no como composición, dado que el paciente mantiene su identidad independientemente de los servicios registrados.
- La trazabilidad no reemplaza la matriz completa de requisitos ni el artefacto A7 de trazabilidad integral.

## Decisión validada a nivel de diseño

Se establece la asociación entre `Paciente` y `Servicio` con la siguiente multiplicidad UML:

`Paciente "1" -- "0..*" Servicio : recibe atención`

Esta decisión se fundamenta en RF-29 y se documenta adicionalmente en A2-Decision-Paciente-Servicio.md y A2-Relaciones-Multiplicidades.md.

La validación corresponde al diseño UML y no implica que la persistencia o el modelo físico de datos se encuentren implementados.

## Estado

Trazabilidad preliminar de clases a requisitos actualizada y coherente con la asociación Paciente - Servicio incorporada al diagrama de clases A2.

