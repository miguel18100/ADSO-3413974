# Sistema Inteligente de Toma de Asistencia

**Programa de Formación:** Análisis y Desarrollo de Software (ADSO) — Ficha 3413974
**Documento de Especificación de Requisitos** (basado en IEEE 830)
**SENA — Servicio Nacional de Aprendizaje**

---

## 1. Información General del Proyecto

- **Nombre del sistema:** Sistema Inteligente de Toma de Asistencia
- **Actor principal:** Instructor (Administrador)
- **Actor secundario:** Aprendiz
- **Objetivo general:** Desarrollar un sistema que permita registrar la asistencia de los aprendices de manera rápida y eficiente, disminuyendo el tiempo empleado por el instructor y facilitando el control, la consulta y la generación de reportes de asistencia.
- **Descripción:** El proyecto tiene como objetivo optimizar el tiempo de registro de asistencia para la ficha 3413974 del programa de formación ADSO. Busca reemplazar el proceso manual actual por un sistema que permita registrar la asistencia de forma más rápida, organizada y segura.
- **Alcance:** El sistema permitirá al instructor seleccionar una ficha, visualizar el listado de aprendices, registrar la asistencia, consultar y modificar los registros cuando sea necesario, buscar aprendices y generar reportes de asistencia, optimizando el proceso de control y reduciendo el uso de formatos manuales.

### Instrumentos de recolección de información

- Observación del proceso actual de toma de asistencia.
- Revisión del formato utilizado actualmente (SofiaPlus).

---

## 2. Necesidad

Actualmente, el proceso de toma de asistencia en el SENA presenta diversas dificultades que afectan el tiempo de formación y la eficiencia del instructor.

### Necesidades identificadas

- Conocer y respetar los lineamientos institucionales del SENA.
- Diseñar una solución orientada exclusivamente al entorno de formación del SENA.
- Optimizar el proceso de llamado y registro de asistencia.
- Reducir el tiempo que el instructor dedica al control de asistencia.
- Evitar errores durante el registro.
- Facilitar el acceso a la información de asistencia.
- Permitir la consulta del historial de asistencia.
- No depender de una integración con SOFIA Plus.

---

## 3. Restricciones del Proyecto

Condiciones que el sistema debe cumplir:

- El sistema funcionará de forma independiente de SOFIA Plus.
- No tendrá integración con servicios oficiales del SENA.
- El sistema será utilizado únicamente durante el proceso de formación.
- El sistema estará orientado inicialmente a una sola ficha (3413974 – ADSO).
- Debe ser fácil de utilizar por instructores y aprendices.

---

## 4. Características del Sistema

**Funcional:** Debe resolver el problema principal: disminuir el tiempo de registro de asistencia.

**Operativo:** Debe ser sencillo de usar para cualquier instructor, sin curva de aprendizaje alta.

**Soportable:** Debe permitir mantenimiento y futuras mejoras sin afectar su funcionamiento base.

**Escalable:** En el futuro podría manejar varias fichas, sedes o programas de formación.

---

## 5. Requerimientos Funcionales

| Código | Descripción |
|---|---|
| RF01 | El sistema debe mostrar la lista de los aprendices de la ficha 3413974 del programa de ADSO para realizar el registro. |
| RF02 | El sistema debe permitir registrar la asistencia en una sola pantalla. |
| RF03 | El sistema debe permitir registrar si el aprendiz asistió, llegó tarde o estuvo ausente. |
| RF04 | El sistema debe guardar automáticamente el registro con fecha y hora. |
| RF05 | El sistema debe permitir buscar por asistencia, fecha u hora. |
| RF06 | El sistema debe permitir editar el registro de asistencia cuando sea necesario. |
| RF07 | El sistema debe generar un reporte de asistencia por aprendiz. |
| RF08 | El sistema debe permitir buscar rápidamente un aprendiz en una fecha seleccionada. |

---

## 6. Posibles Soluciones de Registro

Se evaluaron varias alternativas para el mecanismo de registro de asistencia, de menor a mayor complejidad:

### Opción 1 — Registro manual optimizado
El instructor abre el sistema y marca la asistencia de todos los aprendices desde una sola pantalla.

### Opción 2 — Código de asistencia
El sistema genera un código temporal. Los aprendices escriben ese código para registrar su asistencia.

### Opción 3 — Código QR
El instructor genera un QR. Los aprendices lo escanean desde su celular y el sistema registra automáticamente la asistencia.

### Opción 4 — QR dinámico (la más completa)

Características:
- El QR cambia automáticamente cada cierto tiempo.
- Solo funciona durante unos minutos.
- Evita que un aprendiz envíe una fotografía del QR a otra persona.
- Disminuye el fraude en el registro.

Ejemplo de funcionamiento:
1. El instructor inicia la sesión de asistencia.
2. Se genera un QR.
3. El QR cambia cada 20 segundos.
4. La sesión de asistencia dura 10 minutos.
5. Después de ese tiempo, el QR expira automáticamente.

---

## 7. Roles y Funciones

### Instructor
- Iniciar la sesión de asistencia.
- Generar el código o QR.
- Cerrar la sesión.
- Consultar asistencias.
- Modificar registros cuando sea necesario.

### Aprendiz
- Ingresar al sistema.
- Escanear el QR o ingresar el código.
- Registrar su asistencia.
- Consultar el estado de su registro.

---

## 8. Riesgos y Mitigaciones

| Riesgo | Mitigación propuesta |
|---|---|
| Un aprendiz podría intentar registrar asistencia por otra persona. | Validación de un único registro por aprendiz. |
| Compartir una captura del QR. | QR dinámico (cambia cada 20 segundos). |
| Registrar asistencia fuera del salón. | Tiempo límite y sesión de corta duración. |
| Registrar asistencia después del tiempo permitido. | Expiración automática del QR / código. |
| Perder conexión a Internet. | Confirmación visual del registro y reintento posterior. |
| Errores o fraudes no detectados a tiempo. | Registro de fecha/hora exacta e historial de modificaciones. |

---

## 9. Mejoras Futuras (Versión 2.0)

Funcionalidades documentadas para mantener el alcance actual controlado, pero que quedan planteadas como evolución del sistema:

- Integración con SOFIA Plus.
- Integración con LDAP institucional.
- Firma digital del instructor.
- Reportes en PDF y Excel.
- Estadísticas de asistencia.
- Panel administrativo.
- Aplicación móvil.
- Notificaciones automáticas.
- Exportación de datos.
- Código QR dinámico como método alterno de registro.

---

## 10. Pantallas Propuestas (Mockup)

Antes de programar se recomienda diseñar las siguientes pantallas:

- Inicio.
- Registro de asistencia.
- Generación de QR (versión 2.0).
- Consulta de asistencias.
- Reportes.

> Ver el mockup interactivo adjunto (`mockup_asistencia.html`) con el diseño visual de estas 5 pantallas.

---

## 11. Modelado UML

### 11.1 Diagrama de Casos de Uso

**Actor:** Instructor (Administrador)

| Caso de uso | Descripción |
|---|---|
| UC01 – Mostrar lista de aprendices | Muestra el listado de aprendices de la ficha 3413974. |
| UC02 – Registrar asistencia | Permite registrar la asistencia desde una sola pantalla. |
| UC03 – Registrar estado | Permite marcar asistió / llegó tarde / ausente. |
| UC04 – Guardar registro | Guarda automáticamente fecha y hora del registro. |
| UC05 – Consultar asistencia | Permite buscar por asistencia, fecha u hora. |
| UC06 – Editar registro | Permite modificar un registro existente. |
| UC07 – Generar reporte | Genera el reporte de asistencia por aprendiz. |
| UC08 – Buscar aprendiz | Permite ubicar rápidamente un aprendiz en una fecha seleccionada. |

*Todos los casos de uso (UC01–UC08) son iniciados por el actor Instructor (Administrador); UC08 se relaciona como apoyo transversal a la consulta y edición de registros.*

### 11.2 Diagrama de Clases (preliminar)

**Clase: Instructor**

| Tipo | Elemento |
|---|---|
| Atributo | - idInstructor |
| Atributo | - nombre |
| Atributo | - correo |
| Método | + tomarAsistencia() |
| Método | + consultarAsistencia() |
| Método | + editarAsistencia() |
| Método | + generarReporte() |

> Nota: este modelo de clases es preliminar; en la siguiente etapa se recomienda incorporar las clases `Aprendiz`, `Ficha` y `Asistencia` con sus respectivas relaciones.

---

## 12. Recomendación Final

Con el análisis realizado, el proyecto dejó de ser simplemente "tomar asistencia" y evolucionó hacia un **Sistema Inteligente de Toma de Asistencia** para el SENA, respaldado por un proceso de análisis más sólido.

Se recomienda validar el alcance con el instructor. Si el proyecto debe mantenerse acotado para el nivel tecnólogo, conviene dejar el **registro manual optimizado (Opción 1)** como funcionalidad principal para la primera entrega, y documentar el **QR dinámico (Opción 4)** y las demás mejoras como **Versión 2.0**. De esta forma el proyecto sigue siendo viable en el tiempo disponible y, al mismo tiempo, demuestra una visión de evolución del sistema.
