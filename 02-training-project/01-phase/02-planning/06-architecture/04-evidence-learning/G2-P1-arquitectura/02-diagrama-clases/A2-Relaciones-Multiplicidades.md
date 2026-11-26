# A2 - Relaciones y multiplicidades propuestas

## 1. Relaciones

| Relación | Multiplicidad | Justificación |
|---|---|---|
| Usuario - Rol | Usuario 0..* / Rol 0..* | Los usuarios pueden tener roles y un rol puede asignarse a múltiples usuarios. La relación deberá modelarse mediante asociación o entidad intermedia si se requiere representar datos de asignación. |
| Usuario - Solicitud | Usuario 1 / Solicitud 0..* | Un usuario autorizado registra solicitudes y una solicitud conserva su responsable de registro. |
| Solicitud - Servicio | Solicitud 1 / Servicio 0..1 | Una solicitud puede generar un servicio o permanecer sin servicio. Cada servicio deriva de una solicitud. |
| Paciente - Servicio | Paciente 1 / Servicio 0..* | Un paciente puede estar asociado a múltiples servicios a lo largo del tiempo y cada servicio se relaciona con un paciente, conforme a RF-29. |
| Servicio - Asignacion | Servicio 1 / Asignacion 0..* | Un servicio puede registrar asignaciones sucesivas o históricas. Cada asignación pertenece a un servicio. |
| Ambulancia - Asignacion | Ambulancia 1 / Asignacion 0..* | Una ambulancia puede aparecer en múltiples asignaciones históricas. Cada asignación referencia una ambulancia. |
| Asignacion - AsignacionPersonal | Asignacion 1 / AsignacionPersonal 1..* | Una asignación debe contar con personal asociado conforme a las reglas operativas. |
| Personal - AsignacionPersonal | Personal 1 / AsignacionPersonal 0..* | El personal puede participar en múltiples asignaciones históricas. |
| Servicio - Intervencion | Servicio 1 / Intervencion 0..* | Un servicio puede tener múltiples intervenciones registradas. |
| Servicio - RegistroCierre | Servicio 1 / RegistroCierre 0..1 | El servicio puede tener un registro de cierre, que se crea al finalizar. |
| Usuario - RegistroCierre | Usuario 1 / RegistroCierre 0..* | Un usuario autorizado registra múltiples cierres a lo largo del tiempo. |

## 2. Relaciones estructurales

### Composición propuesta

Servicio - Intervencion:

Se propone composición porque las intervenciones se contextualizan dentro de un servicio y su existencia funcional depende de este. Esta decisión deberá contrastarse con las políticas de conservación de registros y el modelo de persistencia.

Servicio - RegistroCierre:

Se propone composición conceptual porque el registro de cierre pertenece al servicio que documenta. La conservación y eliminación real de datos deberá respetar las políticas de retención.

Asignacion - AsignacionPersonal:

Se propone composición porque las asociaciones de personal constituyen elementos del registro de asignación.

### Asociación simple

Paciente - Servicio:

Se establece una asociación simple, no composición, debido a que el paciente mantiene su identidad independientemente de los servicios registrados. La relación responde a RF-29 y representa que un paciente puede recibir atención mediante múltiples servicios a lo largo del tiempo.

## 3. Consideraciones

- Las multiplicidades representan una propuesta de diseño UML y deberán contrastarse con las reglas de negocio definitivas.
- La asociación Paciente - Servicio se incorpora al diseño en concordancia con RF-29.
- Las asignaciones históricas no deben interpretarse automáticamente como disponibilidad actual.
- La disponibilidad debe calcularse mediante reglas operativas y estados consistentes.
- La asociación Usuario-Rol podría requerir una clase intermedia en el modelo detallado si se necesitan atributos propios de la asignación.
- Las relaciones deberán verificarse contra el modelo conceptual MER-01 y el alcance funcional.

## 4. Estado

Documento preliminar de relaciones para el diagrama de clases UML A2, actualizado con la asociación Paciente - Servicio respaldada por RF-29.
