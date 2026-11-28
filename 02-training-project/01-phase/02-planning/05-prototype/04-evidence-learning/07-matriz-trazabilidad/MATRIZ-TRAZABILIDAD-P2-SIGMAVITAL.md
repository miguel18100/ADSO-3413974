# MATRIZ DE TRAZABILIDAD P2 – SIGMAVITAL

**Proyecto:** SIGMAVITAL – Sistema de Gestión de Ambulancias  
**Ficha:** 3413974 – Análisis y Desarrollo de Software (ADSO)  
**Fase:** Planeación – Diseño y prototipo  
**Artefacto:** Matriz complementaria de trazabilidad P2  
**Estado:** Consolidación documental preliminar  

---

## 1. Objetivo

Consolidar la relación entre los requisitos funcionales de la línea base G1-P1 y los artefactos de diseño elaborados durante P2, incluyendo casos de uso, diagramas de actividad, modelo de dominio, modelo entidad-relación y prototipo de interfaz.

Esta matriz complementa la trazabilidad arquitectónica A7. No sustituye la matriz de requisitos original ni constituye evidencia de implementación o pruebas funcionales.

## 2. Fuentes de trazabilidad

- Matriz de requisitos y casos de uso G1-P1.
- A1 – Requisitos y decisiones tecnológicas.
- A2 – Trazabilidad de clases y requisitos.
- A7 – Matriz de trazabilidad arquitectónica.
- Casos de uso extendidos CU-08, CU-11 y CU-22.
- Diagramas de actividad DA-01, DA-02 y DA-03.
- MD-01 – Modelo de dominio SIGMAVITAL.
- MER-01 – Modelo entidad-relación SIGMAVITAL.
- Prototipo UI SIGMAVITAL v01.
- Mapa de navegación.
- Especificación de diseño.
- Checklist de verificación P2.

## 3. Matriz de trazabilidad de requisitos funcionales

| Requisito | Caso de uso G1-P1 | Evidencia detallada identificada | Diagrama de actividad | Modelo de datos | Prototipo UI | Estado documental |
|---|---|---|---|---|---|---|
| RF-01 | CU-01 | Autenticación | No identificado en evidencias detalladas actuales | MD-01 / MER-01: revisión específica pendiente | Prototipo v01: correspondencia específica pendiente | Pendiente de trazabilidad específica |
| RF-02 | CU-02 | Cerrar sesión | No identificado en evidencias detalladas actuales | MD-01 / MER-01: revisión específica pendiente | Prototipo v01: correspondencia específica pendiente | Pendiente de trazabilidad específica |
| RF-03 | CU-04 | Usuarios, roles y permisos | No identificado en evidencias detalladas actuales | MD-01 / MER-01: revisión específica pendiente | Prototipo v01: correspondencia específica pendiente | Pendiente de trazabilidad específica |
| RF-04 | CU-03 | Tablero operativo | No identificado en evidencias detalladas actuales | Usuario y entidades operativas del modelo; dashboard no representado como entidad | Dashboard: panel principal y resumen operativo | Pendiente de trazabilidad específica |
| RF-05 | CU-05 | Gestión de ambulancias | No identificado en evidencias detalladas actuales | AMBULANCIA en MER-01 | Ambulancias: listado y estados | Pendiente de trazabilidad específica |
| RF-06 | CU-05 | Gestión de ambulancias | No identificado en evidencias detalladas actuales | AMBULANCIA en MER-01 | Ambulancias: listado y estados | Pendiente de trazabilidad específica |
| RF-07 | CU-05 | Gestión de ambulancias | No identificado en evidencias detalladas actuales | AMBULANCIA en MER-01 | Ambulancias: listado y estados | Pendiente de trazabilidad específica |
| RF-08 | CU-05 | Gestión de ambulancias | No identificado en evidencias detalladas actuales | AMBULANCIA en MER-01 | Ambulancias: listado y estados | Pendiente de trazabilidad específica |
| RF-09 | CU-06 | Gestión de personal | No identificado en evidencias detalladas actuales | PERSONAL en MER-01 | Personal: listado de personal operativo | Pendiente de trazabilidad específica |
| RF-10 | CU-06 | Gestión de personal | No identificado en evidencias detalladas actuales | PERSONAL en MER-01 | Personal: listado de personal operativo | Pendiente de trazabilidad específica |
| RF-11 | CU-06 | Gestión de personal | No identificado en evidencias detalladas actuales | PERSONAL en MER-01 | Personal: listado de personal operativo | Pendiente de trazabilidad específica |
| RF-12 | CU-08 | CU-08 detallado; DA-01 | CU-08 detallado; DA-01 | SOLICITUD y USUARIO en MER-01; Solicitud en MD-01 | Solicitudes: formulario de registro (CU-08) | Evidencia detallada disponible |
| RF-13 | CU-09 | Gestión de solicitudes | No identificado en evidencias detalladas actuales | SOLICITUD: estado y datos de solicitud | Solicitudes: módulo de registro y gestión representado | Pendiente de trazabilidad específica |
| RF-14 | CU-09 | Gestión de solicitudes | No identificado en evidencias detalladas actuales | SOLICITUD: estado y datos de solicitud | Solicitudes: módulo de registro y gestión representado | Pendiente de trazabilidad específica |
| RF-15 | CU-10 | Clasificación de solicitudes | No identificado en evidencias detalladas actuales | SOLICITUD: atributo prioridad | Solicitudes: opciones de tipo; clasificación específica por validar | Pendiente de trazabilidad específica |
| RF-16 | CU-07 | Disponibilidad de recursos | No identificado en evidencias detalladas actuales | AMBULANCIA y PERSONAL: estados operativos; disponibilidad independiente solo en MD-01 | Ambulancias, Personal y Asignaciones: disponibilidad representada | Pendiente de trazabilidad específica |
| RF-17 | CU-11 | CU-11 detallado; DA-02 | CU-11 detallado; DA-02 | ASIGNACION, AMBULANCIA y ASIGNACION_PERSONAL | Asignaciones: selección de servicio, ambulancia y personal (CU-11) | Evidencia detallada disponible |
| RF-18 | CU-11 | CU-11 detallado; DA-02 | CU-11 detallado; DA-02 | ASIGNACION y ASIGNACION_PERSONAL | Asignaciones: selección de servicio, ambulancia y personal (CU-11) | Evidencia detallada disponible |
| RF-19 | CU-12 | Consulta de asignaciones | No identificado en evidencias detalladas actuales | ASIGNACION y SERVICIO; consulta específica pendiente | Asignaciones: representación general; consulta específica por validar | Pendiente de trazabilidad específica |
| RF-20 | CU-13 | Actualización de estado | No identificado en evidencias detalladas actuales | SERVICIO: estado y datos operativos | Servicios: listado y estados representados | Pendiente de trazabilidad específica |
| RF-21 | CU-14 | Novedades operativas | No identificado en evidencias detalladas actuales | Novedad operativa: entidad específica no identificada en MD-01 / MER-01 | Prototipo v01: correspondencia específica pendiente | Pendiente de trazabilidad específica |
| RF-22 | CU-15 | Historial de servicios | No identificado en evidencias detalladas actuales | SERVICIO: historial específico pendiente de definición | Servicios y Dashboard: servicios recientes; historial específico por validar | Pendiente de trazabilidad específica |
| RF-23 | CU-05 | Información de ambulancias | No identificado en evidencias detalladas actuales | AMBULANCIA en MER-01 | Ambulancias: información y estado en listado | Pendiente de trazabilidad específica |
| RF-24 | CU-06 | Información de personal | No identificado en evidencias detalladas actuales | PERSONAL en MER-01 | Personal: información y estado en listado | Pendiente de trazabilidad específica |
| RF-25 | CU-16 | Reportes operativos | No identificado en evidencias detalladas actuales | MD-01 / MER-01: revisión específica pendiente | Prototipo v01: correspondencia específica pendiente | Pendiente de trazabilidad específica |
| RF-26 | CU-16 | Reportes operativos | No identificado en evidencias detalladas actuales | MD-01 / MER-01: revisión específica pendiente | Prototipo v01: correspondencia específica pendiente | Pendiente de trazabilidad específica |
| RF-27 | CU-17 | Indicadores de gestión | No identificado en evidencias detalladas actuales | MD-01 / MER-01: revisión específica pendiente | Prototipo v01: correspondencia específica pendiente | Pendiente de trazabilidad específica |
| RF-28 | CU-17 | Indicadores de gestión | No identificado en evidencias detalladas actuales | MD-01 / MER-01: revisión específica pendiente | Prototipo v01: correspondencia específica pendiente | Pendiente de trazabilidad específica |
| RF-29 | CU-20 | Datos básicos del paciente | No identificado en evidencias detalladas actuales | PACIENTE en MER-01 y MD-01; asociación con SERVICIO pendiente de validar | Pacientes: listado y representación de registro | Relación conceptual por validar |
| RF-30 | CU-21 | Intervenciones prehospitalarias TAM | No identificado en evidencias detalladas actuales | INTERVENCION en MER-01 y MD-01 | Intervenciones: formulario representativo | Relación conceptual por validar |
| RF-31 | CU-22 | CU-22 detallado; DA-03 | CU-22 detallado; DA-03 | SERVICIO y REGISTRO_CIERRE en MER-01 | Cierres: formulario de cierre de servicio (CU-22) | Evidencia detallada disponible |
## 4. Evidencias detalladas actualmente identificadas

| Artefacto | Requisitos / caso asociado | Estado |
|---|---|---|
| CU-08 – Registrar solicitud de servicio | RF-12 / CU-08 | Documento elaborado |
| DA-01 – Registrar solicitud CU08 | RF-12 / CU-08 | Documento elaborado |
| CU-11 – Asignar ambulancia y personal | RF-17, RF-18 / CU-11 | Documento elaborado |
| DA-02 – Asignar ambulancia CU11 | RF-17, RF-18 / CU-11 | Documento elaborado |
| CU-22 – Cerrar servicio | RF-31 / CU-22 | Documento elaborado |
| DA-03 – Cerrar servicio CU22 | RF-31 / CU-22 | Documento elaborado |
| MD-01 – Modelo de dominio | Modelo conceptual general | Documento elaborado |
| MER-01 – Modelo entidad-relación | Modelo de datos general | Documento elaborado |
| Prototipo UI v01 | Interfaz visual general | Artefacto existente; mapeo específico pendiente |
| Mapa de navegación | Navegación del prototipo | Artefacto existente; verificación pendiente |
| Especificación de diseño | Criterios visuales y de usabilidad | Documento elaborado |
| Checklist P2 | Verificación documental | Seguimiento pendiente |

## 5. Interpretación de los estados

- **Documentado:** existe un artefacto detallado identificable que representa directamente el caso o requisito señalado.
- **Pendiente:** aún no se ha identificado una evidencia detallada específica para esa relación dentro del conjunto revisado.
- **Pendiente de trazabilidad específica:** existe una relación de línea base, pero falta documentar y verificar la correspondencia concreta con artefactos P2.
- **Relación conceptual por validar:** el modelo puede representar conceptos asociados, pero la correspondencia específica debe verificarse antes de declararla trazada.

## 6. Limitaciones

1. La matriz de G1-P1 relaciona los 31 requisitos funcionales consolidados con los casos de uso CU-01 a CU-22.
2. La existencia de un caso de uso en la línea base no implica que exista un caso de uso extendido o diagrama de actividad desarrollado.
3. Los diagramas DA-01, DA-02 y DA-03 se relacionan directamente con CU-08, CU-11 y CU-22, respectivamente.
4. La existencia del MD-01 y MER-01 no implica que cada requisito funcional haya sido validado individualmente contra dichos modelos.
5. El prototipo UI es una representación de diseño; no acredita implementación funcional.
6. Las relaciones específicas entre requisito, pantalla, modelo y navegación requieren revisión y verificación.
7. Esta matriz no afirma cobertura de pruebas, implementación ni validación con usuarios.

## 7. Actividades de verificación pendientes

- Revisar la correspondencia individual entre RF y MD-01.
- Revisar la correspondencia individual entre RF y MER-01.
- Identificar pantallas y elementos específicos del prototipo para cada RF representado.
- Verificar las rutas de navegación relacionadas con los casos de uso.
- Completar los casos de uso extendidos prioritarios restantes.
- Completar diagramas de actividad adicionales según priorización.
- Validar las correspondencias con la línea base G1-P1 y A7.
- Incorporar observaciones del equipo y del instructor.
- Actualizar estados conforme se obtenga evidencia verificable.

## 8. Conclusión preliminar

Se consolidó una estructura complementaria de trazabilidad entre los requisitos funcionales de G1-P1 y los artefactos de diseño identificados en P2. Se cuenta con evidencia detallada para CU-08, CU-11 y CU-22, acompañada de sus diagramas de actividad DA-01, DA-02 y DA-03.

Los modelos MD-01 y MER-01, así como el prototipo UI y su documentación complementaria, constituyen artefactos disponibles para continuar la verificación individual de correspondencias. La cobertura restante deberá completarse mediante revisión documental y validación, sin atribuir resultados que aún no hayan sido comprobados.

---

**Documento de seguimiento:** esta matriz debe actualizarse cuando se incorporen nuevas evidencias y verificaciones.

