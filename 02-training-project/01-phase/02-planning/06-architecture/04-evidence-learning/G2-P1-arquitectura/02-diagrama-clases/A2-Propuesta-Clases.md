# A2 - Propuesta inicial de clases SIGMAVITAL

## 1. Clases propuestas

| Clase | Responsabilidad | Requisitos relacionados |
|---|---|---|
| Usuario | Representar usuarios del sistema, identidad y estado de la cuenta. | RF-01, RF-03, RNF-03 |
| Rol | Representar los roles asignados a los usuarios. | RF-03, RNF-03 |
| Ambulancia | Representar ambulancias y su información operativa. | RF-05, RF-16, RF-17 |
| Personal | Representar al personal operativo. | RF-09, RF-16, RF-18 |
| Solicitud | Representar solicitudes de servicios de transporte asistencial. | RF-12, RF-17 |
| Servicio | Representar el servicio operativo derivado de una solicitud. | RF-20, RF-31 |
| Asignacion | Representar la asignación de ambulancia a un servicio. | RF-16, RF-17 |
| AsignacionPersonal | Representar la asociación del personal con una asignación. | RF-18 |
| Paciente | Representar los datos básicos del paciente asociados al servicio. | RF-29 |
| Intervencion | Representar las intervenciones registradas por el Paramédico TAM. | RF-30 |
| RegistroCierre | Representar la información de cierre del servicio. | RF-31 |

## 2. Consideraciones preliminares

- Usuario y Rol se modelarán de manera separada para facilitar el control de acceso.
- Solicitud y Servicio serán clases diferentes porque la solicitud representa la entrada del proceso y el servicio representa su ejecución operativa.
- Asignacion se encargará de relacionar un servicio con una ambulancia.
- AsignacionPersonal permitirá asociar uno o varios integrantes del personal a una asignación.
- Paciente almacenará únicamente los datos necesarios para el alcance operativo definido.
- Intervencion representará registros de actuaciones prehospitalarias, sin modelar una historia clínica electrónica completa.
- RegistroCierre será responsable de los datos del cierre del servicio.
- Las clases y relaciones son propuestas de diseño y deberán contrastarse con los requisitos y el modelo conceptual.

## 3. Abstracción propuesta

La propuesta inicial de interfaz Autenticable con UsuarioWeb y UsuarioOperativo fue descartada mediante la decisión de diseño A2-Decision-Abstraccion.md, al no identificarse una diferenciación de comportamiento suficientemente justificada.

La abstracción vigente para el diseño corresponde a la interfaz **EstrategiaAsignacion**, con dos implementaciones:

- EstrategiaAsignacionUrgente.
- EstrategiaAsignacionGeneral.

Esta alternativa aplica el patrón Strategy para encapsular criterios diferenciados de asignación de ambulancias. Su diseño se documenta en A2-Strategy-Asignacion.md y permanece sujeto a validación de las reglas operativas.

## 4. Desarrollo y validación del diseño

A partir de esta propuesta se desarrollaron y revisaron los siguientes elementos:

- Definición de atributos y tipos de datos.
- Representación de visibilidad.
- Definición de operaciones en las clases.
- Relaciones y multiplicidades.
- Composiciones justificadas a nivel de diseño.
- Abstracción Strategy con dos implementaciones.
- Trazabilidad de clases hacia requisitos funcionales.
- Diagrama UML editable mediante PlantUML.
- Exportación del diagrama a PNG y SVG.
- Revisión visual del diagrama.
- Incorporación de la asociación Paciente - Servicio, fundamentada en RF-29.

## 5. Estado

La propuesta inicial de clases fue desarrollada como base para el diseño UML A2. Las clases, relaciones, multiplicidades, abstracción, trazabilidad y diagrama fueron revisados y documentados.

La asociación Paciente - Servicio se representa como asociación simple, no composición, mediante la relación:

`Paciente "1" -- "0..*" Servicio : recibe atención`

Esta decisión se fundamenta en RF-29 y se documenta en A2-Decision-Paciente-Servicio.md y A2-Relaciones-Multiplicidades.md.

El diseño se encuentra validado a nivel UML. La implementación, persistencia y comprobación definitiva de reglas operativas corresponden a etapas posteriores del desarrollo.
