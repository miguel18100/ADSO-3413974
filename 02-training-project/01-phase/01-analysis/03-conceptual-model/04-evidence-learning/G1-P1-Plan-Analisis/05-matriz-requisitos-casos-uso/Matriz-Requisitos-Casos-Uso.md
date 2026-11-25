# Matriz de requisitos y casos de uso - G1-P1 Plan de análisis

## 1. Introducción

Esta matriz consolida los requisitos funcionales (RF), los requisitos no funcionales (RNF), los actores, las reglas de negocio y los casos de uso preliminares del Sistema Gestor de Ambulancias (SGA). Su finalidad es relacionar las funciones identificadas con los objetivos de los actores y ofrecer una base verificable para el diagrama UML.

Los requisitos constituyen una línea base de análisis derivada del alcance y los objetivos del proyecto SGA y de los instrumentos de levantamiento disponibles. Los instrumentos consultados están diseñados, pero no contienen respuestas diligenciadas; por ello, los requisitos se consideran preliminares y requieren validación con usuarios del contexto.

## 2. Objetivo

Relacionar el 100 % de los requisitos funcionales de la línea base de esta matriz con uno o más casos de uso, diferenciando los requisitos funcionales de los no funcionales y manteniendo coherencia con el diagrama UML.

## 3. Alcance de la línea base

La línea base de G1-P1 se limita al núcleo operativo de ambulancias: usuarios y acceso, ambulancias TAB/TAM, personal operativo, solicitudes, clasificación, disponibilidad, asignación, seguimiento, novedades, historial e informes.

**Control de consistencia de las fuentes:** el repositorio contiene `Proyecto Sistema Gestor de ambulancia Version 2.docx`, `Instrumentos_SGA_Completos (1) (1).docx` y `SGA_SRS.pdf`. Los dos primeros describen el proyecto de ambulancias y sus instrumentos. El PDF `SGA_SRS.pdf` incluye además secciones de módulos (por ejemplo, cartera/finanzas, visitantes, PQRS, unidades/residentes y proveedores) que no aparecen descritas en el alcance del documento de proyecto de ambulancias. Para esta evidencia no se incorporan esas funciones ajenas al alcance operativo sin confirmación; quedan señaladas como inconsistencia documental que debe aclararse antes de afirmar cobertura de todo el contenido del PDF. La conciliación por módulo y la decisión requerida para cerrar C3 se documentan en [Conciliacion-Alcance-SRS.md](../07-conciliacion-srs/Conciliacion-Alcance-SRS.md).

## 4. Fuentes de identificación

| Fuente | Uso en esta matriz | Limitación identificada |
|---|---|---|
| `Proyecto Sistema Gestor de ambulancia Version 2.docx` | Contexto, objetivo, alcance, módulos, actores y procesos de operación | Documento de descripción del proyecto; no aporta un catálogo completo y numerado de RF en el archivo revisado. |
| `Instrumentos_SGA_Completos (1) (1).docx` | Necesidades y preguntas previstas para encuesta, entrevista, observación y cuestionario | Contiene instrumentos diseñados, no respuestas diligenciadas ni resultados de aplicación. |
| `SGA_SRS.pdf` | Referencia complementaria para identificar secciones de requisitos | Presenta módulos que no concuerdan claramente con el alcance de ambulancias; se requiere reconciliación documental. |

## 5. Actores del sistema

Los perfiles se normalizan según la sección 2.2 del `SGA_SRS.pdf`. Paramédico TAB y Paramédico TAM se conservan como actores distintos porque tienen responsabilidades y tipos de transporte asistencial diferenciados.

| ID | Actor | Responsabilidades y casos de uso que inicia |
|---|---|---|
| A-00 | Usuario del SGA (actor abstracto general) | Representa los objetivos comunes de iniciar sesión, cerrar sesión y acceder a documentos/protocolos según permisos. No representa un perfil real adicional. |
| A-06 | Personal operativo (actor abstracto intermedio) | Agrupa los objetivos compartidos por Coordinador, Paramédico TAB y Paramédico TAM: consultar asignaciones, actualizar estados, gestionar novedades, consultar historial. |
| A-01 | Administrador | Hereda inicio/cierre y acceso documental; consulta tablero, gestiona usuarios, ambulancias y personal, y consulta auditoría. |
| A-02 | Coordinador operativo | Hereda inicio/cierre, acceso documental y objetivos operativos comunes; además gestiona recursos y solicitudes, clasifica servicios, consulta disponibilidad, asigna recursos e informes. |
| A-03 | Paramédico TAB | Hereda inicio/cierre, acceso documental y objetivos operativos comunes; opera servicios de transporte asistencial básico. |
| A-04 | Paramédico TAM | Hereda inicio/cierre, acceso documental y objetivos operativos comunes; opera servicios de transporte asistencial medicalizado. |
| A-05 | Analista/directivo | Hereda inicio/cierre y acceso documental; consulta tablero, historial, reportes, indicadores y auditoría según permisos. |

Se aplica generalización en dos niveles: los cinco perfiles concretos heredan los objetivos comunes de **Usuario del SGA**; Coordinador, Paramédico TAB y Paramédico TAM también especializan **Personal operativo**, que agrupa las funciones comunes de operación. Las asociaciones específicas de cada rol permanecen separadas para no otorgar permisos por herencia que no estén definidos.

Los requisitos funcionales se presentan como una línea base de análisis preliminar del SGA. Los RF-29 a RF-31 se incorporan de forma diferenciada a partir de los objetivos de la sección 6.2 del SRS, que no estaban expresados como requisitos individuales en la tabla inicial.

| ID | Requisito funcional | Actor principal | Prioridad |
|---|---|---|---|
| RF-01 | El sistema debe permitir el inicio de sesión de los usuarios mediante mecanismos de autenticación definidos. | Administrador, Coordinador, Paramédico TAB, Paramédico TAM, Director | Alta |
| RF-02 | El sistema debe permitir cerrar la sesión del usuario autenticado. | Todos los perfiles autorizados | Alta |
| RF-03 | El sistema debe permitir gestionar usuarios, incluyendo consulta, creación, actualización y eliminación según permisos. | Administrador | Alta |
| RF-04 | El sistema debe permitir consultar un tablero operativo con el estado actual de solicitudes, servicios y recursos, de acuerdo con el rol autorizado. | Administrador, Coordinador, Director | Alta |
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
| RF-19 | El sistema debe permitir consultar los detalles de las asignaciones realizadas. | Coordinador, Paramédico TAB, Paramédico TAM | Alta |
| RF-20 | El sistema debe permitir actualizar el estado de un servicio durante su ciclo operativo. | Coordinador, Paramédico TAB, Paramédico TAM | Alta |
| RF-21 | El sistema debe permitir registrar novedades asociadas a la ejecución de un servicio, según los permisos definidos. | Paramédico TAB, Paramédico TAM, Coordinador | Media |
| RF-22 | El sistema debe permitir consultar el historial de servicios registrados. | Coordinador, Director | Alta |
| RF-23 | El sistema debe permitir consultar información relacionada con ambulancias y sus servicios asociados. | Coordinador, Director | Media |
| RF-24 | El sistema debe permitir consultar información relacionada con el personal operativo y los servicios asociados, según permisos. | Coordinador, Director | Media |
| RF-25 | El sistema debe permitir generar reportes operativos sobre los servicios registrados. | Coordinador, Director | Alta |
| RF-26 | El sistema debe permitir filtrar reportes por criterios disponibles, como fechas, estado del servicio y recursos asociados. | Coordinador, Director | Media |
| RF-27 | El sistema debe permitir consultar indicadores relacionados con la gestión y operación de los servicios. | Director, Coordinador | Media |
| RF-28 | El sistema debe permitir consultar información consolidada para apoyar la toma de decisiones administrativas y operativas. | Director | Media |
| RF-29 | El sistema debe permitir registrar y consultar los datos básicos del paciente asociados a un servicio prehospitalario, limitados a la información necesaria para la gestión operativa y la atención inicial. | Paramédico TAB, Paramédico TAM | Alta |
| RF-30 | El sistema debe permitir al Paramédico TAM registrar las intervenciones prehospitalarias realizadas durante un servicio, sin constituir una historia clínica electrónica completa. | Paramédico TAM | Media |
| RF-31 | El sistema debe permitir cerrar un servicio finalizado registrando el resumen de atención, condición de salida, destino asistencial, tiempos y observaciones autorizadas. | Coordinador operativo | Alta |

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

## 8. Catálogo consolidado de casos de uso

Los casos se nombran con verbo más objeto y representan objetivos de los actores. Las operaciones CRUD se agrupan dentro de los casos de gestión, salvo cuando la fuente identifica un objetivo operativo separado (por ejemplo, registrar una solicitud o clasificarla).

| ID | Caso de uso | Actor(es) iniciador(es) | Requisitos funcionales cubiertos | Objetivo |
|---|---|---|---|---|
| CU-01 | Iniciar sesión | Todos | RF-01 | Acceder al sistema según el rol asignado. |
| CU-02 | Cerrar sesión | Todos | RF-02 | Finalizar la sesión del usuario autenticado. |
| CU-03 | Consultar tablero operativo | Administrador, Coordinador, Analista/directivo | RF-04 | Consultar el estado actual de solicitudes, servicios, ambulancias y recursos disponibles, sin duplicar los indicadores históricos de CU-17. |
| CU-04 | Gestionar usuarios, roles y permisos | Administrador | RF-03 | Consultar, crear, actualizar o desactivar usuarios y administrar sus permisos. |
| CU-05 | Gestionar ambulancias | Administrador, Coordinador | RF-05, RF-06, RF-07, RF-08, RF-23 | Registrar, consultar y actualizar la información y el estado operativo de las ambulancias TAB/TAM. |
| CU-06 | Gestionar personal operativo | Administrador, Coordinador | RF-09, RF-10, RF-11, RF-24 | Registrar, actualizar y consultar la información del personal y su disponibilidad autorizada. |
| CU-07 | Consultar disponibilidad de recursos | Coordinador | RF-16 | Consultar disponibilidad de ambulancias y personal antes de asignar un servicio. |
| CU-08 | Registrar solicitud de servicio | Coordinador | RF-12 | Registrar los datos necesarios para una solicitud de transporte asistencial. |
| CU-09 | Gestionar solicitudes de servicio | Coordinador | RF-13, RF-14 | Consultar y actualizar solicitudes registradas según permisos. |
| CU-10 | Clasificar solicitud de servicio | Coordinador | RF-15 | Clasificar la solicitud según los criterios TAB/TAM y las necesidades del servicio. |
| CU-11 | Asignar ambulancia y personal | Coordinador | RF-17, RF-18 | Asociar a una solicitud los recursos compatibles y disponibles. |
| CU-12 | Consultar asignaciones | Coordinador, Paramédico TAB, Paramédico TAM | RF-19 | Consultar el detalle de la asignación y los recursos asociados. |
| CU-13 | Actualizar estado del servicio | Coordinador, Paramédico TAB, Paramédico TAM | RF-20 | Actualizar el estado operativo del servicio durante su ciclo. |
| CU-14 | Gestionar novedades operativas | Paramédico TAB, Paramédico TAM, Coordinador | RF-21 y SRS 4.8 RF-61 a RF-76 | Registrar, clasificar, priorizar, asignar, actualizar y consultar novedades asociadas a servicios o ambulancias, con evidencia y trazabilidad según permisos. |
| CU-15 | Consultar historial de servicios | Coordinador, Paramédico TAB, Paramédico TAM, Analista/directivo | RF-22 | Consultar servicios registrados y su evolución histórica, según permisos. |
| CU-16 | Generar reportes operativos | Coordinador, Analista/directivo | RF-25, RF-26 | Generar reportes filtrados por fechas, estado y recursos asociados. |
| CU-17 | Consultar indicadores de gestión | Coordinador, Analista/directivo | RF-27, RF-28 y SRS 4.8 RF-75 | Consultar indicadores e información consolidada para apoyar decisiones. |
| CU-18 | Consultar auditoría operativa | Administrador, Analista/directivo | SRS 4.7 RF-41 a RF-60 | Consultar registros de auditoría, filtrar eventos, revisar detalle e historial y exportar resultados según permisos. |
| CU-19 | Gestionar documentos y protocolos operativos | Administrador, Coordinador, Paramédico TAB, Paramédico TAM, Analista/directivo | SRS 4.6: RF-20 a RF-40 (21 registros de la tabla; incluye IDs repetidos) | Cargar, clasificar, describir, versionar, consultar, visualizar, descargar, asociar y controlar documentos operativos y protocolos según rol; conserva auditoría e integridad. |
| CU-20 | Registrar datos básicos del paciente | Paramédico TAB, Paramédico TAM | RF-29; SRS §6.2, CU-11 | Registrar los datos mínimos de identificación y atención inicial del paciente asociados al servicio; no sustituye ni pretende gestionar una historia clínica completa. |
| CU-21 | Registrar intervenciones prehospitalarias | Paramédico TAM | RF-30; SRS §6.2, CU-12 | Registrar las intervenciones realizadas por personal TAM durante el servicio, con fecha, descripción y relación con el servicio atendido, según permisos. |
| CU-22 | Cerrar servicio | Coordinador operativo | RF-31; SRS §6.2, CU-07 (segunda aparición, identificador duplicado) | Registrar el cierre operativo del servicio con resumen de atención, condición de salida, destino asistencial, tiempos y observaciones autorizadas. |

## 9. Descripción resumida de los casos de uso

| Caso de uso | Descripción resumida |
|---|---|
| CU-01 Iniciar sesión | El usuario proporciona sus credenciales; el sistema valida la identidad y concede acceso según el rol. |
| CU-02 Cerrar sesión | El usuario solicita finalizar su sesión; el sistema termina el acceso autenticado. |
| CU-03 Consultar tablero operativo | El actor consulta el estado actual de solicitudes, servicios, ambulancias y recursos; el sistema presenta información operativa vigente según permisos. |
| CU-04 Gestionar usuarios, roles y permisos | El administrador consulta o mantiene registros de usuarios y asigna permisos dentro de sus atribuciones. |
| CU-05 Gestionar ambulancias | El administrador o coordinador consulta y mantiene datos de ambulancias, incluyendo tipo TAB/TAM y estado operativo. |
| CU-06 Gestionar personal operativo | El administrador o coordinador consulta y mantiene información autorizada del personal relacionado con los servicios. |
| CU-07 Consultar disponibilidad de recursos | El coordinador consulta la disponibilidad de ambulancias y personal para preparar una asignación. |
| CU-08 Registrar solicitud de servicio | El coordinador registra la información requerida para iniciar la gestión de un servicio. |
| CU-09 Gestionar solicitudes de servicio | El coordinador consulta y actualiza la información de solicitudes, respetando estados y permisos. |
| CU-10 Clasificar solicitud de servicio | El coordinador clasifica la solicitud conforme a los criterios y necesidades de transporte asistencial. |
| CU-11 Asignar ambulancia y personal | El coordinador selecciona los recursos compatibles; el sistema considera la disponibilidad registrada. |
| CU-12 Consultar asignaciones | El coordinador o personal operativo consulta la asignación vinculada a un servicio. |
| CU-13 Actualizar estado del servicio | El actor autorizado actualiza el estado del servicio y el sistema conserva la información correspondiente. |
| CU-14 Gestionar novedades operativas | El actor registra o consulta una novedad, clasifica el incidente, asigna prioridad y responsables, adjunta evidencia y actualiza su estado; el sistema conserva la trazabilidad. |
| CU-15 Consultar historial de servicios | El actor autorizado consulta el historial de servicios y los datos disponibles para seguimiento. |
| CU-16 Generar reportes operativos | El actor define filtros disponibles y solicita reportes basados en la información registrada. |
| CU-17 Consultar indicadores de gestión | El actor consulta indicadores y datos consolidados según sus permisos. |
| CU-18 Consultar auditoría operativa | El administrador o analista consulta eventos, filtra por usuario, operación, módulo y fecha, revisa detalle y exporta registros según permisos. |
| CU-19 Gestionar documentos y protocolos operativos | Los usuarios autorizados cargan o adjuntan documentos y protocolos, clasifican metadatos, consultan, visualizan o descargan archivos, consultan versiones y respetan niveles de acceso; las acciones sensibles quedan auditadas. |
| CU-20 Registrar datos básicos del paciente | El Paramédico TAB o TAM registra los datos mínimos del paciente vinculados al servicio; el sistema limita el registro a la información necesaria para la gestión prehospitalaria. |
| CU-21 Registrar intervenciones prehospitalarias | El Paramédico TAM registra las intervenciones efectuadas durante el traslado o atención; el sistema las vincula al servicio sin crear una historia clínica completa. |
| CU-22 Cerrar servicio | El Coordinador operativo verifica los datos de cierre y registra el resultado final del servicio, destino asistencial, tiempos y observaciones autorizadas. |

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
| RN-13 | Datos mínimos del paciente | Los datos del paciente se registran asociados a un servicio y limitados a la información necesaria para la atención prehospitalaria; no se gestiona una historia clínica integral. |
| RN-14 | Registro de intervenciones TAM | Las intervenciones prehospitalarias se registran únicamente por el perfil TAM autorizado y quedan asociadas al servicio correspondiente. |
| RN-15 | Cierre trazable del servicio | El cierre debe conservar el resumen de atención, condición de salida, destino asistencial, tiempos y observaciones autorizadas antes de marcar el servicio como finalizado. |

## 11. Matriz de trazabilidad: requisito funcional a caso de uso

| Requisito | Caso(s) de uso relacionado(s) | Cobertura |
|---|---|---|
| RF-01 | CU-01 | Cubierto |
| RF-02 | CU-02 | Cubierto |
| RF-03 | CU-04 | Cubierto |
| RF-04 | CU-03 | Cubierto |
| RF-05 | CU-05 | Cubierto |
| RF-06 | CU-05 | Cubierto |
| RF-07 | CU-05 | Cubierto |
| RF-08 | CU-05 | Cubierto |
| RF-09 | CU-06 | Cubierto |
| RF-10 | CU-06 | Cubierto |
| RF-11 | CU-06 | Cubierto |
| RF-12 | CU-08 | Cubierto |
| RF-13 | CU-09 | Cubierto |
| RF-14 | CU-09 | Cubierto |
| RF-15 | CU-10 | Cubierto |
| RF-16 | CU-07 | Cubierto |
| RF-17 | CU-11 | Cubierto |
| RF-18 | CU-11 | Cubierto |
| RF-19 | CU-12 | Cubierto |
| RF-20 | CU-13 | Cubierto |
| RF-21 | CU-14 | Cubierto |
| RF-22 | CU-15 | Cubierto |
| RF-23 | CU-05 | Cubierto |
| RF-24 | CU-06 | Cubierto |
| RF-25 | CU-16 | Cubierto |
| RF-26 | CU-16 | Cubierto |
| RF-27 | CU-17 | Cubierto |
| RF-28 | CU-17 | Cubierto |
| RF-29 | CU-20 | Cubierto |
| RF-30 | CU-21 | Cubierto |
| RF-31 | CU-22 | Cubierto |

### 11.1 Resultado de cobertura

- Requisitos funcionales consolidados del análisis (28 RF iniciales + 3 RF derivados de los objetivos de la sección 6.2 del SRS): **31**.
- Requisitos funcionales relacionados con al menos un caso de uso: **31**.
- Requisitos funcionales no cubiertos dentro de esta línea base consolidada: **0**.
- Cobertura de la línea base consolidada: **31/31 = 100 %**.
- Requisitos no funcionales identificados por separado: **14**. No se fuerzan como casos de uso porque describen atributos o restricciones de calidad y no objetivos funcionales independientes. Los RF-29 a RF-31 proceden de los objetivos operativos descritos en §6.2 del SRS y se incorporan como requisitos diferenciados para cubrir paciente, intervención TAM y cierre de servicio.

**Límite de esta cifra:** el 100 % corresponde a los 31 RF consolidados para el alcance operativo de ambulancias en esta matriz. No debe presentarse como 100 % de todos los módulos que aparecen en el PDF `SGA_SRS.pdf`, mientras no se resuelva la inconsistencia entre ese archivo y el documento de alcance del proyecto. Las funciones ajenas al alcance no se ocultan: se identifican en la sección 14 y requieren decisión del instructor/equipo.

## 12. Relaciones entre casos de uso y justificación UML

| Caso base | Caso relacionado | Relación y dirección | Justificación de una línea |
|---|---|---|---|
| CU-11 Asignar ambulancia y personal | CU-07 Consultar disponibilidad de recursos | `CU-11 ..> CU-07` `<<include>>` | La consulta de disponibilidad siempre forma parte de la asignación para evitar seleccionar recursos no disponibles. |

**Punto de extensión de CU-13:** `registrarNovedad`, durante el seguimiento o la actualización del estado del servicio, cuando se presenta una novedad operativa.  
**Justificación de cada generalización (la flecha apunta del perfil especializado al actor general):**

| Relación | Justificación |
|---|---|
| Administrador → Usuario del SGA | El administrador comparte con los demás perfiles autenticados los objetivos de iniciar/cerrar sesión y acceder a documentos autorizados. |
| Coordinador operativo → Personal operativo | El coordinador comparte la consulta de asignaciones, actualización de estados, gestión de novedades, consulta de historial y registro de datos básicos de pacientes con el personal de campo. |
| Paramédico TAB → Personal operativo | El perfil TAB participa en las funciones operativas comunes, sin heredar las funciones administrativas del coordinador. |
| Paramédico TAM → Personal operativo | El perfil TAM comparte las funciones operativas comunes y conserva, además, su caso exclusivo de registro de intervenciones prehospitalarias TAM. |
| Personal operativo → Usuario del SGA | Todo perfil operativo es un usuario autenticado y comparte inicio/cierre de sesión y acceso documental sujeto a permisos. |
| Analista/directivo → Usuario del SGA | El analista/directivo comparte autenticación y acceso documental, pero no hereda funciones de campo ni de administración de usuarios. |

## 13. Trazabilidad complementaria de requisitos funcionales del SRS

La revisión directa del `SGA_SRS.pdf` identifica tres bloques funcionales relacionados con el SGA de ambulancias: **4.6 Gestión documental y protocolos**, **4.7 Bitácora y auditoría del sistema** y **4.8 Gestión de novedades y bitácora operativa**. Sus 57 registros se trazan como complemento de la línea base consolidada. Los objetivos adicionales descritos en la sección 6.2 del mismo SRS se integran como RF-29 a RF-31 y CU-20 a CU-22.

| Referencia del SRS | Requisito resumido | Caso(s) relacionado(s) / tratamiento |
|---|---|---|
| 4.7 RF-41 | Registrar automáticamente eventos relevantes de usuarios | Transversal a los casos de uso que generan operaciones; consulta mediante CU-18 |
| 4.7 RF-42 | Registrar inicios, cierres e intentos fallidos de autenticación | CU-01, CU-02 y CU-18 |
| 4.7 RF-43 | Registrar operaciones CRUD sobre entidades | CU-04, CU-05, CU-06, CU-09 y CU-14; consulta mediante CU-18 |
| 4.7 RF-44 | Registrar asignaciones de ambulancias TAB/TAM | CU-11 y CU-18 |
| 4.7 RF-45 | Registrar cambios de estado de servicios | CU-13 y CU-18 |
| 4.7 RF-46 | Conservar usuario, fecha, hora, operación, módulo y descripción del evento | Transversal a auditoría; consulta mediante CU-18 |
| 4.7 RF-47 (primera aparición) | Conservar valores anteriores y posteriores en modificaciones | CU-04 a CU-06, CU-09, CU-13, CU-14 y CU-18 |
| 4.7 RF-48 | Consultar registros de auditoría con filtros | CU-18 |
| 4.7 RF-47 (segunda aparición en el PDF) | Visualizar el detalle de cada evento | CU-18; el identificador se conserva como aparece en la fuente y se distingue por su posición |
| 4.7 RF-50 | Identificar y listar eventos críticos | CU-18 y CU-03 |
| 4.7 RF-51 | Registrar y consultar intentos fallidos de autenticación | CU-01 y CU-18 |
| 4.7 RF-52 | Generar alertas ante eventos críticos | CU-03 y CU-18 |
| 4.7 RF-53 | Proteger la inmutabilidad de los registros de auditoría | Transversal a auditoría; verificación mediante CU-18 |
| 4.7 RF-54 | Exportar registros de auditoría | CU-18 |
| 4.7 RF-55 | Consultar historial de auditoría | CU-18 |
| 4.7 RF-56 | Asociar eventos de auditoría a entidades | Transversal a los casos que modifican entidades; consulta mediante CU-18 |
| 4.7 RF-57 (primera aparición) | Visualizar eventos cronológicamente | CU-18 |
| 4.7 RF-58 | Identificar patrones de uso y comportamiento | CU-17 y CU-18 |
| 4.7 RF-57 (segunda aparición en el PDF) | Registrar acciones ejecutadas automáticamente por el sistema | Transversal a los casos automatizados; consulta mediante CU-18 |
| 4.7 RF-60 | Integrar auditoría con el módulo de seguridad | CU-01, CU-04 y CU-18 |
| 4.8 RF-61 | Registrar novedades/incidentes con campos obligatorios | CU-14 |
| 4.8 RF-62 | Clasificar novedades por tipo | CU-14 |
| 4.8 RF-63 | Registrar descripción, fecha, hora, ubicación y reportante | CU-14 |
| 4.8 RF-64 | Asociar una novedad a una ambulancia TAB/TAM | CU-14 |
| 4.8 RF-65 | Asignar prioridad al incidente | CU-14 |
| 4.8 RF-66 | Adjuntar imágenes, documentos o archivos | CU-14 |
| 4.8 RF-67 (primera aparición) | Asignar responsables de resolución | CU-14 |
| 4.8 RF-68 | Gestionar estados de la novedad | CU-14 |
| 4.8 RF-67 (segunda aparición en el PDF) | Registrar cambios en auditoría | CU-14 y CU-18 |
| 4.8 RF-70 | Consultar novedades con filtros avanzados | CU-14 |
| 4.8 RF-71 | Consultar historial completo del incidente | CU-14 |
| 4.8 RF-72 | Agregar comentarios y observaciones | CU-14 |
| 4.8 RF-73 | Resaltar incidencias críticas | CU-03 y CU-14 |
| 4.8 RF-74 | Generar reportes de incidencias | CU-16 |
| 4.8 RF-75 | Consultar estadísticas e indicadores de incidencias | CU-17 |
| 4.8 RF-76 | Garantizar trazabilidad de cada incidente | CU-14 y CU-18 |

### 13.1 Trazabilidad del módulo de gestión documental (SRS 4.6)

El SRS desarrolla un módulo documental y en su sección 7.6 incluye la carga y gestión de protocolos de atención. Por su relación con protocolos operativos, evidencias de novedades y documentos asociados a servicios, se incorpora el objetivo **CU-19 Gestionar documentos y protocolos operativos**. La autorización por rol se apoya en CU-04 y la consulta de eventos de auditoría se realiza mediante CU-18.

| Registro en SRS 4.6 | Descripción resumida del requisito | Caso(s) relacionado(s) | Estado de trazabilidad |
|---|---|---|---|
| RF-20 | Cargar documentos en formatos permitidos y validar tipo/tamaño | CU-19 | Cubierto |
| RF-21 | Clasificar documentos mediante categorías, subcategorías y etiquetas | CU-19 | Cubierto |
| RF-22 | Registrar metadatos de documentos | CU-19 | Cubierto |
| RF-23 | Actualizar documentos conservando versiones | CU-19 | Cubierto |
| RF-24 | Eliminar documentos de forma lógica/física con registro de auditoría | CU-19, CU-18 | Cubierto |
| RF-25 | Consultar documentos con filtros avanzados | CU-19 | Cubierto |
| RF-26 | Visualizar documentos desde la plataforma | CU-19 | Cubierto |
| RF-27 (primera aparición) | Descargar documentos conforme a permisos | CU-19, CU-04 | Cubierto |
| RF-28 | Aplicar control de acceso basado en roles a operaciones documentales | CU-19, CU-04 | Cubierto |
| RF-27 (segunda aparición) | Registrar acciones documentales en auditoría | CU-18 | Cubierto; ID duplicado en la fuente |
| RF-30 | Consultar historial de versiones | CU-19 | Cubierto |
| RF-31 | Organizar documentos en carpetas y subcarpetas | CU-19 | Cubierto |
| RF-32 | Asociar documentos a servicios, reportes, protocolos o normas | CU-19, CU-14, CU-16 | Cubierto |
| RF-33 | Buscar documentos por palabras clave o coincidencias | CU-19 | Cubierto |
| RF-34 | Definir niveles de confidencialidad | CU-19, CU-04 | Cubierto |
| RF-35 | Notificar cambios en documentos relevantes | CU-19 | Cubierto |
| RF-36 | Adjuntar varios archivos a un registro o proceso | CU-19, CU-14 | Cubierto |
| RF-37 (primera aparición) | Consultar estadísticas básicas documentales | CU-17 | Cubierto |
| RF-38 | Bloquear edición de documentos oficiales/finalizados | CU-19 | Cubierto |
| RF-37 (segunda aparición) | Exportar listados y metadatos documentales | CU-19, CU-16 | Cubierto; ID duplicado en la fuente |
| RF-40 | Proteger integridad de archivos y evitar duplicados | CU-19 | Cubierto |

**Resultado de 4.6:** 21 registros de requisito trazados a CU-19 y casos transversales. El SRS presenta identificadores duplicados RF-27 y RF-37 y saltos RF-29/RF-39; se conserva el código de origen y la aparición para no alterar la fuente sin autorización.


**Control de calidad de la fuente:** el PDF repite los identificadores RF-47 en la sección 4.7, RF-57 en la sección 4.7 y RF-67 en la sección 4.8, además de presentar saltos de numeración (por ejemplo, RF-49 y RF-59 no aparecen en las tablas transcritas). No se corrigen esos códigos en la fuente; se distinguen aquí por sección y orden de aparición para evitar colisiones. El equipo debe corregir el SRS maestro si estos duplicados son errores de digitación.

**Cobertura demostrada:** los 31 RF de la línea base consolidada están relacionados con casos de uso. Además, se trazan los 57 registros funcionales de las secciones 4.6, 4.7 y 4.8 del SRS. Los 44 registros de las secciones 4.1 a 4.5 se mantienen individualizados en la sección 13.2 con su justificación y estado de alcance. Por tanto, la cobertura de la línea base consolidada es 31/31 (100 %), pero la cobertura de los 101 registros de la sección 4 del SRS completo no puede declararse en 90 % o más mientras no exista una decisión formal sobre los módulos 4.1 a 4.5. El equipo/instructor debe confirmar si esos módulos pertenecen al SGA de ambulancias o si son contenido ajeno incorporado al documento.

### 13.2 Registro de requisitos de SRS 4.1-4.5 justificados como discrepancia de alcance

La fuente SRS contiene 44 registros en estos cinco módulos. Se transcriben aquí para que no queden invisibles y para que el equipo/instructor pueda confirmar uno por uno el alcance. La justificación común se basa en que las descripciones de esos registros no se reflejan en los procesos, actores ni objetivos de gestión prehospitalaria del documento de proyecto y los instrumentos; cuando existe una coincidencia ambigua, se señala expresamente.

| Sección | ID tal como aparece en SRS | Requisito / objetivo resumido | Decisión provisional | Justificación |
|---|---|---|---|---|
| 4.1 Finanzas/cartera | RF-6.1.1 | Registrar ingresos | No se modela | No está en el flujo de solicitud, asignación, seguimiento o cierre prehospitalario; 1.5 del SRS excluye procesos de facturación externos. |
| 4.1 | RF-6.1.2 | Registrar egresos financieros | No se modela | Gestión contable/financiera no definida en el alcance base. |
| 4.1 | RF-6.1.3 | Gestionar cartera y deudas de usuarios | No se modela | La gestión de cartera no está definida como objetivo operativo del SGA. |
| 4.1 | RF-6.1.4 | Generar facturas automáticamente | No se modela | La facturación no forma parte del flujo de servicio descrito en el documento base. |
| 4.1 | RF-6.1.5 | Consultar estado de cuenta | No se modela | Consulta financiera no descrita para los perfiles del SGA. |
| 4.1 | RF-6.1.6 | Generar reportes financieros | No se modela | Los reportes de la línea base son operativos/estadísticos, no financieros. |
| 4.1 | RF-6.1.7 (1.ª aparición) | Enviar notificaciones de pago | No se modela | Depende del módulo de cartera no incluido en el alcance operativo inicial. |
| 4.1 | RF-6.1.8 | Mantener historial financiero | No se modela | No corresponde al historial de servicios prehospitalarios. |
| 4.1 | RF-6.1.7 (2.ª aparición) | Generar recibos de pago | No se modela | ID repetido; función financiera no descrita en el alcance base. |
| 4.1 | RF-6.1.10 | Listar usuarios morosos | No se modela | Gestión de morosidad no es función operativa de ambulancias. |
| 4.2 Visitantes | RF-6.2.1 | Registrar visitantes | No se modela | No existe actor visitante/vigilante ni proceso de control de acceso físico en el alcance prehospitalario. |
| 4.2 | RF-6.2.2 | Controlar ingreso de visitantes | No se modela | El SGA gestiona servicios y recursos de ambulancia, no accesos a instalaciones. |
| 4.2 | RF-6.2.3 | Registrar salida de visitantes | No se modela | Proceso ajeno al despacho y seguimiento de ambulancias. |
| 4.2 | RF-6.2.4 | Autorizar preautorizaciones de visitantes | No se modela | Depende de actores residentes/vigilantes no definidos para el SGA. |
| 4.2 | RF-6.2.5 | Mantener historial de visitas | No se modela | No equivale al historial de servicios prehospitalarios. |
| 4.2 | RF-6.2.6 | Generar reportes de visitantes | No se modela | No aparece como indicador del alcance de ambulancias. |
| 4.2 | RF-6.2.7 (1.ª aparición) | Verificar identidad de visitantes | No se modela | No se define un proceso de registro/control de visitantes. |
| 4.2 | RF-6.2.8 | Registrar vehículos de visitantes | No se modela | Control de estacionamiento/visitantes ajeno a la operación de ambulancias. |
| 4.2 | RF-6.2.7 (2.ª aparición) | Alertar sobre riesgos de visitantes | No se modela | ID repetido y funcionalidad de seguridad física fuera del alcance declarado. |
| 4.3 PQRS | RF-6.3.1 | Registrar PQRS | Pendiente de decisión | No se describe en las fuentes de alcance; podría ser un módulo institucional transversal, pero no es parte explícita de P1. |
| 4.3 | RF-6.3.2 | Clasificar PQRS | Pendiente de decisión | Depende de la inclusión del módulo PQRS, no validada en el alcance base. |
| 4.3 | RF-6.3.3 | Asignar responsable de PQRS | Pendiente de decisión | No se identifican responsables ni flujo PQRS en los instrumentos. |
| 4.3 | RF-6.3.4 | Consultar seguimiento de PQRS | Pendiente de decisión | No debe confundirse con el seguimiento del servicio de ambulancia. |
| 4.3 | RF-6.3.5 | Notificar cambios de PQRS | Pendiente de decisión | Requiere confirmar si el SGA incluye atención de solicitudes/quejas institucionales. |
| 4.3 | RF-6.3.6 | Mantener historial de PQRS | Pendiente de decisión | El historial de servicios sí está modelado; el historial PQRS no está en alcance confirmado. |
| 4.3 | RF-6.3.7 (1.ª aparición) | Generar reportes PQRS | Pendiente de decisión | Reportes de PQRS no equivalen a reportes operativos de ambulancias. |
| 4.3 | RF-6.3.8 | Responder PQRS | Pendiente de decisión | No hay flujo, actor o regla definida en la documentación principal. |
| 4.3 | RF-6.3.7 (2.ª aparición) | Cerrar caso PQRS | Pendiente de decisión | ID repetido; requiere decidir inclusión del módulo. |
| 4.4 Unidades | RF-6.4.1 | Registrar propietarios | No se modela | Propietarios no son actores del SGA de transporte asistencial. |
| 4.4 | RF-6.4.2 | Asociar propietario a unidad | No se modela | La unidad descrita se relaciona con propiedad/residencia, no con ambulancia. |
| 4.4 | RF-6.4.3 | Actualizar datos de propietarios/unidades | No se modela | No corresponde a la gestión de ambulancias TAB/TAM. |
| 4.4 | RF-6.4.4 | Consultar datos de unidad | No se modela | La denominación es ambigua, pero la tabla usa propietario/residente; el inventario de ambulancias se cubre en CU-05. |
| 4.4 | RF-6.4.5 | Mantener historial de cambios | No se modela | Asociado al módulo residencial/unidades, no al historial operativo de ambulancias. |
| 4.4 | RF-6.4.6 | Clasificar unidad | No se modela | El concepto parece residencial; la clasificación TAB/TAM se encuentra en CU-05/CU-10. Requiere corregir la fuente para evitar ambigüedad. |
| 4.4 | RF-6.4.7 | Registrar residentes | No se modela | El SGA registra pacientes y personal, no residentes de unidades habitacionales. |
| 4.4 | RF-6.4.8 | Controlar estado de unidad | No se modela | El estado de ambulancias se gestiona en CU-05; el contexto de propietarios/residentes indica otra entidad. |
| 4.5 Proveedores | RF-6.5.1 | Registrar proveedores | Pendiente de decisión | Podría ser administración de proveedores de mantenimiento, pero no está contemplado en el alcance base ni en los instrumentos. |
| 4.5 | RF-6.5.2 | Registrar contratos con proveedores | Pendiente de decisión | No se especifican contratos ni actores de compras en el SGA base. |
| 4.5 | RF-6.5.3 | Controlar vigencia de contratos | Pendiente de decisión | Depende de incluir el proceso de gestión de proveedores. |
| 4.5 | RF-6.5.4 | Asociar servicios a proveedores | Pendiente de decisión | No hay relación proveedor-servicio descrita para el transporte asistencial. |
| 4.5 | RF-6.5.5 | Mantener historial de proveedores | Pendiente de decisión | No está en los procesos ni perfiles del alcance base. |
| 4.5 | RF-6.5.6 | Generar reportes de proveedores | Pendiente de decisión | Los reportes de la línea base son de servicios, recursos y desempeño operativo. |
| 4.5 | RF-6.5.7 | Evaluar proveedores | Pendiente de decisión | No se define un proceso de evaluación de terceros. |
| 4.5 | RF-6.5.8 | Alertar vencimientos de contratos | Pendiente de decisión | Requiere confirmar gestión de contratos en el alcance. |

**Lectura para el evaluador:** 4.2 y 4.4 presentan indicios fuertes de contenido de otro dominio (vigilancia, visitantes, propietarios y residentes). 4.1 está parcialmente limitado por la exclusión de procesos de facturación/finanzas en el alcance; 4.3 y 4.5 podrían ser extensiones institucionales y se dejan pendientes, no se excluyen como hecho. Por tanto, no se afirma que el 100 % del SRS PDF esté cubierto ni se sustituye la validación del equipo/instructor.

### 13.3 Lectura cuantitativa del SRS completo para C3

| Estado de los requisitos funcionales de la sección 4 del SRS | Cantidad | Tratamiento |
|---|---:|---|
| Registros 4.6, 4.7 y 4.8 trazados a casos de uso | 57 | Cubiertos en la matriz y el modelo UML. |
| Registros 4.1, 4.2 y 4.4 con indicios de dominio diferente | 27 | No modelados; cada fila tiene justificación individual y requiere confirmación del equipo/instructor. |
| Registros 4.3 y 4.5 pendientes de decisión de alcance | 17 | No se asumen como excluidos ni como incluidos hasta obtener una decisión formal. |
| **Total de registros funcionales listados en §4** | **101** | 57 trazados, 27 con exclusión propuesta y 17 pendientes de decisión. |

**Cálculo conservador:** 57/101 = **56,4 %** de requisitos de la sección 4 trazados a casos de uso. Las exclusiones propuestas están justificadas individualmente, pero las 17 filas pendientes y la ausencia de aprobación formal impiden afirmar que se alcanzó el 90 % del SRS completo. Si el equipo/instructor confirma formalmente que los 44 registros de 4.1 a 4.5 no pertenecen al alcance del SGA, la base funcional aplicable de las secciones 4.6 a 4.8 queda trazada al 100 % (57/57). Esta decisión no debe atribuirse al aprendiz sin evidencia de aprobación.

### 13.4 Correspondencia con los casos de uso descritos en §6.2 del SRS

| Caso de uso de la sección 6.2 del SRS | Caso de uso consolidado | Tratamiento |
|---|---|---|
| CU-01 Autenticar usuario | CU-01 Iniciar sesión | Se normaliza el nombre; autenticación con roles y registro de auditoría. |
| CU-02 Gestionar usuarios | CU-04 Gestionar usuarios, roles y permisos | Se conserva el objetivo y se explicitan permisos. |
| CU-03 Gestionar ambulancias | CU-05 Gestionar ambulancias | Se conserva el objetivo. |
| CU-04 Gestionar personal | CU-06 Gestionar personal operativo | Se conserva el objetivo. |
| CU-05 Registrar solicitud de emergencia | CU-08 Registrar solicitud de servicio | Se conserva el objetivo y se normaliza el nombre. |
| CU-06 Consultar solicitudes activas | CU-09 Gestionar solicitudes de servicio | Se agrupa la consulta y actualización dentro del objetivo de gestión de solicitudes. |
| CU-07 Asignar ambulancia | CU-11 Asignar ambulancia y personal | Se amplía para incluir la asignación del recurso humano. |
| CU-08 Monitorear estado del panel | CU-03 Consultar tablero operativo | Se normaliza el objetivo de consulta del tablero. |
| CU-07 Cerrar servicio (segunda aparición) | CU-22 Cerrar servicio | Se conserva como caso distinto y se registra que el identificador CU-07 está duplicado en la fuente. |
| CU-10 Actualizar estado del servicio | CU-13 Actualizar estado del servicio | Se conserva el objetivo. |
| CU-11 Registrar datos del paciente | CU-20 Registrar datos básicos del paciente | Se limita a los datos necesarios para la gestión prehospitalaria. |
| CU-12 Registrar intervenciones avanzadas | CU-21 Registrar intervenciones prehospitalarias | Se limita al registro de intervenciones TAM durante el servicio, sin historia clínica integral. |
| CU-13 Generar reportes operativos | CU-16 Generar reportes operativos | Se conserva el objetivo. |

## 14. Control de alcance y limitaciones

- Los 31 RF constituyen la línea base funcional del alcance de ambulancias que se modela en esta evidencia. A esa línea base se integran el módulo documental 4.6 (21 registros trazados) y las funciones operativas de auditoría/novedades de 4.7 y 4.8 (36 registros trazados).
- El SRS PDF ubicado en el repositorio contiene otros módulos y secciones que no concuerdan claramente con la descripción y los instrumentos del proyecto de ambulancias. Antes de declarar cobertura de ese PDF completo, se debe confirmar si esos módulos pertenecen al alcance del SGA o si el archivo contiene contenido de otro sistema.
- Los requisitos, actores y reglas de negocio son preliminares y deben validarse con representantes del contexto operativo.
- No se afirma que se hayan aplicado encuestas, entrevistas u observación ni que los resultados se hayan validado con usuarios reales.
- La asignación debe considerar disponibilidad, tipo de unidad y criterios operativos; las reglas específicas requieren confirmación por personal autorizado.
- Los datos personales y de atención deben tratarse conforme a las obligaciones legales y de privacidad aplicables.

## 15. Conclusiones

La matriz consolidada relaciona los 31 RF de la línea base consolidada con 22 casos de uso; incorpora 21 registros de 4.6 y 36 registros de 4.7/4.8. Además, mantiene 44 registros de las secciones 4.1-4.5 con una decisión provisional y su justificación individual. La cobertura total del SRS PDF queda pendiente hasta la confirmación formal del alcance. Los 14 requisitos no funcionales preliminares se mantienen diferenciados. La relación UML `include` se justifica por su obligatoriedad y se mantiene alineada con el diagrama. CU-14 Gestionar novedades operativas se representa como un caso de uso independiente, sin relación `extend`.

La cobertura integral del SRS disponible queda condicionada a resolver la discrepancia de alcance señalada: el PDF incluye módulos que no aparecen en el documento de proyecto e instrumentos consultados. Esta aclaración evita declarar un porcentaje total no demostrado y deja identificado el punto que debe confirmarse antes de una evaluación definitiva.

---

**Documento:** Matriz de requisitos y casos de uso - G1-P1.  
**Proyecto:** Sistema Gestor de Ambulancias (SGA).  
**Estado:** línea base de análisis documentada; quedan por resolver los asuntos de alcance señalados en la sección 14.


## 16. Lista de verificación del criterio C4 (UML)

| Verificación exigida | Resultado | Evidencia en el diagrama |
|---|---|---|
| Ocho o más casos de uso distintos | Cumple: 22 casos | CU-01 a CU-22; cada nombre expresa una acción mediante verbo y objeto. |
| Frontera del sistema | Cumple | Rectángulo denominado Sistema Gestor de Ambulancias (SGA). |
| Dos o más actores primarios fuera de la frontera | Cumple: 5 perfiles concretos | Administrador, Coordinador operativo, Paramédico TAB, Paramédico TAM y Analista/directivo; además hay 2 actores abstractos para generalización. |
| Asociaciones actor-caso de uso | Cumple según el catálogo de actores | Cada caso tiene al menos un actor iniciador indicado en la matriz y representado en el diagrama. |
| «include» obligatorio y con dirección correcta | Cumple | CU-11 → CU-07: asignar ambulancia y personal siempre requiere consultar disponibilidad. |
| Relación «extend» | No se aplica | CU-14 Gestionar novedades operativas se modela como objetivo independiente, sin dependencia condicional de CU-13. |
| Generalización de actores | Cumple y está justificada | Los cinco perfiles heredan del actor general Usuario del SGA para inicio/cierre y documentos; coordinación y paramédicos heredan además las funciones operativas comunes de Personal operativo; el Paramédico TAM tiene el caso exclusivo de intervenciones prehospitalarias. |
| Casos duplicados, CRUD fragmentado o ciclos | No se identifican duplicados en el catálogo consolidado; los casos de gestión agrupan operaciones relacionadas | Las operaciones de mantenimiento se agrupan en «Gestionar» cuando representan el mismo objetivo del actor. |
| Fuente editable y exportaciones | Entregadas | ``.drawio`, `.puml` y `.png` en la carpeta `06-diagrama-casos-uso`. |

**Nota de revisión:** la matriz y el diagrama se normalizaron a los mismos 22 identificadores de casos de uso, cinco perfiles concretos y dos actores abstractos de generalización. La versión editable debe abrirse en diagrams.net para comprobar que las asociaciones y posiciones se conservan al abrirla.


