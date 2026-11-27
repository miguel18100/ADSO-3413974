# B3 – Normalización de Datos SIGMAVITAL

## 1. Objetivo y alcance

Demostrar el paso de 0FN a 3FN con dos ejemplos complementarios: (a) la relación asociativa `AsignacionPersonal`, cuya clave candidata natural es compuesta y permite explicar dependencia parcial; y (b) `Usuario`, que permite explicar dependencia transitiva de los datos del rol. La normalización es un análisis lógico; las restricciones físicas se reflejan en B2 y B5.

## 2. Ejemplo A – AsignacionPersonal: clave candidata compuesta y dependencia parcial

### 2.1 Estructura no normalizada (0FN)

En un registro operativo no normalizado, una asignación podría almacenar una lista repetida de integrantes y sus funciones en una misma fila:

| id_asignacion | fecha_asignacion | id_ambulancia | placa_ambulancia | personal_asignado |
|---|---|---|---|---|
| 501 | 2026-11-20 08:00 | 12 | GXX-1200 | `[(31, conductor, Ana), (32, paramedico, Luis)]` |

El atributo `personal_asignado` contiene un grupo repetitivo y no es atómico.

### 2.2 Primera Forma Normal (1FN)

Se descompone el grupo repetitivo y cada fila representa una sola participación de una persona en una asignación:

| id_asignacion | id_personal | fecha_asignacion | id_ambulancia | placa_ambulancia | nombre_personal | perfil_operativo | funcion | fecha_vinculacion |
|---:|---:|---|---:|---|---|---|---|---|
| 501 | 31 | 2026-11-20 08:00 | 12 | GXX-1200 | Ana | Conductor | Conductor | 2026-11-20 08:05 |
| 501 | 32 | 2026-11-20 08:00 | 12 | GXX-1200 | Luis | Paramédico | Paramédico | 2026-11-20 08:06 |
| 502 | 31 | 2026-11-21 10:00 | 14 | GXX-1400 | Ana | Conductor | Conductor | 2026-11-21 10:03 |

Los atributos son atómicos. La clave candidata natural está compuesta por `(id_asignacion, id_personal)`: una persona se vincula como máximo una vez a una misma asignación.

### 2.3 Dependencias funcionales

- `id_asignacion → fecha_asignacion, id_ambulancia`
- `id_ambulancia → placa_ambulancia`
- `id_personal → nombre_personal, perfil_operativo`
- `(id_asignacion, id_personal) → funcion, fecha_vinculacion`

Las dependencias desde `id_asignacion` y `id_personal` muestran atributos que dependen solo de una parte de la clave compuesta: son dependencias parciales. Además, `id_asignacion → id_ambulancia → placa_ambulancia` permite identificar una dependencia transitiva que se elimina al mantener los datos del vehículo en `Ambulancia`.

### 2.4 Segunda Forma Normal (2FN)

Se separan los atributos que dependen de una sola parte de la clave compuesta:

**Asignacion** (`id_asignacion` PK, `fecha_asignacion`, `id_ambulancia` FK).
**Personal** (`id_personal` PK, `nombre`, `perfil_operativo`).
**AsignacionPersonal** (`id_asignacion` FK, `id_personal` FK, `funcion`, `fecha_vinculacion`).
En este paso se eliminan dependencias parciales de los atributos no clave respecto de cada parte de la clave candidata compuesta.

En `AsignacionPersonal`, `funcion` y `fecha_vinculacion` dependen de la combinación completa. La clave alternativa compuesta `(id_asignacion, id_personal)` permanece como restricción `UNIQUE` en el esquema físico, aunque la tabla utilice además una PK sustituta `id_asignacion_personal` para referencia interna.

### 2.5 Tercera Forma Normal (3FN)

Se comprueba que los atributos no clave de cada relación dependan de la clave, de toda la clave y de nada más que la clave. Los datos descriptivos de ambulancia (incluida `placa_ambulancia`) permanecen en `Ambulancia`, y los datos personales en `Personal`; `AsignacionPersonal` almacena solo atributos propios de la participación. Así se elimina la dependencia transitiva `id_asignacion → id_ambulancia → placa_ambulancia` del conjunto descompuesto y no se mantiene una dependencia transitiva entre atributos no clave en la tabla asociativa.

**Resultado:** la estructura evita repetir datos de personal y asignación en cada vínculo, mantiene una clave candidata compuesta y evita duplicar la misma persona en una asignación.

## 3. Ejemplo B – Usuario: dependencia transitiva

### 3.1 Estructura inicial

| id_usuario | nombre | correo | id_rol | nombre_rol | descripcion_rol | estado |
|---:|---|---|---:|---|---|---|
| 1 | Operador ejemplo | op@example.invalid | 2 | Operador | Gestiona solicitudes | Activo |
| 2 | Coordinador ejemplo | coord@example.invalid | 2 | Operador | Gestiona solicitudes | Activo |

### 3.2 Dependencias funcionales

- `id_usuario → nombre, correo, id_rol, estado`
- `id_rol → nombre_rol, descripcion_rol`

Por transitividad, `id_usuario → nombre_rol, descripcion_rol` a través de `id_rol`. Los datos descriptivos del rol no dependen directamente de la llave de Usuario.

### 3.3 1FN, 2FN y 3FN

- **1FN:** cada columna contiene un valor atómico y cada fila un usuario.
- **2FN:** `id_usuario` es una clave simple; al no ser compuesta, no existen dependencias parciales.
- **3FN:** se separa la información del rol en `Rol(id_rol, nombre, descripcion)` y se conserva `Usuario(id_usuario, id_rol, nombre, correo, estado, fecha_creacion)`. Así `nombre_rol` y `descripcion_rol` dependen de `id_rol` en Rol, no transitivamente de `id_usuario` en Usuario.

## 4. Relación con el esquema físico

- B2 define `AsignacionPersonal` como tabla asociativa con PK sustituta.
- B5 incorpora `UNIQUE (id_asignacion, id_personal)` como clave candidata alternativa.
- B5-Prueba-Unicidad-AsignacionPersonal.sql contiene la prueba propuesta para intentar insertar dos veces la misma pareja y comprobar el rechazo por UNIQUE.
- La prueba debe ejecutarse en MariaDB/MySQL después de crear el esquema; el archivo de prueba no representa por sí solo una ejecución.

## 5. Conclusión

El ejemplo de `AsignacionPersonal` demuestra el efecto de una clave candidata compuesta y las dependencias parciales que se eliminan en 2FN. El ejemplo de `Usuario` demuestra la separación de una dependencia transitiva en 3FN. Ambos ejemplos conectan la explicación teórica con las entidades y restricciones del modelo relacional SIGMAVITAL.
