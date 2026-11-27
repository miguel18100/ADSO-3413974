# B6 - Políticas de Seguridad, Acceso y Protección de Datos - SIGMAVITAL

## 1. Objetivo

Establecer las políticas de seguridad para proteger la información almacenada en la base de datos SIGMAVITAL, garantizando su integridad, confidencialidad, disponibilidad y tratamiento adecuado de los datos personales.

## 2. Políticas de seguridad

### 2.1 Políticas de integridad

**PI-01. Integridad referencial:**
Todas las relaciones entre tablas deben mantener la integridad referencial mediante claves primarias y foráneas. No se permitirán registros relacionados con identificadores inexistentes.

**PI-02. Validación de datos:**
Los datos ingresados deben cumplir con los tipos de datos, restricciones, campos obligatorios, valores únicos y reglas de validación definidos en el modelo de datos.

### 2.2 Políticas de confidencialidad

**PC-01. Control de acceso por roles:**
El acceso a la información estará restringido de acuerdo con el rol y las responsabilidades del usuario. Cada usuario tendrá únicamente los permisos necesarios para desarrollar sus funciones.

**PC-02. Protección de datos personales:**
Los datos personales de pacientes, usuarios y personal deberán ser consultados únicamente por personal autorizado. No se deberán compartir, publicar ni utilizar con fines diferentes a los autorizados.

### 2.3 Políticas de disponibilidad

**PD-01. Copias de seguridad:**
Se deberán realizar copias de seguridad periódicas de la base de datos SIGMAVITAL. Los respaldos deberán almacenarse en ubicaciones seguras y verificarse periódicamente mediante pruebas de restauración.

**PD-02. Continuidad y recuperación:**
Se deberán establecer procedimientos de recuperación ante fallos del servidor, errores operativos, pérdida de información o incidentes de seguridad. Se deberá verificar el funcionamiento de la base de datos después de su recuperación.

## 3. Matriz de acceso por roles y tablas

Se definen tres roles de referencia para la gestión de SIGMAVITAL. Los permisos deberán implementarse de acuerdo con las responsabilidades asignadas.

| Tabla | Administrador | Operador | Personal asistencial |
|---|---|---|---|
| Rol | CRUD | - | - |
| Usuario | CRUD | R | - |
| Solicitud | CRUD | CRU | R |
| Paciente | CRUD | R | R |
| Servicio | CRUD | CRU | R |
| RegistroCierre | CRUD | R | CR |
| Ambulancia | CRUD | R | R |
| Asignacion | CRUD | CRU | R |
| Personal | CRUD | R | R |
| AsignacionPersonal | CRUD | CRU | R |
| Intervencion | CRUD | R | CR |

### Convenciones

- **C:** Crear registros.
- **R:** Consultar registros.
- **U:** Actualizar registros.
- **D:** Eliminar registros.
- **-:** Sin permisos asignados.

La matriz representa una propuesta de permisos. Los permisos definitivos deberán implementarse mediante mecanismos de control de acceso en el sistema y en la base de datos.

## 4. Responsabilidades de los roles

### Administrador
- Administrar usuarios, roles y permisos.
- Gestionar la estructura y mantenimiento de la base de datos.
- Realizar copias de seguridad y procesos de recuperación.
- Supervisar la integridad y seguridad de la información.

### Operador
- Registrar y gestionar solicitudes.
- Consultar información necesaria para la gestión de los servicios.
- Realizar asignaciones de ambulancias y personal según sus funciones.
- Actualizar información operativa autorizada.

### Personal asistencial
- Consultar información necesaria para atender los servicios asignados.
- Registrar intervenciones relacionadas con la atención.
- Consultar asignaciones y datos operativos pertinentes.
- Evitar el acceso a información administrativa que no sea necesaria para sus funciones.

## 5. Protección y tratamiento de datos personales

SIGMAVITAL podrá manejar datos personales de usuarios, pacientes y personal vinculado a la operación del sistema. Por ello, se establecen las siguientes medidas:

- Limitar el acceso a los datos personales a los usuarios autorizados.
- Utilizar la información exclusivamente para las finalidades operativas autorizadas.
- Evitar la exposición de información personal en capturas de pantalla, documentos públicos o medios no autorizados.
- Proteger las credenciales de acceso y evitar compartir contraseñas.
- Aplicar medidas de seguridad en el almacenamiento, consulta y transmisión de información.
- Realizar respaldos seguros y controlar el acceso a estos.
- Atender los procedimientos aplicables para el tratamiento, protección y gestión de los datos personales.
- Evitar el uso de datos reales sensibles en ambientes de desarrollo, pruebas y demostración cuando no sea necesario.

## 6. Gestión de incidentes

Ante un incidente que pueda comprometer la información de SIGMAVITAL, se deberán seguir estas acciones:

1. Identificar y reportar el incidente.
2. Restringir o detener el acceso comprometido cuando sea necesario.
3. Evaluar el alcance y los posibles datos afectados.
4. Aplicar medidas de contención y recuperación.
5. Verificar la integridad y disponibilidad de la información.
6. Documentar el incidente y las acciones correctivas.

## 7. Conclusión

Las políticas definidas permiten establecer un marco básico de seguridad para SIGMAVITAL, orientado a garantizar la integridad de los registros, limitar el acceso a la información, proteger los datos personales y mantener la disponibilidad de la base de datos. La implementación de estas políticas contribuye a una gestión segura y organizada de la información del sistema.

## 8. Seguridad de credenciales y transmisión

- Las contraseñas de los usuarios deberán almacenarse mediante algoritmos de hash seguros para contraseñas, como Argon2id o bcrypt, con salt individual. No se almacenarán contraseñas en texto plano.
- La transmisión de información entre el cliente y el servidor deberá protegerse mediante HTTPS con TLS, evitando la transmisión de credenciales y datos personales sin cifrado.
- Las credenciales y permisos deberán gestionarse de acuerdo con el principio de mínimo privilegio.

## 9. Frecuencia de respaldos y pruebas de restauración

- Se propone realizar una copia de seguridad completa semanal de la base de datos.
- Se propone realizar respaldos incrementales diarios para reducir la pérdida de información entre respaldos completos.
- Los respaldos deberán almacenarse en una ubicación segura, con acceso restringido y protección frente a modificaciones no autorizadas.
- Se deberá realizar una prueba de restauración al menos una vez al mes en un ambiente de prueba.
- Las pruebas de restauración deberán documentar la fecha, el procedimiento aplicado, el resultado obtenido y las observaciones o errores encontrados.
- La periodicidad propuesta deberá ajustarse a las necesidades operativas y a los recursos disponibles del sistema.

## Procedimiento controlado de prueba de restauración

**Estado:** procedimiento definido; ejecución real pendiente de registrar en un ambiente MariaDB/MySQL de pruebas. No se declara una restauración ya realizada.

### Preparación

1. Confirmar autorización del responsable de la base y usar un ambiente aislado de pruebas.
2. Identificar versión del motor y registrar fecha/hora, tamaño del respaldo y origen.
3. Verificar que el archivo de respaldo no esté vacío y calcular un hash SHA-256 para controlar integridad.
4. Proteger el respaldo con permisos restrictivos; no copiar datos personales reales a entornos no autorizados.

### Respaldo de referencia

Para un respaldo lógico MariaDB/MySQL, se propone un comando equivalente a:

```bash
mariadb-dump --single-transaction --routines --triggers --events sigmavital > sigmavital_restore_test.sql
sha256sum sigmavital_restore_test.sql
```

El ejecutable puede denominarse `mysqldump` según la distribución instalada. El comando debe adaptarse a la autenticación y política de secretos del entorno; no escribir contraseñas en el historial de consola.

### Restauración aislada

```sql
CREATE DATABASE sigmavital_restore_test;
```

```bash
mariadb sigmavital_restore_test < sigmavital_restore_test.sql
```

No restaurar sobre la base productiva ni sobrescribir datos del origen.

### Verificaciones posteriores

- Comparar la cantidad de tablas restauradas con el inventario de B2 (11 tablas en la versión documentada).
- Consultar conteos por tabla y compararlos con el manifiesto registrado al generar el respaldo.
- Ejecutar verificaciones de integridad referencial y restricciones; revisar que no existan registros huérfanos.
- Ejecutar una consulta funcional de lectura sobre Usuario, Solicitud, Servicio y RegistroCierre.
- Registrar duración, errores y diferencias. El resultado solo se marca **Cumple** si el responsable valida las comprobaciones.
- Eliminar la base temporal según el procedimiento autorizado y conservar el log sin exponer datos sensibles.

### Registro de ejecución

| Campo | Dato a completar por quien ejecute la prueba |
|---|---|
| Fecha y hora | Pendiente de ejecución |
| Responsable | Pendiente de ejecución |
| Motor y versión | Pendiente de ejecución |
| Nombre/hash del respaldo | Pendiente de ejecución |
| Base restaurada | `sigmavital_restore_test` (propuesta) |
| Tablas esperadas / encontradas | 11 / pendiente |
| Conteos comparados | Pendiente |
| Integridad referencial | Pendiente |
| Resultado | **No ejecutada todavía** |
| Evidencia adjunta | Añadir log/captura al ejecutar |

La periodicidad propuesta es una prueba mensual como mínimo, además de una restauración después de cambios críticos de versión o infraestructura.
