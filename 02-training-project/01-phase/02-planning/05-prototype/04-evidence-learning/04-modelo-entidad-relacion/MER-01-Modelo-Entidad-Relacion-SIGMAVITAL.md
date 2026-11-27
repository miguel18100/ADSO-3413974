# MER-01 – Modelo Entidad-Relación SIGMAVITAL

## 1. Identificación del artefacto

- **Proyecto:** Sistema Gestor de Ambulancias (SGA) – SIGMAVITAL.
- **Fase:** G1-P2 – Actividad 05: Prototipo.
- **Artefacto:** MER-01 – Modelo Entidad-Relación.
- **Versión:** 1.0 – Diseño preliminar.
- **Fuente:** Modelo conceptual MD-01 y artefactos de G1-P1.
- **Notación:** Modelo entidad-relación con representación de cardinalidades tipo Crow's Foot.

## 2. Objetivo

Representar la estructura de datos conceptual y lógica preliminar del Sistema Gestor de Ambulancias SIGMAVITAL, identificando entidades, atributos, identificadores, relaciones, cardinalidades y restricciones de participación necesarias para soportar los procesos de registro de solicitudes, asignación de recursos, seguimiento de servicios y cierre de atención.

Este modelo se deriva del modelo conceptual de dominio MD-01. Su estructura se considera preliminar y requiere revisión antes de definir el esquema físico definitivo de la base de datos.

## 3. Convenciones

- **PK:** Clave primaria.
- **FK:** Clave foránea.
- **UK:** Clave única.
- **1:** Una instancia.
- **N:** Varias instancias.
- **0:** Participación opcional.
- **1:** Participación obligatoria.

Se emplea una representación de relaciones mediante cardinalidades, identificadores y claves foráneas.

## 4. Entidades identificadas

### 4.1 SOLICITUD

| Atributo | Descripción |
|---|---|
| solicitud_id (PK) | Identificador de la solicitud |
| fecha_hora_solicitud | Fecha y hora de registro |
| direccion_origen | Ubicación del incidente |
| descripcion | Descripción de la solicitud |
| prioridad | Nivel de prioridad |
| estado | Estado de la solicitud |
| usuario_id (FK) | Usuario que registra la solicitud |

### 4.2 SERVICIO

| Atributo | Descripción |
|---|---|
| servicio_id (PK) | Identificador del servicio |
| fecha_hora_inicio | Inicio del servicio |
| fecha_hora_fin | Finalización del servicio |
| estado | Estado operativo del servicio |
| observaciones | Observaciones generales |
| solicitud_id (FK) | Solicitud asociada |

### 4.3 PACIENTE

| Atributo | Descripción |
|---|---|
| paciente_id (PK) | Identificador del paciente |
| nombres | Nombres del paciente |
| apellidos | Apellidos del paciente |
| documento | Identificación del paciente |
| fecha_nacimiento | Fecha de nacimiento |
| datos_contacto | Información de contacto |

### 4.4 AMBULANCIA

| Atributo | Descripción |
|---|---|
| ambulancia_id (PK) | Identificador de la ambulancia |
| placa (UK) | Placa del vehículo |
| codigo_interno | Código interno |
| tipo_ambulancia | Clasificación de ambulancia |
| estado_operativo | Estado operativo |
| kilometraje | Kilometraje registrado |

### 4.5 PERSONAL

| Atributo | Descripción |
|---|---|
| personal_id (PK) | Identificador del integrante |
| documento (UK) | Documento de identificación |
| nombres | Nombres |
| apellidos | Apellidos |
| cargo | Cargo operativo |
| estado | Estado del personal |

### 4.6 ASIGNACION

| Atributo | Descripción |
|---|---|
| asignacion_id (PK) | Identificador de la asignación |
| servicio_id (FK) | Servicio asignado |
| ambulancia_id (FK) | Ambulancia asignada |
| fecha_hora_asignacion | Fecha y hora de asignación |
| estado_asignacion | Estado de la asignación |
| observaciones | Observaciones de asignación |

### 4.7 ASIGNACION_PERSONAL

| Atributo | Descripción |
|---|---|
| asignacion_personal_id (PK) | Identificador del vínculo |
| asignacion_id (FK) | Asignación relacionada |
| personal_id (FK) | Personal asignado |
| rol_en_servicio | Rol desempeñado |
| fecha_hora_vinculacion | Fecha de vinculación |

### 4.8 INTERVENCION

| Atributo | Descripción |
|---|---|
| intervencion_id (PK) | Identificador de intervención |
| servicio_id (FK) | Servicio relacionado |
| fecha_hora_intervencion | Fecha y hora |
| descripcion | Descripción de intervención |
| observaciones | Observaciones adicionales |

### 4.9 REGISTRO_CIERRE

| Atributo | Descripción |
|---|---|
| registro_cierre_id (PK) | Identificador del cierre |
| servicio_id (FK, UK) | Servicio cerrado |
| fecha_hora_cierre | Fecha y hora del cierre |
| resumen_atencion | Resumen de atención |
| observaciones_finales | Observaciones de cierre |
### 4.10 USUARIO

| Atributo | Descripción |
|---|---|
| usuario_id (PK) | Identificador del usuario |
| nombre_usuario (UK) | Nombre de acceso |
| nombre_completo | Nombre del usuario |
| rol | Rol en el sistema |
| estado | Estado de la cuenta |

## 5. Diagrama entidad-relación

```mermaid
erDiagram

    USUARIO ||--o{ SOLICITUD : registra
    SOLICITUD ||--o| SERVICIO : origina
    PACIENTE ||--o{ SERVICIO : recibe
    SERVICIO ||--o{ ASIGNACION : recibe
    AMBULANCIA ||--o{ ASIGNACION : participa

    ASIGNACION ||--|{ ASIGNACION_PERSONAL : incluye
    PERSONAL ||--o{ ASIGNACION_PERSONAL : integra

    SERVICIO ||--o{ INTERVENCION : registra
    SERVICIO ||--o| REGISTRO_CIERRE : tiene
    USUARIO {
        int usuario_id PK
        string nombre_usuario UK
        string nombre_completo
        string rol
        string estado
    }

    SOLICITUD {
        int solicitud_id PK
        datetime fecha_hora_solicitud
        string direccion_origen
        string descripcion
        string prioridad
        string estado
        int usuario_id FK
    }

    SERVICIO {
        int servicio_id PK
        datetime fecha_hora_inicio
        datetime fecha_hora_fin
        string estado
        string observaciones
        int solicitud_id FK
    }

    PACIENTE {
        int paciente_id PK
        string nombres
        string apellidos
        string documento
        date fecha_nacimiento
        string datos_contacto
    }

    AMBULANCIA {
        int ambulancia_id PK
        string placa UK
        string codigo_interno
        string tipo_ambulancia
        string estado_operativo
        int kilometraje
    }

    PERSONAL {
        int personal_id PK
        string documento UK
        string nombres
        string apellidos
        string cargo
        string estado
    }

    ASIGNACION {
        int asignacion_id PK
        int servicio_id FK
        int ambulancia_id FK
        datetime fecha_hora_asignacion
        string estado_asignacion
        string observaciones
    }

    ASIGNACION_PERSONAL {
        int asignacion_personal_id PK
        int asignacion_id FK
        int personal_id FK
        string rol_en_servicio
        datetime fecha_hora_vinculacion
    }

    INTERVENCION {
        int intervencion_id PK
        int servicio_id FK
        datetime fecha_hora_intervencion
        string descripcion
        string observaciones
    }

    REGISTRO_CIERRE {
        int registro_cierre_id PK
        int servicio_id FK
        datetime fecha_hora_cierre
        string resumen_atencion
        string observaciones_finales
    }

## 6. Relaciones y cardinalidades

| Relación | Cardinalidad | Descripción |
|---|---|---|
| USUARIO – SOLICITUD | 1:N | Un usuario puede registrar varias solicitudes; cada solicitud tiene un usuario registrador. |
| SOLICITUD – SERVICIO | 1:0..1 | Una solicitud puede originar un servicio; un servicio corresponde a una solicitud. |
| SERVICIO – ASIGNACION | 1:N | Un servicio puede tener una o varias asignaciones durante su gestión. |
| AMBULANCIA – ASIGNACION | 1:N | Una ambulancia puede participar en diferentes asignaciones a lo largo del tiempo. |
| ASIGNACION – ASIGNACION_PERSONAL | 1:N | Una asignación incluye uno o varios integrantes de personal. |
| PERSONAL – ASIGNACION_PERSONAL | 1:N | Un integrante puede vincularse a múltiples asignaciones en diferentes servicios. |
| SERVICIO – INTERVENCION | 1:N | Un servicio puede registrar diferentes intervenciones. |
| SERVICIO – REGISTRO_CIERRE | 1:0..1 | Un servicio puede tener un registro de cierre, como máximo. |

## 7. Resolución de relaciones N:M

### 7.1 Asignación de personal a asignaciones operativas

La relación entre ASIGNACION y PERSONAL puede representar una relación de muchos a muchos, ya que una asignación operativa puede involucrar a varios integrantes y un integrante puede participar en múltiples asignaciones a lo largo del tiempo.

Esta relación se resuelve mediante la entidad asociativa ASIGNACION_PERSONAL.

La entidad asociativa permite almacenar información adicional sobre el vínculo, como el rol desempeñado y la fecha de vinculación.

### 7.2 Relación entre servicio y ambulancia

La relación entre SERVICIO y AMBULANCIA se gestiona mediante ASIGNACION, que contiene la referencia al servicio y a la ambulancia, además de los datos propios del proceso de asignación.

Esto permite registrar cambios de asignación y conservar información de las asignaciones efectuadas.

## 8. Relaciones adicionales no incorporadas

La relación recursiva de supervisión entre integrantes de PERSONAL no se incorpora en esta versión del MER-01, debido a que no se encuentra consolidada en el modelo conceptual MD-01 ni sustentada de forma explícita en los casos de uso revisados.

Su incorporación queda condicionada a la identificación y validación de una regla organizacional o requisito funcional que la justifique.
## 9. Participación y restricciones preliminares

1. Una solicitud debe tener un usuario responsable de su registro.
2. Un servicio debe estar asociado a una solicitud.
3. Una asignación debe estar asociada a un servicio y a una ambulancia.
4. Una asignación debe vincular al menos un integrante del personal.
5. Las intervenciones deben asociarse a un servicio.
6. El registro de cierre debe estar asociado a un servicio.
7. El servicio debe contar con las condiciones operativas requeridas antes de permitir su cierre.
8. Las asignaciones deben considerar la disponibilidad de los recursos.
10. Las restricciones definitivas deben contrastarse con los casos de uso y las reglas de negocio antes de implementar el modelo físico.

## 10. Entidad PACIENTE y su relación con SERVICIO

La relación PACIENTE–SERVICIO se establece como propuesta conceptual alineada con MD-01. Cada SERVICIO se relaciona con un PACIENTE y un PACIENTE puede estar asociado a múltiples SERVICIOS a lo largo del tiempo.

Esta cardinalidad corresponde a la propuesta preliminar del modelo de dominio y deberá contrastarse con CU-20, CU-21 y las reglas de negocio antes de definir el esquema físico definitivo.

La relación se mantiene como preliminar, pendiente de validación integral.
## 11. Verificación preliminar del modelo

| Criterio | Resultado preliminar |
|---|---|
| Se identifican 6 o más entidades | Cumple |
| Se identifican identificadores | Cumple |
| Se identifican atributos | Cumple |
| Se identifican relaciones | Cumple |
| Se incluyen cardinalidades | Cumple |
| Se resuelve una relación N:M | Cumple |
| Se identifica entidad asociativa | Cumple |
| Se declaran restricciones preliminares | Cumple |
| Se mantiene relación con MD-01 | Cumple, derivación preliminar |
| Validación formal con instructor o usuarios | Pendiente |

## 12. Trazabilidad

| Artefacto de origen | Elemento relacionado |
|---|---|
| MD-01 Modelo de dominio | Entidades y relaciones |
| CU-08 Registrar solicitud | SOLICITUD y USUARIO |
| CU-11 Asignar ambulancia y personal | ASIGNACION, AMBULANCIA, PERSONAL y ASIGNACION_PERSONAL |
| CU-22 Cerrar servicio | SERVICIO, INTERVENCION y REGISTRO_CIERRE |
| CU-20 Datos básicos del paciente | PACIENTE |
| CU-21 Intervenciones | INTERVENCION |

## 13. Estado del artefacto

El MER-01 constituye una propuesta preliminar de diseño derivada del modelo conceptual MD-01 y de los casos de uso documentados para SIGMAVITAL.

La estructura presentada permite identificar entidades, atributos, relaciones y mecanismos de resolución de relaciones N:M.

Este modelo aún requiere revisión de cardinalidades, restricciones de negocio, participación de PACIENTE y consistencia con los casos de uso extendidos. No se declara validación formal ni implementación física de la base de datos.

---

**SENA – ADSO – Ficha 3413974**
**G1-P2 – Actividad 05: Prototipo**





