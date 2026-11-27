# B3 - Normalización de Datos SIGMAVITAL

## 1. Objetivo

Aplicar el proceso de normalización de bases de datos desde la Primera Forma Normal (1FN) hasta la Tercera Forma Normal (3FN), utilizando las estructuras de Usuario y Solicitud del modelo relacional de SIGMAVITAL, con el propósito de reducir redundancias, evitar anomalías y garantizar la integridad de los datos.

## 2. Tabla Usuario

### 2.1 Estructura inicial (0FN)

Para el análisis se considera una estructura inicial que contiene información del usuario y de su rol, en la cual podrían existir datos repetidos o grupos de información asociados al rol.

| id_usuario | nombre | correo | id_rol | nombre_rol | descripcion_rol | estado | fecha_creacion |
|---|---|---|---|---|---|---|---|
| 1 | Usuario ejemplo 1 | usuario1@ejemplo.com | 1 | Administrador | Gestión del sistema | Activo | 2026-01-01 |
| 2 | Usuario ejemplo 2 | usuario2@ejemplo.com | 2 | Operador | Gestión de solicitudes | Activo | 2026-01-02 |

Esta estructura inicial permite identificar información del usuario junto con información descriptiva del rol, lo que puede generar redundancia cuando varios usuarios comparten el mismo rol.

### 2.2 Primera Forma Normal (1FN)

Se establece que cada campo contenga un único valor atómico, sin listas, grupos repetitivos ni múltiples valores dentro de una misma celda.

La tabla Usuario contiene atributos individuales y cada registro identifica un único usuario.

**Resultado:** los atributos son atómicos y cada registro es identificable mediante id_usuario.

### 2.3 Segunda Forma Normal (2FN)

La clave primaria de la tabla es id_usuario.

Los atributos nombre, correo, id_rol, estado y fecha_creacion dependen de la totalidad de la clave primaria. Debido a que la clave primaria está conformada por un único atributo, no existen dependencias parciales.

**Resultado:** la tabla Usuario cumple la 2FN.

### 2.4 Tercera Forma Normal (3FN)

Se identifica que los atributos nombre_rol y descripcion_rol dependen de id_rol, y no directamente de id_usuario.

Para evitar dependencias transitivas y duplicación de información de los roles, los datos descriptivos del rol se mantienen en la tabla Rol y Usuario conserva id_rol como clave foránea.

**Dependencias funcionales:**

- id_usuario → nombre, correo, id_rol, estado, fecha_creacion
- id_rol → nombre_rol, descripcion_rol

**Resultado:** la tabla Usuario conserva únicamente los atributos que dependen directamente de su clave primaria. La información del rol se gestiona en la tabla Rol.

### 2.5 Estructura final en 3FN

**Tabla Usuario:**

| Atributo | Descripción |
|---|---|
| id_usuario | Clave primaria |
| id_rol | Clave foránea hacia Rol |
| nombre | Nombre del usuario |
| correo | Correo electrónico |
| estado | Estado del usuario |
| fecha_creacion | Fecha de creación |

**Tabla Rol:**

| Atributo | Descripción |
|---|---|
| id_rol | Clave primaria |
| nombre | Nombre del rol |
| descripcion | Descripción del rol |

## 3. Tabla Solicitud

### 3.1 Estructura inicial (0FN)

Se considera una estructura inicial en la que la información de la solicitud y los datos del usuario responsable de registrarla se encuentran integrados, lo que podría ocasionar duplicidad de información del usuario cuando registra varias solicitudes.

| id_solicitud | id_usuario | nombre_usuario | correo_usuario | fecha_recepcion | ubicacion_incidente | prioridad | descripcion | estado |
|---|---|---|---|---|---|---|---|---|
| 1 | 1 | Usuario ejemplo 1 | usuario1@ejemplo.com | 2026-01-01 | Ubicación ejemplo | Alta | Descripción ejemplo | Pendiente |
| 2 | 1 | Usuario ejemplo 1 | usuario1@ejemplo.com | 2026-01-02 | Ubicación ejemplo 2 | Media | Descripción ejemplo 2 | En proceso |

Esta estructura inicial evidencia la repetición de información del usuario en solicitudes diferentes.

### 3.2 Primera Forma Normal (1FN)

Cada atributo contiene un valor atómico. No se almacenan listas de ubicaciones, prioridades, estados o descripciones dentro de una misma celda.

Cada fila representa una solicitud individual.

**Resultado:** la tabla cumple la 1FN.

### 3.3 Segunda Forma Normal (2FN)

La clave primaria de Solicitud es id_solicitud.

Los atributos id_usuario, fecha_recepcion, ubicacion_incidente, prioridad, descripcion y estado dependen completamente de id_solicitud. Al tratarse de una clave primaria simple, no se presentan dependencias parciales.

**Resultado:** la tabla Solicitud cumple la 2FN.

### 3.4 Tercera Forma Normal (3FN)

Se evita almacenar en Solicitud los atributos nombre_usuario y correo_usuario, ya que estos dependen de id_usuario y pertenecen a la tabla Usuario.

Se conserva id_usuario como clave foránea para relacionar la solicitud con el usuario que la registra.

**Dependencias funcionales:**

- id_solicitud → id_usuario, fecha_recepcion, ubicacion_incidente, prioridad, descripcion, estado
- id_usuario → nombre, correo, estado, fecha_creacion, id_rol

**Resultado:** la información del usuario se mantiene en Usuario, mientras que Solicitud almacena los datos propios de la solicitud y la referencia al usuario mediante id_usuario.

### 3.5 Estructura final en 3FN

| Atributo | Descripción |
|---|---|
| id_solicitud | Clave primaria |
| id_usuario | Clave foránea hacia Usuario |
| fecha_recepcion | Fecha de recepción |
| ubicacion_incidente | Ubicación del incidente |
| prioridad | Nivel de prioridad |
| descripcion | Descripción de la solicitud |
| estado | Estado de la solicitud |

## 4. Conclusiones

El proceso de normalización aplicado a las tablas Usuario y Solicitud permite organizar los datos de SIGMAVITAL, evitar redundancias innecesarias y separar la información que depende de entidades diferentes.

La aplicación de 1FN garantiza la atomicidad de los atributos; 2FN permite verificar la dependencia completa respecto a la clave primaria; y 3FN evita que atributos no clave dependan transitivamente de la clave primaria.

El resultado es una estructura de datos más organizada, coherente y alineada con el modelo relacional B2.

