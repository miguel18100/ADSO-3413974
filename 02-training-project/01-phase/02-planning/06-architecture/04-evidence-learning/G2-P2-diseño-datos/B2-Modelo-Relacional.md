# B2 - Modelo Relacional de Datos SIGMAVITAL

## 1. Objetivo

Transformar el modelo conceptual de datos B1 en un modelo relacional,
identificando las tablas, atributos, claves primarias y claves foráneas
del sistema SIGMAVITAL.

## 2. Tablas

### Rol
- id_rol (PK)
- nombre
- descripcion

### Usuario
- id_usuario (PK)
- id_rol (FK)
- nombre
- correo
- estado
- fecha_creacion

### Solicitud
- id_solicitud (PK)
- id_usuario (FK)
- fecha_recepcion
- ubicacion_incidente
- prioridad
- descripcion
- estado

### Paciente
- id_paciente (PK)
- identificacion_referencia
- nombre_referencia
- informacion_basica

### Servicio
- id_servicio (PK)
- id_solicitud (FK)
- id_paciente (FK)
- fecha_inicio
- estado
- fecha_finalizacion
- destino

### RegistroCierre
- id_cierre (PK)
- id_servicio (FK)
- fecha_cierre
- resumen_condicion
- destino
- observaciones_finales

### Ambulancia
- id_ambulancia (PK)
- placa
- tipo
- estado_operativo
- ubicacion_referencia

### Asignacion
- id_asignacion (PK)
- id_servicio (FK)
- id_ambulancia (FK)
- fecha_asignacion
- estado
- observaciones

### Personal
- id_personal (PK)
- nombre
- identificacion_referencia
- perfil_operativo
- estado
- contacto

### AsignacionPersonal
- id_asignacion_personal (PK)
- id_asignacion (FK)
- id_personal (FK)
- funcion
- fecha_vinculacion

### Intervencion
- id_intervencion (PK)
- id_servicio (FK)
- id_personal (FK)
- fecha_hora
- descripcion
- observaciones

## 3. Relaciones

- Rol 1:N Usuario
- Usuario 1:N Solicitud
- Solicitud 1:0..1 Servicio
- Paciente 1:N Servicio
- Servicio 1:N RegistroCierre (pendiente validar cardinalidad)
- Servicio 1:N Asignacion
- Ambulancia 1:N Asignacion
- Asignacion 1:N AsignacionPersonal
- Personal 1:N AsignacionPersonal
- Servicio 1:N Intervencion
- Personal 1:N Intervencion

## 4. Consideraciones

Las claves primarias identifican de manera única cada registro.
Las claves foráneas permiten mantener la integridad referencial.
Las relaciones deben conservar la coherencia con el modelo conceptual B1.

Este documento representa la propuesta del modelo relacional B2.

## 5. Tabla de reglas de transformación del modelo conceptual al relacional

| Regla aplicada | Aplicación en SIGMAVITAL |
|---|---|
| Transformación de entidades en tablas | Cada entidad identificada en el modelo conceptual B1 se transforma en una tabla del modelo relacional B2. Se generan las tablas Rol, Usuario, Solicitud, Paciente, Servicio, RegistroCierre, Ambulancia, Asignacion, Personal, AsignacionPersonal e Intervencion. |
| Identificación de claves primarias (PK) | Cada tabla cuenta con una clave primaria que permite identificar de manera única cada registro. |
| Transformación de relaciones 1:N | Las relaciones uno a muchos se implementan mediante claves foráneas ubicadas en la tabla del lado N. Por ejemplo, id_rol en Usuario e id_usuario en Solicitud. |
| Transformación de relaciones 1:0..1 | La relación entre Solicitud y Servicio se implementa mediante id_solicitud como clave foránea en Servicio. Para garantizar la cardinalidad 0..1, dicha FK debe tener una restricción UNIQUE. |
| Transformación de relaciones entre entidades | Las relaciones entre Servicio, Paciente, Asignacion, Ambulancia, RegistroCierre e Intervencion se representan mediante claves foráneas que mantienen la integridad referencial. |
| Transformación de relaciones N:M | La relación entre Asignacion y Personal se resuelve mediante la tabla intermedia AsignacionPersonal, que contiene las claves foráneas id_asignacion e id_personal. |
| Incorporación de atributos | Los atributos identificados en cada entidad del modelo conceptual se incorporan a sus respectivas tablas relacionales. |
| Integridad referencial | Las claves foráneas permiten mantener la consistencia entre los registros relacionados y evitar referencias a registros inexistentes. |

