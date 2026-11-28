## 5. Clases conceptuales y atributos

### 5.1 Solicitud

Representa la solicitud de atenciÃ³n que origina la gestiÃ³n operativa del servicio de ambulancia.

| Atributo | DescripciÃ³n |
|---|---|
| identificadorSolicitud | Identificador de la solicitud |
| fechaHoraSolicitud | Fecha y hora de registro |
| direccionOrigen | UbicaciÃ³n donde se requiere el servicio |
| descripcion | Motivo reportado para la atenciÃ³n |
| prioridad | Nivel de prioridad asignado |
| estadoSolicitud | Estado de la solicitud |

### 5.2 Servicio

Representa la atenciÃ³n operativa de ambulancia asociada a una solicitud.

| Atributo | DescripciÃ³n |
|---|---|
| identificadorServicio | Identificador del servicio |
| fechaHoraInicio | Fecha y hora de inicio |
| fechaHoraFinalizacion | Fecha y hora de finalizaciÃ³n |
| estadoServicio | Estado operativo del servicio |
| observaciones | Observaciones registradas al finalizar |

### 5.3 Paciente

Representa a la persona que recibe la atención durante el servicio.

| Atributo | Descripción |
|---|---|
| identificadorPaciente | Identificador del paciente |
| nombres | Nombres del paciente |
| apellidos | Apellidos del paciente |
| documento | Documento de identificación |
| fechaNacimiento | Fecha de nacimiento |
| datosContacto | Información de contacto |

### 5.4 Ambulancia

Representa el vehículo destinado a la prestación de servicios de atención.

| Atributo | Descripción |
|---|---|
| identificadorAmbulancia | Identificador de la ambulancia |
| placa | Placa del vehículo |
| codigoInterno | Código interno de identificación |
| tipoAmbulancia | Tipo o clasificación de ambulancia |
| estadoOperativo | Estado de disponibilidad operativa |
| kilometraje | Kilometraje registrado |

### 5.5 Personal

Representa a los integrantes del equipo operativo que participan en la prestaciÃ³n del servicio.

| Atributo | DescripciÃ³n |
|---|---|
| identificadorPersonal | Identificador del integrante |
| nombres | Nombres del integrante |
| documento | Documento de identificaciÃ³n |
| cargo | FunciÃ³n desempeÃ±ada |
| estadoOperativo | Estado de disponibilidad |

### 5.6 AsignaciÃ³n

Representa la asignaciÃ³n operativa de una ambulancia a un servicio. Permite registrar informaciÃ³n propia del evento de asignaciÃ³n y relacionar la participaciÃ³n del personal mediante AsignacionPersonal.

| Atributo | DescripciÃ³n |
|---|---|
| identificadorAsignacion | Identificador de la asignaciÃ³n |
| fechaHoraAsignacion | Fecha y hora de asignaciÃ³n |
| estadoAsignacion | Estado de la asignaciÃ³n |
| observaciones | Observaciones de la asignaciÃ³n |

### 5.7 IntervenciÃ³n

Representa las acciones o procedimientos realizados durante la atenciÃ³n del paciente.

| Atributo | DescripciÃ³n |
|---|---|
| identificadorIntervencion | Identificador de la intervenciÃ³n |
| fechaHoraIntervencion | Fecha y hora de registro |
| descripcion | DescripciÃ³n de la intervenciÃ³n |
| observaciones | Observaciones asociadas |

### 5.8 Registro de cierre

Representa la informaciÃ³n documental asociada al cierre del servicio.

| Atributo | DescripciÃ³n |
|---|---|
| identificadorCierre | Identificador del registro de cierre |
| fechaHoraCierre | Fecha y hora de cierre |
| resumenAtencion | Resumen de la atenciÃ³n realizada |
| observacionesFinales | Observaciones finales |

### 5.9 Usuario

Representa a la persona que utiliza el sistema para gestionar las operaciones.

| Atributo | DescripciÃ³n |
|---|---|
| identificadorUsuario | Identificador del usuario |
| nombreUsuario | Nombre de usuario |
| nombreCompleto | Nombre completo |
| rol | Rol dentro del sistema |
| estadoUsuario | Estado del usuario |

### 5.10 AsignacionPersonal

Representa la participación de un integrante del personal en una asignación operativa. Esta clase de asociación permite registrar información propia de la participación.

| Atributo | Descripción |
|---|---|
| identificadorParticipacion | Identificador de la participación |
| rolEnServicio | Función desempeñada dentro de la asignación |
| fechaHoraVinculacion | Fecha y hora de vinculación del integrante |

## 6. Asociaciones y multiplicidades

Las siguientes asociaciones representan las relaciones conceptuales propuestas entre las clases del modelo.

| Clase origen | AsociaciÃ³n | Clase destino | Multiplicidad origen | Multiplicidad destino | DescripciÃ³n |
|---|---|---|---|---|---|
| Solicitud | Origina | Servicio | 1 | 0..1 | Una solicitud puede originar un servicio y un servicio se origina en una solicitud. |
| Servicio | Atiende | Paciente | 0..* | 1 | Un paciente puede recibir mÃºltiples servicios y cada servicio se relaciona con un paciente. |
| Servicio | Tiene | AsignaciÃ³n | 1 | 0..* | Un servicio puede contar con ninguna o varias asignaciones operativas. |
| AsignaciÃ³n | Vincula | Ambulancia | 0..* | 1 | Cada asignaciÃ³n vincula una ambulancia y una ambulancia puede participar en distintas asignaciones a travÃ©s del tiempo. |
| AsignaciÃ³n | Vincula | AsignacionPersonal | 1 | 1..* | Una asignaciÃ³n puede incluir uno o varios registros de participaciÃ³n del personal. |
| AsignacionPersonal | Vincula | Personal | 0..* | 1 | Cada registro de participaciÃ³n corresponde a un integrante del personal. |
| Servicio | Registra | IntervenciÃ³n | 1 | 0..* | Un servicio puede registrar varias intervenciones. |
| Servicio | Genera | Registro de cierre | 1 | 0..1 | Un servicio puede generar un registro de cierre. |
| Usuario | Gestiona | Solicitud | 1 | 0..* | Un usuario puede registrar o gestionar varias solicitudes. |


## 7. Consideraciones sobre las relaciones

- La relaciÃ³n entre Solicitud y Servicio permite representar el origen operativo de la atenciÃ³n.
- La relaciÃ³n entre Servicio y Paciente permite identificar a la persona atendida.
- AsignaciÃ³n representa la vinculaciÃ³n operativa de una ambulancia con un servicio y contiene informaciÃ³n propia del evento de asignaciÃ³n.
- La participaciÃ³n del personal se representa mediante AsignacionPersonal, asociada a AsignaciÃ³n y a Personal.
- IntervenciÃ³n permite registrar acciones efectuadas durante la atenciÃ³n.
- Registro de cierre representa el resultado documental del cierre operativo.
- La disponibilidad de ambulancias y personal se representa mediante estados y reglas operativas, sin incorporar una clase conceptual independiente de disponibilidad en este modelo.
- Las multiplicidades propuestas son preliminares y deben revisarse frente a las reglas de negocio y los requerimientos consolidados.
## 8. Diagrama conceptual de dominio

La siguiente representaciÃ³n visual muestra las clases conceptuales propuestas, sus atributos y las relaciones entre los conceptos del dominio SIGMAVITAL.

```mermaid
classDiagram
    class Solicitud {
        identificadorSolicitud
        fechaHoraSolicitud
        direccionOrigen
        descripcion
        prioridad
        estadoSolicitud
    }

    class Servicio {
        identificadorServicio
        fechaHoraInicio
        fechaHoraFinalizacion
        estadoServicio
        observaciones
    }

    class Paciente {
        identificadorPaciente
        nombres
        documento
        fechaNacimiento
        sexo
    }

    class Ambulancia {
        identificadorAmbulancia
        placa
        tipoAmbulancia
        estadoOperativo
        descripcion
    }

    class Personal {
        identificadorPersonal
        nombres
        documento
        cargo
        estadoOperativo
    }

    class Asignacion {
        identificadorAsignacion
        fechaHoraAsignacion
        estadoAsignacion
        observaciones
    }

    class AsignacionPersonal {
        identificadorParticipacion
        rolEnServicio
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



    Solicitud "1" --> "0..1" Servicio : origina
    Servicio "0..*" --> "1" Paciente : atiende
    Servicio "1" --> "0..*" Asignacion : tiene
    Asignacion "0..*" --> "1" Ambulancia : vincula
    Asignacion "1" --> "1..*" AsignacionPersonal : incluye
    AsignacionPersonal "0..*" --> "1" Personal : vincula
    Servicio "1" --> "0..*" Intervencion : registra
    Servicio "1" --> "0..1" RegistroCierre : genera
    Usuario "1" --> "0..*" Solicitud : gestiona

```

## 9. GeneralizaciÃ³n y clase de asociaciÃ³n

### 9.1 Clase de asociaciÃ³n: AsignacionPersonal

AsignacionPersonal representa la participaciÃ³n individual de un integrante del personal en una asignaciÃ³n operativa. Se plantea como clase de asociaciÃ³n entre AsignaciÃ³n y Personal, permitiendo registrar informaciÃ³n propia de la participaciÃ³n, sin establecer una relaciÃ³n directa simple entre ambas clases.

Sus atributos conceptuales, identificadorParticipacion, rolEnServicio y observaciones, permiten documentar las caracterÃ­sticas de la participaciÃ³n del personal dentro de una asignaciÃ³n.

### 9.2 GeneralizaciÃ³n

En esta versiÃ³n preliminar no se propone una jerarquÃ­a de generalizaciÃ³n entre las clases. Los conceptos identificados se representan como clases independientes y sus relaciones se expresan mediante asociaciones.

AsignaciÃ³n y AsignacionPersonal permiten representar la vinculaciÃ³n de la ambulancia y la participaciÃ³n del personal en el servicio, sin introducir una jerarquÃ­a artificial de clases.

## 10. VerificaciÃ³n preliminar del modelo

| Criterio | Resultado | Evidencia |
|---|---|---|
| Se identifican al menos 8 clases conceptuales | Cumple preliminarmente | 10 clases conceptuales, incluida AsignacionPersonal |
| Las clases contienen atributos de negocio | Cumple preliminarmente | Secciones 5.1 a 5.10 |
| Se identifican asociaciones | Cumple | SecciÃ³n 6 |
| Se documentan multiplicidades | Cumple | SecciÃ³n 6 y diagrama |
| Se incluye una clase de asociaciÃ³n | Cumple preliminarmente | AsignacionPersonal |
| Se evita incluir mÃ©todos | Cumple | Modelo conceptual |
| Se relaciona con los casos de uso crÃ­ticos | Cumple preliminarmente | CU-08, CU-11 y CU-22 |
| Se documentan consideraciones del modelo | Cumple | Secciones 7 y 9 |
| Se declara el carÃ¡cter preliminar | Cumple | SecciÃ³n 1 |

## 11. Trazabilidad del modelo

| Elemento | Referencia |
|---|---|
| Requisito funcional de registro de solicitud | RF-12 |
| Caso de uso de registro de solicitud | CU-08 |
| Diagrama de actividad de registro | DA-01 |
| Requisito funcional de asignaciÃ³n | RF-17 / RF-18 |
| Caso de uso de asignaciÃ³n | CU-11 |
| Diagrama de actividad de asignaciÃ³n | DA-02 |
| Requisito funcional de cierre | RF-31 |
| Caso de uso de cierre | CU-22 |
| Diagrama de actividad de cierre | DA-03 |
| Modelo conceptual | MD-01 |
| Estado | Propuesta preliminar pendiente de validaciÃ³n |













