# CHECKLIST-01 – Verificación de evidencias G1-P2 SIGMAVITAL

**Proyecto:** SIGMAVITAL – Sistema Gestor de Ambulancias (SGA)
**Ficha:** 3413974 – ADSO
**Producto:** G1-P2 – Modelo de análisis y verificación
**Versión:** 1.1 – 27/11/2026
**Alcance:** revisión documental de archivos del repositorio; no equivale a prueba con usuarios ni aprobación del instructor.

## 1. Escala y criterio de diligenciamiento

- **Sí:** el criterio puede comprobarse en el archivo citado.
- **No:** el criterio no está acreditado por la evidencia disponible.
- Cada fila tiene un criterio binario, archivo de evidencia y observación verificable.
- Los criterios C-13 a C-16 son de cobertura o trazabilidad.

## 2. Lista de chequeo diligenciada

| ID | Criterio verificable | Respuesta (Sí/No) | Evidencia | Resultado / observación |
|---|---|---|---|---|
| C-01 | Existen al menos tres plantillas extendidas de casos de uso. | Sí | `01-casos-uso-extendidos/CU-08`, `CU-11`, `CU-22` | Se identifican tres archivos independientes. |
| C-02 | Cada plantilla contiene precondiciones, flujo principal de seis o más pasos y postcondiciones. | Sí | CU-08, CU-11 y CU-22 | Los tres documentos contienen los apartados exigidos. |
| C-03 | CU-11 documenta al menos un flujo alternativo y una excepción. | Sí | `01-casos-uso-extendidos/CU-11-Asignar-Ambulancia-Personal.md` | A1/A2 y E1 se relacionan con las ramas de DA-02. |
| C-04 | CU-22 documenta información incompleta, cancelación y error de guardado. | Sí | `01-casos-uso-extendidos/CU-22-Cerrar-Servicio.md` | Los flujos A1, A2 y E1 cubren esos resultados. |
| C-05 | DA-02 tiene inicio, fin y particiones explícitas para actor y sistema. | Sí | `02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.puml` y `.svg` | Se identifican las calles Coordinador operativo y Sistema SIGMAVITAL. |
| C-06 | DA-02 etiqueta las salidas de cada decisión con guardas entre corchetes. | Sí | DA-02 `.puml` / `.svg` | Las ramas se distinguen con `[sí]` y `[no]`; se documentan reintento y falta de recursos. |
| C-07 | DA-03 tiene inicio, fin y particiones explícitas para actor y sistema. | Sí | `02-diagramas-actividades/DA-03-Cerrar-Servicio-CU22.puml` y `.svg` | Se identifican las dos calles requeridas. |
| C-08 | DA-03 contempla información incompleta, cancelación y error de guardado. | Sí | DA-03 `.puml` / `.svg`; CU-22 | Las tres rutas están representadas y enlazadas con CU-22. |
| C-09 | Los casos alternos y de excepción de CU-11/CU-22 tienen correspondencia en sus diagramas. | Sí | CU-11, CU-22, DA-02 y DA-03 | Correspondencia documentada en cada diagrama. |
| C-10 | MD-01 contiene al menos ocho clases conceptuales sin métodos. | Sí | `03-modelo-dominio/MD-01-Modelo-Dominio-SIGMAVITAL.md` | Se documentan once clases con atributos de negocio. |
| C-11 | MD-01 contiene asociaciones con verbos y multiplicidades. | Sí | MD-01, sección 5 y diagrama | Cada asociación declara rol, verbo y multiplicidad mínima/máxima. |
| C-12 | MER-01 contiene al menos seis entidades identificadas y una relación N:M resuelta. | Sí | `04-modelo-entidad-relacion/MER-01-Modelo-Entidad-Relacion-SIGMAVITAL.md` | ASIGNACION_PERSONAL resuelve la relación entre asignación y personal. |
| C-13 | RF-01 a RF-31 tienen identificador de caso de uso en la matriz P2. | Sí | `07-matriz-trazabilidad/MATRIZ-TRAZABILIDAD-P2-SIGMAVITAL.md` | 31/31 RF tienen referencia a CU de la línea base. |
| C-14 | RF-01 a RF-31 están relacionados con al menos una clase del modelo de dominio. | Sí | Matriz P2, columna “Clases MD-01” | 31/31 RF tienen una o más clases asignadas a nivel de diseño. |
| C-15 | Al menos 90 % de RF tiene relación directa con entidades del MER. | Sí | Matriz P2, sección 2 | 30/31 RF completos (96,8 %); RF-21 queda explícitamente parcial. |
| C-16 | Los casos críticos CU-08, CU-11 y CU-22 tienen pantalla identificada. | Sí | Matriz P2 y prototipo HTML | P-01, P-02 y P-03; corresponden a RF-12, RF-17/RF-18 y RF-31. |
| C-17 | El prototipo rotula visiblemente P-01 con CU-08 y RF-12. | Sí | `05-prototipo-ui/01-mockups/SIGMAVITAL-Prototipo-v01.html` | Etiqueta incorporada en la pantalla de solicitudes. |
| C-18 | El prototipo rotula visiblemente P-02 con CU-11 y RF-17/RF-18. | Sí | Prototipo HTML | Etiqueta incorporada en la pantalla de asignaciones. |
| C-19 | El prototipo rotula visiblemente P-03 con CU-22 y RF-31. | Sí | Prototipo HTML | Etiqueta incorporada en la pantalla de cierres. |
| C-20 | Existe informe de 1–2 páginas con requisitos, enlaces a modelos, resultados y ajustes. | Sí | `08-informe-analisis/INFORME-ANALISIS-P2-SIGMAVITAL.md` | El informe resume las evidencias y declara las limitaciones pendientes. |
| C-21 | Existe registro de al menos cinco hallazgos con antes/después y segunda verificación. | Sí | `05-prototipo-ui/03-especificacion-diseno/REG-01-Registro-Iteracion-Visual.md` | Se documentan seis hallazgos y su comprobación posterior. |
| C-22 | README identifica reutilización, modificaciones, enlaces y uso de IA. | Sí | `README.md` de G1-P2 | El README actualizado sirve de índice y declara alcance/autoría. |
| C-23 | Se ejecutó una prueba formal de usabilidad con usuarios y se adjuntó acta. | No | No se encontró acta ni protocolo diligenciado | Pendiente; no es válido inferir aprobación de usuarios desde el HTML. |
| C-24 | Se ejecutó una prueba formal de accesibilidad y se adjuntó resultado. | No | No se encontró informe o evidencia de prueba | Pendiente; el prototipo no acredita conformidad de accesibilidad. |

## 3. Resumen de verificación

- **Criterios verificados Sí:** 22.
- **Criterios verificados No:** 2.
- **Criterios totales:** 24.
- **Criterios de cobertura/trazabilidad:** C-13, C-14, C-15 y C-16.
- **Cobertura de RF:** 31/31 a caso de uso y clase conceptual; 30/31 (96,8 %) a entidad del MER; RF-21 permanece parcial.

Los dos resultados “No” corresponden a validaciones formales con usuarios y accesibilidad que no están acreditadas en el repositorio y no se presentan como realizadas. No sustituyen los mínimos documentales de la rúbrica.

## 4. Limitaciones de la revisión

La lista se diligenció por inspección de los archivos del repositorio. No representa una prueba de ejecución de los formularios ni de persistencia. Los datos del prototipo son ficticios, los mensajes son demostrativos y no existe integración backend. Las cardinalidades y reglas operativas deben confirmarse con el instructor o los responsables del proceso.

---

**SENA – ADSO – Ficha 3413974**
