# Matriz de requisitos y casos de uso – G1-P1 Plan de análisis



## 1. Introducción



El presente documento consolida la identificación preliminar de requisitos funcionales, requisitos no funcionales y casos de uso del sistema de registro de asistencia SENA, como parte de la evidencia G1-P1 correspondiente al Plan de análisis de la Guía de Aprendizaje 1 del programa Análisis y Desarrollo de Software (ADSO).



La identificación de los elementos se fundamenta en la inspección estática del código fuente, los archivos HTML, los módulos JavaScript, las interfaces, los formularios y las funciones de gestión de información del sistema de asistencia analizado.



Los elementos aquí descritos corresponden a una aproximación de análisis del software existente. No constituyen una validación formal con usuarios o representantes institucionales, ni una prueba funcional completa del sistema.



## 2. Objetivo



Identificar, documentar y relacionar los requisitos funcionales, requisitos no funcionales preliminares, actores y casos de uso del sistema de registro de asistencia SENA, con el propósito de establecer una base de trazabilidad para la elaboración del modelo conceptual y el diagrama UML de casos de uso.



## 3. Alcance



La matriz contempla los procesos observados en la estructura y el código del sistema de asistencia:



\- Autenticación y control de acceso mediante mecanismos implementados en JavaScript.

\- Consulta del tablero de indicadores.

\- Gestión de usuarios.

\- Configuración del perfil del instructor y parámetros.

\- Creación y administración de sesiones de asistencia.

\- Generación y visualización de códigos QR.

\- Registro de asistencia mediante QR o código manual.

\- Consulta del historial de sesiones.

\- Consulta del historial individual del aprendiz.

\- Consulta de reportes de asistencia.



Este documento corresponde exclusivamente al Producto 1 de la Guía de Aprendizaje 1 (G1-P1). No incluye el desarrollo de una nueva implementación, migración de base de datos, pruebas funcionales completas, despliegue ni modificaciones al sistema original.



## 4. Fuentes de identificación



La identificación preliminar se realizó mediante inspección estática de los siguientes elementos:



| Fuente | Descripción |

|---|---|

| `index.html` | Interfaz de acceso al sistema. |

| `pages/dashboard.html` | Estructura del tablero de indicadores. |

| `pages/usuarios.html` | Interfaz de gestión de usuarios. |

| `pages/configuracion.html` | Interfaz de configuración. |

| `pages/crear-sesion.html` | Formulario de creación de sesiones. |

| `pages/codigo-qr.html` | Interfaz de visualización y generación del QR. |

| `pages/escanear-qr.html` | Interfaz para escaneo y registro de asistencia. |

| `pages/confirmacion-asistencia.html` | Interfaz de confirmación del registro. |

| `pages/historial.html` | Interfaz de consulta del historial de sesiones. |

| `pages/historial-aprendiz.html` | Interfaz de historial individual. |

| `pages/reportes.html` | Interfaz de consulta de reportes. |

| `js/db.js` | Funciones de almacenamiento, autenticación, sesiones, usuarios, aprendices y asistencias. |

| `js/usuarios.js` | Lógica de gestión de usuarios. |

| `js/configuracion.js` | Lógica de configuración del instructor. |

| `js/crear-sesion.js` | Lógica de creación de sesiones. |

| `js/codigo-qr.js` | Generación, visualización y gestión del código QR. |

| `js/escanear-qr.js` | Escaneo QR, validación y registro de asistencia. |

| `js/historial.js` | Consulta y visualización del historial de sesiones. |

| `js/historial-aprendiz.js` | Consulta individual de registros de asistencia. |

| `js/reportes.js` | Cálculo y presentación de reportes. |

| `js/dashboard.js` | Visualización de indicadores. |



## 5. Identificación de actores



### 5.1. Actor A-01: Instructor



Representa al usuario que administra las sesiones de asistencia y utiliza las funcionalidades de gestión y consulta del sistema.



Responsabilidades identificadas preliminarmente:



\- Acceder al sistema.

\- Consultar el tablero de indicadores.

\- Gestionar usuarios.

\- Modificar configuraciones.

\- Crear sesiones de asistencia.

\- Generar códigos QR.

\- Regenerar códigos de sesión.

\- Finalizar sesiones.

\- Consultar el historial.

\- Consultar reportes de asistencia.



### 5.2. Actor A-02: Aprendiz



Representa al usuario que participa en el proceso de registro de asistencia.



Responsabilidades identificadas preliminarmente:



\- Acceder al flujo de registro de asistencia.

\- Escanear el código QR de una sesión.

\- Registrar manualmente un código cuando corresponda.

\- Identificarse mediante su documento.

\- Registrar su asistencia.

\- Consultar su historial individual.



\*\*Nota:\*\* Los actores se identifican a partir de los flujos e interfaces observados. Su definición corresponde a un modelo preliminar y deberá validarse frente al contexto institucional.



## 6. Requisitos funcionales



Los requisitos funcionales describen las capacidades que se identificaron preliminarmente en el sistema a partir de la inspección estática.



| ID | Requisito funcional | Actor | Prioridad | Fuente |

|---|---|---|---|---|

| RF-01 | El sistema debe permitir el inicio de sesión mediante las credenciales disponibles en su mecanismo de autenticación. | Instructor | Alta | `index.html`, `js/db.js` |

| RF-02 | El sistema debe permitir cerrar la sesión del usuario autenticado. | Instructor | Alta | `js/db.js` |

| RF-03 | El sistema debe presentar un tablero con indicadores relacionados con aprendices, sesiones y asistencia. | Instructor | Alta | `dashboard.html`, `js/dashboard.js`, `js/db.js` |

| RF-04 | El sistema debe permitir consultar los usuarios registrados. | Instructor | Alta | `usuarios.html`, `js/usuarios.js`, `js/db.js` |

| RF-05 | El sistema debe permitir crear usuarios mediante un formulario de gestión. | Instructor | Alta | `usuarios.html`, `js/usuarios.js` |

| RF-06 | El sistema debe permitir editar la información de usuarios existentes. | Instructor | Alta | `usuarios.html`, `js/usuarios.js` |

| RF-07 | El sistema debe permitir eliminar usuarios mediante una acción de gestión. | Instructor | Media | `usuarios.html`, `js/usuarios.js` |

| RF-08 | El sistema debe permitir consultar y actualizar la información de configuración del instructor. | Instructor | Media | `configuracion.html`, `js/configuracion.js`, `js/db.js` |

| RF-09 | El sistema debe permitir configurar parámetros relacionados con la ficha, jornada y duración de las sesiones. | Instructor | Media | `configuracion.html`, `js/configuracion.js` |

| RF-10 | El sistema debe permitir crear una sesión de asistencia asociada a una ficha, fecha y jornada. | Instructor | Alta | `crear-sesion.html`, `js/crear-sesion.js`, `js/db.js` |

| RF-11 | El sistema debe generar un código de identificación para la sesión de asistencia creada. | Instructor | Alta | `js/db.js`, `js/crear-sesion.js` |

| RF-12 | El sistema debe permitir visualizar el código QR asociado a una sesión. | Instructor | Alta | `codigo-qr.html`, `js/codigo-qr.js` |

| RF-13 | El sistema debe permitir regenerar el código de una sesión. | Instructor | Media | `codigo-qr.html`, `js/codigo-qr.js`, `js/db.js` |

| RF-14 | El sistema debe permitir finalizar una sesión de asistencia. | Instructor | Alta | `codigo-qr.html`, `js/codigo-qr.js`, `js/db.js` |

| RF-15 | El sistema debe permitir escanear códigos QR para identificar una sesión de asistencia. | Aprendiz | Alta | `escanear-qr.html`, `js/escanear-qr.js` |

| RF-16 | El sistema debe permitir ingresar manualmente el código de una sesión cuando se utiliza el flujo alternativo de registro. | Aprendiz | Alta | `escanear-qr.html`, `js/escanear-qr.js` |

| RF-17 | El sistema debe permitir identificar al aprendiz mediante su documento de identidad para registrar la asistencia. | Aprendiz | Alta | `escanear-qr.html`, `js/escanear-qr.js`, `js/db.js` |

| RF-18 | El sistema debe validar la existencia y el estado de la sesión antes de registrar la asistencia. | Aprendiz | Alta | `js/db.js` |

| RF-19 | El sistema debe verificar que el aprendiz exista antes de registrar su asistencia. | Aprendiz | Alta | `js/db.js` |

| RF-20 | El sistema debe impedir el registro duplicado de asistencia de un aprendiz en una misma sesión. | Aprendiz | Alta | `js/db.js` |

| RF-21 | El sistema debe almacenar el registro de asistencia asociado al aprendiz y a la sesión correspondiente. | Aprendiz | Alta | `js/db.js` |

| RF-22 | El sistema debe presentar una confirmación después de un registro de asistencia exitoso. | Aprendiz | Alta | `confirmacion-asistencia.html`, `js/escanear-qr.js` |

| RF-23 | El sistema debe permitir consultar el historial de sesiones de asistencia. | Instructor | Alta | `historial.html`, `js/historial.js` |

| RF-24 | El sistema debe permitir filtrar el historial de sesiones por ficha y criterios de búsqueda disponibles. | Instructor | Media | `historial.html`, `js/historial.js` |

| RF-25 | El sistema debe permitir consultar los detalles de una sesión y sus registros de asistencia. | Instructor | Alta | `historial.html`, `js/historial.js` |

| RF-26 | El sistema debe permitir consultar el historial individual de asistencia del aprendiz. | Aprendiz | Alta | `historial-aprendiz.html`, `js/historial-aprendiz.js` |

| RF-27 | El sistema debe permitir consultar reportes de asistencia aplicando filtros de ficha y fechas. | Instructor | Alta | `reportes.html`, `js/reportes.js`, `js/db.js` |

| RF-28 | El sistema debe calcular indicadores de asistencia e inasistencia en los reportes consultados. | Instructor | Media | `js/reportes.js`, `js/db.js` |



### 6.1. Observaciones sobre los requisitos funcionales



\- Los requisitos se identificaron a partir de elementos visibles y funciones presentes en el código fuente.

\- No todos los requisitos representan una validación institucional.

\- Los requisitos relacionados con QR, sesiones y registro de asistencia se sustentan en las funciones identificadas en `js/db.js` y `js/escanear-qr.js`.

\- La exportación de reportes no se considera un requisito funcional implementado, debido a que en la interfaz inspeccionada se observó un botón deshabilitado con indicación de disponibilidad futura.

\- La sincronización centralizada entre dispositivos no se considera un requisito funcional comprobado, debido a que el sistema inspeccionado utiliza almacenamiento local del navegador.



## 7. Requisitos no funcionales preliminares



Los requisitos no funcionales que se presentan a continuación son propuestas preliminares de análisis. No se consideran características verificadas del sistema, debido a que no se realizaron pruebas técnicas completas de rendimiento, seguridad, compatibilidad o accesibilidad.



| ID | Requisito no funcional preliminar | Tipo | Estado |

|---|---|---|---|

| RNF-01 | La interfaz del sistema debería permitir una navegación clara entre sus módulos principales. | Usabilidad | Propuesta de análisis |

| RNF-02 | El sistema debería presentar mensajes claros cuando el registro de asistencia sea exitoso o cuando ocurra un error. | Usabilidad | Propuesta de análisis |

| RNF-03 | El sistema debería validar los datos ingresados en formularios antes de ejecutar las operaciones correspondientes. | Calidad / validación | Parcialmente observado; requiere validación ampliada |

| RNF-04 | El sistema debería proteger las funcionalidades administrativas frente al acceso no autorizado. | Seguridad | Propuesta de análisis; seguridad real no comprobada |

| RNF-05 | El sistema debería permitir el uso de la interfaz en navegadores compatibles con las tecnologías empleadas. | Compatibilidad | Propuesta de análisis |

| RNF-06 | El sistema debería ofrecer condiciones adecuadas para la lectura de códigos QR mediante dispositivos con cámara. | Usabilidad / compatibilidad | Propuesta de análisis |

| RNF-07 | El sistema debería garantizar la integridad de los registros de asistencia, evitando duplicidades o registros asociados a sesiones inválidas. | Integridad | Parcialmente observado en validaciones de código |

| RNF-08 | El sistema debería contar con un mecanismo de almacenamiento persistente y confiable para la información de asistencia. | Confiabilidad | Propuesta de análisis; almacenamiento centralizado no observado |

| RNF-09 | El sistema debería proteger los datos personales de aprendices e instructores. | Privacidad | Propuesta de análisis |

| RNF-10 | El sistema debería contar con mecanismos de respaldo y recuperación de información. | Disponibilidad / confiabilidad | Propuesta de análisis; no observado en el código inspeccionado |



## 8. Casos de uso identificados



### 8.1. Lista de casos de uso



| ID | Caso de uso | Actor principal | Requisitos asociados |

|---|---|---|---|

| CU-01 | Iniciar sesión | Instructor | RF-01 |

| CU-02 | Cerrar sesión | Instructor | RF-02 |

| CU-03 | Consultar dashboard | Instructor | RF-03 |

| CU-04 | Gestionar usuarios | Instructor | RF-04, RF-05, RF-06, RF-07 |

| CU-05 | Configurar sistema | Instructor | RF-08, RF-09 |

| CU-06 | Crear sesión de asistencia | Instructor | RF-10, RF-11 |

| CU-07 | Generar y visualizar código QR | Instructor | RF-12 |

| CU-08 | Regenerar código de sesión | Instructor | RF-13 |

| CU-09 | Finalizar sesión | Instructor | RF-14 |

| CU-10 | Escanear código QR | Aprendiz | RF-15 |

| CU-11 | Ingresar código manual | Aprendiz | RF-16 |

| CU-12 | Identificar aprendiz | Aprendiz | RF-17 |

| CU-13 | Validar sesión y aprendiz | Aprendiz | RF-18, RF-19 |

| CU-14 | Registrar asistencia | Aprendiz | RF-20, RF-21 |

| CU-15 | Confirmar registro de asistencia | Aprendiz | RF-22 |

| CU-16 | Consultar historial de sesiones | Instructor | RF-23, RF-24, RF-25 |

| CU-17 | Consultar historial individual | Aprendiz | RF-26 |

| CU-18 | Consultar reportes de asistencia | Instructor | RF-27, RF-28 |



### 8.2. Descripción general de casos de uso



#### CU-01. Iniciar sesión



\*\*Actor:\*\* Instructor.



\*\*Objetivo:\*\* Permitir el ingreso al sistema mediante las credenciales disponibles en el mecanismo de autenticación.



\*\*Descripción:\*\* El usuario introduce sus credenciales y el sistema ejecuta el proceso de validación de autenticación definido en el código.



\*\*Requisitos asociados:\*\* RF-01.



#### CU-02. Cerrar sesión



\*\*Actor:\*\* Instructor.



\*\*Objetivo:\*\* Finalizar la sesión de autenticación del usuario.



\*\*Descripción:\*\* El usuario ejecuta la opción de cierre de sesión y el sistema realiza la operación de cierre mediante la función correspondiente.



\*\*Requisitos asociados:\*\* RF-02.



#### CU-03. Consultar dashboard



\*\*Actor:\*\* Instructor.



\*\*Objetivo:\*\* Consultar indicadores generales relacionados con aprendices, sesiones y asistencia.



\*\*Descripción:\*\* El sistema presenta información calculada a partir de los datos disponibles en su almacenamiento local.



\*\*Requisitos asociados:\*\* RF-03.



#### CU-04. Gestionar usuarios



\*\*Actor:\*\* Instructor.



\*\*Objetivo:\*\* Administrar la información de los usuarios disponibles en el sistema.



\*\*Descripción:\*\* El instructor consulta usuarios, crea nuevos registros, modifica información existente o ejecuta la eliminación mediante las interfaces y funciones disponibles.



\*\*Requisitos asociados:\*\* RF-04, RF-05, RF-06 y RF-07.



#### CU-05. Configurar sistema



\*\*Actor:\*\* Instructor.



\*\*Objetivo:\*\* Consultar y modificar los parámetros de configuración disponibles.



\*\*Descripción:\*\* El instructor accede al módulo de configuración, modifica los datos de perfil y parámetros disponibles y guarda los cambios mediante las funciones de actualización.



\*\*Requisitos asociados:\*\* RF-08 y RF-09.



#### CU-06. Crear sesión de asistencia



\*\*Actor:\*\* Instructor.



\*\*Objetivo:\*\* Crear una sesión de asistencia asociada a una ficha, fecha y jornada.



\*\*Descripción:\*\* El instructor selecciona los datos requeridos, valida la información del formulario y ejecuta la creación de la sesión.



\*\*Requisitos asociados:\*\* RF-10 y RF-11.



#### CU-07. Generar y visualizar código QR



\*\*Actor:\*\* Instructor.



\*\*Objetivo:\*\* Visualizar el código QR asociado a la sesión de asistencia.



\*\*Descripción:\*\* El sistema presenta la información de la sesión y el código QR generado a partir de los datos de identificación de la sesión.



\*\*Requisitos asociados:\*\* RF-12.



#### CU-08. Regenerar código de sesión



\*\*Actor:\*\* Instructor.



\*\*Objetivo:\*\* Generar un nuevo código de identificación para una sesión.



\*\*Descripción:\*\* El instructor utiliza la función disponible para regenerar el código de la sesión.



\*\*Requisitos asociados:\*\* RF-13.



#### CU-09. Finalizar sesión



\*\*Actor:\*\* Instructor.



\*\*Objetivo:\*\* Finalizar una sesión de asistencia activa.



\*\*Descripción:\*\* El instructor ejecuta la acción de finalizar sesión y el sistema actualiza el estado de la sesión mediante la función correspondiente.



\*\*Requisitos asociados:\*\* RF-14.



#### CU-10. Escanear código QR



\*\*Actor:\*\* Aprendiz.



\*\*Objetivo:\*\* Identificar una sesión de asistencia mediante la lectura de su código QR.



\*\*Descripción:\*\* El aprendiz accede a la interfaz de escaneo y utiliza la cámara del dispositivo para leer el QR. El flujo inspeccionado contempla la interpretación del contenido del código y la identificación de la sesión.



\*\*Requisitos asociados:\*\* RF-15.



#### CU-11. Ingresar código manual



\*\*Actor:\*\* Aprendiz.



\*\*Objetivo:\*\* Identificar una sesión mediante el ingreso manual del código disponible.



\*\*Descripción:\*\* El aprendiz utiliza el formulario de ingreso manual para introducir el código de la sesión y continuar con el proceso de registro.



\*\*Requisitos asociados:\*\* RF-16.



#### CU-12. Identificar aprendiz



\*\*Actor:\*\* Aprendiz.



\*\*Objetivo:\*\* Identificar al aprendiz que solicita registrar su asistencia.



\*\*Descripción:\*\* El aprendiz ingresa su documento de identidad en el formulario correspondiente.



\*\*Requisitos asociados:\*\* RF-17.



#### CU-13. Validar sesión y aprendiz



\*\*Actor:\*\* Aprendiz.



\*\*Objetivo:\*\* Validar las condiciones necesarias para permitir el registro de asistencia.



\*\*Descripción:\*\* El sistema verifica la sesión, su estado y la existencia del aprendiz mediante las funciones disponibles.



\*\*Requisitos asociados:\*\* RF-18 y RF-19.



#### CU-14. Registrar asistencia



\*\*Actor:\*\* Aprendiz.



\*\*Objetivo:\*\* Registrar la asistencia del aprendiz en una sesión válida.



\*\*Descripción:\*\* El sistema verifica las condiciones de registro, valida que no exista un registro duplicado y almacena la asistencia relacionada con la sesión y el aprendiz.



\*\*Requisitos asociados:\*\* RF-20 y RF-21.



#### CU-15. Confirmar registro de asistencia



\*\*Actor:\*\* Aprendiz.



\*\*Objetivo:\*\* Informar que el proceso de registro de asistencia se ha completado.



\*\*Descripción:\*\* Después del registro exitoso, el sistema presenta la interfaz de confirmación.



\*\*Requisitos asociados:\*\* RF-22.



#### CU-16. Consultar historial de sesiones



\*\*Actor:\*\* Instructor.



\*\*Objetivo:\*\* Consultar las sesiones de asistencia y sus detalles.



\*\*Descripción:\*\* El instructor accede al historial, utiliza los filtros disponibles y consulta la información de las sesiones y sus registros asociados.



\*\*Requisitos asociados:\*\* RF-23, RF-24 y RF-25.



#### CU-17. Consultar historial individual



\*\*Actor:\*\* Aprendiz.



\*\*Objetivo:\*\* Consultar los registros de asistencia asociados al aprendiz.



\*\*Descripción:\*\* El sistema obtiene los registros vinculados al identificador del aprendiz disponible en el flujo de consulta y presenta el historial correspondiente.



\*\*Requisitos asociados:\*\* RF-26.



#### CU-18. Consultar reportes de asistencia



\*\*Actor:\*\* Instructor.



\*\*Objetivo:\*\* Consultar información resumida y detallada sobre asistencia.



\*\*Descripción:\*\* El instructor selecciona los filtros disponibles, consulta los resultados y visualiza indicadores y registros calculados a partir de los datos de asistencia.



\*\*Requisitos asociados:\*\* RF-27 y RF-28.



## 9. Reglas de negocio preliminares



Las reglas de negocio se identifican mediante la inspección del código fuente y corresponden a una interpretación preliminar de las validaciones existentes.



| ID | Regla de negocio | Descripción | Fuente |

|---|---|---|---|

| RN-01 | Existencia de sesión | Para registrar asistencia debe existir una sesión identificable. | `js/db.js` |

| RN-02 | Estado de sesión | El registro de asistencia requiere que la sesión se encuentre en el estado permitido, identificado como "En curso". | `js/db.js` |

| RN-03 | Existencia del aprendiz | El documento ingresado debe corresponder a un aprendiz identificado en los datos disponibles. | `js/db.js` |

| RN-04 | Registro único por sesión | No se debe registrar más de una asistencia del mismo aprendiz en la misma sesión. | `js/db.js` |

| RN-05 | Identificación obligatoria | El flujo de registro requiere la identificación del aprendiz mediante documento. | `js/escanear-qr.js`, `js/db.js` |

| RN-06 | Relación asistencia-sesión | El registro de asistencia debe estar relacionado con la sesión correspondiente. | `js/db.js` |

| RN-07 | Relación asistencia-aprendiz | El registro de asistencia debe estar asociado al aprendiz que realizó el proceso. | `js/db.js` |

| RN-08 | Identificación por QR | El contenido del QR permite identificar la sesión y contempla información asociada a la ficha. | `js/codigo-qr.js`, `js/escanear-qr.js`, `js/db.js` |

| RN-09 | Identificación alternativa | El flujo de asistencia contempla el ingreso manual de código como alternativa al escaneo QR. | `js/escanear-qr.js` |



## 10. Matriz de trazabilidad requisito-caso de uso



| Requisito | Caso de uso | Actor |

|---|---|---|

| RF-01 | CU-01 Iniciar sesión | Instructor |

| RF-02 | CU-02 Cerrar sesión | Instructor |

| RF-03 | CU-03 Consultar dashboard | Instructor |

| RF-04 | CU-04 Gestionar usuarios | Instructor |

| RF-05 | CU-04 Gestionar usuarios | Instructor |

| RF-06 | CU-04 Gestionar usuarios | Instructor |

| RF-07 | CU-04 Gestionar usuarios | Instructor |

| RF-08 | CU-05 Configurar sistema | Instructor |

| RF-09 | CU-05 Configurar sistema | Instructor |

| RF-10 | CU-06 Crear sesión de asistencia | Instructor |

| RF-11 | CU-06 Crear sesión de asistencia | Instructor |

| RF-12 | CU-07 Generar y visualizar código QR | Instructor |

| RF-13 | CU-08 Regenerar código de sesión | Instructor |

| RF-14 | CU-09 Finalizar sesión | Instructor |

| RF-15 | CU-10 Escanear código QR | Aprendiz |

| RF-16 | CU-11 Ingresar código manual | Aprendiz |

| RF-17 | CU-12 Identificar aprendiz | Aprendiz |

| RF-18 | CU-13 Validar sesión y aprendiz | Aprendiz |

| RF-19 | CU-13 Validar sesión y aprendiz | Aprendiz |

| RF-20 | CU-14 Registrar asistencia | Aprendiz |

| RF-21 | CU-14 Registrar asistencia | Aprendiz |

| RF-22 | CU-15 Confirmar registro de asistencia | Aprendiz |

| RF-23 | CU-16 Consultar historial de sesiones | Instructor |

| RF-24 | CU-16 Consultar historial de sesiones | Instructor |

| RF-25 | CU-16 Consultar historial de sesiones | Instructor |

| RF-26 | CU-17 Consultar historial individual | Aprendiz |

| RF-27 | CU-18 Consultar reportes de asistencia | Instructor |

| RF-28 | CU-18 Consultar reportes de asistencia | Instructor |



## 11. Relaciones preliminares para el diagrama UML



Las siguientes relaciones se proponen como una representación conceptual del flujo identificado. Deben utilizarse únicamente cuando el diagrama refleje correctamente la obligatoriedad o el comportamiento opcional de las funciones.



### 11.1. Relaciones `include`



Se propone analizar las siguientes relaciones de inclusión:



| Caso de uso principal | Caso de uso incluido | Justificación preliminar |

|---|---|---|

| CU-14 Registrar asistencia | CU-13 Validar sesión y aprendiz | La validación de sesión y aprendiz forma parte de las condiciones necesarias para registrar la asistencia. |

| CU-14 Registrar asistencia | CU-12 Identificar aprendiz | La identificación del aprendiz es necesaria para relacionar el registro con la persona correspondiente. |

| CU-16 Consultar historial de sesiones | Consultar detalles de sesión | La consulta de detalles puede representarse como una funcionalidad reutilizable dentro del proceso de consulta. |



\*\*Observación:\*\* La relación entre identificación del aprendiz y validación puede simplificarse en el diagrama para evitar redundancia. Se recomienda representar la validación como parte del registro de asistencia y mantener la identificación como una interacción del actor.



### 11.2. Relaciones `extend`



Se propone analizar las siguientes relaciones de extensión:



| Caso de uso base | Caso de uso de extensión | Justificación preliminar |

|---|---|---|

| CU-10 Escanear código QR | CU-11 Ingresar código manual | El ingreso manual puede representar un flujo alternativo de identificación de la sesión frente al escaneo QR. |

| CU-07 Generar y visualizar código QR | CU-08 Regenerar código de sesión | La regeneración puede considerarse una acción opcional cuando el instructor requiere generar un nuevo código. |



\*\*Observación:\*\* Las relaciones `extend` deberán representarse de acuerdo con las condiciones de ejecución de cada flujo. El ingreso manual puede ser una alternativa al escaneo y no necesariamente una extensión UML formal, por lo que su representación deberá revisarse durante la elaboración del diagrama.



### 11.3. Relación de actores



\- El actor Instructor se relaciona con los casos de uso administrativos.

\- El actor Aprendiz se relaciona con los casos de uso de identificación, registro y consulta individual.

\- No se propone una relación de generalización entre actores, debido a que no se identificó evidencia suficiente que la justifique.



## 12. Limitaciones del análisis



\- La identificación se realizó mediante inspección estática del código fuente.

\- No se realizó una entrevista formal con instructores o aprendices.

\- No se realizó una validación institucional de requisitos.

\- No se ejecutó una batería de pruebas funcionales completa.

\- El almacenamiento observado corresponde a mecanismos locales del navegador.

\- No se comprobó una base de datos centralizada ni sincronización entre dispositivos.

\- Los datos de ejemplo presentes en el código no se consideran datos institucionales validados.

\- Las características de seguridad, privacidad, disponibilidad y rendimiento no fueron verificadas mediante pruebas técnicas.

\- El botón de exportación de reportes observado en la interfaz no se considera funcionalidad implementada.

\- Las relaciones UML propuestas deberán revisarse y justificarse durante la elaboración del diagrama de casos de uso.



## 13. Conclusiones



La matriz permite consolidar los requisitos funcionales identificados preliminarmente en el sistema de registro de asistencia SENA, relacionándolos con los actores, casos de uso y reglas de negocio observadas en la inspección estática del código fuente.



La identificación de los actores Instructor y Aprendiz permite organizar las funcionalidades administrativas y las relacionadas con el registro y consulta de asistencia. Asimismo, la trazabilidad establecida entre requisitos y casos de uso proporciona una base para elaborar el diagrama UML correspondiente.



Las reglas de negocio identificadas permiten reconocer condiciones relevantes del proceso de registro, como la validación de sesiones activas, la identificación del aprendiz y la prevención de registros duplicados.



Este documento constituye un producto de análisis preliminar y no una certificación del funcionamiento completo del sistema ni de la conformidad de sus procesos con políticas institucionales.



## 14. Declaración de uso de inteligencia artificial



Se utilizó ChatGPT como herramienta de apoyo para la organización documental, estructuración de la matriz, identificación preliminar de requisitos, organización de casos de uso y revisión de la trazabilidad entre elementos.



La información se fundamentó en la inspección estática del código fuente del sistema de asistencia. El aprendiz debe revisar, validar y asumir la responsabilidad académica sobre el contenido presentado, su correspondencia con la guía de aprendizaje y su interpretación de los elementos identificados.



\---



\*\*Evidencia:\*\* G1-P1 – Plan de análisis.



\*\*Programa:\*\* Análisis y Desarrollo de Software (ADSO).



\*\*Actividad:\*\* Especificar el modelo conceptual del software.



\*\*Alcance:\*\* Producto 1 de la Guía de Aprendizaje 1.


