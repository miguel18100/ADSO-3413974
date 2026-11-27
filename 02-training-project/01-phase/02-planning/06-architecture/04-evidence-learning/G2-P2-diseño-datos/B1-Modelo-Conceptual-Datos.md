# B1 - Modelo conceptual de datos de SIGMAVITAL

**Proyecto:** SIGMAVITAL  
**Ficha:** 3413974 - Análisis y Desarrollo de Software (ADSO)  
**Fase:** Diseño de datos - G2-P2  
**Artefacto:** B1 - Modelo conceptual de datos  
**Estado:** Propuesta conceptual de diseño

## 1. Objetivo

Definir el modelo conceptual de datos de SIGMAVITAL, identificando las entidades principales del sistema, sus atributos conceptuales, relaciones y cardinalidades. Este modelo representa la estructura de información necesaria para gestionar usuarios, ambulancias, personal, solicitudes, servicios, asignaciones, pacientes, intervenciones y cierres de servicio.

## 2. Alcance

El modelo conceptual contempla la gestión operativa de servicios prehospitalarios, incluyendo:

- Gestión de usuarios y roles.
- Registro y disponibilidad de ambulancias.
- Registro del personal operativo.
- Recepción y gestión de solicitudes.
- Asignación de ambulancias y personal.
- Información básica y minimizada de pacientes.
- Registro de intervenciones realizadas.
- Cierre y resumen de los servicios.

No pretende representar una historia clínica electrónica integral.

## 3. Entidades principales

### 3.1 Usuario
Representa a las personas que utilizan el sistema.

Atributos conceptuales:
- Identificador de usuario.
- Nombre.
- Correo electrónico.
- Estado.
- Fecha de creación.

### 3.2 Rol
Representa los perfiles de autorización dentro del sistema.

Atributos conceptuales:
- Identificador de rol.
- Nombre del rol.
- Descripción.

### 3.3 Ambulancia
Representa los vehículos disponibles para la prestación de servicios.

Atributos conceptuales:
- Identificador de ambulancia.
- Código o placa.
- Tipo.
- Estado operativo.
- Ubicación de referencia.

### 3.4 Personal
Representa a los integrantes del personal operativo.

Atributos conceptuales:
- Identificador de personal.
- Nombre.
- Identificación de referencia.
- Perfil operativo.
- Estado.
- Datos de contacto necesarios.

### 3.5 Solicitud
Representa una solicitud de atención prehospitalaria recibida por el sistema.

Atributos conceptuales:
- Identificador de solicitud.
- Fecha y hora de recepción.
- Ubicación del incidente.
- Nivel de prioridad.
- Descripción inicial.
- Estado de la solicitud.

### 3.6 Servicio
Representa la atención prehospitalaria asociada a una solicitud.

Atributos conceptuales:
- Identificador de servicio.
- Fecha y hora de inicio.
- Estado del servicio.
- Fecha y hora de finalización.
- Destino.

### 3.7 Asignacion
Representa la asignación de una ambulancia a un servicio.

Atributos conceptuales:
- Identificador de asignación.
- Fecha y hora de asignación.
- Estado.
- Observaciones de asignación.

### 3.8 AsignacionPersonal
Representa la vinculación del personal operativo a una asignación.

Atributos conceptuales:
- Identificador de asignación de personal.
- Función dentro del servicio.
- Fecha y hora de vinculación.

### 3.9 Paciente
Representa los datos mínimos necesarios de identificación y referencia del paciente atendido.

Atributos conceptuales:
- Identificador de paciente.
- Identificación de referencia.
- Nombre o identificación mínima requerida.
- Información básica necesaria para la atención.

Se aplica el principio de minimización de datos personales.

### 3.10 Intervencion
Representa las intervenciones o actuaciones realizadas por el personal durante la atención.

Atributos conceptuales:
- Identificador de intervención.
- Fecha y hora.
- Descripción de intervención.
- Observaciones.

### 3.11 RegistroCierre
Representa el resumen final del servicio prehospitalario.

Atributos conceptuales:
- Identificador del cierre.
- Fecha y hora del cierre.
- Resumen de condición.
- Destino.
- Observaciones finales.
- Responsable del cierre.

## 4. Relaciones y cardinalidades

| Relación | Cardinalidad | Descripción |
|---|---|---|
| Rol - Usuario | 1:N | Un rol puede estar asociado a varios usuarios; cada usuario tiene un rol asignado dentro del modelo inicial. |
| Solicitud - Servicio | 1:0..1 | Una solicitud puede originar un servicio; un servicio corresponde a una solicitud. |
| Servicio - Asignacion | 1:N | Un servicio puede registrar una o varias asignaciones a lo largo de su gestión. |
| Ambulancia - Asignacion | 1:N | Una ambulancia puede participar en diferentes asignaciones a lo largo del tiempo. |
| Asignacion - AsignacionPersonal | 1:N | Una asignación puede incluir varios integrantes del personal. |
| Personal - AsignacionPersonal | 1:N | Un integrante del personal puede participar en distintas asignaciones. |
| Servicio - Paciente | N:1 | En el modelo inicial, varios servicios pueden relacionarse con un paciente; cada servicio registra un paciente de referencia. |
| Servicio - Intervencion | 1:N | Un servicio puede tener varias intervenciones registradas. |
| Personal - Intervencion | 1:N | El personal puede registrar distintas intervenciones. |
| Servicio - RegistroCierre | 1:0..1 | Un servicio puede tener un único registro de cierre. |
| Usuario - RegistroCierre | 1:N | Un usuario autorizado puede registrar diferentes cierres. |

## 5. Tipos de relaciones

- **Uno a muchos (1:N):** Rol-Usuario, Servicio-Asignacion, Ambulancia-Asignacion, Asignacion-AsignacionPersonal, Personal-AsignacionPersonal, Servicio-Intervencion y Personal-Intervencion.
- **Uno a uno opcional (1:0..1):** Servicio-RegistroCierre y Solicitud-Servicio en el modelo inicial.
- **Muchos a uno (N:1):** Servicio-Paciente.
- Las relaciones de asignación de personal permiten resolver la participación de múltiples integrantes en una asignación y la participación de cada integrante en diferentes asignaciones a lo largo del tiempo.

## 6. Reglas conceptuales

1. Todo usuario debe estar asociado a un rol definido.
2. Una solicitud puede permanecer sin servicio mientras se encuentre pendiente.
3. Un servicio debe originarse en una solicitud registrada.
4. Las asignaciones deben asociarse a un servicio existente.
5. Una asignación debe identificar la ambulancia vinculada.
6. El personal se vincula a las asignaciones mediante la entidad AsignacionPersonal.
7. Las intervenciones deben estar asociadas a un servicio.
8. Las intervenciones deben identificar al responsable que las registra.
9. El cierre debe estar asociado a un servicio.
10. El cierre debe registrar el responsable autorizado.
11. Los datos de paciente deben limitarse a los necesarios para la operación.
12. Los estados de solicitud, asignación y servicio deben mantener consistencia durante el ciclo operativo.

## 7. Diagrama conceptual

El diagrama conceptual correspondiente deberá representar las once entidades, sus relaciones y cardinalidades, sin incorporar todavía detalles propios de la implementación física, como tipos de datos específicos del motor SQL, índices o instrucciones de creación de tablas.

## 8. Trazabilidad con P1

Este modelo se relaciona con los requisitos definidos en A1, el diseño de clases definido en A2, los componentes identificados en A5 y la arquitectura propuesta en A4.

Las entidades Usuario, Rol, Ambulancia, Personal, Solicitud, Servicio, Asignacion, AsignacionPersonal, Paciente, Intervencion y RegistroCierre mantienen correspondencia conceptual con las clases identificadas en el diseño previo.

## 9. Limitaciones y estado de validación

Este artefacto corresponde a un modelo conceptual de diseño. No constituye evidencia de una base de datos desplegada ni de operaciones SQL ejecutadas. La validación técnica, la transformación al modelo relacional y la implementación se documentarán en los artefactos posteriores de B2 a B5.

---
