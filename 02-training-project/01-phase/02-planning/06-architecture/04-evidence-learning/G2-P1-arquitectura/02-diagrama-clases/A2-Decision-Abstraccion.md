# A2 - Decisión de diseño sobre abstracción

## Decisión

Se descarta provisionalmente la interfaz Autenticable con las implementaciones UsuarioWeb y UsuarioOperativo, debido a que ambas clases podrían representar variantes de acceso de un mismo usuario y no necesariamente comportamientos diferenciados que justifiquen una abstracción de diseño.

## Alternativa propuesta

Se evaluará una interfaz de estrategia de asignación de recursos, orientada a encapsular criterios de selección de ambulancias.

La propuesta contempla dos implementaciones diferenciadas:

- EstrategiaAsignacionUrgente: prioriza criterios operativos asociados a la atención urgente, sujeto a reglas que deberán definirse y validarse.
- EstrategiaAsignacionGeneral: aplica criterios de asignación general de recursos, sujeto a las reglas operativas definidas por el proyecto.

## Justificación

Esta alternativa busca representar un comportamiento variable del sistema mediante una abstracción con implementaciones concretas, favoreciendo la separación de responsabilidades y la extensibilidad.

No se afirma que estos criterios estén actualmente implementados ni validados. La estrategia definitiva deberá revisarse con los requisitos funcionales y las reglas de negocio existentes.

## Estado

Decisión preliminar pendiente de validar durante el desarrollo del diagrama de clases UML.
