# B4 - Diccionario de Datos SIGMAVITAL

## 1. Objetivo

Documentar los atributos que componen el modelo relacional de SIGMAVITAL, especificando nombre, tipo de dato, tamaño, restricciones y dominio, con el propósito de establecer una referencia técnica para la implementación de la base de datos.

## 2. Diccionario de datos

### 2.1 Tabla: Rol

| Campo | Tipo | Tamaño | Restricciones | Dominio / Descripción |
|---|---|---|---|---|
| id_rol | INT | 4 bytes | PK, NOT NULL | Identificador único del rol |
| nombre | VARCHAR | 50 caracteres | NOT NULL | Nombre del rol |
| descripcion | VARCHAR | 255 caracteres | NULL permitido | Descripción del rol |

### 2.2 Tabla: Usuario

| Campo | Tipo | Tamaño | Restricciones | Dominio / Descripción |
|---|---|---|---|---|
| id_usuario | INT | 4 bytes | PK, NOT NULL | Identificador único del usuario |
| id_rol | INT | 4 bytes | FK, NOT NULL | Referencia a Rol.id_rol |
| nombre | VARCHAR | 100 caracteres | NOT NULL | Nombre del usuario |
| correo | VARCHAR | 150 caracteres | NOT NULL, UNIQUE recomendado | Correo electrónico del usuario |
| estado | VARCHAR | 20 caracteres | NOT NULL | Activo, Inactivo u otro estado autorizado |
| fecha_creacion | DATETIME | 8 bytes aprox. | NOT NULL | Fecha y hora de creación del registro |

### 2.3 Tabla: Solicitud

| Campo | Tipo | Tamaño | Restricciones | Dominio / Descripción |
|---|---|---|---|---|
| id_solicitud | INT | 4 bytes | PK, NOT NULL | Identificador de la solicitud |
| id_usuario | INT | 4 bytes | FK, NOT NULL | Usuario que registra la solicitud |
| fecha_recepcion | DATETIME | 8 bytes aprox. | NOT NULL | Fecha y hora de recepción |
| ubicacion_incidente | VARCHAR | 255 caracteres | NOT NULL | Ubicación del incidente |
| prioridad | VARCHAR | 20 caracteres | NOT NULL | Nivel de prioridad establecido |
| descripcion | TEXT | Variable | NOT NULL | Descripción del incidente |
| estado | VARCHAR | 30 caracteres | NOT NULL | Estado de la solicitud |

### 2.4 Tabla: Paciente

| Campo | Tipo | Tamaño | Restricciones | Dominio / Descripción |
|---|---|---|---|---|
| id_paciente | INT | 4 bytes | PK, NOT NULL | Identificador del paciente |
| identificacion_referencia | VARCHAR | 30 caracteres | NULL permitido | Identificación o referencia del paciente |
| nombre_referencia | VARCHAR | 100 caracteres | NULL permitido | Nombre o referencia identificativa |
| informacion_basica | TEXT | Variable | NULL permitido | Información básica relevante del paciente |

### 2.5 Tabla: Servicio

| Campo | Tipo | Tamaño | Restricciones | Dominio / Descripción |
|---|---|---|---|---|
| id_servicio | INT | 4 bytes | PK, NOT NULL | Identificador del servicio |
| id_solicitud | INT | 4 bytes | FK, UNIQUE recomendado, NOT NULL | Solicitud asociada al servicio |
| id_paciente | INT | 4 bytes | FK, NOT NULL | Paciente asociado al servicio |
| fecha_inicio | DATETIME | 8 bytes aprox. | NOT NULL | Fecha y hora de inicio |
| estado | VARCHAR | 30 caracteres | NOT NULL | Estado operativo del servicio |
| fecha_finalizacion | DATETIME | 8 bytes aprox. | NULL permitido | Fecha y hora de finalización |
| destino | VARCHAR | 255 caracteres | NULL permitido | Destino del paciente |

### 2.6 Tabla: RegistroCierre

| Campo | Tipo | Tamaño | Restricciones | Dominio / Descripción |
|---|---|---|---|---|
| id_cierre | INT | 4 bytes | PK, NOT NULL | Identificador del registro de cierre |
| id_servicio | INT | 4 bytes | FK, NOT NULL | Servicio relacionado |
| fecha_cierre | DATETIME | 8 bytes aprox. | NOT NULL | Fecha y hora del cierre |
| resumen_condicion | TEXT | Variable | NULL permitido | Resumen de la condición del paciente |
| destino | VARCHAR | 255 caracteres | NULL permitido | Destino final del paciente |
| observaciones_finales | TEXT | Variable | NULL permitido | Observaciones del cierre |

### 2.7 Tabla: Ambulancia

| Campo | Tipo | Tamaño | Restricciones | Dominio / Descripción |
|---|---|---|---|---|
| id_ambulancia | INT | 4 bytes | PK, NOT NULL | Identificador de ambulancia |
| placa | VARCHAR | 15 caracteres | NOT NULL, UNIQUE recomendado | Placa del vehículo |
| tipo | VARCHAR | 50 caracteres | NOT NULL | Tipo de ambulancia |
| estado_operativo | VARCHAR | 30 caracteres | NOT NULL | Estado operativo del vehículo |
| ubicacion_referencia | VARCHAR | 255 caracteres | NULL permitido | Ubicación de referencia |

### 2.8 Tabla: Asignacion

| Campo | Tipo | Tamaño | Restricciones | Dominio / Descripción |
|---|---|---|---|---|
| id_asignacion | INT | 4 bytes | PK, NOT NULL | Identificador de asignación |
| id_servicio | INT | 4 bytes | FK, NOT NULL | Servicio asignado |
| id_ambulancia | INT | 4 bytes | FK, NOT NULL | Ambulancia asignada |
| fecha_asignacion | DATETIME | 8 bytes aprox. | NOT NULL | Fecha y hora de asignación |
| estado | VARCHAR | 30 caracteres | NOT NULL | Estado de la asignación |
| observaciones | TEXT | Variable | NULL permitido | Observaciones de la asignación |

### 2.9 Tabla: Personal

| Campo | Tipo | Tamaño | Restricciones | Dominio / Descripción |
|---|---|---|---|---|
| id_personal | INT | 4 bytes | PK, NOT NULL | Identificador del personal |
| nombre | VARCHAR | 100 caracteres | NOT NULL | Nombre del integrante |
| identificacion_referencia | VARCHAR | 30 caracteres | NULL permitido | Identificación del integrante |
| perfil_operativo | VARCHAR | 50 caracteres | NOT NULL | Perfil o función operativa |
| estado | VARCHAR | 20 caracteres | NOT NULL | Estado del integrante |
| contacto | VARCHAR | 100 caracteres | NULL permitido | Información de contacto |

### 2.10 Tabla: AsignacionPersonal

| Campo | Tipo | Tamaño | Restricciones | Dominio / Descripción |
|---|---|---|---|---|
| id_asignacion_personal | INT | 4 bytes | PK, NOT NULL | Identificador de la vinculación |
| id_asignacion | INT | 4 bytes | FK, NOT NULL | Asignación relacionada |
| id_personal | INT | 4 bytes | FK, NOT NULL | Integrante del personal vinculado |
| funcion | VARCHAR | 50 caracteres | NOT NULL | Función dentro de la asignación |
| fecha_vinculacion | DATETIME | 8 bytes aprox. | NOT NULL | Fecha y hora de vinculación |

### 2.11 Tabla: Intervencion

| Campo | Tipo | Tamaño | Restricciones | Dominio / Descripción |
|---|---|---|---|---|
| id_intervencion | INT | 4 bytes | PK, NOT NULL | Identificador de intervención |
| id_servicio | INT | 4 bytes | FK, NOT NULL | Servicio asociado |
| id_personal | INT | 4 bytes | FK, NOT NULL | Personal que registra o realiza la intervención |
| fecha_hora | DATETIME | 8 bytes aprox. | NOT NULL | Fecha y hora de intervención |
| descripcion | TEXT | Variable | NOT NULL | Descripción de la intervención |
| observaciones | TEXT | Variable | NULL permitido | Observaciones adicionales |

## 3. Convenciones y restricciones

- **PK (Primary Key):** identifica de manera única cada registro de una tabla.
- **FK (Foreign Key):** establece una relación entre tablas y garantiza integridad referencial.
- **NOT NULL:** indica que el campo debe contener un valor.
- **UNIQUE:** impide duplicidad de valores en el campo o combinación de campos donde se aplique.
- **NULL permitido:** indica que el campo puede no contener un valor cuando la información no esté disponible o no sea obligatoria.

Los tamaños y tipos de datos documentados constituyen una propuesta técnica de referencia para la implementación de la base de datos. Su aplicación definitiva deberá ajustarse al motor de base de datos seleccionado.

## 4. Consideraciones sobre protección de datos

SIGMAVITAL contempla información relacionada con usuarios, pacientes, personal y servicios. Los datos personales y la información relacionada con la atención de pacientes deberán manejarse con controles de acceso, confidencialidad, almacenamiento seguro y uso limitado a las finalidades autorizadas.

