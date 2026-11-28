# Matriz de requisitos y casos de uso – G1-P1 Plan de análisis

## 1. Introducción

El presente documento consolida la identificación preliminar de requisitos funcionales, requisitos no funcionales, actores, reglas de negocio y casos de uso asociados al Sistema Gestor de Ambulancias (SGA), como parte de la evidencia G1-P1 del Plan de análisis de la Guía de Aprendizaje 1 del programa Análisis y Desarrollo de Software (ADSO).

La identificación de los elementos se fundamenta en la caracterización de la solución propuesta, el análisis del contexto operativo relacionado con la gestión de ambulancias y servicios de transporte asistencial, y la delimitación inicial de las necesidades del sistema.

Los elementos descritos constituyen una propuesta de análisis y especificación preliminar. No representan una validación formal con usuarios, una implementación funcional ni resultados de pruebas del sistema.

## 2. Objetivo

Identificar, documentar y relacionar los requisitos funcionales, requisitos no funcionales preliminares, actores, reglas de negocio y casos de uso del Sistema Gestor de Ambulancias (SGA), con el propósito de establecer una base de trazabilidad para el modelado conceptual y la elaboración del diagrama UML de casos de uso.

## 3. Alcance

La matriz contempla preliminarmente los siguientes procesos relacionados con la gestión de ambulancias y servicios de transporte asistencial:

- Gestión de usuarios y control de acceso.
- Gestión de ambulancias y vehículos de transporte asistencial.
- Gestión del personal operativo.
- Registro y consulta de solicitudes de servicio.
- Clasificación preliminar de servicios de transporte asistencial.
- Asignación de ambulancias y personal operativo.
- Seguimiento de servicios asignados y en ejecución.
- Consulta del estado operativo de ambulancias.
- Consulta de información e historial de servicios.
- Generación de reportes operativos.

La matriz constituye un producto de análisis de la Guía de Aprendizaje 1. No implica que los procesos descritos estén implementados, integrados, desplegados o validados en una aplicación funcional.

## 4. Fuentes de identificación

La identificación preliminar se fundamenta en:

| Fuente | Descripción |
|---|---|
| Caracterización de la solución | Contexto, propósito, alcance y necesidades identificadas para el SGA. |
| Análisis del contexto operativo | Procesos relacionados con la solicitud, asignación y seguimiento de servicios de ambulancia. |
| Normativa y contexto del transporte asistencial | Referentes aplicables a la prestación y organización del transporte asistencial, sujetos a revisión y validación. |
| Plan de actividades | Actividades previstas para el análisis, modelado y documentación del sistema. |
| Identificación de actores y procesos | Roles y actividades preliminares relacionados con la gestión operativa del sistema. |

## 5. Actores del sistema

### 5.1. A-01 Administrador

Representa al usuario responsable de las actividades administrativas y de configuración general del sistema.

Responsabilidades preliminares:

- Gestionar usuarios.
- Consultar información general del sistema.
- Administrar información de referencia.
- Gestionar permisos de acceso según el alcance definido.
- Consultar reportes administrativos y operativos.

### 5.2. A-02 Coordinador operativo

Representa al usuario encargado de coordinar las solicitudes de transporte asistencial, organizar los recursos disponibles y gestionar las asignaciones operativas.

Responsabilidades preliminares:

- Registrar y consultar solicitudes de servicio.
- Revisar las necesidades de transporte asistencial.
- Consultar la disponibilidad de ambulancias.
- Consultar la disponibilidad del personal operativo.
- Asignar ambulancias y personal a los servicios.
- Realizar seguimiento a los servicios.
- Consultar reportes operativos.

### 5.3. A-03 Personal operativo (TES / paramédico)

Representa al personal operativo vinculado a la atención y ejecución de los servicios de transporte asistencial.

Responsabilidades preliminares:

- Consultar servicios asignados.
- Consultar información del servicio.
- Actualizar estados operativos según las funciones autorizadas.
- Reportar novedades relacionadas con el servicio.
- Registrar información operativa pertinente, según los permisos definidos.

### 5.4. A-04 Director o responsable de gestión

Representa al usuario que consulta información consolidada para apoyar la supervisión y toma de decisiones administrativas y operativas.

Responsabilidades preliminares:

- Consultar indicadores operativos.
- Consultar reportes de servicios.
- Consultar información sobre utilización de recursos.
- Analizar información consolidada para apoyar la gestión.

## 6. Requisitos funcionales

Los requisitos funcionales se presentan como una propuesta preliminar para el SGA.

| ID | Requisito funcional | Actor principal | Prioridad |
|---|---|---|---|
| RF-01 | El sistema debe permitir el inicio de sesión de los usuarios mediante mecanismos de autenticación definidos. | Administrador, Coordinador, Personal operativo, Director | Alta |
| RF-02 | El sistema debe permitir cerrar la sesión del usuario autenticado. | Todos | Alta |
| RF-03 | El sistema debe permitir gestionar usuarios, incluyendo consulta, creación, actualización y eliminación según permisos. | Administrador | Alta |
| RF-04 | El sistema debe permitir consultar información general mediante un tablero de indicadores operativos. | Administrador, Coordinador, Director | Alta |
| RF-05 | El sistema debe permitir registrar ambulancias con la información requerida para su identificación y gestión. | Administrador | Alta |
| RF-06 | El sistema debe permitir actualizar la información de ambulancias registradas. | Administrador | Alta |
| RF-07 | El sistema debe permitir consultar las ambulancias registradas y su información asociada. | Administrador, Coordinador | Alta |
| RF-08 | El sistema debe permitir gestionar el estado operativo de las ambulancias según los estados definidos. | Administrador, Coordinador | Alta |
| RF-09 | El sistema debe permitir registrar personal operativo relacionado con la prestación de servicios de transporte asistencial. | Administrador | Alta |
| RF-10 | El sistema debe permitir actualizar la información del personal operativo registrado. | Administrador | Alta |
| RF-11 | El sistema debe permitir consultar el personal operativo y la información disponible para su gestión. | Administrador, Coordinador | Alta |
| RF-12 | El sistema debe permitir registrar solicitudes de servicios de transporte asistencial con la información requerida. | Coordinador | Alta |
| RF-13 | El sistema debe permitir consultar las solicitudes de servicios registradas. | Coordinador, Director | Alta |
| RF-14 | El sistema debe permitir actualizar la información de las solicitudes, según las funciones y permisos establecidos. | Coordinador | Alta |
| RF-15 | El sistema debe permitir clasificar las solicitudes de acuerdo con los tipos de transporte asistencial definidos para el contexto del servicio. | Coordinador | Alta |
| RF-16 | El sistema debe permitir consultar los recursos operativos disponibles para la asignación de servicios. | Coordinador | Alta |
| RF-17 | El sistema debe permitir asignar una ambulancia a una solicitud de servicio, de acuerdo con los criterios operativos definidos. | Coordinador | Alta |
| RF-18 | El sistema debe permitir asociar personal operativo a un servicio asignado. | Coordinador | Alta |
| RF-19 | El sistema debe permitir consultar los detalles de las asignaciones realizadas. | Coordinador, Personal operativo | Alta |
| RF-20 | El sistema debe permitir actualizar el estado de un servicio durante su ciclo operativo. | Coordinador, Personal operativo | Alta |
| RF-21 | El sistema debe permitir registrar novedades asociadas a la ejecución de un servicio, según los permisos definidos. | Personal operativo, Coordinador | Media |
| RF-22 | El sistema debe permitir consultar el historial de servicios registrados. | Coordinador, Director | Alta |
| RF-23 | El sistema debe permitir consultar información relacionada con ambulancias y sus servicios asociados. | Coordinador, Director | Media |
| RF-24 | El sistema debe permitir consultar información relacionada con el personal operativo y los servicios asociados, según permisos. | Coordinador, Director | Media |
| RF-25 | El sistema debe permitir generar reportes operativos sobre los servicios registrados. | Coordinador, Director | Alta |
| RF-26 | El sistema debe permitir filtrar reportes por criterios disponibles, como fechas, estado del servicio y recursos asociados. | Coordinador, Director | Media |
| RF-27 | El sistema debe permitir consultar indicadores relacionados con la gestión y operación de los servicios. | Director, Coordinador | Media |
| RF-28 | El sistema debe permitir consultar información consolidada para apoyar la toma de decisiones administrativas y operativas. | Director | Media |

## 7. Requisitos no funcionales

Los siguientes requisitos representan criterios preliminares propuestos para el sistema.

| ID | Requisito no funcional | Categoría | Naturaleza |
|---|---|---|---|
| RNF-01 | El sistema debería proporcionar una interfaz clara y comprensible para los usuarios de los diferentes roles. | Usabilidad | Propuesta de análisis |
| RNF-02 | El sistema debería presentar mensajes claros de confirmación, advertencia y error durante las operaciones. | Usabilidad | Propuesta de análisis |
| RNF-03 | El sistema debería controlar el acceso a las funcionalidades de acuerdo con los roles y permisos definidos. | Seguridad | Propuesta de análisis |
| RNF-04 | El sistema debería proteger la información almacenada frente a accesos no autorizados. | Seguridad y privacidad | Propuesta de análisis |
| RNF-05 | El sistema debería preservar la integridad de la información relacionada con solicitudes, asignaciones, ambulancias y servicios. | Integridad | Propuesta de análisis |
| RNF-06 | El sistema debería mantener consistencia entre las solicitudes, las asignaciones de recursos y los estados de los servicios. | Consistencia | Propuesta de análisis |
| RNF-07 | El sistema debería facilitar la consulta de información operativa mediante filtros y criterios de búsqueda. | Usabilidad | Propuesta de análisis |
| RNF-08 | El sistema debería contar con mecanismos que permitan respaldar y recuperar la información, de acuerdo con la estrategia de administración de datos definida. | Confiabilidad | Propuesta de análisis |
| RNF-09 | El sistema debería facilitar el mantenimiento y la evolución de sus componentes mediante una organización modular. | Mantenibilidad | Propuesta de análisis |
| RNF-10 | El sistema debería permitir la consulta y gestión de información desde navegadores web compatibles, según las condiciones de implementación. | Compatibilidad | Propuesta de análisis |
| RNF-11 | El sistema debería procurar tiempos de respuesta adecuados para las operaciones habituales de consulta y gestión. | Rendimiento | Propuesta de análisis |
| RNF-12 | El sistema debería manejar la información personal y los datos relacionados con la atención de acuerdo con las disposiciones legales aplicables. | Privacidad y cumplimiento | Propuesta de análisis |
| RNF-13 | El sistema debería facilitar la trazabilidad de las operaciones relevantes realizadas por usuarios autorizados. | Auditoría | Propuesta de análisis |
| RNF-14 | El sistema debería utilizar mecanismos seguros de comunicación y configuración cuando sea desplegado en un entorno de producción. | Seguridad | Propuesta de análisis |

## 8. Casos de uso

| ID | Caso de uso | Actor principal | Requisitos relacionados |
|---|---|---|---|
| CU-01 | Iniciar sesión | Todos | RF-01 |
| CU-02 | Cerrar sesión | Todos | RF-02 |
| CU-03 | Consultar tablero de indicadores | Administrador, Coordinador, Director | RF-04, RF-27, RF-28 |
| CU-04 | Gestionar usuarios | Administrador | RF-03 |
| CU-05 | Registrar ambulancia | Administrador | RF-05 |
| CU-06 | Actualizar ambulancia | Administrador | RF-06, RF-08 |
| CU-07 | Consultar ambulancias | Administrador, Coordinador | RF-07, RF-08 |
| CU-08 | Gestionar personal operativo | Administrador | RF-09, RF-10 |
| CU-09 | Consultar personal operativo | Administrador, Coordinador | RF-11 |
| CU-10 | Registrar solicitud de servicio | Coordinador | RF-12, RF-15 |
| CU-11 | Consultar solicitudes de servicio | Coordinador, Director | RF-13 |
| CU-12 | Actualizar solicitud de servicio | Coordinador | RF-14 |
| CU-13 | Consultar disponibilidad de recursos | Coordinador | RF-16 |
| CU-14 | Asignar ambulancia | Coordinador | RF-17 |
| CU-15 | Asignar personal operativo | Coordinador | RF-18 |
| CU-16 | Consultar asignación | Coordinador, Personal operativo | RF-19 |
| CU-17 | Actualizar estado de servicio | Coordinador, Personal operativo | RF-20 |
| CU-18 | Registrar novedad del servicio | Personal operativo, Coordinador | RF-21 |
| CU-19 | Consultar historial de servicios | Coordinador, Director | RF-22 |
| CU-20 | Consultar información de ambulancias | Coordinador, Director | RF-23 |
| CU-21 | Consultar información del personal | Coordinador, Director | RF-24 |
| CU-22 | Generar reportes operativos | Coordinador, Director | RF-25, RF-26 |
| CU-23 | Consultar indicadores de gestión | Coordinador, Director | RF-27 |
| CU-24 | Consultar información consolidada | Director | RF-28 |

## 9. Descripción preliminar de casos de uso

### CU-01. Iniciar sesión

**Actor:** Usuario autorizado.

**Objetivo:** Acceder a las funcionalidades del sistema mediante un mecanismo de autenticación.

**Descripción:** El usuario proporciona las credenciales requeridas. El sistema debe validar la información y permitir el acceso de acuerdo con los permisos definidos.

### CU-02. Cerrar sesión

**Actor:** Usuario autenticado.

**Objetivo:** Finalizar la sesión de usuario.

**Descripción:** El usuario ejecuta la acción de cierre de sesión y el sistema finaliza el acceso a la sesión autenticada.

### CU-03. Consultar tablero de indicadores

**Actor:** Administrador, Coordinador operativo, Director.

**Objetivo:** Consultar información consolidada relacionada con la operación del sistema.

**Descripción:** El usuario accede al tablero de indicadores y consulta la información disponible según su perfil y permisos.

### CU-04. Gestionar usuarios

**Actor:** Administrador.

**Objetivo:** Administrar los usuarios que tienen acceso al sistema.

**Descripción:** El administrador consulta, registra, actualiza o elimina usuarios de acuerdo con las funciones autorizadas y los criterios de gestión establecidos.

### CU-05. Registrar ambulancia

**Actor:** Administrador.

**Objetivo:** Incorporar una ambulancia a la información administrada por el sistema.

**Descripción:** El administrador diligencia la información requerida para identificar la ambulancia y realiza el registro correspondiente.

### CU-06. Actualizar ambulancia

**Actor:** Administrador.

**Objetivo:** Actualizar la información asociada a una ambulancia registrada.

**Descripción:** El administrador consulta la ambulancia, modifica la información autorizada y solicita guardar los cambios.

### CU-07. Consultar ambulancias

**Actor:** Administrador, Coordinador operativo.

**Objetivo:** Consultar las ambulancias registradas y la información disponible sobre ellas.

**Descripción:** El usuario consulta el listado de ambulancias y revisa la información y los estados operativos registrados.

### CU-08. Gestionar personal operativo

**Actor:** Administrador.

**Objetivo:** Administrar la información del personal operativo.

**Descripción:** El administrador registra o actualiza la información correspondiente al personal operativo vinculado a las actividades del sistema.

### CU-09. Consultar personal operativo

**Actor:** Administrador, Coordinador operativo.

**Objetivo:** Consultar la información del personal operativo.

**Descripción:** El usuario consulta los registros disponibles del personal operativo para apoyar la gestión de recursos humanos y la coordinación de servicios.

### CU-10. Registrar solicitud de servicio

**Actor:** Coordinador operativo.

**Objetivo:** Registrar una solicitud de transporte asistencial.

**Descripción:** El coordinador diligencia los datos requeridos de la solicitud, incluyendo la información relacionada con el servicio, su clasificación y los datos necesarios para gestionar la operación.

### CU-11. Consultar solicitudes de servicio

**Actor:** Coordinador operativo, Director.

**Objetivo:** Consultar las solicitudes registradas.

**Descripción:** El usuario accede a las solicitudes de servicio y consulta su información, estado y detalles disponibles.

### CU-12. Actualizar solicitud de servicio

**Actor:** Coordinador operativo.

**Objetivo:** Modificar información de una solicitud registrada cuando corresponda.

**Descripción:** El coordinador selecciona una solicitud, revisa los datos disponibles y realiza las actualizaciones permitidas.

### CU-13. Consultar disponibilidad de recursos

**Actor:** Coordinador operativo.

**Objetivo:** Consultar la disponibilidad de ambulancias y personal operativo para apoyar la asignación de servicios.

**Descripción:** El coordinador consulta los recursos registrados y la información de disponibilidad que el sistema tenga definida.

### CU-14. Asignar ambulancia

**Actor:** Coordinador operativo.

**Objetivo:** Asociar una ambulancia a una solicitud de servicio.

**Descripción:** El coordinador selecciona la solicitud y consulta los recursos disponibles para realizar la asignación de una ambulancia, de acuerdo con los criterios operativos definidos.

### CU-15. Asignar personal operativo

**Actor:** Coordinador operativo.

**Objetivo:** Asociar personal operativo a un servicio.

**Descripción:** El coordinador selecciona los integrantes del personal operativo que serán vinculados al servicio, de acuerdo con los criterios de asignación establecidos.

### CU-16. Consultar asignación

**Actor:** Coordinador operativo, Personal operativo.

**Objetivo:** Consultar la información de una asignación de servicio.

**Descripción:** El usuario consulta los datos de la asignación, incluyendo la solicitud, los recursos asociados y la información disponible del servicio.

### CU-17. Actualizar estado de servicio

**Actor:** Coordinador operativo, Personal operativo.

**Objetivo:** Actualizar el estado operativo de un servicio.

**Descripción:** El usuario autorizado registra o actualiza el estado del servicio de acuerdo con el flujo operativo definido.

### CU-18. Registrar novedad del servicio

**Actor:** Personal operativo, Coordinador operativo.

**Objetivo:** Registrar una novedad relacionada con la ejecución de un servicio.

**Descripción:** El usuario autorizado registra la información pertinente de una novedad ocurrida durante el desarrollo del servicio.

### CU-19. Consultar historial de servicios

**Actor:** Coordinador operativo, Director.

**Objetivo:** Consultar los servicios registrados y su información histórica.

**Descripción:** El usuario consulta los servicios disponibles y revisa la información relacionada con su registro, asignación y estado.

### CU-20. Consultar información de ambulancias

**Actor:** Coordinador operativo, Director.

**Objetivo:** Consultar información de las ambulancias y su relación con los servicios.

**Descripción:** El usuario revisa la información disponible sobre las ambulancias, sus estados y los servicios relacionados.

### CU-21. Consultar información del personal

**Actor:** Coordinador operativo, Director.

**Objetivo:** Consultar información del personal operativo y los servicios relacionados.

**Descripción:** El usuario consulta los registros disponibles del personal operativo y la información asociada a su participación en servicios.

### CU-22. Generar reportes operativos

**Actor:** Coordinador operativo, Director.

**Objetivo:** Obtener información consolidada de los servicios registrados.

**Descripción:** El usuario selecciona los criterios disponibles y consulta los resultados del reporte de acuerdo con la información almacenada.

### CU-23. Consultar indicadores de gestión

**Actor:** Coordinador operativo, Director.

**Objetivo:** Consultar indicadores relacionados con la operación y gestión de los servicios.

**Descripción:** El usuario consulta indicadores que permitan analizar la información operativa disponible.

### CU-24. Consultar información consolidada

**Actor:** Director.

**Objetivo:** Consultar información general de la operación del SGA para apoyar la toma de decisiones.

**Descripción:** El director consulta información consolidada relacionada con los servicios, recursos y demás datos operativos disponibles.

## 10. Reglas de negocio preliminares

| ID | Regla de negocio | Descripción |
|---|---|---|
| RN-01 | Identificación de solicitudes | Cada solicitud de servicio debe contar con información que permita identificarla y consultarla. |
| RN-02 | Clasificación del servicio | Las solicitudes deben clasificarse según los criterios de transporte asistencial definidos para el sistema. |
| RN-03 | Disponibilidad de ambulancias | La asignación de una ambulancia debe considerar la información de disponibilidad y estado operativo registrada. |
| RN-04 | Disponibilidad de personal | La asignación de personal debe considerar la información de disponibilidad y los criterios operativos establecidos. |
| RN-05 | Relación solicitud-asignación | Toda asignación debe estar relacionada con una solicitud de servicio identificable. |
| RN-06 | Relación asignación-ambulancia | Las asignaciones deben identificar la ambulancia asociada al servicio. |
| RN-07 | Relación asignación-personal | Las asignaciones deben identificar el personal operativo vinculado al servicio, de acuerdo con los criterios establecidos. |
| RN-08 | Control de estados | Los servicios deben manejar estados definidos que permitan identificar su situación operativa. |
| RN-09 | Consistencia operativa | Los cambios de estado y las asignaciones deben mantener consistencia con la información del servicio y sus recursos asociados. |
| RN-10 | Acceso autorizado | Las funciones del sistema deben estar restringidas de acuerdo con los roles y permisos definidos. |
| RN-11 | Trazabilidad | La información relevante de los servicios y sus operaciones debe permitir su consulta y seguimiento, según el alcance definido. |
| RN-12 | Gestión de novedades | Las novedades registradas deben estar asociadas al servicio correspondiente. |

## 11. Matriz de trazabilidad: requisitos funcionales y casos de uso

| Requisito | Caso de uso relacionado |
|---|---|
| RF-01 | CU-01 Iniciar sesión |
| RF-02 | CU-02 Cerrar sesión |
| RF-03 | CU-04 Gestionar usuarios |
| RF-04 | CU-03 Consultar tablero de indicadores |
| RF-05 | CU-05 Registrar ambulancia |
| RF-06 | CU-06 Actualizar ambulancia |
| RF-07 | CU-07 Consultar ambulancias |
| RF-08 | CU-06 Actualizar ambulancia, CU-07 Consultar ambulancias |
| RF-09 | CU-08 Gestionar personal operativo |
| RF-10 | CU-08 Gestionar personal operativo |
| RF-11 | CU-09 Consultar personal operativo |
| RF-12 | CU-10 Registrar solicitud de servicio |
| RF-13 | CU-11 Consultar solicitudes de servicio |
| RF-14 | CU-12 Actualizar solicitud de servicio |
| RF-15 | CU-10 Registrar solicitud de servicio |
| RF-16 | CU-13 Consultar disponibilidad de recursos |
| RF-17 | CU-14 Asignar ambulancia |
| RF-18 | CU-15 Asignar personal operativo |
| RF-19 | CU-16 Consultar asignación |
| RF-20 | CU-17 Actualizar estado de servicio |
| RF-21 | CU-18 Registrar novedad del servicio |
| RF-22 | CU-19 Consultar historial de servicios |
| RF-23 | CU-20 Consultar información de ambulancias |
| RF-24 | CU-21 Consultar información del personal |
| RF-25 | CU-22 Generar reportes operativos |
| RF-26 | CU-22 Generar reportes operativos |
| RF-27 | CU-03 Consultar tablero de indicadores, CU-23 Consultar indicadores de gestión |
| RF-28 | CU-24 Consultar información consolidada |

## 12. Relaciones preliminares entre casos de uso

Las relaciones se plantean como una referencia para el modelado UML. Su representación definitiva debe ajustarse al diagrama de casos de uso.

| Caso de uso principal | Caso de uso relacionado | Relación conceptual |
|---|---|---|
| CU-14 Asignar ambulancia | CU-13 Consultar disponibilidad de recursos | Consulta previa necesaria para la asignación. |
| CU-15 Asignar personal operativo | CU-13 Consultar disponibilidad de recursos | Consulta previa necesaria para la asignación. |
| CU-14 Asignar ambulancia | CU-16 Consultar asignación | La asignación genera información susceptible de consulta. |
| CU-15 Asignar personal operativo | CU-16 Consultar asignación | La asociación de personal forma parte de la información de asignación. |
| CU-17 Actualizar estado de servicio | CU-16 Consultar asignación | La consulta de la asignación permite identificar el servicio sobre el cual se actualiza el estado. |
| CU-18 Registrar novedad del servicio | CU-16 Consultar asignación | La novedad debe asociarse al servicio correspondiente. |
| CU-22 Generar reportes operativos | CU-19 Consultar historial de servicios | Los reportes pueden utilizar información histórica de los servicios. |
| CU-23 Consultar indicadores de gestión | CU-22 Generar reportes operativos | Los indicadores pueden derivarse de información consolidada de operación. |

Estas relaciones no implican automáticamente el uso de relaciones UML <<include>> o <<extend>>. La decisión de representarlas de esa manera deberá sustentarse en el comportamiento y la dependencia real de cada caso de uso.

## 13. Consideraciones y limitaciones del análisis

- Los requisitos corresponden a una propuesta preliminar de análisis del SGA.
- No se afirma que el sistema se encuentre implementado.
- No se afirma que los requisitos hayan sido validados formalmente por usuarios del servicio.
- No se reportan resultados de entrevistas, encuestas o pruebas que no hayan sido aplicadas.
- Las reglas de negocio requieren revisión y validación con responsables del contexto operativo.
- La clasificación de los servicios de transporte asistencial debe revisarse con base en los referentes normativos aplicables y las condiciones reales del servicio.
- La asignación de recursos debe considerar criterios operativos, disponibilidad y restricciones que deberán definirse durante el análisis.
- La información relacionada con pacientes y servicios asistenciales debe tratarse con criterios de privacidad, seguridad y cumplimiento normativo.
- El documento constituye una base para el modelado conceptual, la identificación de actores y la elaboración del diagrama UML de casos de uso.

## 14. Conclusiones

La matriz de requisitos y casos de uso permite organizar preliminarmente las funcionalidades que se consideran necesarias para el Sistema Gestor de Ambulancias (SGA), a partir de la identificación de actores, procesos, requisitos funcionales, requisitos no funcionales y reglas de negocio.

La identificación del administrador, coordinador operativo, personal operativo y director permite establecer una estructura inicial de responsabilidades y relaciones con las funcionalidades del sistema.

La trazabilidad entre requisitos funcionales y casos de uso proporciona una referencia para continuar con el modelado conceptual y la elaboración del diagrama UML de casos de uso.

Los requisitos y reglas de negocio aquí documentados deberán ser revisados y validados en etapas posteriores del proyecto, con el propósito de verificar su correspondencia con las necesidades reales del contexto operativo.

---

**Documento:** Matriz de requisitos y casos de uso – G1-P1 Plan de análisis  
**Proyecto:** Sistema Gestor de Ambulancias (SGA)  
**Programa:** Análisis y Desarrollo de Software (ADSO)  
**Fase:** Análisis  
**Evidencia:** G1-P1 – Plan de análisis  
**Estado:** Documento de análisis preliminar.
