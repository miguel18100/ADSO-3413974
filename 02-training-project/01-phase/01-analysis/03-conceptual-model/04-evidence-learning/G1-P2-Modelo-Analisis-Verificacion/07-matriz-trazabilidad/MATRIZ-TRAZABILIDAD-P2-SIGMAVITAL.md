# MATRIZ-TRAZABILIDAD-P2 – SIGMAVITAL

**Proyecto:** Sistema Gestor de Ambulancias (SGA) – SIGMAVITAL  
**Línea base:** 31 requisitos funcionales RF-01 a RF-31 de G1-P1  
**Alcance:** trazabilidad de diseño; no acredita implementación ni pruebas funcionales.

## 1. Matriz integral de trazabilidad

La columna «Caso de uso / evidencia» identifica el caso de la línea base. Para los tres casos críticos se enlaza además la plantilla extendida y el diagrama de actividad específico. La rúbrica exige pantalla para los casos críticos, por lo que P-01, P-02 y P-03 se identifican expresamente.

| Requisito | Función resumida | Caso de uso / evidencia de análisis | Clases MD-01 | Entidades MER-01 | Pantalla / módulo |
|---|---|---|---|---|---|
| RF-01 | Inicio de sesión de usuarios | CU-01 (línea base G1-P1) | Usuario, Rol | USUARIO, ROL | — |
| RF-02 | Cierre de sesión del usuario autenticado | CU-02 (línea base G1-P1) | Usuario | USUARIO | — |
| RF-03 | Gestión de usuarios según permisos | CU-04 (línea base G1-P1) | Usuario, Rol | USUARIO, ROL | — |
| RF-04 | Tablero operativo por rol | CU-03 (línea base G1-P1) | Usuario, Solicitud, Servicio, Ambulancia, Personal, Asignacion | USUARIO, SOLICITUD, SERVICIO, AMBULANCIA, PERSONAL, ASIGNACION | Dashboard (panel principal) |
| RF-05 | Registro de ambulancias | CU-05 (línea base G1-P1) | Ambulancia | AMBULANCIA | — |
| RF-06 | Actualización de ambulancias | CU-05 (línea base G1-P1) | Ambulancia | AMBULANCIA | — |
| RF-07 | Consulta de ambulancias | CU-05 (línea base G1-P1) | Ambulancia, Asignacion | AMBULANCIA, ASIGNACION | — |
| RF-08 | Gestión del estado operativo de ambulancias | CU-05 (línea base G1-P1) | Ambulancia, Asignacion | AMBULANCIA, ASIGNACION | — |
| RF-09 | Registro de personal operativo | CU-06 (línea base G1-P1) | Personal | PERSONAL | — |
| RF-10 | Actualización de personal operativo | CU-06 (línea base G1-P1) | Personal | PERSONAL | — |
| RF-11 | Consulta de personal operativo | CU-06 (línea base G1-P1) | Personal, AsignacionPersonal | PERSONAL, ASIGNACION_PERSONAL | — |
| RF-12 | Registro de solicitudes de servicio | CU-08 + plantilla + DA-01 | Solicitud, Usuario | SOLICITUD, USUARIO | P-01 – Registro de solicitud |
| RF-13 | Consulta de solicitudes registradas | CU-09 (línea base G1-P1) | Solicitud, Servicio | SOLICITUD, SERVICIO | Solicitudes |
| RF-14 | Actualización de solicitudes | CU-09 (línea base G1-P1) | Solicitud | SOLICITUD | Solicitudes |
| RF-15 | Clasificación de solicitudes | CU-10 (línea base G1-P1) | Solicitud, Servicio | SOLICITUD, SERVICIO | Solicitudes / Servicios |
| RF-16 | Consulta de recursos disponibles | CU-07 (línea base G1-P1) | Ambulancia, Personal, Asignacion, AsignacionPersonal | AMBULANCIA, PERSONAL, ASIGNACION, ASIGNACION_PERSONAL | Ambulancias / Personal |
| RF-17 | Asignación de ambulancia a solicitud | CU-11 + plantilla + DA-02 | Solicitud, Servicio, Asignacion, Ambulancia, Personal | SOLICITUD, SERVICIO, ASIGNACION, AMBULANCIA, PERSONAL | P-02 – Asignación |
| RF-18 | Asociación de personal al servicio | CU-11 + plantilla + DA-02 | Asignacion, AsignacionPersonal, Personal | ASIGNACION, ASIGNACION_PERSONAL, PERSONAL | P-02 – Asignación |
| RF-19 | Consulta de asignaciones | CU-12 (línea base G1-P1) | Asignacion, AsignacionPersonal, Ambulancia, Personal, Servicio | ASIGNACION, ASIGNACION_PERSONAL, AMBULANCIA, PERSONAL, SERVICIO | Asignaciones |
| RF-20 | Actualización del estado de servicio | CU-13 (línea base G1-P1) | Servicio, Asignacion, RegistroCierre | SERVICIO, ASIGNACION, REGISTRO_CIERRE | Servicios / Cierres |
| RF-21 | Registro de novedades del servicio | CU-14 (línea base G1-P1) | Servicio, NovedadOperativa, Usuario | SERVICIO, NOVEDAD_OPERATIVA, USUARIO | Servicios / Novedades |
| RF-22 | Consulta de historial de servicios | CU-15 (línea base G1-P1) | Servicio, Solicitud, Asignacion, RegistroCierre | SERVICIO, SOLICITUD, ASIGNACION, REGISTRO_CIERRE | Servicios / Dashboard |
| RF-23 | Consulta de ambulancias y servicios asociados | CU-05 (línea base G1-P1) | Ambulancia, Asignacion, Servicio | AMBULANCIA, ASIGNACION, SERVICIO | Ambulancias / Servicios |
| RF-24 | Consulta de personal y servicios asociados | CU-06 (línea base G1-P1) | Personal, AsignacionPersonal, Asignacion, Servicio | PERSONAL, ASIGNACION_PERSONAL, ASIGNACION, SERVICIO | Personal / Asignaciones |
| RF-25 | Generación de reportes operativos | CU-16 (línea base G1-P1) | Servicio, Solicitud, Asignacion, Ambulancia, Personal | SERVICIO, SOLICITUD, ASIGNACION, AMBULANCIA, PERSONAL | Dashboard / Servicios (vista de consulta) |
| RF-26 | Filtros de reportes operativos | CU-16 (línea base G1-P1) | Servicio, Solicitud, Asignacion, Ambulancia, Personal | SERVICIO, SOLICITUD, ASIGNACION, AMBULANCIA, PERSONAL | Dashboard / Servicios (criterios de filtro por definir) |
| RF-27 | Consulta de indicadores de gestión | CU-17 (línea base G1-P1) | Servicio, Asignacion, Ambulancia, Personal | SERVICIO, ASIGNACION, AMBULANCIA, PERSONAL | Dashboard (indicadores representativos) |
| RF-28 | Consulta de información consolidada | CU-17 (línea base G1-P1) | Servicio, Solicitud, Asignacion, Ambulancia, Personal, Intervencion | SERVICIO, SOLICITUD, ASIGNACION, AMBULANCIA, PERSONAL, INTERVENCION | Dashboard |
| RF-29 | Datos básicos del paciente | CU-20 (línea base G1-P1) | Paciente, Servicio | PACIENTE, SERVICIO | Pacientes |
| RF-30 | Registro de intervenciones prehospitalarias | CU-21 (línea base G1-P1) | Intervencion, Personal, Servicio, Paciente | INTERVENCION, PERSONAL, SERVICIO, PACIENTE | Intervenciones |
| RF-31 | Cierre de un servicio finalizado | CU-22 + plantilla + DA-03 | Servicio, RegistroCierre, Paciente, Intervencion, Usuario | SERVICIO, REGISTRO_CIERRE, PACIENTE, INTERVENCION, USUARIO | P-03 – Cierre de servicio |

## 2. Resultado de cobertura

| Comprobación | Resultado |
|---|---:|
| Requisitos funcionales de la línea base | 31 |
| Requisitos relacionados con un caso de uso | 31/31 (100 %) |
| Requisitos con clase(s) conceptual(es) identificada(s) | 31/31 (100 % a nivel de diseño) |
| Requisitos con entidad(es) de datos identificada(s) | 31/31 completos (100 %) |
| Requisitos de los casos críticos con pantalla identificada | 4/4 RF de CU-08, CU-11 y CU-22 |

**Resolución RF-21:** se incorporó `NovedadOperativa` / `NOVEDAD_OPERATIVA` como concepto y entidad independiente, relacionada con `SERVICIO` y `USUARIO`. La novedad operativa no se equipara a `INTERVENCION`, que conserva el significado de actuación asistencial. La decisión se deriva del requisito explícito de registrar novedades del servicio; su validación de negocio final se mantiene como una comprobación institucional previa a implementación, no como una prueba ya realizada.

## 3. Trazabilidad de casos críticos

| Caso crítico | Requisitos | Plantilla extendida | Diagrama de actividades | Pantalla del prototipo |
|---|---|---|---|---|
| CU-08 – Registrar solicitud | RF-12 | [CU-08](../01-casos-uso-extendidos/CU-08-Registrar-Solicitud-Servicio.md) | [DA-01](../02-diagramas-actividades/DA-01-Registrar-Solicitud-CU08.md) | P-01 – Solicitudes |
| CU-11 – Asignar ambulancia y personal | RF-17, RF-18 | [CU-11](../01-casos-uso-extendidos/CU-11-Asignar-Ambulancia-Personal.md) | [DA-02](../02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.md) | P-02 – Asignaciones |
| CU-22 – Cerrar servicio | RF-31 | [CU-22](../01-casos-uso-extendidos/CU-22-Cerrar-Servicio.md) | [DA-03](../02-diagramas-actividades/DA-03-Cerrar-Servicio-CU22.md) | P-03 – Cierres |

## 4. Reglas de interpretación

1. Los CU-01 a CU-22 son identificadores de la línea base G1-P1. Que un caso figure en la matriz no significa que todos tengan una plantilla extendida en P2.
2. Los RF-25 a RF-28 son funciones de consulta y agregación. Se trazan a las entidades que aportan sus datos; no se inventa una entidad persistente «Reporte» o «Indicador».
3. Las pantallas del prototipo son representaciones visuales. No acreditan persistencia, integración backend ni ejecución real de los procesos.
4. RF-21 se traza a NOVEDAD_OPERATIVA, SERVICIO y USUARIO; las novedades operativas se diferencian de las intervenciones asistenciales.
5. Las asociaciones entre clases y entidades son propuestas de diseño que requieren validación con el responsable del proceso.

## 5. Referencias

- [Matriz de requisitos y casos de uso G1-P1](../../G1-P1-Plan-Analisis/05-matriz-requisitos-casos-uso/Matriz-Requisitos-Casos-Uso.md)
- [MD-01 – Modelo de dominio](../03-modelo-dominio/MD-01-Modelo-Dominio-SIGMAVITAL.md)
- [MER-01 – Modelo entidad-relación](../04-modelo-entidad-relacion/MER-01-Modelo-Entidad-Relacion-SIGMAVITAL.md)
- [Prototipo SIGMAVITAL](../05-prototipo-ui/01-mockups/SIGMAVITAL-Prototipo-v01.html)

---

**SENA – ADSO – Ficha 3413974**
