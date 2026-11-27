# B1 – Modelo Conceptual de Datos SIGMAVITAL

**Proyecto:** Sistema Gestor de Ambulancias (SGA) – SIGMAVITAL
**Evidencia:** G2-P2 – Diseño de datos
**Nivel:** Modelo conceptual; no especifica aún tipos SQL ni detalles físicos.

## 1. Objetivo y alcance

Representar las entidades de negocio necesarias para registrar usuarios y roles, solicitudes, servicios, pacientes, recursos operativos, asignaciones, intervenciones y cierres. El modelo contiene once entidades y mantiene el principio de minimización de datos personales y de salud.

## 2. Convenciones de cardinalidad

Las multiplicidades se escriben como mínimo..máximo vistas desde el extremo indicado: `0..1` opcional única; `1..1` obligatoria única; `0..*` opcional múltiple; `1..*` una o varias. El verbo expresa el significado de la asociación y evita relaciones sin semántica.

## 3. Entidades y atributos conceptuales

| Entidad | Propósito | Atributos conceptuales principales |
|---|---|---|
| Rol | Agrupa permisos y responsabilidades. | Identificador de rol, nombre, descripción. |
| Usuario | Cuenta de acceso de una persona autorizada. | Identificador, nombre, correo, estado, fecha de creación. |
| Solicitud | Petición que inicia la gestión operativa. | Identificador, fecha de recepción, ubicación, prioridad, descripción, estado. |
| Servicio | Atención prehospitalaria originada por una solicitud. | Identificador, fecha de inicio, estado, fecha de finalización, destino. |
| Paciente | Persona atendida, con información mínima necesaria. | Identificador, identificación de referencia, nombre de referencia, información básica. |
| Ambulancia | Vehículo de transporte asistencial. | Identificador, placa, tipo, estado operativo, ubicación de referencia. |
| Personal | Integrante del equipo operativo. | Identificador, nombre, identificación de referencia, perfil operativo, estado, contacto. |
| Asignacion | Vinculación de una ambulancia con un servicio en un momento operativo. | Identificador, fecha, estado, observaciones. |
| AsignacionPersonal | Entidad asociativa que registra la participación del personal. | Identificador, función, fecha de vinculación. |
| Intervencion | Actuación registrada durante la atención. | Identificador, fecha/hora, descripción, observaciones. |
| RegistroCierre | Resumen documental del cierre de un servicio. | Identificador, fecha de cierre, resumen, destino, observaciones finales. |

## 4. Relaciones, verbos y cardinalidades mínimas/máximas

| Origen | Verbo | Destino | Participación del origen | Participación del destino | Regla de negocio |
|---|---|---|---:|---:|---|
| Rol | asigna | Usuario | Rol `0..*` | Usuario `1..1` | Un rol puede asignarse a varios usuarios; cada usuario tiene un rol. |
| Usuario | registra | Solicitud | Usuario `0..*` | Solicitud `1..1` | Un usuario puede registrar varias solicitudes; cada solicitud registra su responsable. |
| Solicitud | origina | Servicio | Solicitud `0..1` | Servicio `1..1` | Una solicitud puede estar pendiente o generar un servicio; cada servicio procede de una solicitud. |
| Paciente | recibe | Servicio | Paciente `0..*` | Servicio `1..1` | Un paciente puede recibir varios servicios; cada servicio referencia un paciente. |
| Servicio | recibe | Asignacion | Servicio `0..*` | Asignacion `1..1` | Un servicio puede pasar por varias asignaciones; cada asignación corresponde a un servicio. |
| Ambulancia | participa en | Asignacion | Ambulancia `0..*` | Asignacion `1..1` | Una ambulancia puede participar en distintas asignaciones a lo largo del tiempo; cada asignación usa una ambulancia. |
| Asignacion | incluye | AsignacionPersonal | Asignacion `1..*` | AsignacionPersonal `1..1` | Una asignación confirmada incluye al menos un vínculo de personal. |
| Personal | integra | AsignacionPersonal | Personal `0..*` | AsignacionPersonal `1..1` | Una persona puede integrar distintas asignaciones; cada vínculo identifica a una persona. |
| Servicio | registra | Intervencion | Servicio `0..*` | Intervencion `1..1` | Cada intervención pertenece a un servicio. |
| Personal | realiza | Intervencion | Personal `0..*` | Intervencion `1..1` | Cada intervención identifica a un responsable del equipo. |
| Servicio | documenta | RegistroCierre | Servicio `0..1` | RegistroCierre `1..1` | Un servicio puede no estar cerrado o tener un único cierre; el cierre corresponde a un servicio. |
| Usuario | registra | RegistroCierre | Usuario `0..*` | RegistroCierre `1..1` | Un usuario autorizado puede registrar cierres; cada cierre identifica a su responsable. |

## 5. Resolución de relaciones N:M

La relación entre `Asignacion` y `Personal` es N:M: una asignación puede incluir varias personas y cada persona puede participar en múltiples asignaciones a lo largo del tiempo. Se resuelve mediante la entidad asociativa `AsignacionPersonal`, que conserva `funcion` y `fecha_vinculacion`. La combinación de identificadores `id_asignacion` + `id_personal` debe ser única para impedir duplicar a una misma persona dentro de la misma asignación.

## 6. Reglas conceptuales

1. Cada usuario tiene asociado un rol.
2. Una solicitud puede permanecer sin servicio mientras se encuentra pendiente.
3. Un servicio debe originarse en una solicitud registrada.
4. Una asignación confirmada pertenece a un servicio y utiliza una ambulancia.
5. Una asignación debe registrar al menos un vínculo de personal antes de considerarse completa.
6. Una persona puede participar en varias asignaciones a lo largo del tiempo.
7. Toda intervención pertenece a un servicio y tiene un responsable.
8. Un servicio admite como máximo un registro de cierre.
9. El cierre identifica al usuario que lo registra y actualiza el estado del servicio.
10. Los datos del paciente se limitan a la información necesaria para la operación.

## 7. Diagrama conceptual

El archivo editable `B1-Diagrama-Conceptual.drawio` representa las once entidades y sus relaciones; `B1-Diagrama-Conceptual.dot` es la fuente de la exportación vectorial `B1-Diagrama-Conceptual.drawio.svg` y de la imagen `B1-Diagrama-Conceptual.drawio.png`. La tabla del apartado 4 es la referencia textual para leer los verbos y multiplicidades exactas.

## 8. Trazabilidad y limitaciones

El modelo se relaciona con A1 (requisitos), A2 (clases), A5 (componentes) y los artefactos G1-P2 MD-01/MER-01. Es un modelo conceptual de diseño, no evidencia de base de datos desplegada. La validación física se documenta en B2–B5. Las cardinalidades reflejan las reglas propuestas y requieren aprobación del responsable funcional antes de producción.
