# Caracterización de la solución - Sistema Gestor de Ambulancias (SGA)

## 1. Identificación del proyecto

| Aspecto de caracterización exigido por la guía | Caracterización del SGA | Base y estado de la información |
|---|---|---|
| **Tipo de proyecto** | Sistema de información web, multiusuario y modular, orientado a la gestión operativa y administrativa de los servicios de transporte asistencial. Incluye registro de solicitudes, administración de ambulancias TAB/TAM y personal, asignación, seguimiento y reportes. | El documento de especificación del proyecto describe una aplicación web, cliente-servidor y modular. |
| **Tamaño del equipo** | **5 integrantes** en el equipo de desarrollo descrito por la especificación: liderazgo/Scrum Master, dos perfiles backend, un perfil frontend y un perfil QA/Tester. | Conteo de la sección «Personal involucrado» del SRS del proyecto. No se confunde el equipo de desarrollo con los actores usuarios del sistema. |
| **Estabilidad de los requisitos** | **Media / sujeta a refinamiento.** El alcance funcional principal está definido (gestión de ambulancias, solicitudes, asignación, seguimiento y reportes), pero deben detallarse y validarse reglas de asignación, criterios de prioridad, disponibilidad de recursos y diferencias operativas TAB/TAM. | Es una valoración de análisis, no un resultado de medición. Los instrumentos de levantamiento propuestos contemplan entrevistas, encuesta, observación y cuestionario, pero el archivo consultado contiene los instrumentos, no resultados de aplicación. |
| **Disponibilidad del cliente/usuarios clave** | **No acreditada como continua; se planifica disponibilidad periódica y programada.** Los cinco perfiles objetivo están identificados (administrador, coordinador operativo, paramédico TAB, paramédico TAM y analista/directivo), pero las fuentes consultadas no incluyen agenda, entrevistas diligenciadas ni actas que demuestren acceso continuo a un representante institucional. | Supuesto explícito de planificación que debe confirmarse con el instructor o con el representante del caso. No se afirma que se hayan realizado entrevistas u observaciones. |

## 2. Descripción del problema

La gestión de las operaciones de ambulancias puede presentar dificultades cuando se realiza mediante procesos manuales o herramientas fragmentadas. Estas condiciones pueden ocasionar demoras en la asignación de unidades, dificultades para conocer su disponibilidad, errores en la selección del tipo de transporte asistencial, problemas de seguimiento de servicios y limitaciones para consolidar información operativa.

La diferenciación entre ambulancias de Transporte Asistencial Básico (TAB) y Transporte Asistencial Medicalizado (TAM) es relevante porque la unidad asignada debe corresponder a las necesidades y características del servicio.

## 3. Propuesta de solución

El SGA propone centralizar la gestión de solicitudes de servicio, ambulancias, personal operativo, asignaciones, estados operativos, novedades e información de gestión. La solución se plantea como una aplicación web accesible mediante navegadores modernos, con separación de responsabilidades entre presentación, lógica de negocio y persistencia, de acuerdo con la descripción del proyecto.

## 4. Usuarios y responsabilidades preliminares

| Actor | Responsabilidad principal |
|---|---|
| Administrador del sistema | Gestionar usuarios, roles, permisos y datos administrativos de ambulancias y personal. |
| Coordinador operativo | Registrar y gestionar solicitudes, clasificar servicios, consultar disponibilidad y asignar recursos. |
| Paramédico TAB | Consultar asignaciones de transporte asistencial básico, actualizar estados y registrar novedades del servicio. |
| Paramédico TAM | Consultar asignaciones de transporte asistencial medicalizado, actualizar estados y registrar novedades del servicio; documentar la información clínica autorizada. |
| Analista/directivo | Consultar reportes, indicadores e información consolidada para apoyar decisiones. |

Estos actores representan roles funcionales; no deben confundirse con los cinco integrantes del equipo de desarrollo.

## 5. Funcionalidades generales identificadas

- Autenticación y control de acceso por roles.
- Gestión de documentos y protocolos operativos asociados a los servicios, con permisos por rol.
- Gestión de ambulancias TAB y TAM.
- Gestión del personal operativo.
- Registro, consulta y actualización de solicitudes.
- Clasificación de solicitudes y consulta de disponibilidad de recursos.
- Asignación de ambulancia y personal.
- Seguimiento de estados y registro de novedades.
- Consulta de historial, reportes e indicadores operativos.

## 6. Contexto normativo y referencial

El proyecto toma como referentes la Resolución 3100 de 2019 del Ministerio de Salud y Protección Social, el Registro Especial de Prestadores de Servicios de Salud (REPS) y el modelo ISO/IEC 25010 como referencia para atributos de calidad. La interpretación y aplicación concreta de estos referentes debe validarse en el desarrollo del proyecto; esta caracterización no constituye una certificación de cumplimiento normativo.

## 7. Alcance y supuestos del análisis

La evidencia G1-P1 se limita a planear y modelar las funciones centrales de gestión de ambulancias, solicitudes, recursos y servicios. No afirma que el software esté implementado, que los instrumentos de levantamiento hayan sido aplicados ni que los requisitos hayan sido validados formalmente con un cliente real.

La disponibilidad del cliente se trata como un supuesto de planificación: se proponen sesiones periódicas de revisión con el coordinador operativo y representantes de los roles usuarios. Si no se obtiene acceso a dichos representantes, las reglas operativas seguirán marcadas como pendientes de validación.

## 8. Técnicas de levantamiento previstas

La fuente del proyecto dispone de cuatro instrumentos: encuesta, entrevista semiestructurada, observación directa y cuestionario estructurado. En los archivos revisados se encuentran los instrumentos diseñados, no respuestas diligenciadas; por ello se utilizan como mecanismo previsto de levantamiento y no como evidencia de resultados de campo.

## 9. Fuentes documentales del proyecto

- `Proyecto Sistema Gestor de ambulancia Version 2.docx` - descripción, objetivos, alcance y roles del SGA.
- `Instrumentos_SGA_Completos (1) (1).docx` - instrumentos propuestos para el levantamiento de requisitos.
- `SGA_SRS.pdf` - documento de especificación disponible en el repositorio; las secciones 4.1-4.5 incluyen módulos de finanzas/cartera, visitantes, PQRS, unidades/residentes y proveedores que no quedan sustentados claramente por el alcance operativo del proyecto; la sección 4.6 de documentos/protocolos sí se relaciona con los protocolos y soportes de servicios definidos en el SRS. La discrepancia está registrada en la conciliación del SRS para que el equipo/instructor la confirme.

---

**Evidencia:** G1-P1 - Plan de análisis.
**Proyecto:** Sistema Gestor de Ambulancias (SGA).
**Estado:** caracterización preliminar basada en las fuentes documentales disponibles.
