# G1-P2 – Modelo de análisis y verificación SIGMAVITAL

**Proyecto:** Sistema Gestor de Ambulancias (SGA) – SIGMAVITAL
**Aprendiz:** Juan Miguel Muñoz Castañeda
**Ficha:** 3413974 – Análisis y Desarrollo de Software (ADSO)
**Actividad:** G1-P2 – Modelado, prototipado y verificación
**Versión:** 1.1 – 27/11/2026

## 1. Objetivo y alcance

Desarrollar y verificar los artefactos de análisis y diseño preliminar de SIGMAVITAL a partir de la línea base de requisitos y casos de uso de G1-P1. Esta carpeta contiene tres casos de uso extendidos, tres diagramas de actividades, modelos de dominio y entidad-relación, prototipo HTML, instrumentos de verificación, trazabilidad e informe de análisis.

El prototipo es académico: utiliza datos ficticios, navegación local y formularios demostrativos. No implementa persistencia, backend ni integración con una base de datos.

## 2. Índice de evidencias

| Artefacto | Archivo |
|---|---|
| CU-08 – Registrar solicitud | [CU-08](01-casos-uso-extendidos/CU-08-Registrar-Solicitud-Servicio.md) |
| CU-11 – Asignar ambulancia y personal | [CU-11](01-casos-uso-extendidos/CU-11-Asignar-Ambulancia-Personal.md) |
| CU-22 – Cerrar servicio | [CU-22](01-casos-uso-extendidos/CU-22-Cerrar-Servicio.md) |
| DA-01 – Actividad de registro | [DA-01](02-diagramas-actividades/DA-01-Registrar-Solicitud-CU08.md) |
| DA-02 – Actividad de asignación | [DA-02](02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.md) |
| DA-03 – Actividad de cierre | [DA-03](02-diagramas-actividades/DA-03-Cerrar-Servicio-CU22.md) |
| MD-01 – Modelo de dominio | [MD-01](03-modelo-dominio/MD-01-Modelo-Dominio-SIGMAVITAL.md) |
| MER-01 – Modelo entidad-relación | [MER-01](04-modelo-entidad-relacion/MER-01-Modelo-Entidad-Relacion-SIGMAVITAL.md) |
| Prototipo HTML | [SIGMAVITAL-Prototipo-v01.html](05-prototipo-ui/01-mockups/SIGMAVITAL-Prototipo-v01.html) |
| Mapa de navegación | [MAPA-NAVEGACION](05-prototipo-ui/02-mapa-navegacion/MAPA-NAVEGACION-SIGMAVITAL.md) |
| Especificación visual y de usabilidad | [ESPECIFICACION-DISENO](05-prototipo-ui/03-especificacion-diseno/ESPECIFICACION-DISENO-SIGMAVITAL.md) |
| Registro de ajustes | [REG-01](05-prototipo-ui/03-especificacion-diseno/REG-01-Registro-Iteracion-Visual.md) |
| Lista de chequeo | [CHECKLIST-01](06-checklist-verificacion/CHECKLIST-01-Verificacion-Evidencias-P2.md) |
| Matriz de trazabilidad | [MATRIZ-TRAZABILIDAD-P2](07-matriz-trazabilidad/MATRIZ-TRAZABILIDAD-P2-SIGMAVITAL.md) |
| Informe de análisis | [INFORME-ANALISIS-P2](08-informe-analisis/INFORME-ANALISIS-P2-SIGMAVITAL.md) |

## 3. Reutilización y ajustes

Se reutilizó como línea base la matriz de requisitos/casos de uso y el diagrama general de G1-P1, además de conceptos de dominio y estructura operativa previamente documentados para SIGMAVITAL. La reutilización se limitó a los insumos identificados; los ajustes de esta carpeta se describen a continuación:

- Se elaboraron/ajustaron las plantillas extendidas CU-08, CU-11 y CU-22.
- Se ajustaron DA-02 y DA-03 con particiones por Coordinador operativo y Sistema SIGMAVITAL, guardas completas y correspondencia con los flujos alternos y de excepción.
- Se completó MD-01 con Rol, asociaciones verbales y multiplicidades.
- Se documentó MER-01 y la participación del personal mediante AsignacionPersonal.
- Se rotularon las pantallas P-01/CU-08, P-02/CU-11 y P-03/CU-22.
- Se completaron la lista de chequeo, la matriz de trazabilidad, el registro de seis hallazgos y el informe de análisis.

## 4. Autoría y control de cambios

La reutilización de insumos de G1-P1 se declara expresamente. La selección de los tres casos críticos, la adaptación de plantillas, el ajuste de diagramas, la matriz P2, el checklist, el informe y el registro de ajustes corresponden a la revisión individual de esta evidencia. El historial del repositorio es el mecanismo para contrastar fechas y cambios; este README no sustituye el historial Git ni la sustentación del aprendiz.

## 5. Declaración de uso de inteligencia artificial

Se utilizó inteligencia artificial como apoyo para revisar consistencia documental, proponer mejoras de redacción y estructurar listas de verificación y trazabilidad. El aprendiz debe revisar, comprender y poder sustentar cada decisión y artefacto. La herramienta no sustituye la validación del instructor, los usuarios ni las pruebas de implementación.

## 6. Estado y limitaciones

La revisión efectuada es documental. No se declara validación formal con usuarios, prueba de accesibilidad, aprobación de stakeholders ni persistencia de datos. La matriz reporta 30 de 31 requisitos con cobertura directa a entidades (96,8 %); RF-21 queda parcial mientras se confirma si requiere una entidad independiente de novedades. Las cardinalidades siguen siendo propuestas de análisis pendientes de confirmación.

---

**SENA – ADSO – Ficha 3413974**
