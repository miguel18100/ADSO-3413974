# A1 - Requisitos seleccionados y decisión tecnológica

**Proyecto:** Sistema Gestor de Ambulancias (SGA) - SIGMAVITAL  
**Evidencia:** G2-P1 Arquitectura  
**Criterio:** A1  
**Estado:** Propuesta de diseño basada en la línea base de G1-P1; pendiente de validación.

## 1. Propósito

Este documento identifica requisitos funcionales y no funcionales relevantes para el diseño arquitectónico del Sistema Gestor de Ambulancias (SGA), conservando sus identificadores originales de la línea base de análisis G1-P1. También presenta una propuesta tecnológica preliminar para orientar la arquitectura del sistema.

## 2. Requisitos funcionales seleccionados

| ID | Requisito | Justificación arquitectónica |
|---|---|---|
| RF-01 | El sistema debe permitir el inicio de sesión de los usuarios mediante mecanismos de autenticación definidos. | Define el componente de autenticación y control de acceso. |
| RF-03 | El sistema debe permitir gestionar usuarios, incluyendo consulta, creación, actualización y eliminación según permisos. | Requiere gestión de usuarios, roles y permisos. |
| RF-04 | El sistema debe permitir consultar un tablero operativo con el estado actual de solicitudes, servicios y recursos, de acuerdo con el rol autorizado. | Requiere consolidación de datos operativos y presentación diferenciada por rol. |
| RF-05 | El sistema debe permitir registrar ambulancias con la información requerida para su identificación y gestión. | Define la gestión de ambulancias como responsabilidad de un módulo. |
| RF-09 | El sistema debe permitir registrar personal operativo relacionado con la prestación de servicios de transporte asistencial. | Requiere gestión de personal operativo. |
| RF-12 | El sistema debe permitir registrar solicitudes de servicios de transporte asistencial con la información requerida. | Define el proceso de entrada y registro de solicitudes. |
| RF-16 | El sistema debe permitir consultar los recursos operativos disponibles para la asignación de servicios. | Requiere consulta coordinada de disponibilidad de recursos. |
| RF-17 | El sistema debe permitir asignar una ambulancia a una solicitud de servicio, de acuerdo con los criterios operativos definidos. | Define la lógica central de asignación de recursos. |
| RF-20 | El sistema debe permitir actualizar el estado de un servicio durante su ciclo operativo. | Requiere control del ciclo de vida del servicio. |
| RF-29 | El sistema debe permitir registrar y consultar los datos básicos del paciente asociados a un servicio prehospitalario, limitados a la información necesaria para la gestión operativa y la atención inicial. | Requiere manejo restringido de datos personales del paciente. |
| RF-30 | El sistema debe permitir al Paramédico TAM registrar las intervenciones prehospitalarias realizadas durante un servicio, sin constituir una historia clínica electrónica completa. | Define un módulo de registro de intervenciones sujeto a permisos. |
| RF-31 | El sistema debe permitir cerrar un servicio finalizado registrando el resumen de atención, condición de salida, destino asistencial, tiempos y observaciones autorizadas. | Define el proceso de cierre y consolidación del servicio. |

## 3. Requisitos no funcionales seleccionados

| ID | Requisito | Categoría | Implicación arquitectónica |
|---|---|---|---|
| RNF-03 | El sistema debería controlar el acceso a las funcionalidades de acuerdo con los roles y permisos definidos. | Seguridad | Control de acceso centralizado y autorización por rol. |
| RNF-04 | El sistema debería proteger la información almacenada frente a accesos no autorizados. | Seguridad y privacidad | Protección de datos, validación de accesos y restricciones. |
| RNF-05 | El sistema debería preservar la integridad de la información relacionada con solicitudes, asignaciones, ambulancias y servicios. | Integridad | Validaciones, restricciones y transacciones de datos. |
| RNF-06 | El sistema debería mantener consistencia entre las solicitudes, las asignaciones de recursos y los estados de los servicios. | Consistencia | Reglas de negocio y control transaccional. |
| RNF-08 | El sistema debería contar con mecanismos que permitan respaldar y recuperar la información, de acuerdo con la estrategia de administración de datos definida. | Confiabilidad | Estrategia de respaldo y recuperación. |
| RNF-09 | El sistema debería facilitar el mantenimiento y la evolución de sus componentes mediante una organización modular. | Mantenibilidad | Separación de responsabilidades y módulos. |
| RNF-11 | El sistema debería procurar tiempos de respuesta adecuados para las operaciones habituales de consulta y gestión. | Rendimiento | Optimización de consultas y operaciones. |
| RNF-12 | El sistema debería manejar la información personal y los datos relacionados con la atención de acuerdo con las disposiciones legales aplicables. | Privacidad y cumplimiento | Minimización, protección y acceso restringido a datos. |
| RNF-13 | El sistema debería facilitar la trazabilidad de las operaciones relevantes realizadas por usuarios autorizados. | Auditoría | Registro de eventos y seguimiento de operaciones. |
| RNF-14 | El sistema debería utilizar mecanismos seguros de comunicación y configuración cuando sea desplegado en un entorno de producción. | Seguridad | Comunicación cifrada y configuración segura. |

## 4. Propuesta tecnológica

Las siguientes tecnologías constituyen una propuesta para el diseño de SIGMAVITAL. Su selección se justifica por la naturaleza web del sistema, las necesidades de modularidad, persistencia de datos y control de acceso.

| Elemento | Tecnología propuesta | Justificación |
|---|---|---|
| Plataforma | Aplicación web | Permite el acceso desde diferentes equipos mediante navegadores compatibles. |
| Backend | PHP con Laravel | Facilita organización modular, controladores, servicios, validaciones, autenticación y acceso a datos. |
| Frontend | React | Permite construir interfaces reutilizables para tablero, gestión y operación. |
| Base de datos | MySQL | Permite almacenamiento relacional, integridad referencial y transacciones. |
| Comunicación | API REST sobre HTTPS | Facilita la comunicación entre frontend y backend y protege la comunicación en producción. |
| Control de versiones | Git y GitHub | Facilita seguimiento de cambios, revisión de artefactos y trazabilidad del desarrollo. |
| Modelado | UML y diagrams.net | Permite representar y mantener los artefactos de diseño. |

## 5. Justificación de la selección

### 5.1 PHP y Laravel

Laravel se propone como framework backend porque permite organizar el sistema en componentes con responsabilidades diferenciadas, manejar validaciones, rutas, autenticación y acceso a datos. Esta organización favorece el RNF-09 de mantenibilidad y permite centralizar las reglas operativas.

### 5.2 React

React se propone para construir una interfaz web modular, facilitando la separación de vistas como tablero operativo, solicitudes, ambulancias, personal, asignaciones y seguimiento de servicios.

### 5.3 MySQL

MySQL se propone como motor relacional porque permite definir claves primarias, claves foráneas, restricciones y transacciones, necesarias para preservar la integridad y consistencia de las relaciones entre solicitudes, servicios, ambulancias, personal y asignaciones.

### 5.4 API REST y HTTPS

La comunicación mediante API REST permite desacoplar la interfaz de usuario de la lógica de negocio. HTTPS se plantea como mecanismo de protección de la comunicación en el entorno de producción, en concordancia con RNF-14.

## 6. Relación entre requisitos y tecnología

| Requisito | Decisión tecnológica o arquitectónica |
|---|---|
| RF-01, RF-03, RNF-03 | Autenticación y autorización en backend. |
| RF-04 | Interfaz web de tablero y API para datos consolidados. |
| RF-05, RF-09 | Módulos de gestión de ambulancias y personal. |
| RF-12, RF-16, RF-17 | Servicios de negocio para solicitudes, disponibilidad y asignaciones. |
| RF-20, RF-31 | Control del ciclo de vida y cierre del servicio. |
| RF-29, RF-30, RNF-04, RNF-12 | Acceso restringido y protección de datos personales y de atención. |
| RNF-05, RNF-06 | Persistencia relacional, restricciones y transacciones. |
| RNF-08 | Estrategia de copias de seguridad y recuperación. |
| RNF-09 | Separación modular de responsabilidades. |
| RNF-11 | Optimización de consultas y análisis de rendimiento. |
| RNF-13 | Registro de auditoría de operaciones relevantes. |
| RNF-14 | HTTPS y configuración segura en producción. |

## 7. Limitaciones y validación

Los requisitos utilizados provienen de la línea base preliminar de G1-P1. No se afirma que hayan sido validados mediante pruebas con usuarios reales.

La tecnología descrita corresponde a una propuesta de diseño arquitectónico y deberá verificarse con los demás artefactos de P1, especialmente el diagrama de clases, patrones, arquitectura, componentes y despliegue.

La selección tecnológica no representa una implementación funcional comprobada.

## 8. Fuente

Matriz de requisitos y casos de uso - G1-P1 Plan de análisis, SIGMAVITAL/SGA. Se reutilizan los identificadores originales RF y RNF, sin alterar sus definiciones.

---

**Evidencia:** G2-P1 - A1 Requisitos seleccionados y decisión tecnológica.  
**Autoría:** Documento elaborado individualmente como artefacto de diseño, tomando como fuente la línea base de análisis del proyecto.
