## 5. Clases conceptuales y atributos

### 5.1 Solicitud

Representa la solicitud de atención que origina la gestión operativa del servicio de ambulancia.

| Atributo | Descripción |
|---|---|
| identificadorSolicitud | Identificador de la solicitud |
| fechaHoraSolicitud | Fecha y hora de registro |
| direccionOrigen | Ubicación donde se requiere el servicio |
| motivoSolicitud | Motivo reportado para la atención |
| prioridad | Nivel de prioridad asignado |
| estadoSolicitud | Estado de la solicitud |

### 5.2 Servicio

Representa la atención operativa de ambulancia asociada a una solicitud.

| Atributo | Descripción |
|---|---|
| identificadorServicio | Identificador del servicio |
| fechaHoraInicio | Fecha y hora de inicio |
| fechaHoraFinalizacion | Fecha y hora de finalización |
| estadoServicio | Estado operativo del servicio |
| observacionesCierre | Observaciones registradas al finalizar |

### 5.3 Paciente

Representa a la persona que recibe la atención durante el servicio.

| Atributo | Descripción |
|---|---|
| identificadorPaciente | Identificador del paciente |
| nombres | Nombres del paciente |
| documentoIdentidad | Documento de identificación |
| fechaNacimiento | Fecha de nacimiento |
| sexo | Dato registrado para identificación clínica |

### 5.4 Ambulancia

Representa el vehículo destinado a la prestación de servicios de atención.

| Atributo | Descripción |
|---|---|
| identificadorAmbulancia | Identificador de la ambulancia |
| placa | Placa del vehículo |
| tipoAmbulancia | Tipo o clasificación de ambulancia |
| estadoDisponibilidad | Estado de disponibilidad operativa |
| descripcion | Descripción o información complementaria |

### 5.5 Personal

Representa a los integrantes del equipo operativo que participan en la prestación del servicio.

| Atributo | Descripción |
|---|---|
| identificadorPersonal | Identificador del integrante |
| nombres | Nombres del integrante |
| documentoIdentidad | Documento de identificación |
| rolOperativo | Función desempeñada |
| estadoDisponibilidad | Estado de disponibilidad |

### 5.6 Asignación

Representa la asignación de recursos operativos a un servicio. Se propone como clase de asociación para registrar la participación de ambulancias y personal.

| Atributo | Descripción |
|---|---|
| identificadorAsignacion | Identificador de la asignación |
| fechaHoraAsignacion | Fecha y hora de asignación |
| estadoAsignacion | Estado de la asignación |
| observaciones | Observaciones de la asignación |

### 5.7 Intervención

Representa las acciones o procedimientos realizados durante la atención del paciente.

| Atributo | Descripción |
|---|---|
| identificadorIntervencion | Identificador de la intervención |
| fechaHoraIntervencion | Fecha y hora de registro |
| descripcion | Descripción de la intervención |
| observaciones | Observaciones asociadas |

### 5.8 Registro de cierre

Representa la información documental asociada al cierre del servicio.

| Atributo | Descripción |
|---|---|
| identificadorCierre | Identificador del registro de cierre |
| fechaHoraCierre | Fecha y hora de cierre |
| resumenAtencion | Resumen de la atención realizada |
| observacionesFinales | Observaciones finales |

### 5.9 Usuario

Representa a la persona que utiliza el sistema para gestionar las operaciones.

| Atributo | Descripción |
|---|---|
| identificadorUsuario | Identificador del usuario |
| nombreUsuario | Nombre de usuario |
| nombreCompleto | Nombre completo |
| rol | Rol dentro del sistema |
| estadoUsuario | Estado del usuario |

### 5.10 Disponibilidad de recurso

Representa la información de disponibilidad de un recurso operativo para la gestión de asignaciones.

| Atributo | Descripción |
|---|---|
| identificadorDisponibilidad | Identificador del registro |
| fechaHoraActualizacion | Fecha y hora de actualización |
| estadoDisponibilidad | Estado registrado |
| observaciones | Observaciones sobre la disponibilidad |
## 6. Asociaciones y multiplicidades

Las siguientes asociaciones representan las relaciones conceptuales propuestas entre las clases del modelo.

| Clase origen | Asociación | Clase destino | Multiplicidad origen | Multiplicidad destino | Descripción |
|---|---|---|---|---|---|
| Solicitud | Origina | Servicio | 1 | 0..1 | Una solicitud puede originar un servicio y un servicio se origina en una solicitud. |
| Servicio | Atiende | Paciente | 0..* | 1 | Un paciente puede recibir múltiples servicios y cada servicio se relaciona con un paciente. |
| Servicio | Tiene | Asignación | 1 | 1..* | Un servicio puede contar con una o varias asignaciones operativas. |
| Asignación | Vincula | Ambulancia | 0..* | 1 | Cada asignación vincula una ambulancia y una ambulancia puede participar en distintas asignaciones a través del tiempo. |
| Asignación | Vincula | Personal | 0..* | 1..* | Una asignación relaciona integrantes del personal con un servicio. |
| Servicio | Registra | Intervención | 1 | 0..* | Un servicio puede registrar varias intervenciones. |
| Servicio | Genera | Registro de cierre | 1 | 0..1 | Un servicio puede generar un registro de cierre. |
| Usuario | Gestiona | Solicitud | 1 | 0..* | Un usuario puede registrar o gestionar varias solicitudes. |
| Ambulancia | Consulta | Disponibilidad de recurso | 1 | 0..* | Una ambulancia puede contar con registros de disponibilidad a lo largo del tiempo. |
| Personal | Consulta | Disponibilidad de recurso | 1 | 0..* | Un integrante del personal puede contar con registros de disponibilidad a lo largo del tiempo. |

## 7. Consideraciones sobre las relaciones

- La relación entre Solicitud y Servicio permite representar el origen operativo de la atención.
- La relación entre Servicio y Paciente permite identificar a la persona atendida.
- Asignación se plantea como clase de asociación para representar la vinculación de recursos operativos con el servicio.
- La asignación permite representar la participación de una ambulancia y uno o varios integrantes del personal.
- Intervención permite registrar acciones efectuadas durante la atención.
- Registro de cierre representa el resultado documental del cierre operativo.
- Disponibilidad de recurso permite representar cambios de disponibilidad asociados a ambulancias y personal.
- Las multiplicidades propuestas son preliminares y deben revisarse frente a las reglas de negocio y los requerimientos consolidados.
## 8. Diagrama conceptual de dominio

La siguiente representación visual muestra las clases conceptuales propuestas, sus atributos y las relaciones entre los conceptos del dominio SIGMAVITAL.

```mermaid
classDiagram
    class Solicitud {
        identificadorSolicitud
        fechaHoraSolicitud
        direccionOrigen
        motivoSolicitud
        prioridad
        estadoSolicitud
    }

    class Servicio {
        identificadorServicio
        fechaHoraInicio
        fechaHoraFinalizacion
        estadoServicio
        observacionesCierre
    }

    class Paciente {
        identificadorPaciente
        nombres
        documentoIdentidad
        fechaNacimiento
        sexo
    }

    class Ambulancia {
        identificadorAmbulancia
        placa
        tipoAmbulancia
        estadoDisponibilidad
        descripcion
    }

    class Personal {
        identificadorPersonal
        nombres
        documentoIdentidad
        rolOperativo
        estadoDisponibilidad
    }

    class Asignacion {
        identificadorAsignacion
        fechaHoraAsignacion
        estadoAsignacion
        observaciones
    }

    class Intervencion {
        identificadorIntervencion
        fechaHoraIntervencion
        descripcion
        observaciones
    }

    class RegistroCierre {
        identificadorCierre
        fechaHoraCierre
        resumenAtencion
        observacionesFinales
    }

    class Usuario {
        identificadorUsuario
        nombreUsuario
        nombreCompleto
        rol
        estadoUsuario
    }

    class DisponibilidadRecurso {
        identificadorDisponibilidad
        fechaHoraActualizacion
        estadoDisponibilidad
        observaciones
    }

    Solicitud "1" --> "0..1" Servicio : origina
    Servicio "1" --> "1" Paciente : atiende
    Servicio "1" --> "1..*" Asignacion : tiene
    Asignacion "1" --> "1" Ambulancia : vincula
    Asignacion "1..*" --> "1" Personal : incluye
    Servicio "1" --> "0..*" Intervencion : registra
    Servicio "1" --> "0..1" RegistroCierre : genera
    Usuario "1" --> "0..*" Solicitud : gestiona
    Ambulancia "1" --> "0..*" DisponibilidadRecurso : registra
    Personal "1" --> "0..*" DisponibilidadRecurso : registra```

## 9. Generalización y clase de asociación

### 9.1 Clase de asociación: Asignación

Se propone la clase conceptual Asignación para representar la relación entre un servicio, una ambulancia y el personal operativo involucrado.

Esta clase permite representar información propia de la asignación, como la fecha y hora, el estado y las observaciones. La propuesta evita representar la asignación únicamente como una relación simple, debido a que constituye un evento operativo con información de negocio propia.

### 9.2 Generalización

En esta versión preliminar no se propone una jerarquía de generalización entre las clases. Los conceptos identificados se representan como clases independientes y sus relaciones se expresan mediante asociaciones.

La clase de asociación Asignación se considera suficiente para representar la relación de recursos operativos en el alcance seleccionado, sin introducir una jerarquía artificial de clases.

## 10. Verificación preliminar del modelo

| Criterio | Resultado | Evidencia |
|---|---|---|
| Se identifican al menos 8 clases conceptuales | Cumple | 10 clases documentadas |
| Las clases contienen atributos de negocio | Cumple | Secciones 5.1 a 5.10 |
| Se identifican asociaciones | Cumple | Sección 6 |
| Se documentan multiplicidades | Cumple | Sección 6 y diagrama |
| Se incluye una clase de asociación | Cumple | Asignación |
| Se evita incluir métodos | Cumple | Modelo conceptual |
| Se relaciona con los casos de uso críticos | Cumple preliminarmente | CU-08, CU-11 y CU-22 |
| Se documentan consideraciones del modelo | Cumple | Secciones 7 y 9 |
| Se declara el carácter preliminar | Cumple | Sección 1 |

## 11. Trazabilidad del modelo

| Elemento | Referencia |
|---|---|
| Requisito funcional de registro de solicitud | RF-12 |
| Caso de uso de registro de solicitud | CU-08 |
| Diagrama de actividad de registro | DA-01 |
| Requisito funcional de asignación | RF-17 / RF-18 |
| Caso de uso de asignación | CU-11 |
| Diagrama de actividad de asignación | DA-02 |
| Requisito funcional de cierre | RF-31 |
| Caso de uso de cierre | CU-22 |
| Diagrama de actividad de cierre | DA-03 |
| Modelo conceptual | MD-01 |
| Estado | Propuesta preliminar pendiente de validación |
